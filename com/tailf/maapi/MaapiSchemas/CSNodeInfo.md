# CSNodeInfo <a href="#cls-CSNodeInfo" id="cls-CSNodeInfo"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.CSNodeInfo
```

Class representing node information for a Schema node

## Members

**Constructors**:

- [CSNodeInfo()](#m-CSNodeInfo-68cf9a9fd5a0)
- [CSNodeInfo(CSNodeInfo, int[], int, int, int, CSType)](#m-CSNodeInfo-afd67fc5b2ab)
- [CSNodeInfo(int[], int, int, int, CSType, ConfObject, CSChoice, int, HashMap<String,String>, MountId, String, String, String[])](#m-CSNodeInfo-9613813dad32)

**Methods**:

- [getChoices()](#m-getChoices-818fb3fccb86)
- [getDefval()](#m-getDefval-561ad5494c47)
- [getDocDescription()](#m-getDocDescription-08369bbe26a9)
- [getFlags()](#m-getFlags-3c1ca90fd29c)
- [getHideGroups()](#m-getHideGroups-d566f1e3343e)
- [getKeys()](#m-getKeys-a24b9d377db7)
- [getMaxOccurs()](#m-getMaxOccurs-365e8c5a408f)
- [getMetaData()](#m-getMetaData-15c2d5006ca5)
- [getMinOccurs()](#m-getMinOccurs-cac79959dff8)
- [getMountId()](#m-getMountId-c5175827f949)
- [getPrompt()](#m-getPrompt-6a58866a8699)
- [getShallowType()](#m-getShallowType-2e2b5f294983)
- [getType()](#m-getType-5a52f6f0d4c1)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### CSNodeInfo() <a href="#m-CSNodeInfo-68cf9a9fd5a0" id="m-CSNodeInfo-68cf9a9fd5a0"></a>

```java
protected CSNodeInfo()
```

Constructor for CSNodeInfo class

### CSNodeInfo(CSNodeInfo, int[], int, int, int, CSType) <a href="#m-CSNodeInfo-afd67fc5b2ab" id="m-CSNodeInfo-afd67fc5b2ab"></a>

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

Types: [CSNodeInfo](CSNodeInfo.md#cls-CSNodeInfo), [CSType](CSType.md#cls-CSType)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNodeInfo parent`
- `int[] keys`
- `int minOccurs`
- `int maxOccurs`
- `int shallowType`
- `com.tailf.maapi.MaapiSchemas.CSType type`

### CSNodeInfo(int[], int, int, int, CSType, ConfObject, CSChoice, int, HashMap<String,String>, MountId, String, String, String[]) <a href="#m-CSNodeInfo-9613813dad32" id="m-CSNodeInfo-9613813dad32"></a>

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

Types: [CSType](CSType.md#cls-CSType), [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [CSChoice](CSChoice.md#cls-CSChoice), [MountId](MountId.md#cls-MountId)

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

### getChoices() <a href="#m-getChoices-818fb3fccb86" id="m-getChoices-818fb3fccb86"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSChoice> getChoices()
```

Types: [CSChoice](CSChoice.md#cls-CSChoice)

get List object of choices for this node. A Choice is represented by
 the CSChoice class, this is a List of CSChoice accordingly

**Returns:** List of Choices

### getDefval() <a href="#m-getDefval-561ad5494c47" id="m-getDefval-561ad5494c47"></a>

```java
public com.tailf.conf.ConfObject getDefval()
```

Types: [ConfObject](../../conf/ConfObject.md#cls-ConfObject)

get default value represented as a subclass to ConfObject

**Returns:** ConfObject

### getDocDescription() <a href="#m-getDocDescription-08369bbe26a9" id="m-getDocDescription-08369bbe26a9"></a>

```java
public String getDocDescription()
```

Get documentation description for this node.
 Returns the tailf:info or Description according to the using of
 --use-description option and --include-doc option when compiling the
 fxs file.

**Returns:** String documentation description or null.

### getFlags() <a href="#m-getFlags-3c1ca90fd29c" id="m-getFlags-3c1ca90fd29c"></a>

```java
public int getFlags()
```

get flags for this node. Currently not used

**Returns:** int flags

### getHideGroups() <a href="#m-getHideGroups-d566f1e3343e" id="m-getHideGroups-d566f1e3343e"></a>

```java
public String[] getHideGroups()
```

Get the hide group(s) for this node.
 Returns the tailf:hidden extension value if present. If
 multiple hide groups are defined, the array will contain
 multiple entries. The special value "full" indicates
 the node is completely hidden from all northbound interfaces.

**Returns:** String array of hide group names, or null if not hidden.

### getKeys() <a href="#m-getKeys-a24b9d377db7" id="m-getKeys-a24b9d377db7"></a>

```java
public int[] getKeys()
```

get keys for the node. keys are represented as a int array of
 hashvalues. Key names can be retrieved using
 [`MaapiSchemas#hashToStringTab`](../MaapiSchemas.md#m-hashToStringTab)

**Returns:** int[] array of keys or null if not exists

### getMaxOccurs() <a href="#m-getMaxOccurs-365e8c5a408f" id="m-getMaxOccurs-365e8c5a408f"></a>

```java
public int getMaxOccurs()
```

get MaxOccurs for the node

**Returns:** int maxOccurs

### getMetaData() <a href="#m-getMetaData-15c2d5006ca5" id="m-getMetaData-15c2d5006ca5"></a>

```java
public java.util.HashMap<String,String> getMetaData()
```

get meta data for this node.
 Value could be either null or String.

**Returns:** HashMapString, String

### getMinOccurs() <a href="#m-getMinOccurs-cac79959dff8" id="m-getMinOccurs-cac79959dff8"></a>

```java
public int getMinOccurs()
```

get MinOccurs for the node

**Returns:** int minOccurs

### getMountId() <a href="#m-getMountId-c5175827f949" id="m-getMountId-c5175827f949"></a>

```java
public java.util.List<String> getMountId()
```

### getPrompt() <a href="#m-getPrompt-6a58866a8699" id="m-getPrompt-6a58866a8699"></a>

```java
public String getPrompt()
```

Get prompt for this node.
 Returns the tailf:prompt extension value if present, null otherwise.

**Returns:** String prompt or null

### getShallowType() <a href="#m-getShallowType-2e2b5f294983" id="m-getShallowType-2e2b5f294983"></a>

```java
public int getShallowType()
```

get shallowtype represented as final static int in [`ConfObject`](../../conf/ConfObject.md#cls-ConfObject)

**Returns:** int shallow type

### getType() <a href="#m-getType-5a52f6f0d4c1" id="m-getType-5a52f6f0d4c1"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSType getType()
```

Types: [CSType](CSType.md#cls-CSType)

get type for the node

**Returns:** CSType type for the node

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Informative string representation of a CSNodeInfo instance

**Returns:** String
