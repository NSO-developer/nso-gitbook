# SchemaLookup <a href="#cls-SchemaLookup" id="cls-SchemaLookup"></a>

```java
public static interface com.tailf.ncs.maapi.MmapMaapiSchemas.SchemaLookup
```

## Members

**Methods**:

- [addMountPointChildren(int, String, List<CSNode>)](#m-addMountPointChildren-fd0424d46be4)
- [cachedFallbackChildren(int, List<String>, Supplier<List<CSNode>>)](#m-cachedFallbackChildren-86535d1081d1)
- [hashToString(int)](#m-hashToString-54eaaef71976)
- [lookupMountId(int, int)](#m-lookupMountId-648b4c864458)
- [lookupSchema(int)](#m-lookupSchema-dfd8e305c928)
- [lookupType(String, int)](#m-lookupType-542dca0e8ea5)

## Methods

### addMountPointChildren(int, String, List<CSNode>) <a href="#m-addMountPointChildren-fd0424d46be4" id="m-addMountPointChildren-fd0424d46be4"></a>

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

### cachedFallbackChildren(int, List<String>, Supplier<List<CSNode>>) <a href="#m-cachedFallbackChildren-86535d1081d1" id="m-cachedFallbackChildren-86535d1081d1"></a>

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

### hashToString(int) <a href="#m-hashToString-54eaaef71976" id="m-hashToString-54eaaef71976"></a>

```java
public abstract String hashToString(int hash)
```

**Parameters**

- `int hash`

### lookupMountId(int, int) <a href="#m-lookupMountId-648b4c864458" id="m-lookupMountId-648b4c864458"></a>

```java
public abstract com.tailf.maapi.MaapiSchemas.MountId lookupMountId(int nsHash, int tagHash)
```

Types: [MountId](../../../maapi/MaapiSchemas/MountId.md#cls-MountId)

**Parameters**

- `int nsHash`
- `int tagHash`

### lookupSchema(int) <a href="#m-lookupSchema-dfd8e305c928" id="m-lookupSchema-dfd8e305c928"></a>

```java
public abstract com.tailf.maapi.MaapiSchemas.CSSchema lookupSchema(int nsHash)
```

Types: [CSSchema](../../../maapi/MaapiSchemas/CSSchema.md#cls-CSSchema)

**Parameters**

- `int nsHash`

### lookupType(String, int) <a href="#m-lookupType-542dca0e8ea5" id="m-lookupType-542dca0e8ea5"></a>

```java
public abstract com.tailf.maapi.MaapiSchemas.CSType lookupType(String name, int nsHash)
```

Types: [CSType](../../../maapi/MaapiSchemas/CSType.md#cls-CSType)

**Parameters**

- `String name`
- `int nsHash`
