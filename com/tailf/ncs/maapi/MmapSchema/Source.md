# Source <a href="#cls-Source" id="cls-Source"></a>

**Package-private**

```java
class com.tailf.ncs.maapi.MmapSchema.Source
```

## Members

**Constructors**:

- [Source(String, ByteBuffer)](#m-Source-88a6b5379f91)

**Methods**:

- [getBuffer()](#m-getBuffer-570122302064)
- [getBufferDuplicate()](#m-getBufferDuplicate-cbf9cb33fd3d)
- [getPath()](#m-getPath-88fb21895561)

## Constructors

### Source(String, ByteBuffer) <a href="#m-Source-88a6b5379f91" id="m-Source-88a6b5379f91"></a>

**Package-private**

```java
Source(String path, java.nio.ByteBuffer buffer)
```

**Parameters**

- `String path`
- `java.nio.ByteBuffer buffer`


## Methods

### getBuffer() <a href="#m-getBuffer-570122302064" id="m-getBuffer-570122302064"></a>

```java
public java.nio.ByteBuffer getBuffer()
```

### getBufferDuplicate() <a href="#m-getBufferDuplicate-cbf9cb33fd3d" id="m-getBufferDuplicate-cbf9cb33fd3d"></a>

```java
public java.nio.ByteBuffer getBufferDuplicate()
```

Get a duplicate of the buffer with independent position, limit, and
 mark values.

**Returns:** The duplicated byte buffer

### getPath() <a href="#m-getPath-88fb21895561" id="m-getPath-88fb21895561"></a>

```java
public String getPath()
```
