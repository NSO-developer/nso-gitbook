# Source <a href="#source-12fbee2b6a88" id="source-12fbee2b6a88"></a>

**Package-private**

```java
class com.tailf.ncs.maapi.MmapSchema.Source
```

## Members

**Constructors**:

- [Source(String, ByteBuffer)](#source-88a6b5379f91)

**Methods**:

- [getBuffer()](#getbuffer-570122302064)
- [getBufferDuplicate()](#getbufferduplicate-cbf9cb33fd3d)
- [getPath()](#getpath-88fb21895561)

## Constructors

### Source(String, ByteBuffer) <a href="#source-88a6b5379f91" id="source-88a6b5379f91"></a>

**Package-private**

```java
Source(String path, java.nio.ByteBuffer buffer)
```

**Parameters**

- `String path`
- `java.nio.ByteBuffer buffer`


## Methods

### getBuffer() <a href="#getbuffer-570122302064" id="getbuffer-570122302064"></a>

```java
public java.nio.ByteBuffer getBuffer()
```

### getBufferDuplicate() <a href="#getbufferduplicate-cbf9cb33fd3d" id="getbufferduplicate-cbf9cb33fd3d"></a>

```java
public java.nio.ByteBuffer getBufferDuplicate()
```

Get a duplicate of the buffer with independent position, limit, and
 mark values.

**Returns:** The duplicated byte buffer

### getPath() <a href="#getpath-88fb21895561" id="getpath-88fb21895561"></a>

```java
public String getPath()
```
