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
- [cd\(String, Object\[\]\)](#cd-751c8b439d16)
- [create\(ConfCdbUpgradePath\)](#create-cfb8c64701ae)
- [create\(ConfPath\)](CdbSession.md#create-02589a4ee236) from CdbSession
- [create\(String, Object\[\]\)](#create-8d8ef9670e7f)
- [delete\(ConfCdbUpgradePath\)](#delete-acddec731505)
- [delete\(ConfPath\)](CdbSession.md#delete-46ab41293f59) from CdbSession
- [delete\(String, Object\[\]\)](#delete-a6dae6a18c6e)
- [endSession\(\)](CdbSession.md#endsession-1853baeb5d28) from CdbSession
- [exists\(ConfCdbUpgradePath\)](#exists-34727aeeaf9c)
- [exists\(ConfPath\)](CdbSession.md#exists-afa14dd11748) from CdbSession
- [exists\(String, Object\[\]\)](#exists-c95896218534)
- [getCase\(String, ConfCdbUpgradePath\)](#getcase-b4fb83cb6c0c)
- [getCase\(String, ConfPath\)](CdbSession.md#getcase-db036ac6c713) from CdbSession
- [getCase\(String, String, Object\[\]\)](#getcase-9058de2e1364)
- [getCdb\(\)](CdbSession.md#getcdb-62d7a3429687) from CdbSession
- [getcwd\(\)](CdbSession.md#getcwd-18c6eed4f1fa) from CdbSession
- [getcwdPath\(\)](CdbSession.md#getcwdpath-a9fa1536fad1) from CdbSession
- [getDbType\(\)](CdbSession.md#getdbtype-9503dd2b103d) from CdbSession
- [getElem\(ConfCdbUpgradePath\)](#getelem-aaad89e84412)
- [getElem\(ConfPath\)](CdbSession.md#getelem-f8219fa65c5d) from CdbSession
- [getElem\(String, Object\[\]\)](#getelem-8ec719438ea8)
- [getNumberOfInstances\(ConfCdbUpgradePath\)](#getnumberofinstances-3fd583c7908c)
- [getNumberOfInstances\(ConfPath\)](CdbSession.md#getnumberofinstances-41d82cec9221) from CdbSession
- [getNumberOfInstances\(String, Object\[\]\)](#getnumberofinstances-4ff46f9afb5c)
- [getObject\(int, ConfCdbUpgradePath\)](#getobject-d4ec118901b9)
- [getObject\(int, ConfPath\)](CdbSession.md#getobject-97126abcba49) from CdbSession
- [getObject\(int, String, Object\[\]\)](#getobject-8f535bb4e0e8)
- [getObjects\(int, int, int, ConfCdbUpgradePath\)](#getobjects-4f8eeb1cbe3a)
- [getObjects\(int, int, int, ConfPath\)](CdbSession.md#getobjects-d25a1860a73f) from CdbSession
- [getObjects\(int, int, int, String, Object\[\]\)](#getobjects-9108870a6290)
- [getValues\(ConfXMLParam\[\], ConfCdbUpgradePath\)](#getvalues-fb7bceb4a67a)
- [getValues\(ConfXMLParam\[\], ConfPath\)](CdbSession.md#getvalues-b30d01896278) from CdbSession
- [getValues\(ConfXMLParam\[\], String, Object\[\]\)](#getvalues-f93a502602ef)
- [index\(ConfCdbUpgradePath\)](#index-7926a22548c3)
- [index\(ConfPath\)](CdbSession.md#index-339d675c9a64) from CdbSession
- [index\(String, Object\[\]\)](#index-cae5f09ba6fb)
- [isDefault\(ConfCdbUpgradePath\)](#isdefault-d225e5140d47)
- [isDefault\(ConfPath\)](CdbSession.md#isdefault-a9229eae64cf) from CdbSession
- [isDefault\(String, Object\[\]\)](#isdefault-8c3502a0ab6d)
- [nextIndex\(ConfCdbUpgradePath\)](#nextindex-63eeb0d708e6)
- [nextIndex\(ConfPath\)](CdbSession.md#nextindex-ceef3a478d50) from CdbSession
- [nextIndex\(String, Object\[\]\)](#nextindex-c2b059f89584)
- [popd\(\)](CdbSession.md#popd-b092d2d9048f) from CdbSession
- [pushd\(ConfCdbUpgradePath\)](#pushd-8d23b319b093)
- [pushd\(ConfPath\)](CdbSession.md#pushd-d9d906674b7a) from CdbSession
- [pushd\(String, Object\[\]\)](#pushd-fd6a4c1b1c8d)
- [setCase\(String, String, ConfCdbUpgradePath\)](#setcase-8aa53e83a440)
- [setCase\(String, String, ConfPath\)](CdbSession.md#setcase-3792b2775b7f) from CdbSession
- [setCase\(String, String, String, Object\[\]\)](#setcase-908203af825d)
- [setElem\(ConfValue, ConfCdbUpgradePath\)](#setelem-648e489dcb58)
- [setElem\(ConfValue, ConfPath\)](CdbSession.md#setelem-356e5e479e47) from CdbSession
- [setElem\(ConfValue, String, Object\[\]\)](#setelem-7fc14a355edc)
- [setNamespace\(ConfNamespace\)](CdbSession.md#setnamespace-30316a480cfa) from CdbSession
- [setObject\(ConfValue\[\], ConfCdbUpgradePath\)](#setobject-1f294157790b)
- [setObject\(ConfValue\[\], ConfPath\)](CdbSession.md#setobject-741f2a72045e) from CdbSession
- [setObject\(ConfValue\[\], String, Object\[\]\)](#setobject-5edb7e0ee677)
- [setValues\(ConfXMLParam\[\], ConfCdbUpgradePath\)](#setvalues-c275631d1d78)
- [setValues\(ConfXMLParam\[\], ConfPath\)](CdbSession.md#setvalues-0755e36fbd2c) from CdbSession
- [setValues\(ConfXMLParam\[\], String, Object\[\]\)](#setvalues-824d05856f15)
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

### cd(String, Object[]) <a href="#cd-751c8b439d16" id="cd-751c8b439d16"></a>

```java
public synchronized void cd(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String fmt`
- `Object[] arguments`

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

### create(String, Object[]) <a href="#create-8d8ef9670e7f" id="create-8d8ef9670e7f"></a>

```java
public synchronized void create(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String fmt`
- `Object[] arguments`

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

### delete(String, Object[]) <a href="#delete-a6dae6a18c6e" id="delete-a6dae6a18c6e"></a>

```java
public synchronized void delete(
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String fmt`
- `Object[] arguments`

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

### exists(String, Object[]) <a href="#exists-c95896218534" id="exists-c95896218534"></a>

```java
public synchronized boolean exists(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String fmt`
- `Object[] arguments`

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

**Parameters**

- `String choice`
- `String fmt`
- `Object[] arguments`

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

### getElem(String, Object[]) <a href="#getelem-8ec719438ea8" id="getelem-8ec719438ea8"></a>

```java
public synchronized com.tailf.conf.ConfValue getElem(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String fmt`
- `Object[] arguments`

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

### getNumberOfInstances(String, Object[]) <a href="#getnumberofinstances-4ff46f9afb5c" id="getnumberofinstances-4ff46f9afb5c"></a>

```java
public synchronized int getNumberOfInstances(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String fmt`
- `Object[] arguments`

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

**Parameters**

- `int numOfObjects`
- `String fmt`
- `Object[] arguments`

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

**Parameters**

- `int numOfObjects`
- `int instance`
- `int numOfInstances`
- `String fmt`
- `Object[] arguments`

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

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`
- `String fmt`
- `Object[] arguments`

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

### index(String, Object[]) <a href="#index-cae5f09ba6fb" id="index-cae5f09ba6fb"></a>

```java
public synchronized int index(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String fmt`
- `Object[] arguments`

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

### isDefault(String, Object[]) <a href="#isdefault-8c3502a0ab6d" id="isdefault-8c3502a0ab6d"></a>

```java
public synchronized boolean isDefault(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String fmt`
- `Object[] arguments`

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

### nextIndex(String, Object[]) <a href="#nextindex-c2b059f89584" id="nextindex-c2b059f89584"></a>

```java
public synchronized int nextIndex(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String fmt`
- `Object[] arguments`

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

### pushd(String, Object[]) <a href="#pushd-fd6a4c1b1c8d" id="pushd-fd6a4c1b1c8d"></a>

```java
public synchronized void pushd(
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String fmt`
- `Object[] arguments`

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

**Parameters**

- `String choice`
- `String scase`
- `String fmt`
- `Object[] arguments`

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

**Parameters**

- `com.tailf.conf.ConfValue value`
- `String fmt`
- `Object[] arguments`

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

**Parameters**

- `com.tailf.conf.ConfValue[] values`
- `String fmt`
- `Object[] arguments`

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

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`
- `String fmt`
- `Object[] arguments`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
