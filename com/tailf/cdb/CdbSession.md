<a id="s-CdbSession"></a>
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
 CDB session use the method [`Cdb`](Cdb.md#s-Cdb)
 where the `EnumSet` contains a set of lock flags for this method.


 The flags affect sessions for the different database types as follows:



- ***CDB_RUNNING*** -
 `LOCK_SESSION` obtains a read lock for the complete
 session, i.e. using this flag alone is equivalent to calling
 [`Cdb`](Cdb.md#s-Cdb) or [`Cdb`](Cdb.md#s-Cdb).


 `LOCK_REQUEST` obtains a read lock only for the
 duration of each read request. This means that values of
 elements read in different requests may be inconsistent with each other,
 and the consequences of this must be carefully considered.
 In particular, the use of [`ConfPath`](../conf/ConfPath.md#s-ConfPath) and the [n]
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

- [CdbUpgradeSession](CdbUpgradeSession.md#s-CdbUpgradeSession)

## Members

**Constructors**:

- [CdbSession(Cdb)](#s-CdbSession-1)
- [CdbSession(Cdb, CdbDBType)](#s-CdbSession-2)
- [CdbSession(Cdb, CdbDBType, EnumSet<CdbLockType>)](#s-CdbSession-3)

**Fields**:

- [cdb](#s-cdb)
- [dbType](#s-dbType)
- [lockflags](#s-lockflags)

**Methods**:

- [cd(ConfPath)](#s-cd)
- [cd(String, Object[])](#s-cd-1)
- [create(ConfPath)](#s-create)
- [create(String, Object[])](#s-create-1)
- [delete(ConfPath)](#s-delete)
- [delete(String, Object[])](#s-delete-1)
- [endSession()](#s-endSession)
- [exists(ConfPath)](#s-exists)
- [exists(String, Object[])](#s-exists-1)
- [getCase(String, ConfPath)](#s-getCase)
- [getCase(String, String, Object[])](#s-getCase-1)
- [getCdb()](#s-getCdb)
- [getcwd()](#s-getcwd)
- [getcwdPath()](#s-getcwdPath)
- [getDbType()](#s-getDbType)
- [getElem(ConfPath)](#s-getElem)
- [getElem(String, Object[])](#s-getElem-1)
- [getNumberOfInstances(ConfPath)](#s-getNumberOfInstances)
- [getNumberOfInstances(String, Object[])](#s-getNumberOfInstances-1)
- [getObject(int, ConfPath)](#s-getObject)
- [getObject(int, String, Object[])](#s-getObject-1)
- [getObjects(int, int, int, ConfPath)](#s-getObjects)
- [getObjects(int, int, int, String, Object[])](#s-getObjects-1)
- [getValues(ConfXMLParam[], ConfPath)](#s-getValues)
- [getValues(ConfXMLParam[], String, Object[])](#s-getValues-1)
- [index(ConfPath)](#s-index)
- [index(String, Object[])](#s-index-1)
- [isDefault(ConfPath)](#s-isDefault)
- [isDefault(String, Object[])](#s-isDefault-1)
- [nextIndex(ConfPath)](#s-nextIndex)
- [nextIndex(String, Object[])](#s-nextIndex-1)
- [popd()](#s-popd)
- [pushd(ConfPath)](#s-pushd)
- [pushd(String, Object[])](#s-pushd-1)
- [setCase(String, String, ConfPath)](#s-setCase)
- [setCase(String, String, String, Object[])](#s-setCase-1)
- [setElem(ConfValue, ConfPath)](#s-setElem)
- [setElem(ConfValue, String, Object[])](#s-setElem-1)
- [setNamespace(ConfNamespace)](#s-setNamespace)
- [setObject(ConfValue[], ConfPath)](#s-setObject)
- [setObject(ConfValue[], String, Object[])](#s-setObject-1)
- [setValues(ConfXMLParam[], ConfPath)](#s-setValues)
- [setValues(ConfXMLParam[], String, Object[])](#s-setValues-1)
- [setValues(List<ConfXMLParam>, ConfPath)](#s-setValues-2)
- [toString()](#s-toString)

## Constructors

<a id="s-CdbSession-1"></a>
### CdbSession(Cdb)

```java
public CdbSession(com.tailf.cdb.Cdb cdb) throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Cdb](Cdb.md#s-Cdb), [ConfException](../conf/ConfException.md#s-ConfException)

Creates a new *CDB session*
 instance against the running database. (dbtype
 set to `CDB_RUNNING`)

**Parameters**

- `com.tailf.cdb.Cdb cdb` - The CDB instance the session belongs to

<a id="s-CdbSession-2"></a>
### CdbSession(Cdb, CdbDBType)

```java
public CdbSession(
    com.tailf.cdb.Cdb cdb,
    com.tailf.cdb.CdbDBType dbtype
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [Cdb](Cdb.md#s-Cdb), [CdbDBType](CdbDBType.md#s-CdbDBType), [ConfException](../conf/ConfException.md#s-ConfException)

Starts a new session on an already connected *Cdb* instance.

**Parameters**

- `com.tailf.cdb.Cdb cdb` - The CDB instance with a socket connected to ConfD/NCS.
- `com.tailf.cdb.CdbDBType dbtype` - see [`CdbDBType`](CdbDBType.md#s-CdbDBType)

**Throws**

- `CdbException` - Failed to start session
- `IOException` - Failed to read/write socket

<a id="s-CdbSession-3"></a>
### CdbSession(Cdb, CdbDBType, EnumSet<CdbLockType>)

```java
public CdbSession(
    com.tailf.cdb.Cdb cdb,
    com.tailf.cdb.CdbDBType dbtype,
    java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [Cdb](Cdb.md#s-Cdb), [CdbDBType](CdbDBType.md#s-CdbDBType), [CdbLockType](CdbLockType.md#s-CdbLockType), [ConfException](../conf/ConfException.md#s-ConfException)

Starts a new session on an already established Cdb with
 explicitly given lockflags.

**Parameters**

- `com.tailf.cdb.Cdb cdb`
- `com.tailf.cdb.CdbDBType dbtype` - see [`CdbDBType`](CdbDBType.md#s-CdbDBType)
- `java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags` - [`CdbLockType`](CdbLockType.md#s-CdbLockType)

**Throws**

- `IOException`
- `ConfException`


## Fields

<a id="s-cdb"></a>
### cdb

```java
protected com.tailf.cdb.Cdb cdb = null;
```

Types: [Cdb](Cdb.md#s-Cdb)

<a id="s-dbType"></a>
### dbType

```java
protected com.tailf.cdb.CdbDBType dbType = null;
```

Types: [CdbDBType](CdbDBType.md#s-CdbDBType)

<a id="s-lockflags"></a>
### lockflags

```java
protected java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags = null;
```

Types: [CdbLockType](CdbLockType.md#s-CdbLockType)


## Methods

<a id="s-cd"></a>
### cd(ConfPath)

```java
public synchronized void cd(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

Changes the working directory.

**Parameters**

- `com.tailf.conf.ConfPath path` - ConfPath object

**Throws**

- `CdbException` - Failed to 'cd'
- `IOException` - Failed to read/write cdb socket

<a id="s-cd-1"></a>
### cd(String, Object[])

```java
public synchronized void cd(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Change working directory to container specified by path string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `ConfException`
- `IOException`

<a id="s-create"></a>
### create(ConfPath)

```java
public synchronized void create(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

Create a new optional element or list entry. Note that for container
 elements, sub-elements will not exist until created or set via some of
 the other functions, thus doing implicit create via
 [`ConfValue`](../conf/ConfValue.md#s-ConfValue) or
 [`ConfXMLParam`](../conf/ConfXMLParam.md#s-ConfXMLParam) may be preferred in this
 case.

**Parameters**

- `com.tailf.conf.ConfPath path` - ConfPath object

**Throws**

- `CdbException` - Failed to create
- `IOException` - Failed to write to cdb socket

<a id="s-create-1"></a>
### create(String, Object[])

```java
public synchronized void create(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

similar to [`ConfPath`](../conf/ConfPath.md#s-ConfPath) but specifies element using path
 string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `ConfException`
- `IOException`

<a id="s-delete"></a>
### delete(ConfPath)

```java
public synchronized void delete(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

Delete an optional element or list entry and all its child elements.

**Parameters**

- `com.tailf.conf.ConfPath path` - ConfPath object

**Throws**

- `CdbException` - Failed to delete element
- `IOException` - Failed to read/write cdb socket

<a id="s-delete-1"></a>
### delete(String, Object[])

```java
public synchronized void delete(
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

similar to [`ConfPath`](../conf/ConfPath.md#s-ConfPath) but specifies element using path
 string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `IOException`
- `ConfException`

<a id="s-endSession"></a>
### endSession()

```java
public synchronized void endSession() throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Ends the data session

**Throws**

- `CdbException` - Failed to end session
- `IOException` - Failed to read/write cdb socket

<a id="s-exists"></a>
### exists(ConfPath)

```java
public synchronized boolean exists(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

Containers and leafs in a YANG model may be optional. This function
 checks whether an element exists in the configuration. Returns true or
 false.

**Parameters**

- `com.tailf.conf.ConfPath path` - ConfPath object

**Throws**

- `CdbException` - Failed to check exists
- `IOException` - Failed to read/write cdb socket

<a id="s-exists-1"></a>
### exists(String, Object[])

```java
public synchronized boolean exists(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Checks whether an element exists. The element is specified using a path
 string and optionally string substitution parameters

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** true if exists

**Throws**

- `ConfException`
- `IOException`

<a id="s-getCase"></a>
### getCase(String, ConfPath)

```java
public synchronized com.tailf.conf.ConfObject getCase(
    String choice,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#s-ConfObject), [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

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

<a id="s-getCase-1"></a>
### getCase(String, String, Object[])

```java
public synchronized com.tailf.conf.ConfObject getCase(
    String choice,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#s-ConfObject), [ConfException](../conf/ConfException.md#s-ConfException)

Retrieve the currently selected case.


 When we use the YANG choice construct in the data model, this method
 can be used to find the currently selected case, avoiding useless
 [`ConfPath`](../conf/ConfPath.md#s-ConfPath) etc requests for elements
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

<a id="s-getCdb"></a>
### getCdb()

```java
public com.tailf.cdb.Cdb getCdb()
```

Types: [Cdb](Cdb.md#s-Cdb)

<a id="s-getcwd"></a>
### getcwd()

```java
public synchronized String getcwd() throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Returns the current position as previously set by [`ConfPath`](../conf/ConfPath.md#s-ConfPath),
 [`ConfPath`](../conf/ConfPath.md#s-ConfPath), or `#popd()` as a string.

**Throws**

- `CdbException` - Failed to 'getcwd'
- `IOException` - Failed to read/write cdb socket

<a id="s-getcwdPath"></a>
### getcwdPath()

```java
public synchronized com.tailf.conf.ConfObject[] getcwdPath() throws com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfObject](../conf/ConfObject.md#s-ConfObject), [ConfException](../conf/ConfException.md#s-ConfException)

Returns the current position as previously set by [`ConfPath`](../conf/ConfPath.md#s-ConfPath),
 [`ConfPath`](../conf/ConfPath.md#s-ConfPath), or `#popd()` as a
 `ConfObject` array.

**Throws**

- `CdbException` - Failed to 'getcwd'
- `IOException` - Failed to read/write cdb socket

<a id="s-getDbType"></a>
### getDbType()

```java
public com.tailf.cdb.CdbDBType getDbType()
```

Types: [CdbDBType](CdbDBType.md#s-CdbDBType)

retrieve the dbType for this session.

**Returns:** CdbDBType

<a id="s-getElem"></a>
### getElem(ConfPath)

```java
public synchronized com.tailf.conf.ConfValue getElem(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

This reads a a value from the path. The path must lead to a leaf element
 in the XML data tree.

**Parameters**

- `com.tailf.conf.ConfPath path` - The path

**Throws**

- `CdbException` - Failed to get element
- `IOException` - Failed to read/write cdb socket

<a id="s-getElem-1"></a>
### getElem(String, Object[])

```java
public synchronized com.tailf.conf.ConfValue getElem(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [ConfException](../conf/ConfException.md#s-ConfException)

similar to [`ConfPath`](../conf/ConfPath.md#s-ConfPath) but specifies element using path
 string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** element represented by a ConfValue

**Throws**

- `ConfException`
- `IOException`

<a id="s-getNumberOfInstances"></a>
### getNumberOfInstances(ConfPath)

```java
public synchronized int getNumberOfInstances(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

Returns the number of elements of a container type.

**Parameters**

- `com.tailf.conf.ConfPath path` - The path

**Throws**

- `CdbException` - Failed to get number of instances
- `IOException` - Failed to read/write cdb socket

<a id="s-getNumberOfInstances-1"></a>
### getNumberOfInstances(String, Object[])

```java
public synchronized int getNumberOfInstances(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

similar to [`ConfPath`](../conf/ConfPath.md#s-ConfPath) but specifies element
  using path string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** number of instances

**Throws**

- `ConfException`
- `IOException`

<a id="s-getObject"></a>
### getObject(int, ConfPath)

```java
public synchronized com.tailf.conf.ConfObject[] getObject(
    int numOfObjects,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#s-ConfObject), [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

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

<a id="s-getObject-1"></a>
### getObject(int, String, Object[])

```java
public synchronized com.tailf.conf.ConfObject[] getObject(
    int numOfObjects,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#s-ConfObject), [ConfException](../conf/ConfException.md#s-ConfException)

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

<a id="s-getObjects"></a>
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

Types: [ConfObject](../conf/ConfObject.md#s-ConfObject), [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

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

<a id="s-getObjects-1"></a>
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

Types: [ConfObject](../conf/ConfObject.md#s-ConfObject), [ConfException](../conf/ConfException.md#s-ConfException)

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

<a id="s-getValues"></a>
### getValues(ConfXMLParam[], ConfPath)

```java
public synchronized com.tailf.conf.ConfXMLParam[] getValues(
    com.tailf.conf.ConfXMLParam[] params,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

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

<a id="s-getValues-1"></a>
### getValues(ConfXMLParam[], String, Object[])

```java
public synchronized com.tailf.conf.ConfXMLParam[] getValues(
    com.tailf.conf.ConfXMLParam[] params,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [ConfException](../conf/ConfException.md#s-ConfException)

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

<a id="s-index"></a>
### index(ConfPath)

```java
public synchronized int index(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

Returns the position of a key

**Parameters**

- `com.tailf.conf.ConfPath path` - The path

**Throws**

- `CdbException` - Failed to get position
- `IOException` - Failed to read/write cdb socket

<a id="s-index-1"></a>
### index(String, Object[])

```java
public synchronized int index(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

similar to [`ConfPath`](../conf/ConfPath.md#s-ConfPath) but specifies element using path
 string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** position of key

**Throws**

- `ConfException`
- `IOException`

<a id="s-isDefault"></a>
### isDefault(ConfPath)

```java
public synchronized boolean isDefault(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

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

<a id="s-isDefault-1"></a>
### isDefault(String, Object[])

```java
public synchronized boolean isDefault(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

similar to [`ConfPath`](../conf/ConfPath.md#s-ConfPath) but specifies element using path
 string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** true/false if a leaf has a default value defined

**Throws**

- `ConfException`
- `IOException`

<a id="s-nextIndex"></a>
### nextIndex(ConfPath)

```java
public synchronized int nextIndex(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

Returns the position of the next key

**Parameters**

- `com.tailf.conf.ConfPath path` - The path

**Throws**

- `CdbException` - Failed to get next position
- `IOException` - Failed to read/write cdb socket

<a id="s-nextIndex-1"></a>
### nextIndex(String, Object[])

```java
public synchronized int nextIndex(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

similar to [`ConfPath`](../conf/ConfPath.md#s-ConfPath) but specifies element using path
 string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** position of next key

**Throws**

- `ConfException`
- `IOException`

<a id="s-popd"></a>
### popd()

```java
public synchronized void popd() throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Pops the top element from the directory stack and changes directory to
 previous directory.

**Throws**

- `CdbException` - Failed to 'popd'
- `IOException` - Failed to read/write cdb socket

<a id="s-pushd"></a>
### pushd(ConfPath)

```java
public synchronized void pushd(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

Similar to [`ConfPath`](../conf/ConfPath.md#s-ConfPath) but pushes the previous current
 directory on a stack.

**Parameters**

- `com.tailf.conf.ConfPath path` - ConfPath object

**Throws**

- `CdbException` - Failed to 'pushd'
- `IOException` - Failed to read/write cdb socket

<a id="s-pushd-1"></a>
### pushd(String, Object[])

```java
public synchronized void pushd(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

similar to [`ConfPath`](../conf/ConfPath.md#s-ConfPath) but specifies position using path
 string

**Parameters**

- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `ConfException`
- `IOException`

<a id="s-setCase"></a>
### setCase(String, String, ConfPath)

```java
public synchronized void setCase(
    String choice,
    String scase,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

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

<a id="s-setCase-1"></a>
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

Types: [ConfException](../conf/ConfException.md#s-ConfException)

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

<a id="s-setElem"></a>
### setElem(ConfValue, ConfPath)

```java
public synchronized void setElem(
    com.tailf.conf.ConfValue value,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

Sets an element in operational data.


 It is possible for an application to store operational data
 (i.e. status and statistical information) in *CDB*.



 The operational database avoids the use of transactions and locks in
 order to provide light-weight access methods, however when the
 multi-value API method are used, all updates requested by a
 given method call are carried out atomically.



 To establish a session for operational data, the application
 must use [`Cdb`](Cdb.md#s-Cdb) with
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

<a id="s-setElem-1"></a>
### setElem(ConfValue, String, Object[])

```java
public synchronized void setElem(
    com.tailf.conf.ConfValue value,
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [ConfException](../conf/ConfException.md#s-ConfException)

similar to [`ConfValue`](../conf/ConfValue.md#s-ConfValue) but specifies element
 using path string

**Parameters**

- `com.tailf.conf.ConfValue value`
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `ConfException`
- `IOException`

<a id="s-setNamespace"></a>
### setNamespace(ConfNamespace)

```java
public synchronized void setNamespace(
    com.tailf.conf.ConfNamespace ns
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfNamespace](../conf/ConfNamespace.md#s-ConfNamespace), [ConfException](../conf/ConfException.md#s-ConfException)

Before we start to read data from CDB we need to set the namespace. We
 are reading data related to a specific .fxs file. confdc can be used to
 generate a .class file with constants for the namespace, by using the
 flag --emit-java to confdc (see confdc(1))

**Parameters**

- `com.tailf.conf.ConfNamespace ns` - Name space object

**Throws**

- `CdbException` - Failed to set namespace
- `IOException` - Failed to read/write cdb socket

<a id="s-setObject"></a>
### setObject(ConfValue[], ConfPath)

```java
public synchronized void setObject(
    com.tailf.conf.ConfValue[] values,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

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

<a id="s-setObject-1"></a>
### setObject(ConfValue[], String, Object[])

```java
public synchronized void setObject(
    com.tailf.conf.ConfValue[] values,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [ConfException](../conf/ConfException.md#s-ConfException)

similar to [`ConfValue`](../conf/ConfValue.md#s-ConfValue) but specifies
 element using path string

**Parameters**

- `com.tailf.conf.ConfValue[] values`
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `IOException`
- `ConfException`

<a id="s-setValues"></a>
### setValues(ConfXMLParam[], ConfPath)

```java
public synchronized void setValues(
    com.tailf.conf.ConfXMLParam[] params,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

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

<a id="s-setValues-1"></a>
### setValues(ConfXMLParam[], String, Object[])

```java
public synchronized void setValues(
    com.tailf.conf.ConfXMLParam[] params,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [ConfException](../conf/ConfException.md#s-ConfException)

similar to [`ConfXMLParam`](../conf/ConfXMLParam.md#s-ConfXMLParam) but specifies
 element using path string

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`
- `String fmt`
- `Object[] arguments`

**Throws**

- `IOException`
- `ConfException`

<a id="s-setValues-2"></a>
### setValues(List<ConfXMLParam>, ConfPath)

```java
public synchronized void setValues(
    java.util.List<com.tailf.conf.ConfXMLParam> params,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `java.util.List<com.tailf.conf.ConfXMLParam> params`
- `com.tailf.conf.ConfPath path`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
