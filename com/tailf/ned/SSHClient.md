# SSHClient <a href="#cls-SSHClient" id="cls-SSHClient"></a>

```java
public interface com.tailf.ned.SSHClient
```

## Members

**Fields**:

- [AUTH_HOSTBASED](#m-AUTH_HOSTBASED)
- [AUTH_KEYBOARD_INTERACTIVE](#m-AUTH_KEYBOARD_INTERACTIVE)
- [AUTH_NONE](#m-AUTH_NONE)
- [AUTH_PASSWORD](#m-AUTH_PASSWORD)
- [AUTH_PUBLIC_KEY](#m-AUTH_PUBLIC_KEY)

**Methods**:

- [authenticate()](#m-authenticate-41c0007ddd8b)
- [authenticate(String[])](#m-authenticate-0a5a44636e08)
- [authenticate(String[], String, String)](#m-authenticate-cf9e8fb6d459)
- [clone(SSHClient)](#m-clone-6899e5cb4a18)
- [close()](#m-close-8107c6dc012b)
- [connect()](#m-connect-394043aad7af)
- [connect(int, int)](#m-connect-28d2385bf1c0)
- [connect(int, int, InetAddress, int)](#m-connect-3ed6ad461bcf)
- [createClient(NedWorker, NedConnectionBase)](#m-createClient-a7ede73e9e07)
- [createSCP()](#m-createSCP-ac5423466997)
- [createSession()](#m-createSession-57f0b0e31f12)
- [createSession(int, int)](#m-createSession-b35d82f6e733)
- [createSFTP()](#m-createSFTP-222ee1678abc)
- [createSubsystem(String)](#m-createSubsystem-2f3a0d6c84f0)
- [disableHostKeyVerification()](#m-disableHostKeyVerification-6d21c174124b)
- [getConnectionInfo()](#m-getConnectionInfo-72b270c75b17)
- [getProviderName()](#m-getProviderName-e8ad7190e853)
- [isAuthenticated()](#m-isAuthenticated-11159d3d38a6)
- [isConnected()](#m-isConnected-c00395001a3e)
- [setRemoteCharset(Charset)](#m-setRemoteCharset-6f11114c7330)
- [setTrafficClass(int)](#m-setTrafficClass-6ef3381655c9)
- [useCompression()](#m-useCompression-2016e4bae05f)

**Nested Types**:

- [CliSession](SSHClient/CliSession.md#cls-CliSession)
- [SecureFileTransfer](SSHClient/SecureFileTransfer.md#cls-SecureFileTransfer)
- [Subsystem](SSHClient/Subsystem.md#cls-Subsystem)

## Fields

### AUTH_HOSTBASED <a href="#m-AUTH_HOSTBASED" id="m-AUTH_HOSTBASED"></a>

```java
public static final String AUTH_HOSTBASED = "host-based";
```

### AUTH_KEYBOARD_INTERACTIVE <a href="#m-AUTH_KEYBOARD_INTERACTIVE" id="m-AUTH_KEYBOARD_INTERACTIVE"></a>

```java
public static final String AUTH_KEYBOARD_INTERACTIVE = "keyboard-interactive";
```

### AUTH_NONE <a href="#m-AUTH_NONE" id="m-AUTH_NONE"></a>

```java
public static final String AUTH_NONE = "none";
```

### AUTH_PASSWORD <a href="#m-AUTH_PASSWORD" id="m-AUTH_PASSWORD"></a>

```java
public static final String AUTH_PASSWORD = "password";
```

### AUTH_PUBLIC_KEY <a href="#m-AUTH_PUBLIC_KEY" id="m-AUTH_PUBLIC_KEY"></a>

```java
public static final String AUTH_PUBLIC_KEY = "pubkey";
```

Authentication methods available for negotiation


## Methods

### authenticate() <a href="#m-authenticate-41c0007ddd8b" id="m-authenticate-41c0007ddd8b"></a>

```java
public abstract void authenticate() throws java.io.IOException
```

Authenticate using the methods specified by NSO or from
 a cloned connection.

**Throws**

- `IOException`

### authenticate(String[]) <a href="#m-authenticate-0a5a44636e08" id="m-authenticate-0a5a44636e08"></a>

```java
public abstract void authenticate(String[] methods) throws java.io.IOException
```

Authenticate using a custom list of methods.

**Parameters**

- `String[] methods` - - Authentication methods to use in priority order.

**Throws**

- `IOException`

### authenticate(String[], String, String) <a href="#m-authenticate-cf9e8fb6d459" id="m-authenticate-cf9e8fb6d459"></a>

```java
public abstract void authenticate(
    String[] methods,
    String user,
    String password
)
    throws java.io.IOException
```

Authenticate using a custom list of methods, with explicitly
 configured authentication parameters.

**Parameters**

- `String[] methods` - - Authentication methods to use in priority order.
                  Set to null if the methods specified by NSO or
                  from a cloned connection shall be used.
- `String user` - - User
- `String password` - - Password

**Throws**

- `IOException`

### clone(SSHClient) <a href="#m-clone-6899e5cb4a18" id="m-clone-6899e5cb4a18"></a>

```java
public static com.tailf.ned.SSHClient clone(
    com.tailf.ned.SSHClient original
)
    throws java.io.IOException
```

Types: [SSHClient](SSHClient.md#cls-SSHClient)

Clone a new SSHClient instance from an existing instance.
 This method can be called without restrictions.

**Parameters**

- `com.tailf.ned.SSHClient original` - - The SSHClient to clone

**Returns:** A new SSHClient instance

**Throws**

- `IOException`

### close() <a href="#m-close-8107c6dc012b" id="m-close-8107c6dc012b"></a>

```java
public abstract void close() throws java.io.IOException
```

Close SSH connection

**Throws**

- `IOException`

### connect() <a href="#m-connect-394043aad7af" id="m-connect-394043aad7af"></a>

```java
public abstract void connect() throws java.io.IOException
```

Establish the SSH connection using default configuration or
 cloned setup.

**Throws**

- `IOException`

### connect(int, int) <a href="#m-connect-28d2385bf1c0" id="m-connect-28d2385bf1c0"></a>

```java
public abstract void connect(int connectTimeout, int idleTimeout) throws java.io.IOException
```

Establish the SSH connection with specific timeouts.

**Parameters**

- `int connectTimeout` - - Connect timeout
- `int idleTimeout` - - Idle timeout

**Throws**

- `IOException`

### connect(int, int, InetAddress, int) <a href="#m-connect-3ed6ad461bcf" id="m-connect-3ed6ad461bcf"></a>

```java
public abstract void connect(
    int connectTimeout,
    int idleTimeout,
    java.net.InetAddress address,
    int port
)
    throws java.io.IOException
```

Establish the SSH connection with timeout and address info specified.

**Parameters**

- `int connectTimeout` - - Connect timeout
- `int idleTimeout` - - Idle timeout
- `java.net.InetAddress address` - - Peer address
- `int port` - - Peer port

**Throws**

- `IOException`

### createClient(NedWorker, NedConnectionBase) <a href="#m-createClient-a7ede73e9e07" id="m-createClient-a7ede73e9e07"></a>

```java
public static com.tailf.ned.SSHClient createClient(
    com.tailf.ned.NedWorker worker,
    com.tailf.ned.NedConnectionBase ned
)
    throws java.io.IOException
```

Types: [SSHClient](SSHClient.md#cls-SSHClient), [NedWorker](NedWorker.md#cls-NedWorker), [NedConnectionBase](NedConnectionBase.md#cls-NedConnectionBase)

SSHClient default factory method. Instantiate a new SSH Client.
 This can only be done when the NED is in state connect.

**Parameters**

- `com.tailf.ned.NedWorker worker` - - The NED worker thread.
- `com.tailf.ned.NedConnectionBase ned` - - The NED instance

**Returns:** - SSHClient instance

**Throws**

- `IOException`

### createSCP() <a href="#m-createSCP-ac5423466997" id="m-createSCP-ac5423466997"></a>

```java
public abstract com.tailf.ned.SSHClient.SecureFileTransfer createSCP() throws java.io.IOException
```

Types: [SecureFileTransfer](SSHClient/SecureFileTransfer.md#cls-SecureFileTransfer)

Instantiate a SCP handler

**Returns:** SCP handler instance

**Throws**

- `IOException`

### createSession() <a href="#m-createSession-57f0b0e31f12" id="m-createSession-57f0b0e31f12"></a>

```java
public abstract com.tailf.ned.SSHClient.CliSession createSession() throws java.io.IOException
```

Types: [CliSession](SSHClient/CliSession.md#cls-CliSession)

Instantiate a CLI session, default settings

**Returns:** A ClI session instance

**Throws**

- `IOException`

### createSession(int, int) <a href="#m-createSession-b35d82f6e733" id="m-createSession-b35d82f6e733"></a>

```java
public abstract com.tailf.ned.SSHClient.CliSession createSession(
    int width,
    int height
)
    throws java.io.IOException
```

Types: [CliSession](SSHClient/CliSession.md#cls-CliSession)

Instantiate a CLI session with specific terminal size parameters

**Parameters**

- `int width` - - Terminal width
- `int height` - - Terminal height

**Returns:** A ClI session instance

**Throws**

- `IOException`

### createSFTP() <a href="#m-createSFTP-222ee1678abc" id="m-createSFTP-222ee1678abc"></a>

```java
public abstract com.tailf.ned.SSHClient.SecureFileTransfer createSFTP() throws java.io.IOException
```

Types: [SecureFileTransfer](SSHClient/SecureFileTransfer.md#cls-SecureFileTransfer)

Instantiate a SFTP handler

**Returns:** SFTP handler instance

**Throws**

- `IOException`

### createSubsystem(String) <a href="#m-createSubsystem-2f3a0d6c84f0" id="m-createSubsystem-2f3a0d6c84f0"></a>

```java
public abstract com.tailf.ned.SSHClient.Subsystem createSubsystem(
    String name
)
    throws java.io.IOException
```

Types: [Subsystem](SSHClient/Subsystem.md#cls-Subsystem)

Instantiate a subsystem, such as 'netconf'

**Parameters**

- `String name` - - Name of subsystem.

**Returns:** Subsystem instance

**Throws**

- `IOException`

### disableHostKeyVerification() <a href="#m-disableHostKeyVerification-6d21c174124b" id="m-disableHostKeyVerification-6d21c174124b"></a>

```java
public abstract void disableHostKeyVerification()
```

Explicitly disable host key checking on this connection-

### getConnectionInfo() <a href="#m-getConnectionInfo-72b270c75b17" id="m-getConnectionInfo-72b270c75b17"></a>

```java
public abstract String getConnectionInfo()
```

Get info about the negotiated algorithms etc used for the connection.
 Relevant only after connect.

**Returns:** A string with connection info

### getProviderName() <a href="#m-getProviderName-e8ad7190e853" id="m-getProviderName-e8ad7190e853"></a>

```java
public abstract String getProviderName()
```

Get name and version of underlying SSH implementation.

**Returns:** name and version

### isAuthenticated() <a href="#m-isAuthenticated-11159d3d38a6" id="m-isAuthenticated-11159d3d38a6"></a>

```java
public abstract boolean isAuthenticated()
```

Authentication status check

**Returns:** true | false

### isConnected() <a href="#m-isConnected-c00395001a3e" id="m-isConnected-c00395001a3e"></a>

```java
public abstract boolean isConnected()
```

Connection status check

**Returns:** true | false

### setRemoteCharset(Charset) <a href="#m-setRemoteCharset-6f11114c7330" id="m-setRemoteCharset-6f11114c7330"></a>

```java
public abstract void setRemoteCharset(java.nio.charset.Charset remoteCharset)
```

Set charset for sessions started from this connection

**Parameters**

- `java.nio.charset.Charset remoteCharset` - - Specified charset

### setTrafficClass(int) <a href="#m-setTrafficClass-6ef3381655c9" id="m-setTrafficClass-6ef3381655c9"></a>

```java
public abstract void setTrafficClass(int tc) throws java.net.SocketException
```

Set traffic class on the socket used by the SSH client.

**Parameters**

- `int tc` - - Traffic class

**Throws**

- `SocketException`

### useCompression() <a href="#m-useCompression-2016e4bae05f" id="m-useCompression-2016e4bae05f"></a>

```java
public abstract void useCompression() throws java.io.IOException
```

Enable compression on the SSH channel

**Throws**

- `IOException`


## Nested Types

- [CliSession](SSHClient/CliSession.md#cls-CliSession)
- [SecureFileTransfer](SSHClient/SecureFileTransfer.md#cls-SecureFileTransfer)
- [Subsystem](SSHClient/Subsystem.md#cls-Subsystem)
