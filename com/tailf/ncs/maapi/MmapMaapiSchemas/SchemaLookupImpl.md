# SchemaLookupImpl <a href="#cls-SchemaLookupImpl" id="cls-SchemaLookupImpl"></a>

```java
public class com.tailf.ncs.maapi.MmapMaapiSchemas.SchemaLookupImpl
    implements com.tailf.ncs.maapi.MmapMaapiSchemas.SchemaLookup
```

Types: [SchemaLookup](SchemaLookup.md#cls-SchemaLookup)

## Members

**Constructors**:

- [SchemaLookupImpl(Map<Integer,CSSchema>, Map<Integer,String>)](#m-SchemaLookupImpl-f665290474b5)

**Fields**:

- [hashToStringTab](#m-hashToStringTab)
- [schemas](#m-schemas)

**Methods**:

- [addMountPointChildren(int, String, List<CSNode>)](#m-addMountPointChildren-fd0424d46be4)
- [cachedFallbackChildren(int, List<String>, Supplier<List<CSNode>>)](#m-cachedFallbackChildren-86535d1081d1)
- [hashToString(int)](#m-hashToString-54eaaef71976)
- [lookupMountId(int, int)](#m-lookupMountId-648b4c864458)
- [lookupSchema(int)](#m-lookupSchema-dfd8e305c928)
- [lookupType(String, int)](#m-lookupType-542dca0e8ea5)

## Constructors

### SchemaLookupImpl(Map<Integer,CSSchema>, Map<Integer,String>) <a href="#m-SchemaLookupImpl-f665290474b5" id="m-SchemaLookupImpl-f665290474b5"></a>

```java
public SchemaLookupImpl(
    java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemas,
    java.util.Map<Integer,String> hashToStringTab
)
```

Types: [CSSchema](../../../maapi/MaapiSchemas/CSSchema.md#cls-CSSchema)

**Parameters**

- `java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemas`
- `java.util.Map<Integer,String> hashToStringTab`


## Fields

### hashToStringTab <a href="#m-hashToStringTab" id="m-hashToStringTab"></a>

**Package-private**

```java
java.util.Map<Integer,String> hashToStringTab = null;
```

### schemas <a href="#m-schemas" id="m-schemas"></a>

**Package-private**

```java
java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemas = null;
```

Types: [CSSchema](../../../maapi/MaapiSchemas/CSSchema.md#cls-CSSchema)


## Methods

### addMountPointChildren(int, String, List<CSNode>) <a href="#m-addMountPointChildren-fd0424d46be4" id="m-addMountPointChildren-fd0424d46be4"></a>

```java
public boolean addMountPointChildren(
    int pathHash,
    String mountId,
    java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> children
)
```

Types: [CSNode](../../../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `int pathHash`
- `String mountId`
- `java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> children`

### cachedFallbackChildren(int, List<String>, Supplier<List<CSNode>>) <a href="#m-cachedFallbackChildren-86535d1081d1" id="m-cachedFallbackChildren-86535d1081d1"></a>

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> cachedFallbackChildren(
    int pathHash,
    java.util.List<String> mountIds,
    java.util.function.Supplier<java.util.List<com.tailf.maapi.MaapiSchemas.CSNode>> compute
)
```

Types: [CSNode](../../../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `int pathHash`
- `java.util.List<String> mountIds`
- `java.util.function.Supplier<java.util.List<com.tailf.maapi.MaapiSchemas.CSNode>> compute`

### hashToString(int) <a href="#m-hashToString-54eaaef71976" id="m-hashToString-54eaaef71976"></a>

```java
public String hashToString(int hash)
```

**Parameters**

- `int hash`

### lookupMountId(int, int) <a href="#m-lookupMountId-648b4c864458" id="m-lookupMountId-648b4c864458"></a>

```java
public com.tailf.maapi.MaapiSchemas.MountId lookupMountId(int nsHash, int tagHash)
```

Types: [MountId](../../../maapi/MaapiSchemas/MountId.md#cls-MountId)

**Parameters**

- `int nsHash`
- `int tagHash`

### lookupSchema(int) <a href="#m-lookupSchema-dfd8e305c928" id="m-lookupSchema-dfd8e305c928"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSSchema lookupSchema(int nsHash)
```

Types: [CSSchema](../../../maapi/MaapiSchemas/CSSchema.md#cls-CSSchema)

**Parameters**

- `int nsHash`

### lookupType(String, int) <a href="#m-lookupType-542dca0e8ea5" id="m-lookupType-542dca0e8ea5"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSType lookupType(String name, int nsHash)
```

Types: [CSType](../../../maapi/MaapiSchemas/CSType.md#cls-CSType)

**Parameters**

- `String name`
- `int nsHash`
