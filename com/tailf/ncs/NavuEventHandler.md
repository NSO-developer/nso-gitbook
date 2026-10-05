# NavuEventHandler <a href="#navueventhandler-42a9ee4c4a00" id="navueventhandler-42a9ee4c4a00"></a>

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




 A user provided implementation of a [`NavuEventCallback`](NavuEventCallback.md#navueventcallback-f83ce6fd0d42) is
 registered with the
 `registerInterfaceCallback(String,String,NavuEventCallback)`
 method. Optionally a plain java pojo could be annotated
 with the annotation [`EventCallback`](annotations/EventCallback.md#eventcallback-db4e4246d0c8) and
 registered the annotated instance with
 [`registerAnnotatedCallbacks(Object)`](NavuEventHandler.md#registerannotatedcallbacks-ffaebadbfc42).

 When registering a reacting callback user needs to provide the
 device name and the stream name in either the explicitly
 `registerInterfaceCallback` method or
 through the annotated java pojo. If the callback needs to received
 notifications from all the device and to all the streams annotated
 an asterisk could be supplied ( or annotated ) as the parameter
 to the registered methods.

 As soon as the notifications arrives the user implementation of the
 `NavuEventCallback`
 [`NavuEventCallback#notifReceived(NavuContainer)`](NavuEventCallback.md#notifreceived-df06be623526) is invoked
 by the NavuEventHandler for the device and stream the callback
 is interested in.

 The NavuContainer represents the list entries:

 /ncs:devices/device{device-name}/notifications
   /received-notifications/notification{event-time sequence-no}.

## Members

**Constructors**:

- [NavuEventHandler(SocketAddress, String)](#navueventhandler-891bd346a2fa)
- [NavuEventHandler(String, int, String)](#navueventhandler-e6148b2b8e5e)

**Fields**:

- [NOTIFICATION_EVENT_PATH](#notification_event_path-c8627c2a8d6e)

**Methods**:

- [awaitStopped()](#awaitstopped-07bdf4883d6b)
- [getCallbacks(String, String)](#getcallbacks-cf69c24d830b)
- [invokeNavuEventCallbacks(String, String, NavuNode)](#invokenavueventcallbacks-d6eb2ab2120a)
- [isRunning()](#isrunning-02db4ec84a8d)
- [isStopped()](#isstopped-9ec54eaf1bc2)
- [main(String[])](#main-1503518a8568)
- [registerAnnotatedCallbacks(Object)](#registerannotatedcallbacks-ffaebadbfc42)
- [registerInterfaceCallback(String, String, NavuEventCallback)](#registerinterfacecallback-266c7a185b0e)
- [run()](#run-b6dbda048863)
- [start()](#start-79e12dafe9f8)
- [stop()](#stop-a62ecc446f97)

**Nested Types**:

- [EventIterator](NavuEventHandler/EventIterator.md#eventiterator-77ded33d8f63)
- [InternalEventCB](NavuEventHandler/InternalEventCB.md#internaleventcb-abf2cc138ac7)

## Constructors

### NavuEventHandler(SocketAddress, String) <a href="#navueventhandler-891bd346a2fa" id="navueventhandler-891bd346a2fa"></a>

```java
public NavuEventHandler(
    java.net.SocketAddress address,
    String notifSubscriberName
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Create an instance of the NavuEventHandler with a
 SocketAddress with the address to NCS

**Parameters**

- `java.net.SocketAddress address` - The addres to NCS
- `String notifSubscriberName`

### NavuEventHandler(String, int, String) <a href="#navueventhandler-e6148b2b8e5e" id="navueventhandler-e6148b2b8e5e"></a>

```java
public NavuEventHandler(
    String host,
    int port,
    String notifSubscriberName
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Create an instance of the NavuEventHandler with a
 specified host and port.

**Parameters**

- `String host` - The host to NCS
- `int port` - The port to IPC port on `host`
- `String notifSubscriberName`


## Fields

### NOTIFICATION_EVENT_PATH <a href="#notification_event_path-c8627c2a8d6e" id="notification_event_path-c8627c2a8d6e"></a>

```java
public static final String NOTIFICATION_EVENT_PATH = "/ncs:devices/device/notifications/received-notifications/notification";
```

This path has been deprecated in the YANG model.
 Once this part of the model has been removed this variable
 will point to the same path as in
 [`NOTIFICATION_EVENT_PATH`](NavuEventHandler.md#notification_event_path-c8627c2a8d6e).


## Methods

### awaitStopped() <a href="#awaitstopped-07bdf4883d6b" id="awaitstopped-07bdf4883d6b"></a>

```java
public void awaitStopped() throws InterruptedException
```

### getCallbacks(String, String) <a href="#getcallbacks-cf69c24d830b" id="getcallbacks-cf69c24d830b"></a>

```java
protected java.util.List<com.tailf.ncs.NavuEventCallback> getCallbacks(
    String devName,
    String subName
)
```

Types: [NavuEventCallback](NavuEventCallback.md#navueventcallback-f83ce6fd0d42)

**Parameters**

- `String devName`
- `String subName`

### invokeNavuEventCallbacks(String, String, NavuNode) <a href="#invokenavueventcallbacks-d6eb2ab2120a" id="invokenavueventcallbacks-d6eb2ab2120a"></a>

```java
protected void invokeNavuEventCallbacks(
    String devName,
    String subName,
    com.tailf.navu.NavuNode recievedNotif
)
    throws com.tailf.ncs.NcsException
```

Types: [NavuNode](../navu/NavuNode.md#navunode-73944820c8db), [NcsException](NcsException.md#ncsexception-d2b40ca98ea5)

**Parameters**

- `String devName`
- `String subName`
- `com.tailf.navu.NavuNode recievedNotif`

### isRunning() <a href="#isrunning-02db4ec84a8d" id="isrunning-02db4ec84a8d"></a>

```java
public boolean isRunning()
```

### isStopped() <a href="#isstopped-9ec54eaf1bc2" id="isstopped-9ec54eaf1bc2"></a>

```java
public boolean isStopped()
```

### main(String[]) <a href="#main-1503518a8568" id="main-1503518a8568"></a>

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

### registerAnnotatedCallbacks(Object) <a href="#registerannotatedcallbacks-ffaebadbfc42" id="registerannotatedcallbacks-ffaebadbfc42"></a>

```java
public void registerAnnotatedCallbacks(Object obj) throws com.tailf.ncs.NcsException
```

Types: [NcsException](NcsException.md#ncsexception-d2b40ca98ea5)

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

### registerInterfaceCallback(String, String, NavuEventCallback) <a href="#registerinterfacecallback-266c7a185b0e" id="registerinterfacecallback-266c7a185b0e"></a>

```java
public void registerInterfaceCallback(
    String deviceName,
    String subscriptionName,
    com.tailf.ncs.NavuEventCallback callback
)
```

Types: [NavuEventCallback](NavuEventCallback.md#navueventcallback-f83ce6fd0d42)

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

### run() <a href="#run-b6dbda048863" id="run-b6dbda048863"></a>

```java
public void run()
```

### start() <a href="#start-79e12dafe9f8" id="start-79e12dafe9f8"></a>

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

### stop() <a href="#stop-a62ecc446f97" id="stop-a62ecc446f97"></a>

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

- [EventIterator](NavuEventHandler/EventIterator.md#eventiterator-77ded33d8f63)
- [InternalEventCB](NavuEventHandler/InternalEventCB.md#internaleventcb-abf2cc138ac7)
