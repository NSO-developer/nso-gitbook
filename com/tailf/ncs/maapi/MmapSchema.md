<a id="s-MmapSchema"></a>
# MmapSchema

```java
public class com.tailf.ncs.maapi.MmapSchema
```

## Members

**Constructors**:

- [MmapSchema(String, Map<Integer,String>, boolean)](#s-MmapSchema-1)

**Fields**:

- [readerOptions](#s-readerOptions)

**Methods**:

- [dump()](#s-dump)
- [findChild(Level, CSMNsMap, int)](#s-findChild)
- [findChild(Level, int, int)](#s-findChild-1)
- [findRootChild(int, int)](#s-findRootChild)
- [getChild(Level, int)](#s-getChild)
- [getChildren(Level, Predicate<Child>)](#s-getChildren)
- [getCsDb()](#s-getCsDb)
- [getCsDbEntries()](#s-getCsDbEntries)
- [getDb(int, StructFactory<B,R>)](#s-getDb)
- [getHashDb()](#s-getHashDb)
- [getMnsMapDb()](#s-getMnsMapDb)
- [getMountPointDb()](#s-getMountPointDb)
- [getNsDb()](#s-getNsDb)
- [getRecord(Level, int)](#s-getRecord)
- [getRootLevel()](#s-getRootLevel)
- [hashToString(int)](#s-hashToString)
- [readCs(int)](#s-readCs)
- [readCs(Level)](#s-readCs-1)
- [readLevel(int)](#s-readLevel)
- [readRecord(int)](#s-readRecord)

**Nested Types**:

- [Child](MmapSchema/Child.md#s-Child)
- [Header](MmapSchema/Header.md#s-Header)
- [HTag](MmapSchema/HTag.md#s-HTag)
- [Level](MmapSchema/Level.md#s-Level)
- [Record](MmapSchema/Record.md#s-Record)
- [Source](MmapSchema/Source.md#s-Source)

## Constructors

<a id="s-MmapSchema-1"></a>
### MmapSchema(String, Map<Integer,String>, boolean)

```java
protected MmapSchema(
    String schemaPath,
    java.util.Map<Integer,String> hashToStringTab,
    boolean mmap
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [MmapSchemaException](MmapSchemaException.md#s-MmapSchemaException)

**Parameters**

- `String schemaPath`
- `java.util.Map<Integer,String> hashToStringTab`
- `boolean mmap`


## Fields

<a id="s-readerOptions"></a>
### readerOptions

**Package-private**

```java
org.capnproto.ReaderOptions readerOptions = null;
```


## Methods

<a id="s-dump"></a>
### dump()

```java
protected void dump() throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [MmapSchemaException](MmapSchemaException.md#s-MmapSchemaException)

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

<a id="s-findChild"></a>
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

Types: [Child](MmapSchema/Child.md#s-Child), [Level](MmapSchema/Level.md#s-Level), [CSMNsMap](../../maapi/MaapiSchemas/CSMNsMap.md#s-CSMNsMap), [MmapSchemaException](MmapSchemaException.md#s-MmapSchemaException)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Level level`
- `com.tailf.maapi.MaapiSchemas.CSMNsMap mnsMap`
- `int htag`

<a id="s-findChild-1"></a>
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

Types: [Child](MmapSchema/Child.md#s-Child), [Level](MmapSchema/Level.md#s-Level), [MmapSchemaException](MmapSchemaException.md#s-MmapSchemaException)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Level parent`
- `int hns`
- `int htag`

<a id="s-findRootChild"></a>
### findRootChild(int, int)

```java
protected com.tailf.ncs.maapi.MmapSchema.Child findRootChild(int hns, int htag)
```

Types: [Child](MmapSchema/Child.md#s-Child)

**Parameters**

- `int hns`
- `int htag`

<a id="s-getChild"></a>
### getChild(Level, int)

```java
protected com.tailf.ncs.maapi.MmapSchema.Child getChild(
    com.tailf.ncs.maapi.MmapSchema.Level level,
    int childIdx
)
```

Types: [Child](MmapSchema/Child.md#s-Child), [Level](MmapSchema/Level.md#s-Level)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Level level`
- `int childIdx`

<a id="s-getChildren"></a>
### getChildren(Level, Predicate<Child>)

```java
protected Iterable<com.tailf.ncs.maapi.MmapSchema.Child> getChildren(
    com.tailf.ncs.maapi.MmapSchema.Level level,
    java.util.function.Predicate<com.tailf.ncs.maapi.MmapSchema.Child> pred
)
```

Types: [Child](MmapSchema/Child.md#s-Child), [Level](MmapSchema/Level.md#s-Level)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Level level`
- `java.util.function.Predicate<com.tailf.ncs.maapi.MmapSchema.Child> pred`

<a id="s-getCsDb"></a>
### getCsDb()

```java
protected com.tailf.ncs.maapi.Schema.CsDb.Reader getCsDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/CsDb/Reader.md#s-Reader), [MmapSchemaException](MmapSchemaException.md#s-MmapSchemaException)

<a id="s-getCsDbEntries"></a>
### getCsDbEntries()

**Package-private**

```java
org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Cs.Reader> getCsDbEntries() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/Cs/Reader.md#s-Reader), [MmapSchemaException](MmapSchemaException.md#s-MmapSchemaException)

<a id="s-getDb"></a>
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

<a id="s-getHashDb"></a>
### getHashDb()

```java
protected com.tailf.ncs.maapi.Schema.HashDb.Reader getHashDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/HashDb/Reader.md#s-Reader), [MmapSchemaException](MmapSchemaException.md#s-MmapSchemaException)

<a id="s-getMnsMapDb"></a>
### getMnsMapDb()

```java
protected com.tailf.ncs.maapi.Schema.MNsMapDb.Reader getMnsMapDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/MNsMapDb/Reader.md#s-Reader), [MmapSchemaException](MmapSchemaException.md#s-MmapSchemaException)

<a id="s-getMountPointDb"></a>
### getMountPointDb()

```java
protected com.tailf.ncs.maapi.Schema.MountPointDb.Reader getMountPointDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/MountPointDb/Reader.md#s-Reader), [MmapSchemaException](MmapSchemaException.md#s-MmapSchemaException)

<a id="s-getNsDb"></a>
### getNsDb()

```java
protected com.tailf.ncs.maapi.Schema.NsDb.Reader getNsDb() throws com.tailf.ncs.maapi.MmapSchemaException
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/NsDb/Reader.md#s-Reader), [MmapSchemaException](MmapSchemaException.md#s-MmapSchemaException)

<a id="s-getRecord"></a>
### getRecord(Level, int)

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Record getRecord(
    com.tailf.ncs.maapi.MmapSchema.Level level,
    int recordIdx
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Record](MmapSchema/Record.md#s-Record), [Level](MmapSchema/Level.md#s-Level), [MmapSchemaException](MmapSchemaException.md#s-MmapSchemaException)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Level level`
- `int recordIdx`

<a id="s-getRootLevel"></a>
### getRootLevel()

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Level getRootLevel()
```

Types: [Level](MmapSchema/Level.md#s-Level)

<a id="s-hashToString"></a>
### hashToString(int)

```java
protected String hashToString(int hash)
```

**Parameters**

- `int hash`

<a id="s-readCs"></a>
### readCs(int)

```java
protected com.tailf.ncs.maapi.Schema.Cs.Reader readCs(
    int idx
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/Cs/Reader.md#s-Reader), [MmapSchemaException](MmapSchemaException.md#s-MmapSchemaException)

**Parameters**

- `int idx`

<a id="s-readCs-1"></a>
### readCs(Level)

```java
protected com.tailf.ncs.maapi.Schema.Cs.Reader readCs(
    com.tailf.ncs.maapi.MmapSchema.Level level
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Reader](Schema/Cs/Reader.md#s-Reader), [Level](MmapSchema/Level.md#s-Level), [MmapSchemaException](MmapSchemaException.md#s-MmapSchemaException)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Level level`

<a id="s-readLevel"></a>
### readLevel(int)

```java
protected com.tailf.ncs.maapi.MmapSchema.Level readLevel(
    int pos
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Level](MmapSchema/Level.md#s-Level), [MmapSchemaException](MmapSchemaException.md#s-MmapSchemaException)

**Parameters**

- `int pos`

<a id="s-readRecord"></a>
### readRecord(int)

```java
protected com.tailf.ncs.maapi.MmapSchema.Record readRecord(
    int pos
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Record](MmapSchema/Record.md#s-Record), [MmapSchemaException](MmapSchemaException.md#s-MmapSchemaException)

**Parameters**

- `int pos`


## Nested Types

- [Child](MmapSchema/Child.md)
- [Header](MmapSchema/Header.md)
- [HTag](MmapSchema/HTag.md)
- [Level](MmapSchema/Level.md)
- [Record](MmapSchema/Record.md)
- [Source](MmapSchema/Source.md)
