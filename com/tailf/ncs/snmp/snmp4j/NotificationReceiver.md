# NotificationReceiver <a href="#notificationreceiver-fd29973ce750" id="notificationreceiver-fd29973ce750"></a>

```java
public class com.tailf.ncs.snmp.snmp4j.NotificationReceiver
```

This class mediated the use of Snmp4j
 for receiving and mapping of incoming snmp notifications.

 As such it sets up the notification receiving capabilities according
 to the ncs configuration.

## Members

**Methods**:

- [destroy()](#destroy-c06780cdd1bc)
- [destroyNotificationReceiver()](#destroynotificationreceiver-fc60e4855559)
- [getKnownIPAddresses()](#getknownipaddresses-73a59ac83893)
- [getNotificationReceiver()](#getnotificationreceiver-c83248d8bc1a)
- [getNotificationReceiver(SocketAddress)](#getnotificationreceiver-3a5397d83b63)
- [getNotificationReceiver(String, int)](#getnotificationreceiver-62efe28b6fa5)
- [getRegisteredNotificationHandlers()](#getregisterednotificationhandlers-603e3e7c392b)
- [isEnabled()](#isenabled-e96410650a37)
- [isStarted()](#isstarted-5c757faf6088)
- [register(ArrayList<NotifHandlerInstance>)](#register-f6ca408fb1d6)
- [register(NotificationHandler, Object)](#register-426f8c48becc)
- [start()](#start-79e12dafe9f8)
- [stop()](#stop-a62ecc446f97)

## Methods

### destroy() <a href="#destroy-c06780cdd1bc" id="destroy-c06780cdd1bc"></a>

```java
public void destroy()
```

### destroyNotificationReceiver() <a href="#destroynotificationreceiver-fc60e4855559" id="destroynotificationreceiver-fc60e4855559"></a>

```java
public static synchronized void destroyNotificationReceiver()
```

**Deprecated:** Use [`destroy()`](NotificationReceiver.md#destroy-c06780cdd1bc) instead.

### getKnownIPAddresses() <a href="#getknownipaddresses-73a59ac83893" id="getknownipaddresses-73a59ac83893"></a>

```java
public java.util.Map<java.net.InetAddress,com.tailf.conf.ConfKey> getKnownIPAddresses()
```

Types: [ConfKey](../../../conf/ConfKey.md#confkey-e4e1ca98e867)

Returns the set of snmp peer ip addresses
 for registered managed devices.

**Returns:** set of ConfValue where the values are either of type
         ConfIPv4 or ConfIPv6

### getNotificationReceiver() <a href="#getnotificationreceiver-c83248d8bc1a" id="getnotificationreceiver-c83248d8bc1a"></a>

```java
public static com.tailf.ncs.snmp.snmp4j.NotificationReceiver getNotificationReceiver() throws com.tailf.ncs.NcsException
    throws com.tailf.ncs.NcsException
```

Types: [NotificationReceiver](NotificationReceiver.md#notificationreceiver-fd29973ce750), [NcsException](../../NcsException.md#ncsexception-d2b40ca98ea5)

Factory method to get a NotificationReceiver instance.
 The NotificationReceiver is a singleton i.e. there an only be
 one instance of this class

**Deprecated:** Use [`getNotificationReceiver(SocketAddress)`](NotificationReceiver.md#getnotificationreceiver-3a5397d83b63) instead.

### getNotificationReceiver(SocketAddress) <a href="#getnotificationreceiver-3a5397d83b63" id="getnotificationreceiver-3a5397d83b63"></a>

```java
public static synchronized com.tailf.ncs.snmp.snmp4j.NotificationReceiver getNotificationReceiver(
    java.net.SocketAddress address
)
    throws com.tailf.ncs.NcsException
```

Types: [NotificationReceiver](NotificationReceiver.md#notificationreceiver-fd29973ce750), [NcsException](../../NcsException.md#ncsexception-d2b40ca98ea5)

Factory method to get a NotificationReceiver instance.
 The NotificationReceiver is a singleton i.e. there an only be
 one instance of this class per NCS instance.

**Parameters**

- `java.net.SocketAddress address` - address for the NCS server

**Returns:** NotificationReceiver

### getNotificationReceiver(String, int) <a href="#getnotificationreceiver-62efe28b6fa5" id="getnotificationreceiver-62efe28b6fa5"></a>

```java
public static com.tailf.ncs.snmp.snmp4j.NotificationReceiver getNotificationReceiver(
    String host,
    int port
)
    throws com.tailf.ncs.NcsException
```

Types: [NotificationReceiver](NotificationReceiver.md#notificationreceiver-fd29973ce750), [NcsException](../../NcsException.md#ncsexception-d2b40ca98ea5)

Factory method to get a NotificationReceiver instance.
 The NotificationReceiver is a singleton i.e. there an only be
 one instance of this class

**Parameters**

- `String host` - hostname for the NCS server
- `int port` - port number for the NCS server

**Returns:** NotificationReceiver

**Deprecated:** Use [`getNotificationReceiver(SocketAddress)`](NotificationReceiver.md#getnotificationreceiver-3a5397d83b63) instead.

### getRegisteredNotificationHandlers() <a href="#getregisterednotificationhandlers-603e3e7c392b" id="getregisterednotificationhandlers-603e3e7c392b"></a>

```java
public java.util.ArrayList<com.tailf.ncs.snmp.snmp4j.NotifHandlerInstance> getRegisteredNotificationHandlers()
```

Types: [NotifHandlerInstance](NotifHandlerInstance.md#notifhandlerinstance-7fa13bf44d0b)

Get a copy of the registered chain of NotificationHandlerInstances
 An NotificationHandlerInstance is an NotificationHandler together
 with its registered opaque object.

**Returns:** ArrayList of NotificationHandlerInstances

### isEnabled() <a href="#isenabled-e96410650a37" id="isenabled-e96410650a37"></a>

```java
public boolean isEnabled()
```

Check it the NotificationReceiver is enabled
 This flag is controlled by the NCS configuration

**Returns:** true if enabled

### isStarted() <a href="#isstarted-5c757faf6088" id="isstarted-5c757faf6088"></a>

```java
public boolean isStarted()
```

Check it the NotificationReceiver has started

**Returns:** true if started

### register(ArrayList&lt;NotifHandlerInstance&gt;) <a href="#register-f6ca408fb1d6" id="register-f6ca408fb1d6"></a>

```java
public void register(
    java.util.ArrayList<com.tailf.ncs.snmp.snmp4j.NotifHandlerInstance> handlerChain
)
    throws com.tailf.ncs.NcsException
```

Types: [NotifHandlerInstance](NotifHandlerInstance.md#notifhandlerinstance-7fa13bf44d0b), [NcsException](../../NcsException.md#ncsexception-d2b40ca98ea5)

This register method takes an ArrayList of NotificationHandlerInstances
 and registers these. Any old registration will be swept away.
 This method is useful when it is of interest to change the default
 filter handling of the NotificationReceiver.

**Parameters**

- `java.util.ArrayList<com.tailf.ncs.snmp.snmp4j.NotifHandlerInstance> handlerChain`

**Throws**

- `NcsException`

### register(NotificationHandler, Object) <a href="#register-426f8c48becc" id="register-426f8c48becc"></a>

```java
public void register(
    com.tailf.ncs.snmp.snmp4j.NotificationHandler responder,
    Object opaque
)
    throws com.tailf.ncs.NcsException
```

Types: [NotificationHandler](NotificationHandler.md#notificationhandler-49960afdd747), [NcsException](../../NcsException.md#ncsexception-d2b40ca98ea5)

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

### start() <a href="#start-79e12dafe9f8" id="start-79e12dafe9f8"></a>

```java
public void start() throws java.io.IOException
```

This method is called to start subscription on notifications

**Throws**

- `IOException`

### stop() <a href="#stop-a62ecc446f97" id="stop-a62ecc446f97"></a>

```java
public void stop() throws java.io.IOException
```

This method is called to stop subscription on notifications

**Throws**

- `IOException`
