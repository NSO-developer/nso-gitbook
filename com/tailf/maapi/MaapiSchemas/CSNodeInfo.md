<a id="s-CSNodeInfo"></a>
# CSNodeInfo

```java
public static class com.tailf.maapi.MaapiSchemas.CSNodeInfo
```

Class representing node information for a Schema node

## Members

**Constructors**:

- [CSNodeInfo()](#s-CSNodeInfo-1)
- [CSNodeInfo(CSNodeInfo, int[], int, int, int, CSType)](#s-CSNodeInfo-2)
- [CSNodeInfo(int[], int, int, int, CSType, ConfObject, CSChoice, int, HashMap<String,String>, MountId, String, String, String[])](#s-CSNodeInfo-3)

**Methods**:

- [getChoices()](#s-getChoices)
- [getDefval()](#s-getDefval)
- [getDocDescription()](#s-getDocDescription)
- [getFlags()](#s-getFlags)
- [getHideGroups()](#s-getHideGroups)
- [getKeys()](#s-getKeys)
- [getMaxOccurs()](#s-getMaxOccurs)
- [getMetaData()](#s-getMetaData)
- [getMinOccurs()](#s-getMinOccurs)
- [getMountId()](#s-getMountId)
- [getPrompt()](#s-getPrompt)
- [getShallowType()](#s-getShallowType)
- [getType()](#s-getType)
- [toString()](#s-toString)

## Constructors

<a id="s-CSNodeInfo-1"></a>
### CSNodeInfo()

```java
protected CSNodeInfo()
```

Constructor for CSNodeInfo class

<a id="s-CSNodeInfo-2"></a>
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

Types: [CSNodeInfo](CSNodeInfo.md#s-CSNodeInfo), [CSType](CSType.md#s-CSType)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNodeInfo parent`
- `int[] keys`
- `int minOccurs`
- `int maxOccurs`
- `int shallowType`
- `com.tailf.maapi.MaapiSchemas.CSType type`

<a id="s-CSNodeInfo-3"></a>
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

Types: [CSType](CSType.md#s-CSType), [ConfObject](../../conf/ConfObject.md#s-ConfObject), [CSChoice](CSChoice.md#s-CSChoice), [MountId](MountId.md#s-MountId)

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

<a id="s-getChoices"></a>
### getChoices()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSChoice> getChoices()
```

Types: [CSChoice](CSChoice.md#s-CSChoice)

get List object of choices for this node. A Choice is represented by
 the CSChoice class, this is a List of CSChoice accordingly

**Returns:** List of Choices

<a id="s-getDefval"></a>
### getDefval()

```java
public com.tailf.conf.ConfObject getDefval()
```

Types: [ConfObject](../../conf/ConfObject.md#s-ConfObject)

get default value represented as a subclass to ConfObject

**Returns:** ConfObject

<a id="s-getDocDescription"></a>
### getDocDescription()

```java
public String getDocDescription()
```

Get documentation description for this node.
 Returns the tailf:info or Description according to the using of
 --use-description option and --include-doc option when compiling the
 fxs file.

**Returns:** String documentation description or null.

<a id="s-getFlags"></a>
### getFlags()

```java
public int getFlags()
```

get flags for this node. Currently not used

**Returns:** int flags

<a id="s-getHideGroups"></a>
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

<a id="s-getKeys"></a>
### getKeys()

```java
public int[] getKeys()
```

get keys for the node. keys are represented as a int array of
 hashvalues. Key names can be retrieved using
 [`MaapiSchemas`](../MaapiSchemas.md#s-MaapiSchemas)

**Returns:** int[] array of keys or null if not exists

<a id="s-getMaxOccurs"></a>
### getMaxOccurs()

```java
public int getMaxOccurs()
```

get MaxOccurs for the node

**Returns:** int maxOccurs

<a id="s-getMetaData"></a>
### getMetaData()

```java
public java.util.HashMap<String,String> getMetaData()
```

get meta data for this node.
 Value could be either null or String.

**Returns:** HashMapString, String

<a id="s-getMinOccurs"></a>
### getMinOccurs()

```java
public int getMinOccurs()
```

get MinOccurs for the node

**Returns:** int minOccurs

<a id="s-getMountId"></a>
### getMountId()

```java
public java.util.List<String> getMountId()
```

<a id="s-getPrompt"></a>
### getPrompt()

```java
public String getPrompt()
```

Get prompt for this node.
 Returns the tailf:prompt extension value if present, null otherwise.

**Returns:** String prompt or null

<a id="s-getShallowType"></a>
### getShallowType()

```java
public int getShallowType()
```

get shallowtype represented as final static int in [`ConfObject`](../../conf/ConfObject.md#s-ConfObject)

**Returns:** int shallow type

<a id="s-getType"></a>
### getType()

```java
public com.tailf.maapi.MaapiSchemas.CSType getType()
```

Types: [CSType](CSType.md#s-CSType)

get type for the node

**Returns:** CSType type for the node

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Informative string representation of a CSNodeInfo instance

**Returns:** String
