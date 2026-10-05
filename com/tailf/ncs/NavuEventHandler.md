<a id="s-NavuEventHandler"></a>
# NavuEventHandler

```java
public class com.tailf.ncs.NavuEventHandler
    implements Runnable
```

This class represents the a running daemon where it provides the means
 for user callback to react on NCS CDB notification that arrives
 asynchronously from a device.

 The NCS device manager has built-in support for device notifications.
 Notifications are a means for the managed devices to send structured data
 asynchronously to the manager. NCS has native support for NETCONF event
 notifications (see RFC 5277) but can also receive notifications
 from other protocols implemented by the Network Element Drivers.

 The basic mode of operation is that the manager subscribes to one or
 more named notification channels that are announced by the managed device.

 A user needs to setup a subscription to a named notification
 channel announced by the managed device. This is done for example with
 the CLI:




```
   configure
  % set device device "device-name" notifications subscription \
     "if" stream "interface"
```




 Where `"if"` is the unique name of a subscription and
 the `interface` is the announced stream name by the
 managed device.

 When the managed device sends notifications northbound the
 notifications arrives at the path:
 /ncs:devices/device{device-name}/notifications
  /received-notifications/notification{event-time sequence-no}
 where the `device-name` is the managed device that sent the
 notification and `event-time` the time when the specific
 notification was generated at the device.

 A `NavuEventHandler` make use of a `CdbSubscriber`
 which subscribe to the notification table at

 /ncs:devices/device/notifications/received-notifications
 /notification.

 To be able to react on the received notifications we need to start
 a instance of `NavuEventHandler` after a user has
 registered the reacting callback.



