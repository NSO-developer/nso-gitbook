<a id="s-SocketFactoryCallback"></a>
# SocketFactoryCallback

```java
public interface com.tailf.conf.SocketFactoryCallback
```

Interface for user defined creation/wrapping of sockets.

## Members

**Methods**:

- [getSocket(Object, SocketAddress)](#s-getSocket)
- [getSocket(SocketAddress)](#s-getSocket-1)
- [getUnconnectedSocket(Object, ProtocolFamily)](#s-getUnconnectedSocket)
- [getUnconnectedSocket(ProtocolFamily)](#s-getUnconnectedSocket-1)
- [wrapSocket(Socket)](#s-wrapSocket)

## Methods

<a id="s-getSocket"></a>
### getSocket(Object, SocketAddress)

```java
public abstract java.net.Socket getSocket(
    Object caller,
    java.net.SocketAddress address
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

Retrieve a socket connected to a specified address

**Parameters**

- `Object caller` - The requestor object instance
- `java.net.SocketAddress address` - The address to connect to

**Returns:** the socket connected to address

**Throws**

- `IOException`
- `ConfException`

**Deprecated:** Use `#getSocket(SocketAddress)`.

<a id="s-getSocket-1"></a>
### getSocket(SocketAddress)

```java
public default java.net.Socket getSocket(
    java.net.SocketAddress address
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

Retrieve a socket connected to a specified address

**Parameters**

- `java.net.SocketAddress address` - The address to connect to

**Returns:** the socket connected to address

**Throws**

- `IOException`
- `ConfException`

<a id="s-getUnconnectedSocket"></a>
### getUnconnectedSocket(Object, ProtocolFamily)

```java
public abstract java.net.Socket getUnconnectedSocket(
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
public default java.net.Socket getUnconnectedSocket(
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

<a id="s-wrapSocket"></a>
### wrapSocket(Socket)

```java
public abstract java.net.Socket wrapSocket(java.net.Socket socket)
```

Wrap an already connected socket.

 NOTE: This method might be called for a socket that has
       already been wrapped.

**Parameters**

- `java.net.Socket socket` - The socket to wrap
