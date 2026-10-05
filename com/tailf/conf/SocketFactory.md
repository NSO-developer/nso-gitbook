# SocketFactory <a href="#socketfactory-4c528c23b1bd" id="socketfactory-4c528c23b1bd"></a>

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

- [getSocket\(InetAddress, int\)](#getsocket-60f7047e1210)
- [getSocket\(Object, InetAddress, int\)](#getsocket-2fc4ed37c8ec)
- [getSocket\(Object, Socket\)](#getsocket-e33d64204891)
- [getSocket\(Object, SocketAddress\)](#getsocket-56f7f9efbb5e)
- [getSocket\(Object, String, int\)](#getsocket-716fbc8e8570)
- [getSocket\(Socket\)](#getsocket-843c18d87453)
- [getSocket\(SocketAddress\)](#getsocket-294002c373e6)
- [getSocket\(String, int\)](#getsocket-30dffcd0af21)
- [getSocketFactoryCb\(\)](#getsocketfactorycb-374cd9148ad9)
- [getUnconnectedSocket\(Object, ProtocolFamily\)](#getunconnectedsocket-4d9322b795e2)
- [getUnconnectedSocket\(ProtocolFamily\)](#getunconnectedsocket-2b37476a3a26)
- [registerCallback\(SocketFactoryCallback\)](#registercallback-6bd9f054044b)
- [wrapSocket\(Socket\)](#wrapsocket-52cbce4e91a6)

## Methods

### getSocket(InetAddress, int) <a href="#getsocket-60f7047e1210" id="getsocket-60f7047e1210"></a>

```java
public static java.net.Socket getSocket(
    java.net.InetAddress address,
    int port
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

Retrieve a socket connected to a specified destination

**Parameters**

- `java.net.InetAddress address` - The preferred address
- `int port` - The preferred port

**Returns:** the socket connection to iaddr, port

**Throws**

- `IOException`
- `ConfException`

### getSocket(Object, InetAddress, int) <a href="#getsocket-2fc4ed37c8ec" id="getsocket-2fc4ed37c8ec"></a>

```java
public static java.net.Socket getSocket(
    Object caller,
    java.net.InetAddress address,
    int port
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

Retrieve a socket connected to a specified destination

**Parameters**

- `Object caller` - The requestor object instance
- `java.net.InetAddress address` - The preferred address
- `int port` - The preferred port

**Returns:** the socket connection to iaddr, port

**Throws**

- `IOException`
- `ConfException`

**Deprecated:** Use [`getSocket(InetAddress, int)`](SocketFactory.md#getsocket-60f7047e1210).

### getSocket(Object, Socket) <a href="#getsocket-e33d64204891" id="getsocket-e33d64204891"></a>

```java
public static java.net.Socket getSocket(
    Object caller,
    java.net.Socket socket
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

Retrieve a socket connected to the same remote address as a
 given socket

**Parameters**

- `Object caller` - The requestor object instance
- `java.net.Socket socket` - The socket to base the new socket on

**Returns:** the resulting socket

**Deprecated:** Use [`getSocket(Socket)`](SocketFactory.md#getsocket-843c18d87453).

### getSocket(Object, SocketAddress) <a href="#getsocket-56f7f9efbb5e" id="getsocket-56f7f9efbb5e"></a>

```java
public static java.net.Socket getSocket(
    Object caller,
    java.net.SocketAddress address
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

Retrieve a socket connected to a specified address.

**Parameters**

- `Object caller` - The requestor object instance
- `java.net.SocketAddress address` - The address to connect to

**Returns:** the resulting socket

**Deprecated:** Use [`getSocket(SocketAddress)`](SocketFactory.md#getsocket-294002c373e6).

### getSocket(Object, String, int) <a href="#getsocket-716fbc8e8570" id="getsocket-716fbc8e8570"></a>

```java
public static java.net.Socket getSocket(
    Object caller,
    String hostname,
    int port
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

Retrieve a socket connected to a specified destination

**Parameters**

- `Object caller` - The requestor object instance
- `String hostname` - The preferred host
- `int port` - The preferred port

**Returns:** the socket connected to hostname, port

**Throws**

- `IOException`
- `ConfException`

**Deprecated:** Use [`getSocket(String, int)`](SocketFactory.md#getsocket-30dffcd0af21).

### getSocket(Socket) <a href="#getsocket-843c18d87453" id="getsocket-843c18d87453"></a>

```java
public static java.net.Socket getSocket(
    java.net.Socket socket
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

Retrieve a socket connected to the same remote address as a
 given socket

**Parameters**

- `java.net.Socket socket` - The socket to base the new socket on

**Returns:** the resulting socket

### getSocket(SocketAddress) <a href="#getsocket-294002c373e6" id="getsocket-294002c373e6"></a>

```java
public static java.net.Socket getSocket(
    java.net.SocketAddress address
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

Retrieve a socket connected to a specified address.

**Parameters**

- `java.net.SocketAddress address` - The address to connect to

**Returns:** the resulting socket

### getSocket(String, int) <a href="#getsocket-30dffcd0af21" id="getsocket-30dffcd0af21"></a>

```java
public static java.net.Socket getSocket(
    String hostname,
    int port
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

Retrieve a socket connected to a specified destination

**Parameters**

- `String hostname` - The preferred host
- `int port` - The preferred port

**Returns:** the socket connected to hostname, port

**Throws**

- `IOException`
- `ConfException`

### getSocketFactoryCb() <a href="#getsocketfactorycb-374cd9148ad9" id="getsocketfactorycb-374cd9148ad9"></a>

```java
public static com.tailf.conf.SocketFactoryCallback getSocketFactoryCb()
```

Types: [SocketFactoryCallback](SocketFactoryCallback.md#socketfactorycallback-4ebb017096f5)

Retrieve the SocketFactoryCallback. This always exists, if the user have
 not registered a callback this method will return a
 DefaultSocketFactoryCb instance

**Returns:** the current SocketFactoryCallback

### getUnconnectedSocket(Object, ProtocolFamily) <a href="#getunconnectedsocket-4d9322b795e2" id="getunconnectedsocket-4d9322b795e2"></a>

```java
public static java.net.Socket getUnconnectedSocket(
    Object caller,
    java.net.ProtocolFamily family
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

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

**Deprecated:** Use [`getUnconnectedSocket(ProtocolFamily)`](SocketFactory.md#getunconnectedsocket-2b37476a3a26).

### getUnconnectedSocket(ProtocolFamily) <a href="#getunconnectedsocket-2b37476a3a26" id="getunconnectedsocket-2b37476a3a26"></a>

```java
public static java.net.Socket getUnconnectedSocket(
    java.net.ProtocolFamily family
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

Retrieve an unconnected socket. Such socket can be used when e.g a
 bind() call is necessary before the connect() is performed.
 The connect() call is performed by the requestor.

**Parameters**

- `java.net.ProtocolFamily family` - The protocol family

**Returns:** An unconnected socket

**Throws**

- `IOException`
- `ConfException`

### registerCallback(SocketFactoryCallback) <a href="#registercallback-6bd9f054044b" id="registercallback-6bd9f054044b"></a>

```java
public static void registerCallback(com.tailf.conf.SocketFactoryCallback cb)
```

Types: [SocketFactoryCallback](SocketFactoryCallback.md#socketfactorycallback-4ebb017096f5)

Register a SocketFactoryCallback that will be responsible for all
 socket connection

**Parameters**

- `com.tailf.conf.SocketFactoryCallback cb` - SocketFactoryCallback instance

### wrapSocket(Socket) <a href="#wrapsocket-52cbce4e91a6" id="wrapsocket-52cbce4e91a6"></a>

```java
public static java.net.Socket wrapSocket(java.net.Socket socket)
```

Wrap an already connected socket. The default implementation
 will only return the given socket as is

**Parameters**

- `java.net.Socket socket` - The socket to wrap