```
 NavuEventHandler neh = new NavuEventHandler(s);

 MyEventCB mycb = new MyEventCB();
 neh.registerInterfaceCallback(deviceName, subscriptionName,
  new NavuEventCallback () {
         public void notifReceieved ( NavuContainer event )
                     throws NcsException {
                ..
           }

     });


   neh.start();
```




 A user provided implementation of a [`NavuEventCallback`](NavuEventCallback.md#s-NavuEventCallback) is
 registered with the
 [`NavuEventCallback`](NavuEventCallback.md#s-NavuEventCallback)
 method. Optionally a plain java pojo could be annotated
 with the annotation [`EventCallback`](annotations/EventCallback.md#s-EventCallback) and
 registered the annotated instance with
 `#registerAnnotatedCallbacks(Object)`.

 When registering a reacting callback user needs to provide the
 device name and the stream name in either the explicitly
 `registerInterfaceCallback` method or
 through the annotated java pojo. If the callback needs to received
 notifications from all the device and to all the streams annotated
 an asterisk could be supplied ( or annotated ) as the parameter
 to the registered methods.

 As soon as the notifications arrives the user implementation of the
 `NavuEventCallback`
 [`NavuEventCallback`](NavuEventCallback.md#s-NavuEventCallback) is invoked
 by the NavuEventHandler for the device and stream the callback
 is interested in.

 The NavuContainer represents the list entries:

 /ncs:devices/device{device-name}/notifications
   /received-notifications/notification{event-time sequence-no}.

## Members

**Constructors**:

- [NavuEventHandler(SocketAddress, String)](#s-NavuEventHandler-1)
- [NavuEventHandler(String, int, String)](#s-NavuEventHandler-2)

**Fields**:

- [NOTIFICATION_EVENT_PATH](#s-NOTIFICATION_EVENT_PATH)

**Methods**:

- [awaitStopped()](#s-awaitStopped)
- [getCallbacks(String, String)](#s-getCallbacks)
- [invokeNavuEventCallbacks(String, String, NavuNode)](#s-invokeNavuEventCallbacks)
- [isRunning()](#s-isRunning)
- [isStopped()](#s-isStopped)
- [main(String[])](#s-main)
- [registerAnnotatedCallbacks(Object)](#s-registerAnnotatedCallbacks)
- [registerInterfaceCallback(String, String, NavuEventCallback)](#s-registerInterfaceCallback)
- [run()](#s-run)
- [start()](#s-start)
- [stop()](#s-stop)

**Nested Types**:

- [EventIterator](NavuEventHandler/EventIterator.md#s-EventIterator)
- [InternalEventCB](NavuEventHandler/InternalEventCB.md#s-InternalEventCB)

## Constructors

<a id="s-NavuEventHandler-1"></a>
### NavuEventHandler(SocketAddress, String)

```java
public NavuEventHandler(
    java.net.SocketAddress address,
    String notifSubscriberName
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Create an instance of the NavuEventHandler with a
 SocketAddress with the address to NCS

**Parameters**

- `java.net.SocketAddress address` - The addres to NCS
- `String notifSubscriberName`

<a id="s-NavuEventHandler-2"></a>
### NavuEventHandler(String, int, String)

```java
public NavuEventHandler(
    String host,
    int port,
    String notifSubscriberName
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Create an instance of the NavuEventHandler with a
 specified host and port.

**Parameters**

- `String host` - The host to NCS
- `int port` - The port to IPC port on `host`
- `String notifSubscriberName`


## Fields

<a id="s-NOTIFICATION_EVENT_PATH"></a>
### NOTIFICATION_EVENT_PATH

```java
public static final String NOTIFICATION_EVENT_PATH = "/ncs:devices/device/notifications/received-notifications/notification";
```

This path has been deprecated in the YANG model.
 Once this part of the model has been removed this variable
 will point to the same path as in
 `#NOTIFICATION_EVENT_PATH`.


## Methods

<a id="s-awaitStopped"></a>
### awaitStopped()

```java
public void awaitStopped() throws InterruptedException
```

<a id="s-getCallbacks"></a>
### getCallbacks(String, String)

```java
protected java.util.List<com.tailf.ncs.NavuEventCallback> getCallbacks(
    String devName,
    String subName
)
```

Types: [NavuEventCallback](NavuEventCallback.md#s-NavuEventCallback)

**Parameters**

- `String devName`
- `String subName`

<a id="s-invokeNavuEventCallbacks"></a>
### invokeNavuEventCallbacks(String, String, NavuNode)

```java
protected void invokeNavuEventCallbacks(
    String devName,
    String subName,
    com.tailf.navu.NavuNode recievedNotif
)
    throws com.tailf.ncs.NcsException
```

Types: [NavuNode](../navu/NavuNode.md#s-NavuNode), [NcsException](NcsException.md#s-NcsException)

**Parameters**

- `String devName`
- `String subName`
- `com.tailf.navu.NavuNode recievedNotif`

<a id="s-isRunning"></a>
### isRunning()

```java
public boolean isRunning()
```

<a id="s-isStopped"></a>
### isStopped()

```java
public boolean isStopped()
```

<a id="s-main"></a>
### main(String[])

```java
public static void main(String[] args)
```

The main method of the NavuEventHandler is a notification probe that
 makes it possible to retrieve any notification without programming By
 running the NavuEventHandler and submitting deviceName and subscription
 name the notifications will then be written on standard output.

 Example (with wildcard for deviceName and subscriptionName):



```
 $java com.tailf.ncs.NavuEventHandler <DeviceName> <SubscriptionName>

 or if all notification should be retrieved

 $java com.tailf.ncs.NavuEventHandler "\*" "\*"

 to connect via a specific Unix socket path (Local IPC)

 $java com.tailf.ncs.NavuEventHandler "\*" "\*" /path/to/socket

 to connect via TCP (both host and port required)

 $java com.tailf.ncs.NavuEventHandler "\*" "\*" 127.0.0.1 4569
```

**Parameters**

- `String[] args`

<a id="s-registerAnnotatedCallbacks"></a>
### registerAnnotatedCallbacks(Object)

```java
public void registerAnnotatedCallbacks(Object obj) throws com.tailf.ncs.NcsException
```

Types: [NcsException](NcsException.md#s-NcsException)

Method to register pojo classes as notification callbacks. This method
 expects the callback method in the pojo class to be annotated using the
 EventCallback annotation. Example :



```
 public class myclass {
 ...
    EventCallback(deviceName="xyz", subscriptionName="sub1",
 callType=EventCBType.NOTIF_RECEIVED)
    public void myNotifReceived(NavuContainer event) throws NcsException {
    ...
    }
 }
```



 This technique makes it possible to use any pojo as callback object.
 Note, however that invocation of the callback method is performed using
 reflection

**Parameters**

- `Object obj` - The annotated user provided object.

**Throws**

- `NcsException`

<a id="s-registerInterfaceCallback"></a>
### registerInterfaceCallback(String, String, NavuEventCallback)

```java
public void registerInterfaceCallback(
    String deviceName,
    String subscriptionName,
    com.tailf.ncs.NavuEventCallback callback
)
```

Types: [NavuEventCallback](NavuEventCallback.md#s-NavuEventCallback)

Method to register classes that implements the `NavuEventHandler`
 interface. This register method requires the `deviceName` and
 `subscriptionName` of the triggering notification to be
 given by the call - NOT as annotations.
 if the register callback method has annotations these
 will be disregarded.

**Parameters**

- `String deviceName` - The interest device name to received notifications
  from.
- `String subscriptionName` - The announced stream name from the device.
- `com.tailf.ncs.NavuEventCallback callback` - User provided implementation of the
    NavuEventCallback.

<a id="s-run"></a>
### run()

```java
public void run()
```

<a id="s-start"></a>
### start()

```java
public void start()
```

Starts this `NavuEventHandler` to receive notifications.

 After the registration of user provided callbacks has been
 done this method must be called to be able for this
 `NavuEventhandler` to receive notifications when it arrives
 to NCS CDB.

 This method will start the underlying
 `CdbSubscriber` asynchronously, if the underlying
 subscriber is not has already started.

<a id="s-stop"></a>
### stop()

```java
public void stop()
```

Stop the underlying subscriber that this `NavuEventHandler`
 is using.

 This call will end retrieval of notifications,
 stopping the underlying `CdbSubscriber`. A restart
 of this NavuEventHandler is not possible as long as the underlying
 CdbSubscriber is not shut down.

 When using a `NavuEventHandler` in a
 `ApplicationComponent` where a `finish` call by
 the Finish-Thread is issued it is important to release or kill
 all the threads that the ApplicationComponent has started thus
 a `stop` call must followed by a shutdown on the
 underlying ExectuorService.


## Nested Types

- [EventIterator](NavuEventHandler/EventIterator.md)
- [InternalEventCB](NavuEventHandler/InternalEventCB.md)
