# Cdb <a href="#cls-Cdb" id="cls-Cdb"></a>

```java
public class com.tailf.cdb.Cdb
    implements com.tailf.conf.MountIdInterface, AutoCloseable
```

Types: [MountIdInterface](../conf/MountIdInterface.md#cls-MountIdInterface)

This class represents a connection to `ConfD/NCS` built in
 XML database.

 A connection is established upon a new instance of this class providing
 a `Socket` as its argument to the constructor. An object of this
 class is usually called a *"cdb socket"*.


 There are mainly two things that can be achieved through
 a connection to `CDB`:



- ***Starting a CDB Session*** - A CDB session is used to read
 configuration data, or read/write operational data. These are short-lived
 sessions that are established though a call to [`startSession()`](Cdb.md#m-startSession-ee121903dcfa).
 The entire configuration part of CDB is locked for writing while any
 CDB read session is active. Use the `startSession(CdbDBType)`
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
 [`newSubscription()`](Cdb.md#m-newSubscription-6053c3ae88bb) method to create a new Cdb subscription to
 subscribe on CDB configuration changes.

**See also:** [`CdbSession`](CdbSession.md#cls-CdbSession), [`CdbSubscription`](CdbSubscription.md#cls-CdbSubscription)

## Members

**Constructors**:

- [Cdb(String, Socket)](#m-Cdb-21f829a256dd)
- [Cdb(String, SocketAddress)](#m-Cdb-d6bb494b3f32)

**Methods**:

- [acceptTagPath()](#m-acceptTagPath-3efa26ad697b)
- [bufWrite(int, byte[])](#m-bufWrite-08cae6911f4c)
- [close()](#m-close-8107c6dc012b)
- [endSession()](#m-endSession-1853baeb5d28)
- [getCompactionInfo(CdbDbfileType)](#m-getCompactionInfo-7f8cce00653a)
- [getCurrentSession()](#m-getCurrentSession-2d75e562d728)
- [getMountId(ConfPath)](#m-getMountId-83243c09b7c3)
- [getName()](#m-getName-2634b18b4a25)
- [getPhase()](#m-getPhase-5492112b72e7)
- [getSocket()](#m-getSocket-d7da2de81b81)
- [getTxId()](#m-getTxId-1817ce3409ba)
- [initiateCompaction()](#m-initiateCompaction-2acf1b3661eb)
- [initiateDbfileCompaction(CdbDbfileType)](#m-initiateDbfileCompaction-324563a7582a)
- [isUseHTags()](#m-isUseHTags-9ad9d9c20c62)
- [newSubscription()](#m-newSubscription-6053c3ae88bb)
- [requestTerm(int)](#m-requestTerm-f568e63b5414)
- [requestTerm(int, boolean, ConfEObject)](#m-requestTerm-79e4f0cddbef)
- [requestTerm(int, ConfEObject)](#m-requestTerm-a8fce80da6f1)
- [setTimeout(int)](#m-setTimeout-cbe758ecb5d8)
- [setUseForCdbUpgrade()](#m-setUseForCdbUpgrade-381558675127)
- [setUseForCdbUpgrade(List<ConfNamespace>)](#m-setUseForCdbUpgrade-2a9450800b18)
- [setUseHTags(boolean)](#m-setUseHTags-468584ecfc93)
- [startSession()](#m-startSession-ee121903dcfa)
- [startSession(CdbDBType)](#m-startSession-6f137bd83c44)
- [startSession(CdbDBType, EnumSet<CdbLockType>)](#m-startSession-5269b0eb8b16)
- [startUpgradeSession()](#m-startUpgradeSession-d9903213d87a)
- [startUpgradeSession(CdbDBType)](#m-startUpgradeSession-7352cb5553ec)
- [startUpgradeSession(CdbDBType, EnumSet<CdbLockType>)](#m-startUpgradeSession-8358fca8dbd6)
- [termRead(int)](#m-termRead-0a27f7f4c68c)
- [termWrite(int, ConfEObject)](#m-termWrite-e14731c35ead)
- [toString()](#m-toString-e9d48c5503ef)
- [triggerOperSubscriptions(int[])](#m-triggerOperSubscriptions-975402006348)
- [triggerOperSubscriptions(int[], EnumSet<CdbLockType>)](#m-triggerOperSubscriptions-e7869fd4a9dd)
- [triggerSubscriptions(int[])](#m-triggerSubscriptions-b7a5ff565df7)
- [waitStart()](#m-waitStart-b5e7e06c0c83)

## Constructors

### Cdb(String, Socket) <a href="#m-Cdb-21f829a256dd" id="m-Cdb-21f829a256dd"></a>

```java
public Cdb(
    String name,
    java.net.Socket socket
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Creates a new instance of a `Cdb` socket supplying a
 established open socket to ConfD/NCS daemon.

 The `name` parameter is just a string which may
 occur in certain error/debug messages i.e for example in
 the *devel.log*.

 When establishing a connection to ConfD/NCS the
 [`MaapiSchemas`](../maapi/MaapiSchemas.md#cls-MaapiSchemas) will be loaded once automatically
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
         `ConfException#getMessage()`
- `IOException` - signals I/O exception on the underlying socket

### Cdb(String, SocketAddress) <a href="#m-Cdb-d6bb494b3f32" id="m-Cdb-d6bb494b3f32"></a>

```java
public Cdb(
    String name,
    java.net.SocketAddress address
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Creates a new instance of a `Cdb` socket supplying an
 address to the ConfD/NCS server.

 The `name` parameter is just a string which may
 occur in certain error/debug messages i.e for example in
 the *devel.log*.

 When establishing a connection to ConfD/NCS the
 [`MaapiSchemas`](../maapi/MaapiSchemas.md#cls-MaapiSchemas) will be loaded once automatically
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
         `ConfException#getMessage()`
- `IOException` - signals I/O exception on the underlying socket


## Methods

### acceptTagPath() <a href="#m-acceptTagPath-3efa26ad697b" id="m-acceptTagPath-3efa26ad697b"></a>

```java
public synchronized boolean acceptTagPath()
```

Whether tag paths are accepted (always false for Cdb implementation).

**Returns:** false

### bufWrite(int, byte[]) <a href="#m-bufWrite-08cae6911f4c" id="m-bufWrite-08cae6911f4c"></a>

```java
protected synchronized void bufWrite(
    int op,
    byte[] bytes
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Write raw bytes for an opcode.

**Parameters**

- `int op` - Operation code
- `byte[] bytes` - Payload bytes

**Throws**

- `ConfException` - Protocol error
- `IOException` - I/O error

### close() <a href="#m-close-8107c6dc012b" id="m-close-8107c6dc012b"></a>

```java
public void close() throws java.io.IOException
```

Closes the resources held by this `Cdb` socket.

**Throws**

- `IOException` - If I/O Error when closing resources
 held by this `Cdb` socket

### endSession() <a href="#m-endSession-1853baeb5d28" id="m-endSession-1853baeb5d28"></a>

```java
protected void endSession()
```

### getCompactionInfo(CdbDbfileType) <a href="#m-getCompactionInfo-7f8cce00653a" id="m-getCompactionInfo-7f8cce00653a"></a>

```java
public synchronized com.tailf.cdb.CdbCompactionInfo getCompactionInfo(
    com.tailf.cdb.CdbDbfileType dbfile
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbCompactionInfo](CdbCompactionInfo.md#cls-CdbCompactionInfo), [CdbDbfileType](CdbDbfileType.md#cls-CdbDbfileType), [ConfException](../conf/ConfException.md#cls-ConfException)

Retrieves compaction information on a CDB file

 The method retrieves compaction information on the CDB file
 specified by `dbfile`.

**Parameters**

- `com.tailf.cdb.CdbDbfileType dbfile` - CDB file to collect info

**Returns:** [`CdbCompactionInfo`](CdbCompactionInfo.md#cls-CdbCompactionInfo) containing size and timing data

**Throws**

- `CdbException` - Failed to get compaction info
- `IOException` - Failed to read/write on the cdb socket

### getCurrentSession() <a href="#m-getCurrentSession-2d75e562d728" id="m-getCurrentSession-2d75e562d728"></a>

```java
public com.tailf.cdb.CdbSession getCurrentSession()
```

Types: [CdbSession](CdbSession.md#cls-CdbSession)

Retrieve the current `CdbSession` started on this
  `Cdb` socket.

**Returns:** The current CdbSession started on this Cdb, null
       if no current CdbSession is started on this Cdb Socket.

### getMountId(ConfPath) <a href="#m-getMountId-83243c09b7c3" id="m-getMountId-83243c09b7c3"></a>

```java
public synchronized java.util.List<String> getMountId(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

Retrieve mount identifiers for a path.

**Parameters**

- `com.tailf.conf.ConfPath path` - Path to query

**Returns:** List of mount id strings

**Throws**

- `ConfException` - On retrieval error

### getName() <a href="#m-getName-2634b18b4a25" id="m-getName-2634b18b4a25"></a>

```java
public String getName()
```

Retrieve the name of this `Cdb` socket.

**Returns:** The name of this Cdb socket instance

### getPhase() <a href="#m-getPhase-5492112b72e7" id="m-getPhase-5492112b72e7"></a>

```java
public synchronized com.tailf.cdb.CdbPhase getPhase() throws com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbPhase](CdbPhase.md#cls-CdbPhase), [ConfException](../conf/ConfException.md#cls-ConfException)

Returns the start-phase CDB database is currently in.
 Also if CDB is in *phase 0*
 and has initiated an init transaction (to load any init files) the flag
 [`CdbPhase#FLAG_INIT`](CdbPhase.md#m-FLAG_INIT) is set in the flags field correspondingly if
 an upgrade session is started the [`CdbPhase#FLAG_UPGRADE`](CdbPhase.md#m-FLAG_UPGRADE) is set.

**Returns:** The current [`CdbPhase`](CdbPhase.md#cls-CdbPhase)

**Throws**

- `CdbException` - Failed to get phase
- `IOException` - Failed to read/write cdb socket

### getSocket() <a href="#m-getSocket-d7da2de81b81" id="m-getSocket-d7da2de81b81"></a>

```java
public java.net.Socket getSocket()
```

Retrieve the underlying socket used by this `Cdb` instance

**Returns:** The underlying socket

### getTxId() <a href="#m-getTxId-1817ce3409ba" id="m-getTxId-1817ce3409ba"></a>

```java
public synchronized com.tailf.cdb.CdbTxId getTxId() throws com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbTxId](CdbTxId.md#cls-CdbTxId), [ConfException](../conf/ConfException.md#cls-ConfException)

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

### initiateCompaction() <a href="#m-initiateCompaction-2acf1b3661eb" id="m-initiateCompaction-2acf1b3661eb"></a>

```java
public synchronized void initiateCompaction() throws com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Initiates compaction on CDB files:

 The method initiates compaction on all CDB files
 defined as `CdbDbfileType`.

**Throws**

- `CdbException` - Failed to initiate the compaction
- `IOException` - Failed to read/write on the cdb socket

### initiateDbfileCompaction(CdbDbfileType) <a href="#m-initiateDbfileCompaction-324563a7582a" id="m-initiateDbfileCompaction-324563a7582a"></a>

```java
public synchronized void initiateDbfileCompaction(
    com.tailf.cdb.CdbDbfileType dbfile
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbDbfileType](CdbDbfileType.md#cls-CdbDbfileType), [ConfException](../conf/ConfException.md#cls-ConfException)

Initiates compaction on a CDB file.

 The method initiates compaction on the CDB file
 specified by `dbfile`.

**Parameters**

- `com.tailf.cdb.CdbDbfileType dbfile` - CDB file to compact

**Throws**

- `CdbException` - Failed to initiate the compaction
- `IOException` - Failed to read/write on the cdb socket

### isUseHTags() <a href="#m-isUseHTags-9ad9d9c20c62" id="m-isUseHTags-9ad9d9c20c62"></a>

```java
protected boolean isUseHTags()
```

Is this Cdb configured to use HKeyPath

**Returns:** true if HKeyPaths are used

### newSubscription() <a href="#m-newSubscription-6053c3ae88bb" id="m-newSubscription-6053c3ae88bb"></a>

```java
public com.tailf.cdb.CdbSubscription newSubscription()
```

Types: [CdbSubscription](CdbSubscription.md#cls-CdbSubscription)

Creates a new *CDB Subscription*.

**Returns:** the created [`CdbSubscription`](CdbSubscription.md#cls-CdbSubscription)

### requestTerm(int) <a href="#m-requestTerm-f568e63b5414" id="m-requestTerm-f568e63b5414"></a>

```java
protected synchronized com.tailf.conf.ConfResponse requestTerm(
    int op
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse), [ConfException](../conf/ConfException.md#cls-ConfException)

Send a request. This is the same as
 `requestTerm(int, boolean, ConfEObject)` but with no arguments
 and with isRel set to false (this is done in ConfInternal).

**Parameters**

- `int op` - Operation code

**Returns:** Response from the server

**Throws**

- `ConfException` - Protocol/Server error
- `IOException` - I/O error

### requestTerm(int, boolean, ConfEObject) <a href="#m-requestTerm-79e4f0cddbef" id="m-requestTerm-79e4f0cddbef"></a>

```java
protected synchronized com.tailf.conf.ConfResponse requestTerm(
    int op,
    boolean isRel,
    com.tailf.proto.ConfEObject arg
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse), [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](../conf/ConfException.md#cls-ConfException)

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

### requestTerm(int, ConfEObject) <a href="#m-requestTerm-a8fce80da6f1" id="m-requestTerm-a8fce80da6f1"></a>

```java
protected synchronized com.tailf.conf.ConfResponse requestTerm(
    int op,
    com.tailf.proto.ConfEObject arg
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse), [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](../conf/ConfException.md#cls-ConfException)

Send a request with a single term argument.

**Parameters**

- `int op` - Operation code
- `com.tailf.proto.ConfEObject arg` - Argument term

**Returns:** Response

**Throws**

- `ConfException` - Protocol/ConfD error
- `IOException` - I/O error

### setTimeout(int) <a href="#m-setTimeout-cbe758ecb5d8" id="m-setTimeout-cbe758ecb5d8"></a>

```java
public void setTimeout(int timeoutSecs) throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

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

### setUseForCdbUpgrade() <a href="#m-setUseForCdbUpgrade-381558675127" id="m-setUseForCdbUpgrade-381558675127"></a>

```java
public void setUseForCdbUpgrade()
```

Sets this Cdb and the session it creates to be used for Cdb data
 upgrades. This is a specific startphase 0 use case.

### setUseForCdbUpgrade(List<ConfNamespace>) <a href="#m-setUseForCdbUpgrade-2a9450800b18" id="m-setUseForCdbUpgrade-2a9450800b18"></a>

```java
public synchronized void setUseForCdbUpgrade(java.util.List<com.tailf.conf.ConfNamespace> removedNs)
```

Types: [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace)

Sets this Cdb and the session it creates to be used for Cdb data
 upgrades. This is a specific startphase 0 use case.
 If a yang model is completely removed it needs to be temporarily
 reinstalled for CDB to be able to refer to it.

**Parameters**

- `java.util.List<com.tailf.conf.ConfNamespace> removedNs` - List of removed ConfNamespace used earlier

### setUseHTags(boolean) <a href="#m-setUseHTags-468584ecfc93" id="m-setUseHTags-468584ecfc93"></a>

```java
protected void setUseHTags(boolean useHTags)
```

Set this Cdb to use HKeyPath

**Parameters**

- `boolean useHTags` - true to use HKeyPath tags, false otherwise

### startSession() <a href="#m-startSession-ee121903dcfa" id="m-startSession-ee121903dcfa"></a>

```java
public com.tailf.cdb.CdbSession startSession() throws com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbSession](CdbSession.md#cls-CdbSession), [ConfException](../conf/ConfException.md#cls-ConfException)

Starts a new *CDB Session* on an already
 established `Cdb` against [`CdbDBType#CDB_RUNNING`](CdbDBType.md#m-CDB_RUNNING)
 datastore with [`CdbLockType#LOCK_SESSION`](CdbLockType.md#m-LOCK_SESSION) lock.

**Returns:** The started [`CdbSession`](CdbSession.md#cls-CdbSession) instance

**Throws**

- `IOException` - If an I/O error occurs on the underlying socket
         while initiating the session.
- `ConfException` - If ConfD/NCS rejects or fails to create the
         session.

### startSession(CdbDBType) <a href="#m-startSession-6f137bd83c44" id="m-startSession-6f137bd83c44"></a>

```java
public com.tailf.cdb.CdbSession startSession(
    com.tailf.cdb.CdbDBType dbtype
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbSession](CdbSession.md#cls-CdbSession), [CdbDBType](CdbDBType.md#cls-CdbDBType), [ConfException](../conf/ConfException.md#cls-ConfException)

Starts a new *CDB Session* on an already
 established `Cdb`.

 The method starts a new session against the datastore
 specified by `dbtype`.

**Parameters**

- `com.tailf.cdb.CdbDBType dbtype` - Datastore to establish session to

**Returns:** The started [`CdbSession`](CdbSession.md#cls-CdbSession) instance

**Throws**

- `IOException` - If an I/O error occurs on the underlying socket
         while initiating the session.
- `ConfException` - If ConfD/NCS rejects or fails to create the
         session.

### startSession(CdbDBType, EnumSet<CdbLockType>) <a href="#m-startSession-5269b0eb8b16" id="m-startSession-5269b0eb8b16"></a>

```java
public com.tailf.cdb.CdbSession startSession(
    com.tailf.cdb.CdbDBType dbtype,
    java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbSession](CdbSession.md#cls-CdbSession), [CdbDBType](CdbDBType.md#cls-CdbDBType), [CdbLockType](CdbLockType.md#cls-CdbLockType), [ConfException](../conf/ConfException.md#cls-ConfException)

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

**Returns:** The started [`CdbSession`](CdbSession.md#cls-CdbSession)

**Throws**

- `IOException` - If an I/O error occurs on the underlying socket
         while initiating the session.
- `ConfException` - If ConfD/NCS rejects or fails to create the
         session.

### startUpgradeSession() <a href="#m-startUpgradeSession-d9903213d87a" id="m-startUpgradeSession-d9903213d87a"></a>

```java
public com.tailf.cdb.CdbUpgradeSession startUpgradeSession() throws com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbUpgradeSession](CdbUpgradeSession.md#cls-CdbUpgradeSession), [ConfException](../conf/ConfException.md#cls-ConfException)

Similar to [`startSession()`](Cdb.md#m-startSession-ee121903dcfa) but always returns
 a CdbUpgradeSession.

**Returns:** The started [`CdbUpgradeSession`](CdbUpgradeSession.md#cls-CdbUpgradeSession)

**Throws**

- `IOException` - If an I/O error occurs on the underlying socket
         while initiating the session.
- `ConfException` - If ConfD/NCS rejects or fails to create the
         session.

### startUpgradeSession(CdbDBType) <a href="#m-startUpgradeSession-7352cb5553ec" id="m-startUpgradeSession-7352cb5553ec"></a>

```java
public com.tailf.cdb.CdbUpgradeSession startUpgradeSession(
    com.tailf.cdb.CdbDBType dbtype
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbUpgradeSession](CdbUpgradeSession.md#cls-CdbUpgradeSession), [CdbDBType](CdbDBType.md#cls-CdbDBType), [ConfException](../conf/ConfException.md#cls-ConfException)

Similar to `startSession(CdbDBType)` but always returns
 a CdbUpgradeSession.

**Parameters**

- `com.tailf.cdb.CdbDBType dbtype` - Datastore to establish session to

**Returns:** The started [`CdbUpgradeSession`](CdbUpgradeSession.md#cls-CdbUpgradeSession)

**Throws**

- `IOException` - If an I/O error occurs on the underlying socket
         while initiating the session.
- `ConfException` - If ConfD/NCS rejects or fails to create the
         session.

### startUpgradeSession(CdbDBType, EnumSet<CdbLockType>) <a href="#m-startUpgradeSession-8358fca8dbd6" id="m-startUpgradeSession-8358fca8dbd6"></a>

```java
public com.tailf.cdb.CdbUpgradeSession startUpgradeSession(
    com.tailf.cdb.CdbDBType dbtype,
    java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbUpgradeSession](CdbUpgradeSession.md#cls-CdbUpgradeSession), [CdbDBType](CdbDBType.md#cls-CdbDBType), [CdbLockType](CdbLockType.md#cls-CdbLockType), [ConfException](../conf/ConfException.md#cls-ConfException)

Similar to `startSession(CdbDBType, EnumSet)` but always returns
 a CdbUpgradeSession.

**Parameters**

- `com.tailf.cdb.CdbDBType dbtype` - Datastore to establish session to
- `java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags` - EnumSet of CdbLockType flags

**Returns:** The started [`CdbUpgradeSession`](CdbUpgradeSession.md#cls-CdbUpgradeSession)

**Throws**

- `IOException` - If an I/O error occurs on the underlying socket
         while initiating the session.
- `ConfException` - If ConfD/NCS rejects or fails to create the
         session.

### termRead(int) <a href="#m-termRead-0a27f7f4c68c" id="m-termRead-0a27f7f4c68c"></a>

```java
protected synchronized com.tailf.conf.ConfResponse termRead(
    int op
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse), [ConfException](../conf/ConfException.md#cls-ConfException)

Read a term response for a prior write.

**Parameters**

- `int op` - Expected opcode

**Returns:** Response containing term or error

**Throws**

- `ConfException` - Protocol/ConfD error
- `IOException` - I/O error

### termWrite(int, ConfEObject) <a href="#m-termWrite-e14731c35ead" id="m-termWrite-e14731c35ead"></a>

```java
protected synchronized void termWrite(
    int op,
    com.tailf.proto.ConfEObject arg
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](../conf/ConfException.md#cls-ConfException)

Write a term.

**Parameters**

- `int op` - Operation code
- `com.tailf.proto.ConfEObject arg` - Argument term

**Throws**

- `ConfException` - Protocol/ConfD error
- `IOException` - I/O error

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Returns a concise string with name, socket and current session if any.

**Returns:** The string representation

### triggerOperSubscriptions(int[]) <a href="#m-triggerOperSubscriptions-975402006348" id="m-triggerOperSubscriptions-975402006348"></a>

```java
public synchronized void triggerOperSubscriptions(
    int[] spointArray
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Function similar to `triggerOperSubscriptions(int[], EnumSet)`
 with the difference that this function will never wait to acquire a lock
 and therefore fail and throw an Exception if Cdb is locked.

**Parameters**

- `int[] spointArray` - int[] array of subscription points or null

**Throws**

- `ConfException` - if triggering fails due to invalid subscription
         point(s) or Cdb being locked
- `IOException` - if an I/O error occurs while communicating with the
         server

### triggerOperSubscriptions(int[], EnumSet<CdbLockType>) <a href="#m-triggerOperSubscriptions-e7869fd4a9dd" id="m-triggerOperSubscriptions-e7869fd4a9dd"></a>

```java
public synchronized void triggerOperSubscriptions(
    int[] spointArray,
    java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbLockType](CdbLockType.md#cls-CdbLockType), [ConfException](../conf/ConfException.md#cls-ConfException)

Function to trigger operational subscriptions in similar to
  [`triggerSubscriptions(int[])`](Cdb.md#m-triggerSubscriptions-b7a5ff565df7).

  The caller will trigger all subscription points passed in the
  spointArray (or all operational data subscribers if this array is null),
  and the call will not return until the last subscriber has called
  [`CdbSubscription#sync(CdbSubscriptionSyncType)`](CdbSubscription.md#m-sync-e4ae9cc34a8a).

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

### triggerSubscriptions(int[]) <a href="#m-triggerSubscriptions-b7a5ff565df7" id="m-triggerSubscriptions-b7a5ff565df7"></a>

```java
public synchronized void triggerSubscriptions(
    int[] spointArray
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Triggers Cdb subscription for configuration data.

 This method makes it possible to trigger *CDB subscriptions* for
 configuration data even though the configuration has not been modified.


 The caller will trigger all subscription points passed in the
 `spointArray` array (or all subscribers if the array is
 of zero length) in priority
 order, and the call will not return until the last subscriber has called
 [`CdbSubscription#sync(CdbSubscriptionSyncType)`](CdbSubscription.md#m-sync-e4ae9cc34a8a).

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

### waitStart() <a href="#m-waitStart-b5e7e06c0c83" id="m-waitStart-b5e7e06c0c83"></a>

```java
public synchronized void waitStart() throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

This call waits until start-phase 1 is completed and *CDB*
 is available.

 If *CDB* already is available
 (i.e. start-phase = 1) the call returns
 immediately. This can be used by a CDB client who is not synchronously
 started and only wants to wait until it can read its configuration.

**Throws**

- `CdbException` - Failed to waitStart for some reason
- `IOException` - Failed to read/write on the underlying socket
