<a id="cls-CdbUpgradeSession"></a>
# CdbUpgradeSession

```java
public class com.tailf.cdb.CdbUpgradeSession
    extends com.tailf.cdb.CdbSession
```

Types: [CdbSession](CdbSession.md#cls-CdbSession)

The class `CdbUpgradeSession` represents a session against
 the Cdb database that can be used for accessing data models that are
 in the process of being deleted by a cdb upgrade.

 The operations supported by an upgrade session are the same as those
 of a normal session, the only difference being that keypaths on the
 format (fmt, arguments) will be treated as ConfCdbUpgradePaths
 rather than ConfPaths.

 For information on specific methods, refer to the
 [`CdbSession`](CdbSession.md#cls-CdbSession) documentation.

## Members

**Constructors**:

- [CdbUpgradeSession(Cdb)](#m-cdbupgradesession-9c7856c35ce4)
- [CdbUpgradeSession(Cdb, CdbDBType)](#m-cdbupgradesession-f35d15a5ad7d)
- [CdbUpgradeSession(Cdb, CdbDBType, EnumSet<CdbLockType>)](#m-cdbupgradesession-4758cb046786)

**Fields**:

- [cdb](CdbSession.md#m-cdb) from CdbSession
- [dbType](CdbSession.md#m-dbType) from CdbSession
- [lockflags](CdbSession.md#m-lockflags) from CdbSession

**Methods**:

- [cd(ConfCdbUpgradePath)](#m-cd-76a3a9996341)
- [cd(ConfPath)](CdbSession.md#m-cd-a902c91e6177) from CdbSession
- [cd(String, Object[])](#m-cd-751c8b439d16)
- [create(ConfCdbUpgradePath)](#m-create-cfb8c64701ae)
- [create(ConfPath)](CdbSession.md#m-create-02589a4ee236) from CdbSession
- [create(String, Object[])](#m-create-8d8ef9670e7f)
- [delete(ConfCdbUpgradePath)](#m-delete-acddec731505)
- [delete(ConfPath)](CdbSession.md#m-delete-46ab41293f59) from CdbSession
- [delete(String, Object[])](#m-delete-a6dae6a18c6e)
- [endSession()](CdbSession.md#m-endsession-1853baeb5d28) from CdbSession
- [exists(ConfCdbUpgradePath)](#m-exists-34727aeeaf9c)
- [exists(ConfPath)](CdbSession.md#m-exists-afa14dd11748) from CdbSession
- [exists(String, Object[])](#m-exists-c95896218534)
- [getCase(String, ConfCdbUpgradePath)](#m-getcase-b4fb83cb6c0c)
- [getCase(String, ConfPath)](CdbSession.md#m-getcase-db036ac6c713) from CdbSession
- [getCase(String, String, Object[])](#m-getcase-9058de2e1364)
- [getCdb()](CdbSession.md#m-getcdb-62d7a3429687) from CdbSession
- [getcwd()](CdbSession.md#m-getcwd-18c6eed4f1fa) from CdbSession
- [getcwdPath()](CdbSession.md#m-getcwdpath-a9fa1536fad1) from CdbSession
- [getDbType()](CdbSession.md#m-getdbtype-9503dd2b103d) from CdbSession
- [getElem(ConfCdbUpgradePath)](#m-getelem-aaad89e84412)
- [getElem(ConfPath)](CdbSession.md#m-getelem-f8219fa65c5d) from CdbSession
- [getElem(String, Object[])](#m-getelem-8ec719438ea8)
- [getNumberOfInstances(ConfCdbUpgradePath)](#m-getnumberofinstances-3fd583c7908c)
- [getNumberOfInstances(ConfPath)](CdbSession.md#m-getnumberofinstances-41d82cec9221) from CdbSession
- [getNumberOfInstances(String, Object[])](#m-getnumberofinstances-4ff46f9afb5c)
- [getObject(int, ConfCdbUpgradePath)](#m-getobject-d4ec118901b9)
- [getObject(int, ConfPath)](CdbSession.md#m-getobject-97126abcba49) from CdbSession
- [getObject(int, String, Object[])](#m-getobject-8f535bb4e0e8)
- [getObjects(int, int, int, ConfCdbUpgradePath)](#m-getobjects-4f8eeb1cbe3a)
- [getObjects(int, int, int, ConfPath)](CdbSession.md#m-getobjects-d25a1860a73f) from CdbSession
- [getObjects(int, int, int, String, Object[])](#m-getobjects-9108870a6290)
- [getValues(ConfXMLParam[], ConfCdbUpgradePath)](#m-getvalues-fb7bceb4a67a)
- [getValues(ConfXMLParam[], ConfPath)](CdbSession.md#m-getvalues-b30d01896278) from CdbSession
- [getValues(ConfXMLParam[], String, Object[])](#m-getvalues-f93a502602ef)
- [index(ConfCdbUpgradePath)](#m-index-7926a22548c3)
- [index(ConfPath)](CdbSession.md#m-index-339d675c9a64) from CdbSession
- [index(String, Object[])](#m-index-cae5f09ba6fb)
- [isDefault(ConfCdbUpgradePath)](#m-isdefault-d225e5140d47)
- [isDefault(ConfPath)](CdbSession.md#m-isdefault-a9229eae64cf) from CdbSession
- [isDefault(String, Object[])](#m-isdefault-8c3502a0ab6d)
- [nextIndex(ConfCdbUpgradePath)](#m-nextindex-63eeb0d708e6)
- [nextIndex(ConfPath)](CdbSession.md#m-nextindex-ceef3a478d50) from CdbSession
- [nextIndex(String, Object[])](#m-nextindex-c2b059f89584)
- [popd()](CdbSession.md#m-popd-b092d2d9048f) from CdbSession
- [pushd(ConfCdbUpgradePath)](#m-pushd-8d23b319b093)
- [pushd(ConfPath)](CdbSession.md#m-pushd-d9d906674b7a) from CdbSession
- [pushd(String, Object[])](#m-pushd-fd6a4c1b1c8d)
- [setCase(String, String, ConfCdbUpgradePath)](#m-setcase-8aa53e83a440)
- [setCase(String, String, ConfPath)](CdbSession.md#m-setcase-3792b2775b7f) from CdbSession
- [setCase(String, String, String, Object[])](#m-setcase-908203af825d)
- [setElem(ConfValue, ConfCdbUpgradePath)](#m-setelem-648e489dcb58)
- [setElem(ConfValue, ConfPath)](CdbSession.md#m-setelem-356e5e479e47) from CdbSession
- [setElem(ConfValue, String, Object[])](#m-setelem-7fc14a355edc)
- [setNamespace(ConfNamespace)](CdbSession.md#m-setnamespace-30316a480cfa) from CdbSession
- [setObject(ConfValue[], ConfCdbUpgradePath)](#m-setobject-1f294157790b)
- [setObject(ConfValue[], ConfPath)](CdbSession.md#m-setobject-741f2a72045e) from CdbSession
- [setObject(ConfValue[], String, Object[])](#m-setobject-5edb7e0ee677)
- [setValues(ConfXMLParam[], ConfCdbUpgradePath)](#m-setvalues-c275631d1d78)
- [setValues(ConfXMLParam[], ConfPath)](CdbSession.md#m-setvalues-0755e36fbd2c) from CdbSession
- [setValues(ConfXMLParam[], String, Object[])](#m-setvalues-824d05856f15)
- [setValues(List<ConfXMLParam>, ConfPath)](CdbSession.md#m-setvalues-970140dc0796) from CdbSession
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-cdbupgradesession-9c7856c35ce4"></a>
### CdbUpgradeSession(Cdb)

```java
public CdbUpgradeSession(
    com.tailf.cdb.Cdb cdb
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Cdb](Cdb.md#cls-Cdb), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.cdb.Cdb cdb`

<a id="m-cdbupgradesession-f35d15a5ad7d"></a>
### CdbUpgradeSession(Cdb, CdbDBType)

```java
public CdbUpgradeSession(
    com.tailf.cdb.Cdb cdb,
    com.tailf.cdb.CdbDBType dbtype
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [Cdb](Cdb.md#cls-Cdb), [CdbDBType](CdbDBType.md#cls-CdbDBType), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.cdb.Cdb cdb`
- `com.tailf.cdb.CdbDBType dbtype`

<a id="m-cdbupgradesession-4758cb046786"></a>
### CdbUpgradeSession(Cdb, CdbDBType, EnumSet<CdbLockType>)

```java
public CdbUpgradeSession(
    com.tailf.cdb.Cdb cdb,
    com.tailf.cdb.CdbDBType dbtype,
    java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [Cdb](Cdb.md#cls-Cdb), [CdbDBType](CdbDBType.md#cls-CdbDBType), [CdbLockType](CdbLockType.md#cls-CdbLockType), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.cdb.Cdb cdb`
- `com.tailf.cdb.CdbDBType dbtype`
- `java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags`


## Methods

<a id="m-cd-76a3a9996341"></a>
### cd(ConfCdbUpgradePath)

```java
public synchronized void cd(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `String fmt`
- `Object[] arguments`

<a id="m-create-cfb8c64701ae"></a>
### create(ConfCdbUpgradePath)

```java
public synchronized void create(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `String fmt`
- `Object[] arguments`

<a id="m-delete-acddec731505"></a>
### delete(ConfCdbUpgradePath)

```java
public synchronized void delete(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `String fmt`
- `Object[] arguments`

<a id="m-exists-34727aeeaf9c"></a>
### exists(ConfCdbUpgradePath)

```java
public synchronized boolean exists(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `String fmt`
- `Object[] arguments`

<a id="m-getcase-b4fb83cb6c0c"></a>
### getCase(String, ConfCdbUpgradePath)

```java
public synchronized com.tailf.conf.ConfObject getCase(
    String choice,
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `String choice`
- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `String choice`
- `String fmt`
- `Object[] arguments`

<a id="m-getelem-aaad89e84412"></a>
### getElem(ConfCdbUpgradePath)

```java
public synchronized com.tailf.conf.ConfValue getElem(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `String fmt`
- `Object[] arguments`

<a id="m-getnumberofinstances-3fd583c7908c"></a>
### getNumberOfInstances(ConfCdbUpgradePath)

```java
public synchronized int getNumberOfInstances(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `String fmt`
- `Object[] arguments`

<a id="m-getobject-d4ec118901b9"></a>
### getObject(int, ConfCdbUpgradePath)

```java
public synchronized com.tailf.conf.ConfObject[] getObject(
    int numOfObjects,
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `int numOfObjects`
- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `int numOfObjects`
- `String fmt`
- `Object[] arguments`

<a id="m-getobjects-4f8eeb1cbe3a"></a>
### getObjects(int, int, int, ConfCdbUpgradePath)

```java
public synchronized java.util.List<com.tailf.conf.ConfObject[]> getObjects(
    int numOfObjects,
    int instance,
    int numOfInstances,
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `int numOfObjects`
- `int instance`
- `int numOfInstances`
- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `int numOfObjects`
- `int instance`
- `int numOfInstances`
- `String fmt`
- `Object[] arguments`

<a id="m-getvalues-fb7bceb4a67a"></a>
### getValues(ConfXMLParam[], ConfCdbUpgradePath)

```java
public synchronized com.tailf.conf.ConfXMLParam[] getValues(
    com.tailf.conf.ConfXMLParam[] params,
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`
- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`
- `String fmt`
- `Object[] arguments`

<a id="m-index-7926a22548c3"></a>
### index(ConfCdbUpgradePath)

```java
public synchronized int index(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `String fmt`
- `Object[] arguments`

<a id="m-isdefault-d225e5140d47"></a>
### isDefault(ConfCdbUpgradePath)

```java
public synchronized boolean isDefault(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `String fmt`
- `Object[] arguments`

<a id="m-nextindex-63eeb0d708e6"></a>
### nextIndex(ConfCdbUpgradePath)

```java
public synchronized int nextIndex(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `String fmt`
- `Object[] arguments`

<a id="m-pushd-8d23b319b093"></a>
### pushd(ConfCdbUpgradePath)

```java
public synchronized void pushd(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `String fmt`
- `Object[] arguments`

<a id="m-setcase-8aa53e83a440"></a>
### setCase(String, String, ConfCdbUpgradePath)

```java
public synchronized void setCase(
    String choice,
    String scase,
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `String choice`
- `String scase`
- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `String choice`
- `String scase`
- `String fmt`
- `Object[] arguments`

<a id="m-setelem-648e489dcb58"></a>
### setElem(ConfValue, ConfCdbUpgradePath)

```java
public synchronized void setElem(
    com.tailf.conf.ConfValue value,
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfValue value`
- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `com.tailf.conf.ConfValue value`
- `String fmt`
- `Object[] arguments`

<a id="m-setobject-1f294157790b"></a>
### setObject(ConfValue[], ConfCdbUpgradePath)

```java
public synchronized void setObject(
    com.tailf.conf.ConfValue[] values,
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfValue[] values`
- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `com.tailf.conf.ConfValue[] values`
- `String fmt`
- `Object[] arguments`

<a id="m-setvalues-c275631d1d78"></a>
### setValues(ConfXMLParam[], ConfCdbUpgradePath)

```java
public synchronized void setValues(
    com.tailf.conf.ConfXMLParam[] params,
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`
- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`
- `String fmt`
- `Object[] arguments`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
