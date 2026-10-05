<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueQName.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getName()](#m-getname-2634b18b4a25)
- [getPrefix()](#m-getprefix-9268091e0223)
- [hasName()](#m-hasname-bfe6c334e0d1)
- [hasPrefix()](#m-hasprefix-ddbc3bbca9c3)

## Constructors

<a id="m-reader-cf5e962c3323"></a>
### Reader(SegmentReader, int, int, int, short, int)

**Package-private**

```java
Reader(
    org.capnproto.SegmentReader segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount,
    int nestingLimit
)
```

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`


## Methods

<a id="m-getname-2634b18b4a25"></a>
### getName()

```java
public org.capnproto.Text.Reader getName()
```

<a id="m-getprefix-9268091e0223"></a>
### getPrefix()

```java
public org.capnproto.Text.Reader getPrefix()
```

<a id="m-hasname-bfe6c334e0d1"></a>
### hasName()

```java
public boolean hasName()
```

<a id="m-hasprefix-ddbc3bbca9c3"></a>
### hasPrefix()

```java
public boolean hasPrefix()
```
