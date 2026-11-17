# ConfCdbUpgradePath <a href="#confcdbupgradepath-fe0db0ca5cb5" id="confcdbupgradepath-fe0db0ca5cb5"></a>

```java
public class com.tailf.conf.ConfCdbUpgradePath
    extends com.tailf.conf.ConfPath
```

Types: [ConfPath](ConfPath.md#confpath-327831c6fc7d)

Class Representing a KeyPath path.

This is a simplified variant of [`ConfPath`](ConfPath.md#confpath-327831c6fc7d) for use with
 [`CdbUpgradeSession`](../cdb/CdbUpgradeSession.md#cdbupgradesession-a832ac9abf0d).
 During a cdb upgrade, it may be necessary to migrate data from nodes that
 are about to be deleted. As these nodes are not present in the maapi
 schema, they cannot safely be represented by standard ConfPath objects.

 Instead use ConfCdbUpgradePath which relies only on ConfNamespace instances
 and thus allows deleted paths to be referenced as long as the namespace has
 been reinstalled.

## Members

**Constructors**:

- [ConfCdbUpgradePath\(List\<PathElement\>\)](#confcdbupgradepath-f58f3d6a1fe9)
- [ConfCdbUpgradePath\(String, Object\.\.\.\)](#confcdbupgradepath-47756f2aaa95)

**Methods**:

- [append\(String\)](#append-0469d86239bd)
- [append\(String, List\<CSNode\>\)](ConfPath.md#append-bad0f1c29427) from ConfPath
- [clone\(\)](#clone-164c86c45e9b)
- [copyAppend\(String\)](#copyappend-d79220720bf1)
- [copyPop\(\)](#copypop-fcaa7a3deb75)
- [encode\(\)](InstancePath.md#encode-fbae522bba37) from InstancePath
- [encodeIKP\(\)](InstancePath.md#encodeikp-b160b87f6433) from InstancePath
- [equals\(Object\)](InstancePath.md#equals-fcd6492e0d6c) from InstancePath
- [getCSNode\(\)](InstancePath.md#getcsnode-cf7a085aa7f5) from InstancePath
- [getKP\(\)](InstancePath.md#getkp-45b2f95adae4) from InstancePath
- [getKP\(List\<PathElement\>, boolean, boolean, MountIdInterface\)](InstancePath.md#getkp-a23f67046fb4) from InstancePath
- [getLatestMountId\(\)](InstancePath.md#getlatestmountid-30c9c1f692c7) from InstancePath
- [getMountIdGetter\(\)](InstancePath.md#getmountidgetter-64fcfdb6be8c) from InstancePath
- [hashCode\(\)](InstancePath.md#hashcode-ef797a217903) from InstancePath
- [isKey\(\)](InstancePath.md#iskey-7bdf17ac8255) from InstancePath
- [isParsingDeferred\(\)](InstancePath.md#isparsingdeferred-b3b266536326) from InstancePath
- [isRel\(\)](InstancePath.md#isrel-dca98ac4de7a) from InstancePath
- [pop\(\)](ConfPath.md#pop-1c15fa891a07) from ConfPath
- [setMountIdGetter\(MountIdInterface\)](InstancePath.md#setmountidgetter-900228f8453c) from InstancePath
- [toString\(\)](ConfPath.md#tostring-e9d48c5503ef) from ConfPath
- [toXPathString\(\)](#toxpathstring-81906e391643)

## Constructors

### ConfCdbUpgradePath(List&lt;PathElement&gt;) <a href="#confcdbupgradepath-f58f3d6a1fe9" id="confcdbupgradepath-f58f3d6a1fe9"></a>

```java
public ConfCdbUpgradePath(java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl)
```

**Parameters**

- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl`

### ConfCdbUpgradePath(String, Object...) <a href="#confcdbupgradepath-47756f2aaa95" id="confcdbupgradepath-47756f2aaa95"></a>

```java
public ConfCdbUpgradePath(String fmt, Object... arguments) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String fmt`
- `Object... arguments`


## Methods

### append(String) <a href="#append-0469d86239bd" id="append-0469d86239bd"></a>

```java
public com.tailf.conf.ConfCdbUpgradePath append(String s) throws com.tailf.conf.ConfException
```

Types: [ConfCdbUpgradePath](ConfCdbUpgradePath.md#confcdbupgradepath-fe0db0ca5cb5), [ConfException](ConfException.md#confexception-baeaab99f7f9)

Appends suffix path to existing keypath

**Parameters**

- `String s` - path to append

### clone() <a href="#clone-164c86c45e9b" id="clone-164c86c45e9b"></a>

```java
public Object clone()
```

Clones the ConfCdbUpgradePath

### copyAppend(String) <a href="#copyappend-d79220720bf1" id="copyappend-d79220720bf1"></a>

```java
public com.tailf.conf.ConfCdbUpgradePath copyAppend(String s) throws com.tailf.conf.ConfException
```

Types: [ConfCdbUpgradePath](ConfCdbUpgradePath.md#confcdbupgradepath-fe0db0ca5cb5), [ConfException](ConfException.md#confexception-baeaab99f7f9)

CopyAppends to the keypath

**Parameters**

- `String s`

### copyPop() <a href="#copypop-fcaa7a3deb75" id="copypop-fcaa7a3deb75"></a>

```java
public com.tailf.conf.ConfCdbUpgradePath copyPop() throws com.tailf.conf.ConfException
```

Types: [ConfCdbUpgradePath](ConfCdbUpgradePath.md#confcdbupgradepath-fe0db0ca5cb5), [ConfException](ConfException.md#confexception-baeaab99f7f9)

Creates a new ConfCdbUpgradePath with the current path minus the last
 element including list keys.

### toXPathString() <a href="#toxpathstring-81906e391643" id="toxpathstring-81906e391643"></a>

```java
public String toXPathString()
```

A ConfCdbUpgradePath cannot be converted to an xpath string as this
 requires access to the schema. This method will always throw an
 exception.

**Returns:** XPath string representation
