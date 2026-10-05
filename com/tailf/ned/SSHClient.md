# SSHClient <a href="#sshclient-f4dbfb53c66b" id="sshclient-f4dbfb53c66b"></a>

```java
public interface com.tailf.ned.SSHClient
```

## Members

**Fields**:

- [AUTH\_HOSTBASED](#auth_hostbased-c6a671f0f224)
- [AUTH\_KEYBOARD\_INTERACTIVE](#auth_keyboard_interactive-768b4a794353)
- [AUTH\_NONE](#auth_none-029b3d1645d6)
- [AUTH\_PASSWORD](#auth_password-3076e602ee35)
- [AUTH\_PUBLIC\_KEY](#auth_public_key-3e68515cb9a2)

**Methods**:

- [authenticate\(\)](#authenticate-41c0007ddd8b)
- [authenticate\(String\[\]\)](#authenticate-0a5a44636e08)
- [authenticate\(String\[\], String, String\)](#authenticate-cf9e8fb6d459)
- [clone\(SSHClient\)](#clone-6899e5cb4a18)
- [close\(\)](#close-8107c6dc012b)
- [connect\(\)](#connect-394043aad7af)
- [connect\(int, int\)](#connect-28d2385bf1c0)
- [connect\(int, int, InetAddress, int\)](#connect-3ed6ad461bcf)
- [createClient\(NedWorker, NedConnectionBase\)](#createclient-a7ede73e9e07)
- [createSCP\(\)](#createscp-ac5423466997)
- [createSession\(\)](#createsession-57f0b0e31f12)
- [createSession\(int, int\)](#createsession-b35d82f6e733)
- [createSFTP\(\)](#createsftp-222ee1678abc)
- [createSubsystem\(String\)](#createsubsystem-2f3a0d6c84f0)
- [disableHostKeyVerification\(\)](#disablehostkeyverification-6d21c174124b)
- [getConnectionInfo\(\)](#getconnectioninfo-72b270c75b17)
- [getProviderName\(\)](#getprovidername-e8ad7190e853)
- [isAuthenticated\(\)](#isauthenticated-11159d3d38a6)
- [isConnected\(\)](#isconnected-c00395001a3e)
- [setRemoteCharset\(Charset\)](#setremotecharset-6f11114c7330)
- [setTrafficClass\(int\)](#settrafficclass-6ef3381655c9)
- [useCompression\(\)](#usecompression-2016e4bae05f)

**Nested Types**:

- [CliSession](SSHClient/CliSession.md#clisession-1e55c4457237)
- [SecureFileTransfer](SSHClient/SecureFileTransfer.md#securefiletransfer-49298c7c6f54)
- [Subsystem](SSHClient/Subsystem.md#subsystem-513eac57ded0)

## Fields

### AUTH_HOSTBASED <a href="#auth_hostbased-c6a671f0f224" id="auth_hostbased-c6a671f0f224"></a>

```java
public static final String AUTH_HOSTBASED = "host-based";
```

### AUTH_KEYBOARD_INTERACTIVE <a href="#auth_keyboard_interactive-768b4a794353" id="auth_keyboard_interactive-768b4a794353"></a>

```java
public static final String AUTH_KEYBOARD_INTERACTIVE = "keyboard-interactive";
```

### AUTH_NONE <a href="#auth_none-029b3d1645d6" id="auth_none-029b3d1645d6"></a>

```java
public static final String AUTH_NONE = "none";
```

### AUTH_PASSWORD <a href="#auth_password-3076e602ee35" id="auth_password-3076e602ee35"></a>

```java
public static final String AUTH_PASSWORD = "password";
```

### AUTH_PUBLIC_KEY <a href="#auth_public_key-3e68515cb9a2" id="auth_public_key-3e68515cb9a2"></a>

```java
public static final String AUTH_PUBLIC_KEY = "pubkey";
```

Authentication methods available for negotiation


## Methods

### authenticate() <a href="#authenticate-41c0007ddd8b" id="authenticate-41c0007ddd8b"></a>

```java
public abstract void authenticate() throws java.io.IOException
```

Authenticate using the methods specified by NSO or from
 a cloned connection.

**Throws**

- `IOException`

### authenticate(String[]) <a href="#authenticate-0a5a44636e08" id="authenticate-0a5a44636e08"></a>

```java
public abstract void authenticate(String[] methods) throws java.io.IOException
```

Authenticate using a custom list of methods.

**Parameters**

- `String[] methods` - - Authentication methods to use in priority order.

**Throws**

- `IOException`

### authenticate(String[], String, String) <a href="#authenticate-cf9e8fb6d459" id="authenticate-cf9e8fb6d459"></a>

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

### clone(SSHClient) <a href="#clone-6899e5cb4a18" id="clone-6899e5cb4a18"></a>

```java
public static com.tailf.ned.SSHClient clone(
    com.tailf.ned.SSHClient original
)
    throws java.io.IOException
```

Types: [SSHClient](SSHClient.md#sshclient-f4dbfb53c66b)

Clone a new SSHClient instance from an existing instance.
 This method can be called without restrictions.

**Parameters**

- `com.tailf.ned.SSHClient original` - - The SSHClient to clone

**Returns:** A new SSHClient instance

**Throws**

- `IOException`

### close() <a href="#close-8107c6dc012b" id="close-8107c6dc012b"></a>

```java
public abstract void close() throws java.io.IOException
```

Close SSH connection

**Throws**

- `IOException`

### connect() <a href="#connect-394043aad7af" id="connect-394043aad7af"></a>

```java
public abstract void connect() throws java.io.IOException
```

Establish the SSH connection using default configuration or
 cloned setup.

**Throws**

- `IOException`

### connect(int, int) <a href="#connect-28d2385bf1c0" id="connect-28d2385bf1c0"></a>

```java
public abstract void connect(int connectTimeout, int idleTimeout) throws java.io.IOException
```

Establish the SSH connection with specific timeouts.

**Parameters**

- `int connectTimeout` - - Connect timeout
- `int idleTimeout` - - Idle timeout

**Throws**

- `IOException`

### connect(int, int, InetAddress, int) <a href="#connect-3ed6ad461bcf" id="connect-3ed6ad461bcf"></a>

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

### createClient(NedWorker, NedConnectionBase) <a href="#createclient-a7ede73e9e07" id="createclient-a7ede73e9e07"></a>

```java
public static com.tailf.ned.SSHClient createClient(
    com.tailf.ned.NedWorker worker,
    com.tailf.ned.NedConnectionBase ned
)
    throws java.io.IOException
```

Types: [SSHClient](SSHClient.md#sshclient-f4dbfb53c66b), [NedWorker](NedWorker.md#nedworker-b063de7c0998), [NedConnectionBase](NedConnectionBase.md#nedconnectionbase-3139efb66faf)

SSHClient default factory method. Instantiate a new SSH Client.
 This can only be done when the NED is in state connect.

**Parameters**

- `com.tailf.ned.NedWorker worker` - - The NED worker thread.
- `com.tailf.ned.NedConnectionBase ned` - - The NED instance

**Returns:** - SSHClient instance

**Throws**

- `IOException`

### createSCP() <a href="#createscp-ac5423466997" id="createscp-ac5423466997"></a>

```java
public abstract com.tailf.ned.SSHClient.SecureFileTransfer createSCP() throws java.io.IOException
```

Types: [SecureFileTransfer](SSHClient/SecureFileTransfer.md#securefiletransfer-49298c7c6f54)

Instantiate a SCP handler

**Returns:** SCP handler instance

**Throws**

- `IOException`

### createSession() <a href="#createsession-57f0b0e31f12" id="createsession-57f0b0e31f12"></a>

```java
public abstract com.tailf.ned.SSHClient.CliSession createSession() throws java.io.IOException
```

Types: [CliSession](SSHClient/CliSession.md#clisession-1e55c4457237)

Instantiate a CLI session, default settings

**Returns:** A ClI session instance

**Throws**

- `IOException`

### createSession(int, int) <a href="#createsession-b35d82f6e733" id="createsession-b35d82f6e733"></a>

```java
public abstract com.tailf.ned.SSHClient.CliSession createSession(
    int width,
    int height
)
    throws java.io.IOException
```

Types: [CliSession](SSHClient/CliSession.md#clisession-1e55c4457237)

Instantiate a CLI session with specific terminal size parameters

**Parameters**

- `int width` - - Terminal width
- `int height` - - Terminal height

**Returns:** A ClI session instance

**Throws**

- `IOException`

### createSFTP() <a href="#createsftp-222ee1678abc" id="createsftp-222ee1678abc"></a>

```java
public abstract com.tailf.ned.SSHClient.SecureFileTransfer createSFTP() throws java.io.IOException
```

Types: [SecureFileTransfer](SSHClient/SecureFileTransfer.md#securefiletransfer-49298c7c6f54)

Instantiate a SFTP handler

**Returns:** SFTP handler instance

**Throws**

- `IOException`

### createSubsystem(String) <a href="#createsubsystem-2f3a0d6c84f0" id="createsubsystem-2f3a0d6c84f0"></a>

```java
public abstract com.tailf.ned.SSHClient.Subsystem createSubsystem(
    String name
)
    throws java.io.IOException
```

Types: [Subsystem](SSHClient/Subsystem.md#subsystem-513eac57ded0)

Instantiate a subsystem, such as 'netconf'

**Parameters**

- `String name` - - Name of subsystem.

**Returns:** Subsystem instance

**Throws**

- `IOException`

### disableHostKeyVerification() <a href="#disablehostkeyverification-6d21c174124b" id="disablehostkeyverification-6d21c174124b"></a>

```java
public abstract void disableHostKeyVerification()
```

Explicitly disable host key checking on this connection-

### getConnectionInfo() <a href="#getconnectioninfo-72b270c75b17" id="getconnectioninfo-72b270c75b17"></a>

```java
public abstract String getConnectionInfo()
```

Get info about the negotiated algorithms etc used for the connection.
 Relevant only after connect.

**Returns:** A string with connection info

### getProviderName() <a href="#getprovidername-e8ad7190e853" id="getprovidername-e8ad7190e853"></a>

```java
public abstract String getProviderName()
```

Get name and version of underlying SSH implementation.

**Returns:** name and version

### isAuthenticated() <a href="#isauthenticated-11159d3d38a6" id="isauthenticated-11159d3d38a6"></a>

```java
public abstract boolean isAuthenticated()
```

Authentication status check

**Returns:** true | false

### isConnected() <a href="#isconnected-c00395001a3e" id="isconnected-c00395001a3e"></a>

```java
public abstract boolean isConnected()
```

Connection status check

**Returns:** true | false

### setRemoteCharset(Charset) <a href="#setremotecharset-6f11114c7330" id="setremotecharset-6f11114c7330"></a>

```java
public abstract void setRemoteCharset(java.nio.charset.Charset remoteCharset)
```

Set charset for sessions started from this connection

**Parameters**

- `java.nio.charset.Charset remoteCharset` - - Specified charset

### setTrafficClass(int) <a href="#settrafficclass-6ef3381655c9" id="settrafficclass-6ef3381655c9"></a>

```java
public abstract void setTrafficClass(int tc) throws java.net.SocketException
```

Set traffic class on the socket used by the SSH client.

**Parameters**

- `int tc` - - Traffic class

**Throws**

- `SocketException`

### useCompression() <a href="#usecompression-2016e4bae05f" id="usecompression-2016e4bae05f"></a>

```java
public abstract void useCompression() throws java.io.IOException
```

Enable compression on the SSH channel

**Throws**

- `IOException`


## Nested Types

- [CliSession](SSHClient/CliSession.md#clisession-1e55c4457237)
- [SecureFileTransfer](SSHClient/SecureFileTransfer.md#securefiletransfer-49298c7c6f54)
- [Subsystem](SSHClient/Subsystem.md#subsystem-513eac57ded0)
