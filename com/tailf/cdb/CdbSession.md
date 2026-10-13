# CdbSession <a href="#cdbsession-9ffa54666283" id="cdbsession-9ffa54666283"></a>

```java
public class com.tailf.cdb.CdbSession
```

The class `CdbSession` represents a session against
 the Cdb database.

 It contains methods for reading and writing to/from the CDB.


 A Cdb session is a short-lived sessions where it is possible to read
 configuration data , and to read and write operational
 data.


 When starting a Cdb Session against running datastore the
 (with the flag  CdbDBType.CDB_RUNNING )
 entire configuration part of CDB is locked for writing while any
 CDB read session is active.

 If it is considered necessary to have more
 detailed control over some aspects of the
 CDB session use the method `Cdb#startSession(CdbDBType,EnumSet)`
 where the `EnumSet` contains a set of lock flags for this method.


 The flags affect sessions for the different database types as follows:



- ***CDB_RUNNING*** -
 `LOCK_SESSION` obtains a read lock for the complete
 session, i.e. using this flag alone is equivalent to calling
 [`Cdb#startSession()`](Cdb.md#startsession-ee121903dcfa) or [`Cdb#startSession(CdbDBType)`](Cdb.md#startsession-6f137bd83c44).


 `LOCK_REQUEST` obtains a read lock only for the
 duration of each read request. This means that values of
 elements read in different requests may be inconsistent with each other,
 and the consequences of this must be carefully considered.
 In particular, the use of `getNumberOfInstances(ConfPath)` and the [n]
 "integer index" notation in  keypaths is inherently unsafe in this mode.


 *Note: The implementation will not
 actually obtain a lock for a single-value request, since that is an
 atomic operation anyway.*

 The `LOCK_PARTIAL` flag is not allowed.

   - ***CDB_STARTUP*** - Same as CDB_RUNNING.

     - ***CDB_PRE_COMMIT_RUNNING***
  - This database type does not have any locks, which means that it
 is an error to call `startSession` with any lock flags.

       - ***CDB_OPERATIONAL*** -
 `LOCK_REQUEST` obtains a "subscription lock" for the
 duration of each write request. This can be described as an
 "advisory exclusive" lock, i.e. only one client at a time can hold
 the lock (unless `LOCK_PARTIAL` is used),
 but the lock does not affect clients that do not attempt to obtain it.
 It also does not affect the reading of operational data.

 The purpose of this lock is to indicate that the client
 wants the write operation to generate subscription notifications.
 The lock remains in effect until any/all subscription notifications
 generated as a result of the write has been delivered.

 If the `LOCK_PARTIAL` flag is used together with
 `LOCK_REQUEST`,
 the "subscription lock" only applies to the smallest data subtree that
 includes all the data in the write request.
 This means that multiple writes that generates subscription
 notifications, and delivery of the
 corresponding notifications, can proceed in parallel as long as they
 affect disjunct parts of the data tree.

 The `LOCK_SESSION` flag is not allowed.


 In all cases of using `LOCK_SESSION` or
 `LOCK_REQUEST`
 described above, adding the `LOCK_WAIT` flag means that
 instead of failing with `ErrorCode.ERR_LOCKED` if the lock
 can not be obtained immediately, requests will wait for the lock to
 become available. When used with
 `LOCK_SESSION` it pertains to `startSession` itself,
 with `LOCK_REQUEST` it pertains to the individual requests.



 An example usage of stating/ending a CDB Session against the running
 datastore:



```
 // create new socket and Cdb instance.
 // int port = Conf.PORT; // ConfD TCP; NCS uses Conf.NCS_PATH (Unix socket)
 Socket sock = new Socket(host, port);
 Cdb cdb = new Cdb(test,sock);

 // start session towards running data ( with the lock LOCK_SESSION )
 CdbSession sess = cdb.startSession(CdbDBType.CDB_RUNNING);
 // get a leaf using a specified path

 ConfPath path = new ConfPath(/mtest/servers/server{%s}/port,
   new Object[] { new String(www) });
 ConfValue val = sess.getElem(path);
 // now do something with the read value
 ....
 // end session when we are finished
 sess.endSession();
 sock.close();
```

**Related classes**

- [CdbUpgradeSession](CdbUpgradeSession.md#cdbupgradesession-a832ac9abf0d)

## Members

**Constructors**:

- [CdbSession\(Cdb\)](#cdbsession-1c19a6f495f3)
- [CdbSession\(Cdb, CdbDBType\)](#cdbsession-5164f17f6a96)
- [CdbSession\(Cdb, CdbDBType, EnumSet\<CdbLockType\>\)](#cdbsession-82f45cd9e50f)

**Fields**:

- [cdb](#cdb-40abbcead21f)
- [dbType](#dbtype-578b3a70637a)
- [lockflags](#lockflags-8ddca1b4c2e4)

**Methods**:

- [cd\(ConfPath\)](#cd-a902c91e6177)
- [cd\(String, Object\[\]\)](#cd-751c8b439d16)
- [create\(ConfPath\)](#create-02589a4ee236)
- [create\(String, Object\[\]\)](#create-8d8ef9670e7f)
- [delete\(ConfPath\)](#delete-46ab41293f59)
- [delete\(String, Object\[\]\)](#delete-a6dae6a18c6e)
- [endSession\(\)](#endsession-1853baeb5d28)
- [exists\(ConfPath\)](#exists-afa14dd11748)
- [exists\(String, Object\[\]\)](#exists-c95896218534)
- [getCase\(String, ConfPath\)](#getcase-db036ac6c713)
- [getCase\(String, String, Object\[\]\)](#getcase-9058de2e1364)
- [getCdb\(\)](#getcdb-62d7a3429687)
- [getcwd\(\)](#getcwd-18c6eed4f1fa)
- [getcwdPath\(\)](#getcwdpath-a9fa1536fad1)
- [getDbType\(\)](#getdbtype-9503dd2b103d)
- [getElem\(ConfPath\)](#getelem-f8219fa65c5d)
- [getElem\(String, Object\[\]\)](#getelem-8ec719438ea8)
- [getNumberOfInstances\(ConfPath\)](#getnumberofinstances-41d82cec9221)
- [getNumberOfInstances\(String, Object\[\]\)](#getnumberofinstances-4ff46f9afb5c)
- [getObject\(int, ConfPath\)](#getobject-97126abcba49)
- [getObject\(int, String, Object\[\]\)](#getobject-8f535bb4e0e8)
- [getObjects\(int, int, int, ConfPath\)](#getobjects-d25a1860a73f)
- [getObjects\(int, int, int, String, Object\[\]\)](#getobjects-9108870a6290)
- [getValues\(ConfXMLParam\[\], ConfPath\)](#getvalues-b30d01896278)
- [getValues\(ConfXMLParam\[\], String, Object\[\]\)](#getvalues-f93a502602ef)
- [index\(ConfPath\)](#index-339d675c9a64)
- [index\(String, Object\[\]\)](#index-cae5f09ba6fb)
- [isDefault\(ConfPath\)](#isdefault-a9229eae64cf)
- [isDefault\(String, Object\[\]\)](#isdefault-8c3502a0ab6d)
- [nextIndex\(ConfPath\)](#nextindex-ceef3a478d50)
- [nextIndex\(String, Object\[\]\)](#nextindex-c2b059f89584)
- [popd\(\)](#popd-b092d2d9048f)
- [pushd\(ConfPath\)](#pushd-d9d906674b7a)
- [pushd\(String, Object\[\]\)](#pushd-fd6a4c1b1c8d)
- [setCase\(String, String, ConfPath\)](#setcase-3792b2775b7f)
- [setCase\(String, String, String, Object\[\]\)](#setcase-908203af825d)
- [setElem\(ConfValue, ConfPath\)](#setelem-356e5e479e47)
- [setElem\(ConfValue, String, Object\[\]\)](#setelem-7fc14a355edc)
- [setNamespace\(ConfNamespace\)](#setnamespace-30316a480cfa)
- [setObject\(ConfValue\[\], ConfPath\)](#setobject-741f2a72045e)
- [setObject\(ConfValue\[\], String, Object\[\]\)](#setobject-5edb7e0ee677)
- [setValues\(ConfXMLParam\[\], ConfPath\)](#setvalues-0755e36fbd2c)
- [setValues\(ConfXMLParam\[\], String, Object\[\]\)](#setvalues-824d05856f15)
- [setValues\(List\<ConfXMLParam\>, ConfPath\)](#setvalues-970140dc0796)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### CdbSession(Cdb) <a href="#cdbsession-1c19a6f495f3" id="cdbsession-1c19a6f495f3"></a>

```java
public CdbSession(com.tailf.cdb.Cdb cdb) throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Cdb](Cdb.md#cdb-cb7fc41768c9), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Creates a new *CDB session*
 instance against the running database. (dbtype
 set to `CDB_RUNNING`)

**Parameters**

- `com.tailf.cdb.Cdb cdb` - The CDB instance the session belongs to

### CdbSession(Cdb, CdbDBType) <a href="#cdbsession-5164f17f6a96" id="cdbsession-5164f17f6a96"></a>

```java
public CdbSession(
    com.tailf.cdb.Cdb cdb,
    com.tailf.cdb.CdbDBType dbtype
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [Cdb](Cdb.md#cdb-cb7fc41768c9), [CdbDBType](CdbDBType.md#cdbdbtype-5ae1aed3f97a), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Starts a new session on an already connected *Cdb* instance.

**Parameters**

- `com.tailf.cdb.Cdb cdb` - The CDB instance with a socket connected to ConfD/NCS.
- `com.tailf.cdb.CdbDBType dbtype` - see [`CdbDBType`](CdbDBType.md#cdbdbtype-5ae1aed3f97a)

**Throws**

- `CdbException` - Failed to start session
- `IOException` - Failed to read/write socket

### CdbSession(Cdb, CdbDBType, EnumSet&lt;CdbLockType&gt;) <a href="#cdbsession-82f45cd9e50f" id="cdbsession-82f45cd9e50f"></a>

```java
public CdbSession(
    com.tailf.cdb.Cdb cdb,
    com.tailf.cdb.CdbDBType dbtype,
    java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [Cdb](Cdb.md#cdb-cb7fc41768c9), [CdbDBType](CdbDBType.md#cdbdbtype-5ae1aed3f97a), [CdbLockType](CdbLockType.md#cdblocktype-1d165621c0a3), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Starts a new session on an already established Cdb with
 explicitly given lockflags.

**Parameters**

- `com.tailf.cdb.Cdb cdb`
- `com.tailf.cdb.CdbDBType dbtype` - see [`CdbDBType`](CdbDBType.md#cdbdbtype-5ae1aed3f97a)
- `java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags` - [`CdbLockType`](CdbLockType.md#cdblocktype-1d165621c0a3)

**Throws**

- `IOException`
- `ConfException`


## Fields

### cdb <a href="#cdb-40abbcead21f" id="cdb-40abbcead21f"></a>

```java
protected com.tailf.cdb.Cdb cdb = null;
```

Types: [Cdb](Cdb.md#cdb-cb7fc41768c9)

### dbType <a href="#dbtype-578b3a70637a" id="dbtype-578b3a70637a"></a>

```java
protected com.tailf.cdb.CdbDBType dbType = null;
```

Types: [CdbDBType](CdbDBType.md#cdbdbtype-5ae1aed3f97a)

### lockflags <a href="#lockflags-8ddca1b4c2e4" id="lockflags-8ddca1b4c2e4"></a>

```java
protected java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags = null;
```

Types: [CdbLockType](CdbLockType.md#cdblocktype-1d165621c0a3)


## Methods

### cd(ConfPath) <a href="#cd-a902c91e6177" id="cd-a902c91e6177"></a>

```java
public synchronized void cd(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Changes the working directory.

**Parameters**

- `com.tailf.conf.ConfPath path` - ConfPath object

**Throws**

- `CdbException` - Failed to 'cd'
- `IOException` - Failed to read/write cdb socket

### cd(String, Object[]) <a href="#cd-751c8b439d16" id="cd-751c8b439d16"></a>

```java
public synchronized void cd(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Change working directory to container specified by path string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `ConfException`
- `IOException`

### create(ConfPath) <a href="#create-02589a4ee236" id="create-02589a4ee236"></a>

```java
public synchronized void create(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Create a new optional element or list entry. Note that for container
 elements, sub-elements will not exist until created or set via some of
 the other functions, thus doing implicit create via
 `setObject(ConfValue[], ConfPath)` or
 `setValues(ConfXMLParam[], ConfPath)` may be preferred in this
 case.

**Parameters**

- `com.tailf.conf.ConfPath path` - ConfPath object

**Throws**

- `CdbException` - Failed to create
- `IOException` - Failed to write to cdb socket

### create(String, Object[]) <a href="#create-8d8ef9670e7f" id="create-8d8ef9670e7f"></a>

```java
public synchronized void create(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

similar to `create(ConfPath)` but specifies element using path
 string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `ConfException`
- `IOException`

### delete(ConfPath) <a href="#delete-46ab41293f59" id="delete-46ab41293f59"></a>

```java
public synchronized void delete(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Delete an optional element or list entry and all its child elements.

**Parameters**

- `com.tailf.conf.ConfPath path` - ConfPath object

**Throws**

- `CdbException` - Failed to delete element
- `IOException` - Failed to read/write cdb socket

### delete(String, Object[]) <a href="#delete-a6dae6a18c6e" id="delete-a6dae6a18c6e"></a>

```java
public synchronized void delete(
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

similar to `delete(ConfPath)` but specifies element using path
 string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `IOException`
- `ConfException`

### endSession() <a href="#endsession-1853baeb5d28" id="endsession-1853baeb5d28"></a>

```java
public synchronized void endSession() throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Ends the data session

**Throws**

- `CdbException` - Failed to end session
- `IOException` - Failed to read/write cdb socket

### exists(ConfPath) <a href="#exists-afa14dd11748" id="exists-afa14dd11748"></a>

```java
public synchronized boolean exists(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Containers and leafs in a YANG model may be optional. This function
 checks whether an element exists in the configuration. Returns true or
 false.

**Parameters**

- `com.tailf.conf.ConfPath path` - ConfPath object

**Throws**

- `CdbException` - Failed to check exists
- `IOException` - Failed to read/write cdb socket

### exists(String, Object[]) <a href="#exists-c95896218534" id="exists-c95896218534"></a>

```java
public synchronized boolean exists(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Checks whether an element exists. The element is specified using a path
 string and optionally string substitution parameters

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** true if exists

**Throws**

- `ConfException`
- `IOException`

### getCase(String, ConfPath) <a href="#getcase-db036ac6c713" id="getcase-db036ac6c713"></a>

```java
public synchronized com.tailf.conf.ConfObject getCase(
    String choice,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Retrieve the currently selected case.


 Same functionality as [`getCase(String, String, Object...)`](CdbSession.md#getcase-9058de2e1364) but
 takes a already constructed `ConfPath` object as argument
 instead of fmt, arguments.

**Parameters**

- `String choice` - the name of choice
- `com.tailf.conf.ConfPath path` - `ConfPath` pointing to the choice

**Returns:** ConfObject case value as `ConfTag`

**Throws**

- `IOException`
- `ConfException`

### getCase(String, String, Object[]) <a href="#getcase-9058de2e1364" id="getcase-9058de2e1364"></a>

```java
public synchronized com.tailf.conf.ConfObject getCase(
    String choice,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Retrieve the currently selected case.


 When we use the YANG choice construct in the data model, this method
 can be used to find the currently selected case, avoiding useless
 `getElem(ConfPath)` etc requests for elements
 that belong to other
 cases.



 The `fmt` give the path to the container where the
 choice is defined,



 The `choice` is the name of the choice.
 The case value is returned as type `ConfTag`.


 If no case is currently selected (i.e. for an optional choice
 that does not have a default case), the function will fail with a an
 exception with code `ConfException.ERR_NOEXISTS`.

**Parameters**

- `String choice` - the name of the choice
- `String fmt` - format string pointing to the choice
- `Object[] arguments` - replacement arguments for fmt string

**Returns:** ConfObject case value as `ConfTag`

**Throws**

- `IOException`
- `ConfException`

### getCdb() <a href="#getcdb-62d7a3429687" id="getcdb-62d7a3429687"></a>

```java
public com.tailf.cdb.Cdb getCdb()
```

Types: [Cdb](Cdb.md#cdb-cb7fc41768c9)

### getcwd() <a href="#getcwd-18c6eed4f1fa" id="getcwd-18c6eed4f1fa"></a>

```java
public synchronized String getcwd() throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Returns the current position as previously set by `cd(ConfPath)`,
 `pushd(ConfPath)`, or [`popd()`](CdbSession.md#popd-b092d2d9048f) as a string.

**Throws**

- `CdbException` - Failed to 'getcwd'
- `IOException` - Failed to read/write cdb socket

### getcwdPath() <a href="#getcwdpath-a9fa1536fad1" id="getcwdpath-a9fa1536fad1"></a>

```java
public synchronized com.tailf.conf.ConfObject[] getcwdPath() throws com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Returns the current position as previously set by `cd(ConfPath)`,
 `pushd(ConfPath)`, or [`popd()`](CdbSession.md#popd-b092d2d9048f) as a
 `ConfObject` array.

**Throws**

- `CdbException` - Failed to 'getcwd'
- `IOException` - Failed to read/write cdb socket

### getDbType() <a href="#getdbtype-9503dd2b103d" id="getdbtype-9503dd2b103d"></a>

```java
public com.tailf.cdb.CdbDBType getDbType()
```

Types: [CdbDBType](CdbDBType.md#cdbdbtype-5ae1aed3f97a)

retrieve the dbType for this session.

**Returns:** CdbDBType

### getElem(ConfPath) <a href="#getelem-f8219fa65c5d" id="getelem-f8219fa65c5d"></a>

```java
public synchronized com.tailf.conf.ConfValue getElem(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This reads a a value from the path. The path must lead to a leaf element
 in the XML data tree.

**Parameters**

- `com.tailf.conf.ConfPath path` - The path

**Throws**

- `CdbException` - Failed to get element
- `IOException` - Failed to read/write cdb socket

### getElem(String, Object[]) <a href="#getelem-8ec719438ea8" id="getelem-8ec719438ea8"></a>

```java
public synchronized com.tailf.conf.ConfValue getElem(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

similar to `getElem(ConfPath)` but specifies element using path
 string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** element represented by a ConfValue

**Throws**

- `ConfException`
- `IOException`

### getNumberOfInstances(ConfPath) <a href="#getnumberofinstances-41d82cec9221" id="getnumberofinstances-41d82cec9221"></a>

```java
public synchronized int getNumberOfInstances(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Returns the number of elements of a container type.

**Parameters**

- `com.tailf.conf.ConfPath path` - The path

**Throws**

- `CdbException` - Failed to get number of instances
- `IOException` - Failed to read/write cdb socket

### getNumberOfInstances(String, Object[]) <a href="#getnumberofinstances-4ff46f9afb5c" id="getnumberofinstances-4ff46f9afb5c"></a>

```java
public synchronized int getNumberOfInstances(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

similar to `getNumberOfInstances(ConfPath)` but specifies element
  using path string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** number of instances

**Throws**

- `ConfException`
- `IOException`

### getObject(int, ConfPath) <a href="#getobject-97126abcba49" id="getobject-97126abcba49"></a>

```java
public synchronized com.tailf.conf.ConfObject[] getObject(
    int numOfObjects,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Same functionality as getObject(numOfObjects, fmt, arguments) but takes a
 already constructed ConfPath object as argument instead of fmt,
 arguments.

**Parameters**

- `int numOfObjects` - number of objects to retrieve
- `com.tailf.conf.ConfPath path`

**Returns:** ConfObject[]

**Throws**

- `IOException`
- `ConfException`

### getObject(int, String, Object[]) <a href="#getobject-8f535bb4e0e8" id="getobject-8f535bb4e0e8"></a>

```java
public synchronized com.tailf.conf.ConfObject[] getObject(
    int numOfObjects,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

In some cases it can be motivated to read multiple values in one request
 - this will be more efficient since it only incurs a single round trip to
 the server, but usage is a bit more complex. This function reads at most
 numOfObjects values from the container element specified by the path, and
 returns them in an array.

 When reading from a container with mixed configuration and operational
 data (i.e. a config container that has some number of operational
 elements), some elements will have the "wrong" type - i.e. operational
 data in a session for CDB_RUNNING/CDB_STARTUP, or config data in a
 session for CDB_OPERATIONAL. Leaf elements of the "wrong" type will have
 a "value" of ConfNoExists in the array, while static or (existing)
 optional sub-container elements will have ConfXMLTag in all cases.
 Sub-containers or leafs provided by external data providers will always
 be represented with ConfNoExists, whether config or not.

 On success, the function returns the actual number of elements in the
 container. I.e. if the return value is bigger than n, only the values for
 the first n elements are in the array, and the remaining values have been
 discarded. Note that given the specification of the array contents, there
 is always a fixed upper bound on the number of actual elements, and if
 there are no optional sub-containers, the number is constant.

 As an example, this code could be used to read the values for interface
 "eth0" on host "buzz":



```
 String path = /mtest/servers/server{www}/interface{%s};
 ConfObject[] objArr = cdbsess.getObject(4, path, eth0);

 ConfBuf name = (ConfBuf) objArr[0];
 ConfInt64 mtu = (ConfInt64) objArr[1];
```

**Parameters**

- `int numOfObjects` - number of objects to retrieve
- `String fmt`
- `Object[] arguments`

**Returns:** ConfObject[]

**Throws**

- `IOException`
- `ConfException`

### getObjects(int, int, int, ConfPath) <a href="#getobjects-d25a1860a73f" id="getobjects-d25a1860a73f"></a>

```java
public synchronized java.util.List<com.tailf.conf.ConfObject[]> getObjects(
    int numOfObjects,
    int instance,
    int numOfInstances,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Same functionality as getObjects(numOfObjects, instance, fmt, arguments)
 but takes a already constructed ConfPath object as argument instead of
 fmt, arguments.

**Parameters**

- `int numOfObjects` - number of objects to retrieve
- `int instance` - instance integer
- `int numOfInstances` - number if instances to retrieve
- `com.tailf.conf.ConfPath path`

**Returns:** ListConfObject[]

**Throws**

- `IOException`
- `ConfException`

### getObjects(int, int, int, String, Object[]) <a href="#getobjects-9108870a6290" id="getobjects-9108870a6290"></a>

```java
public synchronized java.util.List<com.tailf.conf.ConfObject[]> getObjects(
    int numOfObjects,
    int instance,
    int numOfInstances,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Similar to cdb.getObject(), but reads multiple instances of a dynamic
 container based on the "instance integer" otherwise given within square
 brackets in the path - here the path must specify the dynamic container
 without the instance integer. At most numOfObject values from each of
 numOfInstances instances, starting at instance instance, are read and
 placed in a List of arrays of objects. The List contains an array for
 each instance, to at most numOfInstances and the arrays are at most
 numOfObjects large. On success, the highest actual number of values in
 any of the instances read is returned. An exception with code
 ConfException.ERR_NOEXISTS will be returned if we attempt to read more
 instances than actually exist (i.e. if instance + nobj - 1 is outside the
 range of actually existing instances).

 Example - read the data for all interfaces on the host "buzz":



```
 String path = /mtest/servers/server;
 int n = cdbsess.getNumberOfInstances(path);
 ListConfObject[] objArrList = cdbsess.getObjects(4, 0, n, path);

 ConfBuf[] name = new ConfBuf[n];
 ConfIPv4[] ip = new ConfIPv4[n];
 ConfUInt16[] port = new ConfUInt16[n];
 for (int i = 0; i  objArrList.size(); i++) {
     ConfObject[] objArr = objArrList.get(i);
     name[i] = (ConfBuf) objArr[0];
     ip[i] = (ConfIPv4) objArr[1];
     port[i] = (ConfUInt16) objArr[2];
 }
```

**Parameters**

- `int numOfObjects` - number of objects to retrieve
- `int instance` - instance integer
- `int numOfInstances` - number if instances to retrieve
- `String fmt`
- `Object[] arguments`

**Returns:** ListConfObject[]

**Throws**

- `IOException`
- `ConfException`

### getValues(ConfXMLParam[], ConfPath) <a href="#getvalues-b30d01896278" id="getvalues-b30d01896278"></a>

```java
public synchronized com.tailf.conf.ConfXMLParam[] getValues(
    com.tailf.conf.ConfXMLParam[] params,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Same functionality as getValues(params, fmt, arguments) but takes a
 already constructed ConfPath object as argument instead of fmt,
 arguments.

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`
- `com.tailf.conf.ConfPath path`

**Returns:** ConfXMLParam[]

**Throws**

- `IOException`
- `ConfException`

### getValues(ConfXMLParam[], String, Object[]) <a href="#getvalues-f93a502602ef" id="getvalues-f93a502602ef"></a>

```java
public synchronized com.tailf.conf.ConfXMLParam[] getValues(
    com.tailf.conf.ConfXMLParam[] params,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Read an arbitrary set of sub-elements of a container element. The values
 array must be pre-populated with ConfXMLParam with or without an subArray
 of derived elements. The ConfXMLParam array can point to a location using
 a path or by the use of the derived element ConfXMLParamCdbStart carry
 the instance identification in it.

 All elements have the same position in the array after the call, in order
 to simplify extraction of the values - this means that optional elements
 that were requested but did not exist will have ConfNoExists value rather
 than being omitted from the array. However requesting a dynamic container
 that does not exist, or requesting non-CDB data, or operational vs config
 data, is an error.

 In this rather complex example we first read only the "name" and
 "enabled" values for all interfaces, and then read "ip" and "mask" for
 those that were enabled - a total of two requests. Note that since the
 "interface" container begin/end elements are in the array, the path must
 not include the "interface" component. When reading values from a single
 container, it is generally simpler to have the container component (and
 keys or instance integer) in the path instead.



```
  String path = /mtest/servers/server;
  int n = cdbsess.getNumberOfInstances(path);
  ListConfObject[] objArrList = cdbsess.getObjects(4,0,n,path);

  //when reading ip/port, we need 5 elements per interface:
  //begin + name (key) + ip + port + end
  ConfXMLParam[] values = new ConfXMLParam[5*n];

  int j = 0;
  for (int i=0; in; i++) {
      values[j++] = new ConfXMLParamCdbStart(ns, server, i);
      values[j++] = new ConfXMLParamLeaf(ns, name);
      values[j++] = new ConfXMLParamLeaf(ns, ip);
      values[j++] = new ConfXMLParamLeaf(ns, port);
      values[j++] = new ConfXMLParamStop(ns, server);
  }
  path = /mtest/servers;
  ConfXMLParam[] resvalues = cdbsess.getValues(values, path);

  // extract name for enabled interfaces
  String name = null;
  int noOfInterfaces = 0;
  for (int i = 0; i  n; i++) {
      ConfIPv4 ip4 = (ConfIPv4) resvalues[i*5+2].getValue();
      name = resvalues[i*5+1].getValue().toString();
      path = /mtest/servers/server{%s}/interface;
      noOfInterfaces = cdbsess.getNumberOfInstances(path, name);
      System.out.println(name = + name);
  }
  int n_if = j;
  j = 0;

  values = new ConfXMLParam[noOfInterfaces*4];
  for (int i=0; inoOfInterfaces; i++) {
      values[j++] = new ConfXMLParamCdbStart(ns.hash(),
                                          ns.mtest_interface, i);
      values[j++] = new ConfXMLParamLeaf(ns.hash(),
                                         ns.mtest_name);
      values[j++] = new ConfXMLParamLeaf(ns.hash(),
                                         ns.mtest_mtu);
      values[j++] = new ConfXMLParamStop(ns.hash(),
                                        ns.mtest_interface);
   }
   path = /mtest/servers/server{%s};
   resvalues = cdbsess.getValues(values, path, name);

 ...
```

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`
- `String fmt`
- `Object[] arguments`

**Returns:** ConfXMLParam[]

**Throws**

- `IOException`
- `ConfException`

### index(ConfPath) <a href="#index-339d675c9a64" id="index-339d675c9a64"></a>

```java
public synchronized int index(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Returns the position of a key

**Parameters**

- `com.tailf.conf.ConfPath path` - The path

**Throws**

- `CdbException` - Failed to get position
- `IOException` - Failed to read/write cdb socket

### index(String, Object[]) <a href="#index-cae5f09ba6fb" id="index-cae5f09ba6fb"></a>

```java
public synchronized int index(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

similar to `index(ConfPath)` but specifies element using path
 string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** position of key

**Throws**

- `ConfException`
- `IOException`

### isDefault(ConfPath) <a href="#isdefault-a9229eae64cf" id="isdefault-a9229eae64cf"></a>

```java
public synchronized boolean isDefault(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This method returns true for a leaf which has a default value defined
 in the data model when no value has been set, i.e. when the default value
 is in effect. It returns false for other existing leafs. There is
 normally no need to call this method, since CDB automatically provides
 the default value as needed when `getElem` etc is called.

**Parameters**

- `com.tailf.conf.ConfPath path` - as a ConfPath

**Returns:** true/false if a leaf has a default value defined

**Throws**

- `ConfException`
- `IOException`

### isDefault(String, Object[]) <a href="#isdefault-8c3502a0ab6d" id="isdefault-8c3502a0ab6d"></a>

```java
public synchronized boolean isDefault(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

similar to `isDefault(ConfPath)` but specifies element using path
 string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** true/false if a leaf has a default value defined

**Throws**

- `ConfException`
- `IOException`

### nextIndex(ConfPath) <a href="#nextindex-ceef3a478d50" id="nextindex-ceef3a478d50"></a>

```java
public synchronized int nextIndex(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Returns the position of the next key

**Parameters**

- `com.tailf.conf.ConfPath path` - The path

**Throws**

- `CdbException` - Failed to get next position
- `IOException` - Failed to read/write cdb socket

### nextIndex(String, Object[]) <a href="#nextindex-c2b059f89584" id="nextindex-c2b059f89584"></a>

```java
public synchronized int nextIndex(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

similar to `nextIndex(ConfPath)` but specifies element using path
 string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** position of next key

**Throws**

- `ConfException`
- `IOException`

### popd() <a href="#popd-b092d2d9048f" id="popd-b092d2d9048f"></a>

```java
public synchronized void popd() throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Pops the top element from the directory stack and changes directory to
 previous directory.

**Throws**

- `CdbException` - Failed to 'popd'
- `IOException` - Failed to read/write cdb socket

### pushd(ConfPath) <a href="#pushd-d9d906674b7a" id="pushd-d9d906674b7a"></a>

```java
public synchronized void pushd(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Similar to `cd(ConfPath)` but pushes the previous current
 directory on a stack.

**Parameters**

- `com.tailf.conf.ConfPath path` - ConfPath object

**Throws**

- `CdbException` - Failed to 'pushd'
- `IOException` - Failed to read/write cdb socket

### pushd(String, Object[]) <a href="#pushd-fd6a4c1b1c8d" id="pushd-fd6a4c1b1c8d"></a>

```java
public synchronized void pushd(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

similar to `pushd(ConfPath)` but specifies position using path
 string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `ConfException`
- `IOException`

### setCase(String, String, ConfPath) <a href="#setcase-3792b2775b7f" id="setcase-3792b2775b7f"></a>

```java
public synchronized void setCase(
    String choice,
    String scase,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Same functionality as setCase(choice, scase, fmt, arguments) but takes a
 already constructed ConfPath object as argument instead of fmt,
 arguments.

**Parameters**

- `String choice` - choice string
- `String scase` - case string
- `com.tailf.conf.ConfPath path` - ConfPath object pointing to the choice

**Throws**

- `IOException`
- `ConfException`

### setCase(String, String, String, Object[]) <a href="#setcase-908203af825d" id="setcase-908203af825d"></a>

```java
public synchronized void setCase(
    String choice,
    String scase,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

When we use the YANG choice construct in the data model, this function
 can be used to select the current case.

 When configuration data is
 modified by northbound agents, the current case is implicitly selected
 (and elements for other cases potentially deleted) by the setting of
 elements in a choice.
 For operational data in CDB however, this is under
 direct control of the application, which needs to explicitly set the
 current case. Setting the case will also automatically delete elements
 belonging to other cases, but it is up to the application to not set any
 elements in the "wrong" case.

 The fmt, ... arguments give the path to the container where the choice is
 defined, and choice and scase are the choice and case names. For an
 optional choice, it is possible to have no case at all selected. To
 indicate that the previously selected case should be deleted without
 selecting another case, we can pass NULL for the scase argument.

**Parameters**

- `String choice` - choice string
- `String scase` - case string
- `String fmt` - format string pointing to the choice
- `Object[] arguments` - replacement arguments for fmt string

**Throws**

- `IOException`
- `ConfException`

### setElem(ConfValue, ConfPath) <a href="#setelem-356e5e479e47" id="setelem-356e5e479e47"></a>

```java
public synchronized void setElem(
    com.tailf.conf.ConfValue value,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Sets an element in operational data.


 It is possible for an application to store operational data
 (i.e. status and statistical information) in *CDB*.



 The operational database avoids the use of transactions and locks in
 order to provide light-weight access methods, however when the
 multi-value API method are used, all updates requested by a
 given method call are carried out atomically.



 To establish a session for operational data, the application
 must use `Cdb#startSession(CdbDBType,EnumSet)` with
 `CdbDBType` set to `CDB_OPERATIONAL`.


 After this, all the read and access functions are available for use with
 operational data, and additionally the write methods.


 Configuration data can not be accessed in a session for operational data,
 nor vice versa, The write functions can never be used in a session for
 configuration data.

**Parameters**

- `com.tailf.conf.ConfValue value` - ConfValue object
- `com.tailf.conf.ConfPath path` - ConfPath object

**Throws**

- `CdbException` - Failed to set element
- `IOException` - Failed to read/write to underlying socket

### setElem(ConfValue, String, Object[]) <a href="#setelem-7fc14a355edc" id="setelem-7fc14a355edc"></a>

```java
public synchronized void setElem(
    com.tailf.conf.ConfValue value,
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

similar to `setElem(ConfValue, ConfPath)` but specifies element
 using path string

**Parameters**

- `com.tailf.conf.ConfValue value`
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `ConfException`
- `IOException`

### setNamespace(ConfNamespace) <a href="#setnamespace-30316a480cfa" id="setnamespace-30316a480cfa"></a>

```java
public synchronized void setNamespace(
    com.tailf.conf.ConfNamespace ns
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Before we start to read data from CDB we need to set the namespace. We
 are reading data related to a specific .fxs file. confdc can be used to
 generate a .class file with constants for the namespace, by using the
 flag --emit-java to confdc (see confdc(1))

**Parameters**

- `com.tailf.conf.ConfNamespace ns` - Name space object

**Throws**

- `CdbException` - Failed to set namespace
- `IOException` - Failed to read/write cdb socket

### setObject(ConfValue[], ConfPath) <a href="#setobject-741f2a72045e" id="setobject-741f2a72045e"></a>

```java
public synchronized void setObject(
    com.tailf.conf.ConfValue[] values,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Set all elements corresponding to the complete contents of a container
 element, except for list entry sub-elements.

 If the container element itself, or any sub-elements that are specified
 as existing, do not exist before this call, they will be created,
 otherwise the existing values will be updated. Optional elements that are
 specified as not existing in the array, will be deleted if they existed
 before the call.

**Parameters**

- `com.tailf.conf.ConfValue[] values` - Array of ConfValue objects
- `com.tailf.conf.ConfPath path` - ConfPath object

**Throws**

- `CdbException` - Failed to set object
- `IOException` - Failed to read/write cdb socket

### setObject(ConfValue[], String, Object[]) <a href="#setobject-5edb7e0ee677" id="setobject-5edb7e0ee677"></a>

```java
public synchronized void setObject(
    com.tailf.conf.ConfValue[] values,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

similar to `setObject(ConfValue[], ConfPath)` but specifies
 element using path string

**Parameters**

- `com.tailf.conf.ConfValue[] values`
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `IOException`
- `ConfException`

### setValues(ConfXMLParam[], ConfPath) <a href="#setvalues-0755e36fbd2c" id="setvalues-0755e36fbd2c"></a>

```java
public synchronized void setValues(
    com.tailf.conf.ConfXMLParam[] params,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Set arbitrary sub-elements of a container element.

 If the container element itself, or any sub-elements that are specified
 as existing, do not exist before this call, they will be created,
 otherwise the existing values will be updated. Both non-optional and
 optional elements may be omitted from the array, and all omitted elements
 are left unchanged.

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`
- `com.tailf.conf.ConfPath path`

**Throws**

- `IOException`
- `ConfException`

### setValues(ConfXMLParam[], String, Object[]) <a href="#setvalues-824d05856f15" id="setvalues-824d05856f15"></a>

```java
public synchronized void setValues(
    com.tailf.conf.ConfXMLParam[] params,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

similar to `setValues(ConfXMLParam[], ConfPath)` but specifies
 element using path string

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`
- `String fmt`
- `Object[] arguments`

**Throws**

- `IOException`
- `ConfException`

### setValues(List&lt;ConfXMLParam&gt;, ConfPath) <a href="#setvalues-970140dc0796" id="setvalues-970140dc0796"></a>

```java
public synchronized void setValues(
    java.util.List<com.tailf.conf.ConfXMLParam> params,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `java.util.List<com.tailf.conf.ConfXMLParam> params`
- `com.tailf.conf.ConfPath path`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
