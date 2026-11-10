# CdbUpgradeSession <a href="#cdbupgradesession-a832ac9abf0d" id="cdbupgradesession-a832ac9abf0d"></a>

```java
public class com.tailf.cdb.CdbUpgradeSession
    extends com.tailf.cdb.CdbSession
```

Types: [CdbSession](CdbSession.md#cdbsession-9ffa54666283)

The class `CdbUpgradeSession` represents a session against
 the Cdb database that can be used for accessing data models that are
 in the process of being deleted by a cdb upgrade.

 The operations supported by an upgrade session are the same as those
 of a normal session, the only difference being that keypaths on the
 format (fmt, arguments) will be treated as ConfCdbUpgradePaths
 rather than ConfPaths.

 For information on specific methods, refer to the
 [`CdbSession`](CdbSession.md#cdbsession-9ffa54666283) documentation.

## Members

**Constructors**:

- [CdbUpgradeSession\(Cdb\)](#cdbupgradesession-9c7856c35ce4)
- [CdbUpgradeSession\(Cdb, CdbDBType\)](#cdbupgradesession-f35d15a5ad7d)
- [CdbUpgradeSession\(Cdb, CdbDBType, EnumSet\<CdbLockType\>\)](#cdbupgradesession-4758cb046786)

**Fields**:

- [cdb](CdbSession.md#cdb-40abbcead21f) from CdbSession
- [dbType](CdbSession.md#dbtype-578b3a70637a) from CdbSession
- [lockflags](CdbSession.md#lockflags-8ddca1b4c2e4) from CdbSession

**Methods**:

- [cd\(ConfCdbUpgradePath\)](#cd-76a3a9996341)
- [cd\(ConfPath\)](CdbSession.md#cd-a902c91e6177) from CdbSession
- [cd\(String, Object\.\.\.\)](#cd-656e49ed0708)
- [create\(ConfCdbUpgradePath\)](#create-cfb8c64701ae)
- [create\(ConfPath\)](CdbSession.md#create-02589a4ee236) from CdbSession
- [create\(String, Object\.\.\.\)](#create-7f34be5fee73)
- [delete\(ConfCdbUpgradePath\)](#delete-acddec731505)
- [delete\(ConfPath\)](CdbSession.md#delete-46ab41293f59) from CdbSession
- [delete\(String, Object\.\.\.\)](#delete-59815231e08f)
- [endSession\(\)](CdbSession.md#endsession-1853baeb5d28) from CdbSession
- [exists\(ConfCdbUpgradePath\)](#exists-34727aeeaf9c)
- [exists\(ConfPath\)](CdbSession.md#exists-afa14dd11748) from CdbSession
- [exists\(String, Object\.\.\.\)](#exists-8cb6a094bc72)
- [getCase\(String, ConfCdbUpgradePath\)](#getcase-b4fb83cb6c0c)
- [getCase\(String, ConfPath\)](CdbSession.md#getcase-db036ac6c713) from CdbSession
- [getCase\(String, String, Object\.\.\.\)](#getcase-7a8c640d71fb)
- [getCdb\(\)](CdbSession.md#getcdb-62d7a3429687) from CdbSession
- [getcwd\(\)](CdbSession.md#getcwd-18c6eed4f1fa) from CdbSession
- [getcwdPath\(\)](CdbSession.md#getcwdpath-a9fa1536fad1) from CdbSession
- [getDbType\(\)](CdbSession.md#getdbtype-9503dd2b103d) from CdbSession
- [getElem\(ConfCdbUpgradePath\)](#getelem-aaad89e84412)
- [getElem\(ConfPath\)](CdbSession.md#getelem-f8219fa65c5d) from CdbSession
- [getElem\(String, Object\.\.\.\)](#getelem-b10347fa5f74)
- [getNumberOfInstances\(ConfCdbUpgradePath\)](#getnumberofinstances-3fd583c7908c)
- [getNumberOfInstances\(ConfPath\)](CdbSession.md#getnumberofinstances-41d82cec9221) from CdbSession
- [getNumberOfInstances\(String, Object\.\.\.\)](#getnumberofinstances-afcd10b9edfc)
- [getObject\(int, ConfCdbUpgradePath\)](#getobject-d4ec118901b9)
- [getObject\(int, ConfPath\)](CdbSession.md#getobject-97126abcba49) from CdbSession
- [getObject\(int, String, Object\.\.\.\)](#getobject-2a5e3632866b)
- [getObjects\(int, int, int, ConfCdbUpgradePath\)](#getobjects-4f8eeb1cbe3a)
- [getObjects\(int, int, int, ConfPath\)](CdbSession.md#getobjects-d25a1860a73f) from CdbSession
- [getObjects\(int, int, int, String, Object\.\.\.\)](#getobjects-5abdac41ff54)
- [getValues\(ConfXMLParam\[\], ConfCdbUpgradePath\)](#getvalues-fb7bceb4a67a)
- [getValues\(ConfXMLParam\[\], ConfPath\)](CdbSession.md#getvalues-b30d01896278) from CdbSession
- [getValues\(ConfXMLParam\[\], String, Object\.\.\.\)](#getvalues-8d871bd0bd54)
- [index\(ConfCdbUpgradePath\)](#index-7926a22548c3)
- [index\(ConfPath\)](CdbSession.md#index-339d675c9a64) from CdbSession
- [index\(String, Object\.\.\.\)](#index-bf2a4c0b939f)
- [isDefault\(ConfCdbUpgradePath\)](#isdefault-d225e5140d47)
- [isDefault\(ConfPath\)](CdbSession.md#isdefault-a9229eae64cf) from CdbSession
- [isDefault\(String, Object\.\.\.\)](#isdefault-cbc53f62ddd3)
- [nextIndex\(ConfCdbUpgradePath\)](#nextindex-63eeb0d708e6)
- [nextIndex\(ConfPath\)](CdbSession.md#nextindex-ceef3a478d50) from CdbSession
- [nextIndex\(String, Object\.\.\.\)](#nextindex-6d3885f95e1a)
- [popd\(\)](CdbSession.md#popd-b092d2d9048f) from CdbSession
- [pushd\(ConfCdbUpgradePath\)](#pushd-8d23b319b093)
- [pushd\(ConfPath\)](CdbSession.md#pushd-d9d906674b7a) from CdbSession
- [pushd\(String, Object\.\.\.\)](#pushd-67e1c96bd6d8)
- [setCase\(String, String, ConfCdbUpgradePath\)](#setcase-8aa53e83a440)
- [setCase\(String, String, ConfPath\)](CdbSession.md#setcase-3792b2775b7f) from CdbSession
- [setCase\(String, String, String, Object\.\.\.\)](#setcase-8448ecd06d4a)
- [setElem\(ConfValue, ConfCdbUpgradePath\)](#setelem-648e489dcb58)
- [setElem\(ConfValue, ConfPath\)](CdbSession.md#setelem-356e5e479e47) from CdbSession
- [setElem\(ConfValue, String, Object\.\.\.\)](#setelem-cfdb3906e6eb)
- [setNamespace\(ConfNamespace\)](CdbSession.md#setnamespace-30316a480cfa) from CdbSession
- [setObject\(ConfValue\[\], ConfCdbUpgradePath\)](#setobject-1f294157790b)
- [setObject\(ConfValue\[\], ConfPath\)](CdbSession.md#setobject-741f2a72045e) from CdbSession
- [setObject\(ConfValue\[\], String, Object\.\.\.\)](#setobject-e4b4ada80388)
- [setValues\(ConfXMLParam\[\], ConfCdbUpgradePath\)](#setvalues-c275631d1d78)
- [setValues\(ConfXMLParam\[\], ConfPath\)](CdbSession.md#setvalues-0755e36fbd2c) from CdbSession
- [setValues\(ConfXMLParam\[\], String, Object\.\.\.\)](#setvalues-d4c8d79fa589)
- [setValues\(List\<ConfXMLParam\>, ConfPath\)](CdbSession.md#setvalues-970140dc0796) from CdbSession
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### CdbUpgradeSession(Cdb) <a href="#cdbupgradesession-9c7856c35ce4" id="cdbupgradesession-9c7856c35ce4"></a>

```java
public CdbUpgradeSession(
    com.tailf.cdb.Cdb cdb
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Cdb](Cdb.md#cdb-cb7fc41768c9), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.cdb.Cdb cdb`

### CdbUpgradeSession(Cdb, CdbDBType) <a href="#cdbupgradesession-f35d15a5ad7d" id="cdbupgradesession-f35d15a5ad7d"></a>

```java
public CdbUpgradeSession(
    com.tailf.cdb.Cdb cdb,
    com.tailf.cdb.CdbDBType dbtype
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [Cdb](Cdb.md#cdb-cb7fc41768c9), [CdbDBType](CdbDBType.md#cdbdbtype-5ae1aed3f97a), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.cdb.Cdb cdb`
- `com.tailf.cdb.CdbDBType dbtype`

### CdbUpgradeSession(Cdb, CdbDBType, EnumSet&lt;CdbLockType&gt;) <a href="#cdbupgradesession-4758cb046786" id="cdbupgradesession-4758cb046786"></a>

```java
public CdbUpgradeSession(
    com.tailf.cdb.Cdb cdb,
    com.tailf.cdb.CdbDBType dbtype,
    java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [Cdb](Cdb.md#cdb-cb7fc41768c9), [CdbDBType](CdbDBType.md#cdbdbtype-5ae1aed3f97a), [CdbLockType](CdbLockType.md#cdblocktype-1d165621c0a3), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.cdb.Cdb cdb`
- `com.tailf.cdb.CdbDBType dbtype`
- `java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags`


## Methods

### cd(ConfCdbUpgradePath) <a href="#cd-76a3a9996341" id="cd-76a3a9996341"></a>

```java
public synchronized void cd(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#confcdbupgradepath-fe0db0ca5cb5), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

### cd(String, Object...) <a href="#cd-656e49ed0708" id="cd-656e49ed0708"></a>

```java
public synchronized void cd(
    String fmt,
    Object... arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

*Description from* [`CdbSession.cd(String, Object...)`](CdbSession.md#cd-656e49ed0708)

Change working directory to container specified by path string

**Parameters**

- `String fmt` - path string
- `Object... arguments` - optional parameters for substitution in fmt

### create(ConfCdbUpgradePath) <a href="#create-cfb8c64701ae" id="create-cfb8c64701ae"></a>

```java
public synchronized void create(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#confcdbupgradepath-fe0db0ca5cb5), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

### create(String, Object...) <a href="#create-7f34be5fee73" id="create-7f34be5fee73"></a>

```java
public synchronized void create(
    String fmt,
    Object... arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

*Description from* [`CdbSession.create(String, Object...)`](CdbSession.md#create-7f34be5fee73)

similar to [`create(ConfPath)`](CdbSession.md#create-02589a4ee236) but specifies element using path
 string

**Parameters**

- `String fmt` - path string
- `Object... arguments` - optional parameters for substitution in fmt

### delete(ConfCdbUpgradePath) <a href="#delete-acddec731505" id="delete-acddec731505"></a>

```java
public synchronized void delete(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#confcdbupgradepath-fe0db0ca5cb5), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

### delete(String, Object...) <a href="#delete-59815231e08f" id="delete-59815231e08f"></a>

```java
public synchronized void delete(
    String fmt,
    Object... arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

*Description from* [`CdbSession.delete(String, Object...)`](CdbSession.md#delete-59815231e08f)

similar to [`delete(ConfPath)`](CdbSession.md#delete-46ab41293f59) but specifies element using path
 string

**Parameters**

- `String fmt` - path string
- `Object... arguments` - optional parameters for substitution in fmt

### exists(ConfCdbUpgradePath) <a href="#exists-34727aeeaf9c" id="exists-34727aeeaf9c"></a>

```java
public synchronized boolean exists(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#confcdbupgradepath-fe0db0ca5cb5), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

### exists(String, Object...) <a href="#exists-8cb6a094bc72" id="exists-8cb6a094bc72"></a>

```java
public synchronized boolean exists(
    String fmt,
    Object... arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

*Description from* [`CdbSession.exists(String, Object...)`](CdbSession.md#exists-8cb6a094bc72)

Checks whether an element exists. The element is specified using a path
 string and optionally string substitution parameters

**Parameters**

- `String fmt` - path string
- `Object... arguments` - optional parameters for substitution in fmt

**Returns:** true if exists

### getCase(String, ConfCdbUpgradePath) <a href="#getcase-b4fb83cb6c0c" id="getcase-b4fb83cb6c0c"></a>

```java
public synchronized com.tailf.conf.ConfObject getCase(
    String choice,
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#confcdbupgradepath-fe0db0ca5cb5), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String choice`
- `com.tailf.conf.ConfCdbUpgradePath path`

### getCase(String, String, Object...) <a href="#getcase-7a8c640d71fb" id="getcase-7a8c640d71fb"></a>

```java
public synchronized com.tailf.conf.ConfObject getCase(
    String choice,
    String fmt,
    Object... arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

*Description from* [`CdbSession.getCase(String, String, Object...)`](CdbSession.md#getcase-7a8c640d71fb)

Retrieve the currently selected case.

When we use the YANG choice construct in the data model, this method
 can be used to find the currently selected case, avoiding useless
 [`getElem(ConfPath)`](CdbSession.md#getelem-f8219fa65c5d) etc requests for elements
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
- `Object... arguments` - replacement arguments for fmt string

**Returns:** ConfObject case value as `ConfTag`

### getElem(ConfCdbUpgradePath) <a href="#getelem-aaad89e84412" id="getelem-aaad89e84412"></a>

```java
public synchronized com.tailf.conf.ConfValue getElem(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#confcdbupgradepath-fe0db0ca5cb5), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

### getElem(String, Object...) <a href="#getelem-b10347fa5f74" id="getelem-b10347fa5f74"></a>

```java
public synchronized com.tailf.conf.ConfValue getElem(
    String fmt,
    Object... arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

*Description from* [`CdbSession.getElem(String, Object...)`](CdbSession.md#getelem-b10347fa5f74)

similar to [`getElem(ConfPath)`](CdbSession.md#getelem-f8219fa65c5d) but specifies element using path
 string

**Parameters**

- `String fmt` - path string
- `Object... arguments` - optional parameters for substitution in fmt

**Returns:** element represented by a ConfValue

### getNumberOfInstances(ConfCdbUpgradePath) <a href="#getnumberofinstances-3fd583c7908c" id="getnumberofinstances-3fd583c7908c"></a>

```java
public synchronized int getNumberOfInstances(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#confcdbupgradepath-fe0db0ca5cb5), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

### getNumberOfInstances(String, Object...) <a href="#getnumberofinstances-afcd10b9edfc" id="getnumberofinstances-afcd10b9edfc"></a>

```java
public synchronized int getNumberOfInstances(
    String fmt,
    Object... arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

*Description from* [`CdbSession.getNumberOfInstances(String, Object...)`](CdbSession.md#getnumberofinstances-afcd10b9edfc)

similar to [`getNumberOfInstances(ConfPath)`](CdbSession.md#getnumberofinstances-41d82cec9221) but specifies element
  using path string

**Parameters**

- `String fmt` - path string
- `Object... arguments` - optional parameters for substitution in fmt

**Returns:** number of instances

### getObject(int, ConfCdbUpgradePath) <a href="#getobject-d4ec118901b9" id="getobject-d4ec118901b9"></a>

```java
public synchronized com.tailf.conf.ConfObject[] getObject(
    int numOfObjects,
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#confcdbupgradepath-fe0db0ca5cb5), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `int numOfObjects`
- `com.tailf.conf.ConfCdbUpgradePath path`

### getObject(int, String, Object...) <a href="#getobject-2a5e3632866b" id="getobject-2a5e3632866b"></a>

```java
public synchronized com.tailf.conf.ConfObject[] getObject(
    int numOfObjects,
    String fmt,
    Object... arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

*Description from* [`CdbSession.getObject(int, String, Object...)`](CdbSession.md#getobject-2a5e3632866b)

In some cases it can be motivated to read multiple values in one request
 \- this will be more efficient since it only incurs a single round trip to
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
String path = "/mtest/servers/server{www}/interface{%s}";
ConfObject[] objArr = cdbsess.getObject(4, path, "eth0");

ConfBuf name = (ConfBuf) objArr[0];
ConfInt64 mtu = (ConfInt64) objArr[1];
```

**Parameters**

- `int numOfObjects` - number of objects to retrieve
- `String fmt`
- `Object... arguments`

**Returns:** ConfObject\[\]

### getObjects(int, int, int, ConfCdbUpgradePath) <a href="#getobjects-4f8eeb1cbe3a" id="getobjects-4f8eeb1cbe3a"></a>

```java
public synchronized java.util.List<com.tailf.conf.ConfObject[]> getObjects(
    int numOfObjects,
    int instance,
    int numOfInstances,
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#confcdbupgradepath-fe0db0ca5cb5), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `int numOfObjects`
- `int instance`
- `int numOfInstances`
- `com.tailf.conf.ConfCdbUpgradePath path`

### getObjects(int, int, int, String, Object...) <a href="#getobjects-5abdac41ff54" id="getobjects-5abdac41ff54"></a>

```java
public synchronized java.util.List<com.tailf.conf.ConfObject[]> getObjects(
    int numOfObjects,
    int instance,
    int numOfInstances,
    String fmt,
    Object... arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

*Description from* [`CdbSession.getObjects(int, int, int, String, Object...)`](CdbSession.md#getobjects-5abdac41ff54)

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
String path = "/mtest/servers/server";
int n = cdbsess.getNumberOfInstances(path);
List<ConfObject[]> objArrList = cdbsess.getObjects(4, 0, n, path);

ConfBuf[] name = new ConfBuf[n];
ConfIPv4[] ip = new ConfIPv4[n];
ConfUInt16[] port = new ConfUInt16[n];
for (int i = 0; i < objArrList.size(); i++) {
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
- `Object... arguments`

**Returns:** List\<ConfObject\[\]\>

### getValues(ConfXMLParam[], ConfCdbUpgradePath) <a href="#getvalues-fb7bceb4a67a" id="getvalues-fb7bceb4a67a"></a>

```java
public synchronized com.tailf.conf.ConfXMLParam[] getValues(
    com.tailf.conf.ConfXMLParam[] params,
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#confcdbupgradepath-fe0db0ca5cb5), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`
- `com.tailf.conf.ConfCdbUpgradePath path`

### getValues(ConfXMLParam[], String, Object...) <a href="#getvalues-8d871bd0bd54" id="getvalues-8d871bd0bd54"></a>

```java
public synchronized com.tailf.conf.ConfXMLParam[] getValues(
    com.tailf.conf.ConfXMLParam[] params,
    String fmt,
    Object... arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

*Description from* [`CdbSession.getValues(com.tailf.conf.ConfXMLParam[], String, Object...)`](CdbSession.md#getvalues-8d871bd0bd54)

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
 String path = "/mtest/servers/server";
 int n = cdbsess.getNumberOfInstances(path);
 List<ConfObject[]> objArrList = cdbsess.getObjects(4,0,n,path);

 //when reading ip/port, we need 5 elements per interface:
 //begin + name (key) + ip + port + end
 ConfXMLParam[] values = new ConfXMLParam[5*n];

 int j = 0;
 for (int i=0; i<n; i++) {
     values[j++] = new ConfXMLParamCdbStart(ns, "server", i);
     values[j++] = new ConfXMLParamLeaf(ns, "name");
     values[j++] = new ConfXMLParamLeaf(ns, "ip");
     values[j++] = new ConfXMLParamLeaf(ns, "port");
     values[j++] = new ConfXMLParamStop(ns, "server");
 }
 path = "/mtest/servers";
 ConfXMLParam[] resvalues = cdbsess.getValues(values, path);

 // extract name for enabled interfaces
 String name = null;
 int noOfInterfaces = 0;
 for (int i = 0; i < n; i++) {
     ConfIPv4 ip4 = (ConfIPv4) resvalues[i*5+2].getValue();
     name = resvalues[i*5+1].getValue().toString();
     path = "/mtest/servers/server{%s}/interface";
     noOfInterfaces = cdbsess.getNumberOfInstances(path, name);
     System.out.println("name = "+ name);
 }
 int n_if = j;
 j = 0;

 values = new ConfXMLParam[noOfInterfaces*4];
 for (int i=0; i<noOfInterfaces; i++) {
     values[j++] = new ConfXMLParamCdbStart(ns.hash(),
                                         ns.mtest_interface, i);
     values[j++] = new ConfXMLParamLeaf(ns.hash(),
                                        ns.mtest_name);
     values[j++] = new ConfXMLParamLeaf(ns.hash(),
                                        ns.mtest_mtu);
     values[j++] = new ConfXMLParamStop(ns.hash(),
                                       ns.mtest_interface);
  }
  path = "/mtest/servers/server{%s}";
  resvalues = cdbsess.getValues(values, path, name);

...
```

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`
- `String fmt`
- `Object... arguments`

**Returns:** ConfXMLParam\[\]

### index(ConfCdbUpgradePath) <a href="#index-7926a22548c3" id="index-7926a22548c3"></a>

```java
public synchronized int index(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#confcdbupgradepath-fe0db0ca5cb5), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

### index(String, Object...) <a href="#index-bf2a4c0b939f" id="index-bf2a4c0b939f"></a>

```java
public synchronized int index(
    String fmt,
    Object... arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

*Description from* [`CdbSession.index(String, Object...)`](CdbSession.md#index-bf2a4c0b939f)

similar to [`index(ConfPath)`](CdbSession.md#index-339d675c9a64) but specifies element using path
 string

**Parameters**

- `String fmt` - path string
- `Object... arguments` - optional parameters for substitution in fmt

**Returns:** position of key

### isDefault(ConfCdbUpgradePath) <a href="#isdefault-d225e5140d47" id="isdefault-d225e5140d47"></a>

```java
public synchronized boolean isDefault(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#confcdbupgradepath-fe0db0ca5cb5), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

### isDefault(String, Object...) <a href="#isdefault-cbc53f62ddd3" id="isdefault-cbc53f62ddd3"></a>

```java
public synchronized boolean isDefault(
    String fmt,
    Object... arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

*Description from* [`CdbSession.isDefault(String, Object...)`](CdbSession.md#isdefault-cbc53f62ddd3)

similar to [`isDefault(ConfPath)`](CdbSession.md#isdefault-a9229eae64cf) but specifies element using path
 string

**Parameters**

- `String fmt` - path string
- `Object... arguments` - optional parameters for substitution in fmt

**Returns:** true/false if a leaf has a default value defined

### nextIndex(ConfCdbUpgradePath) <a href="#nextindex-63eeb0d708e6" id="nextindex-63eeb0d708e6"></a>

```java
public synchronized int nextIndex(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#confcdbupgradepath-fe0db0ca5cb5), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

### nextIndex(String, Object...) <a href="#nextindex-6d3885f95e1a" id="nextindex-6d3885f95e1a"></a>

```java
public synchronized int nextIndex(
    String fmt,
    Object... arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

*Description from* [`CdbSession.nextIndex(String, Object...)`](CdbSession.md#nextindex-6d3885f95e1a)

similar to [`nextIndex(ConfPath)`](CdbSession.md#nextindex-ceef3a478d50) but specifies element using path
 string

**Parameters**

- `String fmt` - path string
- `Object... arguments` - optional parameters for substitution in fmt

**Returns:** position of next key

### pushd(ConfCdbUpgradePath) <a href="#pushd-8d23b319b093" id="pushd-8d23b319b093"></a>

```java
public synchronized void pushd(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#confcdbupgradepath-fe0db0ca5cb5), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

### pushd(String, Object...) <a href="#pushd-67e1c96bd6d8" id="pushd-67e1c96bd6d8"></a>

```java
public synchronized void pushd(
    String fmt,
    Object... arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

*Description from* [`CdbSession.pushd(String, Object...)`](CdbSession.md#pushd-67e1c96bd6d8)

similar to [`pushd(ConfPath)`](CdbSession.md#pushd-d9d906674b7a) but specifies position using path
 string

**Parameters**

- `String fmt` - path string
- `Object... arguments` - optional parameters for substitution in fmt

### setCase(String, String, ConfCdbUpgradePath) <a href="#setcase-8aa53e83a440" id="setcase-8aa53e83a440"></a>

```java
public synchronized void setCase(
    String choice,
    String scase,
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#confcdbupgradepath-fe0db0ca5cb5), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String choice`
- `String scase`
- `com.tailf.conf.ConfCdbUpgradePath path`

### setCase(String, String, String, Object...) <a href="#setcase-8448ecd06d4a" id="setcase-8448ecd06d4a"></a>

```java
public synchronized void setCase(
    String choice,
    String scase,
    String fmt,
    Object... arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

*Description from* [`CdbSession.setCase(String, String, String, Object...)`](CdbSession.md#setcase-8448ecd06d4a)

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
- `Object... arguments` - replacement arguments for fmt string

### setElem(ConfValue, ConfCdbUpgradePath) <a href="#setelem-648e489dcb58" id="setelem-648e489dcb58"></a>

```java
public synchronized void setElem(
    com.tailf.conf.ConfValue value,
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#confcdbupgradepath-fe0db0ca5cb5), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.ConfValue value`
- `com.tailf.conf.ConfCdbUpgradePath path`

### setElem(ConfValue, String, Object...) <a href="#setelem-cfdb3906e6eb" id="setelem-cfdb3906e6eb"></a>

```java
public synchronized void setElem(
    com.tailf.conf.ConfValue value,
    String fmt,
    Object... arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

*Description from* [`CdbSession.setElem(com.tailf.conf.ConfValue, String, Object...)`](CdbSession.md#setelem-cfdb3906e6eb)

similar to [`setElem(ConfValue, ConfPath)`](CdbSession.md#setelem-356e5e479e47) but specifies element
 using path string

**Parameters**

- `com.tailf.conf.ConfValue value`
- `String fmt` - path string
- `Object... arguments` - optional parameters for substitution in fmt

### setObject(ConfValue[], ConfCdbUpgradePath) <a href="#setobject-1f294157790b" id="setobject-1f294157790b"></a>

```java
public synchronized void setObject(
    com.tailf.conf.ConfValue[] values,
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#confcdbupgradepath-fe0db0ca5cb5), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.ConfValue[] values`
- `com.tailf.conf.ConfCdbUpgradePath path`

### setObject(ConfValue[], String, Object...) <a href="#setobject-e4b4ada80388" id="setobject-e4b4ada80388"></a>

```java
public synchronized void setObject(
    com.tailf.conf.ConfValue[] values,
    String fmt,
    Object... arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

*Description from* [`CdbSession.setObject(com.tailf.conf.ConfValue[], String, Object...)`](CdbSession.md#setobject-e4b4ada80388)

similar to [`setObject(ConfValue[], ConfPath)`](CdbSession.md#setobject-741f2a72045e) but specifies
 element using path string

**Parameters**

- `com.tailf.conf.ConfValue[] values`
- `String fmt` - path string
- `Object... arguments` - optional parameters for substitution in fmt

### setValues(ConfXMLParam[], ConfCdbUpgradePath) <a href="#setvalues-c275631d1d78" id="setvalues-c275631d1d78"></a>

```java
public synchronized void setValues(
    com.tailf.conf.ConfXMLParam[] params,
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#confcdbupgradepath-fe0db0ca5cb5), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`
- `com.tailf.conf.ConfCdbUpgradePath path`

### setValues(ConfXMLParam[], String, Object...) <a href="#setvalues-d4c8d79fa589" id="setvalues-d4c8d79fa589"></a>

```java
public synchronized void setValues(
    com.tailf.conf.ConfXMLParam[] params,
    String fmt,
    Object... arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

*Description from* [`CdbSession.setValues(com.tailf.conf.ConfXMLParam[], String, Object...)`](CdbSession.md#setvalues-d4c8d79fa589)

similar to [`setValues(ConfXMLParam[], ConfPath)`](CdbSession.md#setvalues-0755e36fbd2c) but specifies
 element using path string

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`
- `String fmt`
- `Object... arguments`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
