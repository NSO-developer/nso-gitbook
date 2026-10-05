<a id="s-SSHClient"></a>
# SSHClient

```java
public interface com.tailf.ned.SSHClient
```

## Members

**Fields**:

- [AUTH_HOSTBASED](#s-AUTH_HOSTBASED)
- [AUTH_KEYBOARD_INTERACTIVE](#s-AUTH_KEYBOARD_INTERACTIVE)
- [AUTH_NONE](#s-AUTH_NONE)
- [AUTH_PASSWORD](#s-AUTH_PASSWORD)
- [AUTH_PUBLIC_KEY](#s-AUTH_PUBLIC_KEY)

**Methods**:

- [authenticate()](#s-authenticate)
- [authenticate(String[])](#s-authenticate-1)
- [authenticate(String[], String, String)](#s-authenticate-2)
- [clone(SSHClient)](#s-clone)
- [close()](#s-close)
- [connect()](#s-connect)
- [connect(int, int)](#s-connect-1)
- [connect(int, int, InetAddress, int)](#s-connect-2)
- [createClient(NedWorker, NedConnectionBase)](#s-createClient)
- [createSCP()](#s-createSCP)
- [createSession()](#s-createSession)
- [createSession(int, int)](#s-createSession-1)
- [createSFTP()](#s-createSFTP)
- [createSubsystem(String)](#s-createSubsystem)
- [disableHostKeyVerification()](#s-disableHostKeyVerification)
- [getConnectionInfo()](#s-getConnectionInfo)
- [getProviderName()](#s-getProviderName)
- [isAuthenticated()](#s-isAuthenticated)
- [isConnected()](#s-isConnected)
- [setRemoteCharset(Charset)](#s-setRemoteCharset)
- [setTrafficClass(int)](#s-setTrafficClass)
- [useCompression()](#s-useCompression)

**Nested Types**:

- [CliSession](SSHClient/CliSession.md#s-CliSession)
- [SecureFileTransfer](SSHClient/SecureFileTransfer.md#s-SecureFileTransfer)
- [Subsystem](SSHClient/Subsystem.md#s-Subsystem)

## Fields

<a id="s-AUTH_HOSTBASED"></a>
### AUTH_HOSTBASED

```java
public static final String AUTH_HOSTBASED = "host-based";
```

<a id="s-AUTH_KEYBOARD_INTERACTIVE"></a>
### AUTH_KEYBOARD_INTERACTIVE

```java
public static final String AUTH_KEYBOARD_INTERACTIVE = "keyboard-interactive";
```

<a id="s-AUTH_NONE"></a>
### AUTH_NONE

```java
public static final String AUTH_NONE = "none";
```

<a id="s-AUTH_PASSWORD"></a>
### AUTH_PASSWORD

```java
public static final String AUTH_PASSWORD = "password";
```

<a id="s-AUTH_PUBLIC_KEY"></a>
### AUTH_PUBLIC_KEY

```java
public static final String AUTH_PUBLIC_KEY = "pubkey";
```

Authentication methods available for negotiation


## Methods

<a id="s-authenticate"></a>
### authenticate()

```java
public abstract void authenticate() throws java.io.IOException
```

Authenticate using the methods specified by NSO or from
 a cloned connection.

**Throws**

- `IOException`

<a id="s-authenticate-1"></a>
### authenticate(String[])

```java
public abstract void authenticate(String[] methods) throws java.io.IOException
```

Authenticate using a custom list of methods.

**Parameters**

- `String[] methods` - - Authentication methods to use in priority order.

**Throws**

- `IOException`

<a id="s-authenticate-2"></a>
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

<a id="s-clone"></a>
### clone(SSHClient)

```java
public static com.tailf.ned.SSHClient clone(
    com.tailf.ned.SSHClient original
)
    throws java.io.IOException
```

Types: [SSHClient](SSHClient.md#s-SSHClient)

Clone a new SSHClient instance from an existing instance.
 This method can be called without restrictions.

**Parameters**

- `com.tailf.ned.SSHClient original` - - The SSHClient to clone

**Returns:** A new SSHClient instance

**Throws**

- `IOException`

<a id="s-close"></a>
### close()

```java
public abstract void close() throws java.io.IOException
```

Close SSH connection

**Throws**

- `IOException`

<a id="s-connect"></a>
### connect()

```java
public abstract void connect() throws java.io.IOException
```

Establish the SSH connection using default configuration or
 cloned setup.

**Throws**

- `IOException`

<a id="s-connect-1"></a>
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

<a id="s-connect-2"></a>
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

<a id="s-createClient"></a>
### createClient(NedWorker, NedConnectionBase)

```java
public static com.tailf.ned.SSHClient createClient(
    com.tailf.ned.NedWorker worker,
    com.tailf.ned.NedConnectionBase ned
)
    throws java.io.IOException
```

Types: [SSHClient](SSHClient.md#s-SSHClient), [NedWorker](NedWorker.md#s-NedWorker), [NedConnectionBase](NedConnectionBase.md#s-NedConnectionBase)

SSHClient default factory method. Instantiate a new SSH Client.
 This can only be done when the NED is in state connect.

**Parameters**

- `com.tailf.ned.NedWorker worker` - - The NED worker thread.
- `com.tailf.ned.NedConnectionBase ned` - - The NED instance

**Returns:** - SSHClient instance

**Throws**

- `IOException`

<a id="s-createSCP"></a>
### createSCP()

```java
public abstract com.tailf.ned.SSHClient.SecureFileTransfer createSCP() throws java.io.IOException
```

Types: [SecureFileTransfer](SSHClient/SecureFileTransfer.md#s-SecureFileTransfer)

Instantiate a SCP handler

**Returns:** SCP handler instance

**Throws**

- `IOException`

<a id="s-createSession"></a>
### createSession()

```java
public abstract com.tailf.ned.SSHClient.CliSession createSession() throws java.io.IOException
```

Types: [CliSession](SSHClient/CliSession.md#s-CliSession)

Instantiate a CLI session, default settings

**Returns:** A ClI session instance

**Throws**

- `IOException`

<a id="s-createSession-1"></a>
### createSession(int, int)

```java
public abstract com.tailf.ned.SSHClient.CliSession createSession(
    int width,
    int height
)
    throws java.io.IOException
```

Types: [CliSession](SSHClient/CliSession.md#s-CliSession)

Instantiate a CLI session with specific terminal size parameters

**Parameters**

- `int width` - - Terminal width
- `int height` - - Terminal height

**Returns:** A ClI session instance

**Throws**

- `IOException`

<a id="s-createSFTP"></a>
### createSFTP()

```java
public abstract com.tailf.ned.SSHClient.SecureFileTransfer createSFTP() throws java.io.IOException
```

Types: [SecureFileTransfer](SSHClient/SecureFileTransfer.md#s-SecureFileTransfer)

Instantiate a SFTP handler

**Returns:** SFTP handler instance

**Throws**

- `IOException`

<a id="s-createSubsystem"></a>
### createSubsystem(String)

```java
public abstract com.tailf.ned.SSHClient.Subsystem createSubsystem(
    String name
)
    throws java.io.IOException
```

Types: [Subsystem](SSHClient/Subsystem.md#s-Subsystem)

Instantiate a subsystem, such as 'netconf'

**Parameters**

- `String name` - - Name of subsystem.

**Returns:** Subsystem instance

**Throws**

- `IOException`

<a id="s-disableHostKeyVerification"></a>
### disableHostKeyVerification()

```java
public abstract void disableHostKeyVerification()
```

Explicitly disable host key checking on this connection-

<a id="s-getConnectionInfo"></a>
### getConnectionInfo()

```java
public abstract String getConnectionInfo()
```

Get info about the negotiated algorithms etc used for the connection.
 Relevant only after connect.

**Returns:** A string with connection info

<a id="s-getProviderName"></a>
### getProviderName()

```java
public abstract String getProviderName()
```

Get name and version of underlying SSH implementation.

**Returns:** name and version

<a id="s-isAuthenticated"></a>
### isAuthenticated()

```java
public abstract boolean isAuthenticated()
```

Authentication status check

**Returns:** true | false

<a id="s-isConnected"></a>
### isConnected()

```java
public abstract boolean isConnected()
```

Connection status check

**Returns:** true | false

<a id="s-setRemoteCharset"></a>
### setRemoteCharset(Charset)

```java
public abstract void setRemoteCharset(java.nio.charset.Charset remoteCharset)
```

Set charset for sessions started from this connection

**Parameters**

- `java.nio.charset.Charset remoteCharset` - - Specified charset

<a id="s-setTrafficClass"></a>
### setTrafficClass(int)

```java
public abstract void setTrafficClass(int tc) throws java.net.SocketException
```

Set traffic class on the socket used by the SSH client.

**Parameters**

- `int tc` - - Traffic class

**Throws**

- `SocketException`

<a id="s-useCompression"></a>
### useCompression()

```java
public abstract void useCompression() throws java.io.IOException
```

Enable compression on the SSH channel

**Throws**

- `IOException`


## Nested Types

- [CliSession](SSHClient/CliSession.md)
- [SecureFileTransfer](SSHClient/SecureFileTransfer.md)
- [Subsystem](SSHClient/Subsystem.md)
