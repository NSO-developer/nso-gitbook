<a id="s-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.CsValue.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsValue.Builder,com.tailf.ncs.maapi.Schema.CsValue.Reader>
```

Types: [Builder](Builder.md#s-Builder), [Reader](Reader.md#s-Reader)

## Members

**Constructors**:

- [Factory()](#s-Factory-1)

**Methods**:

- [asReader()](Builder.md#s-asReader) from Builder
- [asReader(Builder)](#s-asReader)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#s-constructBuilder)
- [constructReader(SegmentReader, int, int, int, short, int)](#s-constructReader)
- [getBinary()](Builder.md#s-getBinary) from Builder
- [getBit32()](Builder.md#s-getBit32) from Builder
- [getBit64()](Builder.md#s-getBit64) from Builder
- [getBitbig()](Builder.md#s-getBitbig) from Builder
- [getBool()](Builder.md#s-getBool) from Builder
- [getBuf()](Builder.md#s-getBuf) from Builder
- [getCdbBegin()](Builder.md#s-getCdbBegin) from Builder
- [getDate()](Builder.md#s-getDate) from Builder
- [getDatetime()](Builder.md#s-getDatetime) from Builder
- [getDecimal64()](Builder.md#s-getDecimal64) from Builder
- [getDefault()](Builder.md#s-getDefault) from Builder
- [getDouble()](Builder.md#s-getDouble) from Builder
- [getDquad()](Builder.md#s-getDquad) from Builder
- [getDuration()](Builder.md#s-getDuration) from Builder
- [getEmpty()](Builder.md#s-getEmpty) from Builder
- [getEnumValue()](Builder.md#s-getEnumValue) from Builder
- [getHexstr()](Builder.md#s-getHexstr) from Builder
- [getIdentityref()](Builder.md#s-getIdentityref) from Builder
- [getInt16()](Builder.md#s-getInt16) from Builder
- [getInt32()](Builder.md#s-getInt32) from Builder
- [getInt64()](Builder.md#s-getInt64) from Builder
- [getInt8()](Builder.md#s-getInt8) from Builder
- [getIpv4()](Builder.md#s-getIpv4) from Builder
- [getIpv4AndPlen()](Builder.md#s-getIpv4AndPlen) from Builder
- [getIpv4prefix()](Builder.md#s-getIpv4prefix) from Builder
- [getIpv6()](Builder.md#s-getIpv6) from Builder
- [getIpv6AndPlen()](Builder.md#s-getIpv6AndPlen) from Builder
- [getIpv6prefix()](Builder.md#s-getIpv6prefix) from Builder
- [getList()](Builder.md#s-getList) from Builder
- [getNoexists()](Builder.md#s-getNoexists) from Builder
- [getObjectref()](Builder.md#s-getObjectref) from Builder
- [getOid()](Builder.md#s-getOid) from Builder
- [getPtr()](Builder.md#s-getPtr) from Builder
- [getQname()](Builder.md#s-getQname) from Builder
- [getShallowType()](Builder.md#s-getShallowType) from Builder
- [getStr()](Builder.md#s-getStr) from Builder
- [getSymbol()](Builder.md#s-getSymbol) from Builder
- [getTime()](Builder.md#s-getTime) from Builder
- [getUint16()](Builder.md#s-getUint16) from Builder
- [getUint32()](Builder.md#s-getUint32) from Builder
- [getUint64()](Builder.md#s-getUint64) from Builder
- [getUint8()](Builder.md#s-getUint8) from Builder
- [getUnion()](Builder.md#s-getUnion) from Builder
- [getUnknown()](Builder.md#s-getUnknown) from Builder
- [getXmlbegin()](Builder.md#s-getXmlbegin) from Builder
- [getXmlbegindel()](Builder.md#s-getXmlbegindel) from Builder
- [getXmlend()](Builder.md#s-getXmlend) from Builder
- [getXmlMoveEnd()](Builder.md#s-getXmlMoveEnd) from Builder
- [getXmlMoveFirst()](Builder.md#s-getXmlMoveFirst) from Builder
- [getXmltag()](Builder.md#s-getXmltag) from Builder
- [hasBinary()](Builder.md#s-hasBinary) from Builder
- [hasBuf()](Builder.md#s-hasBuf) from Builder
- [hasHexstr()](Builder.md#s-hasHexstr) from Builder
- [hasList()](Builder.md#s-hasList) from Builder
- [hasObjectref()](Builder.md#s-hasObjectref) from Builder
- [hasOid()](Builder.md#s-hasOid) from Builder
- [hasStr()](Builder.md#s-hasStr) from Builder
- [initBinary(int)](Builder.md#s-initBinary) from Builder
- [initBitbig()](Builder.md#s-initBitbig) from Builder
- [initBuf(int)](Builder.md#s-initBuf) from Builder
- [initDate()](Builder.md#s-initDate) from Builder
- [initDatetime()](Builder.md#s-initDatetime) from Builder
- [initDecimal64()](Builder.md#s-initDecimal64) from Builder
- [initDquad()](Builder.md#s-initDquad) from Builder
- [initDuration()](Builder.md#s-initDuration) from Builder
- [initHexstr(int)](Builder.md#s-initHexstr) from Builder
- [initIdentityref()](Builder.md#s-initIdentityref) from Builder
- [initIpv4()](Builder.md#s-initIpv4) from Builder
- [initIpv4AndPlen()](Builder.md#s-initIpv4AndPlen) from Builder
- [initIpv4prefix()](Builder.md#s-initIpv4prefix) from Builder
- [initIpv6()](Builder.md#s-initIpv6) from Builder
- [initIpv6AndPlen()](Builder.md#s-initIpv6AndPlen) from Builder
- [initIpv6prefix()](Builder.md#s-initIpv6prefix) from Builder
- [initList(int)](Builder.md#s-initList) from Builder
- [initObjectref(int)](Builder.md#s-initObjectref) from Builder
- [initOid(int)](Builder.md#s-initOid) from Builder
- [initQname()](Builder.md#s-initQname) from Builder
- [initStr(int)](Builder.md#s-initStr) from Builder
- [initSymbol()](Builder.md#s-initSymbol) from Builder
- [initTime()](Builder.md#s-initTime) from Builder
- [initUnion()](Builder.md#s-initUnion) from Builder
- [initXmltag()](Builder.md#s-initXmltag) from Builder
- [isBinary()](Builder.md#s-isBinary) from Builder
- [isBit32()](Builder.md#s-isBit32) from Builder
- [isBit64()](Builder.md#s-isBit64) from Builder
- [isBitbig()](Builder.md#s-isBitbig) from Builder
- [isBool()](Builder.md#s-isBool) from Builder
- [isBuf()](Builder.md#s-isBuf) from Builder
- [isCdbBegin()](Builder.md#s-isCdbBegin) from Builder
- [isDate()](Builder.md#s-isDate) from Builder
- [isDatetime()](Builder.md#s-isDatetime) from Builder
- [isDecimal64()](Builder.md#s-isDecimal64) from Builder
- [isDefault()](Builder.md#s-isDefault) from Builder
- [isDouble()](Builder.md#s-isDouble) from Builder
- [isDquad()](Builder.md#s-isDquad) from Builder
- [isDuration()](Builder.md#s-isDuration) from Builder
- [isEmpty()](Builder.md#s-isEmpty) from Builder
- [isEnumValue()](Builder.md#s-isEnumValue) from Builder
- [isHexstr()](Builder.md#s-isHexstr) from Builder
- [isIdentityref()](Builder.md#s-isIdentityref) from Builder
- [isInt16()](Builder.md#s-isInt16) from Builder
- [isInt32()](Builder.md#s-isInt32) from Builder
- [isInt64()](Builder.md#s-isInt64) from Builder
- [isInt8()](Builder.md#s-isInt8) from Builder
- [isIpv4()](Builder.md#s-isIpv4) from Builder
- [isIpv4AndPlen()](Builder.md#s-isIpv4AndPlen) from Builder
- [isIpv4prefix()](Builder.md#s-isIpv4prefix) from Builder
- [isIpv6()](Builder.md#s-isIpv6) from Builder
- [isIpv6AndPlen()](Builder.md#s-isIpv6AndPlen) from Builder
- [isIpv6prefix()](Builder.md#s-isIpv6prefix) from Builder
- [isList()](Builder.md#s-isList) from Builder
- [isNoexists()](Builder.md#s-isNoexists) from Builder
- [isObjectref()](Builder.md#s-isObjectref) from Builder
- [isOid()](Builder.md#s-isOid) from Builder
- [isPtr()](Builder.md#s-isPtr) from Builder
- [isQname()](Builder.md#s-isQname) from Builder
- [isStr()](Builder.md#s-isStr) from Builder
- [isSymbol()](Builder.md#s-isSymbol) from Builder
- [isTime()](Builder.md#s-isTime) from Builder
- [isUint16()](Builder.md#s-isUint16) from Builder
- [isUint32()](Builder.md#s-isUint32) from Builder
- [isUint64()](Builder.md#s-isUint64) from Builder
- [isUint8()](Builder.md#s-isUint8) from Builder
- [isUnion()](Builder.md#s-isUnion) from Builder
- [isUnknown()](Builder.md#s-isUnknown) from Builder
- [isXmlbegin()](Builder.md#s-isXmlbegin) from Builder
- [isXmlbegindel()](Builder.md#s-isXmlbegindel) from Builder
- [isXmlend()](Builder.md#s-isXmlend) from Builder
- [isXmlMoveEnd()](Builder.md#s-isXmlMoveEnd) from Builder
- [isXmlMoveFirst()](Builder.md#s-isXmlMoveFirst) from Builder
- [isXmltag()](Builder.md#s-isXmltag) from Builder
- [setBinary(byte[])](Builder.md#s-setBinary) from Builder
- [setBinary(Reader)](Builder.md#s-setBinary-1) from Builder
- [setBit32(int)](Builder.md#s-setBit32) from Builder
- [setBit64(long)](Builder.md#s-setBit64) from Builder
- [setBitbig(Reader)](Builder.md#s-setBitbig) from Builder
- [setBool(boolean)](Builder.md#s-setBool) from Builder
- [setBuf(byte[])](Builder.md#s-setBuf) from Builder
- [setBuf(Reader)](Builder.md#s-setBuf-1) from Builder
- [setCdbBegin(Void)](Builder.md#s-setCdbBegin) from Builder
- [setDate(Reader)](Builder.md#s-setDate) from Builder
- [setDatetime(Reader)](Builder.md#s-setDatetime) from Builder
- [setDecimal64(Reader)](Builder.md#s-setDecimal64) from Builder
- [setDefault(Void)](Builder.md#s-setDefault) from Builder
- [setDouble(double)](Builder.md#s-setDouble) from Builder
- [setDquad(Reader)](Builder.md#s-setDquad) from Builder
- [setDuration(Reader)](Builder.md#s-setDuration) from Builder
- [setEmpty(Void)](Builder.md#s-setEmpty) from Builder
- [setEnumValue(int)](Builder.md#s-setEnumValue) from Builder
- [setHexstr(byte[])](Builder.md#s-setHexstr) from Builder
- [setHexstr(Reader)](Builder.md#s-setHexstr-1) from Builder
- [setIdentityref(Reader)](Builder.md#s-setIdentityref) from Builder
- [setInt16(short)](Builder.md#s-setInt16) from Builder
- [setInt32(int)](Builder.md#s-setInt32) from Builder
- [setInt64(long)](Builder.md#s-setInt64) from Builder
- [setInt8(byte)](Builder.md#s-setInt8) from Builder
- [setIpv4(Reader)](Builder.md#s-setIpv4) from Builder
- [setIpv4AndPlen(Reader)](Builder.md#s-setIpv4AndPlen) from Builder
- [setIpv4prefix(Reader)](Builder.md#s-setIpv4prefix) from Builder
- [setIpv6(Reader)](Builder.md#s-setIpv6) from Builder
- [setIpv6AndPlen(Reader)](Builder.md#s-setIpv6AndPlen) from Builder
- [setIpv6prefix(Reader)](Builder.md#s-setIpv6prefix) from Builder
- [setList(Reader<Reader>)](Builder.md#s-setList) from Builder
- [setNoexists(Void)](Builder.md#s-setNoexists) from Builder
- [setObjectref(Reader<Reader>)](Builder.md#s-setObjectref) from Builder
- [setOid(Reader)](Builder.md#s-setOid) from Builder
- [setPtr(Void)](Builder.md#s-setPtr) from Builder
- [setQname(Reader)](Builder.md#s-setQname) from Builder
- [setShallowType(ShallowType)](Builder.md#s-setShallowType) from Builder
- [setStr(Reader)](Builder.md#s-setStr) from Builder
- [setStr(String)](Builder.md#s-setStr-1) from Builder
- [setSymbol(Reader)](Builder.md#s-setSymbol) from Builder
- [setTime(Reader)](Builder.md#s-setTime) from Builder
- [setUint16(short)](Builder.md#s-setUint16) from Builder
- [setUint32(int)](Builder.md#s-setUint32) from Builder
- [setUint64(long)](Builder.md#s-setUint64) from Builder
- [setUint8(byte)](Builder.md#s-setUint8) from Builder
- [setUnion(Reader)](Builder.md#s-setUnion) from Builder
- [setUnknown(Void)](Builder.md#s-setUnknown) from Builder
- [setXmlbegin(Void)](Builder.md#s-setXmlbegin) from Builder
- [setXmlbegindel(Void)](Builder.md#s-setXmlbegindel) from Builder
- [setXmlend(Void)](Builder.md#s-setXmlend) from Builder
- [setXmlMoveEnd(Void)](Builder.md#s-setXmlMoveEnd) from Builder
- [setXmlMoveFirst(Void)](Builder.md#s-setXmlMoveFirst) from Builder
- [setXmltag(Reader)](Builder.md#s-setXmltag) from Builder
- [structSize()](#s-structSize)
- [which()](Builder.md#s-which) from Builder

## Constructors

<a id="s-Factory-1"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="s-asReader"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsValue.Builder builder
)
```

Types: [Reader](Reader.md#s-Reader), [Builder](Builder.md#s-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValue.Builder builder`

<a id="s-constructBuilder"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder constructBuilder(
    org.capnproto.SegmentBuilder segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount
)
```

Types: [Builder](Builder.md#s-Builder)

**Parameters**

- `org.capnproto.SegmentBuilder segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`

<a id="s-constructReader"></a>
### constructReader(SegmentReader, int, int, int, short, int)

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Reader constructReader(
    org.capnproto.SegmentReader segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount,
    int nestingLimit
)
```

Types: [Reader](Reader.md#s-Reader)

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`

<a id="s-structSize"></a>
### structSize()

```java
public final org.capnproto.StructSize structSize()
```
