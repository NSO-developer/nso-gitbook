<a id="cls-CdbSession"></a>
# CdbSession

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
 [`Cdb#startSession()`](Cdb.md#m-startsession-ee121903dcfa) or [`Cdb#startSession(CdbDBType)`](Cdb.md#m-startsession-6f137bd83c44).


 `LOCK_REQUEST` obtains a read lock only for the
 duration of each read request. This means that values of
 elements read in different requests may be inconsistent with each other,
 and the consequences of this must be carefully considered.
 In particular, the use of `ConfPath#getNumberOfInstances(ConfPath)` and the [n]
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

- [CdbUpgradeSession](CdbUpgradeSession.md#cls-CdbUpgradeSession)

## Members

**Constructors**:

- [CdbSession(Cdb)](#m-cdbsession-1c19a6f495f3)
- [CdbSession(Cdb, CdbDBType)](#m-cdbsession-5164f17f6a96)
- [CdbSession(Cdb, CdbDBType, EnumSet<CdbLockType>)](#m-cdbsession-82f45cd9e50f)

**Fields**:

- [cdb](#m-cdb)
- [dbType](#m-dbType)
- [lockflags](#m-lockflags)

**Methods**:

- [cd(ConfPath)](#m-cd-a902c91e6177)
- [cd(String, Object[])](#m-cd-751c8b439d16)
- [create(ConfPath)](#m-create-02589a4ee236)
- [create(String, Object[])](#m-create-8d8ef9670e7f)
- [delete(ConfPath)](#m-delete-46ab41293f59)
- [delete(String, Object[])](#m-delete-a6dae6a18c6e)
- [endSession()](#m-endsession-1853baeb5d28)
- [exists(ConfPath)](#m-exists-afa14dd11748)
- [exists(String, Object[])](#m-exists-c95896218534)
- [getCase(String, ConfPath)](#m-getcase-db036ac6c713)
- [getCase(String, String, Object[])](#m-getcase-9058de2e1364)
- [getCdb()](#m-getcdb-62d7a3429687)
- [getcwd()](#m-getcwd-18c6eed4f1fa)
- [getcwdPath()](#m-getcwdpath-a9fa1536fad1)
- [getDbType()](#m-getdbtype-9503dd2b103d)
- [getElem(ConfPath)](#m-getelem-f8219fa65c5d)
- [getElem(String, Object[])](#m-getelem-8ec719438ea8)
- [getNumberOfInstances(ConfPath)](#m-getnumberofinstances-41d82cec9221)
- [getNumberOfInstances(String, Object[])](#m-getnumberofinstances-4ff46f9afb5c)
- [getObject(int, ConfPath)](#m-getobject-97126abcba49)
- [getObject(int, String, Object[])](#m-getobject-8f535bb4e0e8)
- [getObjects(int, int, int, ConfPath)](#m-getobjects-d25a1860a73f)
- [getObjects(int, int, int, String, Object[])](#m-getobjects-9108870a6290)
- [getValues(ConfXMLParam[], ConfPath)](#m-getvalues-b30d01896278)
- [getValues(ConfXMLParam[], String, Object[])](#m-getvalues-f93a502602ef)
- [index(ConfPath)](#m-index-339d675c9a64)
- [index(String, Object[])](#m-index-cae5f09ba6fb)
- [isDefault(ConfPath)](#m-isdefault-a9229eae64cf)
- [isDefault(String, Object[])](#m-isdefault-8c3502a0ab6d)
- [nextIndex(ConfPath)](#m-nextindex-ceef3a478d50)
- [nextIndex(String, Object[])](#m-nextindex-c2b059f89584)
- [popd()](#m-popd-b092d2d9048f)
- [pushd(ConfPath)](#m-pushd-d9d906674b7a)
- [pushd(String, Object[])](#m-pushd-fd6a4c1b1c8d)
- [setCase(String, String, ConfPath)](#m-setcase-3792b2775b7f)
- [setCase(String, String, String, Object[])](#m-setcase-908203af825d)
- [setElem(ConfValue, ConfPath)](#m-setelem-356e5e479e47)
- [setElem(ConfValue, String, Object[])](#m-setelem-7fc14a355edc)
- [setNamespace(ConfNamespace)](#m-setnamespace-30316a480cfa)
- [setObject(ConfValue[], ConfPath)](#m-setobject-741f2a72045e)
- [setObject(ConfValue[], String, Object[])](#m-setobject-5edb7e0ee677)
- [setValues(ConfXMLParam[], ConfPath)](#m-setvalues-0755e36fbd2c)
- [setValues(ConfXMLParam[], String, Object[])](#m-setvalues-824d05856f15)
- [setValues(List<ConfXMLParam>, ConfPath)](#m-setvalues-970140dc0796)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-cdbsession-1c19a6f495f3"></a>
### CdbSession(Cdb)

```java
public CdbSession(com.tailf.cdb.Cdb cdb) throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Cdb](Cdb.md#cls-Cdb), [ConfException](../conf/ConfException.md#cls-ConfException)

Creates a new *CDB session*
 instance against the running database. (dbtype
 set to `CDB_RUNNING`)

**Parameters**

- `com.tailf.cdb.Cdb cdb` - The CDB instance the session belongs to

<a id="m-cdbsession-5164f17f6a96"></a>
### CdbSession(Cdb, CdbDBType)

```java
public CdbSession(
    com.tailf.cdb.Cdb cdb,
    com.tailf.cdb.CdbDBType dbtype
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [Cdb](Cdb.md#cls-Cdb), [CdbDBType](CdbDBType.md#cls-CdbDBType), [ConfException](../conf/ConfException.md#cls-ConfException)

Starts a new session on an already connected *Cdb* instance.

**Parameters**

- `com.tailf.cdb.Cdb cdb` - The CDB instance with a socket connected to ConfD/NCS.
- `com.tailf.cdb.CdbDBType dbtype` - see [`CdbDBType`](CdbDBType.md#cls-CdbDBType)

**Throws**

- `CdbException` - Failed to start session
- `IOException` - Failed to read/write socket

<a id="m-cdbsession-82f45cd9e50f"></a>
### CdbSession(Cdb, CdbDBType, EnumSet<CdbLockType>)

```java
public CdbSession(
    com.tailf.cdb.Cdb cdb,
    com.tailf.cdb.CdbDBType dbtype,
    java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [Cdb](Cdb.md#cls-Cdb), [CdbDBType](CdbDBType.md#cls-CdbDBType), [CdbLockType](CdbLockType.md#cls-CdbLockType), [ConfException](../conf/ConfException.md#cls-ConfException)

Starts a new session on an already established Cdb with
 explicitly given lockflags.

**Parameters**

- `com.tailf.cdb.Cdb cdb`
- `com.tailf.cdb.CdbDBType dbtype` - see [`CdbDBType`](CdbDBType.md#cls-CdbDBType)
- `java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags` - [`CdbLockType`](CdbLockType.md#cls-CdbLockType)

**Throws**

- `IOException`
- `ConfException`


## Fields

<a id="m-cdb"></a>
### cdb

```java
protected com.tailf.cdb.Cdb cdb = null;
```

Types: [Cdb](Cdb.md#cls-Cdb)

<a id="m-dbType"></a>
### dbType

```java
protected com.tailf.cdb.CdbDBType dbType = null;
```

Types: [CdbDBType](CdbDBType.md#cls-CdbDBType)

<a id="m-lockflags"></a>
### lockflags

```java
protected java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags = null;
```

Types: [CdbLockType](CdbLockType.md#cls-CdbLockType)


## Methods

<a id="m-cd-a902c91e6177"></a>
### cd(ConfPath)

```java
public synchronized void cd(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

Changes the working directory.

**Parameters**

- `com.tailf.conf.ConfPath path` - ConfPath object

**Throws**

- `CdbException` - Failed to 'cd'
- `IOException` - Failed to read/write cdb socket

<a id="m-cd-751c8b439d16"></a>
### cd(String, Object[])

```java
public synchronized void cd(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Change working directory to container specified by path string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `ConfException`
- `IOException`

<a id="m-create-02589a4ee236"></a>
### create(ConfPath)

```java
public synchronized void create(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

Create a new optional element or list entry. Note that for container
 elements, sub-elements will not exist until created or set via some of
 the other functions, thus doing implicit create via
 `ConfValue#setObject(ConfValue[], ConfPath)` or
 `ConfXMLParam#setValues(ConfXMLParam[], ConfPath)` may be preferred in this
 case.

**Parameters**

- `com.tailf.conf.ConfPath path` - ConfPath object

**Throws**

- `CdbException` - Failed to create
- `IOException` - Failed to write to cdb socket

<a id="m-create-8d8ef9670e7f"></a>
### create(String, Object[])

```java
public synchronized void create(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

similar to `ConfPath#create(ConfPath)` but specifies element using path
 string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `ConfException`
- `IOException`

<a id="m-delete-46ab41293f59"></a>
### delete(ConfPath)

```java
public synchronized void delete(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

Delete an optional element or list entry and all its child elements.

**Parameters**

- `com.tailf.conf.ConfPath path` - ConfPath object

**Throws**

- `CdbException` - Failed to delete element
- `IOException` - Failed to read/write cdb socket

<a id="m-delete-a6dae6a18c6e"></a>
### delete(String, Object[])

```java
public synchronized void delete(
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

similar to `ConfPath#delete(ConfPath)` but specifies element using path
 string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `IOException`
- `ConfException`

<a id="m-endsession-1853baeb5d28"></a>
### endSession()

```java
public synchronized void endSession() throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Ends the data session

**Throws**

- `CdbException` - Failed to end session
- `IOException` - Failed to read/write cdb socket

<a id="m-exists-afa14dd11748"></a>
### exists(ConfPath)

```java
public synchronized boolean exists(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

Containers and leafs in a YANG model may be optional. This function
 checks whether an element exists in the configuration. Returns true or
 false.

**Parameters**

- `com.tailf.conf.ConfPath path` - ConfPath object

**Throws**

- `CdbException` - Failed to check exists
- `IOException` - Failed to read/write cdb socket

<a id="m-exists-c95896218534"></a>
### exists(String, Object[])

```java
public synchronized boolean exists(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Checks whether an element exists. The element is specified using a path
 string and optionally string substitution parameters

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** true if exists

**Throws**

- `ConfException`
- `IOException`

<a id="m-getcase-db036ac6c713"></a>
### getCase(String, ConfPath)

```java
public synchronized com.tailf.conf.ConfObject getCase(
    String choice,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

Retrieve the currently selected case.


 Same functionality as `#getCase(String, String, Object...)` but
 takes a already constructed `ConfPath` object as argument
 instead of fmt, arguments.

**Parameters**

- `String choice` - the name of choice
- `com.tailf.conf.ConfPath path` - `ConfPath` pointing to the choice

**Returns:** ConfObject case value as `ConfTag`

**Throws**

- `IOException`
- `ConfException`

<a id="m-getcase-9058de2e1364"></a>
### getCase(String, String, Object[])

```java
public synchronized com.tailf.conf.ConfObject getCase(
    String choice,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject), [ConfException](../conf/ConfException.md#cls-ConfException)

Retrieve the currently selected case.


 When we use the YANG choice construct in the data model, this method
 can be used to find the currently selected case, avoiding useless
 `ConfPath#getElem(ConfPath)` etc requests for elements
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

<a id="m-getcdb-62d7a3429687"></a>
### getCdb()

```java
public com.tailf.cdb.Cdb getCdb()
```

Types: [Cdb](Cdb.md#cls-Cdb)

<a id="m-getcwd-18c6eed4f1fa"></a>
### getcwd()

```java
public synchronized String getcwd() throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Returns the current position as previously set by `ConfPath#cd(ConfPath)`,
 `ConfPath#pushd(ConfPath)`, or `#popd()` as a string.

**Throws**

- `CdbException` - Failed to 'getcwd'
- `IOException` - Failed to read/write cdb socket

<a id="m-getcwdpath-a9fa1536fad1"></a>
### getcwdPath()

```java
public synchronized com.tailf.conf.ConfObject[] getcwdPath() throws com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject), [ConfException](../conf/ConfException.md#cls-ConfException)

Returns the current position as previously set by `ConfPath#cd(ConfPath)`,
 `ConfPath#pushd(ConfPath)`, or `#popd()` as a
 `ConfObject` array.

**Throws**

- `CdbException` - Failed to 'getcwd'
- `IOException` - Failed to read/write cdb socket

<a id="m-getdbtype-9503dd2b103d"></a>
### getDbType()

```java
public com.tailf.cdb.CdbDBType getDbType()
```

Types: [CdbDBType](CdbDBType.md#cls-CdbDBType)

retrieve the dbType for this session.

**Returns:** CdbDBType

<a id="m-getelem-f8219fa65c5d"></a>
### getElem(ConfPath)

```java
public synchronized com.tailf.conf.ConfValue getElem(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

This reads a a value from the path. The path must lead to a leaf element
 in the XML data tree.

**Parameters**

- `com.tailf.conf.ConfPath path` - The path

**Throws**

- `CdbException` - Failed to get element
- `IOException` - Failed to read/write cdb socket

<a id="m-getelem-8ec719438ea8"></a>
### getElem(String, Object[])

```java
public synchronized com.tailf.conf.ConfValue getElem(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue), [ConfException](../conf/ConfException.md#cls-ConfException)

similar to `ConfPath#getElem(ConfPath)` but specifies element using path
 string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** element represented by a ConfValue

**Throws**

- `ConfException`
- `IOException`

<a id="m-getnumberofinstances-41d82cec9221"></a>
### getNumberOfInstances(ConfPath)

```java
public synchronized int getNumberOfInstances(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

Returns the number of elements of a container type.

**Parameters**

- `com.tailf.conf.ConfPath path` - The path

**Throws**

- `CdbException` - Failed to get number of instances
- `IOException` - Failed to read/write cdb socket

<a id="m-getnumberofinstances-4ff46f9afb5c"></a>
### getNumberOfInstances(String, Object[])

```java
public synchronized int getNumberOfInstances(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

similar to `ConfPath#getNumberOfInstances(ConfPath)` but specifies element
  using path string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** number of instances

**Throws**

- `ConfException`
- `IOException`

<a id="m-getobject-97126abcba49"></a>
### getObject(int, ConfPath)

```java
public synchronized com.tailf.conf.ConfObject[] getObject(
    int numOfObjects,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

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

<a id="m-getobject-8f535bb4e0e8"></a>
### getObject(int, String, Object[])

```java
public synchronized com.tailf.conf.ConfObject[] getObject(
    int numOfObjects,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject), [ConfException](../conf/ConfException.md#cls-ConfException)

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

<a id="m-getobjects-d25a1860a73f"></a>
### getObjects(int, int, int, ConfPath)

```java
public synchronized java.util.List<com.tailf.conf.ConfObject[]> getObjects(
    int numOfObjects,
    int instance,
    int numOfInstances,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

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

<a id="m-getobjects-9108870a6290"></a>
### getObjects(int, int, int, String, Object[])

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

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject), [ConfException](../conf/ConfException.md#cls-ConfException)

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

<a id="m-getvalues-b30d01896278"></a>
### getValues(ConfXMLParam[], ConfPath)

```java
public synchronized com.tailf.conf.ConfXMLParam[] getValues(
    com.tailf.conf.ConfXMLParam[] params,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

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

<a id="m-getvalues-f93a502602ef"></a>
### getValues(ConfXMLParam[], String, Object[])

```java
public synchronized com.tailf.conf.ConfXMLParam[] getValues(
    com.tailf.conf.ConfXMLParam[] params,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [ConfException](../conf/ConfException.md#cls-ConfException)

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

<a id="m-index-339d675c9a64"></a>
### index(ConfPath)

```java
public synchronized int index(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

Returns the position of a key

**Parameters**

- `com.tailf.conf.ConfPath path` - The path

**Throws**

- `CdbException` - Failed to get position
- `IOException` - Failed to read/write cdb socket

<a id="m-index-cae5f09ba6fb"></a>
### index(String, Object[])

```java
public synchronized int index(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

similar to `ConfPath#index(ConfPath)` but specifies element using path
 string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** position of key

**Throws**

- `ConfException`
- `IOException`

<a id="m-isdefault-a9229eae64cf"></a>
### isDefault(ConfPath)

```java
public synchronized boolean isDefault(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

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

<a id="m-isdefault-8c3502a0ab6d"></a>
### isDefault(String, Object[])

```java
public synchronized boolean isDefault(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

similar to `ConfPath#isDefault(ConfPath)` but specifies element using path
 string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** true/false if a leaf has a default value defined

**Throws**

- `ConfException`
- `IOException`

<a id="m-nextindex-ceef3a478d50"></a>
### nextIndex(ConfPath)

```java
public synchronized int nextIndex(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

Returns the position of the next key

**Parameters**

- `com.tailf.conf.ConfPath path` - The path

**Throws**

- `CdbException` - Failed to get next position
- `IOException` - Failed to read/write cdb socket

<a id="m-nextindex-c2b059f89584"></a>
### nextIndex(String, Object[])

```java
public synchronized int nextIndex(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

similar to `ConfPath#nextIndex(ConfPath)` but specifies element using path
 string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** position of next key

**Throws**

- `ConfException`
- `IOException`

<a id="m-popd-b092d2d9048f"></a>
### popd()

```java
public synchronized void popd() throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Pops the top element from the directory stack and changes directory to
 previous directory.

**Throws**

- `CdbException` - Failed to 'popd'
- `IOException` - Failed to read/write cdb socket

<a id="m-pushd-d9d906674b7a"></a>
### pushd(ConfPath)

```java
public synchronized void pushd(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

Similar to `ConfPath#cd(ConfPath)` but pushes the previous current
 directory on a stack.

**Parameters**

- `com.tailf.conf.ConfPath path` - ConfPath object

**Throws**

- `CdbException` - Failed to 'pushd'
- `IOException` - Failed to read/write cdb socket

<a id="m-pushd-fd6a4c1b1c8d"></a>
### pushd(String, Object[])

```java
public synchronized void pushd(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

similar to `ConfPath#pushd(ConfPath)` but specifies position using path
 string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `ConfException`
- `IOException`

<a id="m-setcase-3792b2775b7f"></a>
### setCase(String, String, ConfPath)

```java
public synchronized void setCase(
    String choice,
    String scase,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

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

<a id="m-setcase-908203af825d"></a>
### setCase(String, String, String, Object[])

```java
public synchronized void setCase(
    String choice,
    String scase,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

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

<a id="m-setelem-356e5e479e47"></a>
### setElem(ConfValue, ConfPath)

```java
public synchronized void setElem(
    com.tailf.conf.ConfValue value,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

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

<a id="m-setelem-7fc14a355edc"></a>
### setElem(ConfValue, String, Object[])

```java
public synchronized void setElem(
    com.tailf.conf.ConfValue value,
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue), [ConfException](../conf/ConfException.md#cls-ConfException)

similar to `ConfValue#setElem(ConfValue, ConfPath)` but specifies element
 using path string

**Parameters**

- `com.tailf.conf.ConfValue value`
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `ConfException`
- `IOException`

<a id="m-setnamespace-30316a480cfa"></a>
### setNamespace(ConfNamespace)

```java
public synchronized void setNamespace(
    com.tailf.conf.ConfNamespace ns
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace), [ConfException](../conf/ConfException.md#cls-ConfException)

Before we start to read data from CDB we need to set the namespace. We
 are reading data related to a specific .fxs file. confdc can be used to
 generate a .class file with constants for the namespace, by using the
 flag --emit-java to confdc (see confdc(1))

**Parameters**

- `com.tailf.conf.ConfNamespace ns` - Name space object

**Throws**

- `CdbException` - Failed to set namespace
- `IOException` - Failed to read/write cdb socket

<a id="m-setobject-741f2a72045e"></a>
### setObject(ConfValue[], ConfPath)

```java
public synchronized void setObject(
    com.tailf.conf.ConfValue[] values,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

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

<a id="m-setobject-5edb7e0ee677"></a>
### setObject(ConfValue[], String, Object[])

```java
public synchronized void setObject(
    com.tailf.conf.ConfValue[] values,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue), [ConfException](../conf/ConfException.md#cls-ConfException)

similar to `ConfValue#setObject(ConfValue[], ConfPath)` but specifies
 element using path string

**Parameters**

- `com.tailf.conf.ConfValue[] values`
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `IOException`
- `ConfException`

<a id="m-setvalues-0755e36fbd2c"></a>
### setValues(ConfXMLParam[], ConfPath)

```java
public synchronized void setValues(
    com.tailf.conf.ConfXMLParam[] params,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

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

<a id="m-setvalues-824d05856f15"></a>
### setValues(ConfXMLParam[], String, Object[])

```java
public synchronized void setValues(
    com.tailf.conf.ConfXMLParam[] params,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [ConfException](../conf/ConfException.md#cls-ConfException)

similar to `ConfXMLParam#setValues(ConfXMLParam[], ConfPath)` but specifies
 element using path string

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`
- `String fmt`
- `Object[] arguments`

**Throws**

- `IOException`
- `ConfException`

<a id="m-setvalues-970140dc0796"></a>
### setValues(List<ConfXMLParam>, ConfPath)

```java
public synchronized void setValues(
    java.util.List<com.tailf.conf.ConfXMLParam> params,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `java.util.List<com.tailf.conf.ConfXMLParam> params`
- `com.tailf.conf.ConfPath path`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
