<a id="cls-SSHClient"></a>
# SSHClient

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
- [createClient(NedWorker, NedConnectionBase)](#m-createclient-a7ede73e9e07)
- [createSCP()](#m-createscp-ac5423466997)
- [createSession()](#m-createsession-57f0b0e31f12)
- [createSession(int, int)](#m-createsession-b35d82f6e733)
- [createSFTP()](#m-createsftp-222ee1678abc)
- [createSubsystem(String)](#m-createsubsystem-2f3a0d6c84f0)
- [disableHostKeyVerification()](#m-disablehostkeyverification-6d21c174124b)
- [getConnectionInfo()](#m-getconnectioninfo-72b270c75b17)
- [getProviderName()](#m-getprovidername-e8ad7190e853)
- [isAuthenticated()](#m-isauthenticated-11159d3d38a6)
- [isConnected()](#m-isconnected-c00395001a3e)
- [setRemoteCharset(Charset)](#m-setremotecharset-6f11114c7330)
- [setTrafficClass(int)](#m-settrafficclass-6ef3381655c9)
- [useCompression()](#m-usecompression-2016e4bae05f)

**Nested Types**:

- [CliSession](SSHClient/CliSession.md#cls-CliSession)
- [SecureFileTransfer](SSHClient/SecureFileTransfer.md#cls-SecureFileTransfer)
- [Subsystem](SSHClient/Subsystem.md#cls-Subsystem)

## Fields

<a id="m-AUTH_HOSTBASED"></a>
### AUTH_HOSTBASED

```java
public static final String AUTH_HOSTBASED = "host-based";
```

<a id="m-AUTH_KEYBOARD_INTERACTIVE"></a>
### AUTH_KEYBOARD_INTERACTIVE

```java
public static final String AUTH_KEYBOARD_INTERACTIVE = "keyboard-interactive";
```

<a id="m-AUTH_NONE"></a>
### AUTH_NONE

```java
public static final String AUTH_NONE = "none";
```

<a id="m-AUTH_PASSWORD"></a>
### AUTH_PASSWORD

```java
public static final String AUTH_PASSWORD = "password";
```

<a id="m-AUTH_PUBLIC_KEY"></a>
### AUTH_PUBLIC_KEY

```java
public static final String AUTH_PUBLIC_KEY = "pubkey";
```

Authentication methods available for negotiation


## Methods

<a id="m-authenticate-41c0007ddd8b"></a>
### authenticate()

```java
public abstract void authenticate() throws java.io.IOException
```

Authenticate using the methods specified by NSO or from
 a cloned connection.

**Throws**

- `IOException`

<a id="m-authenticate-0a5a44636e08"></a>
### authenticate(String[])

```java
public abstract void authenticate(String[] methods) throws java.io.IOException
```

Authenticate using a custom list of methods.

**Parameters**

- `String[] methods` - - Authentication methods to use in priority order.

**Throws**

- `IOException`

<a id="m-authenticate-cf9e8fb6d459"></a>
### authenticate(String[], String, String)

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

<a id="m-clone-6899e5cb4a18"></a>
### clone(SSHClient)

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

<a id="m-close-8107c6dc012b"></a>
### close()

```java
public abstract void close() throws java.io.IOException
```

Close SSH connection

**Throws**

- `IOException`

<a id="m-connect-394043aad7af"></a>
### connect()

```java
public abstract void connect() throws java.io.IOException
```

Establish the SSH connection using default configuration or
 cloned setup.

**Throws**

- `IOException`

<a id="m-connect-28d2385bf1c0"></a>
### connect(int, int)

```java
public abstract void connect(int connectTimeout, int idleTimeout) throws java.io.IOException
```

Establish the SSH connection with specific timeouts.

**Parameters**

- `int connectTimeout` - - Connect timeout
- `int idleTimeout` - - Idle timeout

**Throws**

- `IOException`

<a id="m-connect-3ed6ad461bcf"></a>
### connect(int, int, InetAddress, int)

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

<a id="m-createclient-a7ede73e9e07"></a>
### createClient(NedWorker, NedConnectionBase)

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

<a id="m-createscp-ac5423466997"></a>
### createSCP()

```java
public abstract com.tailf.ned.SSHClient.SecureFileTransfer createSCP() throws java.io.IOException
```

Types: [SecureFileTransfer](SSHClient/SecureFileTransfer.md#cls-SecureFileTransfer)

Instantiate a SCP handler

**Returns:** SCP handler instance

**Throws**

- `IOException`

<a id="m-createsession-57f0b0e31f12"></a>
### createSession()

```java
public abstract com.tailf.ned.SSHClient.CliSession createSession() throws java.io.IOException
```

Types: [CliSession](SSHClient/CliSession.md#cls-CliSession)

Instantiate a CLI session, default settings

**Returns:** A ClI session instance

**Throws**

- `IOException`

<a id="m-createsession-b35d82f6e733"></a>
### createSession(int, int)

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

<a id="m-createsftp-222ee1678abc"></a>
### createSFTP()

```java
public abstract com.tailf.ned.SSHClient.SecureFileTransfer createSFTP() throws java.io.IOException
```

Types: [SecureFileTransfer](SSHClient/SecureFileTransfer.md#cls-SecureFileTransfer)

Instantiate a SFTP handler

**Returns:** SFTP handler instance

**Throws**

- `IOException`

<a id="m-createsubsystem-2f3a0d6c84f0"></a>
### createSubsystem(String)

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

<a id="m-disablehostkeyverification-6d21c174124b"></a>
### disableHostKeyVerification()

```java
public abstract void disableHostKeyVerification()
```

Explicitly disable host key checking on this connection-

<a id="m-getconnectioninfo-72b270c75b17"></a>
### getConnectionInfo()

```java
public abstract String getConnectionInfo()
```

Get info about the negotiated algorithms etc used for the connection.
 Relevant only after connect.

**Returns:** A string with connection info

<a id="m-getprovidername-e8ad7190e853"></a>
### getProviderName()

```java
public abstract String getProviderName()
```

Get name and version of underlying SSH implementation.

**Returns:** name and version

<a id="m-isauthenticated-11159d3d38a6"></a>
### isAuthenticated()

```java
public abstract boolean isAuthenticated()
```

Authentication status check

**Returns:** true | false

<a id="m-isconnected-c00395001a3e"></a>
### isConnected()

```java
public abstract boolean isConnected()
```

Connection status check

**Returns:** true | false

<a id="m-setremotecharset-6f11114c7330"></a>
### setRemoteCharset(Charset)

```java
public abstract void setRemoteCharset(java.nio.charset.Charset remoteCharset)
```

Set charset for sessions started from this connection

**Parameters**

- `java.nio.charset.Charset remoteCharset` - - Specified charset

<a id="m-settrafficclass-6ef3381655c9"></a>
### setTrafficClass(int)

```java
public abstract void setTrafficClass(int tc) throws java.net.SocketException
```

Set traffic class on the socket used by the SSH client.

**Parameters**

- `int tc` - - Traffic class

**Throws**

- `SocketException`

<a id="m-usecompression-2016e4bae05f"></a>
### useCompression()

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
