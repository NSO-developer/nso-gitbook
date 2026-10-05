# Cdb

## Cdb <a href="#cdb2" id="cdb2"></a>

```java
public class com.tailf.cdb.Cdb
    implements com.tailf.conf.MountIdInterface, AutoCloseable
```

Types: [MountIdInterface](../conf/MountIdInterface.md#cls-MountIdInterface)

This class represents a connection to `ConfD/NCS` built in XML database.

A connection is established upon a new instance of this class providing a `Socket` as its argument to the constructor. An object of this class is usually called a _"cdb socket"_.

There are mainly two things that can be achieved through a connection to `CDB`:

* _**Starting a CDB Session**_ - A CDB session is used to read configuration data, or read/write operational data. These are short-lived sessions that are established though a call to `#startSession()`. The entire configuration part of CDB is locked for writing while any CDB read session is active. Use the `CdbDBType#startSession(CdbDBType)` method to create a new session to read configuration data and read and write operational data.

It is important to consider that a `CdbSession` has one-to-one relationship with a `Cdb` so before opening additional `CdbSession` one has to close previous opened.

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

* _**CDB Subscription**_ - The subscription functionality makes it possible to receive events/notifications of CDB configuration changes. `#newSubscription()` method to create a new Cdb subscription to subscribe on CDB configuration changes.

**See also:** [`CdbSession`](CdbSession.md#cls-CdbSession), [`CdbSubscription`](CdbSubscription.md#cls-CdbSubscription)

### Members

**Constructors**:

* [Cdb(String, Socket)](Cdb.md#m-cdb-21f829a256dd)
* [Cdb(String, SocketAddress)](Cdb.md#m-cdb-d6bb494b3f32)

**Methods**:

* [acceptTagPath()](Cdb.md#m-accepttagpath-3efa26ad697b)
* [bufWrite(int, byte\[\])](Cdb.md#m-bufwrite-08cae6911f4c)
* [close()](Cdb.md#m-close-8107c6dc012b)
* [endSession()](Cdb.md#m-endsession-1853baeb5d28)
* [getCompactionInfo(CdbDbfileType)](Cdb.md#m-getcompactioninfo-7f8cce00653a)
* [getCurrentSession()](Cdb.md#m-getcurrentsession-2d75e562d728)
* [getMountId(ConfPath)](Cdb.md#m-getmountid-83243c09b7c3)
* [getName()](Cdb.md#m-getname-2634b18b4a25)
* [getPhase()](Cdb.md#m-getphase-5492112b72e7)
* [getSocket()](Cdb.md#m-getsocket-d7da2de81b81)
* [getTxId()](Cdb.md#m-gettxid-1817ce3409ba)
* [initiateCompaction()](Cdb.md#m-initiatecompaction-2acf1b3661eb)
* [initiateDbfileCompaction(CdbDbfileType)](Cdb.md#m-initiatedbfilecompaction-324563a7582a)
* [isUseHTags()](Cdb.md#m-isusehtags-9ad9d9c20c62)
* [newSubscription()](Cdb.md#m-newsubscription-6053c3ae88bb)
* [requestTerm(int)](Cdb.md#m-requestterm-f568e63b5414)
* [requestTerm(int, boolean, ConfEObject)](Cdb.md#m-requestterm-79e4f0cddbef)
* [requestTerm(int, ConfEObject)](Cdb.md#m-requestterm-a8fce80da6f1)
* [setTimeout(int)](Cdb.md#m-settimeout-cbe758ecb5d8)
* [setUseForCdbUpgrade()](Cdb.md#m-setuseforcdbupgrade-381558675127)
* [setUseForCdbUpgrade(List)](Cdb.md#m-setuseforcdbupgrade-2a9450800b18)
* [setUseHTags(boolean)](Cdb.md#m-setusehtags-468584ecfc93)
* [startSession()](Cdb.md#m-startsession-ee121903dcfa)
* [startSession(CdbDBType)](Cdb.md#m-startsession-6f137bd83c44)
* [startSession(CdbDBType, EnumSet)](Cdb.md#m-startsession-5269b0eb8b16)
* [startUpgradeSession()](Cdb.md#m-startupgradesession-d9903213d87a)
* [startUpgradeSession(CdbDBType)](Cdb.md#m-startupgradesession-7352cb5553ec)
* [startUpgradeSession(CdbDBType, EnumSet)](Cdb.md#m-startupgradesession-8358fca8dbd6)
* [termRead(int)](Cdb.md#m-termread-0a27f7f4c68c)
* [termWrite(int, ConfEObject)](Cdb.md#m-termwrite-e14731c35ead)
* [toString()](Cdb.md#m-tostring-e9d48c5503ef)
* [triggerOperSubscriptions(int\[\])](Cdb.md#m-triggeropersubscriptions-975402006348)
* [triggerOperSubscriptions(int\[\], EnumSet)](Cdb.md#m-triggeropersubscriptions-e7869fd4a9dd)
* [triggerSubscriptions(int\[\])](Cdb.md#m-triggersubscriptions-b7a5ff565df7)
* [waitStart()](Cdb.md#m-waitstart-b5e7e06c0c83)

### Constructors

#### Cdb(String, Socket)

```java
public Cdb(
    String name,
    java.net.Socket socket
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Creates a new instance of a `Cdb` socket supplying a established open socket to ConfD/NCS daemon.

The `name` parameter is just a string which may occur in certain error/debug messages i.e for example in the _devel.log_.

When establishing a connection to ConfD/NCS the [`MaapiSchemas`](../maapi/MaapiSchemas.md#cls-MaapiSchemas) will be loaded once automatically by the library.

If encrypted communication towards ConfD/NCS is desired, an environment variable "CONFD\_IPC\_ACCESS\_FILE" or "NCS\_IPC\_ACCESS\_FILE" need to be set. This variable is expected to point to a file containing a secret salt. example: export CONFD\_IPC\_ACCESS\_FILE=./secret\_file.txt An alternative to the environment variable is to set an java system property with the same name pointing to the file.

**Parameters**

* `String name` - name of the `Cdb` instance
* `java.net.Socket socket` - A socket connected to ConfD/NCS

**Throws**

* `ConfException` - If ConfD/NCS refuses to establish connection the reason could be obtained through `ConfException#getMessage()`
* `IOException` - signals I/O exception on the underlying socket

#### Cdb(String, SocketAddress)

```java
public Cdb(
    String name,
    java.net.SocketAddress address
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Creates a new instance of a `Cdb` socket supplying an address to the ConfD/NCS server.

The `name` parameter is just a string which may occur in certain error/debug messages i.e for example in the _devel.log_.

When establishing a connection to ConfD/NCS the [`MaapiSchemas`](../maapi/MaapiSchemas.md#cls-MaapiSchemas) will be loaded once automatically by the library.

If encrypted communication towards ConfD/NCS is desired, an environment variable "CONFD\_IPC\_ACCESS\_FILE" or "NCS\_IPC\_ACCESS\_FILE" need to be set. This variable is expected to point to a file containing a secret salt. example: export CONFD\_IPC\_ACCESS\_FILE=./secret\_file.txt An alternative to the environment variable is to set an java system property with the same name pointing to the file.

**Parameters**

* `String name` - name of the `Cdb` instance
* `java.net.SocketAddress address` - An adddres to connect to

**Throws**

* `ConfException` - If ConfD/NCS refuses to establish connection the reason could be obtained through `ConfException#getMessage()`
* `IOException` - signals I/O exception on the underlying socket

### Methods

#### acceptTagPath()

```java
public synchronized boolean acceptTagPath()
```

Whether tag paths are accepted (always false for Cdb implementation).

**Returns:** false

#### bufWrite(int, byte\[])

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

* `int op` - Operation code
* `byte[] bytes` - Payload bytes

**Throws**

* `ConfException` - Protocol error
* `IOException` - I/O error

#### close()

```java
public void close() throws java.io.IOException
```

Closes the resources held by this `Cdb` socket.

**Throws**

* `IOException` - If I/O Error when closing resources held by this `Cdb` socket

#### endSession()

```java
protected void endSession()
```

#### getCompactionInfo(CdbDbfileType)

```java
public synchronized com.tailf.cdb.CdbCompactionInfo getCompactionInfo(
    com.tailf.cdb.CdbDbfileType dbfile
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbCompactionInfo](CdbCompactionInfo.md#cls-CdbCompactionInfo), [CdbDbfileType](CdbDbfileType.md#cls-CdbDbfileType), [ConfException](../conf/ConfException.md#cls-ConfException)

Retrieves compaction information on a CDB file

The method retrieves compaction information on the CDB file specified by `dbfile`.

**Parameters**

* `com.tailf.cdb.CdbDbfileType dbfile` - CDB file to collect info

**Returns:** [`CdbCompactionInfo`](CdbCompactionInfo.md#cls-CdbCompactionInfo) containing size and timing data

**Throws**

* `CdbException` - Failed to get compaction info
* `IOException` - Failed to read/write on the cdb socket

#### getCurrentSession()

```java
public com.tailf.cdb.CdbSession getCurrentSession()
```

Types: [CdbSession](CdbSession.md#cls-CdbSession)

Retrieve the current `CdbSession` started on this `Cdb` socket.

**Returns:** The current CdbSession started on this Cdb, null if no current CdbSession is started on this Cdb Socket.

#### getMountId(ConfPath)

```java
public synchronized java.util.List<String> getMountId(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

Retrieve mount identifiers for a path.

**Parameters**

* `com.tailf.conf.ConfPath path` - Path to query

**Returns:** List of mount id strings

**Throws**

* `ConfException` - On retrieval error

#### getName()

```java
public String getName()
```

Retrieve the name of this `Cdb` socket.

**Returns:** The name of this Cdb socket instance

#### getPhase()

```java
public synchronized com.tailf.cdb.CdbPhase getPhase() throws com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbPhase](CdbPhase.md#cls-CdbPhase), [ConfException](../conf/ConfException.md#cls-ConfException)

Returns the start-phase CDB database is currently in. Also if CDB is in _phase 0_ and has initiated an init transaction (to load any init files) the flag [`CdbPhase#FLAG_INIT`](CdbPhase.md#m-FLAG_INIT) is set in the flags field correspondingly if an upgrade session is started the [`CdbPhase#FLAG_UPGRADE`](CdbPhase.md#m-FLAG_UPGRADE) is set.

**Returns:** The current [`CdbPhase`](CdbPhase.md#cls-CdbPhase)

**Throws**

* `CdbException` - Failed to get phase
* `IOException` - Failed to read/write cdb socket

#### getSocket()

```java
public java.net.Socket getSocket()
```

Retrieve the underlying socket used by this `Cdb` instance

**Returns:** The underlying socket

#### getTxId()

```java
public synchronized com.tailf.cdb.CdbTxId getTxId() throws com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbTxId](CdbTxId.md#cls-CdbTxId), [ConfException](../conf/ConfException.md#cls-ConfException)

Returns a _CdbTxid_ object which represents the last transaction id from _CDB_.

This function can be used if we are forced to reconnect to _CDB_. If the transaction id we read is identical to the last id we had prior to loosing the _CDB_ sockets we don't have to reload our managed object data.

**Returns:** The last committed transaction id

**Throws**

* `CdbException` - Failed to get the last transaction id
* `IOException` - Failed to read/write cdb socket

#### initiateCompaction()

```java
public synchronized void initiateCompaction() throws com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Initiates compaction on CDB files:

The method initiates compaction on all CDB files defined as `CdbDbfileType`.

**Throws**

* `CdbException` - Failed to initiate the compaction
* `IOException` - Failed to read/write on the cdb socket

#### initiateDbfileCompaction(CdbDbfileType)

```java
public synchronized void initiateDbfileCompaction(
    com.tailf.cdb.CdbDbfileType dbfile
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbDbfileType](CdbDbfileType.md#cls-CdbDbfileType), [ConfException](../conf/ConfException.md#cls-ConfException)

Initiates compaction on a CDB file.

The method initiates compaction on the CDB file specified by `dbfile`.

**Parameters**

* `com.tailf.cdb.CdbDbfileType dbfile` - CDB file to compact

**Throws**

* `CdbException` - Failed to initiate the compaction
* `IOException` - Failed to read/write on the cdb socket

#### isUseHTags()

```java
protected boolean isUseHTags()
```

Is this Cdb configured to use HKeyPath

**Returns:** true if HKeyPaths are used

#### newSubscription()

```java
public com.tailf.cdb.CdbSubscription newSubscription()
```

Types: [CdbSubscription](CdbSubscription.md#cls-CdbSubscription)

Creates a new _CDB Subscription_.

**Returns:** the created [`CdbSubscription`](CdbSubscription.md#cls-CdbSubscription)

#### requestTerm(int)

```java
protected synchronized com.tailf.conf.ConfResponse requestTerm(
    int op
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse), [ConfException](../conf/ConfException.md#cls-ConfException)

Send a request. This is the same as `ConfEObject#requestTerm(int, boolean, ConfEObject)` but with no arguments and with isRel set to false (this is done in ConfInternal).

**Parameters**

* `int op` - Operation code

**Returns:** Response from the server

**Throws**

* `ConfException` - Protocol/Server error
* `IOException` - I/O error

#### requestTerm(int, boolean, ConfEObject)

```java
protected synchronized com.tailf.conf.ConfResponse requestTerm(
    int op,
    boolean isRel,
    com.tailf.proto.ConfEObject arg
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse), [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](../conf/ConfException.md#cls-ConfException)

Send a request with a term argument specifying relative/absolute path context.

**Parameters**

* `int op` - Operation code
* `boolean isRel` - True if argument path is relative
* `com.tailf.proto.ConfEObject arg` - Argument term

**Returns:** Response from the server

**Throws**

* `ConfException` - Protocol/Server error
* `IOException` - I/O error

#### requestTerm(int, ConfEObject)

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

* `int op` - Operation code
* `com.tailf.proto.ConfEObject arg` - Argument term

**Returns:** Response

**Throws**

* `ConfException` - Protocol/ConfD error
* `IOException` - I/O error

#### setTimeout(int)

```java
public void setTimeout(int timeoutSecs) throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

A timeout for cdb client actions can be specified via the config file. This function can be used to dynamically extend (or shorten) the timeout for the current action.

This function can be called either for a Cdb instance used for a cdb subscription or a Cdb instance used in an CdbSession. The timeout is given in seconds from the point in time when the function is called.

Note The timeout for subscription delivery is common for all the subscribers receiving notifications at a given priority. Thus calling the function during subscription delivery changes the timeout for all the subscribers that are currently processing notifications.

**Parameters**

* `int timeoutSecs` - timeout in seconds

**Throws**

* `ConfException` - if the server rejects the new timeout or a protocol error occurs
* `IOException` - if an I/O error occurs while sending the request or receiving the response

#### setUseForCdbUpgrade()

```java
public void setUseForCdbUpgrade()
```

Sets this Cdb and the session it creates to be used for Cdb data upgrades. This is a specific startphase 0 use case.

#### setUseForCdbUpgrade(List)

```java
public synchronized void setUseForCdbUpgrade(java.util.List<com.tailf.conf.ConfNamespace> removedNs)
```

Types: [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace)

Sets this Cdb and the session it creates to be used for Cdb data upgrades. This is a specific startphase 0 use case. If a yang model is completely removed it needs to be temporarily reinstalled for CDB to be able to refer to it.

**Parameters**

* `java.util.List<com.tailf.conf.ConfNamespace> removedNs` - List of removed ConfNamespace used earlier

#### setUseHTags(boolean)

```java
protected void setUseHTags(boolean useHTags)
```

Set this Cdb to use HKeyPath

**Parameters**

* `boolean useHTags` - true to use HKeyPath tags, false otherwise

#### startSession()

```java
public com.tailf.cdb.CdbSession startSession() throws com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbSession](CdbSession.md#cls-CdbSession), [ConfException](../conf/ConfException.md#cls-ConfException)

Starts a new _CDB Session_ on an already established `Cdb` against [`CdbDBType#CDB_RUNNING`](CdbDBType.md#m-CDB_RUNNING) datastore with [`CdbLockType#LOCK_SESSION`](CdbLockType.md#m-LOCK_SESSION) lock.

**Returns:** The started [`CdbSession`](CdbSession.md#cls-CdbSession) instance

**Throws**

* `IOException` - If an I/O error occurs on the underlying socket while initiating the session.
* `ConfException` - If ConfD/NCS rejects or fails to create the session.

#### startSession(CdbDBType)

```java
public com.tailf.cdb.CdbSession startSession(
    com.tailf.cdb.CdbDBType dbtype
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbSession](CdbSession.md#cls-CdbSession), [CdbDBType](CdbDBType.md#cls-CdbDBType), [ConfException](../conf/ConfException.md#cls-ConfException)

Starts a new _CDB Session_ on an already established `Cdb`.

The method starts a new session against the datastore specified by `dbtype`.

**Parameters**

* `com.tailf.cdb.CdbDBType dbtype` - Datastore to establish session to

**Returns:** The started [`CdbSession`](CdbSession.md#cls-CdbSession) instance

**Throws**

* `IOException` - If an I/O error occurs on the underlying socket while initiating the session.
* `ConfException` - If ConfD/NCS rejects or fails to create the session.

#### startSession(CdbDBType, EnumSet)

```java
public com.tailf.cdb.CdbSession startSession(
    com.tailf.cdb.CdbDBType dbtype,
    java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbSession](CdbSession.md#cls-CdbSession), [CdbDBType](CdbDBType.md#cls-CdbDBType), [CdbLockType](CdbLockType.md#cls-CdbLockType), [ConfException](../conf/ConfException.md#cls-ConfException)

Starts a new _CDB Session_ on an already established `Cdb`.

The method starts a new session against the datastore specified by `dbtype` with the locktype specified by the `lockflags`.

While it is possible to use this method to start a session towards a configuration database type with no locking at all, this is strongly discouraged in general, since it means that even the values read in a single multi-value request (e.g. `getObject()`) may be inconsistent with each other. However it is necessary to do this if we want to have a session open during semantic validation, see the "Semantic Validation" chapter in the User Guide - and in this particular case it is safe, since the transaction lock prevents changes to CDB during validation.

**Parameters**

* `com.tailf.cdb.CdbDBType dbtype` - Datastore to establish session to
* `java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags` - EnumSet of CdbLockType flags

**Returns:** The started [`CdbSession`](CdbSession.md#cls-CdbSession)

**Throws**

* `IOException` - If an I/O error occurs on the underlying socket while initiating the session.
* `ConfException` - If ConfD/NCS rejects or fails to create the session.

#### startUpgradeSession()

```java
public com.tailf.cdb.CdbUpgradeSession startUpgradeSession() throws com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbUpgradeSession](CdbUpgradeSession.md#cls-CdbUpgradeSession), [ConfException](../conf/ConfException.md#cls-ConfException)

Similar to `#startSession()` but always returns a CdbUpgradeSession.

**Returns:** The started [`CdbUpgradeSession`](CdbUpgradeSession.md#cls-CdbUpgradeSession)

**Throws**

* `IOException` - If an I/O error occurs on the underlying socket while initiating the session.
* `ConfException` - If ConfD/NCS rejects or fails to create the session.

#### startUpgradeSession(CdbDBType)

```java
public com.tailf.cdb.CdbUpgradeSession startUpgradeSession(
    com.tailf.cdb.CdbDBType dbtype
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbUpgradeSession](CdbUpgradeSession.md#cls-CdbUpgradeSession), [CdbDBType](CdbDBType.md#cls-CdbDBType), [ConfException](../conf/ConfException.md#cls-ConfException)

Similar to `CdbDBType#startSession(CdbDBType)` but always returns a CdbUpgradeSession.

**Parameters**

* `com.tailf.cdb.CdbDBType dbtype` - Datastore to establish session to

**Returns:** The started [`CdbUpgradeSession`](CdbUpgradeSession.md#cls-CdbUpgradeSession)

**Throws**

* `IOException` - If an I/O error occurs on the underlying socket while initiating the session.
* `ConfException` - If ConfD/NCS rejects or fails to create the session.

#### startUpgradeSession(CdbDBType, EnumSet)

```java
public com.tailf.cdb.CdbUpgradeSession startUpgradeSession(
    com.tailf.cdb.CdbDBType dbtype,
    java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbUpgradeSession](CdbUpgradeSession.md#cls-CdbUpgradeSession), [CdbDBType](CdbDBType.md#cls-CdbDBType), [CdbLockType](CdbLockType.md#cls-CdbLockType), [ConfException](../conf/ConfException.md#cls-ConfException)

Similar to `CdbDBType#startSession(CdbDBType, EnumSet)` but always returns a CdbUpgradeSession.

**Parameters**

* `com.tailf.cdb.CdbDBType dbtype` - Datastore to establish session to
* `java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags` - EnumSet of CdbLockType flags

**Returns:** The started [`CdbUpgradeSession`](CdbUpgradeSession.md#cls-CdbUpgradeSession)

**Throws**

* `IOException` - If an I/O error occurs on the underlying socket while initiating the session.
* `ConfException` - If ConfD/NCS rejects or fails to create the session.

#### termRead(int)

```java
protected synchronized com.tailf.conf.ConfResponse termRead(
    int op
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse), [ConfException](../conf/ConfException.md#cls-ConfException)

Read a term response for a prior write.

**Parameters**

* `int op` - Expected opcode

**Returns:** Response containing term or error

**Throws**

* `ConfException` - Protocol/ConfD error
* `IOException` - I/O error

#### termWrite(int, ConfEObject)

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

* `int op` - Operation code
* `com.tailf.proto.ConfEObject arg` - Argument term

**Throws**

* `ConfException` - Protocol/ConfD error
* `IOException` - I/O error

#### toString()

```java
public String toString()
```

Returns a concise string with name, socket and current session if any.

**Returns:** The string representation

#### triggerOperSubscriptions(int\[])

```java
public synchronized void triggerOperSubscriptions(
    int[] spointArray
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Function similar to `#triggerOperSubscriptions(int[], EnumSet)` with the difference that this function will never wait to acquire a lock and therefore fail and throw an Exception if Cdb is locked.

**Parameters**

* `int[] spointArray` - int\[] array of subscription points or null

**Throws**

* `ConfException` - if triggering fails due to invalid subscription point(s) or Cdb being locked
* `IOException` - if an I/O error occurs while communicating with the server

#### triggerOperSubscriptions(int\[], EnumSet)

```java
public synchronized void triggerOperSubscriptions(
    int[] spointArray,
    java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbLockType](CdbLockType.md#cls-CdbLockType), [ConfException](../conf/ConfException.md#cls-ConfException)

Function to trigger operational subscriptions in similar to `#triggerSubscriptions(int[])`.

The caller will trigger all subscription points passed in the spointArray (or all operational data subscribers if this array is null), and the call will not return until the last subscriber has called [`CdbSubscription#sync(CdbSubscriptionSyncType)`](CdbSubscription.md#m-sync-e4ae9cc34a8a).

Since the generation of subscription notifications for operational data requires that the subscription lock is taken, this function implicitly attempts to take a "global" subscription lock. If the subscription lock is already taken, the function will by default return an Exception. o instead have it wait until the lock becomes available, EnumSet.of(CdbLockType.LOCK\_WAIT) can be passed as lockflags parameter.

**Parameters**

* `int[] spointArray` - int\[] array of subscription points or null
* `java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags` - null or EnumSet.of(CdbLockType.LOCK\_WAIT)

**Throws**

* `ConfException` - if triggering fails due to invalid subscription point(s) or lock acquisition failure
* `IOException` - if an I/O error occurs while communicating with the server

#### triggerSubscriptions(int\[])

```java
public synchronized void triggerSubscriptions(
    int[] spointArray
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Triggers Cdb subscription for configuration data.

This method makes it possible to trigger _CDB subscriptions_ for configuration data even though the configuration has not been modified.

The caller will trigger all subscription points passed in the `spointArray` array (or all subscribers if the array is of zero length) in priority order, and the call will not return until the last subscriber has called [`CdbSubscription#sync(CdbSubscriptionSyncType)`](CdbSubscription.md#m-sync-e4ae9cc34a8a).

The call is blocking and doesn't return until all subscribers have acknowledged the notification. That means that it is not possible to use the method in a cdb subscriber thread since it would cause a deadlock.

The subscription notification generated by this "synthetic" trigger will seem like a regular subscription notification to a subscription client. As such, it is possible to use `diffIterate` to traverse the changeset. CDB will make up this changeset in which all leafs in the configuration will appear to be set, and all list entries and presence containers will appear as if they are created.

If the client is a two-phase subscriber, a prepare notification will first be delivered and if any client aborts this synthetic transaction further delivery of subscription notification is suspended and an exception is returned to the caller of `triggerSubscriptions`.

The error is the result of mapping the `CONFD_ERRCODE` as set by the aborting client.

Note however that the configuration is still the way it is - so it is up to the caller of `triggerSubscriptions` to take appropriate action (for example: raising an alarm, restarting a subsystem, or even rebooting the system).

**Parameters**

* `int[] spointArray` - subscription points to trigger

**Throws**

* `ConfException` - If one or more subscription ids is passed in the `subids` array that are not valid, an `CdbException` will be thrown with error code (`getErrorCode`) set to `CONFD_ERR_PROTOUSAGE` will be returned and no subscriptions will be triggered
* `IOException` - On I/O error.

#### waitStart()

```java
public synchronized void waitStart() throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

This call waits until start-phase 1 is completed and _CDB_ is available.

If _CDB_ already is available (i.e. start-phase = 1) the call returns immediately. This can be used by a CDB client who is not synchronously started and only wants to wait until it can read its configuration.

**Throws**

* `CdbException` - Failed to waitStart for some reason
* `IOException` - Failed to read/write on the underlying socket
