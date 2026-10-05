<a id="cls-SchemaLookupImpl"></a>
# SchemaLookupImpl

```java
public class com.tailf.ncs.maapi.MmapMaapiSchemas.SchemaLookupImpl
    implements com.tailf.ncs.maapi.MmapMaapiSchemas.SchemaLookup
```

Types: [SchemaLookup](SchemaLookup.md#cls-SchemaLookup)

## Members

**Constructors**:

- [SchemaLookupImpl(Map<Integer,CSSchema>, Map<Integer,String>)](#m-schemalookupimpl-f665290474b5)

**Fields**:

- [hashToStringTab](#m-hashToStringTab)
- [schemas](#m-schemas)

**Methods**:

- [addMountPointChildren(int, String, List<CSNode>)](#m-addmountpointchildren-fd0424d46be4)
- [cachedFallbackChildren(int, List<String>, Supplier<List<CSNode>>)](#m-cachedfallbackchildren-86535d1081d1)
- [hashToString(int)](#m-hashtostring-54eaaef71976)
- [lookupMountId(int, int)](#m-lookupmountid-648b4c864458)
- [lookupSchema(int)](#m-lookupschema-dfd8e305c928)
- [lookupType(String, int)](#m-lookuptype-542dca0e8ea5)

## Constructors

<a id="m-schemalookupimpl-f665290474b5"></a>
### SchemaLookupImpl(Map<Integer,CSSchema>, Map<Integer,String>)

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

<a id="m-hashToStringTab"></a>
### hashToStringTab

**Package-private**

```java
java.util.Map<Integer,String> hashToStringTab = null;
```

<a id="m-schemas"></a>
### schemas

**Package-private**

```java
java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemas = null;
```

Types: [CSSchema](../../../maapi/MaapiSchemas/CSSchema.md#cls-CSSchema)


## Methods

<a id="m-addmountpointchildren-fd0424d46be4"></a>
### addMountPointChildren(int, String, List<CSNode>)

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

<a id="m-cachedfallbackchildren-86535d1081d1"></a>
### cachedFallbackChildren(int, List<String>, Supplier<List<CSNode>>)

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

<a id="m-hashtostring-54eaaef71976"></a>
### hashToString(int)

```java
public String hashToString(int hash)
```

**Parameters**

- `int hash`

<a id="m-lookupmountid-648b4c864458"></a>
### lookupMountId(int, int)

```java
public com.tailf.maapi.MaapiSchemas.MountId lookupMountId(int nsHash, int tagHash)
```

Types: [MountId](../../../maapi/MaapiSchemas/MountId.md#cls-MountId)

**Parameters**

- `int nsHash`
- `int tagHash`

<a id="m-lookupschema-dfd8e305c928"></a>
### lookupSchema(int)

```java
public com.tailf.maapi.MaapiSchemas.CSSchema lookupSchema(int nsHash)
```

Types: [CSSchema](../../../maapi/MaapiSchemas/CSSchema.md#cls-CSSchema)

**Parameters**

- `int nsHash`

<a id="m-lookuptype-542dca0e8ea5"></a>
### lookupType(String, int)

```java
public com.tailf.maapi.MaapiSchemas.CSType lookupType(String name, int nsHash)
```

Types: [CSType](../../../maapi/MaapiSchemas/CSType.md#cls-CSType)

**Parameters**

- `String name`
- `int nsHash`
