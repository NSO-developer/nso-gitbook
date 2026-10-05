# CdbUpgradeSession <a href="#cls-CdbUpgradeSession" id="cls-CdbUpgradeSession"></a>

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

- [CdbUpgradeSession(Cdb)](#m-CdbUpgradeSession-9c7856c35ce4)
- [CdbUpgradeSession(Cdb, CdbDBType)](#m-CdbUpgradeSession-f35d15a5ad7d)
- [CdbUpgradeSession(Cdb, CdbDBType, EnumSet<CdbLockType>)](#m-CdbUpgradeSession-4758cb046786)

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
- [endSession()](CdbSession.md#m-endSession-1853baeb5d28) from CdbSession
- [exists(ConfCdbUpgradePath)](#m-exists-34727aeeaf9c)
- [exists(ConfPath)](CdbSession.md#m-exists-afa14dd11748) from CdbSession
- [exists(String, Object[])](#m-exists-c95896218534)
- [getCase(String, ConfCdbUpgradePath)](#m-getCase-b4fb83cb6c0c)
- [getCase(String, ConfPath)](CdbSession.md#m-getCase-db036ac6c713) from CdbSession
- [getCase(String, String, Object[])](#m-getCase-9058de2e1364)
- [getCdb()](CdbSession.md#m-getCdb-62d7a3429687) from CdbSession
- [getcwd()](CdbSession.md#m-getcwd-18c6eed4f1fa) from CdbSession
- [getcwdPath()](CdbSession.md#m-getcwdPath-a9fa1536fad1) from CdbSession
- [getDbType()](CdbSession.md#m-getDbType-9503dd2b103d) from CdbSession
- [getElem(ConfCdbUpgradePath)](#m-getElem-aaad89e84412)
- [getElem(ConfPath)](CdbSession.md#m-getElem-f8219fa65c5d) from CdbSession
- [getElem(String, Object[])](#m-getElem-8ec719438ea8)
- [getNumberOfInstances(ConfCdbUpgradePath)](#m-getNumberOfInstances-3fd583c7908c)
- [getNumberOfInstances(ConfPath)](CdbSession.md#m-getNumberOfInstances-41d82cec9221) from CdbSession
- [getNumberOfInstances(String, Object[])](#m-getNumberOfInstances-4ff46f9afb5c)
- [getObject(int, ConfCdbUpgradePath)](#m-getObject-d4ec118901b9)
- [getObject(int, ConfPath)](CdbSession.md#m-getObject-97126abcba49) from CdbSession
- [getObject(int, String, Object[])](#m-getObject-8f535bb4e0e8)
- [getObjects(int, int, int, ConfCdbUpgradePath)](#m-getObjects-4f8eeb1cbe3a)
- [getObjects(int, int, int, ConfPath)](CdbSession.md#m-getObjects-d25a1860a73f) from CdbSession
- [getObjects(int, int, int, String, Object[])](#m-getObjects-9108870a6290)
- [getValues(ConfXMLParam[], ConfCdbUpgradePath)](#m-getValues-fb7bceb4a67a)
- [getValues(ConfXMLParam[], ConfPath)](CdbSession.md#m-getValues-b30d01896278) from CdbSession
- [getValues(ConfXMLParam[], String, Object[])](#m-getValues-f93a502602ef)
- [index(ConfCdbUpgradePath)](#m-index-7926a22548c3)
- [index(ConfPath)](CdbSession.md#m-index-339d675c9a64) from CdbSession
- [index(String, Object[])](#m-index-cae5f09ba6fb)
- [isDefault(ConfCdbUpgradePath)](#m-isDefault-d225e5140d47)
- [isDefault(ConfPath)](CdbSession.md#m-isDefault-a9229eae64cf) from CdbSession
- [isDefault(String, Object[])](#m-isDefault-8c3502a0ab6d)
- [nextIndex(ConfCdbUpgradePath)](#m-nextIndex-63eeb0d708e6)
- [nextIndex(ConfPath)](CdbSession.md#m-nextIndex-ceef3a478d50) from CdbSession
- [nextIndex(String, Object[])](#m-nextIndex-c2b059f89584)
- [popd()](CdbSession.md#m-popd-b092d2d9048f) from CdbSession
- [pushd(ConfCdbUpgradePath)](#m-pushd-8d23b319b093)
- [pushd(ConfPath)](CdbSession.md#m-pushd-d9d906674b7a) from CdbSession
- [pushd(String, Object[])](#m-pushd-fd6a4c1b1c8d)
- [setCase(String, String, ConfCdbUpgradePath)](#m-setCase-8aa53e83a440)
- [setCase(String, String, ConfPath)](CdbSession.md#m-setCase-3792b2775b7f) from CdbSession
- [setCase(String, String, String, Object[])](#m-setCase-908203af825d)
- [setElem(ConfValue, ConfCdbUpgradePath)](#m-setElem-648e489dcb58)
- [setElem(ConfValue, ConfPath)](CdbSession.md#m-setElem-356e5e479e47) from CdbSession
- [setElem(ConfValue, String, Object[])](#m-setElem-7fc14a355edc)
- [setNamespace(ConfNamespace)](CdbSession.md#m-setNamespace-30316a480cfa) from CdbSession
- [setObject(ConfValue[], ConfCdbUpgradePath)](#m-setObject-1f294157790b)
- [setObject(ConfValue[], ConfPath)](CdbSession.md#m-setObject-741f2a72045e) from CdbSession
- [setObject(ConfValue[], String, Object[])](#m-setObject-5edb7e0ee677)
- [setValues(ConfXMLParam[], ConfCdbUpgradePath)](#m-setValues-c275631d1d78)
- [setValues(ConfXMLParam[], ConfPath)](CdbSession.md#m-setValues-0755e36fbd2c) from CdbSession
- [setValues(ConfXMLParam[], String, Object[])](#m-setValues-824d05856f15)
- [setValues(List<ConfXMLParam>, ConfPath)](CdbSession.md#m-setValues-970140dc0796) from CdbSession
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### CdbUpgradeSession(Cdb) <a href="#m-CdbUpgradeSession-9c7856c35ce4" id="m-CdbUpgradeSession-9c7856c35ce4"></a>

```java
public CdbUpgradeSession(
    com.tailf.cdb.Cdb cdb
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Cdb](Cdb.md#cls-Cdb), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.cdb.Cdb cdb`

### CdbUpgradeSession(Cdb, CdbDBType) <a href="#m-CdbUpgradeSession-f35d15a5ad7d" id="m-CdbUpgradeSession-f35d15a5ad7d"></a>

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

### CdbUpgradeSession(Cdb, CdbDBType, EnumSet<CdbLockType>) <a href="#m-CdbUpgradeSession-4758cb046786" id="m-CdbUpgradeSession-4758cb046786"></a>

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

### cd(ConfCdbUpgradePath) <a href="#m-cd-76a3a9996341" id="m-cd-76a3a9996341"></a>

```java
public synchronized void cd(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

### cd(String, Object[]) <a href="#m-cd-751c8b439d16" id="m-cd-751c8b439d16"></a>

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

### create(ConfCdbUpgradePath) <a href="#m-create-cfb8c64701ae" id="m-create-cfb8c64701ae"></a>

```java
public synchronized void create(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

### create(String, Object[]) <a href="#m-create-8d8ef9670e7f" id="m-create-8d8ef9670e7f"></a>

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

### delete(ConfCdbUpgradePath) <a href="#m-delete-acddec731505" id="m-delete-acddec731505"></a>

```java
public synchronized void delete(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

### delete(String, Object[]) <a href="#m-delete-a6dae6a18c6e" id="m-delete-a6dae6a18c6e"></a>

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

### exists(ConfCdbUpgradePath) <a href="#m-exists-34727aeeaf9c" id="m-exists-34727aeeaf9c"></a>

```java
public synchronized boolean exists(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

### exists(String, Object[]) <a href="#m-exists-c95896218534" id="m-exists-c95896218534"></a>

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

### getCase(String, ConfCdbUpgradePath) <a href="#m-getCase-b4fb83cb6c0c" id="m-getCase-b4fb83cb6c0c"></a>

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

### getCase(String, String, Object[]) <a href="#m-getCase-9058de2e1364" id="m-getCase-9058de2e1364"></a>

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

### getElem(ConfCdbUpgradePath) <a href="#m-getElem-aaad89e84412" id="m-getElem-aaad89e84412"></a>

```java
public synchronized com.tailf.conf.ConfValue getElem(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

### getElem(String, Object[]) <a href="#m-getElem-8ec719438ea8" id="m-getElem-8ec719438ea8"></a>

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

### getNumberOfInstances(ConfCdbUpgradePath) <a href="#m-getNumberOfInstances-3fd583c7908c" id="m-getNumberOfInstances-3fd583c7908c"></a>

```java
public synchronized int getNumberOfInstances(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

### getNumberOfInstances(String, Object[]) <a href="#m-getNumberOfInstances-4ff46f9afb5c" id="m-getNumberOfInstances-4ff46f9afb5c"></a>

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

### getObject(int, ConfCdbUpgradePath) <a href="#m-getObject-d4ec118901b9" id="m-getObject-d4ec118901b9"></a>

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

### getObject(int, String, Object[]) <a href="#m-getObject-8f535bb4e0e8" id="m-getObject-8f535bb4e0e8"></a>

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

### getObjects(int, int, int, ConfCdbUpgradePath) <a href="#m-getObjects-4f8eeb1cbe3a" id="m-getObjects-4f8eeb1cbe3a"></a>

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

### getObjects(int, int, int, String, Object[]) <a href="#m-getObjects-9108870a6290" id="m-getObjects-9108870a6290"></a>

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

### getValues(ConfXMLParam[], ConfCdbUpgradePath) <a href="#m-getValues-fb7bceb4a67a" id="m-getValues-fb7bceb4a67a"></a>

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

### getValues(ConfXMLParam[], String, Object[]) <a href="#m-getValues-f93a502602ef" id="m-getValues-f93a502602ef"></a>

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

### index(ConfCdbUpgradePath) <a href="#m-index-7926a22548c3" id="m-index-7926a22548c3"></a>

```java
public synchronized int index(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

### index(String, Object[]) <a href="#m-index-cae5f09ba6fb" id="m-index-cae5f09ba6fb"></a>

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

### isDefault(ConfCdbUpgradePath) <a href="#m-isDefault-d225e5140d47" id="m-isDefault-d225e5140d47"></a>

```java
public synchronized boolean isDefault(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

### isDefault(String, Object[]) <a href="#m-isDefault-8c3502a0ab6d" id="m-isDefault-8c3502a0ab6d"></a>

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

### nextIndex(ConfCdbUpgradePath) <a href="#m-nextIndex-63eeb0d708e6" id="m-nextIndex-63eeb0d708e6"></a>

```java
public synchronized int nextIndex(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

### nextIndex(String, Object[]) <a href="#m-nextIndex-c2b059f89584" id="m-nextIndex-c2b059f89584"></a>

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

### pushd(ConfCdbUpgradePath) <a href="#m-pushd-8d23b319b093" id="m-pushd-8d23b319b093"></a>

```java
public synchronized void pushd(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

### pushd(String, Object[]) <a href="#m-pushd-fd6a4c1b1c8d" id="m-pushd-fd6a4c1b1c8d"></a>

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

### setCase(String, String, ConfCdbUpgradePath) <a href="#m-setCase-8aa53e83a440" id="m-setCase-8aa53e83a440"></a>

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

### setCase(String, String, String, Object[]) <a href="#m-setCase-908203af825d" id="m-setCase-908203af825d"></a>

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

### setElem(ConfValue, ConfCdbUpgradePath) <a href="#m-setElem-648e489dcb58" id="m-setElem-648e489dcb58"></a>

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

### setElem(ConfValue, String, Object[]) <a href="#m-setElem-7fc14a355edc" id="m-setElem-7fc14a355edc"></a>

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

### setObject(ConfValue[], ConfCdbUpgradePath) <a href="#m-setObject-1f294157790b" id="m-setObject-1f294157790b"></a>

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

### setObject(ConfValue[], String, Object[]) <a href="#m-setObject-5edb7e0ee677" id="m-setObject-5edb7e0ee677"></a>

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

### setValues(ConfXMLParam[], ConfCdbUpgradePath) <a href="#m-setValues-c275631d1d78" id="m-setValues-c275631d1d78"></a>

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

### setValues(ConfXMLParam[], String, Object[]) <a href="#m-setValues-824d05856f15" id="m-setValues-824d05856f15"></a>

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

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
