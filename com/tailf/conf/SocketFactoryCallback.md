# SocketFactoryCallback <a href="#cls-SocketFactoryCallback" id="cls-SocketFactoryCallback"></a>

```java
public interface com.tailf.conf.SocketFactoryCallback
```

Interface for user defined creation/wrapping of sockets.

## Members

**Methods**:

- [getSocket(Object, SocketAddress)](#m-getSocket-56f7f9efbb5e)
- [getSocket(SocketAddress)](#m-getSocket-294002c373e6)
- [getUnconnectedSocket(Object, ProtocolFamily)](#m-getUnconnectedSocket-4d9322b795e2)
- [getUnconnectedSocket(ProtocolFamily)](#m-getUnconnectedSocket-2b37476a3a26)
- [wrapSocket(Socket)](#m-wrapSocket-52cbce4e91a6)

## Methods

### getSocket(Object, SocketAddress) <a href="#m-getSocket-56f7f9efbb5e" id="m-getSocket-56f7f9efbb5e"></a>

```java
public abstract java.net.Socket getSocket(
    Object caller,
    java.net.SocketAddress address
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Retrieve a socket connected to a specified address

**Parameters**

- `Object caller` - The requestor object instance
- `java.net.SocketAddress address` - The address to connect to

**Returns:** the socket connected to address

**Throws**

- `IOException`
- `ConfException`

**Deprecated:** Use [`getSocket(SocketAddress)`](SocketFactoryCallback.md#m-getSocket-294002c373e6).

### getSocket(SocketAddress) <a href="#m-getSocket-294002c373e6" id="m-getSocket-294002c373e6"></a>

```java
public default java.net.Socket getSocket(
    java.net.SocketAddress address
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Retrieve a socket connected to a specified address

**Parameters**

- `java.net.SocketAddress address` - The address to connect to

**Returns:** the socket connected to address

**Throws**

- `IOException`
- `ConfException`

### getUnconnectedSocket(Object, ProtocolFamily) <a href="#m-getUnconnectedSocket-4d9322b795e2" id="m-getUnconnectedSocket-4d9322b795e2"></a>

```java
public abstract java.net.Socket getUnconnectedSocket(
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

**Deprecated:** Use [`getUnconnectedSocket(ProtocolFamily)`](SocketFactoryCallback.md#m-getUnconnectedSocket-2b37476a3a26).

### getUnconnectedSocket(ProtocolFamily) <a href="#m-getUnconnectedSocket-2b37476a3a26" id="m-getUnconnectedSocket-2b37476a3a26"></a>

```java
public default java.net.Socket getUnconnectedSocket(
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

### wrapSocket(Socket) <a href="#m-wrapSocket-52cbce4e91a6" id="m-wrapSocket-52cbce4e91a6"></a>

```java
public abstract java.net.Socket wrapSocket(java.net.Socket socket)
```

Wrap an already connected socket.

 NOTE: This method might be called for a socket that has
       already been wrapped.

**Parameters**

- `java.net.Socket socket` - The socket to wrap
