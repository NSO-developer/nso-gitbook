# MmapSchemaFactory <a href="#mmapschemafactory-d8c770e838b5" id="mmapschemafactory-d8c770e838b5"></a>

```java
public class com.tailf.ncs.maapi.MmapSchemaFactory
```

Factory for constructing ConfValue (default and ranges) and Schema objects
 from the memory-mappable capnproto schema file.

## Members

**Constructors**:

- [MmapSchemaFactory\(MmapSchema, SchemaLookup\)](#mmapschemafactory-02496b09ceb8)

**Methods**:

- [findChild\(MmapCSNode, CSMNsMap, int\)](#findchild-59723d77ce04)
- [findChild\(MmapCSNode, int, int\)](#findchild-f5cfc441caa5)
- [getChildren\(Level\)](#getchildren-f609229c3d1b)
- [getHashDb\(\)](#gethashdb-e75daa0effae)
- [getMnsMapDb\(\)](#getmnsmapdb-908581232215)
- [getMountPointDb\(\)](#getmountpointdb-32131a12db04)
- [getNsDb\(\)](#getnsdb-3babeb353172)
- [getRootLevel\(\)](#getrootlevel-e49164e18650)
- [lookupCSTypes\(Reader\<Reader\>\)](#lookupcstypes-60e79757ffda)
- [makeCSChoice\(CSNode, CSCase, Reader\<Reader\>\)](#makecschoice-d388221a3673)
- [makeCSNode\(MmapCSNode, Child\)](#makecsnode-0bd521678531)
- [makeCSNode\(MmapCSNode, int\)](#makecsnode-8b300a95d544)
- [makeCSNodeInfo\(CSNode, CSSchema, Reader, int\)](#makecsnodeinfo-931b4e653bae)
- [makeCSRoot\(int, int, CSSchema, List\<CSNode\>\)](#makecsroot-e163411e6b2f)
- [makeCSType\(int, Reader\)](#makecstype-a31b505d063e)
- [makeCSTypeBits\(Reader, CSType\)](#makecstypebits-0c69839e71ad)
- [makeCSTypeDecimal64\(Reader, CSType\)](#makecstypedecimal64-f6b0c5408f54)
- [makeCSTypeDisplayHint\(Reader, CSType\)](#makecstypedisplayhint-3065ba550816)
- [makeCSTypeEnum\(Reader, CSType\)](#makecstypeenum-056633384f04)
- [makeCSTypeIdref\(Reader, CSType\)](#makecstypeidref-9d16e7b3d78b)
- [makeCSTypeList\(Reader, CSType\)](#makecstypelist-fd7ca47b4fb9)
- [makeCSTypeListRestriction\(Reader, CSType\)](#makecstypelistrestriction-0d4c8f9bd4be)
- [makeCSTypeNumber\(int, Reader, CSType\)](#makecstypenumber-4035fabd7771)
- [makeCSTypeRangeArray\(Reader\<Reader\>\)](#makecstyperangearray-f4c1155d4bc5)
- [makeCSTypeString\(Reader, CSType\)](#makecstypestring-bf018492601d)
- [makeCSTypeUnion\(Reader, CSType\)](#makecstypeunion-55d1543c92b9)

## Constructors

### MmapSchemaFactory(MmapSchema, SchemaLookup) <a href="#mmapschemafactory-02496b09ceb8" id="mmapschemafactory-02496b09ceb8"></a>

**Package-private**

```java
MmapSchemaFactory(
    com.tailf.ncs.maapi.MmapSchema mmapSchema,
    com.tailf.ncs.maapi.MmapMaapiSchemas.SchemaLookup schemaLookup
)
```

Types: [MmapSchema](MmapSchema.md#mmapschema-8adb607d0eb6), [SchemaLookup](MmapMaapiSchemas/SchemaLookup.md#schemalookup-3497dafb56ea)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema mmapSchema`
- `com.tailf.ncs.maapi.MmapMaapiSchemas.SchemaLookup schemaLookup`


## Methods

### findChild(MmapCSNode, CSMNsMap, int) <a href="#findchild-59723d77ce04" id="findchild-59723d77ce04"></a>

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Child findChild(
    com.tailf.ncs.maapi.MmapCSNode parent,
    com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap,
    int htag
)
```

Types: [Child](MmapSchema/Child.md#child-3362e9a5c263), [MmapCSNode](MmapCSNode.md#mmapcsnode-cd078e4f36a9), [CSMNsMap](../../maapi/MaapiSchemas/CSMNsMap.md#csmnsmap-1123c939e6bb)

**Parameters**

- `com.tailf.ncs.maapi.MmapCSNode parent`
- `com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap`
- `int htag`

### findChild(MmapCSNode, int, int) <a href="#findchild-f5cfc441caa5" id="findchild-f5cfc441caa5"></a>

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Child findChild(
    com.tailf.ncs.maapi.MmapCSNode parent,
    int hns,
    int htag
)
```

Types: [Child](MmapSchema/Child.md#child-3362e9a5c263), [MmapCSNode](MmapCSNode.md#mmapcsnode-cd078e4f36a9)

**Parameters**

- `com.tailf.ncs.maapi.MmapCSNode parent`
- `int hns`
- `int htag`

### getChildren(Level) <a href="#getchildren-f609229c3d1b" id="getchildren-f609229c3d1b"></a>

```java
protected Iterable<com.tailf.ncs.maapi.MmapSchema.Child> getChildren(
    com.tailf.ncs.maapi.MmapSchema.Level level
)
```

Types: [Child](MmapSchema/Child.md#child-3362e9a5c263), [Level](MmapSchema/Level.md#level-1f9faf6c902d)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Level level`

### getHashDb() <a href="#gethashdb-e75daa0effae" id="gethashdb-e75daa0effae"></a>

**Package-private**

```java
com.tailf.ncs.maapi.Schema.HashDb.Reader getHashDb() throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/HashDb/Reader.md#reader-b2467a96ddff), [MmapSchemaException](MmapSchemaException.md#mmapschemaexception-d3943c962514)

### getMnsMapDb() <a href="#getmnsmapdb-908581232215" id="getmnsmapdb-908581232215"></a>

**Package-private**

```java
com.tailf.ncs.maapi.Schema.MNsMapDb.Reader getMnsMapDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/MNsMapDb/Reader.md#reader-b2467a96ddff), [MmapSchemaException](MmapSchemaException.md#mmapschemaexception-d3943c962514)

### getMountPointDb() <a href="#getmountpointdb-32131a12db04" id="getmountpointdb-32131a12db04"></a>

**Package-private**

```java
com.tailf.ncs.maapi.Schema.MountPointDb.Reader getMountPointDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/MountPointDb/Reader.md#reader-b2467a96ddff), [MmapSchemaException](MmapSchemaException.md#mmapschemaexception-d3943c962514)

### getNsDb() <a href="#getnsdb-3babeb353172" id="getnsdb-3babeb353172"></a>

**Package-private**

```java
com.tailf.ncs.maapi.Schema.NsDb.Reader getNsDb() throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/NsDb/Reader.md#reader-b2467a96ddff), [MmapSchemaException](MmapSchemaException.md#mmapschemaexception-d3943c962514)

### getRootLevel() <a href="#getrootlevel-e49164e18650" id="getrootlevel-e49164e18650"></a>

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Level getRootLevel()
```

Types: [Level](MmapSchema/Level.md#level-1f9faf6c902d)

### lookupCSTypes(Reader&lt;Reader&gt;) <a href="#lookupcstypes-60e79757ffda" id="lookupcstypes-60e79757ffda"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSType[] lookupCSTypes(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeReference.Reader> referencesr
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cstype-8bf086cc0595), [Reader](Schema/CsTypeReference/Reader.md#reader-b2467a96ddff), [MmapSchemaException](MmapSchemaException.md#mmapschemaexception-d3943c962514)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeReference.Reader> referencesr`

### makeCSChoice(CSNode, CSCase, Reader&lt;Reader&gt;) <a href="#makecschoice-d388221a3673" id="makecschoice-d388221a3673"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSChoice makeCSChoice(
    com.tailf.maapi.MaapiSchemas.CSNode parentNode,
    com.tailf.maapi.MaapiSchemas.CSCase caseParent,
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsChoice.Reader> choices
)
```

Types: [CSChoice](../../maapi/MaapiSchemas/CSChoice.md#cschoice-7d5d5dd71270), [CSNode](../../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [CSCase](../../maapi/MaapiSchemas/CSCase.md#cscase-26937f56b18d), [Reader](Schema/CsChoice/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode parentNode`
- `com.tailf.maapi.MaapiSchemas.CSCase caseParent`
- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsChoice.Reader> choices`

### makeCSNode(MmapCSNode, Child) <a href="#makecsnode-0bd521678531" id="makecsnode-0bd521678531"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode makeCSNode(
    com.tailf.ncs.maapi.MmapCSNode parent,
    com.tailf.ncs.maapi.MmapSchema.Child child
)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [MmapCSNode](MmapCSNode.md#mmapcsnode-cd078e4f36a9), [Child](MmapSchema/Child.md#child-3362e9a5c263)

**Parameters**

- `com.tailf.ncs.maapi.MmapCSNode parent`
- `com.tailf.ncs.maapi.MmapSchema.Child child`

### makeCSNode(MmapCSNode, int) <a href="#makecsnode-8b300a95d544" id="makecsnode-8b300a95d544"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode makeCSNode(
    com.tailf.ncs.maapi.MmapCSNode parent,
    int childIdx
)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [MmapCSNode](MmapCSNode.md#mmapcsnode-cd078e4f36a9)

**Parameters**

- `com.tailf.ncs.maapi.MmapCSNode parent`
- `int childIdx`

### makeCSNodeInfo(CSNode, CSSchema, Reader, int) <a href="#makecsnodeinfo-931b4e653bae" id="makecsnodeinfo-931b4e653bae"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNodeInfo makeCSNodeInfo(
    com.tailf.maapi.MaapiSchemas.CSNode csNode,
    com.tailf.maapi.MaapiSchemas.CSSchema schema,
    com.tailf.ncs.maapi.Schema.Cs.Reader cs,
    int csIdx
)
```

Types: [CSNodeInfo](../../maapi/MaapiSchemas/CSNodeInfo.md#csnodeinfo-aad17d6161cc), [CSNode](../../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [CSSchema](../../maapi/MaapiSchemas/CSSchema.md#csschema-f51a58180f67), [Reader](Schema/Cs/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode csNode`
- `com.tailf.maapi.MaapiSchemas.CSSchema schema`
- `com.tailf.ncs.maapi.Schema.Cs.Reader cs`
- `int csIdx`

### makeCSRoot(int, int, CSSchema, List&lt;CSNode&gt;) <a href="#makecsroot-e163411e6b2f" id="makecsroot-e163411e6b2f"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode makeCSRoot(
    int hns,
    int htag,
    com.tailf.maapi.MaapiSchemas.CSSchema schema,
    java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> siblings
)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [CSSchema](../../maapi/MaapiSchemas/CSSchema.md#csschema-f51a58180f67)

**Parameters**

- `int hns`
- `int htag`
- `com.tailf.maapi.MaapiSchemas.CSSchema schema`
- `java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> siblings`

### makeCSType(int, Reader) <a href="#makecstype-a31b505d063e" id="makecstype-a31b505d063e"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSType makeCSType(
    int shallowType,
    com.tailf.ncs.maapi.Schema.CsType.Reader csType
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cstype-8bf086cc0595), [Reader](Schema/CsType/Reader.md#reader-b2467a96ddff), [MmapSchemaException](MmapSchemaException.md#mmapschemaexception-d3943c962514)

**Parameters**

- `int shallowType`
- `com.tailf.ncs.maapi.Schema.CsType.Reader csType`

### makeCSTypeBits(Reader, CSType) <a href="#makecstypebits-0c69839e71ad" id="makecstypebits-0c69839e71ad"></a>

```java
protected static com.tailf.maapi.MaapiSchemas.CSType makeCSTypeBits(
    com.tailf.ncs.maapi.Schema.CsTypeBits.Reader bitsr,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cstype-8bf086cc0595), [Reader](Schema/CsTypeBits/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeBits.Reader bitsr`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

### makeCSTypeDecimal64(Reader, CSType) <a href="#makecstypedecimal64-f6b0c5408f54" id="makecstypedecimal64-f6b0c5408f54"></a>

```java
protected static com.tailf.maapi.MaapiSchemas.CSType makeCSTypeDecimal64(
    com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Reader d64,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cstype-8bf086cc0595), [Reader](Schema/CsTypeDecimal64/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Reader d64`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

### makeCSTypeDisplayHint(Reader, CSType) <a href="#makecstypedisplayhint-3065ba550816" id="makecstypedisplayhint-3065ba550816"></a>

```java
protected static com.tailf.maapi.MaapiSchemas.CSType makeCSTypeDisplayHint(
    com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader csType,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cstype-8bf086cc0595), [Reader](Schema/CsTypeDisplayHint/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader csType`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

### makeCSTypeEnum(Reader, CSType) <a href="#makecstypeenum-056633384f04" id="makecstypeenum-056633384f04"></a>

```java
protected static com.tailf.maapi.MaapiSchemas.CSType makeCSTypeEnum(
    com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader aEnum,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cstype-8bf086cc0595), [Reader](Schema/CsTypeEnum/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader aEnum`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

### makeCSTypeIdref(Reader, CSType) <a href="#makecstypeidref-9d16e7b3d78b" id="makecstypeidref-9d16e7b3d78b"></a>

```java
protected static com.tailf.maapi.MaapiSchemas.CSType makeCSTypeIdref(
    com.tailf.ncs.maapi.Schema.CsTypeIdref.Reader idrefr,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cstype-8bf086cc0595), [Reader](Schema/CsTypeIdref/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeIdref.Reader idrefr`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

### makeCSTypeList(Reader, CSType) <a href="#makecstypelist-fd7ca47b4fb9" id="makecstypelist-fd7ca47b4fb9"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSType makeCSTypeList(
    com.tailf.ncs.maapi.Schema.CsTypeList.Reader l,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cstype-8bf086cc0595), [Reader](Schema/CsTypeList/Reader.md#reader-b2467a96ddff), [MmapSchemaException](MmapSchemaException.md#mmapschemaexception-d3943c962514)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeList.Reader l`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

### makeCSTypeListRestriction(Reader, CSType) <a href="#makecstypelistrestriction-0d4c8f9bd4be" id="makecstypelistrestriction-0d4c8f9bd4be"></a>

```java
protected static com.tailf.maapi.MaapiSchemas.CSType makeCSTypeListRestriction(
    com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Reader csType,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cstype-8bf086cc0595), [Reader](Schema/CsTypeListRestriction/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Reader csType`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

### makeCSTypeNumber(int, Reader, CSType) <a href="#makecstypenumber-4035fabd7771" id="makecstypenumber-4035fabd7771"></a>

```java
protected static com.tailf.maapi.MaapiSchemas.CSType makeCSTypeNumber(
    int shallowType,
    com.tailf.ncs.maapi.Schema.CsTypeNumber.Reader csType,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cstype-8bf086cc0595), [Reader](Schema/CsTypeNumber/Reader.md#reader-b2467a96ddff)

**Parameters**

- `int shallowType`
- `com.tailf.ncs.maapi.Schema.CsTypeNumber.Reader csType`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

### makeCSTypeRangeArray(Reader&lt;Reader&gt;) <a href="#makecstyperangearray-f4c1155d4bc5" id="makecstyperangearray-f4c1155d4bc5"></a>

```java
protected static com.tailf.maapi.MaapiSchemas.CSTypeRange[] makeCSTypeRangeArray(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> rangesr
)
```

Types: [CSTypeRange](../../maapi/MaapiSchemas/CSTypeRange.md#cstyperange-3ed2b19cd40b), [Reader](Schema/Range/Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> rangesr`

### makeCSTypeString(Reader, CSType) <a href="#makecstypestring-bf018492601d" id="makecstypestring-bf018492601d"></a>

```java
protected static com.tailf.maapi.MaapiSchemas.CSType makeCSTypeString(
    com.tailf.ncs.maapi.Schema.CsTypeString.Reader csType,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cstype-8bf086cc0595), [Reader](Schema/CsTypeString/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeString.Reader csType`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`

### makeCSTypeUnion(Reader, CSType) <a href="#makecstypeunion-55d1543c92b9" id="makecstypeunion-55d1543c92b9"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSType makeCSTypeUnion(
    com.tailf.ncs.maapi.Schema.CsTypeUnion.Reader u,
    com.tailf.maapi.MaapiSchemas.CSType parentType
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [CSType](../../maapi/MaapiSchemas/CSType.md#cstype-8bf086cc0595), [Reader](Schema/CsTypeUnion/Reader.md#reader-b2467a96ddff), [MmapSchemaException](MmapSchemaException.md#mmapschemaexception-d3943c962514)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeUnion.Reader u`
- `com.tailf.maapi.MaapiSchemas.CSType parentType`
