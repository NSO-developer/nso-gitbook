<a id="s-Source"></a>
# Source

**Package-private**

```java
class com.tailf.ncs.maapi.MmapSchema.Source
```

## Members

**Constructors**:

- [Source(String, ByteBuffer)](#s-Source-1)

**Methods**:

- [getBuffer()](#s-getBuffer)
- [getBufferDuplicate()](#s-getBufferDuplicate)
- [getPath()](#s-getPath)

## Constructors

<a id="s-Source-1"></a>
### Source(String, ByteBuffer)

**Package-private**

```java
Source(String path, java.nio.ByteBuffer buffer)
```

**Parameters**

- `String path`
- `java.nio.ByteBuffer buffer`


## Methods

<a id="s-getBuffer"></a>
### getBuffer()

```java
public java.nio.ByteBuffer getBuffer()
```

<a id="s-getBufferDuplicate"></a>
### getBufferDuplicate()

```java
public java.nio.ByteBuffer getBufferDuplicate()
```

Get a duplicate of the buffer with independent position, limit, and
 mark values.

**Returns:** The duplicated byte buffer

<a id="s-getPath"></a>
### getPath()

```java
public String getPath()
```
