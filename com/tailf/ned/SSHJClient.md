<a id="cls-SSHJClient"></a>
# SSHJClient

**Package-private**

```java
class com.tailf.ned.SSHJClient
    implements net.schmizz.sshj.transport.verification.HostKeyVerifier, net.schmizz.sshj.transport.verification.AlgorithmsVerifier, com.tailf.ned.SSHClient
```

Types: [SSHClient](SSHClient.md#cls-SSHClient)

SSH Client implementation using the net.schmizz.sshj
 framework.

**Authors:** jrendel

## Members

**Constructors**:

- [SSHJClient(NedWorker, NedConnectionBase)](#m-sshjclient-bcd20512cdc1)
- [SSHJClient(SSHJClient)](#m-sshjclient-518171fafb24)

**Fields**:

- [address](#m-address)
- [AUTH_HOSTBASED](SSHClient.md#m-AUTH_HOSTBASED) from SSHClient
- [AUTH_KEYBOARD_INTERACTIVE](SSHClient.md#m-AUTH_KEYBOARD_INTERACTIVE) from SSHClient
- [AUTH_NONE](SSHClient.md#m-AUTH_NONE) from SSHClient
- [AUTH_PASSWORD](SSHClient.md#m-AUTH_PASSWORD) from SSHClient
- [AUTH_PUBLIC_KEY](SSHClient.md#m-AUTH_PUBLIC_KEY) from SSHClient
- [authOrder](#m-authOrder)
- [connectTimeout](#m-connectTimeout)
- [hostKeys](#m-hostKeys)
- [hostKeyVerifyApproach](#m-hostKeyVerifyApproach)
- [idleTimeout](#m-idleTimeout)
- [isKeyboardInteractive](#m-isKeyboardInteractive)
- [mfaExecutable](#m-mfaExecutable)
- [mfaOpaque](#m-mfaOpaque)
- [ned](#m-ned)
- [negotiated](#m-negotiated)
- [password](#m-password)
- [port](#m-port)
- [publicKeys](#m-publicKeys)
- [readTimeout](#m-readTimeout)
- [sourceAddress](#m-sourceAddress)
- [sshClient](#m-sshClient)
- [sshConfig](#m-sshConfig)
- [user](#m-user)
- [worker](#m-worker)

**Methods**:

- [authenticate()](#m-authenticate-41c0007ddd8b)
- [authenticate(String[])](#m-authenticate-0a5a44636e08)
- [authenticate(String[], String, String)](#m-authenticate-cf9e8fb6d459)
- [close()](#m-close-8107c6dc012b)
- [connect()](#m-connect-394043aad7af)
- [connect(int, int)](#m-connect-28d2385bf1c0)
- [connect(int, int, InetAddress, int)](#m-connect-3ed6ad461bcf)
- [createSCP()](#m-createscp-ac5423466997)
- [createSession()](#m-createsession-57f0b0e31f12)
- [createSession(int, int)](#m-createsession-b35d82f6e733)
- [createSFTP()](#m-createsftp-222ee1678abc)
- [createSubsystem(String)](#m-createsubsystem-2f3a0d6c84f0)
- [disableHostKeyVerification()](#m-disablehostkeyverification-6d21c174124b)
- [findExistingAlgorithms(String, int)](#m-findexistingalgorithms-3e5f1494ab6d)
- [getConnectionInfo()](#m-getconnectioninfo-72b270c75b17)
- [getProviderName()](#m-getprovidername-e8ad7190e853)
- [isAuthenticated()](#m-isauthenticated-11159d3d38a6)
- [isConnected()](#m-isconnected-c00395001a3e)
- [setRemoteCharset(Charset)](#m-setremotecharset-6f11114c7330)
- [setTrafficClass(int)](#m-settrafficclass-6ef3381655c9)
- [startSession()](#m-startsession-ee121903dcfa)
- [useCompression()](#m-usecompression-2016e4bae05f)
- [verify(NegotiatedAlgorithms)](#m-verify-b1784ca71c10)
- [verify(String, int, PublicKey)](#m-verify-afddadb2ee00)

**Nested Types**:

- [SSHJSCP](SSHJClient/SSHJSCP.md#cls-SSHJSCP)
- [SSHJSFTP](SSHJClient/SSHJSFTP.md#cls-SSHJSFTP)

## Constructors

<a id="m-sshjclient-bcd20512cdc1"></a>
### SSHJClient(NedWorker, NedConnectionBase)

**Package-private**

```java
SSHJClient(
    com.tailf.ned.NedWorker worker,
    com.tailf.ned.NedConnectionBase ned
)
    throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [NedConnectionBase](NedConnectionBase.md#cls-NedConnectionBase)

Constructor

**Parameters**

- `com.tailf.ned.NedWorker worker` - - The NED worker thread
- `com.tailf.ned.NedConnectionBase ned` - - The NED instance.

**Throws**

- `IOException`

<a id="m-sshjclient-518171fafb24"></a>
### SSHJClient(SSHJClient)

**Package-private**

```java
SSHJClient(com.tailf.ned.SSHJClient original) throws java.io.IOException
```

Types: [SSHJClient](SSHJClient.md#cls-SSHJClient)

Constructor. Clone instance from another SSHJClient;

**Parameters**

- `com.tailf.ned.SSHJClient original` - - The original SSHJClient

**Throws**

- `IOException`


## Fields

<a id="m-address"></a>
### address

```java
protected java.net.InetAddress address = null;
```

<a id="m-authOrder"></a>
### authOrder

```java
protected String[] authOrder = null;
```

<a id="m-connectTimeout"></a>
### connectTimeout

```java
protected int connectTimeout = null;
```

<a id="m-hostKeys"></a>
### hostKeys

```java
protected java.util.Set<com.tailf.ned.SSHJClient.SSHJKeyProvider> hostKeys = null;
```

<a id="m-hostKeyVerifyApproach"></a>
### hostKeyVerifyApproach

```java
protected String hostKeyVerifyApproach = null;
```

<a id="m-idleTimeout"></a>
### idleTimeout

```java
protected int idleTimeout = null;
```

<a id="m-isKeyboardInteractive"></a>
### isKeyboardInteractive

```java
protected boolean isKeyboardInteractive = null;
```

<a id="m-mfaExecutable"></a>
### mfaExecutable

```java
protected String mfaExecutable = null;
```

<a id="m-mfaOpaque"></a>
### mfaOpaque

```java
protected String mfaOpaque = null;
```

<a id="m-ned"></a>
### ned

```java
protected com.tailf.ned.NedConnectionBase ned = null;
```

Types: [NedConnectionBase](NedConnectionBase.md#cls-NedConnectionBase)

<a id="m-negotiated"></a>
### negotiated

```java
protected StringBuilder negotiated = null;
```

<a id="m-password"></a>
### password

```java
protected String password = null;
```

<a id="m-port"></a>
### port

```java
protected int port = null;
```

<a id="m-publicKeys"></a>
### publicKeys

```java
protected java.util.Set<com.tailf.ned.SSHJClient.SSHJKeyProvider> publicKeys = null;
```

<a id="m-readTimeout"></a>
### readTimeout

```java
protected int readTimeout = null;
```

<a id="m-sourceAddress"></a>
### sourceAddress

```java
protected java.net.InetSocketAddress sourceAddress = null;
```

<a id="m-sshClient"></a>
### sshClient

```java
protected net.schmizz.sshj.SSHClient sshClient = null;
```

<a id="m-sshConfig"></a>
### sshConfig

```java
protected net.schmizz.sshj.Config sshConfig = null;
```

<a id="m-user"></a>
### user

```java
protected String user = null;
```

<a id="m-worker"></a>
### worker

```java
protected com.tailf.ned.NedWorker worker = null;
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)


## Methods

<a id="m-authenticate-41c0007ddd8b"></a>
### authenticate()

```java
public void authenticate() throws java.io.IOException
```

Authenticate using a list with authentications methods provided by NSO.

<a id="m-authenticate-0a5a44636e08"></a>
### authenticate(String[])

```java
public void authenticate(String[] methods) throws java.io.IOException
```

Authenticate using a provided list of authentication methods

**Parameters**

- `String[] methods`

<a id="m-authenticate-cf9e8fb6d459"></a>
### authenticate(String[], String, String)

```java
public void authenticate(String[] methods, String user, String password) throws java.io.IOException
```

Authenticate using a list with authentications methods provided by NSO.

**Parameters**

- `String[] methods`
- `String user`
- `String password`

<a id="m-close-8107c6dc012b"></a>
### close()

```java
public synchronized void close() throws java.io.IOException
```

Close the SSH connection

<a id="m-connect-394043aad7af"></a>
### connect()

```java
public synchronized void connect() throws java.io.IOException
```

Establish the SSH connection.

<a id="m-connect-28d2385bf1c0"></a>
### connect(int, int)

```java
public synchronized void connect(int connectTimeout, int idleTimeout) throws java.io.IOException
```

Establish the SSH connection.

**Parameters**

- `int connectTimeout` - - connection timeout
- `int idleTimeout` - - idle timeout

<a id="m-connect-3ed6ad461bcf"></a>
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

<a id="m-createscp-ac5423466997"></a>
### createSCP()

```java
public com.tailf.ned.SSHClient.SecureFileTransfer createSCP()
```

Types: [SecureFileTransfer](SSHClient/SecureFileTransfer.md#cls-SecureFileTransfer)

Instantiate a SCP client

<a id="m-createsession-57f0b0e31f12"></a>
### createSession()

```java
public com.tailf.ned.SSHClient.CliSession createSession() throws java.io.IOException
```

Types: [CliSession](SSHClient/CliSession.md#cls-CliSession)

Instantiate a new SSH session, default settings

<a id="m-createsession-b35d82f6e733"></a>
### createSession(int, int)

```java
public com.tailf.ned.SSHClient.CliSession createSession(
    int width,
    int height
)
    throws java.io.IOException
```

Types: [CliSession](SSHClient/CliSession.md#cls-CliSession)

Instantiate a new SSH session

**Parameters**

- `int width`
- `int height`

<a id="m-createsftp-222ee1678abc"></a>
### createSFTP()

```java
public com.tailf.ned.SSHClient.SecureFileTransfer createSFTP() throws java.io.IOException
```

Types: [SecureFileTransfer](SSHClient/SecureFileTransfer.md#cls-SecureFileTransfer)

Instantiate a SFTP client

<a id="m-createsubsystem-2f3a0d6c84f0"></a>
### createSubsystem(String)

```java
public com.tailf.ned.SSHClient.Subsystem createSubsystem(String name) throws java.io.IOException
```

Types: [Subsystem](SSHClient/Subsystem.md#cls-Subsystem)

Instantiate a SSH subsystem, for instance 'netconf'

**Parameters**

- `String name`

<a id="m-disablehostkeyverification-6d21c174124b"></a>
### disableHostKeyVerification()

```java
public void disableHostKeyVerification()
```

Disable host key verification on this SSH connection

<a id="m-findexistingalgorithms-3e5f1494ab6d"></a>
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

<a id="m-getconnectioninfo-72b270c75b17"></a>
### getConnectionInfo()

```java
public String getConnectionInfo()
```

Get info about what algos that were negotiated
 during connect.

<a id="m-getprovidername-e8ad7190e853"></a>
### getProviderName()

```java
public String getProviderName()
```

Get name and version of underlying SSH client.

<a id="m-isauthenticated-11159d3d38a6"></a>
### isAuthenticated()

```java
public boolean isAuthenticated()
```

Get authentication status

<a id="m-isconnected-c00395001a3e"></a>
### isConnected()

```java
public boolean isConnected()
```

Get connection status

<a id="m-setremotecharset-6f11114c7330"></a>
### setRemoteCharset(Charset)

```java
public void setRemoteCharset(java.nio.charset.Charset remoteCharset)
```

Set remote charset to be used on sessions
 created from this connection.
 Must be called before session is created.

**Parameters**

- `java.nio.charset.Charset remoteCharset`

<a id="m-settrafficclass-6ef3381655c9"></a>
### setTrafficClass(int)

```java
public void setTrafficClass(int tc) throws java.net.SocketException
```

Set traffic class on socket

**Parameters**

- `int tc`

<a id="m-startsession-ee121903dcfa"></a>
### startSession()

**Package-private**

```java
net.schmizz.sshj.connection.channel.direct.Session startSession() throws java.io.IOException
```

Start the SSH session

**Throws**

- `IOException`

<a id="m-usecompression-2016e4bae05f"></a>
### useCompression()

```java
public void useCompression() throws java.io.IOException
```

Enable compression on the SSH channel

<a id="m-verify-b1784ca71c10"></a>
### verify(NegotiatedAlgorithms)

```java
public boolean verify(net.schmizz.sshj.transport.NegotiatedAlgorithms a)
```

Algorithm verification method implementing the SSHJ AlgorithmVerifier
 Currently used to extract information about the negotiated connection
 parameters.

**Parameters**

- `net.schmizz.sshj.transport.NegotiatedAlgorithms a`

<a id="m-verify-afddadb2ee00"></a>
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

- [SSHJSCP](SSHJClient/SSHJSCP.md#cls-SSHJSCP)
- [SSHJSFTP](SSHJClient/SSHJSFTP.md#cls-SSHJSFTP)
