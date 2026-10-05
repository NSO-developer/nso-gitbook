<a id="cls-CSNodeInfo"></a>
# CSNodeInfo

```java
public static class com.tailf.maapi.MaapiSchemas.CSNodeInfo
```

Class representing node information for a Schema node

## Members

**Constructors**:

- [CSNodeInfo()](#m-csnodeinfo-68cf9a9fd5a0)
- [CSNodeInfo(CSNodeInfo, int[], int, int, int, CSType)](#m-csnodeinfo-afd67fc5b2ab)
- [CSNodeInfo(int[], int, int, int, CSType, ConfObject, CSChoice, int, HashMap<String,String>, MountId, String, String, String[])](#m-csnodeinfo-9613813dad32)

**Methods**:

- [getChoices()](#m-getchoices-818fb3fccb86)
- [getDefval()](#m-getdefval-561ad5494c47)
- [getDocDescription()](#m-getdocdescription-08369bbe26a9)
- [getFlags()](#m-getflags-3c1ca90fd29c)
- [getHideGroups()](#m-gethidegroups-d566f1e3343e)
- [getKeys()](#m-getkeys-a24b9d377db7)
- [getMaxOccurs()](#m-getmaxoccurs-365e8c5a408f)
- [getMetaData()](#m-getmetadata-15c2d5006ca5)
- [getMinOccurs()](#m-getminoccurs-cac79959dff8)
- [getMountId()](#m-getmountid-c5175827f949)
- [getPrompt()](#m-getprompt-6a58866a8699)
- [getShallowType()](#m-getshallowtype-2e2b5f294983)
- [getType()](#m-gettype-5a52f6f0d4c1)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-csnodeinfo-68cf9a9fd5a0"></a>
### CSNodeInfo()

```java
protected CSNodeInfo()
```

Constructor for CSNodeInfo class

<a id="m-csnodeinfo-afd67fc5b2ab"></a>
### CSNodeInfo(CSNodeInfo, int[], int, int, int, CSType)

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

<a id="m-csnodeinfo-9613813dad32"></a>
### CSNodeInfo(int[], int, int, int, CSType, ConfObject, CSChoice, int, HashMap<String,String>, MountId, String, String, String[])

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

<a id="m-getchoices-818fb3fccb86"></a>
### getChoices()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSChoice> getChoices()
```

Types: [CSChoice](CSChoice.md#cls-CSChoice)

get List object of choices for this node. A Choice is represented by
 the CSChoice class, this is a List of CSChoice accordingly

**Returns:** List of Choices

<a id="m-getdefval-561ad5494c47"></a>
### getDefval()

```java
public com.tailf.conf.ConfObject getDefval()
```

Types: [ConfObject](../../conf/ConfObject.md#cls-ConfObject)

get default value represented as a subclass to ConfObject

**Returns:** ConfObject

<a id="m-getdocdescription-08369bbe26a9"></a>
### getDocDescription()

```java
public String getDocDescription()
```

Get documentation description for this node.
 Returns the tailf:info or Description according to the using of
 --use-description option and --include-doc option when compiling the
 fxs file.

**Returns:** String documentation description or null.

<a id="m-getflags-3c1ca90fd29c"></a>
### getFlags()

```java
public int getFlags()
```

get flags for this node. Currently not used

**Returns:** int flags

<a id="m-gethidegroups-d566f1e3343e"></a>
### getHideGroups()

```java
public String[] getHideGroups()
```

Get the hide group(s) for this node.
 Returns the tailf:hidden extension value if present. If
 multiple hide groups are defined, the array will contain
 multiple entries. The special value "full" indicates
 the node is completely hidden from all northbound interfaces.

**Returns:** String array of hide group names, or null if not hidden.

<a id="m-getkeys-a24b9d377db7"></a>
### getKeys()

```java
public int[] getKeys()
```

get keys for the node. keys are represented as a int array of
 hashvalues. Key names can be retrieved using
 [`MaapiSchemas#hashToStringTab`](../MaapiSchemas.md#m-hashToStringTab)

**Returns:** int[] array of keys or null if not exists

<a id="m-getmaxoccurs-365e8c5a408f"></a>
### getMaxOccurs()

```java
public int getMaxOccurs()
```

get MaxOccurs for the node

**Returns:** int maxOccurs

<a id="m-getmetadata-15c2d5006ca5"></a>
### getMetaData()

```java
public java.util.HashMap<String,String> getMetaData()
```

get meta data for this node.
 Value could be either null or String.

**Returns:** HashMapString, String

<a id="m-getminoccurs-cac79959dff8"></a>
### getMinOccurs()

```java
public int getMinOccurs()
```

get MinOccurs for the node

**Returns:** int minOccurs

<a id="m-getmountid-c5175827f949"></a>
### getMountId()

```java
public java.util.List<String> getMountId()
```

<a id="m-getprompt-6a58866a8699"></a>
### getPrompt()

```java
public String getPrompt()
```

Get prompt for this node.
 Returns the tailf:prompt extension value if present, null otherwise.

**Returns:** String prompt or null

<a id="m-getshallowtype-2e2b5f294983"></a>
### getShallowType()

```java
public int getShallowType()
```

get shallowtype represented as final static int in [`ConfObject`](../../conf/ConfObject.md#cls-ConfObject)

**Returns:** int shallow type

<a id="m-gettype-5a52f6f0d4c1"></a>
### getType()

```java
public com.tailf.maapi.MaapiSchemas.CSType getType()
```

Types: [CSType](CSType.md#cls-CSType)

get type for the node

**Returns:** CSType type for the node

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Informative string representation of a CSNodeInfo instance

**Returns:** String
