<a id="s-CdbUpgradeSession"></a>
# CdbUpgradeSession

```java
public class com.tailf.cdb.CdbUpgradeSession
    extends com.tailf.cdb.CdbSession
```

Types: [CdbSession](CdbSession.md#s-CdbSession)

The class `CdbUpgradeSession` represents a session against
 the Cdb database that can be used for accessing data models that are
 in the process of being deleted by a cdb upgrade.

 The operations supported by an upgrade session are the same as those
 of a normal session, the only difference being that keypaths on the
 format (fmt, arguments) will be treated as ConfCdbUpgradePaths
 rather than ConfPaths.

 For information on specific methods, refer to the
 [`CdbSession`](CdbSession.md#s-CdbSession) documentation.

## Members

**Constructors**:

- [CdbUpgradeSession(Cdb)](#s-CdbUpgradeSession-1)
- [CdbUpgradeSession(Cdb, CdbDBType)](#s-CdbUpgradeSession-2)
- [CdbUpgradeSession(Cdb, CdbDBType, EnumSet<CdbLockType>)](#s-CdbUpgradeSession-3)

**Fields**:

- [cdb](CdbSession.md#s-cdb) from CdbSession
- [dbType](CdbSession.md#s-dbType) from CdbSession
- [lockflags](CdbSession.md#s-lockflags) from CdbSession

**Methods**:

- [cd(ConfCdbUpgradePath)](#s-cd)
- [cd(ConfPath)](CdbSession.md#s-cd) from CdbSession
- [cd(String, Object[])](#s-cd-1)
- [create(ConfCdbUpgradePath)](#s-create)
- [create(ConfPath)](CdbSession.md#s-create) from CdbSession
- [create(String, Object[])](#s-create-1)
- [delete(ConfCdbUpgradePath)](#s-delete)
- [delete(ConfPath)](CdbSession.md#s-delete) from CdbSession
- [delete(String, Object[])](#s-delete-1)
- [endSession()](CdbSession.md#s-endSession) from CdbSession
- [exists(ConfCdbUpgradePath)](#s-exists)
- [exists(ConfPath)](CdbSession.md#s-exists) from CdbSession
- [exists(String, Object[])](#s-exists-1)
- [getCase(String, ConfCdbUpgradePath)](#s-getCase)
- [getCase(String, ConfPath)](CdbSession.md#s-getCase) from CdbSession
- [getCase(String, String, Object[])](#s-getCase-1)
- [getCdb()](CdbSession.md#s-getCdb) from CdbSession
- [getcwd()](CdbSession.md#s-getcwd) from CdbSession
- [getcwdPath()](CdbSession.md#s-getcwdPath) from CdbSession
- [getDbType()](CdbSession.md#s-getDbType) from CdbSession
- [getElem(ConfCdbUpgradePath)](#s-getElem)
- [getElem(ConfPath)](CdbSession.md#s-getElem) from CdbSession
- [getElem(String, Object[])](#s-getElem-1)
- [getNumberOfInstances(ConfCdbUpgradePath)](#s-getNumberOfInstances)
- [getNumberOfInstances(ConfPath)](CdbSession.md#s-getNumberOfInstances) from CdbSession
- [getNumberOfInstances(String, Object[])](#s-getNumberOfInstances-1)
- [getObject(int, ConfCdbUpgradePath)](#s-getObject)
- [getObject(int, ConfPath)](CdbSession.md#s-getObject) from CdbSession
- [getObject(int, String, Object[])](#s-getObject-1)
- [getObjects(int, int, int, ConfCdbUpgradePath)](#s-getObjects)
- [getObjects(int, int, int, ConfPath)](CdbSession.md#s-getObjects) from CdbSession
- [getObjects(int, int, int, String, Object[])](#s-getObjects-1)
- [getValues(ConfXMLParam[], ConfCdbUpgradePath)](#s-getValues)
- [getValues(ConfXMLParam[], ConfPath)](CdbSession.md#s-getValues) from CdbSession
- [getValues(ConfXMLParam[], String, Object[])](#s-getValues-1)
- [index(ConfCdbUpgradePath)](#s-index)
- [index(ConfPath)](CdbSession.md#s-index) from CdbSession
- [index(String, Object[])](#s-index-1)
- [isDefault(ConfCdbUpgradePath)](#s-isDefault)
- [isDefault(ConfPath)](CdbSession.md#s-isDefault) from CdbSession
- [isDefault(String, Object[])](#s-isDefault-1)
- [nextIndex(ConfCdbUpgradePath)](#s-nextIndex)
- [nextIndex(ConfPath)](CdbSession.md#s-nextIndex) from CdbSession
- [nextIndex(String, Object[])](#s-nextIndex-1)
- [popd()](CdbSession.md#s-popd) from CdbSession
- [pushd(ConfCdbUpgradePath)](#s-pushd)
- [pushd(ConfPath)](CdbSession.md#s-pushd) from CdbSession
- [pushd(String, Object[])](#s-pushd-1)
- [setCase(String, String, ConfCdbUpgradePath)](#s-setCase)
- [setCase(String, String, ConfPath)](CdbSession.md#s-setCase) from CdbSession
- [setCase(String, String, String, Object[])](#s-setCase-1)
- [setElem(ConfValue, ConfCdbUpgradePath)](#s-setElem)
- [setElem(ConfValue, ConfPath)](CdbSession.md#s-setElem) from CdbSession
- [setElem(ConfValue, String, Object[])](#s-setElem-1)
- [setNamespace(ConfNamespace)](CdbSession.md#s-setNamespace) from CdbSession
- [setObject(ConfValue[], ConfCdbUpgradePath)](#s-setObject)
- [setObject(ConfValue[], ConfPath)](CdbSession.md#s-setObject) from CdbSession
- [setObject(ConfValue[], String, Object[])](#s-setObject-1)
- [setValues(ConfXMLParam[], ConfCdbUpgradePath)](#s-setValues)
- [setValues(ConfXMLParam[], ConfPath)](CdbSession.md#s-setValues) from CdbSession
- [setValues(ConfXMLParam[], String, Object[])](#s-setValues-1)
- [setValues(List<ConfXMLParam>, ConfPath)](CdbSession.md#s-setValues-2) from CdbSession
- [toString()](#s-toString)

## Constructors

<a id="s-CdbUpgradeSession-1"></a>
### CdbUpgradeSession(Cdb)

```java
public CdbUpgradeSession(
    com.tailf.cdb.Cdb cdb
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Cdb](Cdb.md#s-Cdb), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.cdb.Cdb cdb`

<a id="s-CdbUpgradeSession-2"></a>
### CdbUpgradeSession(Cdb, CdbDBType)

```java
public CdbUpgradeSession(
    com.tailf.cdb.Cdb cdb,
    com.tailf.cdb.CdbDBType dbtype
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [Cdb](Cdb.md#s-Cdb), [CdbDBType](CdbDBType.md#s-CdbDBType), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.cdb.Cdb cdb`
- `com.tailf.cdb.CdbDBType dbtype`

<a id="s-CdbUpgradeSession-3"></a>
### CdbUpgradeSession(Cdb, CdbDBType, EnumSet<CdbLockType>)

```java
public CdbUpgradeSession(
    com.tailf.cdb.Cdb cdb,
    com.tailf.cdb.CdbDBType dbtype,
    java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [Cdb](Cdb.md#s-Cdb), [CdbDBType](CdbDBType.md#s-CdbDBType), [CdbLockType](CdbLockType.md#s-CdbLockType), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.cdb.Cdb cdb`
- `com.tailf.cdb.CdbDBType dbtype`
- `java.util.EnumSet<com.tailf.cdb.CdbLockType> lockflags`


## Methods

<a id="s-cd"></a>
### cd(ConfCdbUpgradePath)

```java
public synchronized void cd(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#s-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `String fmt`
- `Object[] arguments`

<a id="s-create"></a>
### create(ConfCdbUpgradePath)

```java
public synchronized void create(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#s-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `String fmt`
- `Object[] arguments`

<a id="s-delete"></a>
### delete(ConfCdbUpgradePath)

```java
public synchronized void delete(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#s-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `String fmt`
- `Object[] arguments`

<a id="s-exists"></a>
### exists(ConfCdbUpgradePath)

```java
public synchronized boolean exists(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#s-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `String fmt`
- `Object[] arguments`

<a id="s-getCase"></a>
### getCase(String, ConfCdbUpgradePath)

```java
public synchronized com.tailf.conf.ConfObject getCase(
    String choice,
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#s-ConfObject), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#s-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `String choice`
- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `String choice`
- `String fmt`
- `Object[] arguments`

<a id="s-getElem"></a>
### getElem(ConfCdbUpgradePath)

```java
public synchronized com.tailf.conf.ConfValue getElem(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#s-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `String fmt`
- `Object[] arguments`

<a id="s-getNumberOfInstances"></a>
### getNumberOfInstances(ConfCdbUpgradePath)

```java
public synchronized int getNumberOfInstances(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#s-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `String fmt`
- `Object[] arguments`

<a id="s-getObject"></a>
### getObject(int, ConfCdbUpgradePath)

```java
public synchronized com.tailf.conf.ConfObject[] getObject(
    int numOfObjects,
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#s-ConfObject), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#s-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `int numOfObjects`
- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `int numOfObjects`
- `String fmt`
- `Object[] arguments`

<a id="s-getObjects"></a>
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

Types: [ConfObject](../conf/ConfObject.md#s-ConfObject), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#s-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `int numOfObjects`
- `int instance`
- `int numOfInstances`
- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `int numOfObjects`
- `int instance`
- `int numOfInstances`
- `String fmt`
- `Object[] arguments`

<a id="s-getValues"></a>
### getValues(ConfXMLParam[], ConfCdbUpgradePath)

```java
public synchronized com.tailf.conf.ConfXMLParam[] getValues(
    com.tailf.conf.ConfXMLParam[] params,
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#s-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`
- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`
- `String fmt`
- `Object[] arguments`

<a id="s-index"></a>
### index(ConfCdbUpgradePath)

```java
public synchronized int index(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#s-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `String fmt`
- `Object[] arguments`

<a id="s-isDefault"></a>
### isDefault(ConfCdbUpgradePath)

```java
public synchronized boolean isDefault(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#s-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `String fmt`
- `Object[] arguments`

<a id="s-nextIndex"></a>
### nextIndex(ConfCdbUpgradePath)

```java
public synchronized int nextIndex(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#s-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `String fmt`
- `Object[] arguments`

<a id="s-pushd"></a>
### pushd(ConfCdbUpgradePath)

```java
public synchronized void pushd(
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#s-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `String fmt`
- `Object[] arguments`

<a id="s-setCase"></a>
### setCase(String, String, ConfCdbUpgradePath)

```java
public synchronized void setCase(
    String choice,
    String scase,
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#s-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `String choice`
- `String scase`
- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `String choice`
- `String scase`
- `String fmt`
- `Object[] arguments`

<a id="s-setElem"></a>
### setElem(ConfValue, ConfCdbUpgradePath)

```java
public synchronized void setElem(
    com.tailf.conf.ConfValue value,
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#s-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.ConfValue value`
- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `com.tailf.conf.ConfValue value`
- `String fmt`
- `Object[] arguments`

<a id="s-setObject"></a>
### setObject(ConfValue[], ConfCdbUpgradePath)

```java
public synchronized void setObject(
    com.tailf.conf.ConfValue[] values,
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#s-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.ConfValue[] values`
- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `com.tailf.conf.ConfValue[] values`
- `String fmt`
- `Object[] arguments`

<a id="s-setValues"></a>
### setValues(ConfXMLParam[], ConfCdbUpgradePath)

```java
public synchronized void setValues(
    com.tailf.conf.ConfXMLParam[] params,
    com.tailf.conf.ConfCdbUpgradePath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [ConfCdbUpgradePath](../conf/ConfCdbUpgradePath.md#s-ConfCdbUpgradePath), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`
- `com.tailf.conf.ConfCdbUpgradePath path`

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

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`
- `String fmt`
- `Object[] arguments`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
