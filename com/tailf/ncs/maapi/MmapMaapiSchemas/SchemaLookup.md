<a id="s-SchemaLookup"></a>
# SchemaLookup

```java
public static interface com.tailf.ncs.maapi.MmapMaapiSchemas.SchemaLookup
```

## Members

**Methods**:

- [addMountPointChildren(int, String, List<CSNode>)](#s-addMountPointChildren)
- [cachedFallbackChildren(int, List<String>, Supplier<List<CSNode>>)](#s-cachedFallbackChildren)
- [hashToString(int)](#s-hashToString)
- [lookupMountId(int, int)](#s-lookupMountId)
- [lookupSchema(int)](#s-lookupSchema)
- [lookupType(String, int)](#s-lookupType)

## Methods

<a id="s-addMountPointChildren"></a>
### addMountPointChildren(int, String, List<CSNode>)

```java
public abstract boolean addMountPointChildren(
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
public abstract java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> cachedFallbackChildren(
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
public abstract String hashToString(int hash)
```

**Parameters**

- `int hash`

<a id="s-lookupMountId"></a>
### lookupMountId(int, int)

```java
public abstract com.tailf.maapi.MaapiSchemas.MountId lookupMountId(int nsHash, int tagHash)
```

Types: [MountId](../../../maapi/MaapiSchemas/MountId.md#s-MountId)

**Parameters**

- `int nsHash`
- `int tagHash`

<a id="s-lookupSchema"></a>
### lookupSchema(int)

```java
public abstract com.tailf.maapi.MaapiSchemas.CSSchema lookupSchema(int nsHash)
```

Types: [CSSchema](../../../maapi/MaapiSchemas/CSSchema.md#s-CSSchema)

**Parameters**

- `int nsHash`

<a id="s-lookupType"></a>
### lookupType(String, int)

```java
public abstract com.tailf.maapi.MaapiSchemas.CSType lookupType(String name, int nsHash)
```

Types: [CSType](../../../maapi/MaapiSchemas/CSType.md#s-CSType)

**Parameters**

- `String name`
- `int nsHash`
