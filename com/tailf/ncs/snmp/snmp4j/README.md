# com.tailf.ncs.snmp.snmp4j

NCS snmp4j support package

 This package contains classes provided to support the
 use of snmp4j in NCS.

 For the moment this support consists of a SNMP notification
 receiver that uses snmp4j to listen for notifications.


 The benefit of using these classes is that the configuration of
 snmp4j is contained in the NCS configuration.
 The user provides handlers (or callbacks) that processes the
 notifications e.g. maps these to NCS alarms that are
 delivered to the NCS Alarm API

  * 
 Example:
  The expected usage of the NotificationReceiver and the, by the user,
  provided NotificationHandlers are in the main() method of the service
  manager:



```
 public class App {

     ....

     public static void main(String[] args) {

         ....


         // setting up AlarmManager and Snmp Notification receiver
         try {
             // We set up the AlarmSinkCentral to enable asynch
             // alarm provision to NCS.
             SocketAddress address = UnixDomainSocketAddress.of(
                      Conf.NCS_PATH);
             Maapi maapi = new Maapi(address);
             AlarmSinkCentral sinkCentral
                     = new AlarmSinkCentral(100000, maapi);
             // start sinkCental if not already running
             if (!sinkCentral.isAlive()) {
                 sinkCentral.start();
             }

             // Register snmp NotificationHandlers
             // and start the NotificationReceiver
             ExampleHandler handl = new ExampleHandler();
             NotificationReceiver notifRec =
                 NotificationReceiver.getNotificationReceiver(address)
             // register example handler
             notifRec.register(handl, null);
             // example of an anonymous handler
             notifRec.register(new NotificationHandler() {
                 public HandlerResponse
                     processPdu(CommandResponderEvent event, Object opaque)
                         throws Exception {
                             System.out.println("\n\n" +
                                 "------Anonymous Filter called" +
                                 "\n\n");
                             return HandlerResponse.CONTINUE;
                 }
             }, null);

             // start the NotificationReceiver
             notifRec.start();
         } catch (Exception e) {
             e.printStackTrace();
         }

         ....
     }

     ....
 }
```

## Types

- [CommandResponderImpl](CommandResponderImpl.md#commandresponderimpl-14374724c6fc)
- [EventContext](EventContext.md#eventcontext-9f1cd876683b)
- [EventContextImpl](EventContextImpl.md#eventcontextimpl-b15973d3b2cd)
- [FilterAckInforms](FilterAckInforms.md#filterackinforms-cd47a176f4bd)
- [FilterKnownIPAddresses](FilterKnownIPAddresses.md#filterknownipaddresses-693e71797e53)
- [FilterOutNonNotifications](FilterOutNonNotifications.md#filteroutnonnotifications-f53d7df96e64)
- [HandlerResponse](HandlerResponse.md#handlerresponse-651c4aa97197)
- [NotifHandlerInstance](NotifHandlerInstance.md#notifhandlerinstance-7fa13bf44d0b)
- [NotificationHandler](NotificationHandler.md#notificationhandler-49960afdd747)
- [NotificationReceiver](NotificationReceiver.md#notificationreceiver-fd29973ce750)
