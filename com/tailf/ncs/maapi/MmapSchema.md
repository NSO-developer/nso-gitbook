<a id="cls-MmapSchema"></a>
# MmapSchema

```java
public class com.tailf.ncs.maapi.MmapSchema
```

## Members

**Constructors**:

- [MmapSchema(String, Map<Integer,String>, boolean)](#m-mmapschema-f173cb643f1f)

**Fields**:

- [readerOptions](#m-readerOptions)

**Methods**:

- [dump()](#m-dump-f69481fc6392)
- [findChild(Level, CSMNsMap, int)](#m-findchild-7b6f3725d8af)
- [findChild(Level, int, int)](#m-findchild-f8d62e295bf8)
- [findRootChild(int, int)](#m-findrootchild-b18c1f12b1d3)
- [getChild(Level, int)](#m-getchild-115c45c0c72a)
- [getChildren(Level, Predicate<Child>)](#m-getchildren-505b9cbdd11e)
- [getCsDb()](#m-getcsdb-e56377c261c7)
- [getCsDbEntries()](#m-getcsdbentries-e66fa22b89e5)
- [getDb(int, StructFactory<B,R>)](#m-getdb-350f522f54a8)
- [getHashDb()](#m-gethashdb-e75daa0effae)
- [getMnsMapDb()](#m-getmnsmapdb-908581232215)
- [getMountPointDb()](#m-getmountpointdb-32131a12db04)
- [getNsDb()](#m-getnsdb-3babeb353172)
- [getRecord(Level, int)](#m-getrecord-b8c26b20e5af)
- [getRootLevel()](#m-getrootlevel-e49164e18650)
- [hashToString(int)](#m-hashtostring-54eaaef71976)
- [readCs(int)](#m-readcs-7cac4a174403)
- [readCs(Level)](#m-readcs-2bd562042556)
- [readLevel(int)](#m-readlevel-2adbe31ff425)
- [readRecord(int)](#m-readrecord-a6c043785170)

**Nested Types**:

- [Child](MmapSchema/Child.md#cls-Child)
- [Header](MmapSchema/Header.md#cls-Header)
- [HTag](MmapSchema/HTag.md#cls-HTag)
- [Level](MmapSchema/Level.md#cls-Level)
- [Record](MmapSchema/Record.md#cls-Record)
- [Source](MmapSchema/Source.md#cls-Source)

## Constructors

<a id="m-mmapschema-f173cb643f1f"></a>
### MmapSchema(String, Map<Integer,String>, boolean)

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

<a id="m-readerOptions"></a>
### readerOptions

**Package-private**

```java
org.capnproto.ReaderOptions readerOptions = null;
```


## Methods

<a id="m-dump-f69481fc6392"></a>
### dump()

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

<a id="m-findchild-7b6f3725d8af"></a>
### findChild(Level, CSMNsMap, int)

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

<a id="m-findchild-f8d62e295bf8"></a>
### findChild(Level, int, int)

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

<a id="m-findrootchild-b18c1f12b1d3"></a>
### findRootChild(int, int)

```java
protected com.tailf.ncs.maapi.MmapSchema.Child findRootChild(int hns, int htag)
```

Types: [Child](MmapSchema/Child.md#cls-Child)

**Parameters**

- `int hns`
- `int htag`

<a id="m-getchild-115c45c0c72a"></a>
### getChild(Level, int)

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

<a id="m-getchildren-505b9cbdd11e"></a>
### getChildren(Level, Predicate<Child>)

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

<a id="m-getcsdb-e56377c261c7"></a>
### getCsDb()

```java
protected com.tailf.ncs.maapi.Schema.CsDb.Reader getCsDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/CsDb/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

<a id="m-getcsdbentries-e66fa22b89e5"></a>
### getCsDbEntries()

**Package-private**

```java
org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Cs.Reader> getCsDbEntries() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/Cs/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

<a id="m-getdb-350f522f54a8"></a>
### getDb(int, StructFactory<B,R>)

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

<a id="m-gethashdb-e75daa0effae"></a>
### getHashDb()

```java
protected com.tailf.ncs.maapi.Schema.HashDb.Reader getHashDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/HashDb/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

<a id="m-getmnsmapdb-908581232215"></a>
### getMnsMapDb()

```java
protected com.tailf.ncs.maapi.Schema.MNsMapDb.Reader getMnsMapDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/MNsMapDb/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

<a id="m-getmountpointdb-32131a12db04"></a>
### getMountPointDb()

```java
protected com.tailf.ncs.maapi.Schema.MountPointDb.Reader getMountPointDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/MountPointDb/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

<a id="m-getnsdb-3babeb353172"></a>
### getNsDb()

```java
protected com.tailf.ncs.maapi.Schema.NsDb.Reader getNsDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/NsDb/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

<a id="m-getrecord-b8c26b20e5af"></a>
### getRecord(Level, int)

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

<a id="m-getrootlevel-e49164e18650"></a>
### getRootLevel()

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Level getRootLevel()
```

Types: [Level](MmapSchema/Level.md#cls-Level)

<a id="m-hashtostring-54eaaef71976"></a>
### hashToString(int)

```java
protected String hashToString(int hash)
```

**Parameters**

- `int hash`

<a id="m-readcs-7cac4a174403"></a>
### readCs(int)

```java
protected com.tailf.ncs.maapi.Schema.Cs.Reader readCs(
    int idx
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/Cs/Reader.md#cls-Reader), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

**Parameters**

- `int idx`

<a id="m-readcs-2bd562042556"></a>
### readCs(Level)

```java
protected com.tailf.ncs.maapi.Schema.Cs.Reader readCs(
    com.tailf.ncs.maapi.MmapSchema.Level level
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/Cs/Reader.md#cls-Reader), [Level](MmapSchema/Level.md#cls-Level), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Level level`

<a id="m-readlevel-2adbe31ff425"></a>
### readLevel(int)

```java
protected com.tailf.ncs.maapi.MmapSchema.Level readLevel(
    int pos
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Level](MmapSchema/Level.md#cls-Level), [MmapSchemaException](MmapSchemaException.md#cls-MmapSchemaException)

**Parameters**

- `int pos`

<a id="m-readrecord-a6c043785170"></a>
### readRecord(int)

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
