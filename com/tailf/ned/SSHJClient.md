# SSHJClient <a href="#sshjclient-ed3ef5e4e5e7" id="sshjclient-ed3ef5e4e5e7"></a>

**Package-private**

```java
class com.tailf.ned.SSHJClient
    implements net.schmizz.sshj.transport.verification.HostKeyVerifier, net.schmizz.sshj.transport.verification.AlgorithmsVerifier, com.tailf.ned.SSHClient
```

Types: [SSHClient](SSHClient.md#sshclient-f4dbfb53c66b)

SSH Client implementation using the net.schmizz.sshj
 framework.

**Authors:** jrendel

## Members

**Constructors**:

- [SSHJClient(NedWorker, NedConnectionBase)](#sshjclient-bcd20512cdc1)
- [SSHJClient(SSHJClient)](#sshjclient-518171fafb24)

**Fields**:

- [address](#address-7f51d5da91c5)
- [AUTH_HOSTBASED](SSHClient.md#auth_hostbased-c6a671f0f224) from SSHClient
- [AUTH_KEYBOARD_INTERACTIVE](SSHClient.md#auth_keyboard_interactive-768b4a794353) from SSHClient
- [AUTH_NONE](SSHClient.md#auth_none-029b3d1645d6) from SSHClient
- [AUTH_PASSWORD](SSHClient.md#auth_password-3076e602ee35) from SSHClient
- [AUTH_PUBLIC_KEY](SSHClient.md#auth_public_key-3e68515cb9a2) from SSHClient
- [authOrder](#authorder-dd584ce52010)
- [connectTimeout](#connecttimeout-da6f2bf6befb)
- [hostKeys](#hostkeys-8561573572ca)
- [hostKeyVerifyApproach](#hostkeyverifyapproach-e3d94aacf59c)
- [idleTimeout](#idletimeout-d7164a465bd4)
- [isKeyboardInteractive](#iskeyboardinteractive-34a0e6e5c66e)
- [mfaExecutable](#mfaexecutable-bd0a58482a84)
- [mfaOpaque](#mfaopaque-eed140909704)
- [ned](#ned-32ff4f42944a)
- [negotiated](#negotiated-5bc1491856b2)
- [password](#password-5ddc7d3f7e3e)
- [port](#port-93a59be61bfd)
- [publicKeys](#publickeys-39bf4f58bbdc)
- [readTimeout](#readtimeout-0c3689315cf4)
- [sourceAddress](#sourceaddress-37df4ccfbce9)
- [sshClient](#sshclient-f55984dcf633)
- [sshConfig](#sshconfig-923883283c2d)
- [user](#user-834e1530ce78)
- [worker](#worker-b30567b4fe16)

**Methods**:

- [authenticate()](#authenticate-41c0007ddd8b)
- [authenticate(String[])](#authenticate-0a5a44636e08)
- [authenticate(String[], String, String)](#authenticate-cf9e8fb6d459)
- [close()](#close-8107c6dc012b)
- [connect()](#connect-394043aad7af)
- [connect(int, int)](#connect-28d2385bf1c0)
- [connect(int, int, InetAddress, int)](#connect-3ed6ad461bcf)
- [createSCP()](#createscp-ac5423466997)
- [createSession()](#createsession-57f0b0e31f12)
- [createSession(int, int)](#createsession-b35d82f6e733)
- [createSFTP()](#createsftp-222ee1678abc)
- [createSubsystem(String)](#createsubsystem-2f3a0d6c84f0)
- [disableHostKeyVerification()](#disablehostkeyverification-6d21c174124b)
- [findExistingAlgorithms(String, int)](#findexistingalgorithms-3e5f1494ab6d)
- [getConnectionInfo()](#getconnectioninfo-72b270c75b17)
- [getProviderName()](#getprovidername-e8ad7190e853)
- [isAuthenticated()](#isauthenticated-11159d3d38a6)
- [isConnected()](#isconnected-c00395001a3e)
- [setRemoteCharset(Charset)](#setremotecharset-6f11114c7330)
- [setTrafficClass(int)](#settrafficclass-6ef3381655c9)
- [startSession()](#startsession-ee121903dcfa)
- [useCompression()](#usecompression-2016e4bae05f)
- [verify(NegotiatedAlgorithms)](#verify-b1784ca71c10)
- [verify(String, int, PublicKey)](#verify-afddadb2ee00)

**Nested Types**:

- [SSHJSCP](SSHJClient/SSHJSCP.md#sshjscp-259e252cfc53)
- [SSHJSFTP](SSHJClient/SSHJSFTP.md#sshjsftp-3a19134400ec)

## Constructors

### SSHJClient(NedWorker, NedConnectionBase) <a href="#sshjclient-bcd20512cdc1" id="sshjclient-bcd20512cdc1"></a>

**Package-private**

```java
SSHJClient(
    com.tailf.ned.NedWorker worker,
    com.tailf.ned.NedConnectionBase ned
)
    throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998), [NedConnectionBase](NedConnectionBase.md#nedconnectionbase-3139efb66faf)

Constructor

**Parameters**

- `com.tailf.ned.NedWorker worker` - - The NED worker thread
- `com.tailf.ned.NedConnectionBase ned` - - The NED instance.

**Throws**

- `IOException`

### SSHJClient(SSHJClient) <a href="#sshjclient-518171fafb24" id="sshjclient-518171fafb24"></a>

**Package-private**

```java
SSHJClient(com.tailf.ned.SSHJClient original) throws java.io.IOException
```

Types: [SSHJClient](SSHJClient.md#sshjclient-ed3ef5e4e5e7)

Constructor. Clone instance from another SSHJClient;

**Parameters**

- `com.tailf.ned.SSHJClient original` - - The original SSHJClient

**Throws**

- `IOException`


## Fields

### address <a href="#address-7f51d5da91c5" id="address-7f51d5da91c5"></a>

```java
protected java.net.InetAddress address = null;
```

### authOrder <a href="#authorder-dd584ce52010" id="authorder-dd584ce52010"></a>

```java
protected String[] authOrder = null;
```

### connectTimeout <a href="#connecttimeout-da6f2bf6befb" id="connecttimeout-da6f2bf6befb"></a>

```java
protected int connectTimeout = null;
```

### hostKeys <a href="#hostkeys-8561573572ca" id="hostkeys-8561573572ca"></a>

```java
protected java.util.Set<com.tailf.ned.SSHJClient.SSHJKeyProvider> hostKeys = null;
```

### hostKeyVerifyApproach <a href="#hostkeyverifyapproach-e3d94aacf59c" id="hostkeyverifyapproach-e3d94aacf59c"></a>

```java
protected String hostKeyVerifyApproach = null;
```

### idleTimeout <a href="#idletimeout-d7164a465bd4" id="idletimeout-d7164a465bd4"></a>

```java
protected int idleTimeout = null;
```

### isKeyboardInteractive <a href="#iskeyboardinteractive-34a0e6e5c66e" id="iskeyboardinteractive-34a0e6e5c66e"></a>

```java
protected boolean isKeyboardInteractive = null;
```

### mfaExecutable <a href="#mfaexecutable-bd0a58482a84" id="mfaexecutable-bd0a58482a84"></a>

```java
protected String mfaExecutable = null;
```

### mfaOpaque <a href="#mfaopaque-eed140909704" id="mfaopaque-eed140909704"></a>

```java
protected String mfaOpaque = null;
```

### ned <a href="#ned-32ff4f42944a" id="ned-32ff4f42944a"></a>

```java
protected com.tailf.ned.NedConnectionBase ned = null;
```

Types: [NedConnectionBase](NedConnectionBase.md#nedconnectionbase-3139efb66faf)

### negotiated <a href="#negotiated-5bc1491856b2" id="negotiated-5bc1491856b2"></a>

```java
protected StringBuilder negotiated = null;
```

### password <a href="#password-5ddc7d3f7e3e" id="password-5ddc7d3f7e3e"></a>

```java
protected String password = null;
```

### port <a href="#port-93a59be61bfd" id="port-93a59be61bfd"></a>

```java
protected int port = null;
```

### publicKeys <a href="#publickeys-39bf4f58bbdc" id="publickeys-39bf4f58bbdc"></a>

```java
protected java.util.Set<com.tailf.ned.SSHJClient.SSHJKeyProvider> publicKeys = null;
```

### readTimeout <a href="#readtimeout-0c3689315cf4" id="readtimeout-0c3689315cf4"></a>

```java
protected int readTimeout = null;
```

### sourceAddress <a href="#sourceaddress-37df4ccfbce9" id="sourceaddress-37df4ccfbce9"></a>

```java
protected java.net.InetSocketAddress sourceAddress = null;
```

### sshClient <a href="#sshclient-f55984dcf633" id="sshclient-f55984dcf633"></a>

```java
protected net.schmizz.sshj.SSHClient sshClient = null;
```

### sshConfig <a href="#sshconfig-923883283c2d" id="sshconfig-923883283c2d"></a>

```java
protected net.schmizz.sshj.Config sshConfig = null;
```

### user <a href="#user-834e1530ce78" id="user-834e1530ce78"></a>

```java
protected String user = null;
```

### worker <a href="#worker-b30567b4fe16" id="worker-b30567b4fe16"></a>

```java
protected com.tailf.ned.NedWorker worker = null;
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)


## Methods

### authenticate() <a href="#authenticate-41c0007ddd8b" id="authenticate-41c0007ddd8b"></a>

```java
public void authenticate() throws java.io.IOException
```

Authenticate using a list with authentications methods provided by NSO.

### authenticate(String[]) <a href="#authenticate-0a5a44636e08" id="authenticate-0a5a44636e08"></a>

```java
public void authenticate(String[] methods) throws java.io.IOException
```

Authenticate using a provided list of authentication methods

**Parameters**

- `String[] methods`

### authenticate(String[], String, String) <a href="#authenticate-cf9e8fb6d459" id="authenticate-cf9e8fb6d459"></a>

```java
public void authenticate(String[] methods, String user, String password) throws java.io.IOException
```

Authenticate using a list with authentications methods provided by NSO.

**Parameters**

- `String[] methods`
- `String user`
- `String password`

### close() <a href="#close-8107c6dc012b" id="close-8107c6dc012b"></a>

```java
public synchronized void close() throws java.io.IOException
```

Close the SSH connection

### connect() <a href="#connect-394043aad7af" id="connect-394043aad7af"></a>

```java
public synchronized void connect() throws java.io.IOException
```

Establish the SSH connection.

### connect(int, int) <a href="#connect-28d2385bf1c0" id="connect-28d2385bf1c0"></a>

```java
public synchronized void connect(int connectTimeout, int idleTimeout) throws java.io.IOException
```

Establish the SSH connection.

**Parameters**

- `int connectTimeout` - - connection timeout
- `int idleTimeout` - - idle timeout

### connect(int, int, InetAddress, int) <a href="#connect-3ed6ad461bcf" id="connect-3ed6ad461bcf"></a>

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

### createSCP() <a href="#createscp-ac5423466997" id="createscp-ac5423466997"></a>

```java
public com.tailf.ned.SSHClient.SecureFileTransfer createSCP()
```

Types: [SecureFileTransfer](SSHClient/SecureFileTransfer.md#securefiletransfer-49298c7c6f54)

Instantiate a SCP client

### createSession() <a href="#createsession-57f0b0e31f12" id="createsession-57f0b0e31f12"></a>

```java
public com.tailf.ned.SSHClient.CliSession createSession() throws java.io.IOException
```

Types: [CliSession](SSHClient/CliSession.md#clisession-1e55c4457237)

Instantiate a new SSH session, default settings

### createSession(int, int) <a href="#createsession-b35d82f6e733" id="createsession-b35d82f6e733"></a>

```java
public com.tailf.ned.SSHClient.CliSession createSession(
    int width,
    int height
)
    throws java.io.IOException
```

Types: [CliSession](SSHClient/CliSession.md#clisession-1e55c4457237)

Instantiate a new SSH session

**Parameters**

- `int width`
- `int height`

### createSFTP() <a href="#createsftp-222ee1678abc" id="createsftp-222ee1678abc"></a>

```java
public com.tailf.ned.SSHClient.SecureFileTransfer createSFTP() throws java.io.IOException
```

Types: [SecureFileTransfer](SSHClient/SecureFileTransfer.md#securefiletransfer-49298c7c6f54)

Instantiate a SFTP client

### createSubsystem(String) <a href="#createsubsystem-2f3a0d6c84f0" id="createsubsystem-2f3a0d6c84f0"></a>

```java
public com.tailf.ned.SSHClient.Subsystem createSubsystem(String name) throws java.io.IOException
```

Types: [Subsystem](SSHClient/Subsystem.md#subsystem-513eac57ded0)

Instantiate a SSH subsystem, for instance 'netconf'

**Parameters**

- `String name`

### disableHostKeyVerification() <a href="#disablehostkeyverification-6d21c174124b" id="disablehostkeyverification-6d21c174124b"></a>

```java
public void disableHostKeyVerification()
```

Disable host key verification on this SSH connection

### findExistingAlgorithms(String, int) <a href="#findexistingalgorithms-3e5f1494ab6d" id="findexistingalgorithms-3e5f1494ab6d"></a>

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

### getConnectionInfo() <a href="#getconnectioninfo-72b270c75b17" id="getconnectioninfo-72b270c75b17"></a>

```java
public String getConnectionInfo()
```

Get info about what algos that were negotiated
 during connect.

### getProviderName() <a href="#getprovidername-e8ad7190e853" id="getprovidername-e8ad7190e853"></a>

```java
public String getProviderName()
```

Get name and version of underlying SSH client.

### isAuthenticated() <a href="#isauthenticated-11159d3d38a6" id="isauthenticated-11159d3d38a6"></a>

```java
public boolean isAuthenticated()
```

Get authentication status

### isConnected() <a href="#isconnected-c00395001a3e" id="isconnected-c00395001a3e"></a>

```java
public boolean isConnected()
```

Get connection status

### setRemoteCharset(Charset) <a href="#setremotecharset-6f11114c7330" id="setremotecharset-6f11114c7330"></a>

```java
public void setRemoteCharset(java.nio.charset.Charset remoteCharset)
```

Set remote charset to be used on sessions
 created from this connection.
 Must be called before session is created.

**Parameters**

- `java.nio.charset.Charset remoteCharset`

### setTrafficClass(int) <a href="#settrafficclass-6ef3381655c9" id="settrafficclass-6ef3381655c9"></a>

```java
public void setTrafficClass(int tc) throws java.net.SocketException
```

Set traffic class on socket

**Parameters**

- `int tc`

### startSession() <a href="#startsession-ee121903dcfa" id="startsession-ee121903dcfa"></a>

**Package-private**

```java
net.schmizz.sshj.connection.channel.direct.Session startSession() throws java.io.IOException
```

Start the SSH session

**Throws**

- `IOException`

### useCompression() <a href="#usecompression-2016e4bae05f" id="usecompression-2016e4bae05f"></a>

```java
public void useCompression() throws java.io.IOException
```

Enable compression on the SSH channel

### verify(NegotiatedAlgorithms) <a href="#verify-b1784ca71c10" id="verify-b1784ca71c10"></a>

```java
public boolean verify(net.schmizz.sshj.transport.NegotiatedAlgorithms a)
```

Algorithm verification method implementing the SSHJ AlgorithmVerifier
 Currently used to extract information about the negotiated connection
 parameters.

**Parameters**

- `net.schmizz.sshj.transport.NegotiatedAlgorithms a`

### verify(String, int, PublicKey) <a href="#verify-afddadb2ee00" id="verify-afddadb2ee00"></a>

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

- [SSHJSCP](SSHJClient/SSHJSCP.md#sshjscp-259e252cfc53)
- [SSHJSFTP](SSHJClient/SSHJSFTP.md#sshjsftp-3a19134400ec)
