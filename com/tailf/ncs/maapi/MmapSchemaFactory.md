<a id="s-MmapSchemaFactory"></a>
# MmapSchemaFactory

```java
public class com.tailf.ncs.maapi.MmapSchemaFactory
```

Factory for constructing ConfValue (default and ranges) and Schema objects
 from the memory-mappable capnproto schema file.

## Members

**Constructors**:

- [MmapSchemaFactory(MmapSchema, SchemaLookup)](#s-MmapSchemaFactory-1)

**Methods**:

- [findChild(MmapCSNode, CSMNsMap, int)](#s-findChild)
- [findChild(MmapCSNode, int, int)](#s-findChild-1)
- [getChildren(Level)](#s-getChildren)
- [getHashDb()](#s-getHashDb)
- [getMnsMapDb()](#s-getMnsMapDb)
- [getMountPointDb()](#s-getMountPointDb)
- [getNsDb()](#s-getNsDb)
- [getRootLevel()](#s-getRootLevel)
- [lookupCSTypes(Reader<Reader>)](#s-lookupCSTypes)
- [makeCSChoice(CSNode, CSCase, Reader<Reader>)](#s-makeCSChoice)
- [makeCSNode(MmapCSNode, Child)](#s-makeCSNode)
- [makeCSNode(MmapCSNode, int)](#s-makeCSNode-1)
- [makeCSNodeInfo(CSNode, CSSchema, Reader, int)](#s-makeCSNodeInfo)
- [makeCSRoot(int, int, CSSchema, List<CSNode>)](#s-makeCSRoot)
- [makeCSType(int, Reader)](#s-makeCSType)
- [makeCSTypeBits(Reader, CSType)](#s-makeCSTypeBits)
- [makeCSTypeDecimal64(Reader, CSType)](#s-makeCSTypeDecimal64)
- [makeCSTypeDisplayHint(Reader, CSType)](#s-makeCSTypeDisplayHint)
- [makeCSTypeEnum(Reader, CSType)](#s-makeCSTypeEnum)
- [makeCSTypeIdref(Reader, CSType)](#s-makeCSTypeIdref)
- [makeCSTypeList(Reader, CSType)](#s-makeCSTypeList)
- [makeCSTypeListRestriction(Reader, CSType)](#s-makeCSTypeListRestriction)
- [makeCSTypeNumber(int, Reader, CSType)](#s-makeCSTypeNumber)
- [makeCSTypeRangeArray(Reader<Reader>)](#s-makeCSTypeRangeArray)
- [makeCSTypeString(Reader, CSType)](#s-makeCSTypeString)
- [makeCSTypeUnion(Reader, CSType)](#s-makeCSTypeUnion)

## Constructors

<a id="s-MmapSchemaFactory-1"></a>
### MmapSchemaFactory(MmapSchema, SchemaLookup)

**Package-private**

```java
MmapSchemaFactory(
    com.tailf.ncs.maapi.MmapSchema mmapSchema,
    com.tailf.ncs.maapi.MmapMaapiSchemas.SchemaLookup schemaLookup
)
```

Types: [MmapSchema](MmapSchema.md#s-MmapSchema), [SchemaLookup](MmapMaapiSchemas/SchemaLookup.md#s-SchemaLookup)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema mmapSchema`
- `com.tailf.ncs.maapi.MmapMaapiSchemas.SchemaLookup schemaLookup`


## Methods

<a id="s-findChild"></a>
### findChild(MmapCSNode, CSMNsMap, int)

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Child findChild(
    com.tailf.ncs.maapi.MmapCSNode parent,
    com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap,
    int htag
)
```

Types: [Child](MmapSchema/Child.md#s-Child), [MmapCSNode](MmapCSNode.md#s-MmapCSNode), [CSMNsMap](../../maapi/MaapiSchemas/CSMNsMap.md#s-CSMNsMap)

**Parameters**

- `com.tailf.ncs.maapi.MmapCSNode parent`
- `com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap`
- `int htag`

<a id="s-findChild-1"></a>
### findChild(MmapCSNode, int, int)

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Child findChild(
    com.tailf.ncs.maapi.MmapCSNode parent,
    int hns,
    int htag
)
```

Types: [Child](MmapSchema/Child.md#s-Child), [MmapCSNode](MmapCSNode.md#s-MmapCSNode)

**Parameters**

- `com.tailf.ncs.maapi.MmapCSNode parent`
- `int hns`
- `int htag`

<a id="s-getChildren"></a>
### getChildren(Level)

```java
protected Iterable<com.tailf.ncs.maapi.MmapSchema.Child> getChildren(
    com.tailf.ncs.maapi.MmapSchema.Level level
)
```

Types: [Child](MmapSchema/Child.md#s-Child), [Level](MmapSchema/Level.md#s-Level)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Level level`

<a id="s-getHashDb"></a>
### getHashDb()

**Package-private**

```java
com.tailf.ncs.maapi.Schema.HashDb.Reader getHashDb() throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/HashDb/Reader.md#s-Reader), [MmapSchemaException](MmapSchemaException.md#s-MmapSchemaException)

<a id="s-getMnsMapDb"></a>
### getMnsMapDb()

**Package-private**

```java
com.tailf.ncs.maapi.Schema.MNsMapDb.Reader getMnsMapDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/MNsMapDb/Reader.md#s-Reader), [MmapSchemaException](MmapSchemaException.md#s-MmapSchemaException)

<a id="s-getMountPointDb"></a>
### getMountPointDb()

**Package-private**

```java
com.tailf.ncs.maapi.Schema.MountPointDb.Reader getMountPointDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/MountPointDb/Reader.md#s-Reader), [MmapSchemaException](MmapSchemaException.md#s-MmapSchemaException)

<a id="s-getNsDb"></a>
### getNsDb()

**Package-private**

```java
com.tailf.ncs.maapi.Schema.NsDb.Reader getNsDb() throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/NsDb/Reader.md#s-Reader), [MmapSchemaException](MmapSchemaException.md#s-MmapSchemaException)

<a id="s-getRootLevel"></a>
### getRootLevel()

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Level getRootLevel()
```

Types: [Level](MmapSchema/Level.md#s-Level)

<a id="s-lookupCSTypes"></a>
### lookupCSTypes(Reader<Reader>)

```java
protected com.tailf.maapi.MaapiSchemas.CSType[] lookupCSTypes(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeReference.Reader> referencesr
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#s-CSType), [Reader](Schema/CsTypeReference/Reader.md#s-Reader), [MmapSchemaException](MmapSchemaException.md#s-MmapSchemaException)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeReference.Reader> referencesr`

<a id="s-makeCSChoice"></a>
### makeCSChoice(CSNode, CSCase, Reader<Reader>)

```java
protected com.tailf.maapi.MaapiSchemas.CSChoice makeCSChoice(
    com.tailf.maapi.MaapiSchemas.CSNode parentNode,
    com.tailf.maapi.MaapiSchemas.CSCase caseParent,
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsChoice.Reader> choices
)
```

Types: [CSChoice](../../maapi/MaapiSchemas/CSChoice.md#s-CSChoice), [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode), [CSCase](../../maapi/MaapiSchemas/CSCase.md#s-CSCase), [Reader](Schema/CsChoice/Reader.md#s-Reader)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode parentNode`
- `com.tailf.maapi.MaapiSchemas.CSCase caseParent`
- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsChoice.Reader> choices`

<a id="s-makeCSNode"></a>
### makeCSNode(MmapCSNode, Child)

```java
protected com.tailf.maapi.MaapiSchemas.CSNode makeCSNode(
    com.tailf.ncs.maapi.MmapCSNode parent,
    com.tailf.ncs.maapi.MmapSchema.Child child
)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode), [MmapCSNode](MmapCSNode.md#s-MmapCSNode), [Child](MmapSchema/Child.md#s-Child)

**Parameters**

- `com.tailf.ncs.maapi.MmapCSNode parent`
- `com.tailf.ncs.maapi.MmapSchema.Child child`

<a id="s-makeCSNode-1"></a>
### makeCSNode(MmapCSNode, int)

```java
protected com.tailf.maapi.MaapiSchemas.CSNode makeCSNode(
    com.tailf.ncs.maapi.MmapCSNode parent,
    int childIdx
)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode), [MmapCSNode](MmapCSNode.md#s-MmapCSNode)

**Parameters**

- `com.tailf.ncs.maapi.MmapCSNode parent`
- `int childIdx`

<a id="s-makeCSNodeInfo"></a>
### makeCSNodeInfo(CSNode, CSSchema, Reader, int)

```java
protected com.tailf.maapi.MaapiSchemas.CSNodeInfo makeCSNodeInfo(
    com.tailf.maapi.MaapiSchemas.CSNode csNode,
    com.tailf.maapi.MaapiSchemas.CSSchema schema,
    com.tailf.ncs.maapi.Schema.Cs.Reader cs,
    int csIdx
)
```

Types: [CSNodeInfo](../../maapi/MaapiSchemas/CSNodeInfo.md#s-CSNodeInfo), [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode), [CSSchema](../../maapi/MaapiSchemas/CSSchema.md#s-CSSchema), [Reader](Schema/Cs/Reader.md#s-Reader)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode csNode`
- `com.tailf.maapi.MaapiSchemas.CSSchema schema`
- `com.tailf.ncs.maapi.Schema.Cs.Reader cs`
- `int csIdx`

<a id="s-makeCSRoot"></a>
### makeCSRoot(int, int, CSSchema, List<CSNode>)

```java
protected com.tailf.maapi.MaapiSchemas.CSNode makeCSRoot(
    int hns,
    int htag,
    com.tailf.maapi.MaapiSchemas.CSSchema schema,
    java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> siblings
)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode), [CSSchema](../../maapi/MaapiSchemas/CSSchema.md#s-CSSchema)

**Parameters**

- `int hns`
- `int htag`
- `com.tailf.maapi.MaapiSchemas.CSSchema schema`
- `java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> siblings`

<a id="s-makeCSType"></a>
### makeCSType(int, Reader)

```java
protected com.tailf.maapi.MaapiSchemas.CSType makeCSType(
    int shallowType,
    com.tailf.ncs.maapi.Schema.CsType.Reader csType
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#s-CSType), [Reader](Schema/CsType/Reader.md#s-Reader), [MmapSchemaException](MmapSchemaException.md#s-MmapSchemaException)

**Parameters**

- `int shallowType`
- `com.tailf.ncs.maapi.Schema.CsType.Reader csType`

<a id="s-makeCSTypeBits"></a>
### makeCSTypeBits(Reader, CSType)

```java
protected static com.tailf.maapi.MaapiSchemas.CSType makeCSTypeBits(
    com.tailf.ncs.maapi.Schema.CsTypeBits.Reader bitsr,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#s-CSType), [Reader](Schema/CsTypeBits/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeBits.Reader bitsr`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

<a id="s-makeCSTypeDecimal64"></a>
### makeCSTypeDecimal64(Reader, CSType)

```java
protected static com.tailf.maapi.MaapiSchemas.CSType makeCSTypeDecimal64(
    com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Reader d64,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#s-CSType), [Reader](Schema/CsTypeDecimal64/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Reader d64`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

<a id="s-makeCSTypeDisplayHint"></a>
### makeCSTypeDisplayHint(Reader, CSType)

```java
protected static com.tailf.maapi.MaapiSchemas.CSType makeCSTypeDisplayHint(
    com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader csType,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#s-CSType), [Reader](Schema/CsTypeDisplayHint/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader csType`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

<a id="s-makeCSTypeEnum"></a>
### makeCSTypeEnum(Reader, CSType)

```java
protected static com.tailf.maapi.MaapiSchemas.CSType makeCSTypeEnum(
    com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader aEnum,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#s-CSType), [Reader](Schema/CsTypeEnum/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader aEnum`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

<a id="s-makeCSTypeIdref"></a>
### makeCSTypeIdref(Reader, CSType)

```java
protected static com.tailf.maapi.MaapiSchemas.CSType makeCSTypeIdref(
    com.tailf.ncs.maapi.Schema.CsTypeIdref.Reader idrefr,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#s-CSType), [Reader](Schema/CsTypeIdref/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeIdref.Reader idrefr`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

<a id="s-makeCSTypeList"></a>
### makeCSTypeList(Reader, CSType)

```java
protected com.tailf.maapi.MaapiSchemas.CSType makeCSTypeList(
    com.tailf.ncs.maapi.Schema.CsTypeList.Reader l,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#s-CSType), [Reader](Schema/CsTypeList/Reader.md#s-Reader), [MmapSchemaException](MmapSchemaException.md#s-MmapSchemaException)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeList.Reader l`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

<a id="s-makeCSTypeListRestriction"></a>
### makeCSTypeListRestriction(Reader, CSType)

```java
protected static com.tailf.maapi.MaapiSchemas.CSType makeCSTypeListRestriction(
    com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Reader csType,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#s-CSType), [Reader](Schema/CsTypeListRestriction/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Reader csType`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

<a id="s-makeCSTypeNumber"></a>
### makeCSTypeNumber(int, Reader, CSType)

```java
protected static com.tailf.maapi.MaapiSchemas.CSType makeCSTypeNumber(
    int shallowType,
    com.tailf.ncs.maapi.Schema.CsTypeNumber.Reader csType,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#s-CSType), [Reader](Schema/CsTypeNumber/Reader.md#s-Reader)

**Parameters**

- `int shallowType`
- `com.tailf.ncs.maapi.Schema.CsTypeNumber.Reader csType`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

<a id="s-makeCSTypeRangeArray"></a>
### makeCSTypeRangeArray(Reader<Reader>)

```java
protected static com.tailf.maapi.MaapiSchemas.CSTypeRange[] makeCSTypeRangeArray(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> rangesr
)
```

Types: [CSTypeRange](../../maapi/MaapiSchemas/CSTypeRange.md#s-CSTypeRange), [Reader](Schema/Range/Reader.md#s-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> rangesr`

<a id="s-makeCSTypeString"></a>
### makeCSTypeString(Reader, CSType)

```java
protected static com.tailf.maapi.MaapiSchemas.CSType makeCSTypeString(
    com.tailf.ncs.maapi.Schema.CsTypeString.Reader csType,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#s-CSType), [Reader](Schema/CsTypeString/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeString.Reader csType`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

<a id="s-makeCSTypeUnion"></a>
### makeCSTypeUnion(Reader, CSType)

```java
protected com.tailf.maapi.MaapiSchemas.CSType makeCSTypeUnion(
    com.tailf.ncs.maapi.Schema.CsTypeUnion.Reader u,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#s-CSType), [Reader](Schema/CsTypeUnion/Reader.md#s-Reader), [MmapSchemaException](MmapSchemaException.md#s-MmapSchemaException)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeUnion.Reader u`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`
