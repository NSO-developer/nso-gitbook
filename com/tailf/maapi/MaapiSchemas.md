<a id="s-MaapiSchemas"></a>
# MaapiSchemas

```java
public class com.tailf.maapi.MaapiSchemas
```

Handles the schema information from the data models loaded.

 It holds an offline tree structure where each node is represented by an
 instance of [`CSNode`](MaapiSchemas/CSNode.md#s-CSNode) which in turn contains connections
 to other nodes.



 Methods exist to retrieve a specified schema [`CSSchema`](MaapiSchemas/CSSchema.md#s-CSSchema)
 or a specified schema node
 `#findCSNode(String,String,Object...)`,
 [`CSNode`](MaapiSchemas/CSNode.md#s-CSNode).



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

- [MmapMaapiSchemas](../ncs/maapi/MmapMaapiSchemas.md#s-MmapMaapiSchemas)

## Members

**Constructors**:

- [MaapiSchemas(String[])](#s-MaapiSchemas-1)

**Fields**:

- [address](#s-address)
- [CS_DOC_DESCRIPTION](#s-CS_DOC_DESCRIPTION)
- [CS_DOC_HIDDEN](#s-CS_DOC_HIDDEN)
- [CS_DOC_PROMPT](#s-CS_DOC_PROMPT)
- [hashToStringTab](#s-hashToStringTab)
- [mnsMaps](#s-mnsMaps)
- [NO_EXISTS_TYPE](#s-NO_EXISTS_TYPE)
- [schemas](#s-schemas)
- [specifiedNSURIs](#s-specifiedNSURIs)
- [stringToHashTab](#s-stringToHashTab)

**Methods**:

- [clearMountIdCache()](#s-clearMountIdCache)
- [compileDisplayHint(byte[])](#s-compileDisplayHint)
- [convertMountId(ConfEObject[])](#s-convertMountId)
- [convertMountId(Map<Integer,CSSchema>, ConfEObject)](#s-convertMountId-1)
- [convertMountIdHash(Map<Integer,CSSchema>, int, int)](#s-convertMountIdHash)
- [currentMountIdCacheSize()](#s-currentMountIdCacheSize)
- [findCSMNsMap(List<String>)](#s-findCSMNsMap)
- [findCSMNsMap(String)](#s-findCSMNsMap-1)
- [findCSNode(CSNode, CSMNsMap, String)](#s-findCSNode)
- [findCSNode(CSNode, int, int)](#s-findCSNode-1)
- [findCSNode(CSNode, String, String)](#s-findCSNode-2)
- [findCSNode(MountIdInterface, String, List<PathElement>)](#s-findCSNode-3)
- [findCSNode(MountIdInterface, String, String, Object[])](#s-findCSNode-4)
- [findCSNode(String, String, Object[])](#s-findCSNode-5)
- [findCSRoot(int)](#s-findCSRoot)
- [findCSRoot(String)](#s-findCSRoot-1)
- [findCSSchema(int)](#s-findCSSchema)
- [findCSSchema(String)](#s-findCSSchema-1)
- [findCSSchemaByPrefix(String)](#s-findCSSchemaByPrefix)
- [findCSSchemaFromUniqueRoot(int)](#s-findCSSchemaFromUniqueRoot)
- [findCSSchemaFromUniqueRoot(String)](#s-findCSSchemaFromUniqueRoot-1)
- [findMountId(Map<Integer,CSSchema>, ConfEObject)](#s-findMountId)
- [findMountId(Map<Integer,CSSchema>, int, int)](#s-findMountId-1)
- [findSchema(Map<Integer,CSSchema>, int)](#s-findSchema)
- [findSchema(Map<Integer,CSSchema>, int, String, String, String, String)](#s-findSchema-1)
- [getConfdType(String)](#s-getConfdType)
- [getLoadedMNsMaps()](#s-getLoadedMNsMaps)
- [getLoadedSchemas()](#s-getLoadedSchemas)
- [getMountId(MountIdInterface, ConfPath)](#s-getMountId)
- [getRootMountId()](#s-getRootMountId)
- [getThreadDefaultMountId()](#s-getThreadDefaultMountId)
- [hashToString(int)](#s-hashToString)
- [init(Socket)](#s-init)
- [mkInitializedMaapiSchemas(String[], Socket)](#s-mkInitializedMaapiSchemas)
- [registerSchemaRoot(CSSchema)](#s-registerSchemaRoot)
- [removeMountIdCachePath(ConfPath)](#s-removeMountIdCachePath)
- [setThreadDefaultMountId(List<String>)](#s-setThreadDefaultMountId)
- [stringToHash(String)](#s-stringToHash)
- [stringToValue(CSType, String)](#s-stringToValue)
- [toString()](#s-toString)
- [valueToString(CSType, ConfValue)](#s-valueToString)

**Nested Types**:

- [BitsTypeMethodsImpl](MaapiSchemas/BitsTypeMethodsImpl.md#s-BitsTypeMethodsImpl)
- [CSBit](MaapiSchemas/CSBit.md#s-CSBit)
- [CSCase](MaapiSchemas/CSCase.md#s-CSCase)
- [CSChoice](MaapiSchemas/CSChoice.md#s-CSChoice)
- [CSEnum](MaapiSchemas/CSEnum.md#s-CSEnum)
- [CSIdref](MaapiSchemas/CSIdref.md#s-CSIdref)
- [CSMNsMap](MaapiSchemas/CSMNsMap.md#s-CSMNsMap)
- [CSNamedType](MaapiSchemas/CSNamedType.md#s-CSNamedType)
- [CSNode](MaapiSchemas/CSNode.md#s-CSNode)
- [CSNodeInfo](MaapiSchemas/CSNodeInfo.md#s-CSNodeInfo)
- [CSNodeType](MaapiSchemas/CSNodeType.md#s-CSNodeType)
- [CSSchema](MaapiSchemas/CSSchema.md#s-CSSchema)
- [CSShallowType](MaapiSchemas/CSShallowType.md#s-CSShallowType)
- [CSStringLength](MaapiSchemas/CSStringLength.md#s-CSStringLength)
- [CSStringRestriction](MaapiSchemas/CSStringRestriction.md#s-CSStringRestriction)
- [CSType](MaapiSchemas/CSType.md#s-CSType)
- [CSTypeBits](MaapiSchemas/CSTypeBits.md#s-CSTypeBits)
- [CSTypeMethods](MaapiSchemas/CSTypeMethods.md#s-CSTypeMethods)
- [CSTypeRange](MaapiSchemas/CSTypeRange.md#s-CSTypeRange)
- [Decimal64TypeMethodsImpl](MaapiSchemas/Decimal64TypeMethodsImpl.md#s-Decimal64TypeMethodsImpl)
- [DisplayHintSpec](MaapiSchemas/DisplayHintSpec.md#s-DisplayHintSpec)
- [DisplayHintTypeMethodsImpl](MaapiSchemas/DisplayHintTypeMethodsImpl.md#s-DisplayHintTypeMethodsImpl)
- [EnumTypeMethodsImpl](MaapiSchemas/EnumTypeMethodsImpl.md#s-EnumTypeMethodsImpl)
- [IdentityTypeMethodsImpl](MaapiSchemas/IdentityTypeMethodsImpl.md#s-IdentityTypeMethodsImpl)
- [ListRestrictionTypeMethodsImpl](MaapiSchemas/ListRestrictionTypeMethodsImpl.md#s-ListRestrictionTypeMethodsImpl)
- [ListTypeMethodsImpl](MaapiSchemas/ListTypeMethodsImpl.md#s-ListTypeMethodsImpl)
- [MountId](MaapiSchemas/MountId.md#s-MountId)
- [MountIdLRUMap](MaapiSchemas/MountIdLRUMap.md#s-MountIdLRUMap)
- [RetrictedNumberTypeMethodsImpl](MaapiSchemas/RetrictedNumberTypeMethodsImpl.md#s-RetrictedNumberTypeMethodsImpl)
- [StringTypeMethodsImpl](MaapiSchemas/StringTypeMethodsImpl.md#s-StringTypeMethodsImpl)
- [UnionTypeMethodsImpl](MaapiSchemas/UnionTypeMethodsImpl.md#s-UnionTypeMethodsImpl)

## Constructors

<a id="s-MaapiSchemas-1"></a>
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

<a id="s-address"></a>
### address

```java
protected java.net.SocketAddress address = null;
```

<a id="s-CS_DOC_DESCRIPTION"></a>
### CS_DOC_DESCRIPTION

**Package-private**

```java
static final int CS_DOC_DESCRIPTION = 2;
```

<a id="s-CS_DOC_HIDDEN"></a>
### CS_DOC_HIDDEN

**Package-private**

```java
static final int CS_DOC_HIDDEN = 3;
```

<a id="s-CS_DOC_PROMPT"></a>
### CS_DOC_PROMPT

**Package-private**

```java
static final int CS_DOC_PROMPT = 1;
```

DocData InfoType constant used to tag
 documentation strings sent from server

<a id="s-hashToStringTab"></a>
### hashToStringTab

```java
protected java.util.Map<Integer,String> hashToStringTab = null;
```

<a id="s-mnsMaps"></a>
### mnsMaps

```java
protected java.util.Map<java.util.List<String>,com.tailf.maapi.MaapiSchemas.CSMNsMap> mnsMaps = null;
```

Types: [CSMNsMap](MaapiSchemas/CSMNsMap.md#s-CSMNsMap)

<a id="s-NO_EXISTS_TYPE"></a>
### NO_EXISTS_TYPE

```java
public static final com.tailf.conf.ConfNoExists NO_EXISTS_TYPE = null;
```

Types: [ConfNoExists](../conf/ConfNoExists.md#s-ConfNoExists)

<a id="s-schemas"></a>
### schemas

```java
protected java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemas = null;
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#s-CSSchema)

<a id="s-specifiedNSURIs"></a>
### specifiedNSURIs

```java
protected final String[] specifiedNSURIs = null;
```

<a id="s-stringToHashTab"></a>
### stringToHashTab

```java
protected java.util.Map<String,Integer> stringToHashTab = null;
```


## Methods

<a id="s-clearMountIdCache"></a>
### clearMountIdCache()

```java
public void clearMountIdCache()
```

<a id="s-compileDisplayHint"></a>
### compileDisplayHint(byte[])

```java
public static java.util.List<com.tailf.maapi.MaapiSchemas.DisplayHintSpec> compileDisplayHint(
    byte[] bin
)
    throws com.tailf.maapi.MaapiException
```

Types: [DisplayHintSpec](MaapiSchemas/DisplayHintSpec.md#s-DisplayHintSpec), [MaapiException](MaapiException.md#s-MaapiException)

**Parameters**

- `byte[] bin`

<a id="s-convertMountId"></a>
### convertMountId(ConfEObject[])

```java
public java.util.List<String> convertMountId(
    com.tailf.proto.ConfEObject[] eObjs
)
    throws com.tailf.maapi.MaapiException
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [MaapiException](MaapiException.md#s-MaapiException)

**Parameters**

- `com.tailf.proto.ConfEObject[] eObjs`

<a id="s-convertMountId-1"></a>
### convertMountId(Map<Integer,CSSchema>, ConfEObject)

```java
public String convertMountId(
    java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemastable,
    com.tailf.proto.ConfEObject obj
)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#s-CSSchema), [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

**Parameters**

- `java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemastable`
- `com.tailf.proto.ConfEObject obj`

<a id="s-convertMountIdHash"></a>
### convertMountIdHash(Map<Integer,CSSchema>, int, int)

```java
public String convertMountIdHash(
    java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemastable,
    int nsHash,
    int tagHash
)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#s-CSSchema)

**Parameters**

- `java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemastable`
- `int nsHash`
- `int tagHash`

<a id="s-currentMountIdCacheSize"></a>
### currentMountIdCacheSize()

```java
public int currentMountIdCacheSize()
```

<a id="s-findCSMNsMap"></a>
### findCSMNsMap(List<String>)

```java
public com.tailf.maapi.MaapiSchemas.CSMNsMap findCSMNsMap(java.util.List<String> mountId)
```

Types: [CSMNsMap](MaapiSchemas/CSMNsMap.md#s-CSMNsMap)

**Parameters**

- `java.util.List<String> mountId`

<a id="s-findCSMNsMap-1"></a>
### findCSMNsMap(String)

```java
public com.tailf.maapi.MaapiSchemas.CSMNsMap findCSMNsMap(String mountId)
```

Types: [CSMNsMap](MaapiSchemas/CSMNsMap.md#s-CSMNsMap)

**Parameters**

- `String mountId`

<a id="s-findCSNode"></a>
### findCSNode(CSNode, CSMNsMap, String)

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSNode(
    com.tailf.maapi.MaapiSchemas.CSNode parent,
    com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap,
    String xmltagName
)
```

Types: [CSNode](MaapiSchemas/CSNode.md#s-CSNode), [CSMNsMap](MaapiSchemas/CSMNsMap.md#s-CSMNsMap)

Retrieve a specific node with a given parent node identified by xmltag
 all namespaces in a mnsmap and tagname

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode parent` - parent node
- `com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap`
- `String xmltagName`

**Returns:** CSNode or null if not found

<a id="s-findCSNode-1"></a>
### findCSNode(CSNode, int, int)

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSNode(
    com.tailf.maapi.MaapiSchemas.CSNode parent,
    int xmltagNShash,
    int xmltaghash
)
```

Types: [CSNode](MaapiSchemas/CSNode.md#s-CSNode)

Find and retrieves specific node in the schema information tree.


 Retrieve a specific node with a given parent node identified by xmltag
 namespace hash and tagname hash

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode parent` - parent node
- `int xmltagNShash` - namespace hash value
- `int xmltaghash` - tag hash which value

**Returns:** CSNode or null if not found

<a id="s-findCSNode-2"></a>
### findCSNode(CSNode, String, String)

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSNode(
    com.tailf.maapi.MaapiSchemas.CSNode parent,
    String xmltagNSName,
    String xmltagName
)
```

Types: [CSNode](MaapiSchemas/CSNode.md#s-CSNode)

Retrieve a specific node with a given parent node identified by xmltag
 namespace and tagname

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode parent` - parent node
- `String xmltagNSName`
- `String xmltagName`

**Returns:** CSNode or null if not found

<a id="s-findCSNode-3"></a>
### findCSNode(MountIdInterface, String, List<PathElement>)

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSNode(
    com.tailf.conf.MountIdInterface mountGetter,
    String nsName,
    java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl
)
    throws com.tailf.maapi.MaapiException
```

Types: [CSNode](MaapiSchemas/CSNode.md#s-CSNode), [MountIdInterface](../conf/MountIdInterface.md#s-MountIdInterface), [PathElement](../conf/gen/PathParser/PathElement.md#s-PathElement), [MaapiException](MaapiException.md#s-MaapiException)

Internally used method to find a node defined by an internal path format

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter` - if such exists or else null
- `String nsName`
- `java.util.List<com.tailf.conf.gen.PathParser.PathElement> pl`

**Returns:** CSNode the found schema node or null if not found

**Throws**

- `MaapiException`

<a id="s-findCSNode-4"></a>
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

Types: [CSNode](MaapiSchemas/CSNode.md#s-CSNode), [MountIdInterface](../conf/MountIdInterface.md#s-MountIdInterface), [MaapiException](MaapiException.md#s-MaapiException)

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

<a id="s-findCSNode-5"></a>
### findCSNode(String, String, Object[])

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSNode(
    String nsName,
    String fmt,
    Object[] arguments
)
    throws com.tailf.maapi.MaapiException
```

Types: [CSNode](MaapiSchemas/CSNode.md#s-CSNode), [MaapiException](MaapiException.md#s-MaapiException)

**Parameters**

- `String nsName`
- `String fmt`
- `Object[] arguments`

<a id="s-findCSRoot"></a>
### findCSRoot(int)

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSRoot(int nshash)
```

Types: [CSNode](MaapiSchemas/CSNode.md#s-CSNode)

Retrieve a specific root node identified by an hash value

**Parameters**

- `int nshash` - integer hash value representing the root node

**Returns:** CSNode root node or null if not found

<a id="s-findCSRoot-1"></a>
### findCSRoot(String)

```java
public com.tailf.maapi.MaapiSchemas.CSNode findCSRoot(String nsName)
```

Types: [CSNode](MaapiSchemas/CSNode.md#s-CSNode)

Retrieve a specific root node identified by an namespace string

**Parameters**

- `String nsName` - a string contain the full namespace name

**Returns:** CSNode root node or null if not found

<a id="s-findCSSchema"></a>
### findCSSchema(int)

```java
public com.tailf.maapi.MaapiSchemas.CSSchema findCSSchema(int nsHash)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#s-CSSchema)

Retrieve a specified schema identified by an hash value

**Parameters**

- `int nsHash` - integer hash value representing the namespace

**Returns:** CSSchemaobject for the identified Namespace of null if not found

<a id="s-findCSSchema-1"></a>
### findCSSchema(String)

```java
public com.tailf.maapi.MaapiSchemas.CSSchema findCSSchema(String nsName)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#s-CSSchema)

Retrieve a specific schema identified by an namespace string

**Parameters**

- `String nsName` - a string contain the full namespace name

**Returns:** CSSchema object for the identified namespace or null if not
         found.

<a id="s-findCSSchemaByPrefix"></a>
### findCSSchemaByPrefix(String)

```java
public com.tailf.maapi.MaapiSchemas.CSSchema findCSSchemaByPrefix(String prefix)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#s-CSSchema)

**Parameters**

- `String prefix`

<a id="s-findCSSchemaFromUniqueRoot"></a>
### findCSSchemaFromUniqueRoot(int)

```java
public com.tailf.maapi.MaapiSchemas.CSSchema findCSSchemaFromUniqueRoot(int rootHash)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#s-CSSchema)

Returns schema for root node. This requires the root node to be
 unique in all known schemas. Otherwise null is returned.

**Parameters**

- `int rootHash` - hash for root node

**Returns:** CSSchema the schema having the tag as root

<a id="s-findCSSchemaFromUniqueRoot-1"></a>
### findCSSchemaFromUniqueRoot(String)

```java
public com.tailf.maapi.MaapiSchemas.CSSchema findCSSchemaFromUniqueRoot(String rootTagName)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#s-CSSchema)

Returns schema for root node. This requires the root node to be
 unique in all known schemas. Otherwise null is returned.

**Parameters**

- `String rootTagName` - root tagname as string

**Returns:** CSSchema the schema having the tag as root

<a id="s-findMountId"></a>
### findMountId(Map<Integer,CSSchema>, ConfEObject)

```java
public com.tailf.maapi.MaapiSchemas.MountId findMountId(
    java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemastable,
    com.tailf.proto.ConfEObject obj
)
```

Types: [MountId](MaapiSchemas/MountId.md#s-MountId), [CSSchema](MaapiSchemas/CSSchema.md#s-CSSchema), [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

**Parameters**

- `java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemastable`
- `com.tailf.proto.ConfEObject obj`

<a id="s-findMountId-1"></a>
### findMountId(Map<Integer,CSSchema>, int, int)

```java
protected com.tailf.maapi.MaapiSchemas.MountId findMountId(
    java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemastable,
    int nsHash,
    int tagHash
)
```

Types: [MountId](MaapiSchemas/MountId.md#s-MountId), [CSSchema](MaapiSchemas/CSSchema.md#s-CSSchema)

**Parameters**

- `java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemastable`
- `int nsHash`
- `int tagHash`

<a id="s-findSchema"></a>
### findSchema(Map<Integer,CSSchema>, int)

```java
protected com.tailf.maapi.MaapiSchemas.CSSchema findSchema(
    java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemas,
    int nsHash
)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#s-CSSchema)

**Parameters**

- `java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemas`
- `int nsHash`

<a id="s-findSchema-1"></a>
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

Types: [CSSchema](MaapiSchemas/CSSchema.md#s-CSSchema)

**Parameters**

- `java.util.Map<Integer,com.tailf.maapi.MaapiSchemas.CSSchema> schemas`
- `int nsHash`
- `String uri`
- `String prefix`
- `String revision`
- `String module`

<a id="s-getConfdType"></a>
### getConfdType(String)

```java
protected com.tailf.maapi.MaapiSchemas.CSType getConfdType(String name)
```

Types: [CSType](MaapiSchemas/CSType.md#s-CSType)

**Parameters**

- `String name`

**Returns:** CSType

<a id="s-getLoadedMNsMaps"></a>
### getLoadedMNsMaps()

```java
public java.util.Collection<com.tailf.maapi.MaapiSchemas.CSMNsMap> getLoadedMNsMaps()
```

Types: [CSMNsMap](MaapiSchemas/CSMNsMap.md#s-CSMNsMap)

<a id="s-getLoadedSchemas"></a>
### getLoadedSchemas()

```java
public java.util.Collection<com.tailf.maapi.MaapiSchemas.CSSchema> getLoadedSchemas()
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#s-CSSchema)

get all loaded schemas as a Collection of CSSchema objects

**Returns:** Collection of CSSchema objects

<a id="s-getMountId"></a>
### getMountId(MountIdInterface, ConfPath)

```java
public java.util.List<String> getMountId(
    com.tailf.conf.MountIdInterface midif,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MountIdInterface](../conf/MountIdInterface.md#s-MountIdInterface), [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.MountIdInterface midif`
- `com.tailf.conf.ConfPath path`

<a id="s-getRootMountId"></a>
### getRootMountId()

```java
public static java.util.List<String> getRootMountId()
```

<a id="s-getThreadDefaultMountId"></a>
### getThreadDefaultMountId()

```java
public static java.util.List<String> getThreadDefaultMountId()
```

<a id="s-hashToString"></a>
### hashToString(int)

```java
public String hashToString(int tagHash)
```

Convert from hash value to String value for a specified tag.

**Parameters**

- `int tagHash` - hash value for tag

**Returns:** String value or null if not found

<a id="s-init"></a>
### init(Socket)

```java
protected com.tailf.maapi.MaapiSchemas init(
    java.net.Socket socket
)
    throws com.tailf.maapi.MaapiException
```

Types: [MaapiSchemas](MaapiSchemas.md#s-MaapiSchemas), [MaapiException](MaapiException.md#s-MaapiException)

Initialization method for a new MaapiSchemas instance.

 Only for internal usage.

**Parameters**

- `java.net.Socket socket` - Socket connected to NSO that should be used to load schemas

**Returns:** An initialized instance

**Throws**

- `MaapiException` - if an error occurs during loading of schemas.

<a id="s-mkInitializedMaapiSchemas"></a>
### mkInitializedMaapiSchemas(String[], Socket)

```java
protected static com.tailf.maapi.MaapiSchemas mkInitializedMaapiSchemas(
    String[] namespaceURIs,
    java.net.Socket socket
)
    throws com.tailf.maapi.MaapiException
```

Types: [MaapiSchemas](MaapiSchemas.md#s-MaapiSchemas), [MaapiException](MaapiException.md#s-MaapiException)

**Parameters**

- `String[] namespaceURIs`
- `java.net.Socket socket`

<a id="s-registerSchemaRoot"></a>
### registerSchemaRoot(CSSchema)

```java
protected void registerSchemaRoot(com.tailf.maapi.MaapiSchemas.CSSchema csschema)
```

Types: [CSSchema](MaapiSchemas/CSSchema.md#s-CSSchema)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSSchema csschema`

<a id="s-removeMountIdCachePath"></a>
### removeMountIdCachePath(ConfPath)

```java
public void removeMountIdCachePath(com.tailf.conf.ConfPath path)
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath)

**Parameters**

- `com.tailf.conf.ConfPath path`

<a id="s-setThreadDefaultMountId"></a>
### setThreadDefaultMountId(List<String>)

```java
public static void setThreadDefaultMountId(java.util.List<String> mountId)
```

**Parameters**

- `java.util.List<String> mountId`

<a id="s-stringToHash"></a>
### stringToHash(String)

```java
public int stringToHash(String tagString)
```

Convert from String value to hash value for a specified tag.

**Parameters**

- `String tagString`

**Returns:** integer hash value or zero if not found.

<a id="s-stringToValue"></a>
### stringToValue(CSType, String)

```java
public com.tailf.conf.ConfValue stringToValue(
    com.tailf.maapi.MaapiSchemas.CSType type,
    String str
)
    throws com.tailf.maapi.MaapiException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [CSType](MaapiSchemas/CSType.md#s-CSType), [MaapiException](MaapiException.md#s-MaapiException)

parse value located in str and convert to ConfValue, the value is
 validated.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type` - - type for the converted value
- `String str` - - string representation of the value

**Returns:** ConfValue for the corresponding type

**Throws**

- `MaapiException`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

<a id="s-valueToString"></a>
### valueToString(CSType, ConfValue)

```java
public String valueToString(com.tailf.maapi.MaapiSchemas.CSType type, com.tailf.conf.ConfValue val)
```

Types: [CSType](MaapiSchemas/CSType.md#s-CSType), [ConfValue](../conf/ConfValue.md#s-ConfValue)

convert to string representation for the corresponding ConfValue

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type` - - type for the converted value
- `com.tailf.conf.ConfValue val` - - ConfValue

**Returns:** String representation of the value


## Nested Types

- [BitsTypeMethodsImpl](MaapiSchemas/BitsTypeMethodsImpl.md)
- [CSBit](MaapiSchemas/CSBit.md)
- [CSCase](MaapiSchemas/CSCase.md)
- [CSChoice](MaapiSchemas/CSChoice.md)
- [CSEnum](MaapiSchemas/CSEnum.md)
- [CSIdref](MaapiSchemas/CSIdref.md)
- [CSMNsMap](MaapiSchemas/CSMNsMap.md)
- [CSNamedType](MaapiSchemas/CSNamedType.md)
- [CSNode](MaapiSchemas/CSNode.md)
- [CSNodeInfo](MaapiSchemas/CSNodeInfo.md)
- [CSNodeType](MaapiSchemas/CSNodeType.md)
- [CSSchema](MaapiSchemas/CSSchema.md)
- [CSShallowType](MaapiSchemas/CSShallowType.md)
- [CSStringLength](MaapiSchemas/CSStringLength.md)
- [CSStringRestriction](MaapiSchemas/CSStringRestriction.md)
- [CSType](MaapiSchemas/CSType.md)
- [CSTypeBits](MaapiSchemas/CSTypeBits.md)
- [CSTypeMethods](MaapiSchemas/CSTypeMethods.md)
- [CSTypeRange](MaapiSchemas/CSTypeRange.md)
- [Decimal64TypeMethodsImpl](MaapiSchemas/Decimal64TypeMethodsImpl.md)
- [DisplayHintSpec](MaapiSchemas/DisplayHintSpec.md)
- [DisplayHintTypeMethodsImpl](MaapiSchemas/DisplayHintTypeMethodsImpl.md)
- [EnumTypeMethodsImpl](MaapiSchemas/EnumTypeMethodsImpl.md)
- [IdentityTypeMethodsImpl](MaapiSchemas/IdentityTypeMethodsImpl.md)
- [ListRestrictionTypeMethodsImpl](MaapiSchemas/ListRestrictionTypeMethodsImpl.md)
- [ListTypeMethodsImpl](MaapiSchemas/ListTypeMethodsImpl.md)
- [MountId](MaapiSchemas/MountId.md)
- [MountIdLRUMap](MaapiSchemas/MountIdLRUMap.md)
- [RetrictedNumberTypeMethodsImpl](MaapiSchemas/RetrictedNumberTypeMethodsImpl.md)
- [StringTypeMethodsImpl](MaapiSchemas/StringTypeMethodsImpl.md)
- [UnionTypeMethodsImpl](MaapiSchemas/UnionTypeMethodsImpl.md)
