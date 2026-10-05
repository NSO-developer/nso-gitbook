<a id="cls-SSHConnection"></a>
# SSHConnection

```java
@Deprecated
public class com.tailf.ned.SSHConnection
    extends ch.ethz.ssh2.Connection
```

Overridden SSH Connection class, that is used to handle
 Ncs Configuration parameters.
 For instance /ncs-config/southbound-source-address

 This class should be used instead of the
 ganymed ch.ethz.ssh2.Connection class

## Members

**Constructors**:

- [SSHConnection(NedWorker)](#m-sshconnection-faa636bf3d2e)

**Methods**:

- [authenticateWithAgent(String, AgentProxy)](#m-authenticatewithagent-5d675c49aad6)
- [authenticateWithKeyboardInteractive(String, String[], InteractiveCallback)](#m-authenticatewithkeyboardinteractive-24b7ce82bc90)
- [authenticateWithNone(String)](#m-authenticatewithnone-6c03229e2ca2)
- [authenticateWithPassword(String, String)](#m-authenticatewithpassword-f09fca8d9fc5)
- [authenticateWithPublicKey(String, char[], String)](#m-authenticatewithpublickey-160b324ce64a)
- [authenticateWithPublicKey(String, File, String)](#m-authenticatewithpublickey-0f6791d166c1)
- [connect()](#m-connect-394043aad7af)
- [connect(ServerHostKeyVerifier)](#m-connect-9ac6e0295a74)
- [connect(ServerHostKeyVerifier, int, int)](#m-connect-bedebc7d4ec2)
- [getRemainingAuthMethods(String)](#m-getremainingauthmethods-3fb72a1c6378)

## Constructors

<a id="m-sshconnection-faa636bf3d2e"></a>
### SSHConnection(NedWorker)

```java
public SSHConnection(com.tailf.ned.NedWorker worker)
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

Constructor that uses the current NedWorker to retrieve configuration
 parameters like host, port
 and also southbound-source-address (if set)

**Parameters**

- `com.tailf.ned.NedWorker worker` - current NedWorker


## Methods

<a id="m-authenticatewithagent-5d675c49aad6"></a>
### authenticateWithAgent(String, AgentProxy)

```java
public synchronized boolean authenticateWithAgent(
    String user,
    ch.ethz.ssh2.auth.AgentProxy proxy
)
    throws java.io.IOException
```

Overridden authentication method

**Parameters**

- `String user`
- `ch.ethz.ssh2.auth.AgentProxy proxy`

<a id="m-authenticatewithkeyboardinteractive-24b7ce82bc90"></a>
### authenticateWithKeyboardInteractive(String, String[], InteractiveCallback)

```java
public synchronized boolean authenticateWithKeyboardInteractive(
    String user,
    String[] submethods,
    ch.ethz.ssh2.InteractiveCallback cb
)
    throws java.io.IOException
```

Overridden authentication method

**Parameters**

- `String user`
- `String[] submethods`
- `ch.ethz.ssh2.InteractiveCallback cb`

<a id="m-authenticatewithnone-6c03229e2ca2"></a>
### authenticateWithNone(String)

```java
public synchronized boolean authenticateWithNone(String user) throws java.io.IOException
```

Overridden authentication method

**Parameters**

- `String user`

<a id="m-authenticatewithpassword-f09fca8d9fc5"></a>
### authenticateWithPassword(String, String)

```java
public synchronized boolean authenticateWithPassword(
    String user,
    String password
)
    throws java.io.IOException
```

Overridden authentication method

**Parameters**

- `String user`
- `String password`

<a id="m-authenticatewithpublickey-160b324ce64a"></a>
### authenticateWithPublicKey(String, char[], String)

```java
public synchronized boolean authenticateWithPublicKey(
    String user,
    char[] pemPrivateKey,
    String password
)
    throws java.io.IOException
```

Overridden authentication method

**Parameters**

- `String user`
- `char[] pemPrivateKey`
- `String password`

<a id="m-authenticatewithpublickey-0f6791d166c1"></a>
### authenticateWithPublicKey(String, File, String)

```java
public synchronized boolean authenticateWithPublicKey(
    String user,
    java.io.File pemFile,
    String password
)
    throws java.io.IOException
```

Overridden authentication method

**Parameters**

- `String user`
- `java.io.File pemFile`
- `String password`

<a id="m-connect-394043aad7af"></a>
### connect()

```java
public synchronized ch.ethz.ssh2.ConnectionInfo connect() throws java.io.IOException
```

Overridden connect method
 see ch.ethz.ssh2.Connection.connect()
 Same as
 connect(null, 0, 0).

<a id="m-connect-9ac6e0295a74"></a>
### connect(ServerHostKeyVerifier)

```java
public synchronized ch.ethz.ssh2.ConnectionInfo connect(
    ch.ethz.ssh2.ServerHostKeyVerifier verifier
)
    throws java.io.IOException
```

Overridden connect method
 see ch.ethz.ssh2.Connection.connect(ServerHostKeyVerifier verifier)

 Same as
 connect(verifier, 0, 0).

**Parameters**

- `ch.ethz.ssh2.ServerHostKeyVerifier verifier`

<a id="m-connect-bedebc7d4ec2"></a>
### connect(ServerHostKeyVerifier, int, int)

```java
public synchronized ch.ethz.ssh2.ConnectionInfo connect(
    ch.ethz.ssh2.ServerHostKeyVerifier verifier,
    int connectTimeout,
    int kexTimeout
)
    throws java.io.IOException
```

Overridden connect method
 see ch.ethz.ssh2.Connection.connect(ServerHostKeyVerifier verifier,
                                     int connectTimeout,
                                     int kexTimeout)

**Parameters**

- `ch.ethz.ssh2.ServerHostKeyVerifier verifier` - ServerHostKeyVerifier is ignored - host key
        verification will be carried out in accordance with the
        configuration for this device in NCS.
- `int connectTimeout` - Connect timeout in milliseconds, Zero means no
        timeout
- `int kexTimeout` - Key exchange timeout in milliseconds, Zero means no
        timeout

 This method also handles authentication via the password/public key set
 for the remote user.

 A caller can continue to use this Connection as long as long as
 isAuthenticationComplete() returns true after connect() has been
 called.

<a id="m-getremainingauthmethods-3fb72a1c6378"></a>
### getRemainingAuthMethods(String)

```java
public synchronized String[] getRemainingAuthMethods(String user) throws java.io.IOException
```

Overridden authentication method

**Parameters**

- `String user`
