# SchemaLookup <a href="#schemalookup-3497dafb56ea" id="schemalookup-3497dafb56ea"></a>

```java
public static interface com.tailf.ncs.maapi.MmapMaapiSchemas.SchemaLookup
```

## Members

**Methods**:

- [addMountPointChildren(int, String, List<CSNode>)](#addmountpointchildren-fd0424d46be4)
- [cachedFallbackChildren(int, List<String>, Supplier<List<CSNode>>)](#cachedfallbackchildren-86535d1081d1)
- [hashToString(int)](#hashtostring-54eaaef71976)
- [lookupMountId(int, int)](#lookupmountid-648b4c864458)
- [lookupSchema(int)](#lookupschema-dfd8e305c928)
- [lookupType(String, int)](#lookuptype-542dca0e8ea5)

## Methods

### addMountPointChildren(int, String, List&lt;CSNode&gt;) <a href="#addmountpointchildren-fd0424d46be4" id="addmountpointchildren-fd0424d46be4"></a>

```java
public abstract boolean addMountPointChildren(
    int pathHash,
    String mountId,
    java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> children
)
```

Types: [CSNode](../../../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

**Parameters**

- `int pathHash`
- `String mountId`
- `java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> children`

### cachedFallbackChildren(int, List&lt;String&gt;, Supplier&lt;List&lt;CSNode&gt;&gt;) <a href="#cachedfallbackchildren-86535d1081d1" id="cachedfallbackchildren-86535d1081d1"></a>

```java
public abstract java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> cachedFallbackChildren(
    int pathHash,
    java.util.List<String> mountIds,
    java.util.function.Supplier<java.util.List<com.tailf.maapi.MaapiSchemas.CSNode>> compute
)
```

Types: [CSNode](../../../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

**Parameters**

- `int pathHash`
- `java.util.List<String> mountIds`
- `java.util.function.Supplier<java.util.List<com.tailf.maapi.MaapiSchemas.CSNode>> compute`

### hashToString(int) <a href="#hashtostring-54eaaef71976" id="hashtostring-54eaaef71976"></a>

```java
public abstract String hashToString(int hash)
```

**Parameters**

- `int hash`

### lookupMountId(int, int) <a href="#lookupmountid-648b4c864458" id="lookupmountid-648b4c864458"></a>

```java
public abstract com.tailf.maapi.MaapiSchemas.MountId lookupMountId(int nsHash, int tagHash)
```

Types: [MountId](../../../maapi/MaapiSchemas/MountId.md#mountid-702a10803d00)

**Parameters**

- `int nsHash`
- `int tagHash`

### lookupSchema(int) <a href="#lookupschema-dfd8e305c928" id="lookupschema-dfd8e305c928"></a>

```java
public abstract com.tailf.maapi.MaapiSchemas.CSSchema lookupSchema(int nsHash)
```

Types: [CSSchema](../../../maapi/MaapiSchemas/CSSchema.md#csschema-f51a58180f67)

**Parameters**

- `int nsHash`

### lookupType(String, int) <a href="#lookuptype-542dca0e8ea5" id="lookuptype-542dca0e8ea5"></a>

```java
public abstract com.tailf.maapi.MaapiSchemas.CSType lookupType(String name, int nsHash)
```

Types: [CSType](../../../maapi/MaapiSchemas/CSType.md#cstype-8bf086cc0595)

**Parameters**

- `String name`
- `int nsHash`
