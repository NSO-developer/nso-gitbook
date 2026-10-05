# SocketFactoryCallback <a href="#socketfactorycallback-4ebb017096f5" id="socketfactorycallback-4ebb017096f5"></a>

```java
public interface com.tailf.conf.SocketFactoryCallback
```

Interface for user defined creation/wrapping of sockets.

## Members

**Methods**:

- [getSocket(Object, SocketAddress)](#getsocket-56f7f9efbb5e)
- [getSocket(SocketAddress)](#getsocket-294002c373e6)
- [getUnconnectedSocket(Object, ProtocolFamily)](#getunconnectedsocket-4d9322b795e2)
- [getUnconnectedSocket(ProtocolFamily)](#getunconnectedsocket-2b37476a3a26)
- [wrapSocket(Socket)](#wrapsocket-52cbce4e91a6)

## Methods

### getSocket(Object, SocketAddress) <a href="#getsocket-56f7f9efbb5e" id="getsocket-56f7f9efbb5e"></a>

```java
public abstract java.net.Socket getSocket(
    Object caller,
    java.net.SocketAddress address
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

Retrieve a socket connected to a specified address

**Parameters**

- `Object caller` - The requestor object instance
- `java.net.SocketAddress address` - The address to connect to

**Returns:** the socket connected to address

**Throws**

- `IOException`
- `ConfException`

**Deprecated:** Use [`getSocket(SocketAddress)`](SocketFactoryCallback.md#getsocket-294002c373e6).

### getSocket(SocketAddress) <a href="#getsocket-294002c373e6" id="getsocket-294002c373e6"></a>

```java
public default java.net.Socket getSocket(
    java.net.SocketAddress address
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

Retrieve a socket connected to a specified address

**Parameters**

- `java.net.SocketAddress address` - The address to connect to

**Returns:** the socket connected to address

**Throws**

- `IOException`
- `ConfException`

### getUnconnectedSocket(Object, ProtocolFamily) <a href="#getunconnectedsocket-4d9322b795e2" id="getunconnectedsocket-4d9322b795e2"></a>

```java
public abstract java.net.Socket getUnconnectedSocket(
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

**Deprecated:** Use [`getUnconnectedSocket(ProtocolFamily)`](SocketFactoryCallback.md#getunconnectedsocket-2b37476a3a26).

### getUnconnectedSocket(ProtocolFamily) <a href="#getunconnectedsocket-2b37476a3a26" id="getunconnectedsocket-2b37476a3a26"></a>

```java
public default java.net.Socket getUnconnectedSocket(
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

### wrapSocket(Socket) <a href="#wrapsocket-52cbce4e91a6" id="wrapsocket-52cbce4e91a6"></a>

```java
public abstract java.net.Socket wrapSocket(java.net.Socket socket)
```

Wrap an already connected socket.

 NOTE: This method might be called for a socket that has
       already been wrapped.

**Parameters**

- `java.net.Socket socket` - The socket to wrap
