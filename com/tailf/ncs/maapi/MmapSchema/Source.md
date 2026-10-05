<a id="cls-Source"></a>
# Source

**Package-private**

```java
class com.tailf.ncs.maapi.MmapSchema.Source
```

## Members

**Constructors**:

- [Source(String, ByteBuffer)](#m-source-88a6b5379f91)

**Methods**:

- [getBuffer()](#m-getbuffer-570122302064)
- [getBufferDuplicate()](#m-getbufferduplicate-cbf9cb33fd3d)
- [getPath()](#m-getpath-88fb21895561)

## Constructors

<a id="m-source-88a6b5379f91"></a>
### Source(String, ByteBuffer)

**Package-private**

```java
Source(String path, java.nio.ByteBuffer buffer)
```

**Parameters**

- `String path`
- `java.nio.ByteBuffer buffer`


## Methods

<a id="m-getbuffer-570122302064"></a>
### getBuffer()

```java
public java.nio.ByteBuffer getBuffer()
```

<a id="m-getbufferduplicate-cbf9cb33fd3d"></a>
### getBufferDuplicate()

```java
public java.nio.ByteBuffer getBufferDuplicate()
```

Get a duplicate of the buffer with independent position, limit, and
 mark values.

**Returns:** The duplicated byte buffer

<a id="m-getpath-88fb21895561"></a>
### getPath()

```java
public String getPath()
```
