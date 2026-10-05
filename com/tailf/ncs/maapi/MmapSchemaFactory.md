# MmapSchemaFactory <a href="#cls-MmapSchemaFactory" id="cls-MmapSchemaFactory"></a>

```java
public class com.tailf.ncs.maapi.MmapSchemaFactory
```

Factory for constructing ConfValue (default and ranges) and Schema objects
 from the memory-mappable capnproto schema file.

## Members

**Constructors**:

- [MmapSchemaFactory(MmapSchema, SchemaLookup)](#m-MmapSchemaFactory-02496b09ceb8)

**Methods**:

- [findChild(MmapCSNode, CSMNsMap, int)](#m-findChild-59723d77ce04)
- [findChild(MmapCSNode, int, int)](#m-findChild-f5cfc441caa5)
- [getChildren(Level)](#m-getChildren-f609229c3d1b)
- [getHashDb()](#m-getHashDb-e75daa0effae)
- [getMnsMapDb()](#m-getMnsMapDb-908581232215)
- [getMountPointDb()](#m-getMountPointDb-32131a12db04)
- [getNsDb()](#m-getNsDb-3babeb353172)
- [getRootLevel()](#m-getRootLevel-e49164e18650)
- [lookupCSTypes(Reader<Reader>)](#m-lookupCSTypes-60e79757ffda)
- [makeCSChoice(CSNode, CSCase, Reader<Reader>)](#m-makeCSChoice-d388221a3673)
- [makeCSNode(MmapCSNode, Child)](#m-makeCSNode-0bd521678531)
- [makeCSNode(MmapCSNode, int)](#m-makeCSNode-8b300a95d544)
- [makeCSNodeInfo(CSNode, CSSchema, Reader, int)](#m-makeCSNodeInfo-931b4e653bae)
- [makeCSRoot(int, int, CSSchema, List<CSNode>)](#m-makeCSRoot-e163411e6b2f)
- [makeCSType(int, Reader)](#m-makeCSType-a31b505d063e)
- [makeCSTypeBits(Reader, CSType)](#m-makeCSTypeBits-0c69839e71ad)
- [makeCSTypeDecimal64(Reader, CSType)](#m-makeCSTypeDecimal64-f6b0c5408f54)
- [makeCSTypeDisplayHint(Reader, CSType)](#m-makeCSTypeDisplayHint-3065ba550816)
- [makeCSTypeEnum(Reader, CSType)](#m-makeCSTypeEnum-056633384f04)
- [makeCSTypeIdref(Reader, CSType)](#m-makeCSTypeIdref-9d16e7b3d78b)
- [makeCSTypeList(Reader, CSType)](#m-makeCSTypeList-fd7ca47b4fb9)
- [makeCSTypeListRestriction(Reader, CSType)](#m-makeCSTypeListRestriction-0d4c8f9bd4be)
- [makeCSTypeNumber(int, Reader, CSType)](#m-makeCSTypeNumber-4035fabd7771)
- [makeCSTypeRangeArray(Reader<Reader>)](#m-makeCSTypeRangeArray-f4c1155d4bc5)
- [makeCSTypeString(Reader, CSType)](#m-makeCSTypeString-bf018492601d)
- [makeCSTypeUnion(Reader, CSType)](#m-makeCSTypeUnion-55d1543c92b9)

## Constructors

### MmapSchemaFactory(MmapSchema, SchemaLookup) <a href="#m-MmapSchemaFactory-02496b09ceb8" id="m-MmapSchemaFactory-02496b09ceb8"></a>

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

### findChild(MmapCSNode, CSMNsMap, int) <a href="#m-findChild-59723d77ce04" id="m-findChild-59723d77ce04"></a>

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

### findChild(MmapCSNode, int, int) <a href="#m-findChild-f5cfc441caa5" id="m-findChild-f5cfc441caa5"></a>

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

### getChildren(Level) <a href="#m-getChildren-f609229c3d1b" id="m-getChildren-f609229c3d1b"></a>

```java
protected Iterable<com.tailf.ncs.maapi.MmapSchema.Child> getChildren(
    com.tailf.ncs.maapi.MmapSchema.Level level
)
```

Types: [Child](MmapSchema/Child.md#cls-Child), [Level](MmapSchema/Level.md#cls-Level)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Level level`

### getHashDb() <a href="#m-getHashDb-e75daa0effae" id="m-getHashDb-e75daa0effae"></a>

**Package-private**

```java
com.tailf.ncs.maapi.Schema.HashDb.Reader getHashDb() throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/HashDb/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

### getMnsMapDb() <a href="#m-getMnsMapDb-908581232215" id="m-getMnsMapDb-908581232215"></a>

**Package-private**

```java
com.tailf.ncs.maapi.Schema.MNsMapDb.Reader getMnsMapDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/MNsMapDb/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

### getMountPointDb() <a href="#m-getMountPointDb-32131a12db04" id="m-getMountPointDb-32131a12db04"></a>

**Package-private**

```java
com.tailf.ncs.maapi.Schema.MountPointDb.Reader getMountPointDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/MountPointDb/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

### getNsDb() <a href="#m-getNsDb-3babeb353172" id="m-getNsDb-3babeb353172"></a>

**Package-private**

```java
com.tailf.ncs.maapi.Schema.NsDb.Reader getNsDb() throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/NsDb/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

### getRootLevel() <a href="#m-getRootLevel-e49164e18650" id="m-getRootLevel-e49164e18650"></a>

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Level getRootLevel()
```

Types: [Level](MmapSchema/Level.md#cls-Level)

### lookupCSTypes(Reader<Reader>) <a href="#m-lookupCSTypes-60e79757ffda" id="m-lookupCSTypes-60e79757ffda"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSType[] lookupCSTypes(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeReference.Reader> referencesr
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cls-CSType), [Reader](Schema/CsTypeReference/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeReference.Reader> referencesr`

### makeCSChoice(CSNode, CSCase, Reader<Reader>) <a href="#m-makeCSChoice-d388221a3673" id="m-makeCSChoice-d388221a3673"></a>

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

### makeCSNode(MmapCSNode, Child) <a href="#m-makeCSNode-0bd521678531" id="m-makeCSNode-0bd521678531"></a>

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

### makeCSNode(MmapCSNode, int) <a href="#m-makeCSNode-8b300a95d544" id="m-makeCSNode-8b300a95d544"></a>

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

### makeCSNodeInfo(CSNode, CSSchema, Reader, int) <a href="#m-makeCSNodeInfo-931b4e653bae" id="m-makeCSNodeInfo-931b4e653bae"></a>

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

### makeCSRoot(int, int, CSSchema, List<CSNode>) <a href="#m-makeCSRoot-e163411e6b2f" id="m-makeCSRoot-e163411e6b2f"></a>

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

### makeCSType(int, Reader) <a href="#m-makeCSType-a31b505d063e" id="m-makeCSType-a31b505d063e"></a>

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

### makeCSTypeBits(Reader, CSType) <a href="#m-makeCSTypeBits-0c69839e71ad" id="m-makeCSTypeBits-0c69839e71ad"></a>

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

### makeCSTypeDecimal64(Reader, CSType) <a href="#m-makeCSTypeDecimal64-f6b0c5408f54" id="m-makeCSTypeDecimal64-f6b0c5408f54"></a>

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

### makeCSTypeDisplayHint(Reader, CSType) <a href="#m-makeCSTypeDisplayHint-3065ba550816" id="m-makeCSTypeDisplayHint-3065ba550816"></a>

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

### makeCSTypeEnum(Reader, CSType) <a href="#m-makeCSTypeEnum-056633384f04" id="m-makeCSTypeEnum-056633384f04"></a>

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

### makeCSTypeIdref(Reader, CSType) <a href="#m-makeCSTypeIdref-9d16e7b3d78b" id="m-makeCSTypeIdref-9d16e7b3d78b"></a>

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

### makeCSTypeList(Reader, CSType) <a href="#m-makeCSTypeList-fd7ca47b4fb9" id="m-makeCSTypeList-fd7ca47b4fb9"></a>

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

### makeCSTypeListRestriction(Reader, CSType) <a href="#m-makeCSTypeListRestriction-0d4c8f9bd4be" id="m-makeCSTypeListRestriction-0d4c8f9bd4be"></a>

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

### makeCSTypeNumber(int, Reader, CSType) <a href="#m-makeCSTypeNumber-4035fabd7771" id="m-makeCSTypeNumber-4035fabd7771"></a>

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

### makeCSTypeRangeArray(Reader<Reader>) <a href="#m-makeCSTypeRangeArray-f4c1155d4bc5" id="m-makeCSTypeRangeArray-f4c1155d4bc5"></a>

```java
protected static com.tailf.maapi.MaapiSchemas.CSTypeRange[] makeCSTypeRangeArray(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> rangesr
)
```

Types: [CSTypeRange](../../maapi/MaapiSchemas/CSTypeRange.md#cls-CSTypeRange), [Reader](Schema/Range/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> rangesr`

### makeCSTypeString(Reader, CSType) <a href="#m-makeCSTypeString-bf018492601d" id="m-makeCSTypeString-bf018492601d"></a>

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

### makeCSTypeUnion(Reader, CSType) <a href="#m-makeCSTypeUnion-55d1543c92b9" id="m-makeCSTypeUnion-55d1543c92b9"></a>

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
