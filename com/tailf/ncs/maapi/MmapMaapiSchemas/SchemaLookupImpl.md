<a id="s-SchemaLookupImpl"></a>
# SchemaLookupImpl

```java
public class com.tailf.ncs.maapi.MmapMaapiSchemas.SchemaLookupImpl
    implements com.tailf.ncs.maapi.MmapMaapiSchemas.SchemaLookup
```

Types: [SchemaLookup](SchemaLookup.md#s-SchemaLookup)

## Members

**Constructors**:

- [SchemaLookupImpl(Map<Integer,CSSchema>, Map<Integer,String>)](#s-SchemaLookupImpl-1)

**Fields**:

- [hashToStringTab](#s-hashToStringTab)
- [schemas](#s-schemas)

**Methods**:

- [addMountPointChildren(int, String, List<CSNode>)](#s-addMountPointChildren)
- [cachedFallbackChildren(int, List<String>, Supplier<List<CSNode>>)](#s-cachedFallbackChildren)
- [hashToString(int)](#s-hashToString)
- [lookupMountId(int, int)](#s-lookupMountId)
- [lookupSchema(int)](#s-lookupSchema)
- [lookupType(String, int)](#s-lookupType)

## Constructors

<a id="s-SchemaLookupImpl-1"></a>
### SchemaLookupImpl(Map<Integer,CSSchema>, Map<Integer,String>)

```java
public SchemaLookupImpl(
    java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemas,
    java.util.Map<Integer,String> hashToStringTab
)
```

Types: [CSSchema](../../../maapi/MaapiSchemas/CSSchema.md#s-CSSchema)

**Parameters**

- `java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemas`
- `java.util.Map<Integer,String> hashToStringTab`


## Fields

<a id="s-hashToStringTab"></a>
### hashToStringTab

**Package-private**

```java
java.util.Map<Integer,String> hashToStringTab = null;
```

<a id="s-schemas"></a>
### schemas

**Package-private**

```java
java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemas = null;
```

Types: [CSSchema](../../../maapi/MaapiSchemas/CSSchema.md#s-CSSchema)


## Methods

<a id="s-addMountPointChildren"></a>
### addMountPointChildren(int, String, List<CSNode>)

```java
public boolean addMountPointChildren(
    int pathHash,
    String mountId,
    java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> children
)
```

Types: [CSNode](../../../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `int pathHash`
- `String mountId`
- `java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> children`

<a id="s-cachedFallbackChildren"></a>
### cachedFallbackChildren(int, List<String>, Supplier<List<CSNode>>)

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> cachedFallbackChildren(
    int pathHash,
    java.util.List<String> mountIds,
    java.util.function.Supplier<java.util.List<com.tailf.maapi.MaapiSchemas.CSNode>> compute
)
```

Types: [CSNode](../../../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `int pathHash`
- `java.util.List<String> mountIds`
- `java.util.function.Supplier<java.util.List<com.tailf.maapi.MaapiSchemas.CSNode>> compute`

<a id="s-hashToString"></a>
### hashToString(int)

```java
public String hashToString(int hash)
```

**Parameters**

- `int hash`

<a id="s-lookupMountId"></a>
### lookupMountId(int, int)

```java
public com.tailf.maapi.MaapiSchemas.MountId lookupMountId(int nsHash, int tagHash)
```

Types: [MountId](../../../maapi/MaapiSchemas/MountId.md#s-MountId)

**Parameters**

- `int nsHash`
- `int tagHash`

<a id="s-lookupSchema"></a>
### lookupSchema(int)

```java
public com.tailf.maapi.MaapiSchemas.CSSchema lookupSchema(int nsHash)
```

Types: [CSSchema](../../../maapi/MaapiSchemas/CSSchema.md#s-CSSchema)

**Parameters**

- `int nsHash`

<a id="s-lookupType"></a>
### lookupType(String, int)

```java
public com.tailf.maapi.MaapiSchemas.CSType lookupType(String name, int nsHash)
```

Types: [CSType](../../../maapi/MaapiSchemas/CSType.md#s-CSType)

**Parameters**

- `String name`
- `int nsHash`
