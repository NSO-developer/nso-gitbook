<a id="cls-NotificationReceiver"></a>
# NotificationReceiver

```java
public class com.tailf.ncs.snmp.snmp4j.NotificationReceiver
```

This class mediated the use of Snmp4j
 for receiving and mapping of incoming snmp notifications.

 As such it sets up the notification receiving capabilities according
 to the ncs configuration.

## Members

**Methods**:

- [destroy()](#m-destroy-c06780cdd1bc)
- [destroyNotificationReceiver()](#m-destroynotificationreceiver-fc60e4855559)
- [getKnownIPAddresses()](#m-getknownipaddresses-73a59ac83893)
- [getNotificationReceiver()](#m-getnotificationreceiver-c83248d8bc1a)
- [getNotificationReceiver(SocketAddress)](#m-getnotificationreceiver-3a5397d83b63)
- [getNotificationReceiver(String, int)](#m-getnotificationreceiver-62efe28b6fa5)
- [getRegisteredNotificationHandlers()](#m-getregisterednotificationhandlers-603e3e7c392b)
- [isEnabled()](#m-isenabled-e96410650a37)
- [isStarted()](#m-isstarted-5c757faf6088)
- [register(ArrayList<NotifHandlerInstance>)](#m-register-f6ca408fb1d6)
- [register(NotificationHandler, Object)](#m-register-426f8c48becc)
- [start()](#m-start-79e12dafe9f8)
- [stop()](#m-stop-a62ecc446f97)

## Methods

<a id="m-destroy-c06780cdd1bc"></a>
### destroy()

```java
public void destroy()
```

<a id="m-destroynotificationreceiver-fc60e4855559"></a>
### destroyNotificationReceiver()

```java
public static synchronized void destroyNotificationReceiver()
```

**Deprecated:** Use `#destroy()` instead.

<a id="m-getknownipaddresses-73a59ac83893"></a>
### getKnownIPAddresses()

```java
public java.util.Map<java.net.InetAddress,com.tailf.conf.ConfKey> getKnownIPAddresses()
```

Types: [ConfKey](../../../conf/ConfKey.md#cls-ConfKey)

Returns the set of snmp peer ip addresses
 for registered managed devices.

**Returns:** set of ConfValue where the values are either of type
         ConfIPv4 or ConfIPv6

<a id="m-getnotificationreceiver-c83248d8bc1a"></a>
### getNotificationReceiver()

```java
public static com.tailf.ncs.snmp.snmp4j.NotificationReceiver getNotificationReceiver() throws com.tailf.ncs.NcsException
    throws com.tailf.ncs.NcsException
```

Types: [NotificationReceiver](NotificationReceiver.md#cls-NotificationReceiver), [NcsException](../../NcsException.md#cls-NcsException)

Factory method to get a NotificationReceiver instance.
 The NotificationReceiver is a singleton i.e. there an only be
 one instance of this class

**Deprecated:** Use `#getNotificationReceiver(SocketAddress)` instead.

<a id="m-getnotificationreceiver-3a5397d83b63"></a>
### getNotificationReceiver(SocketAddress)

```java
public static synchronized com.tailf.ncs.snmp.snmp4j.NotificationReceiver getNotificationReceiver(
    java.net.SocketAddress address
)
    throws com.tailf.ncs.NcsException
```

Types: [NotificationReceiver](NotificationReceiver.md#cls-NotificationReceiver), [NcsException](../../NcsException.md#cls-NcsException)

Factory method to get a NotificationReceiver instance.
 The NotificationReceiver is a singleton i.e. there an only be
 one instance of this class per NCS instance.

**Parameters**

- `java.net.SocketAddress address` - address for the NCS server

**Returns:** NotificationReceiver

<a id="m-getnotificationreceiver-62efe28b6fa5"></a>
### getNotificationReceiver(String, int)

```java
public static com.tailf.ncs.snmp.snmp4j.NotificationReceiver getNotificationReceiver(
    String host,
    int port
)
    throws com.tailf.ncs.NcsException
```

Types: [NotificationReceiver](NotificationReceiver.md#cls-NotificationReceiver), [NcsException](../../NcsException.md#cls-NcsException)

Factory method to get a NotificationReceiver instance.
 The NotificationReceiver is a singleton i.e. there an only be
 one instance of this class

**Parameters**

- `String host` - hostname for the NCS server
- `int port` - port number for the NCS server

**Returns:** NotificationReceiver

**Deprecated:** Use `#getNotificationReceiver(SocketAddress)` instead.

<a id="m-getregisterednotificationhandlers-603e3e7c392b"></a>
### getRegisteredNotificationHandlers()

```java
public java.util.ArrayList<com.tailf.ncs.snmp.snmp4j.NotifHandlerInstance> getRegisteredNotificationHandlers()
```

Types: [NotifHandlerInstance](NotifHandlerInstance.md#cls-NotifHandlerInstance)

Get a copy of the registered chain of NotificationHandlerInstances
 An NotificationHandlerInstance is an NotificationHandler together
 with its registered opaque object.

**Returns:** ArrayList of NotificationHandlerInstances

<a id="m-isenabled-e96410650a37"></a>
### isEnabled()

```java
public boolean isEnabled()
```

Check it the NotificationReceiver is enabled
 This flag is controlled by the NCS configuration

**Returns:** true if enabled

<a id="m-isstarted-5c757faf6088"></a>
### isStarted()

```java
public boolean isStarted()
```

Check it the NotificationReceiver has started

**Returns:** true if started

<a id="m-register-f6ca408fb1d6"></a>
### register(ArrayList<NotifHandlerInstance>)

```java
public void register(
    java.util.ArrayList<com.tailf.ncs.snmp.snmp4j.NotifHandlerInstance> handlerChain
)
    throws com.tailf.ncs.NcsException
```

Types: [NotifHandlerInstance](NotifHandlerInstance.md#cls-NotifHandlerInstance), [NcsException](../../NcsException.md#cls-NcsException)

This register method takes an ArrayList of NotificationHandlerInstances
 and registers these. Any old registration will be swept away.
 This method is useful when it is of interest to change the default
 filter handling of the NotificationReceiver.

**Parameters**

- `java.util.ArrayList<com.tailf.ncs.snmp.snmp4j.NotifHandlerInstance> handlerChain`

**Throws**

- `NcsException`

<a id="m-register-426f8c48becc"></a>
### register(NotificationHandler, Object)

```java
public void register(
    com.tailf.ncs.snmp.snmp4j.NotificationHandler responder,
    Object opaque
)
    throws com.tailf.ncs.NcsException
```

Types: [NotificationHandler](NotificationHandler.md#cls-NotificationHandler), [NcsException](../../NcsException.md#cls-NcsException)

This method is used to register handler callback classes to the
 notification receiver.
 There can be many handlers registered on the notification receiver
 in which case they are chained in a sequence corresponding to
 the order in which they where registered.
 An received notification will be processed by the handlers in order
 but the process chain stopped if the previous handler returned a
 suspend return value.
 It is possible to register a opaque object that is passed
 to the handler when it is called. This way information for the
 handler can be stored and maintained.

**Parameters**

- `com.tailf.ncs.snmp.snmp4j.NotificationHandler responder` - - handler class to process notifications
- `Object opaque` - - object to pass to the handler at execution

<a id="m-start-79e12dafe9f8"></a>
### start()

```java
public void start() throws java.io.IOException
```

This method is called to start subscription on notifications

**Throws**

- `IOException`

<a id="m-stop-a62ecc446f97"></a>
### stop()

```java
public void stop() throws java.io.IOException
```

This method is called to stop subscription on notifications

**Throws**

- `IOException`
