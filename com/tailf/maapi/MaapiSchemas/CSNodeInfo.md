# CSNodeInfo <a href="#csnodeinfo-aad17d6161cc" id="csnodeinfo-aad17d6161cc"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.CSNodeInfo
```

Class representing node information for a Schema node

## Members

**Constructors**:

- [CSNodeInfo\(\)](#csnodeinfo-68cf9a9fd5a0)
- [CSNodeInfo\(CSNodeInfo, int\[\], int, int, int, CSType\)](#csnodeinfo-afd67fc5b2ab)
- [CSNodeInfo\(int\[\], int, int, int, CSType, ConfObject, CSChoice, int, HashMap\<String,String\>, MountId, String, String, String\[\]\)](#csnodeinfo-9613813dad32)

**Methods**:

- [getChoices\(\)](#getchoices-818fb3fccb86)
- [getDefval\(\)](#getdefval-561ad5494c47)
- [getDocDescription\(\)](#getdocdescription-08369bbe26a9)
- [getFlags\(\)](#getflags-3c1ca90fd29c)
- [getHideGroups\(\)](#gethidegroups-d566f1e3343e)
- [getKeys\(\)](#getkeys-a24b9d377db7)
- [getMaxOccurs\(\)](#getmaxoccurs-365e8c5a408f)
- [getMetaData\(\)](#getmetadata-15c2d5006ca5)
- [getMinOccurs\(\)](#getminoccurs-cac79959dff8)
- [getMountId\(\)](#getmountid-c5175827f949)
- [getPrompt\(\)](#getprompt-6a58866a8699)
- [getShallowType\(\)](#getshallowtype-2e2b5f294983)
- [getType\(\)](#gettype-5a52f6f0d4c1)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### CSNodeInfo() <a href="#csnodeinfo-68cf9a9fd5a0" id="csnodeinfo-68cf9a9fd5a0"></a>

```java
protected CSNodeInfo()
```

Constructor for CSNodeInfo class

### CSNodeInfo(CSNodeInfo, int[], int, int, int, CSType) <a href="#csnodeinfo-afd67fc5b2ab" id="csnodeinfo-afd67fc5b2ab"></a>

```java
protected CSNodeInfo(
    com.tailf.maapi.MaapiSchemas.CSNodeInfo parent,
    int[] keys,
    int minOccurs,
    int maxOccurs,
    int shallowType,
    com.tailf.maapi.MaapiSchemas.CSType type
)
```

Types: [CSNodeInfo](CSNodeInfo.md#csnodeinfo-aad17d6161cc), [CSType](CSType.md#cstype-8bf086cc0595)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNodeInfo parent`
- `int[] keys`
- `int minOccurs`
- `int maxOccurs`
- `int shallowType`
- `com.tailf.maapi.MaapiSchemas.CSType type`

### CSNodeInfo(int[], int, int, int, CSType, ConfObject, CSChoice, int, HashMap&lt;String,String&gt;, MountId, String, String, String[]) <a href="#csnodeinfo-9613813dad32" id="csnodeinfo-9613813dad32"></a>

```java
public CSNodeInfo(
    int[] keys,
    int minOccurs,
    int maxOccurs,
    int shallowType,
    com.tailf.maapi.MaapiSchemas.CSType type,
    com.tailf.conf.ConfObject defval,
    com.tailf.maapi.MaapiSchemas.CSChoice choice0,
    int flags,
    java.util.HashMap<String,String> metaData,
    com.tailf.maapi.MaapiSchemas.MountId mountId,
    String prompt,
    String docDescription,
    String[] hideGroups
)
```

