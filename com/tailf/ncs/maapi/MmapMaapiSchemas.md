<a id="s-MmapMaapiSchemas"></a>
# MmapMaapiSchemas

```java
public class com.tailf.ncs.maapi.MmapMaapiSchemas
    extends com.tailf.maapi.MaapiSchemas
```

Types: [MaapiSchemas](../../maapi/MaapiSchemas.md#s-MaapiSchemas)

mmap version of MaapiSchemas trying to load the schema data using
 MmapSchemaFactory if the required classes are available and the server
 supports MAAPI_GET_SCHEMA_FILE_PATH2.

## Members

**Constructors**:

- [MmapMaapiSchemas(String[])](#s-MmapMaapiSchemas-1)

**Fields**:

- [address](../../maapi/MaapiSchemas.md#s-address) from MaapiSchemas
- [hashToStringTab](../../maapi/MaapiSchemas.md#s-hashToStringTab) from MaapiSchemas
- [mnsMaps](../../maapi/MaapiSchemas.md#s-mnsMaps) from MaapiSchemas
- [NO_EXISTS_TYPE](../../maapi/MaapiSchemas.md#s-NO_EXISTS_TYPE) from MaapiSchemas
- [schemas](../../maapi/MaapiSchemas.md#s-schemas) from MaapiSchemas
- [specifiedNSURIs](../../maapi/MaapiSchemas.md#s-specifiedNSURIs) from MaapiSchemas
- [stringToHashTab](../../maapi/MaapiSchemas.md#s-stringToHashTab) from MaapiSchemas

**Methods**:

- [clearMountIdCache()](../../maapi/MaapiSchemas.md#s-clearMountIdCache) from MaapiSchemas
- [compileDisplayHint(byte[])](../../maapi/MaapiSchemas.md#s-compileDisplayHint) from MaapiSchemas
- [convertMountId(ConfEObject[])](../../maapi/MaapiSchemas.md#s-convertMountId) from MaapiSchemas
- [convertMountId(Map<Integer,CSSchema>, ConfEObject)](../../maapi/MaapiSchemas.md#s-convertMountId-1) from MaapiSchemas
- [convertMountIdHash(Map<Integer,CSSchema>, int, int)](../../maapi/MaapiSchemas.md#s-convertMountIdHash) from MaapiSchemas
- [currentMountIdCacheSize()](../../maapi/MaapiSchemas.md#s-currentMountIdCacheSize) from MaapiSchemas
- [findCSMNsMap(List<String>)](../../maapi/MaapiSchemas.md#s-findCSMNsMap) from MaapiSchemas
- [findCSMNsMap(String)](../../maapi/MaapiSchemas.md#s-findCSMNsMap-1) from MaapiSchemas
- [findCSNode(CSNode, CSMNsMap, String)](#s-findCSNode)
- [findCSNode(CSNode, int, int)](#s-findCSNode-1)
- [findCSNode(CSNode, String, String)](../../maapi/MaapiSchemas.md#s-findCSNode-2) from MaapiSchemas
- [findCSNode(MountIdInterface, String, List<PathElement>)](../../maapi/MaapiSchemas.md#s-findCSNode-3) from MaapiSchemas
- [findCSNode(MountIdInterface, String, String, Object[])](../../maapi/MaapiSchemas.md#s-findCSNode-4) from MaapiSchemas
- [findCSNode(String, String, Object[])](../../maapi/MaapiSchemas.md#s-findCSNode-5) from MaapiSchemas
- [findCSRoot(int)](../../maapi/MaapiSchemas.md#s-findCSRoot) from MaapiSchemas
- [findCSRoot(String)](../../maapi/MaapiSchemas.md#s-findCSRoot-1) from MaapiSchemas
- [findCSSchema(int)](../../maapi/MaapiSchemas.md#s-findCSSchema) from MaapiSchemas
- [findCSSchema(String)](../../maapi/MaapiSchemas.md#s-findCSSchema-1) from MaapiSchemas
- [findCSSchemaByPrefix(String)](../../maapi/MaapiSchemas.md#s-findCSSchemaByPrefix) from MaapiSchemas
- [findCSSchemaFromUniqueRoot(int)](../../maapi/MaapiSchemas.md#s-findCSSchemaFromUniqueRoot) from MaapiSchemas
- [findCSSchemaFromUniqueRoot(String)](../../maapi/MaapiSchemas.md#s-findCSSchemaFromUniqueRoot-1) from MaapiSchemas
- [findMountId(Map<Integer,CSSchema>, ConfEObject)](../../maapi/MaapiSchemas.md#s-findMountId) from MaapiSchemas
- [findMountId(Map<Integer,CSSchema>, int, int)](../../maapi/MaapiSchemas.md#s-findMountId-1) from MaapiSchemas
- [findSchema(Map<Integer,CSSchema>, int)](../../maapi/MaapiSchemas.md#s-findSchema) from MaapiSchemas
- [findSchema(Map<Integer,CSSchema>, int, String, String, String, String)](../../maapi/MaapiSchemas.md#s-findSchema-1) from MaapiSchemas
- [getConfdType(String)](../../maapi/MaapiSchemas.md#s-getConfdType) from MaapiSchemas
- [getLoadedMNsMaps()](../../maapi/MaapiSchemas.md#s-getLoadedMNsMaps) from MaapiSchemas
- [getLoadedSchemas()](../../maapi/MaapiSchemas.md#s-getLoadedSchemas) from MaapiSchemas
- [getMountId(MountIdInterface, ConfPath)](../../maapi/MaapiSchemas.md#s-getMountId) from MaapiSchemas
- [getRootMountId()](../../maapi/MaapiSchemas.md#s-getRootMountId) from MaapiSchemas
- [getThreadDefaultMountId()](../../maapi/MaapiSchemas.md#s-getThreadDefaultMountId) from MaapiSchemas
- [hashToString(int)](../../maapi/MaapiSchemas.md#s-hashToString) from MaapiSchemas
- [init(Socket)](#s-init)
- [init(String)](#s-init-1)
- [mkInitializedMaapiSchemas(String[], Socket)](../../maapi/MaapiSchemas.md#s-mkInitializedMaapiSchemas) from MaapiSchemas
- [registerSchemaRoot(CSSchema)](../../maapi/MaapiSchemas.md#s-registerSchemaRoot) from MaapiSchemas
- [removeMountIdCachePath(ConfPath)](../../maapi/MaapiSchemas.md#s-removeMountIdCachePath) from MaapiSchemas
- [setThreadDefaultMountId(List<String>)](../../maapi/MaapiSchemas.md#s-setThreadDefaultMountId) from MaapiSchemas
- [stringToHash(String)](../../maapi/MaapiSchemas.md#s-stringToHash) from MaapiSchemas
- [stringToValue(CSType, String)](../../maapi/MaapiSchemas.md#s-stringToValue) from MaapiSchemas
- [toString()](../../maapi/MaapiSchemas.md#s-toString) from MaapiSchemas
- [valueToString(CSType, ConfValue)](../../maapi/MaapiSchemas.md#s-valueToString) from MaapiSchemas

**Nested Types**:

- [MountPointKey](MmapMaapiSchemas/MountPointKey.md#s-MountPointKey)
- [SchemaLookup](MmapMaapiSchemas/SchemaLookup.md#s-SchemaLookup)
- [SchemaLookupImpl](MmapMaapiSchemas/SchemaLookupImpl.md#s-SchemaLookupImpl)

## Constructors

<a id="s-MmapMaapiSchemas-1"></a>
### MmapMaapiSchemas(String[])

```java
public MmapMaapiSchemas(String[] namespaceURIs)
```

**Parameters**

- `String[] namespaceURIs`


## Methods

<a id="s-findCSNode"></a>
### findCSNode(CSNode, CSMNsMap, String)

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSNode(
    com.tailf.maapi.MaapiSchemas.CSNode parent0,
    com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap,
    String tag
)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode), [CSMNsMap](../../maapi/MaapiSchemas/CSMNsMap.md#s-CSMNsMap)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode parent0`
- `com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap`
- `String tag`

<a id="s-findCSNode-1"></a>
### findCSNode(CSNode, int, int)

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSNode(
    com.tailf.maapi.MaapiSchemas.CSNode parent0,
    int hns,
    int htag
)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode parent0`
- `int hns`
- `int htag`

<a id="s-init"></a>
### init(Socket)

```java
protected com.tailf.maapi.MaapiSchemas init(
    java.net.Socket socket
)
    throws com.tailf.maapi.MaapiException
```

Types: [MaapiSchemas](../../maapi/MaapiSchemas.md#s-MaapiSchemas), [MaapiException](../../maapi/MaapiException.md#s-MaapiException)

**Parameters**

- `java.net.Socket socket`

<a id="s-init-1"></a>
### init(String)

```java
protected com.tailf.maapi.MaapiSchemas init(String schemaPath) throws com.tailf.maapi.MaapiException
```

Types: [MaapiSchemas](../../maapi/MaapiSchemas.md#s-MaapiSchemas), [MaapiException](../../maapi/MaapiException.md#s-MaapiException)

**Parameters**

- `String schemaPath`


## Nested Types

- [MountPointKey](MmapMaapiSchemas/MountPointKey.md)
- [SchemaLookup](MmapMaapiSchemas/SchemaLookup.md)
- [SchemaLookupImpl](MmapMaapiSchemas/SchemaLookupImpl.md)
