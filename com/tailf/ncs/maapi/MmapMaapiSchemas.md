<a id="cls-MmapMaapiSchemas"></a>
# MmapMaapiSchemas

```java
public class com.tailf.ncs.maapi.MmapMaapiSchemas
    extends com.tailf.maapi.MaapiSchemas
```

Types: [MaapiSchemas](../../maapi/MaapiSchemas.md#cls-MaapiSchemas)

mmap version of MaapiSchemas trying to load the schema data using
 MmapSchemaFactory if the required classes are available and the server
 supports MAAPI_GET_SCHEMA_FILE_PATH2.

## Members

**Constructors**:

- [MmapMaapiSchemas(String[])](#m-mmapmaapischemas-a550be7cbd69)

**Fields**:

- [address](../../maapi/MaapiSchemas.md#m-address) from MaapiSchemas
- [hashToStringTab](../../maapi/MaapiSchemas.md#m-hashToStringTab) from MaapiSchemas
- [mnsMaps](../../maapi/MaapiSchemas.md#m-mnsMaps) from MaapiSchemas
- [NO_EXISTS_TYPE](../../maapi/MaapiSchemas.md#m-NO_EXISTS_TYPE) from MaapiSchemas
- [schemas](../../maapi/MaapiSchemas.md#m-schemas) from MaapiSchemas
- [specifiedNSURIs](../../maapi/MaapiSchemas.md#m-specifiedNSURIs) from MaapiSchemas
- [stringToHashTab](../../maapi/MaapiSchemas.md#m-stringToHashTab) from MaapiSchemas

**Methods**:

- [clearMountIdCache()](../../maapi/MaapiSchemas.md#m-clearmountidcache-78b7d5916f44) from MaapiSchemas
- [compileDisplayHint(byte[])](../../maapi/MaapiSchemas.md#m-compiledisplayhint-da77fd4fc4a5) from MaapiSchemas
- [convertMountId(ConfEObject[])](../../maapi/MaapiSchemas.md#m-convertmountid-dd57936915c7) from MaapiSchemas
- [convertMountId(Map<Integer,CSSchema>, ConfEObject)](../../maapi/MaapiSchemas.md#m-convertmountid-2b8b82ff2d45) from MaapiSchemas
- [convertMountIdHash(Map<Integer,CSSchema>, int, int)](../../maapi/MaapiSchemas.md#m-convertmountidhash-20aca1c9464f) from MaapiSchemas
- [currentMountIdCacheSize()](../../maapi/MaapiSchemas.md#m-currentmountidcachesize-54e5c11ad163) from MaapiSchemas
- [findCSMNsMap(List<String>)](../../maapi/MaapiSchemas.md#m-findcsmnsmap-522ac9ee9034) from MaapiSchemas
- [findCSMNsMap(String)](../../maapi/MaapiSchemas.md#m-findcsmnsmap-026c4103f2ca) from MaapiSchemas
- [findCSNode(CSNode, CSMNsMap, String)](#m-findcsnode-31950d190712)
- [findCSNode(CSNode, int, int)](#m-findcsnode-052de3dda313)
- [findCSNode(CSNode, String, String)](../../maapi/MaapiSchemas.md#m-findcsnode-5d43b475b623) from MaapiSchemas
- [findCSNode(MountIdInterface, String, List<PathElement>)](../../maapi/MaapiSchemas.md#m-findcsnode-22bcb6b48b20) from MaapiSchemas
- [findCSNode(MountIdInterface, String, String, Object[])](../../maapi/MaapiSchemas.md#m-findcsnode-33ce42d47da2) from MaapiSchemas
- [findCSNode(String, String, Object[])](../../maapi/MaapiSchemas.md#m-findcsnode-9fc05e189266) from MaapiSchemas
- [findCSRoot(int)](../../maapi/MaapiSchemas.md#m-findcsroot-e71c532d0a72) from MaapiSchemas
- [findCSRoot(String)](../../maapi/MaapiSchemas.md#m-findcsroot-ed8e95df57fe) from MaapiSchemas
- [findCSSchema(int)](../../maapi/MaapiSchemas.md#m-findcsschema-880b1533ffd2) from MaapiSchemas
- [findCSSchema(String)](../../maapi/MaapiSchemas.md#m-findcsschema-6023156b0628) from MaapiSchemas
- [findCSSchemaByPrefix(String)](../../maapi/MaapiSchemas.md#m-findcsschemabyprefix-d5a2976f05ae) from MaapiSchemas
- [findCSSchemaFromUniqueRoot(int)](../../maapi/MaapiSchemas.md#m-findcsschemafromuniqueroot-655331fd3352) from MaapiSchemas
- [findCSSchemaFromUniqueRoot(String)](../../maapi/MaapiSchemas.md#m-findcsschemafromuniqueroot-6a2bcf9dd24b) from MaapiSchemas
- [findMountId(Map<Integer,CSSchema>, ConfEObject)](../../maapi/MaapiSchemas.md#m-findmountid-2786e1d58129) from MaapiSchemas
- [findMountId(Map<Integer,CSSchema>, int, int)](../../maapi/MaapiSchemas.md#m-findmountid-9807a9bfdddb) from MaapiSchemas
- [findSchema(Map<Integer,CSSchema>, int)](../../maapi/MaapiSchemas.md#m-findschema-b4d435858143) from MaapiSchemas
- [findSchema(Map<Integer,CSSchema>, int, String, String, String, String)](../../maapi/MaapiSchemas.md#m-findschema-51a71cd5c850) from MaapiSchemas
- [getConfdType(String)](../../maapi/MaapiSchemas.md#m-getconfdtype-0b0b4b688106) from MaapiSchemas
- [getLoadedMNsMaps()](../../maapi/MaapiSchemas.md#m-getloadedmnsmaps-9eef39dd2fe7) from MaapiSchemas
- [getLoadedSchemas()](../../maapi/MaapiSchemas.md#m-getloadedschemas-fe2966b5baf6) from MaapiSchemas
- [getMountId(MountIdInterface, ConfPath)](../../maapi/MaapiSchemas.md#m-getmountid-a4d23d966af3) from MaapiSchemas
- [getRootMountId()](../../maapi/MaapiSchemas.md#m-getrootmountid-542ecf8e1ac1) from MaapiSchemas
- [getThreadDefaultMountId()](../../maapi/MaapiSchemas.md#m-getthreaddefaultmountid-c72bbe29ad4d) from MaapiSchemas
- [hashToString(int)](../../maapi/MaapiSchemas.md#m-hashtostring-54eaaef71976) from MaapiSchemas
- [init(Socket)](#m-init-1f83ed7f5091)
- [init(String)](#m-init-8e7ccd1565bf)
- [mkInitializedMaapiSchemas(String[], Socket)](../../maapi/MaapiSchemas.md#m-mkinitializedmaapischemas-22e4830ffd3c) from MaapiSchemas
- [registerSchemaRoot(CSSchema)](../../maapi/MaapiSchemas.md#m-registerschemaroot-0a458f575f6a) from MaapiSchemas
- [removeMountIdCachePath(ConfPath)](../../maapi/MaapiSchemas.md#m-removemountidcachepath-e2f9028697a6) from MaapiSchemas
- [setThreadDefaultMountId(List<String>)](../../maapi/MaapiSchemas.md#m-setthreaddefaultmountid-9a20aed46fad) from MaapiSchemas
- [stringToHash(String)](../../maapi/MaapiSchemas.md#m-stringtohash-7c2af24796ac) from MaapiSchemas
- [stringToValue(CSType, String)](../../maapi/MaapiSchemas.md#m-stringtovalue-9fef98be9bb2) from MaapiSchemas
- [toString()](../../maapi/MaapiSchemas.md#m-tostring-e9d48c5503ef) from MaapiSchemas
- [valueToString(CSType, ConfValue)](../../maapi/MaapiSchemas.md#m-valuetostring-f281f6b6d7d7) from MaapiSchemas

**Nested Types**:

- [MountPointKey](MmapMaapiSchemas/MountPointKey.md#cls-MountPointKey)
- [SchemaLookup](MmapMaapiSchemas/SchemaLookup.md#cls-SchemaLookup)
- [SchemaLookupImpl](MmapMaapiSchemas/SchemaLookupImpl.md#cls-SchemaLookupImpl)

## Constructors

<a id="m-mmapmaapischemas-a550be7cbd69"></a>
### MmapMaapiSchemas(String[])

```java
public MmapMaapiSchemas(String[] namespaceURIs)
```

**Parameters**

- `String[] namespaceURIs`


## Methods

<a id="m-findcsnode-31950d190712"></a>
### findCSNode(CSNode, CSMNsMap, String)

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSNode(
    com.tailf.maapi.MaapiSchemas.CSNode parent0,
    com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap,
    String tag
)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [CSMNsMap](../../maapi/MaapiSchemas/CSMNsMap.md#cls-CSMNsMap)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode parent0`
- `com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap`
- `String tag`

<a id="m-findcsnode-052de3dda313"></a>
### findCSNode(CSNode, int, int)

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSNode(
    com.tailf.maapi.MaapiSchemas.CSNode parent0,
    int hns,
    int htag
)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode parent0`
- `int hns`
- `int htag`

<a id="m-init-1f83ed7f5091"></a>
### init(Socket)

```java
protected com.tailf.maapi.MaapiSchemas init(
    java.net.Socket socket
)
    throws com.tailf.maapi.MaapiException
```

Types: [MaapiSchemas](../../maapi/MaapiSchemas.md#cls-MaapiSchemas), [MaapiException](../../maapi/MaapiException.md#cls-MaapiException)

**Parameters**

- `java.net.Socket socket`

<a id="m-init-8e7ccd1565bf"></a>
### init(String)

```java
protected com.tailf.maapi.MaapiSchemas init(String schemaPath) throws com.tailf.maapi.MaapiException
```

Types: [MaapiSchemas](../../maapi/MaapiSchemas.md#cls-MaapiSchemas), [MaapiException](../../maapi/MaapiException.md#cls-MaapiException)

**Parameters**

- `String schemaPath`


## Nested Types

- [MountPointKey](MmapMaapiSchemas/MountPointKey.md#cls-MountPointKey)
- [SchemaLookup](MmapMaapiSchemas/SchemaLookup.md#cls-SchemaLookup)
- [SchemaLookupImpl](MmapMaapiSchemas/SchemaLookupImpl.md#cls-SchemaLookupImpl)
