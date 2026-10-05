<a id="s-Ha"></a>
# Ha

```java
public class com.tailf.ha.Ha
    implements AutoCloseable
```

Main class for the HA cluster management. The HA functionality makes it
 possible to replicate the configuration data on several nodes in a cluster.
 The details on usage of the HA api is described in the UserGuide.

## Members

**Constructors**:

- [Ha(Socket, String)](#s-Ha-1)

**Methods**:

- [beNone()](#s-beNone)
- [bePrimary(ConfValue)](#s-bePrimary)
- [beRelay()](#s-beRelay)
- [beSecondary(ConfValue, ConfHaNode, boolean)](#s-beSecondary)
- [close()](#s-close)
- [secondaryDead(ConfValue)](#s-secondaryDead)
- [status()](#s-status)

## Constructors

<a id="s-Ha-1"></a>
### Ha(Socket, String)

```java
public Ha(java.net.Socket socket, String token) throws java.io.IOException, com.tailf.ha.HaException
```

Types: [HaException](HaException.md#s-HaException)

Constructor for management of an HA Cluster node. This constructor
 implicitly connects an HA socket which can be used to control a ConfD/NCS
 HA node. The token is a secret string that must be shared by all
 participants in the cluster. There can only be one HA socket towards the
 server, which implies only on HA instance. If a new HA instance is
 created the previous connection is closed and the cluster node is reset
 with the new token value.


 Since the ConfD/NCS daemon expects initialization within
 5 seconds after a new socket is established, this constructor should be
 called immediately for a new socket. For instance:




```
 // int port = Conf.PORT; // ConfD TCP;
 //   NCS uses Conf.NCS_PATH (Unix socket)
 Ha ha = new Ha(new Socket("localhost", port), "xyz");
```




 If encrypted communication towards ConfD/NCS is desired,
 an environment variable "CONFD_IPC_ACCESS_FILE" or "NCS_IPC_ACCESS_FILE"
 need to be set.
 This variable is expected to point to a file containing a secret salt.
 Example:




```
 export CONFD_IPC_ACCESS_FILE=./secret_file.txt
```




 An alternative to the environment variable is to set a java system
 property with the same name pointing to the file.


 Note, if this constructor fails the socket must be closed and a new
 socket created before the call is re-attempted.

**Parameters**

- `java.net.Socket socket` - Ha control socket
- `String token` - cluster common shared secret


## Methods

<a id="s-beNone"></a>
### beNone()

```java
public synchronized void beNone() throws java.io.IOException, com.tailf.ha.HaException
```

Types: [HaException](HaException.md#s-HaException)

Instruct a node to resume the initial state, i.e. neither primary nor
 secondary.

<a id="s-bePrimary"></a>
### bePrimary(ConfValue)

```java
public synchronized void bePrimary(
    com.tailf.conf.ConfValue myNodeId
)
    throws java.io.IOException, com.tailf.ha.HaException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [HaException](HaException.md#s-HaException)

Instruct an HA node to be primary and also give the node a name.

**Parameters**

- `com.tailf.conf.ConfValue myNodeId` - ConfValue naming the ha node

<a id="s-beRelay"></a>
### beRelay()

```java
public void beRelay() throws java.io.IOException, com.tailf.ha.HaException
```

Types: [HaException](HaException.md#s-HaException)

Instruct a secondary node to be a relay for other secondaries.

<a id="s-beSecondary"></a>
### beSecondary(ConfValue, ConfHaNode, boolean)

```java
public synchronized void beSecondary(
    com.tailf.conf.ConfValue myNodeId,
    com.tailf.conf.ConfHaNode primary,
    boolean waitForReply
)
    throws java.io.IOException, com.tailf.ha.HaException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [ConfHaNode](../conf/ConfHaNode.md#s-ConfHaNode), [HaException](HaException.md#s-HaException)

Instruct an HA node to be a secondary to a named primary. The waitreply
 is a boolean. If true, the function is synchronous and it will hang
 until the node has initialized its CDB database. This may mean that the
 CDB database is copied in its entirety from the primary. If false, we do
 not wait for the reply, but it is possible to use a notifications socket
 and get notified asynchronously via an HA_INFO_BESECONDARY_RESULT
 notification. In both cases, it is also possible to use a notifications
 socket and get notified asynchronously when CDB at the secondary is
 initialized.

**Parameters**

- `com.tailf.conf.ConfValue myNodeId` - ConfValue naming the ha node
- `com.tailf.conf.ConfHaNode primary` - Primary ConfHaNode
- `boolean waitForReply` - boolean, set true if call should block until response

**Throws**

- `IOException`
- `HaException`

<a id="s-close"></a>
### close()

```java
public void close()
```

<a id="s-secondaryDead"></a>
### secondaryDead(ConfValue)

```java
public synchronized void secondaryDead(
    com.tailf.conf.ConfValue nodeId
)
    throws java.io.IOException, com.tailf.ha.HaException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [HaException](HaException.md#s-HaException)

This function must be used by the application to inform the HA subsystem
 that another node which is possibly connected to the server is dead.

**Parameters**

- `com.tailf.conf.ConfValue nodeId` - ConfValue naming the cluster node

<a id="s-status"></a>
### status()

```java
public synchronized com.tailf.ha.HaStatus status() throws java.io.IOException, com.tailf.ha.HaException
    throws java.io.IOException, com.tailf.ha.HaException
```

Types: [HaStatus](HaStatus.md#s-HaStatus), [HaException](HaException.md#s-HaException)

Query an HA node for its status. If successful, the function returns an
 HaStatus object.

**Returns:** HaStatus enum indicating the status of the node
