# MaapiSchemas <a href="#cls-MaapiSchemas" id="cls-MaapiSchemas"></a>

```java
public class com.tailf.maapi.MaapiSchemas
```

Handles the schema information from the data models loaded.

 It holds an offline tree structure where each node is represented by an
 instance of [`CSNode`](MaapiSchemas/CSNode.md#cls-CSNode) which in turn contains connections
 to other nodes.



 Methods exist to retrieve a specified schema [`CSSchema`](MaapiSchemas/CSSchema.md#cls-CSSchema)
 or a specified schema node
 [`findCSNode(String,String,Object...)`](MaapiSchemas.md#m-findCSNode-9fc05e189266),
 `findCSNode(MaapiSchemas.CSNode,String,String)`.



 All entities, including Schemas, Nodes, Types, Choices etc are
 represented as inner classes of `MaapiSchemas` and are stored
 in its offline tree hierarchy.



 These inner classes have methods to retrieve all information about the
 entity.


 Note that this class is self-contained in the sense that it does not use any
 locally compiled schemas i.e. ConfNamespace classes.



 There are methods for converting between hashes and strings:
 [`stringToHash(String)`](MaapiSchemas.md#m-stringToHash-7c2af24796ac) and [`hashToString(int)`](MaapiSchemas.md#m-hashToString-54eaaef71976)



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

- [MmapMaapiSchemas](../ncs/maapi/MmapMaapiSchemas.md#cls-MmapMaapiSchemas)

## Members

**Constructors**:

- [MaapiSchemas(String[])](#m-MaapiSchemas-6fe3b955b5b9)

**Fields**:

- [address](#m-address)
- [CS_DOC_DESCRIPTION](#m-CS_DOC_DESCRIPTION)
- [CS_DOC_HIDDEN](#m-CS_DOC_HIDDEN)
- [CS_DOC_PROMPT](#m-CS_DOC_PROMPT)
- [hashToStringTab](#m-hashToStringTab)
- [mnsMaps](#m-mnsMaps)
- [NO_EXISTS_TYPE](#m-NO_EXISTS_TYPE)
- [schemas](#m-schemas)
- [specifiedNSURIs](#m-specifiedNSURIs)
- [stringToHashTab](#m-stringToHashTab)

**Methods**:

- [clearMountIdCache()](#m-clearMountIdCache-78b7d5916f44)
- [compileDisplayHint(byte[])](#m-compileDisplayHint-da77fd4fc4a5)
- [convertMountId(ConfEObject[])](#m-convertMountId-dd57936915c7)
- [convertMountId(Map<Integer,CSSchema>, ConfEObject)](#m-convertMountId-2b8b82ff2d45)
- [convertMountIdHash(Map<Integer,CSSchema>, int, int)](#m-convertMountIdHash-20aca1c9464f)
- [currentMountIdCacheSize()](#m-currentMountIdCacheSize-54e5c11ad163)
- [findCSMNsMap(List<String>)](#m-findCSMNsMap-522ac9ee9034)
- [findCSMNsMap(String)](#m-findCSMNsMap-026c4103f2ca)
- [findCSNode(CSNode, CSMNsMap, String)](#m-findCSNode-31950d190712)
- [findCSNode(CSNode, int, int)](#m-findCSNode-052de3dda313)
- [findCSNode(CSNode, String, String)](#m-findCSNode-5d43b475b623)
- [findCSNode(MountIdInterface, String, List<PathElement>)](#m-findCSNode-22bcb6b48b20)
- [findCSNode(MountIdInterface, String, String, Object[])](#m-findCSNode-33ce42d47da2)
- [findCSNode(String, String, Object[])](#m-findCSNode-9fc05e189266)
- [findCSRoot(int)](#m-findCSRoot-e71c532d0a72)
- [findCSRoot(String)](#m-findCSRoot-ed8e95df57fe)
- [findCSSchema(int)](#m-findCSSchema-880b1533ffd2)
- [findCSSchema(String)](#m-findCSSchema-6023156b0628)
- [findCSSchemaByPrefix(String)](#m-findCSSchemaByPrefix-d5a2976f05ae)
- [findCSSchemaFromUniqueRoot(int)](#m-findCSSchemaFromUniqueRoot-655331fd3352)
- [findCSSchemaFromUniqueRoot(String)](#m-findCSSchemaFromUniqueRoot-6a2bcf9dd24b)
- [findMountId(Map<Integer,CSSchema>, ConfEObject)](#m-findMountId-2786e1d58129)
- [findMountId(Map<Integer,CSSchema>, int, int)](#m-findMountId-9807a9bfdddb)
- [findSchema(Map<Integer,CSSchema>, int)](#m-findSchema-b4d435858143)
- [findSchema(Map<Integer,CSSchema>, int, String, String, String, String)](#m-findSchema-51a71cd5c850)
- [getConfdType(String)](#m-getConfdType-0b0b4b688106)
- [getLoadedMNsMaps()](#m-getLoadedMNsMaps-9eef39dd2fe7)
- [getLoadedSchemas()](#m-getLoadedSchemas-fe2966b5baf6)
- [getMountId(MountIdInterface, ConfPath)](#m-getMountId-a4d23d966af3)
- [getRootMountId()](#m-getRootMountId-542ecf8e1ac1)
- [getThreadDefaultMountId()](#m-getThreadDefaultMountId-c72bbe29ad4d)
- [hashToString(int)](#m-hashToString-54eaaef71976)
- [init(Socket)](#m-init-1f83ed7f5091)
- [mkInitializedMaapiSchemas(String[], Socket)](#m-mkInitializedMaapiSchemas-22e4830ffd3c)
- [registerSchemaRoot(CSSchema)](#m-registerSchemaRoot-0a458f575f6a)
- [removeMountIdCachePath(ConfPath)](#m-removeMountIdCachePath-e2f9028697a6)
- [setThreadDefaultMountId(List<String>)](#m-setThreadDefaultMountId-9a20aed46fad)
- [stringToHash(String)](#m-stringToHash-7c2af24796ac)
- [stringToValue(CSType, String)](#m-stringToValue-9fef98be9bb2)
- [toString()](#m-toString-e9d48c5503ef)
- [valueToString(CSType, ConfValue)](#m-valueToString-f281f6b6d7d7)

**Nested Types**:

- [BitsTypeMethodsImpl](MaapiSchemas/BitsTypeMethodsImpl.md#cls-BitsTypeMethodsImpl)
- [CSBit](MaapiSchemas/CSBit.md#cls-CSBit)
- [CSCase](MaapiSchemas/CSCase.md#cls-CSCase)
- [CSChoice](MaapiSchemas/CSChoice.md#cls-CSChoice)
- [CSEnum](MaapiSchemas/CSEnum.md#cls-CSEnum)
- [CSIdref](MaapiSchemas/CSIdref.md#cls-CSIdref)
- [CSMNsMap](MaapiSchemas/CSMNsMap.md#cls-CSMNsMap)
- [CSNamedType](MaapiSchemas/CSNamedType.md#cls-CSNamedType)
- [CSNode](MaapiSchemas/CSNode.md#cls-CSNode)
- [CSNodeInfo](MaapiSchemas/CSNodeInfo.md#cls-CSNodeInfo)
- [CSNodeType](MaapiSchemas/CSNodeType.md#cls-CSNodeType)
- [CSSchema](MaapiSchemas/CSSchema.md#cls-CSSchema)
- [CSShallowType](MaapiSchemas/CSShallowType.md#cls-CSShallowType)
- [CSStringLength](MaapiSchemas/CSStringLength.md#cls-CSStringLength)
- [CSStringRestriction](MaapiSchemas/CSStringRestriction.md#cls-CSStringRestriction)
- [CSType](MaapiSchemas/CSType.md#cls-CSType)
- [CSTypeBits](MaapiSchemas/CSTypeBits.md#cls-CSTypeBits)
- [CSTypeMethods](MaapiSchemas/CSTypeMethods.md#cls-CSTypeMethods)
- [CSTypeRange](MaapiSchemas/CSTypeRange.md#cls-CSTypeRange)
- [Decimal64TypeMethodsImpl](MaapiSchemas/Decimal64TypeMethodsImpl.md#cls-Decimal64TypeMethodsImpl)
- [DisplayHintSpec](MaapiSchemas/DisplayHintSpec.md#cls-DisplayHintSpec)
- [DisplayHintTypeMethodsImpl](MaapiSchemas/DisplayHintTypeMethodsImpl.md#cls-DisplayHintTypeMethodsImpl)
- [EnumTypeMethodsImpl](MaapiSchemas/EnumTypeMethodsImpl.md#cls-EnumTypeMethodsImpl)
- [IdentityTypeMethodsImpl](MaapiSchemas/IdentityTypeMethodsImpl.md#cls-IdentityTypeMethodsImpl)
- [ListRestrictionTypeMethodsImpl](MaapiSchemas/ListRestrictionTypeMethodsImpl.md#cls-ListRestrictionTypeMethodsImpl)
- [ListTypeMethodsImpl](MaapiSchemas/ListTypeMethodsImpl.md#cls-ListTypeMethodsImpl)
- [MountId](MaapiSchemas/MountId.md#cls-MountId)
- [MountIdLRUMap](MaapiSchemas/MountIdLRUMap.md#cls-MountIdLRUMap)
- [RetrictedNumberTypeMethodsImpl](MaapiSchemas/RetrictedNumberTypeMethodsImpl.md#cls-RetrictedNumberTypeMethodsImpl)
- [StringTypeMethodsImpl](MaapiSchemas/StringTypeMethodsImpl.md#cls-StringTypeMethodsImpl)
- [UnionTypeMethodsImpl](MaapiSchemas/UnionTypeMethodsImpl.md#cls-UnionTypeMethodsImpl)

## Constructors

### MaapiSchemas(String[]) <a href="#m-MaapiSchemas-6fe3b955b5b9" id="m-MaapiSchemas-6fe3b955b5b9"></a>

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

### address <a href="#m-address" id="m-address"></a>

```java
protected java.net.SocketAddress address = null;
```

### CS_DOC_DESCRIPTION <a href="#m-CS_DOC_DESCRIPTION" id="m-CS_DOC_DESCRIPTION"></a>

**Package-private**

```java
static final int CS_DOC_DESCRIPTION = 2;
```

### CS_DOC_HIDDEN <a href="#m-CS_DOC_HIDDEN" id="m-CS_DOC_HIDDEN"></a>

**Package-private**

```java
static final int CS_DOC_HIDDEN = 3;
```

### CS_DOC_PROMPT <a href="#m-CS_DOC_PROMPT" id="m-CS_DOC_PROMPT"></a>

**Package-private**

```java
static final int CS_DOC_PROMPT = 1;
```

DocData InfoType constant used to tag
 documentation strings sent from server

### hashToStringTab <a href="#m-hashToStringTab" id="m-hashToStringTab"></a>

```java
protected java.util.Map<Integer,String> hashToStringTab = null;
```

### mnsMaps <a href="#m-mnsMaps" id="m-mnsMaps"></a>

```java
protected java.util.Map<java.util.List<String>,com.tailf.maapi.MaapiSchemas.CSMNsMap> mnsMaps = null;
```

Types: [CSMNsMap](MaapiSchemas/CSMNsMap.md#cls-CSMNsMap)

### NO_EXISTS_TYPE <a href="#m-NO_EXISTS_TYPE" id="m-NO_EXISTS_TYPE"></a>

```java
public static final com.tailf.conf.ConfNoExists NO_EXISTS_TYPE = null;
```

Types: [ConfNoExists](../conf/ConfNoExists.md#cls-ConfNoExists)

### schemas <a href="#m-schemas" id="m-schemas"></a>

```java
protected java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemas = null;
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#cls-CSSchema)

### specifiedNSURIs <a href="#m-specifiedNSURIs" id="m-specifiedNSURIs"></a>

```java
protected final String[] specifiedNSURIs = null;
```

### stringToHashTab <a href="#m-stringToHashTab" id="m-stringToHashTab"></a>

```java
protected java.util.Map<String,Integer> stringToHashTab = null;
```


## Methods

### clearMountIdCache() <a href="#m-clearMountIdCache-78b7d5916f44" id="m-clearMountIdCache-78b7d5916f44"></a>

```java
public void clearMountIdCache()
```

### compileDisplayHint(byte[]) <a href="#m-compileDisplayHint-da77fd4fc4a5" id="m-compileDisplayHint-da77fd4fc4a5"></a>

```java
public static java.util.List<com.tailf.maapi.MaapiSchemas.DisplayHintSpec> compileDisplayHint(
    byte[] bin
)
    throws com.tailf.maapi.MaapiException
```

Types: [DisplayHintSpec](MaapiSchemas/DisplayHintSpec.md#cls-DisplayHintSpec), [MaapiException](MaapiException.md#cls-MaapiException)

**Parameters**

- `byte[] bin`

### convertMountId(ConfEObject[]) <a href="#m-convertMountId-dd57936915c7" id="m-convertMountId-dd57936915c7"></a>

```java
public java.util.List<String> convertMountId(
    com.tailf.proto.ConfEObject[] eObjs
)
    throws com.tailf.maapi.MaapiException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [MaapiException](MaapiException.md#cls-MaapiException)

**Parameters**

- `com.tailf.proto.ConfEObject[] eObjs`

### convertMountId(Map<Integer,CSSchema>, ConfEObject) <a href="#m-convertMountId-2b8b82ff2d45" id="m-convertMountId-2b8b82ff2d45"></a>

```java
public String convertMountId(
    java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemastable,
    com.tailf.proto.ConfEObject obj
)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#cls-CSSchema), [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

**Parameters**

- `java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemastable`
- `com.tailf.proto.ConfEObject obj`

### convertMountIdHash(Map<Integer,CSSchema>, int, int) <a href="#m-convertMountIdHash-20aca1c9464f" id="m-convertMountIdHash-20aca1c9464f"></a>

```java
public String convertMountIdHash(
    java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemastable,
    int nsHash,
    int tagHash
)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#cls-CSSchema)

**Parameters**

- `java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemastable`
- `int nsHash`
- `int tagHash`

### currentMountIdCacheSize() <a href="#m-currentMountIdCacheSize-54e5c11ad163" id="m-currentMountIdCacheSize-54e5c11ad163"></a>

```java
public int currentMountIdCacheSize()
```

### findCSMNsMap(List<String>) <a href="#m-findCSMNsMap-522ac9ee9034" id="m-findCSMNsMap-522ac9ee9034"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSMNsMap findCSMNsMap(java.util.List<String> mountId)
```

Types: [CSMNsMap](MaapiSchemas/CSMNsMap.md#cls-CSMNsMap)

**Parameters**

- `java.util.List<String> mountId`

### findCSMNsMap(String) <a href="#m-findCSMNsMap-026c4103f2ca" id="m-findCSMNsMap-026c4103f2ca"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSMNsMap findCSMNsMap(String mountId)
```

Types: [CSMNsMap](MaapiSchemas/CSMNsMap.md#cls-CSMNsMap)

**Parameters**

- `String mountId`

### findCSNode(CSNode, CSMNsMap, String) <a href="#m-findCSNode-31950d190712" id="m-findCSNode-31950d190712"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSNode(
    com.tailf.maapi.MaapiSchemas.CSNode parent,
    com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap,
    String xmltagName
)
```

Types: [CSNode](MaapiSchemas/CSNode.md#cls-CSNode), [CSMNsMap](MaapiSchemas/CSMNsMap.md#cls-CSMNsMap)

Retrieve a specific node with a given parent node identified by xmltag
 all namespaces in a mnsmap and tagname

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode parent` - parent node
- `com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap`
- `String xmltagName`

**Returns:** CSNode or null if not found

### findCSNode(CSNode, int, int) <a href="#m-findCSNode-052de3dda313" id="m-findCSNode-052de3dda313"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSNode(
    com.tailf.maapi.MaapiSchemas.CSNode parent,
    int xmltagNShash,
    int xmltaghash
)
```

Types: [CSNode](MaapiSchemas/CSNode.md#cls-CSNode)

Find and retrieves specific node in the schema information tree.


 Retrieve a specific node with a given parent node identified by xmltag
 namespace hash and tagname hash

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode parent` - parent node
- `int xmltagNShash` - namespace hash value
- `int xmltaghash` - tag hash which value

**Returns:** CSNode or null if not found

### findCSNode(CSNode, String, String) <a href="#m-findCSNode-5d43b475b623" id="m-findCSNode-5d43b475b623"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSNode(
    com.tailf.maapi.MaapiSchemas.CSNode parent,
    String xmltagNSName,
    String xmltagName
)
```

Types: [CSNode](MaapiSchemas/CSNode.md#cls-CSNode)

Retrieve a specific node with a given parent node identified by xmltag
 namespace and tagname

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode parent` - parent node
- `String xmltagNSName`
- `String xmltagName`

**Returns:** CSNode or null if not found

### findCSNode(MountIdInterface, String, List<PathElement>) <a href="#m-findCSNode-22bcb6b48b20" id="m-findCSNode-22bcb6b48b20"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSNode(
    com.tailf.conf.MountIdInterface mountGetter,
    String nsName,
    java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl
)
    throws com.tailf.maapi.MaapiException
```

Types: [CSNode](MaapiSchemas/CSNode.md#cls-CSNode), [MountIdInterface](../conf/MountIdInterface.md#cls-MountIdInterface), [PathElement](../conf/gen/PathParser/PathElement.md#cls-PathElement), [MaapiException](MaapiException.md#cls-MaapiException)

Internally used method to find a node defined by an internal path format

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter` - if such exists or else null
- `String nsName`
- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl`

**Returns:** CSNode the found schema node or null if not found

**Throws**

- `MaapiException`

### findCSNode(MountIdInterface, String, String, Object[]) <a href="#m-findCSNode-33ce42d47da2" id="m-findCSNode-33ce42d47da2"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSNode(
    com.tailf.conf.MountIdInterface mountGetter,
    String nsName,
    String fmt,
    Object[] arguments
)
    throws com.tailf.maapi.MaapiException
```

Types: [CSNode](MaapiSchemas/CSNode.md#cls-CSNode), [MountIdInterface](../conf/MountIdInterface.md#cls-MountIdInterface), [MaapiException](MaapiException.md#cls-MaapiException)

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

### findCSNode(String, String, Object[]) <a href="#m-findCSNode-9fc05e189266" id="m-findCSNode-9fc05e189266"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSNode(
    String nsName,
    String fmt,
    Object[] arguments
)
    throws com.tailf.maapi.MaapiException
```

Types: [CSNode](MaapiSchemas/CSNode.md#cls-CSNode), [MaapiException](MaapiException.md#cls-MaapiException)

**Parameters**

- `String nsName`
- `String fmt`
- `Object[] arguments`

### findCSRoot(int) <a href="#m-findCSRoot-e71c532d0a72" id="m-findCSRoot-e71c532d0a72"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSRoot(int nshash)
```

Types: [CSNode](MaapiSchemas/CSNode.md#cls-CSNode)

Retrieve a specific root node identified by an hash value

**Parameters**

- `int nshash` - integer hash value representing the root node

**Returns:** CSNode root node or null if not found

### findCSRoot(String) <a href="#m-findCSRoot-ed8e95df57fe" id="m-findCSRoot-ed8e95df57fe"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSRoot(String nsName)
```

Types: [CSNode](MaapiSchemas/CSNode.md#cls-CSNode)

Retrieve a specific root node identified by an namespace string

**Parameters**

- `String nsName` - a string contain the full namespace name

**Returns:** CSNode root node or null if not found

### findCSSchema(int) <a href="#m-findCSSchema-880b1533ffd2" id="m-findCSSchema-880b1533ffd2"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSSchema findCSSchema(int nsHash)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#cls-CSSchema)

Retrieve a specified schema identified by an hash value

**Parameters**

- `int nsHash` - integer hash value representing the namespace

**Returns:** CSSchemaobject for the identified Namespace of null if not found

### findCSSchema(String) <a href="#m-findCSSchema-6023156b0628" id="m-findCSSchema-6023156b0628"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSSchema findCSSchema(String nsName)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#cls-CSSchema)

Retrieve a specific schema identified by an namespace string

**Parameters**

- `String nsName` - a string contain the full namespace name

**Returns:** CSSchema object for the identified namespace or null if not
         found.

### findCSSchemaByPrefix(String) <a href="#m-findCSSchemaByPrefix-d5a2976f05ae" id="m-findCSSchemaByPrefix-d5a2976f05ae"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSSchema findCSSchemaByPrefix(String prefix)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#cls-CSSchema)

**Parameters**

- `String prefix`

### findCSSchemaFromUniqueRoot(int) <a href="#m-findCSSchemaFromUniqueRoot-655331fd3352" id="m-findCSSchemaFromUniqueRoot-655331fd3352"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSSchema findCSSchemaFromUniqueRoot(int rootHash)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#cls-CSSchema)

Returns schema for root node. This requires the root node to be
 unique in all known schemas. Otherwise null is returned.

**Parameters**

- `int rootHash` - hash for root node

**Returns:** CSSchema the schema having the tag as root

### findCSSchemaFromUniqueRoot(String) <a href="#m-findCSSchemaFromUniqueRoot-6a2bcf9dd24b" id="m-findCSSchemaFromUniqueRoot-6a2bcf9dd24b"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSSchema findCSSchemaFromUniqueRoot(String rootTagName)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#cls-CSSchema)

Returns schema for root node. This requires the root node to be
 unique in all known schemas. Otherwise null is returned.

**Parameters**

- `String rootTagName` - root tagname as string

**Returns:** CSSchema the schema having the tag as root

### findMountId(Map<Integer,CSSchema>, ConfEObject) <a href="#m-findMountId-2786e1d58129" id="m-findMountId-2786e1d58129"></a>

```java
public com.tailf.maapi.MaapiSchemas.MountId findMountId(
    java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemastable,
    com.tailf.proto.ConfEObject obj
)
```

Types: [MountId](MaapiSchemas/MountId.md#cls-MountId), [CSSchema](MaapiSchemas/CSSchema.md#cls-CSSchema), [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

**Parameters**

- `java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemastable`
- `com.tailf.proto.ConfEObject obj`

### findMountId(Map<Integer,CSSchema>, int, int) <a href="#m-findMountId-9807a9bfdddb" id="m-findMountId-9807a9bfdddb"></a>

```java
protected com.tailf.maapi.MaapiSchemas.MountId findMountId(
    java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemastable,
    int nsHash,
    int tagHash
)
```

Types: [MountId](MaapiSchemas/MountId.md#cls-MountId), [CSSchema](MaapiSchemas/CSSchema.md#cls-CSSchema)

**Parameters**

- `java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemastable`
- `int nsHash`
- `int tagHash`

### findSchema(Map<Integer,CSSchema>, int) <a href="#m-findSchema-b4d435858143" id="m-findSchema-b4d435858143"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSSchema findSchema(
    java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemas,
    int nsHash
)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#cls-CSSchema)

**Parameters**

- `java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemas`
- `int nsHash`

### findSchema(Map<Integer,CSSchema>, int, String, String, String, String) <a href="#m-findSchema-51a71cd5c850" id="m-findSchema-51a71cd5c850"></a>

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

Types: [CSSchema](MaapiSchemas/CSSchema.md#cls-CSSchema)

**Parameters**

- `java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemas`
- `int nsHash`
- `String uri`
- `String prefix`
- `String revision`
- `String module`

### getConfdType(String) <a href="#m-getConfdType-0b0b4b688106" id="m-getConfdType-0b0b4b688106"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSType getConfdType(String name)
```

Types: [CSType](MaapiSchemas/CSType.md#cls-CSType)

**Parameters**

- `String name`

**Returns:** CSType

### getLoadedMNsMaps() <a href="#m-getLoadedMNsMaps-9eef39dd2fe7" id="m-getLoadedMNsMaps-9eef39dd2fe7"></a>

```java
public java.util.Collection<com.tailf.maapi.MaapiSchemas.CSMNsMap> getLoadedMNsMaps()
```

Types: [CSMNsMap](MaapiSchemas/CSMNsMap.md#cls-CSMNsMap)

### getLoadedSchemas() <a href="#m-getLoadedSchemas-fe2966b5baf6" id="m-getLoadedSchemas-fe2966b5baf6"></a>

```java
public java.util.Collection<com.tailf.maapi.MaapiSchemas.CSSchema> getLoadedSchemas()
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#cls-CSSchema)

get all loaded schemas as a Collection of CSSchema objects

**Returns:** Collection of CSSchema objects

### getMountId(MountIdInterface, ConfPath) <a href="#m-getMountId-a4d23d966af3" id="m-getMountId-a4d23d966af3"></a>

```java
public java.util.List<String> getMountId(
    com.tailf.conf.MountIdInterface midif,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MountIdInterface](../conf/MountIdInterface.md#cls-MountIdInterface), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.MountIdInterface midif`
- `com.tailf.conf.ConfPath path`

### getRootMountId() <a href="#m-getRootMountId-542ecf8e1ac1" id="m-getRootMountId-542ecf8e1ac1"></a>

```java
public static java.util.List<String> getRootMountId()
```

### getThreadDefaultMountId() <a href="#m-getThreadDefaultMountId-c72bbe29ad4d" id="m-getThreadDefaultMountId-c72bbe29ad4d"></a>

```java
public static java.util.List<String> getThreadDefaultMountId()
```

### hashToString(int) <a href="#m-hashToString-54eaaef71976" id="m-hashToString-54eaaef71976"></a>

```java
public String hashToString(int tagHash)
```

Convert from hash value to String value for a specified tag.

**Parameters**

- `int tagHash` - hash value for tag

**Returns:** String value or null if not found

### init(Socket) <a href="#m-init-1f83ed7f5091" id="m-init-1f83ed7f5091"></a>

```java
protected com.tailf.maapi.MaapiSchemas init(
    java.net.Socket socket
)
    throws com.tailf.maapi.MaapiException
```

Types: [MaapiSchemas](MaapiSchemas.md#cls-MaapiSchemas), [MaapiException](MaapiException.md#cls-MaapiException)

Initialization method for a new MaapiSchemas instance.

 Only for internal usage.

**Parameters**

- `java.net.Socket socket` - Socket connected to NSO that should be used to load schemas

**Returns:** An initialized instance

**Throws**

- `MaapiException` - if an error occurs during loading of schemas.

### mkInitializedMaapiSchemas(String[], Socket) <a href="#m-mkInitializedMaapiSchemas-22e4830ffd3c" id="m-mkInitializedMaapiSchemas-22e4830ffd3c"></a>

```java
protected static com.tailf.maapi.MaapiSchemas mkInitializedMaapiSchemas(
    String[] namespaceURIs,
    java.net.Socket socket
)
    throws com.tailf.maapi.MaapiException
```

Types: [MaapiSchemas](MaapiSchemas.md#cls-MaapiSchemas), [MaapiException](MaapiException.md#cls-MaapiException)

**Parameters**

- `String[] namespaceURIs`
- `java.net.Socket socket`

### registerSchemaRoot(CSSchema) <a href="#m-registerSchemaRoot-0a458f575f6a" id="m-registerSchemaRoot-0a458f575f6a"></a>

```java
protected void registerSchemaRoot(com.tailf.maapi.MaapiSchemas.CSSchema csschema)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#cls-CSSchema)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSSchema csschema`

### removeMountIdCachePath(ConfPath) <a href="#m-removeMountIdCachePath-e2f9028697a6" id="m-removeMountIdCachePath-e2f9028697a6"></a>

```java
public void removeMountIdCachePath(com.tailf.conf.ConfPath path)
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath)

**Parameters**

- `com.tailf.conf.ConfPath path`

### setThreadDefaultMountId(List<String>) <a href="#m-setThreadDefaultMountId-9a20aed46fad" id="m-setThreadDefaultMountId-9a20aed46fad"></a>

```java
public static void setThreadDefaultMountId(java.util.List<String> mountId)
```

**Parameters**

- `java.util.List<String> mountId`

### stringToHash(String) <a href="#m-stringToHash-7c2af24796ac" id="m-stringToHash-7c2af24796ac"></a>

```java
public int stringToHash(String tagString)
```

Convert from String value to hash value for a specified tag.

**Parameters**

- `String tagString`

**Returns:** integer hash value or zero if not found.

### stringToValue(CSType, String) <a href="#m-stringToValue-9fef98be9bb2" id="m-stringToValue-9fef98be9bb2"></a>

```java
public com.tailf.conf.ConfValue stringToValue(
    com.tailf.maapi.MaapiSchemas.CSType type,
    String str
)
    throws com.tailf.maapi.MaapiException
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue), [CSType](MaapiSchemas/CSType.md#cls-CSType), [MaapiException](MaapiException.md#cls-MaapiException)

parse value located in str and convert to ConfValue, the value is
 validated.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type` - - type for the converted value
- `String str` - - string representation of the value

**Returns:** ConfValue for the corresponding type

**Throws**

- `MaapiException`

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

### valueToString(CSType, ConfValue) <a href="#m-valueToString-f281f6b6d7d7" id="m-valueToString-f281f6b6d7d7"></a>

```java
public String valueToString(com.tailf.maapi.MaapiSchemas.CSType type, com.tailf.conf.ConfValue val)
```

Types: [CSType](MaapiSchemas/CSType.md#cls-CSType), [ConfValue](../conf/ConfValue.md#cls-ConfValue)

convert to string representation for the corresponding ConfValue

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type` - - type for the converted value
- `com.tailf.conf.ConfValue val` - - ConfValue

**Returns:** String representation of the value


## Nested Types

- [BitsTypeMethodsImpl](MaapiSchemas/BitsTypeMethodsImpl.md#cls-BitsTypeMethodsImpl)
- [CSBit](MaapiSchemas/CSBit.md#cls-CSBit)
- [CSCase](MaapiSchemas/CSCase.md#cls-CSCase)
- [CSChoice](MaapiSchemas/CSChoice.md#cls-CSChoice)
- [CSEnum](MaapiSchemas/CSEnum.md#cls-CSEnum)
- [CSIdref](MaapiSchemas/CSIdref.md#cls-CSIdref)
- [CSMNsMap](MaapiSchemas/CSMNsMap.md#cls-CSMNsMap)
- [CSNamedType](MaapiSchemas/CSNamedType.md#cls-CSNamedType)
- [CSNode](MaapiSchemas/CSNode.md#cls-CSNode)
- [CSNodeInfo](MaapiSchemas/CSNodeInfo.md#cls-CSNodeInfo)
- [CSNodeType](MaapiSchemas/CSNodeType.md#cls-CSNodeType)
- [CSSchema](MaapiSchemas/CSSchema.md#cls-CSSchema)
- [CSShallowType](MaapiSchemas/CSShallowType.md#cls-CSShallowType)
- [CSStringLength](MaapiSchemas/CSStringLength.md#cls-CSStringLength)
- [CSStringRestriction](MaapiSchemas/CSStringRestriction.md#cls-CSStringRestriction)
- [CSType](MaapiSchemas/CSType.md#cls-CSType)
- [CSTypeBits](MaapiSchemas/CSTypeBits.md#cls-CSTypeBits)
- [CSTypeMethods](MaapiSchemas/CSTypeMethods.md#cls-CSTypeMethods)
- [CSTypeRange](MaapiSchemas/CSTypeRange.md#cls-CSTypeRange)
- [Decimal64TypeMethodsImpl](MaapiSchemas/Decimal64TypeMethodsImpl.md#cls-Decimal64TypeMethodsImpl)
- [DisplayHintSpec](MaapiSchemas/DisplayHintSpec.md#cls-DisplayHintSpec)
- [DisplayHintTypeMethodsImpl](MaapiSchemas/DisplayHintTypeMethodsImpl.md#cls-DisplayHintTypeMethodsImpl)
- [EnumTypeMethodsImpl](MaapiSchemas/EnumTypeMethodsImpl.md#cls-EnumTypeMethodsImpl)
- [IdentityTypeMethodsImpl](MaapiSchemas/IdentityTypeMethodsImpl.md#cls-IdentityTypeMethodsImpl)
- [ListRestrictionTypeMethodsImpl](MaapiSchemas/ListRestrictionTypeMethodsImpl.md#cls-ListRestrictionTypeMethodsImpl)
- [ListTypeMethodsImpl](MaapiSchemas/ListTypeMethodsImpl.md#cls-ListTypeMethodsImpl)
- [MountId](MaapiSchemas/MountId.md#cls-MountId)
- [MountIdLRUMap](MaapiSchemas/MountIdLRUMap.md#cls-MountIdLRUMap)
- [RetrictedNumberTypeMethodsImpl](MaapiSchemas/RetrictedNumberTypeMethodsImpl.md#cls-RetrictedNumberTypeMethodsImpl)
- [StringTypeMethodsImpl](MaapiSchemas/StringTypeMethodsImpl.md#cls-StringTypeMethodsImpl)
- [UnionTypeMethodsImpl](MaapiSchemas/UnionTypeMethodsImpl.md#cls-UnionTypeMethodsImpl)
