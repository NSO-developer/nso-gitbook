# Ha <a href="#ha-2622fda394ad" id="ha-2622fda394ad"></a>

```java
public class com.tailf.ha.Ha
    implements AutoCloseable
```

Main class for the HA cluster management. The HA functionality makes it
 possible to replicate the configuration data on several nodes in a cluster.
 The details on usage of the HA api is described in the UserGuide.

## Members

**Constructors**:

- [Ha(Socket, String)](#ha-a01ce05f0fc4)

**Methods**:

- [beNone()](#benone-d237c0001505)
- [bePrimary(ConfValue)](#beprimary-53ade4701481)
- [beRelay()](#berelay-c1ba9a75af6e)
- [beSecondary(ConfValue, ConfHaNode, boolean)](#besecondary-fdf817eb2bdb)
- [close()](#close-8107c6dc012b)
- [secondaryDead(ConfValue)](#secondarydead-138cc5049b31)
- [status()](#status-f7d72174690b)

## Constructors

### Ha(Socket, String) <a href="#ha-a01ce05f0fc4" id="ha-a01ce05f0fc4"></a>

```java
public Ha(java.net.Socket socket, String token) throws java.io.IOException, com.tailf.ha.HaException
```

Types: [HaException](HaException.md#haexception-050bb3853186)

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

### beNone() <a href="#benone-d237c0001505" id="benone-d237c0001505"></a>

```java
public synchronized void beNone() throws java.io.IOException, com.tailf.ha.HaException
```

Types: [HaException](HaException.md#haexception-050bb3853186)

Instruct a node to resume the initial state, i.e. neither primary nor
 secondary.

### bePrimary(ConfValue) <a href="#beprimary-53ade4701481" id="beprimary-53ade4701481"></a>

```java
public synchronized void bePrimary(
    com.tailf.conf.ConfValue myNodeId
)
    throws java.io.IOException, com.tailf.ha.HaException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [HaException](HaException.md#haexception-050bb3853186)

Instruct an HA node to be primary and also give the node a name.

**Parameters**

- `com.tailf.conf.ConfValue myNodeId` - ConfValue naming the ha node

### beRelay() <a href="#berelay-c1ba9a75af6e" id="berelay-c1ba9a75af6e"></a>

```java
public void beRelay() throws java.io.IOException, com.tailf.ha.HaException
```

Types: [HaException](HaException.md#haexception-050bb3853186)

Instruct a secondary node to be a relay for other secondaries.

### beSecondary(ConfValue, ConfHaNode, boolean) <a href="#besecondary-fdf817eb2bdb" id="besecondary-fdf817eb2bdb"></a>

```java
public synchronized void beSecondary(
    com.tailf.conf.ConfValue myNodeId,
    com.tailf.conf.ConfHaNode primary,
    boolean waitForReply
)
    throws java.io.IOException, com.tailf.ha.HaException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [ConfHaNode](../conf/ConfHaNode.md#confhanode-6a79a4c8e218), [HaException](HaException.md#haexception-050bb3853186)

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

### close() <a href="#close-8107c6dc012b" id="close-8107c6dc012b"></a>

```java
public void close()
```

### secondaryDead(ConfValue) <a href="#secondarydead-138cc5049b31" id="secondarydead-138cc5049b31"></a>

```java
public synchronized void secondaryDead(
    com.tailf.conf.ConfValue nodeId
)
    throws java.io.IOException, com.tailf.ha.HaException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [HaException](HaException.md#haexception-050bb3853186)

This function must be used by the application to inform the HA subsystem
 that another node which is possibly connected to the server is dead.

**Parameters**

- `com.tailf.conf.ConfValue nodeId` - ConfValue naming the cluster node

### status() <a href="#status-f7d72174690b" id="status-f7d72174690b"></a>

```java
public synchronized com.tailf.ha.HaStatus status() throws java.io.IOException, com.tailf.ha.HaException
    throws java.io.IOException, com.tailf.ha.HaException
```

Types: [HaStatus](HaStatus.md#hastatus-b26e458a9864), [HaException](HaException.md#haexception-050bb3853186)

Query an HA node for its status. If successful, the function returns an
 HaStatus object.

**Returns:** HaStatus enum indicating the status of the node
