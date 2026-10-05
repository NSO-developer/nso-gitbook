# MmapMaapiSchemas <a href="#mmapmaapischemas-0cf3bf5ddd1b" id="mmapmaapischemas-0cf3bf5ddd1b"></a>

```java
public class com.tailf.ncs.maapi.MmapMaapiSchemas
    extends com.tailf.maapi.MaapiSchemas
```

Types: [MaapiSchemas](../../maapi/MaapiSchemas.md#maapischemas-821ac70b83b7)

mmap version of MaapiSchemas trying to load the schema data using
 MmapSchemaFactory if the required classes are available and the server
 supports MAAPI_GET_SCHEMA_FILE_PATH2.

## Members

**Constructors**:

- [MmapMaapiSchemas(String[])](#mmapmaapischemas-a550be7cbd69)

**Fields**:

- [address](../../maapi/MaapiSchemas.md#address-7f51d5da91c5) from MaapiSchemas
- [hashToStringTab](../../maapi/MaapiSchemas.md#hashtostringtab-03883a433398) from MaapiSchemas
- [mnsMaps](../../maapi/MaapiSchemas.md#mnsmaps-a12c27d721ed) from MaapiSchemas
- [NO_EXISTS_TYPE](../../maapi/MaapiSchemas.md#no_exists_type-fb96f522b2a7) from MaapiSchemas
- [schemas](../../maapi/MaapiSchemas.md#schemas-d9de6465eb56) from MaapiSchemas
- [specifiedNSURIs](../../maapi/MaapiSchemas.md#specifiednsuris-e324f1795591) from MaapiSchemas
- [stringToHashTab](../../maapi/MaapiSchemas.md#stringtohashtab-05ebd3f0b9a0) from MaapiSchemas

**Methods**:

- [clearMountIdCache()](../../maapi/MaapiSchemas.md#clearmountidcache-78b7d5916f44) from MaapiSchemas
- [compileDisplayHint(byte[])](../../maapi/MaapiSchemas.md#compiledisplayhint-da77fd4fc4a5) from MaapiSchemas
- [convertMountId(ConfEObject[])](../../maapi/MaapiSchemas.md#convertmountid-dd57936915c7) from MaapiSchemas
- [convertMountId(Map<Integer,CSSchema>, ConfEObject)](../../maapi/MaapiSchemas.md#convertmountid-2b8b82ff2d45) from MaapiSchemas
- [convertMountIdHash(Map<Integer,CSSchema>, int, int)](../../maapi/MaapiSchemas.md#convertmountidhash-20aca1c9464f) from MaapiSchemas
- [currentMountIdCacheSize()](../../maapi/MaapiSchemas.md#currentmountidcachesize-54e5c11ad163) from MaapiSchemas
- [findCSMNsMap(List<String>)](../../maapi/MaapiSchemas.md#findcsmnsmap-522ac9ee9034) from MaapiSchemas
- [findCSMNsMap(String)](../../maapi/MaapiSchemas.md#findcsmnsmap-026c4103f2ca) from MaapiSchemas
- [findCSNode(CSNode, CSMNsMap, String)](#findcsnode-31950d190712)
- [findCSNode(CSNode, int, int)](#findcsnode-052de3dda313)
- [findCSNode(CSNode, String, String)](../../maapi/MaapiSchemas.md#findcsnode-5d43b475b623) from MaapiSchemas
- [findCSNode(MountIdInterface, String, List<PathElement>)](../../maapi/MaapiSchemas.md#findcsnode-22bcb6b48b20) from MaapiSchemas
- [findCSNode(MountIdInterface, String, String, Object[])](../../maapi/MaapiSchemas.md#findcsnode-33ce42d47da2) from MaapiSchemas
- [findCSNode(String, String, Object[])](../../maapi/MaapiSchemas.md#findcsnode-9fc05e189266) from MaapiSchemas
- [findCSRoot(int)](../../maapi/MaapiSchemas.md#findcsroot-e71c532d0a72) from MaapiSchemas
- [findCSRoot(String)](../../maapi/MaapiSchemas.md#findcsroot-ed8e95df57fe) from MaapiSchemas
- [findCSSchema(int)](../../maapi/MaapiSchemas.md#findcsschema-880b1533ffd2) from MaapiSchemas
- [findCSSchema(String)](../../maapi/MaapiSchemas.md#findcsschema-6023156b0628) from MaapiSchemas
- [findCSSchemaByPrefix(String)](../../maapi/MaapiSchemas.md#findcsschemabyprefix-d5a2976f05ae) from MaapiSchemas
- [findCSSchemaFromUniqueRoot(int)](../../maapi/MaapiSchemas.md#findcsschemafromuniqueroot-655331fd3352) from MaapiSchemas
- [findCSSchemaFromUniqueRoot(String)](../../maapi/MaapiSchemas.md#findcsschemafromuniqueroot-6a2bcf9dd24b) from MaapiSchemas
- [findMountId(Map<Integer,CSSchema>, ConfEObject)](../../maapi/MaapiSchemas.md#findmountid-2786e1d58129) from MaapiSchemas
- [findMountId(Map<Integer,CSSchema>, int, int)](../../maapi/MaapiSchemas.md#findmountid-9807a9bfdddb) from MaapiSchemas
- [findSchema(Map<Integer,CSSchema>, int)](../../maapi/MaapiSchemas.md#findschema-b4d435858143) from MaapiSchemas
- [findSchema(Map<Integer,CSSchema>, int, String, String, String, String)](../../maapi/MaapiSchemas.md#findschema-51a71cd5c850) from MaapiSchemas
- [getConfdType(String)](../../maapi/MaapiSchemas.md#getconfdtype-0b0b4b688106) from MaapiSchemas
- [getLoadedMNsMaps()](../../maapi/MaapiSchemas.md#getloadedmnsmaps-9eef39dd2fe7) from MaapiSchemas
- [getLoadedSchemas()](../../maapi/MaapiSchemas.md#getloadedschemas-fe2966b5baf6) from MaapiSchemas
- [getMountId(MountIdInterface, ConfPath)](../../maapi/MaapiSchemas.md#getmountid-a4d23d966af3) from MaapiSchemas
- [getRootMountId()](../../maapi/MaapiSchemas.md#getrootmountid-542ecf8e1ac1) from MaapiSchemas
- [getThreadDefaultMountId()](../../maapi/MaapiSchemas.md#getthreaddefaultmountid-c72bbe29ad4d) from MaapiSchemas
- [hashToString(int)](../../maapi/MaapiSchemas.md#hashtostring-54eaaef71976) from MaapiSchemas
- [init(Socket)](#init-1f83ed7f5091)
- [init(String)](#init-8e7ccd1565bf)
- [mkInitializedMaapiSchemas(String[], Socket)](../../maapi/MaapiSchemas.md#mkinitializedmaapischemas-22e4830ffd3c) from MaapiSchemas
- [registerSchemaRoot(CSSchema)](../../maapi/MaapiSchemas.md#registerschemaroot-0a458f575f6a) from MaapiSchemas
- [removeMountIdCachePath(ConfPath)](../../maapi/MaapiSchemas.md#removemountidcachepath-e2f9028697a6) from MaapiSchemas
- [setThreadDefaultMountId(List<String>)](../../maapi/MaapiSchemas.md#setthreaddefaultmountid-9a20aed46fad) from MaapiSchemas
- [stringToHash(String)](../../maapi/MaapiSchemas.md#stringtohash-7c2af24796ac) from MaapiSchemas
- [stringToValue(CSType, String)](../../maapi/MaapiSchemas.md#stringtovalue-9fef98be9bb2) from MaapiSchemas
- [toString()](../../maapi/MaapiSchemas.md#tostring-e9d48c5503ef) from MaapiSchemas
- [valueToString(CSType, ConfValue)](../../maapi/MaapiSchemas.md#valuetostring-f281f6b6d7d7) from MaapiSchemas

**Nested Types**:

- [MountPointKey](MmapMaapiSchemas/MountPointKey.md#mountpointkey-5feaacabad24)
- [SchemaLookup](MmapMaapiSchemas/SchemaLookup.md#schemalookup-3497dafb56ea)
- [SchemaLookupImpl](MmapMaapiSchemas/SchemaLookupImpl.md#schemalookupimpl-6c1679013471)

## Constructors

### MmapMaapiSchemas(String[]) <a href="#mmapmaapischemas-a550be7cbd69" id="mmapmaapischemas-a550be7cbd69"></a>

```java
public MmapMaapiSchemas(String[] namespaceURIs)
```

**Parameters**

- `String[] namespaceURIs`


## Methods

### findCSNode(CSNode, CSMNsMap, String) <a href="#findcsnode-31950d190712" id="findcsnode-31950d190712"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSNode(
    com.tailf.maapi.MaapiSchemas.CSNode parent0,
    com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap,
    String tag
)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [CSMNsMap](../../maapi/MaapiSchemas/CSMNsMap.md#csmnsmap-1123c939e6bb)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode parent0`
- `com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap`
- `String tag`

### findCSNode(CSNode, int, int) <a href="#findcsnode-052de3dda313" id="findcsnode-052de3dda313"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSNode(
    com.tailf.maapi.MaapiSchemas.CSNode parent0,
    int hns,
    int htag
)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode parent0`
- `int hns`
- `int htag`

### init(Socket) <a href="#init-1f83ed7f5091" id="init-1f83ed7f5091"></a>

```java
protected com.tailf.maapi.MaapiSchemas init(
    java.net.Socket socket
)
    throws com.tailf.maapi.MaapiException
```

Types: [MaapiSchemas](../../maapi/MaapiSchemas.md#maapischemas-821ac70b83b7), [MaapiException](../../maapi/MaapiException.md#maapiexception-af58eb4e109e)

**Parameters**

- `java.net.Socket socket`

### init(String) <a href="#init-8e7ccd1565bf" id="init-8e7ccd1565bf"></a>

```java
protected com.tailf.maapi.MaapiSchemas init(String schemaPath) throws com.tailf.maapi.MaapiException
```

Types: [MaapiSchemas](../../maapi/MaapiSchemas.md#maapischemas-821ac70b83b7), [MaapiException](../../maapi/MaapiException.md#maapiexception-af58eb4e109e)

**Parameters**

- `String schemaPath`


## Nested Types

- [MountPointKey](MmapMaapiSchemas/MountPointKey.md#mountpointkey-5feaacabad24)
- [SchemaLookup](MmapMaapiSchemas/SchemaLookup.md#schemalookup-3497dafb56ea)
- [SchemaLookupImpl](MmapMaapiSchemas/SchemaLookupImpl.md#schemalookupimpl-6c1679013471)
