# MaapiSchemas <a href="#maapischemas-821ac70b83b7" id="maapischemas-821ac70b83b7"></a>

```java
public class com.tailf.maapi.MaapiSchemas
```

Handles the schema information from the data models loaded.

 It holds an offline tree structure where each node is represented by an
 instance of [`CSNode`](MaapiSchemas/CSNode.md#csnode-f12d9ad69c28) which in turn contains connections
 to other nodes.



 Methods exist to retrieve a specified schema [`CSSchema`](MaapiSchemas/CSSchema.md#csschema-f51a58180f67)
 or a specified schema node
 [`findCSNode(String,String,Object...)`](MaapiSchemas.md#findcsnode-9fc05e189266),
 `findCSNode(MaapiSchemas.CSNode,String,String)`.



 All entities, including Schemas, Nodes, Types, Choices etc are
 represented as inner classes of `MaapiSchemas` and are stored
 in its offline tree hierarchy.



 These inner classes have methods to retrieve all information about the
 entity.


 Note that this class is self-contained in the sense that it does not use any
 locally compiled schemas i.e. ConfNamespace classes.



 There are methods for converting between hashes and strings:
 [`stringToHash(String)`](MaapiSchemas.md#stringtohash-7c2af24796ac) and [`hashToString(int)`](MaapiSchemas.md#hashtostring-54eaaef71976)



 Example:



```
 // int port = Conf.PORT; // ConfD TCP; NCS uses Conf.NCS_PATH (Unix socket)
 // Setup socket to server
 Socket s = new Socket("localhost", port);
 // Start MAAPI session for admin user, originating from localhost
 Maapi maapi = new Maapi(s);
 s.close();
 Iterator<MaapiSchemas.CSSchema> iter =
     Maapi.getSchemas().getLoadedSchemas().iterator();
 while (iter.hasNext()) {
     MaapiSchemas.CSSchema sch = iter.next();
     System.out.println(sch);
     System.out.println("--- Named Types ---");
     Enumeration<MaapiSchemas.CSNamedType> typenum =
         sch.getNamedTypes().elements();
     while (typenum.hasMoreElements()) {
         MaapiSchemas.CSNamedType namedType = typenum.nextElement();
         System.out.println(namedType);
     }

     MaapiSchemas.CSNode root = sch.getRootNode();
     System.out.println("--- Root Node ---");
     System.out.println(root);
     if (root != null) {
         System.out.println("--- Node Tree ---");
         Iterator<MaapiSchemas.CSNode> iter2 =
             root.getSiblings().iterator();
         int offset = 0;
         while (iter2.hasNext()) {
             MaapiSchemas.CSNode n = iter2.next();
             System.out.print(n.getTag());
             MaapiSchemasUtil.printNodeInfo(offset, n);
             MaapiSchemasUtil.printChildren(offset, n);
         }
     }
 }
```

**Related classes**

- [MmapMaapiSchemas](../ncs/maapi/MmapMaapiSchemas.md#mmapmaapischemas-0cf3bf5ddd1b)

## Members

**Constructors**:

- [MaapiSchemas\(String\[\]\)](#maapischemas-6fe3b955b5b9)

**Fields**:

- [address](#address-7f51d5da91c5)
- [CS\_DOC\_DESCRIPTION](#cs_doc_description-ffc1186764ad)
- [CS\_DOC\_HIDDEN](#cs_doc_hidden-58c23b73349c)
- [CS\_DOC\_PROMPT](#cs_doc_prompt-f987d8b9104b)
- [hashToStringTab](#hashtostringtab-03883a433398)
- [mnsMaps](#mnsmaps-a12c27d721ed)
- [NO\_EXISTS\_TYPE](#no_exists_type-fb96f522b2a7)
- [schemas](#schemas-d9de6465eb56)
- [specifiedNSURIs](#specifiednsuris-e324f1795591)
- [stringToHashTab](#stringtohashtab-05ebd3f0b9a0)

**Methods**:

- [clearMountIdCache\(\)](#clearmountidcache-78b7d5916f44)
- [compileDisplayHint\(byte\[\]\)](#compiledisplayhint-da77fd4fc4a5)
- [convertMountId\(ConfEObject\[\]\)](#convertmountid-dd57936915c7)
- [convertMountId\(Map\<Integer,CSSchema\>, ConfEObject\)](#convertmountid-2b8b82ff2d45)
- [convertMountIdHash\(Map\<Integer,CSSchema\>, int, int\)](#convertmountidhash-20aca1c9464f)
- [currentMountIdCacheSize\(\)](#currentmountidcachesize-54e5c11ad163)
- [findCSMNsMap\(List\<String\>\)](#findcsmnsmap-522ac9ee9034)
- [findCSMNsMap\(String\)](#findcsmnsmap-026c4103f2ca)
- [findCSNode\(CSNode, CSMNsMap, String\)](#findcsnode-31950d190712)
- [findCSNode\(CSNode, int, int\)](#findcsnode-052de3dda313)
- [findCSNode\(CSNode, String, String\)](#findcsnode-5d43b475b623)
- [findCSNode\(MountIdInterface, String, List\<PathElement\>\)](#findcsnode-22bcb6b48b20)
- [findCSNode\(MountIdInterface, String, String, Object\[\]\)](#findcsnode-33ce42d47da2)
- [findCSNode\(String, String, Object\[\]\)](#findcsnode-9fc05e189266)
- [findCSRoot\(int\)](#findcsroot-e71c532d0a72)
- [findCSRoot\(String\)](#findcsroot-ed8e95df57fe)
- [findCSSchema\(int\)](#findcsschema-880b1533ffd2)
- [findCSSchema\(String\)](#findcsschema-6023156b0628)
- [findCSSchemaByPrefix\(String\)](#findcsschemabyprefix-d5a2976f05ae)
- [findCSSchemaFromUniqueRoot\(int\)](#findcsschemafromuniqueroot-655331fd3352)
- [findCSSchemaFromUniqueRoot\(String\)](#findcsschemafromuniqueroot-6a2bcf9dd24b)
- [findMountId\(Map\<Integer,CSSchema\>, ConfEObject\)](#findmountid-2786e1d58129)
- [findMountId\(Map\<Integer,CSSchema\>, int, int\)](#findmountid-9807a9bfdddb)
- [findSchema\(Map\<Integer,CSSchema\>, int\)](#findschema-b4d435858143)
- [findSchema\(Map\<Integer,CSSchema\>, int, String, String, String, String\)](#findschema-51a71cd5c850)
- [getConfdType\(String\)](#getconfdtype-0b0b4b688106)
- [getLoadedMNsMaps\(\)](#getloadedmnsmaps-9eef39dd2fe7)
- [getLoadedSchemas\(\)](#getloadedschemas-fe2966b5baf6)
- [getMountId\(MountIdInterface, ConfPath\)](#getmountid-a4d23d966af3)
- [getRootMountId\(\)](#getrootmountid-542ecf8e1ac1)
- [getThreadDefaultMountId\(\)](#getthreaddefaultmountid-c72bbe29ad4d)
- [hashToString\(int\)](#hashtostring-54eaaef71976)
- [init\(Socket\)](#init-1f83ed7f5091)
- [mkInitializedMaapiSchemas\(String\[\], Socket\)](#mkinitializedmaapischemas-22e4830ffd3c)
- [registerSchemaRoot\(CSSchema\)](#registerschemaroot-0a458f575f6a)
- [removeMountIdCachePath\(ConfPath\)](#removemountidcachepath-e2f9028697a6)
- [setThreadDefaultMountId\(List\<String\>\)](#setthreaddefaultmountid-9a20aed46fad)
- [stringToHash\(String\)](#stringtohash-7c2af24796ac)
- [stringToValue\(CSType, String\)](#stringtovalue-9fef98be9bb2)
- [toString\(\)](#tostring-e9d48c5503ef)
- [valueToString\(CSType, ConfValue\)](#valuetostring-f281f6b6d7d7)

**Nested Types**:

- [BitsTypeMethodsImpl](MaapiSchemas/BitsTypeMethodsImpl.md#bitstypemethodsimpl-ab532a8104f1)
- [CSBit](MaapiSchemas/CSBit.md#csbit-632d615b1a7c)
- [CSCase](MaapiSchemas/CSCase.md#cscase-26937f56b18d)
- [CSChoice](MaapiSchemas/CSChoice.md#cschoice-7d5d5dd71270)
- [CSEnum](MaapiSchemas/CSEnum.md#csenum-fb14e528a3f2)
- [CSIdref](MaapiSchemas/CSIdref.md#csidref-ad9cd0da8b26)
- [CSMNsMap](MaapiSchemas/CSMNsMap.md#csmnsmap-1123c939e6bb)
- [CSNamedType](MaapiSchemas/CSNamedType.md#csnamedtype-6305f923b0f3)
- [CSNode](MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)
- [CSNodeInfo](MaapiSchemas/CSNodeInfo.md#csnodeinfo-aad17d6161cc)
- [CSNodeType](MaapiSchemas/CSNodeType.md#csnodetype-c43320d71626)
- [CSSchema](MaapiSchemas/CSSchema.md#csschema-f51a58180f67)
- [CSShallowType](MaapiSchemas/CSShallowType.md#csshallowtype-383e8e4d58c6)
- [CSStringLength](MaapiSchemas/CSStringLength.md#csstringlength-f40944c587da)
- [CSStringRestriction](MaapiSchemas/CSStringRestriction.md#csstringrestriction-bde26fa14e67)
- [CSType](MaapiSchemas/CSType.md#cstype-8bf086cc0595)
- [CSTypeBits](MaapiSchemas/CSTypeBits.md#cstypebits-9c6ae99aa2fc)
- [CSTypeMethods](MaapiSchemas/CSTypeMethods.md#cstypemethods-41a37625616b)
- [CSTypeRange](MaapiSchemas/CSTypeRange.md#cstyperange-3ed2b19cd40b)
- [Decimal64TypeMethodsImpl](MaapiSchemas/Decimal64TypeMethodsImpl.md#decimal64typemethodsimpl-e475a1fe77d6)
- [DisplayHintSpec](MaapiSchemas/DisplayHintSpec.md#displayhintspec-2ef2e6b2ec31)
- [DisplayHintTypeMethodsImpl](MaapiSchemas/DisplayHintTypeMethodsImpl.md#displayhinttypemethodsimpl-4e5e33460120)
- [EnumTypeMethodsImpl](MaapiSchemas/EnumTypeMethodsImpl.md#enumtypemethodsimpl-ec9eb997f38a)
- [IdentityTypeMethodsImpl](MaapiSchemas/IdentityTypeMethodsImpl.md#identitytypemethodsimpl-de3e83445476)
- [ListRestrictionTypeMethodsImpl](MaapiSchemas/ListRestrictionTypeMethodsImpl.md#listrestrictiontypemethodsimpl-e62d7f553207)
- [ListTypeMethodsImpl](MaapiSchemas/ListTypeMethodsImpl.md#listtypemethodsimpl-5d3c814cc49d)
- [MountId](MaapiSchemas/MountId.md#mountid-702a10803d00)
- [MountIdLRUMap](MaapiSchemas/MountIdLRUMap.md#mountidlrumap-977210c3c8c8)
- [RetrictedNumberTypeMethodsImpl](MaapiSchemas/RetrictedNumberTypeMethodsImpl.md#retrictednumbertypemethodsimpl-b401efda450f)
- [StringTypeMethodsImpl](MaapiSchemas/StringTypeMethodsImpl.md#stringtypemethodsimpl-68d35cd5ffbc)
- [UnionTypeMethodsImpl](MaapiSchemas/UnionTypeMethodsImpl.md#uniontypemethodsimpl-0df74c7efe0e)

## Constructors

### MaapiSchemas(String[]) <a href="#maapischemas-6fe3b955b5b9" id="maapischemas-6fe3b955b5b9"></a>

```java
protected MaapiSchemas(String[] namespaceURIs)
```

Construct a new MaapiSchema instance that can be used to handle
 schemas. Need to call MaapiSchemas#init(Socket) before it can
 be used.

 Only for internal usage.

**Parameters**

- `String[] namespaceURIs` - Namespaces to load, if null or empty load all
                      namespaces.


## Fields

### address <a href="#address-7f51d5da91c5" id="address-7f51d5da91c5"></a>

```java
protected java.net.SocketAddress address = null;
```

### CS_DOC_DESCRIPTION <a href="#cs_doc_description-ffc1186764ad" id="cs_doc_description-ffc1186764ad"></a>

**Package-private**

```java
static final int CS_DOC_DESCRIPTION = 2;
```

### CS_DOC_HIDDEN <a href="#cs_doc_hidden-58c23b73349c" id="cs_doc_hidden-58c23b73349c"></a>

**Package-private**

```java
static final int CS_DOC_HIDDEN = 3;
```

### CS_DOC_PROMPT <a href="#cs_doc_prompt-f987d8b9104b" id="cs_doc_prompt-f987d8b9104b"></a>

**Package-private**

```java
static final int CS_DOC_PROMPT = 1;
```

DocData InfoType constant used to tag
 documentation strings sent from server

### hashToStringTab <a href="#hashtostringtab-03883a433398" id="hashtostringtab-03883a433398"></a>

```java
protected java.util.Map<Integer,String> hashToStringTab = null;
```

### mnsMaps <a href="#mnsmaps-a12c27d721ed" id="mnsmaps-a12c27d721ed"></a>

```java
protected java.util.Map<java.util.List<String>,com.tailf.maapi.MaapiSchemas.CSMNsMap> mnsMaps = null;
```

Types: [CSMNsMap](MaapiSchemas/CSMNsMap.md#csmnsmap-1123c939e6bb)

### NO_EXISTS_TYPE <a href="#no_exists_type-fb96f522b2a7" id="no_exists_type-fb96f522b2a7"></a>

```java
public static final com.tailf.conf.ConfNoExists NO_EXISTS_TYPE = null;
```

Types: [ConfNoExists](../conf/ConfNoExists.md#confnoexists-bdcf8f2c7ab9)

### schemas <a href="#schemas-d9de6465eb56" id="schemas-d9de6465eb56"></a>

```java
protected java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemas = null;
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#csschema-f51a58180f67)

### specifiedNSURIs <a href="#specifiednsuris-e324f1795591" id="specifiednsuris-e324f1795591"></a>

```java
protected final String[] specifiedNSURIs = null;
```

### stringToHashTab <a href="#stringtohashtab-05ebd3f0b9a0" id="stringtohashtab-05ebd3f0b9a0"></a>

```java
protected java.util.Map<String,Integer> stringToHashTab = null;
```


## Methods

### clearMountIdCache() <a href="#clearmountidcache-78b7d5916f44" id="clearmountidcache-78b7d5916f44"></a>

```java
public void clearMountIdCache()
```

### compileDisplayHint(byte[]) <a href="#compiledisplayhint-da77fd4fc4a5" id="compiledisplayhint-da77fd4fc4a5"></a>

```java
public static java.util.List<com.tailf.maapi.MaapiSchemas.DisplayHintSpec> compileDisplayHint(
    byte[] bin
)
    throws com.tailf.maapi.MaapiException
```

Types: [DisplayHintSpec](MaapiSchemas/DisplayHintSpec.md#displayhintspec-2ef2e6b2ec31), [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

**Parameters**

- `byte[] bin`

### convertMountId(ConfEObject[]) <a href="#convertmountid-dd57936915c7" id="convertmountid-dd57936915c7"></a>

```java
public java.util.List<String> convertMountId(
    com.tailf.proto.ConfEObject[] eObjs
)
    throws com.tailf.maapi.MaapiException
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

**Parameters**

- `com.tailf.proto.ConfEObject[] eObjs`

### convertMountId(Map&lt;Integer,CSSchema&gt;, ConfEObject) <a href="#convertmountid-2b8b82ff2d45" id="convertmountid-2b8b82ff2d45"></a>

```java
public String convertMountId(
    java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemastable,
    com.tailf.proto.ConfEObject obj
)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#csschema-f51a58180f67), [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350)

**Parameters**

- `java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemastable`
- `com.tailf.proto.ConfEObject obj`

### convertMountIdHash(Map&lt;Integer,CSSchema&gt;, int, int) <a href="#convertmountidhash-20aca1c9464f" id="convertmountidhash-20aca1c9464f"></a>

```java
public String convertMountIdHash(
    java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemastable,
    int nsHash,
    int tagHash
)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#csschema-f51a58180f67)

**Parameters**

- `java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemastable`
- `int nsHash`
- `int tagHash`

### currentMountIdCacheSize() <a href="#currentmountidcachesize-54e5c11ad163" id="currentmountidcachesize-54e5c11ad163"></a>

```java
public int currentMountIdCacheSize()
```

### findCSMNsMap(List&lt;String&gt;) <a href="#findcsmnsmap-522ac9ee9034" id="findcsmnsmap-522ac9ee9034"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSMNsMap findCSMNsMap(java.util.List<String> mountId)
```

Types: [CSMNsMap](MaapiSchemas/CSMNsMap.md#csmnsmap-1123c939e6bb)

**Parameters**

- `java.util.List<String> mountId`

### findCSMNsMap(String) <a href="#findcsmnsmap-026c4103f2ca" id="findcsmnsmap-026c4103f2ca"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSMNsMap findCSMNsMap(String mountId)
```

Types: [CSMNsMap](MaapiSchemas/CSMNsMap.md#csmnsmap-1123c939e6bb)

**Parameters**

- `String mountId`

### findCSNode(CSNode, CSMNsMap, String) <a href="#findcsnode-31950d190712" id="findcsnode-31950d190712"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSNode(
    com.tailf.maapi.MaapiSchemas.CSNode parent,
    com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap,
    String xmltagName
)
```

Types: [CSNode](MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [CSMNsMap](MaapiSchemas/CSMNsMap.md#csmnsmap-1123c939e6bb)

Retrieve a specific node with a given parent node identified by xmltag
 all namespaces in a mnsmap and tagname

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode parent` - parent node
- `com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap`
- `String xmltagName`

**Returns:** CSNode or null if not found

### findCSNode(CSNode, int, int) <a href="#findcsnode-052de3dda313" id="findcsnode-052de3dda313"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSNode(
    com.tailf.maapi.MaapiSchemas.CSNode parent,
    int xmltagNShash,
    int xmltaghash
)
```

Types: [CSNode](MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

Find and retrieves specific node in the schema information tree.


 Retrieve a specific node with a given parent node identified by xmltag
 namespace hash and tagname hash

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode parent` - parent node
- `int xmltagNShash` - namespace hash value
- `int xmltaghash` - tag hash which value

**Returns:** CSNode or null if not found

### findCSNode(CSNode, String, String) <a href="#findcsnode-5d43b475b623" id="findcsnode-5d43b475b623"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSNode(
    com.tailf.maapi.MaapiSchemas.CSNode parent,
    String xmltagNSName,
    String xmltagName
)
```

Types: [CSNode](MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

Retrieve a specific node with a given parent node identified by xmltag
 namespace and tagname

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode parent` - parent node
- `String xmltagNSName`
- `String xmltagName`

**Returns:** CSNode or null if not found

### findCSNode(MountIdInterface, String, List&lt;PathElement&gt;) <a href="#findcsnode-22bcb6b48b20" id="findcsnode-22bcb6b48b20"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSNode(
    com.tailf.conf.MountIdInterface mountGetter,
    String nsName,
    java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl
)
    throws com.tailf.maapi.MaapiException
```

Types: [CSNode](MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [MountIdInterface](../conf/MountIdInterface.md#mountidinterface-113d1b54dae0), [PathElement](../conf/gen/PathParser/PathElement.md#pathelement-30082145995b), [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

Internally used method to find a node defined by an internal path format

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter` - if such exists or else null
- `String nsName`
- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl`

**Returns:** CSNode the found schema node or null if not found

**Throws**

- `MaapiException`

### findCSNode(MountIdInterface, String, String, Object[]) <a href="#findcsnode-33ce42d47da2" id="findcsnode-33ce42d47da2"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSNode(
    com.tailf.conf.MountIdInterface mountGetter,
    String nsName,
    String fmt,
    Object[] arguments
)
    throws com.tailf.maapi.MaapiException
```

Types: [CSNode](MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [MountIdInterface](../conf/MountIdInterface.md#mountidinterface-113d1b54dae0), [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

Find and retrieves specific node in the schema information tree.



 Get a node identified by an namespace string which is the string that
 appears in the yang models namespace statement.


 If a yang model extends another yang model, through the augment
 statement then then the namespace string should be the string
 present in the the top yang model,
 (the yang model which contains the augment statement).



 The `fmt` is either a keypath or tagpath (path not
 containing keys).

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter` - if such exists or else null
- `String nsName` - namespace string that appears in a yang model.
- `String fmt` - keypath or tagpath that leads to the node
- `Object[] arguments` - for % substitution in fmt

**Returns:** MaapiSchemas.CSNode the node identified by the path or null if
         not found

**Throws**

- `MaapiException`

### findCSNode(String, String, Object[]) <a href="#findcsnode-9fc05e189266" id="findcsnode-9fc05e189266"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSNode(
    String nsName,
    String fmt,
    Object[] arguments
)
    throws com.tailf.maapi.MaapiException
```

Types: [CSNode](MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

**Parameters**

- `String nsName`
- `String fmt`
- `Object[] arguments`

### findCSRoot(int) <a href="#findcsroot-e71c532d0a72" id="findcsroot-e71c532d0a72"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSRoot(int nshash)
```

Types: [CSNode](MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

Retrieve a specific root node identified by an hash value

**Parameters**

- `int nshash` - integer hash value representing the root node

**Returns:** CSNode root node or null if not found

### findCSRoot(String) <a href="#findcsroot-ed8e95df57fe" id="findcsroot-ed8e95df57fe"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSRoot(String nsName)
```

Types: [CSNode](MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

Retrieve a specific root node identified by an namespace string

**Parameters**

- `String nsName` - a string contain the full namespace name

**Returns:** CSNode root node or null if not found

### findCSSchema(int) <a href="#findcsschema-880b1533ffd2" id="findcsschema-880b1533ffd2"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSSchema findCSSchema(int nsHash)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#csschema-f51a58180f67)

Retrieve a specified schema identified by an hash value

**Parameters**

- `int nsHash` - integer hash value representing the namespace

**Returns:** CSSchemaobject for the identified Namespace of null if not found

### findCSSchema(String) <a href="#findcsschema-6023156b0628" id="findcsschema-6023156b0628"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSSchema findCSSchema(String nsName)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#csschema-f51a58180f67)

Retrieve a specific schema identified by an namespace string

**Parameters**

- `String nsName` - a string contain the full namespace name

**Returns:** CSSchema object for the identified namespace or null if not
         found.

### findCSSchemaByPrefix(String) <a href="#findcsschemabyprefix-d5a2976f05ae" id="findcsschemabyprefix-d5a2976f05ae"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSSchema findCSSchemaByPrefix(String prefix)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#csschema-f51a58180f67)

**Parameters**

- `String prefix`

### findCSSchemaFromUniqueRoot(int) <a href="#findcsschemafromuniqueroot-655331fd3352" id="findcsschemafromuniqueroot-655331fd3352"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSSchema findCSSchemaFromUniqueRoot(int rootHash)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#csschema-f51a58180f67)

Returns schema for root node. This requires the root node to be
 unique in all known schemas. Otherwise null is returned.

**Parameters**

- `int rootHash` - hash for root node

**Returns:** CSSchema the schema having the tag as root

### findCSSchemaFromUniqueRoot(String) <a href="#findcsschemafromuniqueroot-6a2bcf9dd24b" id="findcsschemafromuniqueroot-6a2bcf9dd24b"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSSchema findCSSchemaFromUniqueRoot(String rootTagName)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#csschema-f51a58180f67)

Returns schema for root node. This requires the root node to be
 unique in all known schemas. Otherwise null is returned.

**Parameters**

- `String rootTagName` - root tagname as string

**Returns:** CSSchema the schema having the tag as root

### findMountId(Map&lt;Integer,CSSchema&gt;, ConfEObject) <a href="#findmountid-2786e1d58129" id="findmountid-2786e1d58129"></a>

```java
public com.tailf.maapi.MaapiSchemas.MountId findMountId(
    java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemastable,
    com.tailf.proto.ConfEObject obj
)
```

Types: [MountId](MaapiSchemas/MountId.md#mountid-702a10803d00), [CSSchema](MaapiSchemas/CSSchema.md#csschema-f51a58180f67), [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350)

**Parameters**

- `java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemastable`
- `com.tailf.proto.ConfEObject obj`

### findMountId(Map&lt;Integer,CSSchema&gt;, int, int) <a href="#findmountid-9807a9bfdddb" id="findmountid-9807a9bfdddb"></a>

```java
protected com.tailf.maapi.MaapiSchemas.MountId findMountId(
    java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemastable,
    int nsHash,
    int tagHash
)
```

Types: [MountId](MaapiSchemas/MountId.md#mountid-702a10803d00), [CSSchema](MaapiSchemas/CSSchema.md#csschema-f51a58180f67)

**Parameters**

- `java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemastable`
- `int nsHash`
- `int tagHash`

### findSchema(Map&lt;Integer,CSSchema&gt;, int) <a href="#findschema-b4d435858143" id="findschema-b4d435858143"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSSchema findSchema(
    java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemas,
    int nsHash
)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#csschema-f51a58180f67)

**Parameters**

- `java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemas`
- `int nsHash`

### findSchema(Map&lt;Integer,CSSchema&gt;, int, String, String, String, String) <a href="#findschema-51a71cd5c850" id="findschema-51a71cd5c850"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSSchema findSchema(
    java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemas,
    int nsHash,
    String uri,
    String prefix,
    String revision,
    String module
)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#csschema-f51a58180f67)

**Parameters**

- `java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemas`
- `int nsHash`
- `String uri`
- `String prefix`
- `String revision`
- `String module`

### getConfdType(String) <a href="#getconfdtype-0b0b4b688106" id="getconfdtype-0b0b4b688106"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSType getConfdType(String name)
```

Types: [CSType](MaapiSchemas/CSType.md#cstype-8bf086cc0595)

**Parameters**

- `String name`

**Returns:** CSType

### getLoadedMNsMaps() <a href="#getloadedmnsmaps-9eef39dd2fe7" id="getloadedmnsmaps-9eef39dd2fe7"></a>

```java
public java.util.Collection<com.tailf.maapi.MaapiSchemas.CSMNsMap> getLoadedMNsMaps()
```

Types: [CSMNsMap](MaapiSchemas/CSMNsMap.md#csmnsmap-1123c939e6bb)

### getLoadedSchemas() <a href="#getloadedschemas-fe2966b5baf6" id="getloadedschemas-fe2966b5baf6"></a>

```java
public java.util.Collection<com.tailf.maapi.MaapiSchemas.CSSchema> getLoadedSchemas()
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#csschema-f51a58180f67)

get all loaded schemas as a Collection of CSSchema objects

**Returns:** Collection of CSSchema objects

### getMountId(MountIdInterface, ConfPath) <a href="#getmountid-a4d23d966af3" id="getmountid-a4d23d966af3"></a>

```java
public java.util.List<String> getMountId(
    com.tailf.conf.MountIdInterface midif,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MountIdInterface](../conf/MountIdInterface.md#mountidinterface-113d1b54dae0), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.MountIdInterface midif`
- `com.tailf.conf.ConfPath path`

### getRootMountId() <a href="#getrootmountid-542ecf8e1ac1" id="getrootmountid-542ecf8e1ac1"></a>

```java
public static java.util.List<String> getRootMountId()
```

### getThreadDefaultMountId() <a href="#getthreaddefaultmountid-c72bbe29ad4d" id="getthreaddefaultmountid-c72bbe29ad4d"></a>

```java
public static java.util.List<String> getThreadDefaultMountId()
```

### hashToString(int) <a href="#hashtostring-54eaaef71976" id="hashtostring-54eaaef71976"></a>

```java
public String hashToString(int tagHash)
```

Convert from hash value to String value for a specified tag.

**Parameters**

- `int tagHash` - hash value for tag

**Returns:** String value or null if not found

### init(Socket) <a href="#init-1f83ed7f5091" id="init-1f83ed7f5091"></a>

```java
protected com.tailf.maapi.MaapiSchemas init(
    java.net.Socket socket
)
    throws com.tailf.maapi.MaapiException
```

Types: [MaapiSchemas](MaapiSchemas.md#maapischemas-821ac70b83b7), [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

Initialization method for a new MaapiSchemas instance.

 Only for internal usage.

**Parameters**

- `java.net.Socket socket` - Socket connected to NSO that should be used to load schemas

**Returns:** An initialized instance

**Throws**

- `MaapiException` - if an error occurs during loading of schemas.

### mkInitializedMaapiSchemas(String[], Socket) <a href="#mkinitializedmaapischemas-22e4830ffd3c" id="mkinitializedmaapischemas-22e4830ffd3c"></a>

```java
protected static com.tailf.maapi.MaapiSchemas mkInitializedMaapiSchemas(
    String[] namespaceURIs,
    java.net.Socket socket
)
    throws com.tailf.maapi.MaapiException
```

Types: [MaapiSchemas](MaapiSchemas.md#maapischemas-821ac70b83b7), [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

**Parameters**

- `String[] namespaceURIs`
- `java.net.Socket socket`

### registerSchemaRoot(CSSchema) <a href="#registerschemaroot-0a458f575f6a" id="registerschemaroot-0a458f575f6a"></a>

```java
protected void registerSchemaRoot(com.tailf.maapi.MaapiSchemas.CSSchema csschema)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#csschema-f51a58180f67)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSSchema csschema`

### removeMountIdCachePath(ConfPath) <a href="#removemountidcachepath-e2f9028697a6" id="removemountidcachepath-e2f9028697a6"></a>

```java
public void removeMountIdCachePath(com.tailf.conf.ConfPath path)
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d)

**Parameters**

- `com.tailf.conf.ConfPath path`

### setThreadDefaultMountId(List&lt;String&gt;) <a href="#setthreaddefaultmountid-9a20aed46fad" id="setthreaddefaultmountid-9a20aed46fad"></a>

```java
public static void setThreadDefaultMountId(java.util.List<String> mountId)
```

**Parameters**

- `java.util.List<String> mountId`

### stringToHash(String) <a href="#stringtohash-7c2af24796ac" id="stringtohash-7c2af24796ac"></a>

```java
public int stringToHash(String tagString)
```

Convert from String value to hash value for a specified tag.

**Parameters**

- `String tagString`

**Returns:** integer hash value or zero if not found.

### stringToValue(CSType, String) <a href="#stringtovalue-9fef98be9bb2" id="stringtovalue-9fef98be9bb2"></a>

```java
public com.tailf.conf.ConfValue stringToValue(
    com.tailf.maapi.MaapiSchemas.CSType type,
    String str
)
    throws com.tailf.maapi.MaapiException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [CSType](MaapiSchemas/CSType.md#cstype-8bf086cc0595), [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

parse value located in str and convert to ConfValue, the value is
 validated.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type` - - type for the converted value
- `String str` - - string representation of the value

**Returns:** ConfValue for the corresponding type

**Throws**

- `MaapiException`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

### valueToString(CSType, ConfValue) <a href="#valuetostring-f281f6b6d7d7" id="valuetostring-f281f6b6d7d7"></a>

```java
public String valueToString(com.tailf.maapi.MaapiSchemas.CSType type, com.tailf.conf.ConfValue val)
```

Types: [CSType](MaapiSchemas/CSType.md#cstype-8bf086cc0595), [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d)

convert to string representation for the corresponding ConfValue

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type` - - type for the converted value
- `com.tailf.conf.ConfValue val` - - ConfValue

**Returns:** String representation of the value


## Nested Types

- [BitsTypeMethodsImpl](MaapiSchemas/BitsTypeMethodsImpl.md#bitstypemethodsimpl-ab532a8104f1)
- [CSBit](MaapiSchemas/CSBit.md#csbit-632d615b1a7c)
- [CSCase](MaapiSchemas/CSCase.md#cscase-26937f56b18d)
- [CSChoice](MaapiSchemas/CSChoice.md#cschoice-7d5d5dd71270)
- [CSEnum](MaapiSchemas/CSEnum.md#csenum-fb14e528a3f2)
- [CSIdref](MaapiSchemas/CSIdref.md#csidref-ad9cd0da8b26)
- [CSMNsMap](MaapiSchemas/CSMNsMap.md#csmnsmap-1123c939e6bb)
- [CSNamedType](MaapiSchemas/CSNamedType.md#csnamedtype-6305f923b0f3)
- [CSNode](MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)
- [CSNodeInfo](MaapiSchemas/CSNodeInfo.md#csnodeinfo-aad17d6161cc)
- [CSNodeType](MaapiSchemas/CSNodeType.md#csnodetype-c43320d71626)
- [CSSchema](MaapiSchemas/CSSchema.md#csschema-f51a58180f67)
- [CSShallowType](MaapiSchemas/CSShallowType.md#csshallowtype-383e8e4d58c6)
- [CSStringLength](MaapiSchemas/CSStringLength.md#csstringlength-f40944c587da)
- [CSStringRestriction](MaapiSchemas/CSStringRestriction.md#csstringrestriction-bde26fa14e67)
- [CSType](MaapiSchemas/CSType.md#cstype-8bf086cc0595)
- [CSTypeBits](MaapiSchemas/CSTypeBits.md#cstypebits-9c6ae99aa2fc)
- [CSTypeMethods](MaapiSchemas/CSTypeMethods.md#cstypemethods-41a37625616b)
- [CSTypeRange](MaapiSchemas/CSTypeRange.md#cstyperange-3ed2b19cd40b)
- [Decimal64TypeMethodsImpl](MaapiSchemas/Decimal64TypeMethodsImpl.md#decimal64typemethodsimpl-e475a1fe77d6)
- [DisplayHintSpec](MaapiSchemas/DisplayHintSpec.md#displayhintspec-2ef2e6b2ec31)
- [DisplayHintTypeMethodsImpl](MaapiSchemas/DisplayHintTypeMethodsImpl.md#displayhinttypemethodsimpl-4e5e33460120)
- [EnumTypeMethodsImpl](MaapiSchemas/EnumTypeMethodsImpl.md#enumtypemethodsimpl-ec9eb997f38a)
- [IdentityTypeMethodsImpl](MaapiSchemas/IdentityTypeMethodsImpl.md#identitytypemethodsimpl-de3e83445476)
- [ListRestrictionTypeMethodsImpl](MaapiSchemas/ListRestrictionTypeMethodsImpl.md#listrestrictiontypemethodsimpl-e62d7f553207)
- [ListTypeMethodsImpl](MaapiSchemas/ListTypeMethodsImpl.md#listtypemethodsimpl-5d3c814cc49d)
- [MountId](MaapiSchemas/MountId.md#mountid-702a10803d00)
- [MountIdLRUMap](MaapiSchemas/MountIdLRUMap.md#mountidlrumap-977210c3c8c8)
- [RetrictedNumberTypeMethodsImpl](MaapiSchemas/RetrictedNumberTypeMethodsImpl.md#retrictednumbertypemethodsimpl-b401efda450f)
- [StringTypeMethodsImpl](MaapiSchemas/StringTypeMethodsImpl.md#stringtypemethodsimpl-68d35cd5ffbc)
- [UnionTypeMethodsImpl](MaapiSchemas/UnionTypeMethodsImpl.md#uniontypemethodsimpl-0df74c7efe0e)
