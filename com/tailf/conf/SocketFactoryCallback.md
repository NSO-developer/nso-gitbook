<a id="cls-SocketFactoryCallback"></a>
# SocketFactoryCallback

```java
public interface com.tailf.conf.SocketFactoryCallback
```

Interface for user defined creation/wrapping of sockets.

## Members

**Methods**:

- [getSocket(Object, SocketAddress)](#m-getsocket-56f7f9efbb5e)
- [getSocket(SocketAddress)](#m-getsocket-294002c373e6)
- [getUnconnectedSocket(Object, ProtocolFamily)](#m-getunconnectedsocket-4d9322b795e2)
- [getUnconnectedSocket(ProtocolFamily)](#m-getunconnectedsocket-2b37476a3a26)
- [wrapSocket(Socket)](#m-wrapsocket-52cbce4e91a6)

## Methods

<a id="m-getsocket-56f7f9efbb5e"></a>
### getSocket(Object, SocketAddress)

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

**Deprecated:** Use `#getSocket(SocketAddress)`.

<a id="m-getsocket-294002c373e6"></a>
### getSocket(SocketAddress)

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

<a id="m-getunconnectedsocket-4d9322b795e2"></a>
### getUnconnectedSocket(Object, ProtocolFamily)

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

**Deprecated:** Use `#getUnconnectedSocket(ProtocolFamily)`.

<a id="m-getunconnectedsocket-2b37476a3a26"></a>
### getUnconnectedSocket(ProtocolFamily)

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

<a id="m-wrapsocket-52cbce4e91a6"></a>
### wrapSocket(Socket)

```java
public abstract java.net.Socket wrapSocket(java.net.Socket socket)
```

Wrap an already connected socket.

 NOTE: This method might be called for a socket that has
       already been wrapped.

**Parameters**

- `java.net.Socket socket` - The socket to wrap
