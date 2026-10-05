# SSHJClient <a href="#cls-SSHJClient" id="cls-SSHJClient"></a>

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

- [SSHJClient(NedWorker, NedConnectionBase)](#m-SSHJClient-bcd20512cdc1)
- [SSHJClient(SSHJClient)](#m-SSHJClient-518171fafb24)

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
- [createSCP()](#m-createSCP-ac5423466997)
- [createSession()](#m-createSession-57f0b0e31f12)
- [createSession(int, int)](#m-createSession-b35d82f6e733)
- [createSFTP()](#m-createSFTP-222ee1678abc)
- [createSubsystem(String)](#m-createSubsystem-2f3a0d6c84f0)
- [disableHostKeyVerification()](#m-disableHostKeyVerification-6d21c174124b)
- [findExistingAlgorithms(String, int)](#m-findExistingAlgorithms-3e5f1494ab6d)
- [getConnectionInfo()](#m-getConnectionInfo-72b270c75b17)
- [getProviderName()](#m-getProviderName-e8ad7190e853)
- [isAuthenticated()](#m-isAuthenticated-11159d3d38a6)
- [isConnected()](#m-isConnected-c00395001a3e)
- [setRemoteCharset(Charset)](#m-setRemoteCharset-6f11114c7330)
- [setTrafficClass(int)](#m-setTrafficClass-6ef3381655c9)
- [startSession()](#m-startSession-ee121903dcfa)
- [useCompression()](#m-useCompression-2016e4bae05f)
- [verify(NegotiatedAlgorithms)](#m-verify-b1784ca71c10)
- [verify(String, int, PublicKey)](#m-verify-afddadb2ee00)

**Nested Types**:

- [SSHJSCP](SSHJClient/SSHJSCP.md#cls-SSHJSCP)
- [SSHJSFTP](SSHJClient/SSHJSFTP.md#cls-SSHJSFTP)

## Constructors

### SSHJClient(NedWorker, NedConnectionBase) <a href="#m-SSHJClient-bcd20512cdc1" id="m-SSHJClient-bcd20512cdc1"></a>

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

### SSHJClient(SSHJClient) <a href="#m-SSHJClient-518171fafb24" id="m-SSHJClient-518171fafb24"></a>

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

### address <a href="#m-address" id="m-address"></a>

```java
protected java.net.InetAddress address = null;
```

### authOrder <a href="#m-authOrder" id="m-authOrder"></a>

```java
protected String[] authOrder = null;
```

### connectTimeout <a href="#m-connectTimeout" id="m-connectTimeout"></a>

```java
protected int connectTimeout = null;
```

### hostKeys <a href="#m-hostKeys" id="m-hostKeys"></a>

```java
protected java.util.Set<com.tailf.ned.SSHJClient.SSHJKeyProvider> hostKeys = null;
```

### hostKeyVerifyApproach <a href="#m-hostKeyVerifyApproach" id="m-hostKeyVerifyApproach"></a>

```java
protected String hostKeyVerifyApproach = null;
```

### idleTimeout <a href="#m-idleTimeout" id="m-idleTimeout"></a>

```java
protected int idleTimeout = null;
```

### isKeyboardInteractive <a href="#m-isKeyboardInteractive" id="m-isKeyboardInteractive"></a>

```java
protected boolean isKeyboardInteractive = null;
```

### mfaExecutable <a href="#m-mfaExecutable" id="m-mfaExecutable"></a>

```java
protected String mfaExecutable = null;
```

### mfaOpaque <a href="#m-mfaOpaque" id="m-mfaOpaque"></a>

```java
protected String mfaOpaque = null;
```

### ned <a href="#m-ned" id="m-ned"></a>

```java
protected com.tailf.ned.NedConnectionBase ned = null;
```

Types: [NedConnectionBase](NedConnectionBase.md#cls-NedConnectionBase)

### negotiated <a href="#m-negotiated" id="m-negotiated"></a>

```java
protected StringBuilder negotiated = null;
```

### password <a href="#m-password" id="m-password"></a>

```java
protected String password = null;
```

### port <a href="#m-port" id="m-port"></a>

```java
protected int port = null;
```

### publicKeys <a href="#m-publicKeys" id="m-publicKeys"></a>

```java
protected java.util.Set<com.tailf.ned.SSHJClient.SSHJKeyProvider> publicKeys = null;
```

### readTimeout <a href="#m-readTimeout" id="m-readTimeout"></a>

```java
protected int readTimeout = null;
```

### sourceAddress <a href="#m-sourceAddress" id="m-sourceAddress"></a>

```java
protected java.net.InetSocketAddress sourceAddress = null;
```

### sshClient <a href="#m-sshClient" id="m-sshClient"></a>

```java
protected net.schmizz.sshj.SSHClient sshClient = null;
```

### sshConfig <a href="#m-sshConfig" id="m-sshConfig"></a>

```java
protected net.schmizz.sshj.Config sshConfig = null;
```

### user <a href="#m-user" id="m-user"></a>

```java
protected String user = null;
```

### worker <a href="#m-worker" id="m-worker"></a>

```java
protected com.tailf.ned.NedWorker worker = null;
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)


## Methods

### authenticate() <a href="#m-authenticate-41c0007ddd8b" id="m-authenticate-41c0007ddd8b"></a>

```java
public void authenticate() throws java.io.IOException
```

Authenticate using a list with authentications methods provided by NSO.

### authenticate(String[]) <a href="#m-authenticate-0a5a44636e08" id="m-authenticate-0a5a44636e08"></a>

```java
public void authenticate(String[] methods) throws java.io.IOException
```

Authenticate using a provided list of authentication methods

**Parameters**

- `String[] methods`

### authenticate(String[], String, String) <a href="#m-authenticate-cf9e8fb6d459" id="m-authenticate-cf9e8fb6d459"></a>

```java
public void authenticate(String[] methods, String user, String password) throws java.io.IOException
```

Authenticate using a list with authentications methods provided by NSO.

**Parameters**

- `String[] methods`
- `String user`
- `String password`

### close() <a href="#m-close-8107c6dc012b" id="m-close-8107c6dc012b"></a>

```java
public synchronized void close() throws java.io.IOException
```

Close the SSH connection

### connect() <a href="#m-connect-394043aad7af" id="m-connect-394043aad7af"></a>

```java
public synchronized void connect() throws java.io.IOException
```

Establish the SSH connection.

### connect(int, int) <a href="#m-connect-28d2385bf1c0" id="m-connect-28d2385bf1c0"></a>

```java
public synchronized void connect(int connectTimeout, int idleTimeout) throws java.io.IOException
```

Establish the SSH connection.

**Parameters**

- `int connectTimeout` - - connection timeout
- `int idleTimeout` - - idle timeout

### connect(int, int, InetAddress, int) <a href="#m-connect-3ed6ad461bcf" id="m-connect-3ed6ad461bcf"></a>

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

### createSCP() <a href="#m-createSCP-ac5423466997" id="m-createSCP-ac5423466997"></a>

```java
public com.tailf.ned.SSHClient.SecureFileTransfer createSCP()
```

Types: [SecureFileTransfer](SSHClient/SecureFileTransfer.md#cls-SecureFileTransfer)

Instantiate a SCP client

### createSession() <a href="#m-createSession-57f0b0e31f12" id="m-createSession-57f0b0e31f12"></a>

```java
public com.tailf.ned.SSHClient.CliSession createSession() throws java.io.IOException
```

Types: [CliSession](SSHClient/CliSession.md#cls-CliSession)

Instantiate a new SSH session, default settings

### createSession(int, int) <a href="#m-createSession-b35d82f6e733" id="m-createSession-b35d82f6e733"></a>

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

### createSFTP() <a href="#m-createSFTP-222ee1678abc" id="m-createSFTP-222ee1678abc"></a>

```java
public com.tailf.ned.SSHClient.SecureFileTransfer createSFTP() throws java.io.IOException
```

Types: [SecureFileTransfer](SSHClient/SecureFileTransfer.md#cls-SecureFileTransfer)

Instantiate a SFTP client

### createSubsystem(String) <a href="#m-createSubsystem-2f3a0d6c84f0" id="m-createSubsystem-2f3a0d6c84f0"></a>

```java
public com.tailf.ned.SSHClient.Subsystem createSubsystem(String name) throws java.io.IOException
```

Types: [Subsystem](SSHClient/Subsystem.md#cls-Subsystem)

Instantiate a SSH subsystem, for instance 'netconf'

**Parameters**

- `String name`

### disableHostKeyVerification() <a href="#m-disableHostKeyVerification-6d21c174124b" id="m-disableHostKeyVerification-6d21c174124b"></a>

```java
public void disableHostKeyVerification()
```

Disable host key verification on this SSH connection

### findExistingAlgorithms(String, int) <a href="#m-findExistingAlgorithms-3e5f1494ab6d" id="m-findExistingAlgorithms-3e5f1494ab6d"></a>

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

### getConnectionInfo() <a href="#m-getConnectionInfo-72b270c75b17" id="m-getConnectionInfo-72b270c75b17"></a>

```java
public String getConnectionInfo()
```

Get info about what algos that were negotiated
 during connect.

### getProviderName() <a href="#m-getProviderName-e8ad7190e853" id="m-getProviderName-e8ad7190e853"></a>

```java
public String getProviderName()
```

Get name and version of underlying SSH client.

### isAuthenticated() <a href="#m-isAuthenticated-11159d3d38a6" id="m-isAuthenticated-11159d3d38a6"></a>

```java
public boolean isAuthenticated()
```

Get authentication status

### isConnected() <a href="#m-isConnected-c00395001a3e" id="m-isConnected-c00395001a3e"></a>

```java
public boolean isConnected()
```

Get connection status

### setRemoteCharset(Charset) <a href="#m-setRemoteCharset-6f11114c7330" id="m-setRemoteCharset-6f11114c7330"></a>

```java
public void setRemoteCharset(java.nio.charset.Charset remoteCharset)
```

Set remote charset to be used on sessions
 created from this connection.
 Must be called before session is created.

**Parameters**

- `java.nio.charset.Charset remoteCharset`

### setTrafficClass(int) <a href="#m-setTrafficClass-6ef3381655c9" id="m-setTrafficClass-6ef3381655c9"></a>

```java
public void setTrafficClass(int tc) throws java.net.SocketException
```

Set traffic class on socket

**Parameters**

- `int tc`

### startSession() <a href="#m-startSession-ee121903dcfa" id="m-startSession-ee121903dcfa"></a>

**Package-private**

```java
net.schmizz.sshj.connection.channel.direct.Session startSession() throws java.io.IOException
```

Start the SSH session

**Throws**

- `IOException`

### useCompression() <a href="#m-useCompression-2016e4bae05f" id="m-useCompression-2016e4bae05f"></a>

```java
public void useCompression() throws java.io.IOException
```

Enable compression on the SSH channel

### verify(NegotiatedAlgorithms) <a href="#m-verify-b1784ca71c10" id="m-verify-b1784ca71c10"></a>

```java
public boolean verify(net.schmizz.sshj.transport.NegotiatedAlgorithms a)
```

Algorithm verification method implementing the SSHJ AlgorithmVerifier
 Currently used to extract information about the negotiated connection
 parameters.

**Parameters**

- `net.schmizz.sshj.transport.NegotiatedAlgorithms a`

### verify(String, int, PublicKey) <a href="#m-verify-afddadb2ee00" id="m-verify-afddadb2ee00"></a>

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
