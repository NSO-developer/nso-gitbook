# Cdb <a href="#cdb-cb7fc41768c9" id="cdb-cb7fc41768c9"></a>

```java
public class com.tailf.cdb.Cdb
    implements com.tailf.conf.MountIdInterface, AutoCloseable
```

Types: [MountIdInterface](../conf/MountIdInterface.md#mountidinterface-113d1b54dae0)

This class represents a connection to `ConfD/NCS` built in
 XML database.

 A connection is established upon a new instance of this class providing
 a `Socket` as its argument to the constructor. An object of this
 class is usually called a *"cdb socket"*.


 There are mainly two things that can be achieved through
 a connection to `CDB`:



- ***Starting a CDB Session*** - A CDB session is used to read
 configuration data, or read/write operational data. These are short-lived
 sessions that are established though a call to [`startSession()`](Cdb.md#startsession-ee121903dcfa).
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
 [`newSubscription()`](Cdb.md#newsubscription-6053c3ae88bb) method to create a new Cdb subscription to
 subscribe on CDB configuration changes.

**See also:** [`CdbSession`](CdbSession.md#cdbsession-9ffa54666283), [`CdbSubscription`](CdbSubscription.md#cdbsubscription-f17c8fe4dc81)

## Members

**Constructors**:

- [Cdb\(String, Socket\)](#cdb-21f829a256dd)
- [Cdb\(String, SocketAddress\)](#cdb-d6bb494b3f32)

**Methods**:

- [acceptTagPath\(\)](#accepttagpath-3efa26ad697b)
- [bufWrite\(int, byte\[\]\)](#bufwrite-08cae6911f4c)
- [close\(\)](#close-8107c6dc012b)
- [endSession\(\)](#endsession-1853baeb5d28)
- [getCompactionInfo\(CdbDbfileType\)](#getcompactioninfo-7f8cce00653a)
- [getCurrentSession\(\)](#getcurrentsession-2d75e562d728)
- [getMountId\(ConfPath\)](#getmountid-83243c09b7c3)
- [getName\(\)](#getname-2634b18b4a25)
- [getPhase\(\)](#getphase-5492112b72e7)
- [getSocket\(\)](#getsocket-d7da2de81b81)
- [getTxId\(\)](#gettxid-1817ce3409ba)
- [initiateCompaction\(\)](#initiatecompaction-2acf1b3661eb)
- [initiateDbfileCompaction\(CdbDbfileType\)](#initiatedbfilecompaction-324563a7582a)
- [isUseHTags\(\)](#isusehtags-9ad9d9c20c62)
- [newSubscription\(\)](#newsubscription-6053c3ae88bb)
- [requestTerm\(int\)](#requestterm-f568e63b5414)
- [requestTerm\(int, boolean, ConfEObject\)](#requestterm-79e4f0cddbef)
- [requestTerm\(int, ConfEObject\)](#requestterm-a8fce80da6f1)
- [setTimeout\(int\)](#settimeout-cbe758ecb5d8)
- [setUseForCdbUpgrade\(\)](#setuseforcdbupgrade-381558675127)
- [setUseForCdbUpgrade\(List\<ConfNamespace\>\)](#setuseforcdbupgrade-2a9450800b18)
- [setUseHTags\(boolean\)](#setusehtags-468584ecfc93)
- [startSession\(\)](#startsession-ee121903dcfa)
- [startSession\(CdbDBType\)](#startsession-6f137bd83c44)
- [startSession\(CdbDBType, EnumSet\<CdbLockType\>\)](#startsession-5269b0eb8b16)
- [startUpgradeSession\(\)](#startupgradesession-d9903213d87a)
- [startUpgradeSession\(CdbDBType\)](#startupgradesession-7352cb5553ec)
- [startUpgradeSession\(CdbDBType, EnumSet\<CdbLockType\>\)](#startupgradesession-8358fca8dbd6)
- [termRead\(int\)](#termread-0a27f7f4c68c)
- [termWrite\(int, ConfEObject\)](#termwrite-e14731c35ead)
- [toString\(\)](#tostring-e9d48c5503ef)
- [triggerOperSubscriptions\(int\[\]\)](#triggeropersubscriptions-975402006348)
- [triggerOperSubscriptions\(int\[\], EnumSet\<CdbLockType\>\)](#triggeropersubscriptions-e7869fd4a9dd)
- [triggerSubscriptions\(int\[\]\)](#triggersubscriptions-b7a5ff565df7)
- [waitStart\(\)](#waitstart-b5e7e06c0c83)

## Constructors

### Cdb(String, Socket) <a href="#cdb-21f829a256dd" id="cdb-21f829a256dd"></a>

```java
public Cdb(
    String name,
    java.net.Socket socket
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Creates a new instance of a `Cdb` socket supplying a
 established open socket to ConfD/NCS daemon.

 The `name` parameter is just a string which may
 occur in certain error/debug messages i.e for example in
 the *devel.log*.

 When establishing a connection to ConfD/NCS the
 [`MaapiSchemas`](../maapi/MaapiSchemas.md#maapischemas-821ac70b83b7) will be loaded once automatically
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

### Cdb(String, SocketAddress) <a href="#cdb-d6bb494b3f32" id="cdb-d6bb494b3f32"></a>

```java
public Cdb(
    String name,
    java.net.SocketAddress address
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Creates a new instance of a `Cdb` socket supplying an
 address to the ConfD/NCS server.

 The `name` parameter is just a string which may
 occur in certain error/debug messages i.e for example in
 the *devel.log*.

 When establishing a connection to ConfD/NCS the
 [`MaapiSchemas`](../maapi/MaapiSchemas.md#maapischemas-821ac70b83b7) will be loaded once automatically
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

### acceptTagPath() <a href="#accepttagpath-3efa26ad697b" id="accepttagpath-3efa26ad697b"></a>

```java
public synchronized boolean acceptTagPath()
```

Whether tag paths are accepted (always false for Cdb implementation).

**Returns:** false

### bufWrite(int, byte[]) <a href="#bufwrite-08cae6911f4c" id="bufwrite-08cae6911f4c"></a>

```java
protected synchronized void bufWrite(
    int op,
    byte[] bytes
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Write raw bytes for an opcode.

**Parameters**

- `int op` - Operation code
- `byte[] bytes` - Payload bytes

**Throws**

- `ConfException` - Protocol error
- `IOException` - I/O error

### close() <a href="#close-8107c6dc012b" id="close-8107c6dc012b"></a>

```java
public void close() throws java.io.IOException
```

Closes the resources held by this `Cdb` socket.

**Throws**

- `IOException` - If I/O Error when closing resources
 held by this `Cdb` socket

### endSession() <a href="#endsession-1853baeb5d28" id="endsession-1853baeb5d28"></a>

```java
protected void endSession()
```

### getCompactionInfo(CdbDbfileType) <a href="#getcompactioninfo-7f8cce00653a" id="getcompactioninfo-7f8cce00653a"></a>

```java
public synchronized com.tailf.cdb.CdbCompactionInfo getCompactionInfo(
    com.tailf.cdb.CdbDbfileType dbfile
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbCompactionInfo](CdbCompactionInfo.md#cdbcompactioninfo-5ec90640fdd8), [CdbDbfileType](CdbDbfileType.md#cdbdbfiletype-a0872754369c), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Retrieves compaction information on a CDB file

 The method retrieves compaction information on the CDB file
 specified by `dbfile`.

**Parameters**

- `com.tailf.cdb.CdbDbfileType dbfile` - CDB file to collect info

**Returns:** [`CdbCompactionInfo`](CdbCompactionInfo.md#cdbcompactioninfo-5ec90640fdd8) containing size and timing data

**Throws**

- `CdbException` - Failed to get compaction info
- `IOException` - Failed to read/write on the cdb socket

### getCurrentSession() <a href="#getcurrentsession-2d75e562d728" id="getcurrentsession-2d75e562d728"></a>

```java
public com.tailf.cdb.CdbSession getCurrentSession()
```

Types: [CdbSession](CdbSession.md#cdbsession-9ffa54666283)

Retrieve the current `CdbSession` started on this
  `Cdb` socket.

**Returns:** The current CdbSession started on this Cdb, null
       if no current CdbSession is started on this Cdb Socket.

### getMountId(ConfPath) <a href="#getmountid-83243c09b7c3" id="getmountid-83243c09b7c3"></a>

```java
public synchronized java.util.List<String> getMountId(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Retrieve mount identifiers for a path.

**Parameters**

- `com.tailf.conf.ConfPath path` - Path to query

**Returns:** List of mount id strings

**Throws**

- `ConfException` - On retrieval error

### getName() <a href="#getname-2634b18b4a25" id="getname-2634b18b4a25"></a>

```java
public String getName()
```

Retrieve the name of this `Cdb` socket.

**Returns:** The name of this Cdb socket instance

### getPhase() <a href="#getphase-5492112b72e7" id="getphase-5492112b72e7"></a>

```java
public synchronized com.tailf.cdb.CdbPhase getPhase() throws com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbPhase](CdbPhase.md#cdbphase-a1a97094371f), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Returns the start-phase CDB database is currently in.
 Also if CDB is in *phase 0*
 and has initiated an init transaction (to load any init files) the flag
 [`CdbPhase#FLAG_INIT`](CdbPhase.md#flag_init-fb43c5f6fc84) is set in the flags field correspondingly if
 an upgrade session is started the [`CdbPhase#FLAG_UPGRADE`](CdbPhase.md#flag_upgrade-4218f2511062) is set.

**Returns:** The current [`CdbPhase`](CdbPhase.md#cdbphase-a1a97094371f)

**Throws**

- `CdbException` - Failed to get phase
- `IOException` - Failed to read/write cdb socket

### getSocket() <a href="#getsocket-d7da2de81b81" id="getsocket-d7da2de81b81"></a>

```java
public java.net.Socket getSocket()
```

Retrieve the underlying socket used by this `Cdb` instance

**Returns:** The underlying socket

### getTxId() <a href="#gettxid-1817ce3409ba" id="gettxid-1817ce3409ba"></a>

```java
public synchronized com.tailf.cdb.CdbTxId getTxId() throws com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbTxId](CdbTxId.md#cdbtxid-d5b5c859de80), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

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

### initiateCompaction() <a href="#initiatecompaction-2acf1b3661eb" id="initiatecompaction-2acf1b3661eb"></a>

```java
public synchronized void initiateCompaction() throws com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Initiates compaction on CDB files:

 The method initiates compaction on all CDB files
 defined as `CdbDbfileType`.

**Throws**

- `CdbException` - Failed to initiate the compaction
- `IOException` - Failed to read/write on the cdb socket

### initiateDbfileCompaction(CdbDbfileType) <a href="#initiatedbfilecompaction-324563a7582a" id="initiatedbfilecompaction-324563a7582a"></a>

```java
public synchronized void initiateDbfileCompaction(
    com.tailf.cdb.CdbDbfileType dbfile
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbDbfileType](CdbDbfileType.md#cdbdbfiletype-a0872754369c), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Initiates compaction on a CDB file.

 The method initiates compaction on the CDB file
 specified by `dbfile`.

**Parameters**

- `com.tailf.cdb.CdbDbfileType dbfile` - CDB file to compact

**Throws**

- `CdbException` - Failed to initiate the compaction
- `IOException` - Failed to read/write on the cdb socket

### isUseHTags() <a href="#isusehtags-9ad9d9c20c62" id="isusehtags-9ad9d9c20c62"></a>

```java
protected boolean isUseHTags()
```

Is this Cdb configured to use HKeyPath

**Returns:** true if HKeyPaths are used

### newSubscription() <a href="#newsubscription-6053c3ae88bb" id="newsubscription-6053c3ae88bb"></a>

```java
public com.tailf.cdb.CdbSubscription newSubscription()
```

Types: [CdbSubscription](CdbSubscription.md#cdbsubscription-f17c8fe4dc81)

Creates a new *CDB Subscription*.

**Returns:** the created [`CdbSubscription`](CdbSubscription.md#cdbsubscription-f17c8fe4dc81)

### requestTerm(int) <a href="#requestterm-f568e63b5414" id="requestterm-f568e63b5414"></a>

```java
protected synchronized com.tailf.conf.ConfResponse requestTerm(
    int op
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](../conf/ConfResponse.md#confresponse-fd02dad17b49), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Send a request. This is the same as
 `requestTerm(int, boolean, ConfEObject)` but with no arguments
 and with isRel set to false (this is done in ConfInternal).

**Parameters**

- `int op` - Operation code

**Returns:** Response from the server

**Throws**

- `ConfException` - Protocol/Server error
- `IOException` - I/O error

### requestTerm(int, boolean, ConfEObject) <a href="#requestterm-79e4f0cddbef" id="requestterm-79e4f0cddbef"></a>

```java
protected synchronized com.tailf.conf.ConfResponse requestTerm(
    int op,
    boolean isRel,
    com.tailf.proto.ConfEObject arg
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](../conf/ConfResponse.md#confresponse-fd02dad17b49), [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

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

### requestTerm(int, ConfEObject) <a href="#requestterm-a8fce80da6f1" id="requestterm-a8fce80da6f1"></a>

```java
protected synchronized com.tailf.conf.ConfResponse requestTerm(
    int op,
    com.tailf.proto.ConfEObject arg
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](../conf/ConfResponse.md#confresponse-fd02dad17b49), [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Send a request with a single term argument.

**Parameters**

- `int op` - Operation code
- `com.tailf.proto.ConfEObject arg` - Argument term

**Returns:** Response

**Throws**

- `ConfException` - Protocol/ConfD error
- `IOException` - I/O error

### setTimeout(int) <a href="#settimeout-cbe758ecb5d8" id="settimeout-cbe758ecb5d8"></a>

```java
public void setTimeout(int timeoutSecs) throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

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

### setUseForCdbUpgrade() <a href="#setuseforcdbupgrade-381558675127" id="setuseforcdbupgrade-381558675127"></a>

```java
public void setUseForCdbUpgrade()
```

Sets this Cdb and the session it creates to be used for Cdb data
 upgrades. This is a specific startphase 0 use case.

### setUseForCdbUpgrade(List&lt;ConfNamespace&gt;) <a href="#setuseforcdbupgrade-2a9450800b18" id="setuseforcdbupgrade-2a9450800b18"></a>

```java
public synchronized void setUseForCdbUpgrade(java.util.List<com.tailf.conf.ConfNamespace> removedNs)
```

Types: [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1)

Sets this Cdb and the session it creates to be used for Cdb data
 upgrades. This is a specific startphase 0 use case.
 If a yang model is completely removed it needs to be temporarily
 reinstalled for CDB to be able to refer to it.

**Parameters**

- `java.util.List<com.tailf.conf.ConfNamespace> removedNs` - List of removed ConfNamespace used earlier

### setUseHTags(boolean) <a href="#setusehtags-468584ecfc93" id="setusehtags-468584ecfc93"></a>

```java
protected void setUseHTags(boolean useHTags)
```

Set this Cdb to use HKeyPath

**Parameters**

- `boolean useHTags` - true to use HKeyPath tags, false otherwise

### startSession() <a href="#startsession-ee121903dcfa" id="startsession-ee121903dcfa"></a>

```java
public com.tailf.cdb.CdbSession startSession() throws com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbSession](CdbSession.md#cdbsession-9ffa54666283), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Starts a new *CDB Session* on an already
 established `Cdb` against [`CdbDBType#CDB_RUNNING`](CdbDBType.md#cdb_running-a1f43295f116)
 datastore with [`CdbLockType#LOCK_SESSION`](CdbLockType.md#lock_session-306b0dde39ea) lock.

**Returns:** The started [`CdbSession`](CdbSession.md#cdbsession-9ffa54666283) instance

**Throws**

- `IOException` - If an I/O error occurs on the underlying socket
         while initiating the session.
- `ConfException` - If ConfD/NCS rejects or fails to create the
         session.

### startSession(CdbDBType) <a href="#startsession-6f137bd83c44" id="startsession-6f137bd83c44"></a>

```java
public com.tailf.cdb.CdbSession startSession(
    com.tailf.cdb.CdbDBType dbtype
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbSession](CdbSession.md#cdbsession-9ffa54666283), [CdbDBType](CdbDBType.md#cdbdbtype-5ae1aed3f97a), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Starts a new *CDB Session* on an already
 established `Cdb`.

 The method starts a new session against the datastore
 specified by `dbtype`.

**Parameters**

- `com.tailf.cdb.CdbDBType dbtype` - Datastore to establish session to

**Returns:** The started [`CdbSession`](CdbSession.md#cdbsession-9ffa54666283) instance

**Throws**

- `IOException` - If an I/O error occurs on the underlying socket
         while initiating the session.
- `ConfException` - If ConfD/NCS rejects or fails to create the
         session.

### startSession(CdbDBType, EnumSet&lt;CdbLockType&gt;) <a href="#startsession-5269b0eb8b16" id="startsession-5269b0eb8b16"></a>

```java
public com.tailf.cdb.CdbSession startSession(
    com.tailf.cdb.CdbDBType dbtype,
    java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbSession](CdbSession.md#cdbsession-9ffa54666283), [CdbDBType](CdbDBType.md#cdbdbtype-5ae1aed3f97a), [CdbLockType](CdbLockType.md#cdblocktype-1d165621c0a3), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

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

**Returns:** The started [`CdbSession`](CdbSession.md#cdbsession-9ffa54666283)

**Throws**

- `IOException` - If an I/O error occurs on the underlying socket
         while initiating the session.
- `ConfException` - If ConfD/NCS rejects or fails to create the
         session.

### startUpgradeSession() <a href="#startupgradesession-d9903213d87a" id="startupgradesession-d9903213d87a"></a>

```java
public com.tailf.cdb.CdbUpgradeSession startUpgradeSession() throws com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbUpgradeSession](CdbUpgradeSession.md#cdbupgradesession-a832ac9abf0d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Similar to [`startSession()`](Cdb.md#startsession-ee121903dcfa) but always returns
 a CdbUpgradeSession.

**Returns:** The started [`CdbUpgradeSession`](CdbUpgradeSession.md#cdbupgradesession-a832ac9abf0d)

**Throws**

- `IOException` - If an I/O error occurs on the underlying socket
         while initiating the session.
- `ConfException` - If ConfD/NCS rejects or fails to create the
         session.

### startUpgradeSession(CdbDBType) <a href="#startupgradesession-7352cb5553ec" id="startupgradesession-7352cb5553ec"></a>

```java
public com.tailf.cdb.CdbUpgradeSession startUpgradeSession(
    com.tailf.cdb.CdbDBType dbtype
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbUpgradeSession](CdbUpgradeSession.md#cdbupgradesession-a832ac9abf0d), [CdbDBType](CdbDBType.md#cdbdbtype-5ae1aed3f97a), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Similar to `startSession(CdbDBType)` but always returns
 a CdbUpgradeSession.

**Parameters**

- `com.tailf.cdb.CdbDBType dbtype` - Datastore to establish session to

**Returns:** The started [`CdbUpgradeSession`](CdbUpgradeSession.md#cdbupgradesession-a832ac9abf0d)

**Throws**

- `IOException` - If an I/O error occurs on the underlying socket
         while initiating the session.
- `ConfException` - If ConfD/NCS rejects or fails to create the
         session.

### startUpgradeSession(CdbDBType, EnumSet&lt;CdbLockType&gt;) <a href="#startupgradesession-8358fca8dbd6" id="startupgradesession-8358fca8dbd6"></a>

```java
public com.tailf.cdb.CdbUpgradeSession startUpgradeSession(
    com.tailf.cdb.CdbDBType dbtype,
    java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbUpgradeSession](CdbUpgradeSession.md#cdbupgradesession-a832ac9abf0d), [CdbDBType](CdbDBType.md#cdbdbtype-5ae1aed3f97a), [CdbLockType](CdbLockType.md#cdblocktype-1d165621c0a3), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Similar to `startSession(CdbDBType, EnumSet)` but always returns
 a CdbUpgradeSession.

**Parameters**

- `com.tailf.cdb.CdbDBType dbtype` - Datastore to establish session to
- `java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags` - EnumSet of CdbLockType flags

**Returns:** The started [`CdbUpgradeSession`](CdbUpgradeSession.md#cdbupgradesession-a832ac9abf0d)

**Throws**

- `IOException` - If an I/O error occurs on the underlying socket
         while initiating the session.
- `ConfException` - If ConfD/NCS rejects or fails to create the
         session.

### termRead(int) <a href="#termread-0a27f7f4c68c" id="termread-0a27f7f4c68c"></a>

```java
protected synchronized com.tailf.conf.ConfResponse termRead(
    int op
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](../conf/ConfResponse.md#confresponse-fd02dad17b49), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Read a term response for a prior write.

**Parameters**

- `int op` - Expected opcode

**Returns:** Response containing term or error

**Throws**

- `ConfException` - Protocol/ConfD error
- `IOException` - I/O error

### termWrite(int, ConfEObject) <a href="#termwrite-e14731c35ead" id="termwrite-e14731c35ead"></a>

```java
protected synchronized void termWrite(
    int op,
    com.tailf.proto.ConfEObject arg
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Write a term.

**Parameters**

- `int op` - Operation code
- `com.tailf.proto.ConfEObject arg` - Argument term

**Throws**

- `ConfException` - Protocol/ConfD error
- `IOException` - I/O error

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Returns a concise string with name, socket and current session if any.

**Returns:** The string representation

### triggerOperSubscriptions(int[]) <a href="#triggeropersubscriptions-975402006348" id="triggeropersubscriptions-975402006348"></a>

```java
public synchronized void triggerOperSubscriptions(
    int[] spointArray
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

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

### triggerOperSubscriptions(int[], EnumSet&lt;CdbLockType&gt;) <a href="#triggeropersubscriptions-e7869fd4a9dd" id="triggeropersubscriptions-e7869fd4a9dd"></a>

```java
public synchronized void triggerOperSubscriptions(
    int[] spointArray,
    java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CdbLockType](CdbLockType.md#cdblocktype-1d165621c0a3), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Function to trigger operational subscriptions in similar to
  [`triggerSubscriptions(int[])`](Cdb.md#triggersubscriptions-b7a5ff565df7).

  The caller will trigger all subscription points passed in the
  spointArray (or all operational data subscribers if this array is null),
  and the call will not return until the last subscriber has called
  [`CdbSubscription#sync(CdbSubscriptionSyncType)`](CdbSubscription.md#sync-e4ae9cc34a8a).

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

### triggerSubscriptions(int[]) <a href="#triggersubscriptions-b7a5ff565df7" id="triggersubscriptions-b7a5ff565df7"></a>

```java
public synchronized void triggerSubscriptions(
    int[] spointArray
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Triggers Cdb subscription for configuration data.

 This method makes it possible to trigger *CDB subscriptions* for
 configuration data even though the configuration has not been modified.


 The caller will trigger all subscription points passed in the
 `spointArray` array (or all subscribers if the array is
 of zero length) in priority
 order, and the call will not return until the last subscriber has called
 [`CdbSubscription#sync(CdbSubscriptionSyncType)`](CdbSubscription.md#sync-e4ae9cc34a8a).

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

### waitStart() <a href="#waitstart-b5e7e06c0c83" id="waitstart-b5e7e06c0c83"></a>

```java
public synchronized void waitStart() throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This call waits until start-phase 1 is completed and *CDB*
 is available.

 If *CDB* already is available
 (i.e. start-phase = 1) the call returns
 immediately. This can be used by a CDB client who is not synchronously
 started and only wants to wait until it can read its configuration.

**Throws**

- `CdbException` - Failed to waitStart for some reason
- `IOException` - Failed to read/write on the underlying socket
