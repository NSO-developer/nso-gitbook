<a id="cls-SocketFactory"></a>
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

- [getSocket(InetAddress, int)](#m-getsocket-60f7047e1210)
- [getSocket(Object, InetAddress, int)](#m-getsocket-2fc4ed37c8ec)
- [getSocket(Object, Socket)](#m-getsocket-e33d64204891)
- [getSocket(Object, SocketAddress)](#m-getsocket-56f7f9efbb5e)
- [getSocket(Object, String, int)](#m-getsocket-716fbc8e8570)
- [getSocket(Socket)](#m-getsocket-843c18d87453)
- [getSocket(SocketAddress)](#m-getsocket-294002c373e6)
- [getSocket(String, int)](#m-getsocket-30dffcd0af21)
- [getSocketFactoryCb()](#m-getsocketfactorycb-374cd9148ad9)
- [getUnconnectedSocket(Object, ProtocolFamily)](#m-getunconnectedsocket-4d9322b795e2)
- [getUnconnectedSocket(ProtocolFamily)](#m-getunconnectedsocket-2b37476a3a26)
- [registerCallback(SocketFactoryCallback)](#m-registercallback-6bd9f054044b)
- [wrapSocket(Socket)](#m-wrapsocket-52cbce4e91a6)

## Methods

<a id="m-getsocket-60f7047e1210"></a>
### getSocket(InetAddress, int)

```java
public static java.net.Socket getSocket(
    java.net.InetAddress address,
    int port
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Retrieve a socket connected to a specified destination

**Parameters**

- `java.net.InetAddress address` - The preferred address
- `int port` - The preferred port

**Returns:** the socket connection to iaddr, port

**Throws**

- `IOException`
- `ConfException`

<a id="m-getsocket-2fc4ed37c8ec"></a>
### getSocket(Object, InetAddress, int)

```java
public static java.net.Socket getSocket(
    Object caller,
    java.net.InetAddress address,
    int port
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

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

<a id="m-getsocket-e33d64204891"></a>
### getSocket(Object, Socket)

```java
public static java.net.Socket getSocket(
    Object caller,
    java.net.Socket socket
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Retrieve a socket connected to the same remote address as a
 given socket

**Parameters**

- `Object caller` - The requestor object instance
- `java.net.Socket socket` - The socket to base the new socket on

**Returns:** the resulting socket

**Deprecated:** Use `#getSocket(Socket)`.

<a id="m-getsocket-56f7f9efbb5e"></a>
### getSocket(Object, SocketAddress)

```java
public static java.net.Socket getSocket(
    Object caller,
    java.net.SocketAddress address
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Retrieve a socket connected to a specified address.

**Parameters**

- `Object caller` - The requestor object instance
- `java.net.SocketAddress address` - The address to connect to

**Returns:** the resulting socket

**Deprecated:** Use `#getSocket(SocketAddress)`.

<a id="m-getsocket-716fbc8e8570"></a>
### getSocket(Object, String, int)

```java
public static java.net.Socket getSocket(
    Object caller,
    String hostname,
    int port
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

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

<a id="m-getsocket-843c18d87453"></a>
### getSocket(Socket)

```java
public static java.net.Socket getSocket(
    java.net.Socket socket
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Retrieve a socket connected to the same remote address as a
 given socket

**Parameters**

- `java.net.Socket socket` - The socket to base the new socket on

**Returns:** the resulting socket

<a id="m-getsocket-294002c373e6"></a>
### getSocket(SocketAddress)

```java
public static java.net.Socket getSocket(
    java.net.SocketAddress address
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Retrieve a socket connected to a specified address.

**Parameters**

- `java.net.SocketAddress address` - The address to connect to

**Returns:** the resulting socket

<a id="m-getsocket-30dffcd0af21"></a>
### getSocket(String, int)

```java
public static java.net.Socket getSocket(
    String hostname,
    int port
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Retrieve a socket connected to a specified destination

**Parameters**

- `String hostname` - The preferred host
- `int port` - The preferred port

**Returns:** the socket connected to hostname, port

**Throws**

- `IOException`
- `ConfException`

<a id="m-getsocketfactorycb-374cd9148ad9"></a>
### getSocketFactoryCb()

```java
public static com.tailf.conf.SocketFactoryCallback getSocketFactoryCb()
```

Types: [SocketFactoryCallback](SocketFactoryCallback.md#cls-SocketFactoryCallback)

Retrieve the SocketFactoryCallback. This always exists, if the user have
 not registered a callback this method will return a
 DefaultSocketFactoryCb instance

**Returns:** the current SocketFactoryCallback

<a id="m-getunconnectedsocket-4d9322b795e2"></a>
### getUnconnectedSocket(Object, ProtocolFamily)

```java
public static java.net.Socket getUnconnectedSocket(
    Object caller,
    java.net.ProtocolFamily family
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

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

<a id="m-getunconnectedsocket-2b37476a3a26"></a>
### getUnconnectedSocket(ProtocolFamily)

```java
public static java.net.Socket getUnconnectedSocket(
    java.net.ProtocolFamily family
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Retrieve an unconnected socket. Such socket can be used when e.g a
 bind() call is necessary before the connect() is performed.
 The connect() call is performed by the requestor.

**Parameters**

- `java.net.ProtocolFamily family` - The protocol family

**Returns:** An unconnected socket

**Throws**

- `IOException`
- `ConfException`

<a id="m-registercallback-6bd9f054044b"></a>
### registerCallback(SocketFactoryCallback)

```java
public static void registerCallback(com.tailf.conf.SocketFactoryCallback cb)
```

Types: [SocketFactoryCallback](SocketFactoryCallback.md#cls-SocketFactoryCallback)

Register a SocketFactoryCallback that will be responsible for all
 socket connection

**Parameters**

- `com.tailf.conf.SocketFactoryCallback cb` - SocketFactoryCallback instance

<a id="m-wrapsocket-52cbce4e91a6"></a>
### wrapSocket(Socket)

```java
public static java.net.Socket wrapSocket(java.net.Socket socket)
```

Wrap an already connected socket. The default implementation
 will only return the given socket as is

**Parameters**

- `java.net.Socket socket` - The socket to wrap
