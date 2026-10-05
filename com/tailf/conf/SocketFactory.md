<a id="s-SocketFactory"></a>
# SocketFactory

```java
public class com.tailf.conf.SocketFactory
```

Class for creation and control of sockets.

 This singleton factory class control all socket connections.
 It is possible to register a socket factory callback. If such a factory is
 registered all socket connect calls will be dispatched to this callback.

 The callback is registered with the SocketFactory.registerCallback(...)
 method. For Confd this is the preferred way.

 In NCS which connects its control sockets before any package is instantiated
 there exist instead a system property TAILF_SOCKET_FACTORY_CB which should
 be set to the callback class e.g like:
 java -DTAILF_SOCKET_FACTORY_CB=com.example.myfactory ...
 This class must exist in the classpath so that it can be found by NcsMain.

## Members

**Methods**:

- [getSocket(InetAddress, int)](#s-getSocket)
- [getSocket(Object, InetAddress, int)](#s-getSocket-1)
- [getSocket(Object, Socket)](#s-getSocket-2)
- [getSocket(Object, SocketAddress)](#s-getSocket-3)
- [getSocket(Object, String, int)](#s-getSocket-4)
- [getSocket(Socket)](#s-getSocket-5)
- [getSocket(SocketAddress)](#s-getSocket-6)
- [getSocket(String, int)](#s-getSocket-7)
- [getSocketFactoryCb()](#s-getSocketFactoryCb)
- [getUnconnectedSocket(Object, ProtocolFamily)](#s-getUnconnectedSocket)
- [getUnconnectedSocket(ProtocolFamily)](#s-getUnconnectedSocket-1)
- [registerCallback(SocketFactoryCallback)](#s-registerCallback)
- [wrapSocket(Socket)](#s-wrapSocket)

## Methods

<a id="s-getSocket"></a>
### getSocket(InetAddress, int)

```java
public static java.net.Socket getSocket(
    java.net.InetAddress address,
    int port
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

Retrieve a socket connected to a specified destination

**Parameters**

- `java.net.InetAddress address` - The preferred address
- `int port` - The preferred port

**Returns:** the socket connection to iaddr, port

**Throws**

- `IOException`
- `ConfException`

<a id="s-getSocket-1"></a>
### getSocket(Object, InetAddress, int)

```java
public static java.net.Socket getSocket(
    Object caller,
    java.net.InetAddress address,
    int port
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

Retrieve a socket connected to a specified destination

**Parameters**

- `Object caller` - The requestor object instance
- `java.net.InetAddress address` - The preferred address
- `int port` - The preferred port

**Returns:** the socket connection to iaddr, port

**Throws**

- `IOException`
- `ConfException`

**Deprecated:** Use `#getSocket(InetAddress, int)`.

<a id="s-getSocket-2"></a>
### getSocket(Object, Socket)

```java
public static java.net.Socket getSocket(
    Object caller,
    java.net.Socket socket
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

Retrieve a socket connected to the same remote address as a
 given socket

**Parameters**

- `Object caller` - The requestor object instance
- `java.net.Socket socket` - The socket to base the new socket on

**Returns:** the resulting socket

**Deprecated:** Use `#getSocket(Socket)`.

<a id="s-getSocket-3"></a>
### getSocket(Object, SocketAddress)

```java
public static java.net.Socket getSocket(
    Object caller,
    java.net.SocketAddress address
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

Retrieve a socket connected to a specified address.

**Parameters**

- `Object caller` - The requestor object instance
- `java.net.SocketAddress address` - The address to connect to

**Returns:** the resulting socket

**Deprecated:** Use `#getSocket(SocketAddress)`.

<a id="s-getSocket-4"></a>
### getSocket(Object, String, int)

```java
public static java.net.Socket getSocket(
    Object caller,
    String hostname,
    int port
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

Retrieve a socket connected to a specified destination

**Parameters**

- `Object caller` - The requestor object instance
- `String hostname` - The preferred host
- `int port` - The preferred port

**Returns:** the socket connected to hostname, port

**Throws**

- `IOException`
- `ConfException`

**Deprecated:** Use `#getSocket(String, int)`.

<a id="s-getSocket-5"></a>
### getSocket(Socket)

```java
public static java.net.Socket getSocket(
    java.net.Socket socket
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

Retrieve a socket connected to the same remote address as a
 given socket

**Parameters**

- `java.net.Socket socket` - The socket to base the new socket on

**Returns:** the resulting socket

<a id="s-getSocket-6"></a>
### getSocket(SocketAddress)

```java
public static java.net.Socket getSocket(
    java.net.SocketAddress address
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

Retrieve a socket connected to a specified address.

**Parameters**

- `java.net.SocketAddress address` - The address to connect to

**Returns:** the resulting socket

<a id="s-getSocket-7"></a>
### getSocket(String, int)

```java
public static java.net.Socket getSocket(
    String hostname,
    int port
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

Retrieve a socket connected to a specified destination

**Parameters**

- `String hostname` - The preferred host
- `int port` - The preferred port

**Returns:** the socket connected to hostname, port

**Throws**

- `IOException`
- `ConfException`

<a id="s-getSocketFactoryCb"></a>
### getSocketFactoryCb()

```java
public static com.tailf.conf.SocketFactoryCallback getSocketFactoryCb()
```

Types: [SocketFactoryCallback](SocketFactoryCallback.md#s-SocketFactoryCallback)

Retrieve the SocketFactoryCallback. This always exists, if the user have
 not registered a callback this method will return a
 DefaultSocketFactoryCb instance

**Returns:** the current SocketFactoryCallback

<a id="s-getUnconnectedSocket"></a>
### getUnconnectedSocket(Object, ProtocolFamily)

```java
public static java.net.Socket getUnconnectedSocket(
    Object caller,
    java.net.ProtocolFamily family
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

Retrieve an unconnected socket. Such socket can be used when e.g a
 bind() call is necessary before the connect() is performed.
 The connect() call is performed by the requestor.

**Parameters**

- `Object caller` - The requestor object instance
- `java.net.ProtocolFamily family` - The protocol family

**Returns:** An unconnected socket

**Throws**

- `IOException`
- `ConfException`

**Deprecated:** Use `#getUnconnectedSocket(ProtocolFamily)`.

<a id="s-getUnconnectedSocket-1"></a>
### getUnconnectedSocket(ProtocolFamily)

```java
public static java.net.Socket getUnconnectedSocket(
    java.net.ProtocolFamily family
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

Retrieve an unconnected socket. Such socket can be used when e.g a
 bind() call is necessary before the connect() is performed.
 The connect() call is performed by the requestor.

**Parameters**

- `java.net.ProtocolFamily family` - The protocol family

**Returns:** An unconnected socket

**Throws**

- `IOException`
- `ConfException`

<a id="s-registerCallback"></a>
### registerCallback(SocketFactoryCallback)

```java
public static void registerCallback(com.tailf.conf.SocketFactoryCallback cb)
```

Types: [SocketFactoryCallback](SocketFactoryCallback.md#s-SocketFactoryCallback)

Register a SocketFactoryCallback that will be responsible for all
 socket connection

**Parameters**

- `com.tailf.conf.SocketFactoryCallback cb` - SocketFactoryCallback instance

<a id="s-wrapSocket"></a>
### wrapSocket(Socket)

```java
public static java.net.Socket wrapSocket(java.net.Socket socket)
```

Wrap an already connected socket. The default implementation
 will only return the given socket as is

**Parameters**

- `java.net.Socket socket` - The socket to wrap
