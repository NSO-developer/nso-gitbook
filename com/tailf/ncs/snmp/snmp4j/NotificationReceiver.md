# NotificationReceiver <a href="#cls-NotificationReceiver" id="cls-NotificationReceiver"></a>

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
- [destroyNotificationReceiver()](#m-destroyNotificationReceiver-fc60e4855559)
- [getKnownIPAddresses()](#m-getKnownIPAddresses-73a59ac83893)
- [getNotificationReceiver()](#m-getNotificationReceiver-c83248d8bc1a)
- [getNotificationReceiver(SocketAddress)](#m-getNotificationReceiver-3a5397d83b63)
- [getNotificationReceiver(String, int)](#m-getNotificationReceiver-62efe28b6fa5)
- [getRegisteredNotificationHandlers()](#m-getRegisteredNotificationHandlers-603e3e7c392b)
- [isEnabled()](#m-isEnabled-e96410650a37)
- [isStarted()](#m-isStarted-5c757faf6088)
- [register(ArrayList<NotifHandlerInstance>)](#m-register-f6ca408fb1d6)
- [register(NotificationHandler, Object)](#m-register-426f8c48becc)
- [start()](#m-start-79e12dafe9f8)
- [stop()](#m-stop-a62ecc446f97)

## Methods

### destroy() <a href="#m-destroy-c06780cdd1bc" id="m-destroy-c06780cdd1bc"></a>

```java
public void destroy()
```

### destroyNotificationReceiver() <a href="#m-destroyNotificationReceiver-fc60e4855559" id="m-destroyNotificationReceiver-fc60e4855559"></a>

```java
public static synchronized void destroyNotificationReceiver()
```

**Deprecated:** Use [`destroy()`](NotificationReceiver.md#m-destroy-c06780cdd1bc) instead.

### getKnownIPAddresses() <a href="#m-getKnownIPAddresses-73a59ac83893" id="m-getKnownIPAddresses-73a59ac83893"></a>

```java
public java.util.Map<java.net.InetAddress,com.tailf.conf.ConfKey> getKnownIPAddresses()
```

Types: [ConfKey](../../../conf/ConfKey.md#cls-ConfKey)

Returns the set of snmp peer ip addresses
 for registered managed devices.

**Returns:** set of ConfValue where the values are either of type
         ConfIPv4 or ConfIPv6

### getNotificationReceiver() <a href="#m-getNotificationReceiver-c83248d8bc1a" id="m-getNotificationReceiver-c83248d8bc1a"></a>

```java
public static com.tailf.ncs.snmp.snmp4j.NotificationReceiver getNotificationReceiver() throws com.tailf.ncs.NcsException
    throws com.tailf.ncs.NcsException
```

Types: [NotificationReceiver](NotificationReceiver.md#cls-NotificationReceiver), [NcsException](../../NcsException.md#cls-NcsException)

Factory method to get a NotificationReceiver instance.
 The NotificationReceiver is a singleton i.e. there an only be
 one instance of this class

**Deprecated:** Use [`getNotificationReceiver(SocketAddress)`](NotificationReceiver.md#m-getNotificationReceiver-3a5397d83b63) instead.

### getNotificationReceiver(SocketAddress) <a href="#m-getNotificationReceiver-3a5397d83b63" id="m-getNotificationReceiver-3a5397d83b63"></a>

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

### getNotificationReceiver(String, int) <a href="#m-getNotificationReceiver-62efe28b6fa5" id="m-getNotificationReceiver-62efe28b6fa5"></a>

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

**Deprecated:** Use [`getNotificationReceiver(SocketAddress)`](NotificationReceiver.md#m-getNotificationReceiver-3a5397d83b63) instead.

### getRegisteredNotificationHandlers() <a href="#m-getRegisteredNotificationHandlers-603e3e7c392b" id="m-getRegisteredNotificationHandlers-603e3e7c392b"></a>

```java
public java.util.ArrayList<com.tailf.ncs.snmp.snmp4j.NotifHandlerInstance> getRegisteredNotificationHandlers()
```

Types: [NotifHandlerInstance](NotifHandlerInstance.md#cls-NotifHandlerInstance)

Get a copy of the registered chain of NotificationHandlerInstances
 An NotificationHandlerInstance is an NotificationHandler together
 with its registered opaque object.

**Returns:** ArrayList of NotificationHandlerInstances

### isEnabled() <a href="#m-isEnabled-e96410650a37" id="m-isEnabled-e96410650a37"></a>

```java
public boolean isEnabled()
```

Check it the NotificationReceiver is enabled
 This flag is controlled by the NCS configuration

**Returns:** true if enabled

### isStarted() <a href="#m-isStarted-5c757faf6088" id="m-isStarted-5c757faf6088"></a>

```java
public boolean isStarted()
```

Check it the NotificationReceiver has started

**Returns:** true if started

### register(ArrayList<NotifHandlerInstance>) <a href="#m-register-f6ca408fb1d6" id="m-register-f6ca408fb1d6"></a>

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

### register(NotificationHandler, Object) <a href="#m-register-426f8c48becc" id="m-register-426f8c48becc"></a>

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

### start() <a href="#m-start-79e12dafe9f8" id="m-start-79e12dafe9f8"></a>

```java
public void start() throws java.io.IOException
```

This method is called to start subscription on notifications

**Throws**

- `IOException`

### stop() <a href="#m-stop-a62ecc446f97" id="m-stop-a62ecc446f97"></a>

```java
public void stop() throws java.io.IOException
```

This method is called to stop subscription on notifications

**Throws**

- `IOException`
