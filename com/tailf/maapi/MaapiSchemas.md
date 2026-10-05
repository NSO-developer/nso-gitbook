<a id="cls-MaapiSchemas"></a>
# MaapiSchemas

```java
public class com.tailf.maapi.MaapiSchemas
```

Handles the schema information from the data models loaded.

 It holds an offline tree structure where each node is represented by an
 instance of [`CSNode`](MaapiSchemas/CSNode.md#cls-CSNode) which in turn contains connections
 to other nodes.



 Methods exist to retrieve a specified schema [`CSSchema`](MaapiSchemas/CSSchema.md#cls-CSSchema)
 or a specified schema node
 `#findCSNode(String,String,Object...)`,
 `CSNode#findCSNode(MaapiSchemas.CSNode,String,String)`.



 All entities, including Schemas, Nodes, Types, Choices etc are
 represented as inner classes of `MaapiSchemas` and are stored
 in its offline tree hierarchy.



 These inner classes have methods to retrieve all information about the
 entity.


 Note that this class is self-contained in the sense that it does not use any
 locally compiled schemas i.e. ConfNamespace classes.



 There are methods for converting between hashes and strings:
 `#stringToHash(String)` and `#hashToString(int)`



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

- [MaapiSchemas(String[])](#m-maapischemas-6fe3b955b5b9)

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

- [clearMountIdCache()](#m-clearmountidcache-78b7d5916f44)
- [compileDisplayHint(byte[])](#m-compiledisplayhint-da77fd4fc4a5)
- [convertMountId(ConfEObject[])](#m-convertmountid-dd57936915c7)
- [convertMountId(Map<Integer,CSSchema>, ConfEObject)](#m-convertmountid-2b8b82ff2d45)
- [convertMountIdHash(Map<Integer,CSSchema>, int, int)](#m-convertmountidhash-20aca1c9464f)
- [currentMountIdCacheSize()](#m-currentmountidcachesize-54e5c11ad163)
- [findCSMNsMap(List<String>)](#m-findcsmnsmap-522ac9ee9034)
- [findCSMNsMap(String)](#m-findcsmnsmap-026c4103f2ca)
- [findCSNode(CSNode, CSMNsMap, String)](#m-findcsnode-31950d190712)
- [findCSNode(CSNode, int, int)](#m-findcsnode-052de3dda313)
- [findCSNode(CSNode, String, String)](#m-findcsnode-5d43b475b623)
- [findCSNode(MountIdInterface, String, List<PathElement>)](#m-findcsnode-22bcb6b48b20)
- [findCSNode(MountIdInterface, String, String, Object[])](#m-findcsnode-33ce42d47da2)
- [findCSNode(String, String, Object[])](#m-findcsnode-9fc05e189266)
- [findCSRoot(int)](#m-findcsroot-e71c532d0a72)
- [findCSRoot(String)](#m-findcsroot-ed8e95df57fe)
- [findCSSchema(int)](#m-findcsschema-880b1533ffd2)
- [findCSSchema(String)](#m-findcsschema-6023156b0628)
- [findCSSchemaByPrefix(String)](#m-findcsschemabyprefix-d5a2976f05ae)
- [findCSSchemaFromUniqueRoot(int)](#m-findcsschemafromuniqueroot-655331fd3352)
- [findCSSchemaFromUniqueRoot(String)](#m-findcsschemafromuniqueroot-6a2bcf9dd24b)
- [findMountId(Map<Integer,CSSchema>, ConfEObject)](#m-findmountid-2786e1d58129)
- [findMountId(Map<Integer,CSSchema>, int, int)](#m-findmountid-9807a9bfdddb)
- [findSchema(Map<Integer,CSSchema>, int)](#m-findschema-b4d435858143)
- [findSchema(Map<Integer,CSSchema>, int, String, String, String, String)](#m-findschema-51a71cd5c850)
- [getConfdType(String)](#m-getconfdtype-0b0b4b688106)
- [getLoadedMNsMaps()](#m-getloadedmnsmaps-9eef39dd2fe7)
- [getLoadedSchemas()](#m-getloadedschemas-fe2966b5baf6)
- [getMountId(MountIdInterface, ConfPath)](#m-getmountid-a4d23d966af3)
- [getRootMountId()](#m-getrootmountid-542ecf8e1ac1)
- [getThreadDefaultMountId()](#m-getthreaddefaultmountid-c72bbe29ad4d)
- [hashToString(int)](#m-hashtostring-54eaaef71976)
- [init(Socket)](#m-init-1f83ed7f5091)
- [mkInitializedMaapiSchemas(String[], Socket)](#m-mkinitializedmaapischemas-22e4830ffd3c)
- [registerSchemaRoot(CSSchema)](#m-registerschemaroot-0a458f575f6a)
- [removeMountIdCachePath(ConfPath)](#m-removemountidcachepath-e2f9028697a6)
- [setThreadDefaultMountId(List<String>)](#m-setthreaddefaultmountid-9a20aed46fad)
- [stringToHash(String)](#m-stringtohash-7c2af24796ac)
- [stringToValue(CSType, String)](#m-stringtovalue-9fef98be9bb2)
- [toString()](#m-tostring-e9d48c5503ef)
- [valueToString(CSType, ConfValue)](#m-valuetostring-f281f6b6d7d7)

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

<a id="m-maapischemas-6fe3b955b5b9"></a>
### MaapiSchemas(String[])

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

<a id="m-address"></a>
### address

```java
protected java.net.SocketAddress address = null;
```

<a id="m-CS_DOC_DESCRIPTION"></a>
### CS_DOC_DESCRIPTION

**Package-private**

```java
static final int CS_DOC_DESCRIPTION = 2;
```

<a id="m-CS_DOC_HIDDEN"></a>
### CS_DOC_HIDDEN

**Package-private**

```java
static final int CS_DOC_HIDDEN = 3;
```

<a id="m-CS_DOC_PROMPT"></a>
### CS_DOC_PROMPT

**Package-private**

```java
static final int CS_DOC_PROMPT = 1;
```

DocData InfoType constant used to tag
 documentation strings sent from server

<a id="m-hashToStringTab"></a>
### hashToStringTab

```java
protected java.util.Map<Integer,String> hashToStringTab = null;
```

<a id="m-mnsMaps"></a>
### mnsMaps

```java
protected java.util.Map<java.util.List<String>,com.tailf.maapi.MaapiSchemas.CSMNsMap> mnsMaps = null;
```

Types: [CSMNsMap](MaapiSchemas/CSMNsMap.md#cls-CSMNsMap)

<a id="m-NO_EXISTS_TYPE"></a>
### NO_EXISTS_TYPE

```java
public static final com.tailf.conf.ConfNoExists NO_EXISTS_TYPE = null;
```

Types: [ConfNoExists](../conf/ConfNoExists.md#cls-ConfNoExists)

<a id="m-schemas"></a>
### schemas

```java
protected java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemas = null;
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#cls-CSSchema)

<a id="m-specifiedNSURIs"></a>
### specifiedNSURIs

```java
protected final String[] specifiedNSURIs = null;
```

<a id="m-stringToHashTab"></a>
### stringToHashTab

```java
protected java.util.Map<String,Integer> stringToHashTab = null;
```


## Methods

<a id="m-clearmountidcache-78b7d5916f44"></a>
### clearMountIdCache()

```java
public void clearMountIdCache()
```

<a id="m-compiledisplayhint-da77fd4fc4a5"></a>
### compileDisplayHint(byte[])

```java
public static java.util.List<com.tailf.maapi.MaapiSchemas.DisplayHintSpec> compileDisplayHint(
    byte[] bin
)
    throws com.tailf.maapi.MaapiException
```

Types: [DisplayHintSpec](MaapiSchemas/DisplayHintSpec.md#cls-DisplayHintSpec), [MaapiException](MaapiException.md#cls-MaapiException)

**Parameters**

- `byte[] bin`

<a id="m-convertmountid-dd57936915c7"></a>
### convertMountId(ConfEObject[])

```java
public java.util.List<String> convertMountId(
    com.tailf.proto.ConfEObject[] eObjs
)
    throws com.tailf.maapi.MaapiException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [MaapiException](MaapiException.md#cls-MaapiException)

**Parameters**

- `com.tailf.proto.ConfEObject[] eObjs`

<a id="m-convertmountid-2b8b82ff2d45"></a>
### convertMountId(Map<Integer,CSSchema>, ConfEObject)

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

<a id="m-convertmountidhash-20aca1c9464f"></a>
### convertMountIdHash(Map<Integer,CSSchema>, int, int)

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

<a id="m-currentmountidcachesize-54e5c11ad163"></a>
### currentMountIdCacheSize()

```java
public int currentMountIdCacheSize()
```

<a id="m-findcsmnsmap-522ac9ee9034"></a>
### findCSMNsMap(List<String>)

```java
public com.tailf.maapi.MaapiSchemas.CSMNsMap findCSMNsMap(java.util.List<String> mountId)
```

Types: [CSMNsMap](MaapiSchemas/CSMNsMap.md#cls-CSMNsMap)

**Parameters**

- `java.util.List<String> mountId`

<a id="m-findcsmnsmap-026c4103f2ca"></a>
### findCSMNsMap(String)

```java
public com.tailf.maapi.MaapiSchemas.CSMNsMap findCSMNsMap(String mountId)
```

Types: [CSMNsMap](MaapiSchemas/CSMNsMap.md#cls-CSMNsMap)

**Parameters**

- `String mountId`

<a id="m-findcsnode-31950d190712"></a>
### findCSNode(CSNode, CSMNsMap, String)

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

<a id="m-findcsnode-052de3dda313"></a>
### findCSNode(CSNode, int, int)

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

<a id="m-findcsnode-5d43b475b623"></a>
### findCSNode(CSNode, String, String)

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

<a id="m-findcsnode-22bcb6b48b20"></a>
### findCSNode(MountIdInterface, String, List<PathElement>)

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

<a id="m-findcsnode-33ce42d47da2"></a>
### findCSNode(MountIdInterface, String, String, Object[])

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

<a id="m-findcsnode-9fc05e189266"></a>
### findCSNode(String, String, Object[])

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

<a id="m-findcsroot-e71c532d0a72"></a>
### findCSRoot(int)

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSRoot(int nshash)
```

Types: [CSNode](MaapiSchemas/CSNode.md#cls-CSNode)

Retrieve a specific root node identified by an hash value

**Parameters**

- `int nshash` - integer hash value representing the root node

**Returns:** CSNode root node or null if not found

<a id="m-findcsroot-ed8e95df57fe"></a>
### findCSRoot(String)

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSRoot(String nsName)
```

Types: [CSNode](MaapiSchemas/CSNode.md#cls-CSNode)

Retrieve a specific root node identified by an namespace string

**Parameters**

- `String nsName` - a string contain the full namespace name

**Returns:** CSNode root node or null if not found

<a id="m-findcsschema-880b1533ffd2"></a>
### findCSSchema(int)

```java
public com.tailf.maapi.MaapiSchemas.CSSchema findCSSchema(int nsHash)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#cls-CSSchema)

Retrieve a specified schema identified by an hash value

**Parameters**

- `int nsHash` - integer hash value representing the namespace

**Returns:** CSSchemaobject for the identified Namespace of null if not found

<a id="m-findcsschema-6023156b0628"></a>
### findCSSchema(String)

```java
public com.tailf.maapi.MaapiSchemas.CSSchema findCSSchema(String nsName)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#cls-CSSchema)

Retrieve a specific schema identified by an namespace string

**Parameters**

- `String nsName` - a string contain the full namespace name

**Returns:** CSSchema object for the identified namespace or null if not
         found.

<a id="m-findcsschemabyprefix-d5a2976f05ae"></a>
### findCSSchemaByPrefix(String)

```java
public com.tailf.maapi.MaapiSchemas.CSSchema findCSSchemaByPrefix(String prefix)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#cls-CSSchema)

**Parameters**

- `String prefix`

<a id="m-findcsschemafromuniqueroot-655331fd3352"></a>
### findCSSchemaFromUniqueRoot(int)

```java
public com.tailf.maapi.MaapiSchemas.CSSchema findCSSchemaFromUniqueRoot(int rootHash)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#cls-CSSchema)

Returns schema for root node. This requires the root node to be
 unique in all known schemas. Otherwise null is returned.

**Parameters**

- `int rootHash` - hash for root node

**Returns:** CSSchema the schema having the tag as root

<a id="m-findcsschemafromuniqueroot-6a2bcf9dd24b"></a>
### findCSSchemaFromUniqueRoot(String)

```java
public com.tailf.maapi.MaapiSchemas.CSSchema findCSSchemaFromUniqueRoot(String rootTagName)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#cls-CSSchema)

Returns schema for root node. This requires the root node to be
 unique in all known schemas. Otherwise null is returned.

**Parameters**

- `String rootTagName` - root tagname as string

**Returns:** CSSchema the schema having the tag as root

<a id="m-findmountid-2786e1d58129"></a>
### findMountId(Map<Integer,CSSchema>, ConfEObject)

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

<a id="m-findmountid-9807a9bfdddb"></a>
### findMountId(Map<Integer,CSSchema>, int, int)

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

<a id="m-findschema-b4d435858143"></a>
### findSchema(Map<Integer,CSSchema>, int)

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

<a id="m-findschema-51a71cd5c850"></a>
### findSchema(Map<Integer,CSSchema>, int, String, String, String, String)

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

<a id="m-getconfdtype-0b0b4b688106"></a>
### getConfdType(String)

```java
protected com.tailf.maapi.MaapiSchemas.CSType getConfdType(String name)
```

Types: [CSType](MaapiSchemas/CSType.md#cls-CSType)

**Parameters**

- `String name`

**Returns:** CSType

<a id="m-getloadedmnsmaps-9eef39dd2fe7"></a>
### getLoadedMNsMaps()

```java
public java.util.Collection<com.tailf.maapi.MaapiSchemas.CSMNsMap> getLoadedMNsMaps()
```

Types: [CSMNsMap](MaapiSchemas/CSMNsMap.md#cls-CSMNsMap)

<a id="m-getloadedschemas-fe2966b5baf6"></a>
### getLoadedSchemas()

```java
public java.util.Collection<com.tailf.maapi.MaapiSchemas.CSSchema> getLoadedSchemas()
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#cls-CSSchema)

get all loaded schemas as a Collection of CSSchema objects

**Returns:** Collection of CSSchema objects

<a id="m-getmountid-a4d23d966af3"></a>
### getMountId(MountIdInterface, ConfPath)

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

<a id="m-getrootmountid-542ecf8e1ac1"></a>
### getRootMountId()

```java
public static java.util.List<String> getRootMountId()
```

<a id="m-getthreaddefaultmountid-c72bbe29ad4d"></a>
### getThreadDefaultMountId()

```java
public static java.util.List<String> getThreadDefaultMountId()
```

<a id="m-hashtostring-54eaaef71976"></a>
### hashToString(int)

```java
public String hashToString(int tagHash)
```

Convert from hash value to String value for a specified tag.

**Parameters**

- `int tagHash` - hash value for tag

**Returns:** String value or null if not found

<a id="m-init-1f83ed7f5091"></a>
### init(Socket)

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

<a id="m-mkinitializedmaapischemas-22e4830ffd3c"></a>
### mkInitializedMaapiSchemas(String[], Socket)

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

<a id="m-registerschemaroot-0a458f575f6a"></a>
### registerSchemaRoot(CSSchema)

```java
protected void registerSchemaRoot(com.tailf.maapi.MaapiSchemas.CSSchema csschema)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#cls-CSSchema)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSSchema csschema`

<a id="m-removemountidcachepath-e2f9028697a6"></a>
### removeMountIdCachePath(ConfPath)

```java
public void removeMountIdCachePath(com.tailf.conf.ConfPath path)
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath)

**Parameters**

- `com.tailf.conf.ConfPath path`

<a id="m-setthreaddefaultmountid-9a20aed46fad"></a>
### setThreadDefaultMountId(List<String>)

```java
public static void setThreadDefaultMountId(java.util.List<String> mountId)
```

**Parameters**

- `java.util.List<String> mountId`

<a id="m-stringtohash-7c2af24796ac"></a>
### stringToHash(String)

```java
public int stringToHash(String tagString)
```

Convert from String value to hash value for a specified tag.

**Parameters**

- `String tagString`

**Returns:** integer hash value or zero if not found.

<a id="m-stringtovalue-9fef98be9bb2"></a>
### stringToValue(CSType, String)

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

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

<a id="m-valuetostring-f281f6b6d7d7"></a>
### valueToString(CSType, ConfValue)

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
