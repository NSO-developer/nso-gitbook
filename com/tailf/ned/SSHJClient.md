<a id="s-SSHJClient"></a>
# SSHJClient

**Package-private**

```java
class com.tailf.ned.SSHJClient
    implements net.schmizz.sshj.transport.verification.HostKeyVerifier, net.schmizz.sshj.transport.verification.AlgorithmsVerifier, com.tailf.ned.SSHClient
```

Types: [SSHClient](SSHClient.md#s-SSHClient)

SSH Client implementation using the net.schmizz.sshj
 framework.

**Authors:** jrendel

## Members

**Constructors**:

- [SSHJClient(NedWorker, NedConnectionBase)](#s-SSHJClient-1)
- [SSHJClient(SSHJClient)](#s-SSHJClient-2)

**Fields**:

- [address](#s-address)
- [AUTH_HOSTBASED](SSHClient.md#s-AUTH_HOSTBASED) from SSHClient
- [AUTH_KEYBOARD_INTERACTIVE](SSHClient.md#s-AUTH_KEYBOARD_INTERACTIVE) from SSHClient
- [AUTH_NONE](SSHClient.md#s-AUTH_NONE) from SSHClient
- [AUTH_PASSWORD](SSHClient.md#s-AUTH_PASSWORD) from SSHClient
- [AUTH_PUBLIC_KEY](SSHClient.md#s-AUTH_PUBLIC_KEY) from SSHClient
- [authOrder](#s-authOrder)
- [connectTimeout](#s-connectTimeout)
- [hostKeys](#s-hostKeys)
- [hostKeyVerifyApproach](#s-hostKeyVerifyApproach)
- [idleTimeout](#s-idleTimeout)
- [isKeyboardInteractive](#s-isKeyboardInteractive)
- [mfaExecutable](#s-mfaExecutable)
- [mfaOpaque](#s-mfaOpaque)
- [ned](#s-ned)
- [negotiated](#s-negotiated)
- [password](#s-password)
- [port](#s-port)
- [publicKeys](#s-publicKeys)
- [readTimeout](#s-readTimeout)
- [sourceAddress](#s-sourceAddress)
- [sshClient](#s-sshClient)
- [sshConfig](#s-sshConfig)
- [user](#s-user)
- [worker](#s-worker)

**Methods**:

- [authenticate()](#s-authenticate)
- [authenticate(String[])](#s-authenticate-1)
- [authenticate(String[], String, String)](#s-authenticate-2)
- [close()](#s-close)
- [connect()](#s-connect)
- [connect(int, int)](#s-connect-1)
- [connect(int, int, InetAddress, int)](#s-connect-2)
- [createSCP()](#s-createSCP)
- [createSession()](#s-createSession)
- [createSession(int, int)](#s-createSession-1)
- [createSFTP()](#s-createSFTP)
- [createSubsystem(String)](#s-createSubsystem)
- [disableHostKeyVerification()](#s-disableHostKeyVerification)
- [findExistingAlgorithms(String, int)](#s-findExistingAlgorithms)
- [getConnectionInfo()](#s-getConnectionInfo)
- [getProviderName()](#s-getProviderName)
- [isAuthenticated()](#s-isAuthenticated)
- [isConnected()](#s-isConnected)
- [setRemoteCharset(Charset)](#s-setRemoteCharset)
- [setTrafficClass(int)](#s-setTrafficClass)
- [startSession()](#s-startSession)
- [useCompression()](#s-useCompression)
- [verify(NegotiatedAlgorithms)](#s-verify)
- [verify(String, int, PublicKey)](#s-verify-1)

**Nested Types**:

- [SSHJSCP](SSHJClient/SSHJSCP.md#s-SSHJSCP)
- [SSHJSFTP](SSHJClient/SSHJSFTP.md#s-SSHJSFTP)

## Constructors

<a id="s-SSHJClient-1"></a>
### SSHJClient(NedWorker, NedConnectionBase)

**Package-private**

```java
SSHJClient(
    com.tailf.ned.NedWorker worker,
    com.tailf.ned.NedConnectionBase ned
)
    throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#s-NedWorker), [NedConnectionBase](NedConnectionBase.md#s-NedConnectionBase)

Constructor

**Parameters**

- `com.tailf.ned.NedWorker worker` - - The NED worker thread
- `com.tailf.ned.NedConnectionBase ned` - - The NED instance.

**Throws**

- `IOException`

<a id="s-SSHJClient-2"></a>
### SSHJClient(SSHJClient)

**Package-private**

```java
SSHJClient(com.tailf.ned.SSHJClient original) throws java.io.IOException
```

Types: [SSHJClient](SSHJClient.md#s-SSHJClient)

Constructor. Clone instance from another SSHJClient;

**Parameters**

- `com.tailf.ned.SSHJClient original` - - The original SSHJClient

**Throws**

- `IOException`


## Fields

<a id="s-address"></a>
### address

```java
protected java.net.InetAddress address = null;
```

<a id="s-authOrder"></a>
### authOrder

```java
protected String[] authOrder = null;
```

<a id="s-connectTimeout"></a>
### connectTimeout

```java
protected int connectTimeout = null;
```

<a id="s-hostKeys"></a>
### hostKeys

```java
protected java.util.Set<com.tailf.ned.SSHJClient.SSHJKeyProvider> hostKeys = null;
```

<a id="s-hostKeyVerifyApproach"></a>
### hostKeyVerifyApproach

```java
protected String hostKeyVerifyApproach = null;
```

<a id="s-idleTimeout"></a>
### idleTimeout

```java
protected int idleTimeout = null;
```

<a id="s-isKeyboardInteractive"></a>
### isKeyboardInteractive

```java
protected boolean isKeyboardInteractive = null;
```

<a id="s-mfaExecutable"></a>
### mfaExecutable

```java
protected String mfaExecutable = null;
```

<a id="s-mfaOpaque"></a>
### mfaOpaque

```java
protected String mfaOpaque = null;
```

<a id="s-ned"></a>
### ned

```java
protected com.tailf.ned.NedConnectionBase ned = null;
```

Types: [NedConnectionBase](NedConnectionBase.md#s-NedConnectionBase)

<a id="s-negotiated"></a>
### negotiated

```java
protected StringBuilder negotiated = null;
```

<a id="s-password"></a>
### password

```java
protected String password = null;
```

<a id="s-port"></a>
### port

```java
protected int port = null;
```

<a id="s-publicKeys"></a>
### publicKeys

```java
protected java.util.Set<com.tailf.ned.SSHJClient.SSHJKeyProvider> publicKeys = null;
```

<a id="s-readTimeout"></a>
### readTimeout

```java
protected int readTimeout = null;
```

<a id="s-sourceAddress"></a>
### sourceAddress

```java
protected java.net.InetSocketAddress sourceAddress = null;
```

<a id="s-sshClient"></a>
### sshClient

```java
protected net.schmizz.sshj.SSHClient sshClient = null;
```

<a id="s-sshConfig"></a>
### sshConfig

```java
protected net.schmizz.sshj.Config sshConfig = null;
```

<a id="s-user"></a>
### user

```java
protected String user = null;
```

<a id="s-worker"></a>
### worker

```java
protected com.tailf.ned.NedWorker worker = null;
```

Types: [NedWorker](NedWorker.md#s-NedWorker)


## Methods

<a id="s-authenticate"></a>
### authenticate()

```java
public void authenticate() throws java.io.IOException
```

Authenticate using a list with authentications methods provided by NSO.

<a id="s-authenticate-1"></a>
### authenticate(String[])

```java
public void authenticate(String[] methods) throws java.io.IOException
```

Authenticate using a provided list of authentication methods

**Parameters**

- `String[] methods`

<a id="s-authenticate-2"></a>
### authenticate(String[], String, String)

```java
public void authenticate(String[] methods, String user, String password) throws java.io.IOException
```

Authenticate using a list with authentications methods provided by NSO.

**Parameters**

- `String[] methods`
- `String user`
- `String password`

<a id="s-close"></a>
### close()

```java
public synchronized void close() throws java.io.IOException
```

Close the SSH connection

<a id="s-connect"></a>
### connect()

```java
public synchronized void connect() throws java.io.IOException
```

Establish the SSH connection.

<a id="s-connect-1"></a>
### connect(int, int)

```java
public synchronized void connect(int connectTimeout, int idleTimeout) throws java.io.IOException
```

Establish the SSH connection.

**Parameters**

- `int connectTimeout` - - connection timeout
- `int idleTimeout` - - idle timeout

<a id="s-connect-2"></a>
### connect(int, int, InetAddress, int)

```java
public synchronized void connect(
    int connectTimeout,
    int idleTimeout,
    java.net.InetAddress address,
    int port
)
    throws java.io.IOException
```

Establish the SSH connection.

**Parameters**

- `int connectTimeout` - - connection timeout
- `int idleTimeout` - - idle timeout
- `java.net.InetAddress address` - - remote address to connect to
- `int port` - - remote port to use

<a id="s-createSCP"></a>
### createSCP()

```java
public com.tailf.ned.SSHClient.SecureFileTransfer createSCP()
```

Types: [SecureFileTransfer](SSHClient/SecureFileTransfer.md#s-SecureFileTransfer)

Instantiate a SCP client

<a id="s-createSession"></a>
### createSession()

```java
public com.tailf.ned.SSHClient.CliSession createSession() throws java.io.IOException
```

Types: [CliSession](SSHClient/CliSession.md#s-CliSession)

Instantiate a new SSH session, default settings

<a id="s-createSession-1"></a>
### createSession(int, int)

```java
public com.tailf.ned.SSHClient.CliSession createSession(
    int width,
    int height
)
    throws java.io.IOException
```

Types: [CliSession](SSHClient/CliSession.md#s-CliSession)

Instantiate a new SSH session

**Parameters**

- `int width`
- `int height`

<a id="s-createSFTP"></a>
### createSFTP()

```java
public com.tailf.ned.SSHClient.SecureFileTransfer createSFTP() throws java.io.IOException
```

Types: [SecureFileTransfer](SSHClient/SecureFileTransfer.md#s-SecureFileTransfer)

Instantiate a SFTP client

<a id="s-createSubsystem"></a>
### createSubsystem(String)

```java
public com.tailf.ned.SSHClient.Subsystem createSubsystem(String name) throws java.io.IOException
```

Types: [Subsystem](SSHClient/Subsystem.md#s-Subsystem)

Instantiate a SSH subsystem, for instance 'netconf'

**Parameters**

- `String name`

<a id="s-disableHostKeyVerification"></a>
### disableHostKeyVerification()

```java
public void disableHostKeyVerification()
```

Disable host key verification on this SSH connection

<a id="s-findExistingAlgorithms"></a>
### findExistingAlgorithms(String, int)

```java
public java.util.List<String> findExistingAlgorithms(String hostname, int port)
```

It is necessary to connect with the type of algorithm that matches an
 existing know_host entry. This will allow a match when we later verify
 with the negotiated key `HostKeyVerifier.verify`

**Parameters**

- `String hostname` - remote hostname
- `int port` - remote port

**Returns:** existing key types or empty list if no keys known for hostname

<a id="s-getConnectionInfo"></a>
### getConnectionInfo()

```java
public String getConnectionInfo()
```

Get info about what algos that were negotiated
 during connect.

<a id="s-getProviderName"></a>
### getProviderName()

```java
public String getProviderName()
```

Get name and version of underlying SSH client.

<a id="s-isAuthenticated"></a>
### isAuthenticated()

```java
public boolean isAuthenticated()
```

Get authentication status

<a id="s-isConnected"></a>
### isConnected()

```java
public boolean isConnected()
```

Get connection status

<a id="s-setRemoteCharset"></a>
### setRemoteCharset(Charset)

```java
public void setRemoteCharset(java.nio.charset.Charset remoteCharset)
```

Set remote charset to be used on sessions
 created from this connection.
 Must be called before session is created.

**Parameters**

- `java.nio.charset.Charset remoteCharset`

<a id="s-setTrafficClass"></a>
### setTrafficClass(int)

```java
public void setTrafficClass(int tc) throws java.net.SocketException
```

Set traffic class on socket

**Parameters**

- `int tc`

<a id="s-startSession"></a>
### startSession()

**Package-private**

```java
net.schmizz.sshj.connection.channel.direct.Session startSession() throws java.io.IOException
```

Start the SSH session

**Throws**

- `IOException`

<a id="s-useCompression"></a>
### useCompression()

```java
public void useCompression() throws java.io.IOException
```

Enable compression on the SSH channel

<a id="s-verify"></a>
### verify(NegotiatedAlgorithms)

```java
public boolean verify(net.schmizz.sshj.transport.NegotiatedAlgorithms a)
```

Algorithm verification method implementing the SSHJ AlgorithmVerifier
 Currently used to extract information about the negotiated connection
 parameters.

**Parameters**

- `net.schmizz.sshj.transport.NegotiatedAlgorithms a`

<a id="s-verify-1"></a>
### verify(String, int, PublicKey)

```java
public boolean verify(String hostname, int port, java.security.PublicKey key)
```

Host key verification method implementing the SSHJ HostKeyVerifier
 interface

**Parameters**

- `String hostname` - - not used
- `int port` - - not used
- `java.security.PublicKey key` - - the public key presented by the server


## Nested Types

- [SSHJSCP](SSHJClient/SSHJSCP.md)
- [SSHJSFTP](SSHJClient/SSHJSFTP.md)