Types: [CSType](CSType.md#cstype-8bf086cc0595), [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [CSChoice](CSChoice.md#cschoice-7d5d5dd71270), [MountId](MountId.md#mountid-702a10803d00)

**Parameters**

- `int[] keys`
- `int minOccurs`
- `int maxOccurs`
- `int shallowType`
- `com.tailf.maapi.MaapiSchemas.CSType type`
- `com.tailf.conf.ConfObject defval`
- `com.tailf.maapi.MaapiSchemas.CSChoice choice0`
- `int flags`
- `java.util.HashMap<String,String> metaData`
- `com.tailf.maapi.MaapiSchemas.MountId mountId`
- `String prompt`
- `String docDescription`
- `String[] hideGroups`


## Methods

### getChoices() <a href="#getchoices-818fb3fccb86" id="getchoices-818fb3fccb86"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSChoice> getChoices()
```

Types: [CSChoice](CSChoice.md#cschoice-7d5d5dd71270)

get List object of choices for this node. A Choice is represented by
 the CSChoice class, this is a List of CSChoice accordingly

**Returns:** List of Choices

### getDefval() <a href="#getdefval-561ad5494c47" id="getdefval-561ad5494c47"></a>

```java
public com.tailf.conf.ConfObject getDefval()
```

Types: [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2)

get default value represented as a subclass to ConfObject

**Returns:** ConfObject

### getDocDescription() <a href="#getdocdescription-08369bbe26a9" id="getdocdescription-08369bbe26a9"></a>

```java
public String getDocDescription()
```

Get documentation description for this node.
 Returns the tailf:info or Description according to the using of
 --use-description option and --include-doc option when compiling the
 fxs file.

**Returns:** String documentation description or null.

### getFlags() <a href="#getflags-3c1ca90fd29c" id="getflags-3c1ca90fd29c"></a>

```java
public int getFlags()
```

get flags for this node. Currently not used

**Returns:** int flags

### getHideGroups() <a href="#gethidegroups-d566f1e3343e" id="gethidegroups-d566f1e3343e"></a>

```java
public String[] getHideGroups()
```

Get the hide group(s) for this node.
 Returns the tailf:hidden extension value if present. If
 multiple hide groups are defined, the array will contain
 multiple entries. The special value "full" indicates
 the node is completely hidden from all northbound interfaces.

**Returns:** String array of hide group names, or null if not hidden.

### getKeys() <a href="#getkeys-a24b9d377db7" id="getkeys-a24b9d377db7"></a>

```java
public int[] getKeys()
```

get keys for the node. keys are represented as a int array of
 hashvalues. Key names can be retrieved using
 [`MaapiSchemas#hashToStringTab`](../MaapiSchemas.md#hashtostringtab-03883a433398)

**Returns:** int[] array of keys or null if not exists

### getMaxOccurs() <a href="#getmaxoccurs-365e8c5a408f" id="getmaxoccurs-365e8c5a408f"></a>

```java
public int getMaxOccurs()
```

get MaxOccurs for the node

**Returns:** int maxOccurs

### getMetaData() <a href="#getmetadata-15c2d5006ca5" id="getmetadata-15c2d5006ca5"></a>

```java
public java.util.HashMap<String,String> getMetaData()
```

get meta data for this node.
 Value could be either null or String.

**Returns:** HashMapString, String

### getMinOccurs() <a href="#getminoccurs-cac79959dff8" id="getminoccurs-cac79959dff8"></a>

```java
public int getMinOccurs()
```

get MinOccurs for the node

**Returns:** int minOccurs

### getMountId() <a href="#getmountid-c5175827f949" id="getmountid-c5175827f949"></a>

```java
public java.util.List<String> getMountId()
```

### getPrompt() <a href="#getprompt-6a58866a8699" id="getprompt-6a58866a8699"></a>

```java
public String getPrompt()
```

Get prompt for this node.
 Returns the tailf:prompt extension value if present, null otherwise.

**Returns:** String prompt or null

### getShallowType() <a href="#getshallowtype-2e2b5f294983" id="getshallowtype-2e2b5f294983"></a>

```java
public int getShallowType()
```

get shallowtype represented as final static int in [`ConfObject`](../../conf/ConfObject.md#confobject-5433616953b2)

**Returns:** int shallow type

### getType() <a href="#gettype-5a52f6f0d4c1" id="gettype-5a52f6f0d4c1"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSType getType()
```

Types: [CSType](CSType.md#cstype-8bf086cc0595)

get type for the node

**Returns:** CSType type for the node

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Informative string representation of a CSNodeInfo instance

**Returns:** String
