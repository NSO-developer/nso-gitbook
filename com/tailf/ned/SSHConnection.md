<a id="s-SSHConnection"></a>
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

- [SSHConnection(NedWorker)](#s-SSHConnection-1)

**Methods**:

- [authenticateWithAgent(String, AgentProxy)](#s-authenticateWithAgent)
- [authenticateWithKeyboardInteractive(String, String[], InteractiveCallback)](#s-authenticateWithKeyboardInteractive)
- [authenticateWithNone(String)](#s-authenticateWithNone)
- [authenticateWithPassword(String, String)](#s-authenticateWithPassword)
- [authenticateWithPublicKey(String, char[], String)](#s-authenticateWithPublicKey)
- [authenticateWithPublicKey(String, File, String)](#s-authenticateWithPublicKey-1)
- [connect()](#s-connect)
- [connect(ServerHostKeyVerifier)](#s-connect-1)
- [connect(ServerHostKeyVerifier, int, int)](#s-connect-2)
- [getRemainingAuthMethods(String)](#s-getRemainingAuthMethods)

## Constructors

<a id="s-SSHConnection-1"></a>
### SSHConnection(NedWorker)

```java
public SSHConnection(com.tailf.ned.NedWorker worker)
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

Constructor that uses the current NedWorker to retrieve configuration
 parameters like host, port
 and also southbound-source-address (if set)

**Parameters**

- `com.tailf.ned.NedWorker worker` - current NedWorker


## Methods

<a id="s-authenticateWithAgent"></a>
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

<a id="s-authenticateWithKeyboardInteractive"></a>
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

<a id="s-authenticateWithNone"></a>
### authenticateWithNone(String)

```java
public synchronized boolean authenticateWithNone(String user) throws java.io.IOException
```

Overridden authentication method

**Parameters**

- `String user`

<a id="s-authenticateWithPassword"></a>
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

<a id="s-authenticateWithPublicKey"></a>
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

<a id="s-authenticateWithPublicKey-1"></a>
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

<a id="s-connect"></a>
### connect()

```java
public synchronized ch.ethz.ssh2.ConnectionInfo connect() throws java.io.IOException
```

Overridden connect method
 see ch.ethz.ssh2.Connection.connect()
 Same as
 connect(null, 0, 0).

<a id="s-connect-1"></a>
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

<a id="s-connect-2"></a>
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

<a id="s-getRemainingAuthMethods"></a>
### getRemainingAuthMethods(String)

```java
public synchronized String[] getRemainingAuthMethods(String user) throws java.io.IOException
```

Overridden authentication method

**Parameters**

- `String user`
