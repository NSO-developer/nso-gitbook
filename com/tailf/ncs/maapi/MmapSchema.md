# MmapSchema <a href="#mmapschema-8adb607d0eb6" id="mmapschema-8adb607d0eb6"></a>

```java
public class com.tailf.ncs.maapi.MmapSchema
```

## Members

**Constructors**:

- [MmapSchema(String, Map<Integer,String>, boolean)](#mmapschema-f173cb643f1f)

**Fields**:

- [readerOptions](#readeroptions-549f01c9a6bb)

**Methods**:

- [dump()](#dump-f69481fc6392)
- [findChild(Level, CSMNsMap, int)](#findchild-7b6f3725d8af)
- [findChild(Level, int, int)](#findchild-f8d62e295bf8)
- [findRootChild(int, int)](#findrootchild-b18c1f12b1d3)
- [getChild(Level, int)](#getchild-115c45c0c72a)
- [getChildren(Level, Predicate<Child>)](#getchildren-505b9cbdd11e)
- [getCsDb()](#getcsdb-e56377c261c7)
- [getCsDbEntries()](#getcsdbentries-e66fa22b89e5)
- [getDb(int, StructFactory<B,R>)](#getdb-350f522f54a8)
- [getHashDb()](#gethashdb-e75daa0effae)
- [getMnsMapDb()](#getmnsmapdb-908581232215)
- [getMountPointDb()](#getmountpointdb-32131a12db04)
- [getNsDb()](#getnsdb-3babeb353172)
- [getRecord(Level, int)](#getrecord-b8c26b20e5af)
- [getRootLevel()](#getrootlevel-e49164e18650)
- [hashToString(int)](#hashtostring-54eaaef71976)
- [readCs(int)](#readcs-7cac4a174403)
- [readCs(Level)](#readcs-2bd562042556)
- [readLevel(int)](#readlevel-2adbe31ff425)
- [readRecord(int)](#readrecord-a6c043785170)

**Nested Types**:

- [Child](MmapSchema/Child.md#child-3362e9a5c263)
- [Header](MmapSchema/Header.md#header-abbb82929f2a)
- [HTag](MmapSchema/HTag.md#htag-ceeb0bbd64b9)
- [Level](MmapSchema/Level.md#level-1f9faf6c902d)
- [Record](MmapSchema/Record.md#record-699adf6da380)
- [Source](MmapSchema/Source.md#source-12fbee2b6a88)

## Constructors

### MmapSchema(String, Map&lt;Integer,String&gt;, boolean) <a href="#mmapschema-f173cb643f1f" id="mmapschema-f173cb643f1f"></a>

```java
protected MmapSchema(
    String schemaPath,
    java.util.Map<Integer,String> hashToStringTab,
    boolean mmap
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [MmapSchemaException](MmapSchemaException.md#mmapschemaexception-d3943c962514)

**Parameters**

- `String schemaPath`
- `java.util.Map<Integer,String> hashToStringTab`
- `boolean mmap`


## Fields

### readerOptions <a href="#readeroptions-549f01c9a6bb" id="readeroptions-549f01c9a6bb"></a>

**Package-private**

```java
org.capnproto.ReaderOptions readerOptions = null;
```


## Methods

### dump() <a href="#dump-f69481fc6392" id="dump-f69481fc6392"></a>

```java
protected void dump() throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [MmapSchemaException](MmapSchemaException.md#mmapschemaexception-d3943c962514)

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

### findChild(Level, CSMNsMap, int) <a href="#findchild-7b6f3725d8af" id="findchild-7b6f3725d8af"></a>

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Child findChild(
    com.tailf.ncs.maapi.MmapSchema.Level level,
    com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap,
    int htag
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Child](MmapSchema/Child.md#child-3362e9a5c263), [Level](MmapSchema/Level.md#level-1f9faf6c902d), [CSMNsMap](../../maapi/MaapiSchemas/CSMNsMap.md#csmnsmap-1123c939e6bb), [MmapSchemaException](MmapSchemaException.md#mmapschemaexception-d3943c962514)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Level level`
- `com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap`
- `int htag`

### findChild(Level, int, int) <a href="#findchild-f8d62e295bf8" id="findchild-f8d62e295bf8"></a>

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Child findChild(
    com.tailf.ncs.maapi.MmapSchema.Level parent,
    int hns,
    int htag
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Child](MmapSchema/Child.md#child-3362e9a5c263), [Level](MmapSchema/Level.md#level-1f9faf6c902d), [MmapSchemaException](MmapSchemaException.md#mmapschemaexception-d3943c962514)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Level parent`
- `int hns`
- `int htag`

### findRootChild(int, int) <a href="#findrootchild-b18c1f12b1d3" id="findrootchild-b18c1f12b1d3"></a>

```java
protected com.tailf.ncs.maapi.MmapSchema.Child findRootChild(int hns, int htag)
```

Types: [Child](MmapSchema/Child.md#child-3362e9a5c263)

**Parameters**

- `int hns`
- `int htag`

### getChild(Level, int) <a href="#getchild-115c45c0c72a" id="getchild-115c45c0c72a"></a>

```java
protected com.tailf.ncs.maapi.MmapSchema.Child getChild(
    com.tailf.ncs.maapi.MmapSchema.Level level,
    int childIdx
)
```

Types: [Child](MmapSchema/Child.md#child-3362e9a5c263), [Level](MmapSchema/Level.md#level-1f9faf6c902d)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Level level`
- `int childIdx`

### getChildren(Level, Predicate&lt;Child&gt;) <a href="#getchildren-505b9cbdd11e" id="getchildren-505b9cbdd11e"></a>

```java
protected Iterable<com.tailf.ncs.maapi.MmapSchema.Child> getChildren(
    com.tailf.ncs.maapi.MmapSchema.Level level,
    java.util.function.Predicate<com.tailf.ncs.maapi.MmapSchema.Child> pred
)
```

Types: [Child](MmapSchema/Child.md#child-3362e9a5c263), [Level](MmapSchema/Level.md#level-1f9faf6c902d)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Level level`
- `java.util.function.Predicate<com.tailf.ncs.maapi.MmapSchema.Child> pred`

### getCsDb() <a href="#getcsdb-e56377c261c7" id="getcsdb-e56377c261c7"></a>

```java
protected com.tailf.ncs.maapi.Schema.CsDb.Reader getCsDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/CsDb/Reader.md#reader-b2467a96ddff), [MmapSchemaException](MmapSchemaException.md#mmapschemaexception-d3943c962514)

### getCsDbEntries() <a href="#getcsdbentries-e66fa22b89e5" id="getcsdbentries-e66fa22b89e5"></a>

**Package-private**

```java
org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Cs.Reader> getCsDbEntries() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/Cs/Reader.md#reader-b2467a96ddff), [MmapSchemaException](MmapSchemaException.md#mmapschemaexception-d3943c962514)

### getDb(int, StructFactory&lt;B,R&gt;) <a href="#getdb-350f522f54a8" id="getdb-350f522f54a8"></a>

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

### getHashDb() <a href="#gethashdb-e75daa0effae" id="gethashdb-e75daa0effae"></a>

```java
protected com.tailf.ncs.maapi.Schema.HashDb.Reader getHashDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/HashDb/Reader.md#reader-b2467a96ddff), [MmapSchemaException](MmapSchemaException.md#mmapschemaexception-d3943c962514)

### getMnsMapDb() <a href="#getmnsmapdb-908581232215" id="getmnsmapdb-908581232215"></a>

```java
protected com.tailf.ncs.maapi.Schema.MNsMapDb.Reader getMnsMapDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/MNsMapDb/Reader.md#reader-b2467a96ddff), [MmapSchemaException](MmapSchemaException.md#mmapschemaexception-d3943c962514)

### getMountPointDb() <a href="#getmountpointdb-32131a12db04" id="getmountpointdb-32131a12db04"></a>

```java
protected com.tailf.ncs.maapi.Schema.MountPointDb.Reader getMountPointDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/MountPointDb/Reader.md#reader-b2467a96ddff), [MmapSchemaException](MmapSchemaException.md#mmapschemaexception-d3943c962514)

### getNsDb() <a href="#getnsdb-3babeb353172" id="getnsdb-3babeb353172"></a>

```java
protected com.tailf.ncs.maapi.Schema.NsDb.Reader getNsDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/NsDb/Reader.md#reader-b2467a96ddff), [MmapSchemaException](MmapSchemaException.md#mmapschemaexception-d3943c962514)

### getRecord(Level, int) <a href="#getrecord-b8c26b20e5af" id="getrecord-b8c26b20e5af"></a>

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Record getRecord(
    com.tailf.ncs.maapi.MmapSchema.Level level,
    int recordIdx
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Record](MmapSchema/Record.md#record-699adf6da380), [Level](MmapSchema/Level.md#level-1f9faf6c902d), [MmapSchemaException](MmapSchemaException.md#mmapschemaexception-d3943c962514)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Level level`
- `int recordIdx`

### getRootLevel() <a href="#getrootlevel-e49164e18650" id="getrootlevel-e49164e18650"></a>

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Level getRootLevel()
```

Types: [Level](MmapSchema/Level.md#level-1f9faf6c902d)

### hashToString(int) <a href="#hashtostring-54eaaef71976" id="hashtostring-54eaaef71976"></a>

```java
protected String hashToString(int hash)
```

**Parameters**

- `int hash`

### readCs(int) <a href="#readcs-7cac4a174403" id="readcs-7cac4a174403"></a>

```java
protected com.tailf.ncs.maapi.Schema.Cs.Reader readCs(
    int idx
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/Cs/Reader.md#reader-b2467a96ddff), [MmapSchemaException](MmapSchemaException.md#mmapschemaexception-d3943c962514)

**Parameters**

- `int idx`

### readCs(Level) <a href="#readcs-2bd562042556" id="readcs-2bd562042556"></a>

```java
protected com.tailf.ncs.maapi.Schema.Cs.Reader readCs(
    com.tailf.ncs.maapi.MmapSchema.Level level
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/Cs/Reader.md#reader-b2467a96ddff), [Level](MmapSchema/Level.md#level-1f9faf6c902d), [MmapSchemaException](MmapSchemaException.md#mmapschemaexception-d3943c962514)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Level level`

### readLevel(int) <a href="#readlevel-2adbe31ff425" id="readlevel-2adbe31ff425"></a>

```java
protected com.tailf.ncs.maapi.MmapSchema.Level readLevel(
    int pos
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Level](MmapSchema/Level.md#level-1f9faf6c902d), [MmapSchemaException](MmapSchemaException.md#mmapschemaexception-d3943c962514)

**Parameters**

- `int pos`

### readRecord(int) <a href="#readrecord-a6c043785170" id="readrecord-a6c043785170"></a>

```java
protected com.tailf.ncs.maapi.MmapSchema.Record readRecord(
    int pos
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Record](MmapSchema/Record.md#record-699adf6da380), [MmapSchemaException](MmapSchemaException.md#mmapschemaexception-d3943c962514)

**Parameters**

- `int pos`


## Nested Types

- [Child](MmapSchema/Child.md#child-3362e9a5c263)
- [Header](MmapSchema/Header.md#header-abbb82929f2a)
- [HTag](MmapSchema/HTag.md#htag-ceeb0bbd64b9)
- [Level](MmapSchema/Level.md#level-1f9faf6c902d)
- [Record](MmapSchema/Record.md#record-699adf6da380)
- [Source](MmapSchema/Source.md#source-12fbee2b6a88)
