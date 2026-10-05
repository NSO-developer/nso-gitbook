<a id="cls-MmapSchemaFactory"></a>
# MmapSchemaFactory

```java
public class com.tailf.ncs.maapi.MmapSchemaFactory
```

Factory for constructing ConfValue (default and ranges) and Schema objects
 from the memory-mappable capnproto schema file.

## Members

**Constructors**:

- [MmapSchemaFactory(MmapSchema, SchemaLookup)](#m-mmapschemafactory-02496b09ceb8)

**Methods**:

- [findChild(MmapCSNode, CSMNsMap, int)](#m-findchild-59723d77ce04)
- [findChild(MmapCSNode, int, int)](#m-findchild-f5cfc441caa5)
- [getChildren(Level)](#m-getchildren-f609229c3d1b)
- [getHashDb()](#m-gethashdb-e75daa0effae)
- [getMnsMapDb()](#m-getmnsmapdb-908581232215)
- [getMountPointDb()](#m-getmountpointdb-32131a12db04)
- [getNsDb()](#m-getnsdb-3babeb353172)
- [getRootLevel()](#m-getrootlevel-e49164e18650)
- [lookupCSTypes(Reader<Reader>)](#m-lookupcstypes-60e79757ffda)
- [makeCSChoice(CSNode, CSCase, Reader<Reader>)](#m-makecschoice-d388221a3673)
- [makeCSNode(MmapCSNode, Child)](#m-makecsnode-0bd521678531)
- [makeCSNode(MmapCSNode, int)](#m-makecsnode-8b300a95d544)
- [makeCSNodeInfo(CSNode, CSSchema, Reader, int)](#m-makecsnodeinfo-931b4e653bae)
- [makeCSRoot(int, int, CSSchema, List<CSNode>)](#m-makecsroot-e163411e6b2f)
- [makeCSType(int, Reader)](#m-makecstype-a31b505d063e)
- [makeCSTypeBits(Reader, CSType)](#m-makecstypebits-0c69839e71ad)
- [makeCSTypeDecimal64(Reader, CSType)](#m-makecstypedecimal64-f6b0c5408f54)
- [makeCSTypeDisplayHint(Reader, CSType)](#m-makecstypedisplayhint-3065ba550816)
- [makeCSTypeEnum(Reader, CSType)](#m-makecstypeenum-056633384f04)
- [makeCSTypeIdref(Reader, CSType)](#m-makecstypeidref-9d16e7b3d78b)
- [makeCSTypeList(Reader, CSType)](#m-makecstypelist-fd7ca47b4fb9)
- [makeCSTypeListRestriction(Reader, CSType)](#m-makecstypelistrestriction-0d4c8f9bd4be)
- [makeCSTypeNumber(int, Reader, CSType)](#m-makecstypenumber-4035fabd7771)
- [makeCSTypeRangeArray(Reader<Reader>)](#m-makecstyperangearray-f4c1155d4bc5)
- [makeCSTypeString(Reader, CSType)](#m-makecstypestring-bf018492601d)
- [makeCSTypeUnion(Reader, CSType)](#m-makecstypeunion-55d1543c92b9)

## Constructors

<a id="m-mmapschemafactory-02496b09ceb8"></a>
### MmapSchemaFactory(MmapSchema, SchemaLookup)

**Package-private**

```java
MmapSchemaFactory(
    com.tailf.ncs.maapi.MmapSchema mmapSchema,
    com.tailf.ncs.maapi.MmapMaapiSchemas.SchemaLookup schemaLookup
)
```

Types: [MmapSchema](MmapSchema.md#cls-MmapSchema), [SchemaLookup](MmapMaapiSchemas/SchemaLookup.md#cls-SchemaLookup)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema mmapSchema`
- `com.tailf.ncs.maapi.MmapMaapiSchemas.SchemaLookup schemaLookup`


## Methods

<a id="m-findchild-59723d77ce04"></a>
### findChild(MmapCSNode, CSMNsMap, int)

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Child findChild(
    com.tailf.ncs.maapi.MmapCSNode parent,
    com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap,
    int htag
)
```

Types: [Child](MmapSchema/Child.md#cls-Child), [MmapCSNode](MmapCSNode.md#cls-MmapCSNode), [CSMNsMap](../../maapi/MaapiSchemas/CSMNsMap.md#cls-CSMNsMap)

**Parameters**

- `com.tailf.ncs.maapi.MmapCSNode parent`
- `com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap`
- `int htag`

<a id="m-findchild-f5cfc441caa5"></a>
### findChild(MmapCSNode, int, int)

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Child findChild(
    com.tailf.ncs.maapi.MmapCSNode parent,
    int hns,
    int htag
)
```

Types: [Child](MmapSchema/Child.md#cls-Child), [MmapCSNode](MmapCSNode.md#cls-MmapCSNode)

**Parameters**

- `com.tailf.ncs.maapi.MmapCSNode parent`
- `int hns`
- `int htag`

<a id="m-getchildren-f609229c3d1b"></a>
### getChildren(Level)

```java
protected Iterable<com.tailf.ncs.maapi.MmapSchema.Child> getChildren(
    com.tailf.ncs.maapi.MmapSchema.Level level
)
```

Types: [Child](MmapSchema/Child.md#cls-Child), [Level](MmapSchema/Level.md#cls-Level)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Level level`

<a id="m-gethashdb-e75daa0effae"></a>
### getHashDb()

**Package-private**

```java
com.tailf.ncs.maapi.Schema.HashDb.Reader getHashDb() throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/HashDb/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

<a id="m-getmnsmapdb-908581232215"></a>
### getMnsMapDb()

**Package-private**

```java
com.tailf.ncs.maapi.Schema.MNsMapDb.Reader getMnsMapDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/MNsMapDb/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

<a id="m-getmountpointdb-32131a12db04"></a>
### getMountPointDb()

**Package-private**

```java
com.tailf.ncs.maapi.Schema.MountPointDb.Reader getMountPointDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/MountPointDb/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

<a id="m-getnsdb-3babeb353172"></a>
### getNsDb()

**Package-private**

```java
com.tailf.ncs.maapi.Schema.NsDb.Reader getNsDb() throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/NsDb/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

<a id="m-getrootlevel-e49164e18650"></a>
### getRootLevel()

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Level getRootLevel()
```

Types: [Level](MmapSchema/Level.md#cls-Level)

<a id="m-lookupcstypes-60e79757ffda"></a>
### lookupCSTypes(Reader<Reader>)

```java
protected com.tailf.maapi.MaapiSchemas.CSType[] lookupCSTypes(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeReference.Reader> referencesr
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cls-CSType), [Reader](Schema/CsTypeReference/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeReference.Reader> referencesr`

<a id="m-makecschoice-d388221a3673"></a>
### makeCSChoice(CSNode, CSCase, Reader<Reader>)

```java
protected com.tailf.maapi.MaapiSchemas.CSChoice makeCSChoice(
    com.tailf.maapi.MaapiSchemas.CSNode parentNode,
    com.tailf.maapi.MaapiSchemas.CSCase caseParent,
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsChoice.Reader> choices
)
```

Types: [CSChoice](../../maapi/MaapiSchemas/CSChoice.md#cls-CSChoice), [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [CSCase](../../maapi/MaapiSchemas/CSCase.md#cls-CSCase), [Reader](Schema/CsChoice/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode parentNode`
- `com.tailf.maapi.MaapiSchemas.CSCase caseParent`
- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsChoice.Reader> choices`

<a id="m-makecsnode-0bd521678531"></a>
### makeCSNode(MmapCSNode, Child)

```java
protected com.tailf.maapi.MaapiSchemas.CSNode makeCSNode(
    com.tailf.ncs.maapi.MmapCSNode parent,
    com.tailf.ncs.maapi.MmapSchema.Child child
)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [MmapCSNode](MmapCSNode.md#cls-MmapCSNode), [Child](MmapSchema/Child.md#cls-Child)

**Parameters**

- `com.tailf.ncs.maapi.MmapCSNode parent`
- `com.tailf.ncs.maapi.MmapSchema.Child child`

<a id="m-makecsnode-8b300a95d544"></a>
### makeCSNode(MmapCSNode, int)

```java
protected com.tailf.maapi.MaapiSchemas.CSNode makeCSNode(
    com.tailf.ncs.maapi.MmapCSNode parent,
    int childIdx
)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [MmapCSNode](MmapCSNode.md#cls-MmapCSNode)

**Parameters**

- `com.tailf.ncs.maapi.MmapCSNode parent`
- `int childIdx`

<a id="m-makecsnodeinfo-931b4e653bae"></a>
### makeCSNodeInfo(CSNode, CSSchema, Reader, int)

```java
protected com.tailf.maapi.MaapiSchemas.CSNodeInfo makeCSNodeInfo(
    com.tailf.maapi.MaapiSchemas.CSNode csNode,
    com.tailf.maapi.MaapiSchemas.CSSchema schema,
    com.tailf.ncs.maapi.Schema.Cs.Reader cs,
    int csIdx
)
```

Types: [CSNodeInfo](../../maapi/MaapiSchemas/CSNodeInfo.md#cls-CSNodeInfo), [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [CSSchema](../../maapi/MaapiSchemas/CSSchema.md#cls-CSSchema), [Reader](Schema/Cs/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode csNode`
- `com.tailf.maapi.MaapiSchemas.CSSchema schema`
- `com.tailf.ncs.maapi.Schema.Cs.Reader cs`
- `int csIdx`

<a id="m-makecsroot-e163411e6b2f"></a>
### makeCSRoot(int, int, CSSchema, List<CSNode>)

```java
protected com.tailf.maapi.MaapiSchemas.CSNode makeCSRoot(
    int hns,
    int htag,
    com.tailf.maapi.MaapiSchemas.CSSchema schema,
    java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> siblings
)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [CSSchema](../../maapi/MaapiSchemas/CSSchema.md#cls-CSSchema)

**Parameters**

- `int hns`
- `int htag`
- `com.tailf.maapi.MaapiSchemas.CSSchema schema`
- `java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> siblings`

<a id="m-makecstype-a31b505d063e"></a>
### makeCSType(int, Reader)

```java
protected com.tailf.maapi.MaapiSchemas.CSType makeCSType(
    int shallowType,
    com.tailf.ncs.maapi.Schema.CsType.Reader csType
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cls-CSType), [Reader](Schema/CsType/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

**Parameters**

- `int shallowType`
- `com.tailf.ncs.maapi.Schema.CsType.Reader csType`

<a id="m-makecstypebits-0c69839e71ad"></a>
### makeCSTypeBits(Reader, CSType)

```java
protected static com.tailf.maapi.MaapiSchemas.CSType makeCSTypeBits(
    com.tailf.ncs.maapi.Schema.CsTypeBits.Reader bitsr,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cls-CSType), [Reader](Schema/CsTypeBits/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeBits.Reader bitsr`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

<a id="m-makecstypedecimal64-f6b0c5408f54"></a>
### makeCSTypeDecimal64(Reader, CSType)

```java
protected static com.tailf.maapi.MaapiSchemas.CSType makeCSTypeDecimal64(
    com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Reader d64,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cls-CSType), [Reader](Schema/CsTypeDecimal64/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Reader d64`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

<a id="m-makecstypedisplayhint-3065ba550816"></a>
### makeCSTypeDisplayHint(Reader, CSType)

```java
protected static com.tailf.maapi.MaapiSchemas.CSType makeCSTypeDisplayHint(
    com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader csType,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cls-CSType), [Reader](Schema/CsTypeDisplayHint/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader csType`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

<a id="m-makecstypeenum-056633384f04"></a>
### makeCSTypeEnum(Reader, CSType)

```java
protected static com.tailf.maapi.MaapiSchemas.CSType makeCSTypeEnum(
    com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader aEnum,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cls-CSType), [Reader](Schema/CsTypeEnum/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader aEnum`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

<a id="m-makecstypeidref-9d16e7b3d78b"></a>
### makeCSTypeIdref(Reader, CSType)

```java
protected static com.tailf.maapi.MaapiSchemas.CSType makeCSTypeIdref(
    com.tailf.ncs.maapi.Schema.CsTypeIdref.Reader idrefr,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cls-CSType), [Reader](Schema/CsTypeIdref/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeIdref.Reader idrefr`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

<a id="m-makecstypelist-fd7ca47b4fb9"></a>
### makeCSTypeList(Reader, CSType)

```java
protected com.tailf.maapi.MaapiSchemas.CSType makeCSTypeList(
    com.tailf.ncs.maapi.Schema.CsTypeList.Reader l,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cls-CSType), [Reader](Schema/CsTypeList/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeList.Reader l`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

<a id="m-makecstypelistrestriction-0d4c8f9bd4be"></a>
### makeCSTypeListRestriction(Reader, CSType)

```java
protected static com.tailf.maapi.MaapiSchemas.CSType makeCSTypeListRestriction(
    com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Reader csType,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cls-CSType), [Reader](Schema/CsTypeListRestriction/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Reader csType`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

<a id="m-makecstypenumber-4035fabd7771"></a>
### makeCSTypeNumber(int, Reader, CSType)

```java
protected static com.tailf.maapi.MaapiSchemas.CSType makeCSTypeNumber(
    int shallowType,
    com.tailf.ncs.maapi.Schema.CsTypeNumber.Reader csType,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cls-CSType), [Reader](Schema/CsTypeNumber/Reader.md#cls-Reader)

**Parameters**

- `int shallowType`
- `com.tailf.ncs.maapi.Schema.CsTypeNumber.Reader csType`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

<a id="m-makecstyperangearray-f4c1155d4bc5"></a>
### makeCSTypeRangeArray(Reader<Reader>)

```java
protected static com.tailf.maapi.MaapiSchemas.CSTypeRange[] makeCSTypeRangeArray(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> rangesr
)
```

Types: [CSTypeRange](../../maapi/MaapiSchemas/CSTypeRange.md#cls-CSTypeRange), [Reader](Schema/Range/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> rangesr`

<a id="m-makecstypestring-bf018492601d"></a>
### makeCSTypeString(Reader, CSType)

```java
protected static com.tailf.maapi.MaapiSchemas.CSType makeCSTypeString(
    com.tailf.ncs.maapi.Schema.CsTypeString.Reader csType,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cls-CSType), [Reader](Schema/CsTypeString/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeString.Reader csType`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

<a id="m-makecstypeunion-55d1543c92b9"></a>
### makeCSTypeUnion(Reader, CSType)

```java
protected com.tailf.maapi.MaapiSchemas.CSType makeCSTypeUnion(
    com.tailf.ncs.maapi.Schema.CsTypeUnion.Reader u,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cls-CSType), [Reader](Schema/CsTypeUnion/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeUnion.Reader u`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`
