---
description: Configure NSO to receive SNMP notifications.
---

# SNMP Notification Receiver

NSO can act as an SNMP notification receiver (v1, v2c, v3) for its managed devices. The application can register notification handlers and react to the notifications, for example by mapping SNMP notifications to NSO alarms.

The notification receiver is started in the Java VM by application code, as described below. The application code registers the handlers, which are invoked when a notification is received from a managed device. The NSO operator can enable and disable the notification receiver as needed. The notification receiver is configured in the `/snmp-notification-receiver` subtree.

By default, nothing happens with SNMP Notifications. You need to register a function to listen to traps and do something useful with the traps. First of all, SNMP var-binds are typically sparse in information and in many cases, you want to do enrichment of the information and map the notification to some meaningful state. Sometimes a notification indicates an alarm state change, sometimes it indicates that the configuration of the device has changed. The action based on the two above examples is very different; in the first case, you want to interpret the notification for meaningful alarm information and submit a call to the NSO Alarm Manager. In the second case, you probably want to initiate a `check-sync, compare-config, sync action` sequence.

## Configuring NSO to Receive SNMP Notifications <a href="#d5e8771" id="d5e8771"></a>

The NSO operator must enable the SNMP notification receiver, and configure the addresses NSO will use to listen for notifications. The primary parameters for the Notification receiver are shown below.

```
+--rw snmp-notification-receiver
  +--rw enabled?      boolean
  +--rw listen
  |  +--rw udp [ip port]
  |     +--rw ip      inet:ip-address
  |     +--rw port    inet:port-number
  +--rw engine-id?    snmp-engine-id
```

The notification reception can be turned on and off using the enabled lead. NSO will listen to notifications at the end-points configured in `listen`. There is no need to manually configure the NSO `engine-id`. NSO will do this automatically using the algorithm described in RFC 3411. However, it can be assigned an `engine-id` manually by setting this leaf.

The managed devices must also be configured to send notifications to the NSO addresses.

NSO silently ignores any notification received from unknown devices. By default, NSO uses the `/devices/device/address` leaf, but this can be overridden by setting `/devices/device/snmp-notification-address`.

```
+--rw device [name]
  |  +--rw name                             string
  |  +--rw address                          inet:host
  |  +--rw snmp-notification-address?       inet:host
```

## Built-in Filters <a href="#d5e8786" id="d5e8786"></a>

There are some standard built-in filters for the SNMP notification receiver that perform standard tasks:

* Standard filter for suppression of received SNMP events that are not of type `TRAP`, `NOTIFICATION`, or `INFORM`.
* Standard filter for suppression of notifications emanating from IP addresses outside the defined set of addresses. This filter determines the source IP address first from the `snmpTrapAddress` 1.3.6.1.6.3.18.1.3 varbind if this is set in the PDU, or otherwise from the emanating peer IP address. If the resulting IP address does not match either the `snmp-notification-address` or the `address` leaf of any device in the device model, this notification is discarded.
* Standard filter that will acknowledge INFORM notification automatically.

## Notification Handlers <a href="#d5e8794" id="d5e8794"></a>

NSO uses the Java package SNMP4J to parse the SNMP PDUs.

Notification Handlers are user-supplied Java classes that implement the `com.tailf.snmp.snmp4j.NotificationHandler` interface. The `processPDU` method is expected to react on the SNMP4J event, e.g. by mapping the PDU to an NSO alarm. The handlers are registered in the `NotificationReceiver`. The `NotificationReceiver` is the main class that in addition to maintaining the handlers also has the responsibility to read the NSO SNMP notification configuration, and set up `SNMP4J` listeners accordingly.

An example of a notification handler can be found at [examples.ncs/device-management/snmp-notification-receiver](https://github.com/NSO-developer/nso-examples/tree/6.4/device-management/snmp-notification-receiver). This example handler receives notifications and sets an alarm text if the notification is an `IF-MIB::linkDown trap`.

```java
public class ExampleHandler implements NotificationHandler {

    private static Logger LOGGER = LogManager.getLogger(ExampleHandler.class);

    /**
     * This callback method is called when a notification is received from
     * Snmp4j.
     *
     * @param event
     *            a CommandResponderEvent, see Snmp4j javadoc for details
     * @param opaque
     *            any object passed in register()
     */
    public HandlerResponse
        processPdu(EventContext context,
                   CommandResponderEvent event,
                   Object opaque)
    throws Exception {

        String alarmText = "test alarm";

        PDU pdu = event.getPDU();
        for (int i = 0; i < pdu.size(); i++) {
            VariableBinding vb = pdu.get(i);
            LOGGER.info(vb.toString());

            if (vb.getOid().toString().equals("1.3.6.1.6.3.1.1.4.1.0")) {
                String linkStatus = vb.getVariable().toString();
                if ("1.3.6.1.6.3.1.1.5.3".equals(linkStatus)) {
                    alarmText = "IF-MIB::linkDown";
                }
            }
        }

        String device = context.getDeviceName();
        String managedObject = "/devices/device{"+device+"}";
        ConfIdentityRef alarmType =
            new ConfIdentityRef(new NcsAlarms().hash(),
                                NcsAlarms._connection_failure);
        PerceivedSeverity severity = PerceivedSeverity.MAJOR;
        ConfDatetime timeStamp = ConfDatetime.getConfDatetime();

        Alarm al = new Alarm(new ManagedDevice(device),
                             new ManagedObject(managedObject),
                             alarmType,
                             severity,
                             false,
                              alarmText,
                              null,
                              null,
                              null,
                              timeStamp);

        AlarmSink sink = new AlarmSink();
        sink.submitAlarm(al);

        return HandlerResponse.CONTINUE;
    }
}
```

The instantiation and start of the `NotificationReceiver` as well as registration of notification handlers are all expected to be done in the same application component of some NSO package. The following is an example of such an application component:

```java
/**
 * This class starts the Snmp-notification-receiver.
 */
public class App implements ApplicationComponent {

    private ExampleHandler handl = null;
    private NotificationReceiver notifRec = null;

    public void run() {
        try {
            notifRec.start();
            synchronized (notifRec) {
                notifRec.wait();
            }
        } catch (Exception e) {
            NcsMain.reportPackageException(this, e);
        }
    }

    public void finish() throws Exception {
        if (notifRec == null) {
            return;
        }
        synchronized (notifRec) {
            notifRec.notifyAll();
        }
        notifRec.stop();
        NotificationReceiver.destroyNotificationReceiver();
    }

    public void init() throws Exception {
        handl = new ExampleHandler();
        notifRec =
            NotificationReceiver.getNotificationReceiver();
        // register example filter
        notifRec.register(handl, null);
    }
}
```
