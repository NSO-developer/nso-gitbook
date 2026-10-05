<a id="cls-SchemaLookup"></a>
# SchemaLookup

```java
public static interface com.tailf.ncs.maapi.MmapMaapiSchemas.SchemaLookup
```

## Members

**Methods**:

- [addMountPointChildren(int, String, List<CSNode>)](#m-addmountpointchildren-fd0424d46be4)
- [cachedFallbackChildren(int, List<String>, Supplier<List<CSNode>>)](#m-cachedfallbackchildren-86535d1081d1)
- [hashToString(int)](#m-hashtostring-54eaaef71976)
- [lookupMountId(int, int)](#m-lookupmountid-648b4c864458)
- [lookupSchema(int)](#m-lookupschema-dfd8e305c928)
- [lookupType(String, int)](#m-lookuptype-542dca0e8ea5)

## Methods

<a id="m-addmountpointchildren-fd0424d46be4"></a>
### addMountPointChildren(int, String, List<CSNode>)

```java
public abstract boolean addMountPointChildren(
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
public abstract java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> cachedFallbackChildren(
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
public abstract String hashToString(int hash)
```

**Parameters**

- `int hash`

<a id="m-lookupmountid-648b4c864458"></a>
### lookupMountId(int, int)

```java
public abstract com.tailf.maapi.MaapiSchemas.MountId lookupMountId(int nsHash, int tagHash)
```

Types: [MountId](../../../maapi/MaapiSchemas/MountId.md#cls-MountId)

**Parameters**

- `int nsHash`
- `int tagHash`

<a id="m-lookupschema-dfd8e305c928"></a>
### lookupSchema(int)

```java
public abstract com.tailf.maapi.MaapiSchemas.CSSchema lookupSchema(int nsHash)
```

Types: [CSSchema](../../../maapi/MaapiSchemas/CSSchema.md#cls-CSSchema)

**Parameters**

- `int nsHash`

<a id="m-lookuptype-542dca0e8ea5"></a>
### lookupType(String, int)

```java
public abstract com.tailf.maapi.MaapiSchemas.CSType lookupType(String name, int nsHash)
```

Types: [CSType](../../../maapi/MaapiSchemas/CSType.md#cls-CSType)

**Parameters**

- `String name`
- `int nsHash`
