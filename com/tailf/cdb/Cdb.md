<a id="s-Cdb"></a>
# Cdb

```java
public class com.tailf.cdb.Cdb
    implements com.tailf.conf.MountIdInterface, AutoCloseable
```

Types: [MountIdInterface](../conf/MountIdInterface.md#s-MountIdInterface)

This class represents a connection to `ConfD/NCS` built in
 XML database.

 A connection is established upon a new instance of this class providing
 a `Socket` as its argument to the constructor. An object of this
 class is usually called a *"cdb socket"*.


 There are mainly two things that can be achieved through
 a connection to `CDB`:



- ***Starting a CDB Session*** - A CDB session is used to read
 configuration data, or read/write operational data. These are short-lived
 sessions that are established though a call to `#startSession()`.
 The entire configuration part of CDB is locked for writing while any
 CDB read session is active. Use the [`CdbDBType`](CdbDBType.md#s-CdbDBType)
 method to create a new session to
 read configuration data and read and write operational data.


 It is important to consider that a `CdbSession`
 has one-to-one relationship
 with a `Cdb` so before opening additional `CdbSession`
 one has to close previous opened.



```
     Cdb cdbReadSocket = new Cdb ( "MyReadCdbSocket",
                             new Socket ( host ,port) );

     // Start Cdb session against running
      CdbSession cdbSession =
             cdbReadSocket.startSession ( CdbDBType.CDB_RUNNING );


       // read some values from CDB .
       cdbSession.endSession();
     cdbReadSocket.getSocket().close();
```



   - ***CDB Subscription*** - The subscription functionality
 makes it
 possible to receive events/notifications of CDB configuration changes.
 `#newSubscription()` method to create a new Cdb subscription to
 subscribe on CDB configuration changes.

**See also:** [`CdbSession`](CdbSession.md#s-CdbSession), [`CdbSubscription`](CdbSubscription.md#s-CdbSubscription)

## Members

**Constructors**:

- [Cdb(String, Socket)](#s-Cdb-1)
- [Cdb(String, SocketAddress)](#s-Cdb-2)

**Methods**:

- [acceptTagPath()](#s-acceptTagPath)
- [bufWrite(int, byte[])](#s-bufWrite)
- [close()](#s-close)
- [endSession()](#s-endSession)
- [getCompactionInfo(CdbDbfileType)](#s-getCompactionInfo)
- [getCurrentSession()](#s-getCurrentSession)
- [getMountId(ConfPath)](#s-getMountId)
- [getName()](#s-getName)
- [getPhase()](#s-getPhase)
- [getSocket()](#s-getSocket)
- [getTxId()](#s-getTxId)
- [initiateCompaction()](#s-initiateCompaction)
- [initiateDbfileCompaction(CdbDbfileType)](#s-initiateDbfileCompaction)
- [isUseHTags()](#s-isUseHTags)
- [newSubscription()](#s-newSubscription)
- [requestTerm(int)](#s-requestTerm)
- [requestTerm(int, boolean, ConfEObject)](#s-requestTerm-1)
- [requestTerm(int, ConfEObject)](#s-requestTerm-2)
- [setTimeout(int)](#s-setTimeout)
- [setUseForCdbUpgrade()](#s-setUseForCdbUpgrade)
- [setUseForCdbUpgrade(List<ConfNamespace>)](#s-setUseForCdbUpgrade-1)
- [setUseHTags(boolean)](#s-setUseHTags)
- [startSession()](#s-startSession)
- [startSession(CdbDBType)](#s-startSession-1)
- [startSession(CdbDBType, EnumSet<CdbLockType>)](#s-startSession-2)
- [startUpgradeSession()](#s-startUpgradeSession)
- [startUpgradeSession(CdbDBType)](#s-startUpgradeSession-1)
- [startUpgradeSession(CdbDBType, EnumSet<CdbLockType>)](#s-startUpgradeSession-2)
- [termRead(int)](#s-termRead)
- [termWrite(int, ConfEObject)](#s-termWrite)
- [toString()](#s-toString)
- [triggerOperSubscriptions(int[])](#s-triggerOperSubscriptions)
- [triggerOperSubscriptions(int[], EnumSet<CdbLockType>)](#s-triggerOperSubscriptions-1)
- [triggerSubscriptions(int[])](#s-triggerSubscriptions)
- [waitStart()](#s-waitStart)

## Constructors

<a id="s-Cdb-1"></a>
### Cdb(String, Socket)

```java
public Cdb(
    String name,
    java.net.Socket socket
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Creates a new instance of a `Cdb` socket supplying a
 established open socket to ConfD/NCS daemon.

 The `name` parameter is just a string which may
 occur in certain error/debug messages i.e for example in
 the *devel.log*.

 When establishing a connection to ConfD/NCS the
 [`MaapiSchemas`](../maapi/MaapiSchemas.md#s-MaapiSchemas) will be loaded once automatically
 by the library.

 If encrypted communication towards ConfD/NCS is desired,
 an environment variable "CONFD_IPC_ACCESS_FILE" or "NCS_IPC_ACCESS_FILE"
 need to be set.
 This variable is expected to point to a file containing a secret salt.
  example:
     export CONFD_IPC_ACCESS_FILE=./secret_file.txt
 An alternative to the environment variable is to set an java system
 property with the same name pointing to the file.

**Parameters**

- `String name` - name of the `Cdb` instance
- `java.net.Socket socket` - A socket connected to ConfD/NCS

**Throws**

- `ConfException` - If ConfD/NCS refuses to establish
         connection the reason could be obtained through
         [`ConfException`](../conf/ConfException.md#s-ConfException)
- `IOException` - signals I/O exception on the underlying socket

<a id="s-Cdb-2"></a>
### Cdb(String, SocketAddress)

```java
public Cdb(
    String name,
    java.net.SocketAddress address
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Creates a new instance of a `Cdb` socket supplying an
 address to the ConfD/NCS server.

 The `name` parameter is just a string which may
 occur in certain error/debug messages i.e for example in
 the *devel.log*.

 When establishing a connection to ConfD/NCS the
 [`MaapiSchemas`](../maapi/MaapiSchemas.md#s-MaapiSchemas) will be loaded once automatically
 by the library.

 If encrypted communication towards ConfD/NCS is desired,
 an environment variable "CONFD_IPC_ACCESS_FILE" or "NCS_IPC_ACCESS_FILE"
 need to be set.
 This variable is expected to point to a file containing a secret salt.
  example:
     export CONFD_IPC_ACCESS_FILE=./secret_file.txt
 An alternative to the environment variable is to set an java system
 property with the same name pointing to the file.

**Parameters**

- `String name` - name of the `Cdb` instance
- `java.net.SocketAddress address` - An adddres to connect to

**Throws**

- `ConfException` - If ConfD/NCS refuses to establish
         connection the reason could be obtained through
         [`ConfException`](../conf/ConfException.md#s-ConfException)
- `IOException` - signals I/O exception on the underlying socket


## Methods

<a id="s-acceptTagPath"></a>
### acceptTagPath()

```java
public synchronized boolean acceptTagPath()
```

Whether tag paths are accepted (always false for Cdb implementation).

**Returns:** false

<a id="s-bufWrite"></a>
### bufWrite(int, byte[])

```java
protected synchronized void bufWrite(
    int op,
    byte[] bytes
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Write raw bytes for an opcode.

**Parameters**

- `int op` - Operation code
- `byte[] bytes` - Payload bytes

**Throws**

- `ConfException` - Protocol error
- `IOException` - I/O error

<a id="s-close"></a>
### close()

```java
public void close() throws java.io.IOException
```

Closes the resources held by this `Cdb` socket.

**Throws**

- `IOException` - If I/O Error when closing resources
 held by this `Cdb` socket

<a id="s-endSession"></a>
### endSession()

```java
protected void endSession()
```

<a id="s-getCompactionInfo"></a>
### getCompactionInfo(CdbDbfileType)

```java
public synchronized com.tailf.cdb.CdbCompactionInfo getCompactionInfo(
    com.tailf.cdb.CdbDbfileType dbfile
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbCompactionInfo](CdbCompactionInfo.md#s-CdbCompactionInfo), [CdbDbfileType](CdbDbfileType.md#s-CdbDbfileType), [ConfException](../conf/ConfException.md#s-ConfException)

Retrieves compaction information on a CDB file

 The method retrieves compaction information on the CDB file
 specified by `dbfile`.

**Parameters**

- `com.tailf.cdb.CdbDbfileType dbfile` - CDB file to collect info

**Returns:** [`CdbCompactionInfo`](CdbCompactionInfo.md#s-CdbCompactionInfo) containing size and timing data

**Throws**

- `CdbException` - Failed to get compaction info
- `IOException` - Failed to read/write on the cdb socket

<a id="s-getCurrentSession"></a>
### getCurrentSession()

```java
public com.tailf.cdb.CdbSession getCurrentSession()
```

Types: [CdbSession](CdbSession.md#s-CdbSession)

Retrieve the current `CdbSession` started on this
  `Cdb` socket.

**Returns:** The current CdbSession started on this Cdb, null
       if no current CdbSession is started on this Cdb Socket.

<a id="s-getMountId"></a>
### getMountId(ConfPath)

```java
public synchronized java.util.List<String> getMountId(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

Retrieve mount identifiers for a path.

**Parameters**

- `com.tailf.conf.ConfPath path` - Path to query

**Returns:** List of mount id strings

**Throws**

- `ConfException` - On retrieval error

<a id="s-getName"></a>
### getName()

```java
public String getName()
```

Retrieve the name of this `Cdb` socket.

**Returns:** The name of this Cdb socket instance

<a id="s-getPhase"></a>
### getPhase()

```java
public synchronized com.tailf.cdb.CdbPhase getPhase() throws com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbPhase](CdbPhase.md#s-CdbPhase), [ConfException](../conf/ConfException.md#s-ConfException)

Returns the start-phase CDB database is currently in.
 Also if CDB is in *phase 0*
 and has initiated an init transaction (to load any init files) the flag
 [`CdbPhase`](CdbPhase.md#s-CdbPhase) is set in the flags field correspondingly if
 an upgrade session is started the [`CdbPhase`](CdbPhase.md#s-CdbPhase) is set.

**Returns:** The current [`CdbPhase`](CdbPhase.md#s-CdbPhase)

**Throws**

- `CdbException` - Failed to get phase
- `IOException` - Failed to read/write cdb socket

<a id="s-getSocket"></a>
### getSocket()

```java
public java.net.Socket getSocket()
```

Retrieve the underlying socket used by this `Cdb` instance

**Returns:** The underlying socket

<a id="s-getTxId"></a>
### getTxId()

```java
public synchronized com.tailf.cdb.CdbTxId getTxId() throws com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbTxId](CdbTxId.md#s-CdbTxId), [ConfException](../conf/ConfException.md#s-ConfException)

Returns a *CdbTxid* object which represents the last transaction
 id from *CDB*.


 This function can be used if we are forced to reconnect to
 *CDB*. If the transaction id we read is identical to
 the last id we had prior to loosing the *CDB* sockets we
 don't have to reload our managed object data.

**Returns:** The last committed transaction id

**Throws**

- `CdbException` - Failed to get the last transaction id
- `IOException` - Failed to read/write cdb socket

<a id="s-initiateCompaction"></a>
### initiateCompaction()

```java
public synchronized void initiateCompaction() throws com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Initiates compaction on CDB files:

 The method initiates compaction on all CDB files
 defined as `CdbDbfileType`.

**Throws**

- `CdbException` - Failed to initiate the compaction
- `IOException` - Failed to read/write on the cdb socket

<a id="s-initiateDbfileCompaction"></a>
### initiateDbfileCompaction(CdbDbfileType)

```java
public synchronized void initiateDbfileCompaction(
    com.tailf.cdb.CdbDbfileType dbfile
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbDbfileType](CdbDbfileType.md#s-CdbDbfileType), [ConfException](../conf/ConfException.md#s-ConfException)

Initiates compaction on a CDB file.

 The method initiates compaction on the CDB file
 specified by `dbfile`.

**Parameters**

- `com.tailf.cdb.CdbDbfileType dbfile` - CDB file to compact

**Throws**

- `CdbException` - Failed to initiate the compaction
- `IOException` - Failed to read/write on the cdb socket

<a id="s-isUseHTags"></a>
### isUseHTags()

```java
protected boolean isUseHTags()
```

Is this Cdb configured to use HKeyPath

**Returns:** true if HKeyPaths are used

<a id="s-newSubscription"></a>
### newSubscription()

```java
public com.tailf.cdb.CdbSubscription newSubscription()
```

Types: [CdbSubscription](CdbSubscription.md#s-CdbSubscription)

Creates a new *CDB Subscription*.

**Returns:** the created [`CdbSubscription`](CdbSubscription.md#s-CdbSubscription)

<a id="s-requestTerm"></a>
### requestTerm(int)

```java
protected synchronized com.tailf.conf.ConfResponse requestTerm(
    int op
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](../conf/ConfResponse.md#s-ConfResponse), [ConfException](../conf/ConfException.md#s-ConfException)

Send a request. This is the same as
 [`ConfEObject`](../proto/ConfEObject.md#s-ConfEObject) but with no arguments
 and with isRel set to false (this is done in ConfInternal).

**Parameters**

- `int op` - Operation code

**Returns:** Response from the server

**Throws**

- `ConfException` - Protocol/Server error
- `IOException` - I/O error

<a id="s-requestTerm-1"></a>
### requestTerm(int, boolean, ConfEObject)

```java
protected synchronized com.tailf.conf.ConfResponse requestTerm(
    int op,
    boolean isRel,
    com.tailf.proto.ConfEObject arg
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](../conf/ConfResponse.md#s-ConfResponse), [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](../conf/ConfException.md#s-ConfException)

Send a request with a term argument specifying relative/absolute path
 context.

**Parameters**

- `int op` - Operation code
- `boolean isRel` - True if argument path is relative
- `com.tailf.proto.ConfEObject arg` - Argument term

**Returns:** Response from the server

**Throws**

- `ConfException` - Protocol/Server error
- `IOException` - I/O error

<a id="s-requestTerm-2"></a>
### requestTerm(int, ConfEObject)

```java
protected synchronized com.tailf.conf.ConfResponse requestTerm(
    int op,
    com.tailf.proto.ConfEObject arg
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](../conf/ConfResponse.md#s-ConfResponse), [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](../conf/ConfException.md#s-ConfException)

Send a request with a single term argument.

**Parameters**

- `int op` - Operation code
- `com.tailf.proto.ConfEObject arg` - Argument term

**Returns:** Response

**Throws**

- `ConfException` - Protocol/ConfD error
- `IOException` - I/O error

<a id="s-setTimeout"></a>
### setTimeout(int)

```java
public void setTimeout(int timeoutSecs) throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

A timeout for cdb client actions can be specified via the config file.
 This function can be used to dynamically extend (or shorten) the timeout
 for the current action.

 This function can be called either for a Cdb instance used for a cdb
 subscription or a Cdb instance used in an CdbSession.
 The timeout is given in seconds from the point in time when the function
 is called.

 Note
 The timeout for subscription delivery is common for all the subscribers
 receiving notifications at a given priority. Thus calling the function
 during subscription delivery changes the timeout for all the subscribers
 that are currently processing notifications.

**Parameters**

- `int timeoutSecs` - timeout in seconds

**Throws**

- `ConfException` - if the server rejects the new timeout or a protocol
         error occurs
- `IOException` - if an I/O error occurs while sending the request or
         receiving the response

<a id="s-setUseForCdbUpgrade"></a>
### setUseForCdbUpgrade()

```java
public void setUseForCdbUpgrade()
```

Sets this Cdb and the session it creates to be used for Cdb data
 upgrades. This is a specific startphase 0 use case.

<a id="s-setUseForCdbUpgrade-1"></a>
### setUseForCdbUpgrade(List<ConfNamespace>)

```java
public synchronized void setUseForCdbUpgrade(java.util.List<com.tailf.conf.ConfNamespace> removedNs)
```

Types: [ConfNamespace](../conf/ConfNamespace.md#s-ConfNamespace)

Sets this Cdb and the session it creates to be used for Cdb data
 upgrades. This is a specific startphase 0 use case.
 If a yang model is completely removed it needs to be temporarily
 reinstalled for CDB to be able to refer to it.

**Parameters**

- `java.util.List<com.tailf.conf.ConfNamespace> removedNs` - List of removed ConfNamespace used earlier

<a id="s-setUseHTags"></a>
### setUseHTags(boolean)

```java
protected void setUseHTags(boolean useHTags)
```

Set this Cdb to use HKeyPath

**Parameters**

- `boolean useHTags` - true to use HKeyPath tags, false otherwise

<a id="s-startSession"></a>
### startSession()

```java
public com.tailf.cdb.CdbSession startSession() throws com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbSession](CdbSession.md#s-CdbSession), [ConfException](../conf/ConfException.md#s-ConfException)

Starts a new *CDB Session* on an already
 established `Cdb` against [`CdbDBType`](CdbDBType.md#s-CdbDBType)
 datastore with [`CdbLockType`](CdbLockType.md#s-CdbLockType) lock.

**Returns:** The started [`CdbSession`](CdbSession.md#s-CdbSession) instance

**Throws**

- `IOException` - If an I/O error occurs on the underlying socket
         while initiating the session.
- `ConfException` - If ConfD/NCS rejects or fails to create the
         session.

<a id="s-startSession-1"></a>
### startSession(CdbDBType)

```java
public com.tailf.cdb.CdbSession startSession(
    com.tailf.cdb.CdbDBType dbtype
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbSession](CdbSession.md#s-CdbSession), [CdbDBType](CdbDBType.md#s-CdbDBType), [ConfException](../conf/ConfException.md#s-ConfException)

Starts a new *CDB Session* on an already
 established `Cdb`.

 The method starts a new session against the datastore
 specified by `dbtype`.

**Parameters**

- `com.tailf.cdb.CdbDBType dbtype` - Datastore to establish session to

**Returns:** The started [`CdbSession`](CdbSession.md#s-CdbSession) instance

**Throws**

- `IOException` - If an I/O error occurs on the underlying socket
         while initiating the session.
- `ConfException` - If ConfD/NCS rejects or fails to create the
         session.

<a id="s-startSession-2"></a>
### startSession(CdbDBType, EnumSet<CdbLockType>)

```java
public com.tailf.cdb.CdbSession startSession(
    com.tailf.cdb.CdbDBType dbtype,
    java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbSession](CdbSession.md#s-CdbSession), [CdbDBType](CdbDBType.md#s-CdbDBType), [CdbLockType](CdbLockType.md#s-CdbLockType), [ConfException](../conf/ConfException.md#s-ConfException)

Starts a new *CDB Session* on an already
 established `Cdb`.

 The method starts a new session against the datastore
 specified by `dbtype` with the locktype specified
 by the `lockflags`.


 While it is possible to use this method to start a session towards
 a configuration database type with no locking at all, this is
 strongly discouraged in general, since it means that even the values
 read in a single multi-value request (e.g. `getObject()`)
 may be inconsistent with each other. However it is necessary to do
 this if we want to have a session open during semantic validation,
 see the
 "Semantic Validation" chapter in the User Guide - and in this
 particular case it is safe, since the transaction lock prevents
 changes to CDB during validation.

**Parameters**

- `com.tailf.cdb.CdbDBType dbtype` - Datastore to establish session to
- `java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags` - EnumSet of CdbLockType flags

**Returns:** The started [`CdbSession`](CdbSession.md#s-CdbSession)

**Throws**

- `IOException` - If an I/O error occurs on the underlying socket
         while initiating the session.
- `ConfException` - If ConfD/NCS rejects or fails to create the
         session.

<a id="s-startUpgradeSession"></a>
### startUpgradeSession()

```java
public com.tailf.cdb.CdbUpgradeSession startUpgradeSession() throws com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbUpgradeSession](CdbUpgradeSession.md#s-CdbUpgradeSession), [ConfException](../conf/ConfException.md#s-ConfException)

Similar to `#startSession()` but always returns
 a CdbUpgradeSession.

**Returns:** The started [`CdbUpgradeSession`](CdbUpgradeSession.md#s-CdbUpgradeSession)

**Throws**

- `IOException` - If an I/O error occurs on the underlying socket
         while initiating the session.
- `ConfException` - If ConfD/NCS rejects or fails to create the
         session.

<a id="s-startUpgradeSession-1"></a>
### startUpgradeSession(CdbDBType)

```java
public com.tailf.cdb.CdbUpgradeSession startUpgradeSession(
    com.tailf.cdb.CdbDBType dbtype
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbUpgradeSession](CdbUpgradeSession.md#s-CdbUpgradeSession), [CdbDBType](CdbDBType.md#s-CdbDBType), [ConfException](../conf/ConfException.md#s-ConfException)

Similar to [`CdbDBType`](CdbDBType.md#s-CdbDBType) but always returns
 a CdbUpgradeSession.

**Parameters**

- `com.tailf.cdb.CdbDBType dbtype` - Datastore to establish session to

**Returns:** The started [`CdbUpgradeSession`](CdbUpgradeSession.md#s-CdbUpgradeSession)

**Throws**

- `IOException` - If an I/O error occurs on the underlying socket
         while initiating the session.
- `ConfException` - If ConfD/NCS rejects or fails to create the
         session.

<a id="s-startUpgradeSession-2"></a>
### startUpgradeSession(CdbDBType, EnumSet<CdbLockType>)

```java
public com.tailf.cdb.CdbUpgradeSession startUpgradeSession(
    com.tailf.cdb.CdbDBType dbtype,
    java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbUpgradeSession](CdbUpgradeSession.md#s-CdbUpgradeSession), [CdbDBType](CdbDBType.md#s-CdbDBType), [CdbLockType](CdbLockType.md#s-CdbLockType), [ConfException](../conf/ConfException.md#s-ConfException)

Similar to [`CdbDBType`](CdbDBType.md#s-CdbDBType) but always returns
 a CdbUpgradeSession.

**Parameters**

- `com.tailf.cdb.CdbDBType dbtype` - Datastore to establish session to
- `java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags` - EnumSet of CdbLockType flags

**Returns:** The started [`CdbUpgradeSession`](CdbUpgradeSession.md#s-CdbUpgradeSession)

**Throws**

- `IOException` - If an I/O error occurs on the underlying socket
         while initiating the session.
- `ConfException` - If ConfD/NCS rejects or fails to create the
         session.

<a id="s-termRead"></a>
### termRead(int)

```java
protected synchronized com.tailf.conf.ConfResponse termRead(
    int op
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](../conf/ConfResponse.md#s-ConfResponse), [ConfException](../conf/ConfException.md#s-ConfException)

Read a term response for a prior write.

**Parameters**

- `int op` - Expected opcode

**Returns:** Response containing term or error

**Throws**

- `ConfException` - Protocol/ConfD error
- `IOException` - I/O error

<a id="s-termWrite"></a>
### termWrite(int, ConfEObject)

```java
protected synchronized void termWrite(
    int op,
    com.tailf.proto.ConfEObject arg
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](../conf/ConfException.md#s-ConfException)

Write a term.

**Parameters**

- `int op` - Operation code
- `com.tailf.proto.ConfEObject arg` - Argument term

**Throws**

- `ConfException` - Protocol/ConfD error
- `IOException` - I/O error

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Returns a concise string with name, socket and current session if any.

**Returns:** The string representation

<a id="s-triggerOperSubscriptions"></a>
### triggerOperSubscriptions(int[])

```java
public synchronized void triggerOperSubscriptions(
    int[] spointArray
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Function similar to `#triggerOperSubscriptions(int[], EnumSet)`
 with the difference that this function will never wait to acquire a lock
 and therefore fail and throw an Exception if Cdb is locked.

**Parameters**

- `int[] spointArray` - int[] array of subscription points or null

**Throws**

- `ConfException` - if triggering fails due to invalid subscription
         point(s) or Cdb being locked
- `IOException` - if an I/O error occurs while communicating with the
         server

<a id="s-triggerOperSubscriptions-1"></a>
### triggerOperSubscriptions(int[], EnumSet<CdbLockType>)

```java
public synchronized void triggerOperSubscriptions(
    int[] spointArray,
    java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbLockType](CdbLockType.md#s-CdbLockType), [ConfException](../conf/ConfException.md#s-ConfException)

Function to trigger operational subscriptions in similar to
  `#triggerSubscriptions(int[])`.

  The caller will trigger all subscription points passed in the
  spointArray (or all operational data subscribers if this array is null),
  and the call will not return until the last subscriber has called
  [`CdbSubscription`](CdbSubscription.md#s-CdbSubscription).

  Since the generation of subscription notifications for operational data
  requires that the subscription lock is taken, this function implicitly
  attempts to take a "global" subscription lock.
  If the subscription lock is already taken, the function will by default
  return an Exception.
  o instead have it wait until the lock becomes available,
  EnumSet.of(CdbLockType.LOCK_WAIT) can be passed as lockflags parameter.

**Parameters**

- `int[] spointArray` - int[] array of subscription points or null
- `java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags` - null or EnumSet.of(CdbLockType.LOCK_WAIT)

**Throws**

- `ConfException` - if triggering fails due to invalid subscription
         point(s) or lock acquisition failure
- `IOException` - if an I/O error occurs while communicating with the
         server

<a id="s-triggerSubscriptions"></a>
### triggerSubscriptions(int[])

```java
public synchronized void triggerSubscriptions(
    int[] spointArray
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Triggers Cdb subscription for configuration data.

 This method makes it possible to trigger *CDB subscriptions* for
 configuration data even though the configuration has not been modified.


 The caller will trigger all subscription points passed in the
 `spointArray` array (or all subscribers if the array is
 of zero length) in priority
 order, and the call will not return until the last subscriber has called
 [`CdbSubscription`](CdbSubscription.md#s-CdbSubscription).

  The call is blocking and doesn't return until all subscribers have
  acknowledged the notification. That means that it is not possible
  to use the method in a  cdb subscriber thread
  since it would cause a deadlock.

 The subscription notification generated by this "synthetic" trigger
 will seem like a regular subscription notification to a subscription
 client. As such, it is possible to use
 `diffIterate` to traverse the changeset. CDB will make up
 this changeset in which all leafs in the configuration will appear to
 be set, and all list entries and presence
 containers will appear as if they are created.

 If the client is a two-phase subscriber, a prepare notification will
 first be delivered and if any client aborts this synthetic
 transaction further delivery of subscription
 notification is suspended and an exception is returned to the caller of
 `triggerSubscriptions`.

 The error is the result of mapping the `CONFD_ERRCODE`
 as set by the aborting client.

 Note however that the configuration is still the way it is - so it is up
 to the caller of `triggerSubscriptions` to take appropriate
 action (for example: raising an alarm, restarting a subsystem, or
 even rebooting the system).

**Parameters**

- `int[] spointArray` - subscription points to trigger

**Throws**

- `ConfException` - If one or more subscription ids is passed in
 the  `subids` array that are
 not valid, an `CdbException` will be thrown with error code
 (`getErrorCode`) set to `CONFD_ERR_PROTOUSAGE`
 will be returned and no subscriptions will be triggered
- `IOException` - On I/O error.

<a id="s-waitStart"></a>
### waitStart()

```java
public synchronized void waitStart() throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

This call waits until start-phase 1 is completed and *CDB*
 is available.

 If *CDB* already is available
 (i.e. start-phase = 1) the call returns
 immediately. This can be used by a CDB client who is not synchronously
 started and only wants to wait until it can read its configuration.

**Throws**

- `CdbException` - Failed to waitStart for some reason
- `IOException` - Failed to read/write on the underlying socket
