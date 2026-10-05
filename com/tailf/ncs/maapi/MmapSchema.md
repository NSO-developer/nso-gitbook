# MmapSchema <a href="#cls-MmapSchema" id="cls-MmapSchema"></a>

```java
public class com.tailf.ncs.maapi.MmapSchema
```

## Members

**Constructors**:

- [MmapSchema(String, Map<Integer,String>, boolean)](#m-MmapSchema-f173cb643f1f)

**Fields**:

- [readerOptions](#m-readerOptions)

**Methods**:

- [dump()](#m-dump-f69481fc6392)
- [findChild(Level, CSMNsMap, int)](#m-findChild-7b6f3725d8af)
- [findChild(Level, int, int)](#m-findChild-f8d62e295bf8)
- [findRootChild(int, int)](#m-findRootChild-b18c1f12b1d3)
- [getChild(Level, int)](#m-getChild-115c45c0c72a)
- [getChildren(Level, Predicate<Child>)](#m-getChildren-505b9cbdd11e)
- [getCsDb()](#m-getCsDb-e56377c261c7)
- [getCsDbEntries()](#m-getCsDbEntries-e66fa22b89e5)
- [getDb(int, StructFactory<B,R>)](#m-getDb-350f522f54a8)
- [getHashDb()](#m-getHashDb-e75daa0effae)
- [getMnsMapDb()](#m-getMnsMapDb-908581232215)
- [getMountPointDb()](#m-getMountPointDb-32131a12db04)
- [getNsDb()](#m-getNsDb-3babeb353172)
- [getRecord(Level, int)](#m-getRecord-b8c26b20e5af)
- [getRootLevel()](#m-getRootLevel-e49164e18650)
- [hashToString(int)](#m-hashToString-54eaaef71976)
- [readCs(int)](#m-readCs-7cac4a174403)
- [readCs(Level)](#m-readCs-2bd562042556)
- [readLevel(int)](#m-readLevel-2adbe31ff425)
- [readRecord(int)](#m-readRecord-a6c043785170)

**Nested Types**:

- [Child](MmapSchema/Child.md#cls-Child)
- [Header](MmapSchema/Header.md#cls-Header)
- [HTag](MmapSchema/HTag.md#cls-HTag)
- [Level](MmapSchema/Level.md#cls-Level)
- [Record](MmapSchema/Record.md#cls-Record)
- [Source](MmapSchema/Source.md#cls-Source)

## Constructors

### MmapSchema(String, Map<Integer,String>, boolean) <a href="#m-MmapSchema-f173cb643f1f" id="m-MmapSchema-f173cb643f1f"></a>

```java
protected MmapSchema(
    String schemaPath,
    java.util.Map<Integer,String> hashToStringTab,
    boolean mmap
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

**Parameters**

- `String schemaPath`
- `java.util.Map<Integer,String> hashToStringTab`
- `boolean mmap`


## Fields

### readerOptions <a href="#m-readerOptions" id="m-readerOptions"></a>

**Package-private**

```java
org.capnproto.ReaderOptions readerOptions = null;
```


## Methods

### dump() <a href="#m-dump-f69481fc6392" id="m-dump-f69481fc6392"></a>

```java
protected void dump() throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

This function is intended for debugging potentialt issues with the
 schema file printing all the nodes and their positions in the schema
 file.

 The output, not being the same as the C++ counterpart trav_schema
 application, can however be cross-referenced verifying that all nodes
 are found and referencing the correct Cs records.

 This code can be used with the ant target dump-schema:

 ant dump-schema -Dschema.file=path-to-schema

**Throws**

- `MmapSchemaException`

### findChild(Level, CSMNsMap, int) <a href="#m-findChild-7b6f3725d8af" id="m-findChild-7b6f3725d8af"></a>

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Child findChild(
    com.tailf.ncs.maapi.MmapSchema.Level level,
    com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap,
    int htag
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Child](MmapSchema/Child.md#cls-Child), [Level](MmapSchema/Level.md#cls-Level), [CSMNsMap](../../maapi/MaapiSchemas/CSMNsMap.md#cls-CSMNsMap), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Level level`
- `com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap`
- `int htag`

### findChild(Level, int, int) <a href="#m-findChild-f8d62e295bf8" id="m-findChild-f8d62e295bf8"></a>

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Child findChild(
    com.tailf.ncs.maapi.MmapSchema.Level parent,
    int hns,
    int htag
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Child](MmapSchema/Child.md#cls-Child), [Level](MmapSchema/Level.md#cls-Level), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Level parent`
- `int hns`
- `int htag`

### findRootChild(int, int) <a href="#m-findRootChild-b18c1f12b1d3" id="m-findRootChild-b18c1f12b1d3"></a>

```java
protected com.tailf.ncs.maapi.MmapSchema.Child findRootChild(int hns, int htag)
```

Types: [Child](MmapSchema/Child.md#cls-Child)

**Parameters**

- `int hns`
- `int htag`

### getChild(Level, int) <a href="#m-getChild-115c45c0c72a" id="m-getChild-115c45c0c72a"></a>

```java
protected com.tailf.ncs.maapi.MmapSchema.Child getChild(
    com.tailf.ncs.maapi.MmapSchema.Level level,
    int childIdx
)
```

Types: [Child](MmapSchema/Child.md#cls-Child), [Level](MmapSchema/Level.md#cls-Level)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Level level`
- `int childIdx`

### getChildren(Level, Predicate<Child>) <a href="#m-getChildren-505b9cbdd11e" id="m-getChildren-505b9cbdd11e"></a>

```java
protected Iterable<com.tailf.ncs.maapi.MmapSchema.Child> getChildren(
    com.tailf.ncs.maapi.MmapSchema.Level level,
    java.util.function.Predicate<com.tailf.ncs.maapi.MmapSchema.Child> pred
)
```

Types: [Child](MmapSchema/Child.md#cls-Child), [Level](MmapSchema/Level.md#cls-Level)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Level level`
- `java.util.function.Predicate<com.tailf.ncs.maapi.MmapSchema.Child> pred`

### getCsDb() <a href="#m-getCsDb-e56377c261c7" id="m-getCsDb-e56377c261c7"></a>

```java
protected com.tailf.ncs.maapi.Schema.CsDb.Reader getCsDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/CsDb/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

### getCsDbEntries() <a href="#m-getCsDbEntries-e66fa22b89e5" id="m-getCsDbEntries-e66fa22b89e5"></a>

**Package-private**

```java
org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Cs.Reader> getCsDbEntries() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/Cs/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

### getDb(int, StructFactory<B,R>) <a href="#m-getDb-350f522f54a8" id="m-getDb-350f522f54a8"></a>

```java
protected <B extends org.capnproto.StructBuilder, R extends org.capnproto.StructReader> R getDb(
    int offset,
    org.capnproto.StructFactory<B,R> factory
)
    throws java.io.IOException
```

**Parameters**

- `int offset`
- `org.capnproto.StructFactory<B,R> factory`

### getHashDb() <a href="#m-getHashDb-e75daa0effae" id="m-getHashDb-e75daa0effae"></a>

```java
protected com.tailf.ncs.maapi.Schema.HashDb.Reader getHashDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/HashDb/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

### getMnsMapDb() <a href="#m-getMnsMapDb-908581232215" id="m-getMnsMapDb-908581232215"></a>

```java
protected com.tailf.ncs.maapi.Schema.MNsMapDb.Reader getMnsMapDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/MNsMapDb/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

### getMountPointDb() <a href="#m-getMountPointDb-32131a12db04" id="m-getMountPointDb-32131a12db04"></a>

```java
protected com.tailf.ncs.maapi.Schema.MountPointDb.Reader getMountPointDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/MountPointDb/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

### getNsDb() <a href="#m-getNsDb-3babeb353172" id="m-getNsDb-3babeb353172"></a>

```java
protected com.tailf.ncs.maapi.Schema.NsDb.Reader getNsDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/NsDb/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

### getRecord(Level, int) <a href="#m-getRecord-b8c26b20e5af" id="m-getRecord-b8c26b20e5af"></a>

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Record getRecord(
    com.tailf.ncs.maapi.MmapSchema.Level level,
    int recordIdx
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Record](MmapSchema/Record.md#cls-Record), [Level](MmapSchema/Level.md#cls-Level), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Level level`
- `int recordIdx`

### getRootLevel() <a href="#m-getRootLevel-e49164e18650" id="m-getRootLevel-e49164e18650"></a>

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Level getRootLevel()
```

Types: [Level](MmapSchema/Level.md#cls-Level)

### hashToString(int) <a href="#m-hashToString-54eaaef71976" id="m-hashToString-54eaaef71976"></a>

```java
protected String hashToString(int hash)
```

**Parameters**

- `int hash`

### readCs(int) <a href="#m-readCs-7cac4a174403" id="m-readCs-7cac4a174403"></a>

```java
protected com.tailf.ncs.maapi.Schema.Cs.Reader readCs(
    int idx
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/Cs/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

**Parameters**

- `int idx`

### readCs(Level) <a href="#m-readCs-2bd562042556" id="m-readCs-2bd562042556"></a>

```java
protected com.tailf.ncs.maapi.Schema.Cs.Reader readCs(
    com.tailf.ncs.maapi.MmapSchema.Level level
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/Cs/Reader.md#cls-Reader), [Level](MmapSchema/Level.md#cls-Level), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Level level`

### readLevel(int) <a href="#m-readLevel-2adbe31ff425" id="m-readLevel-2adbe31ff425"></a>

```java
protected com.tailf.ncs.maapi.MmapSchema.Level readLevel(
    int pos
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Level](MmapSchema/Level.md#cls-Level), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

**Parameters**

- `int pos`

### readRecord(int) <a href="#m-readRecord-a6c043785170" id="m-readRecord-a6c043785170"></a>

```java
protected com.tailf.ncs.maapi.MmapSchema.Record readRecord(
    int pos
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Record](MmapSchema/Record.md#cls-Record), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

**Parameters**

- `int pos`


## Nested Types

- [Child](MmapSchema/Child.md#cls-Child)
- [Header](MmapSchema/Header.md#cls-Header)
- [HTag](MmapSchema/HTag.md#cls-HTag)
- [Level](MmapSchema/Level.md#cls-Level)
- [Record](MmapSchema/Record.md#cls-Record)
- [Source](MmapSchema/Source.md#cls-Source)
