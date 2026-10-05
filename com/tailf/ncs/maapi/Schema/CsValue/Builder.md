<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsValue.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getBinary()](#s-getBinary)
- [getBit32()](#s-getBit32)
- [getBit64()](#s-getBit64)
- [getBitbig()](#s-getBitbig)
- [getBool()](#s-getBool)
- [getBuf()](#s-getBuf)
- [getCdbBegin()](#s-getCdbBegin)
- [getDate()](#s-getDate)
- [getDatetime()](#s-getDatetime)
- [getDecimal64()](#s-getDecimal64)
- [getDefault()](#s-getDefault)
- [getDouble()](#s-getDouble)
- [getDquad()](#s-getDquad)
- [getDuration()](#s-getDuration)
- [getEmpty()](#s-getEmpty)
- [getEnumValue()](#s-getEnumValue)
- [getHexstr()](#s-getHexstr)
- [getIdentityref()](#s-getIdentityref)
- [getInt16()](#s-getInt16)
- [getInt32()](#s-getInt32)
- [getInt64()](#s-getInt64)
- [getInt8()](#s-getInt8)
- [getIpv4()](#s-getIpv4)
- [getIpv4AndPlen()](#s-getIpv4AndPlen)
- [getIpv4prefix()](#s-getIpv4prefix)
- [getIpv6()](#s-getIpv6)
- [getIpv6AndPlen()](#s-getIpv6AndPlen)
- [getIpv6prefix()](#s-getIpv6prefix)
- [getList()](#s-getList)
- [getNoexists()](#s-getNoexists)
- [getObjectref()](#s-getObjectref)
- [getOid()](#s-getOid)
- [getPtr()](#s-getPtr)
- [getQname()](#s-getQname)
- [getShallowType()](#s-getShallowType)
- [getStr()](#s-getStr)
- [getSymbol()](#s-getSymbol)
- [getTime()](#s-getTime)
- [getUint16()](#s-getUint16)
- [getUint32()](#s-getUint32)
- [getUint64()](#s-getUint64)
- [getUint8()](#s-getUint8)
- [getUnion()](#s-getUnion)
- [getUnknown()](#s-getUnknown)
- [getXmlbegin()](#s-getXmlbegin)
- [getXmlbegindel()](#s-getXmlbegindel)
- [getXmlend()](#s-getXmlend)
- [getXmlMoveEnd()](#s-getXmlMoveEnd)
- [getXmlMoveFirst()](#s-getXmlMoveFirst)
- [getXmltag()](#s-getXmltag)
- [hasBinary()](#s-hasBinary)
- [hasBuf()](#s-hasBuf)
- [hasHexstr()](#s-hasHexstr)
- [hasList()](#s-hasList)
- [hasObjectref()](#s-hasObjectref)
- [hasOid()](#s-hasOid)
- [hasStr()](#s-hasStr)
- [initBinary(int)](#s-initBinary)
- [initBitbig()](#s-initBitbig)
- [initBuf(int)](#s-initBuf)
- [initDate()](#s-initDate)
- [initDatetime()](#s-initDatetime)
- [initDecimal64()](#s-initDecimal64)
- [initDquad()](#s-initDquad)
- [initDuration()](#s-initDuration)
- [initHexstr(int)](#s-initHexstr)
- [initIdentityref()](#s-initIdentityref)
- [initIpv4()](#s-initIpv4)
- [initIpv4AndPlen()](#s-initIpv4AndPlen)
- [initIpv4prefix()](#s-initIpv4prefix)
- [initIpv6()](#s-initIpv6)
- [initIpv6AndPlen()](#s-initIpv6AndPlen)
- [initIpv6prefix()](#s-initIpv6prefix)
- [initList(int)](#s-initList)
- [initObjectref(int)](#s-initObjectref)
- [initOid(int)](#s-initOid)
- [initQname()](#s-initQname)
- [initStr(int)](#s-initStr)
- [initSymbol()](#s-initSymbol)
- [initTime()](#s-initTime)
- [initUnion()](#s-initUnion)
- [initXmltag()](#s-initXmltag)
- [isBinary()](#s-isBinary)
- [isBit32()](#s-isBit32)
- [isBit64()](#s-isBit64)
- [isBitbig()](#s-isBitbig)
- [isBool()](#s-isBool)
- [isBuf()](#s-isBuf)
- [isCdbBegin()](#s-isCdbBegin)
- [isDate()](#s-isDate)
- [isDatetime()](#s-isDatetime)
- [isDecimal64()](#s-isDecimal64)
- [isDefault()](#s-isDefault)
- [isDouble()](#s-isDouble)
- [isDquad()](#s-isDquad)
- [isDuration()](#s-isDuration)
- [isEmpty()](#s-isEmpty)
- [isEnumValue()](#s-isEnumValue)
- [isHexstr()](#s-isHexstr)
- [isIdentityref()](#s-isIdentityref)
- [isInt16()](#s-isInt16)
- [isInt32()](#s-isInt32)
- [isInt64()](#s-isInt64)
- [isInt8()](#s-isInt8)
- [isIpv4()](#s-isIpv4)
- [isIpv4AndPlen()](#s-isIpv4AndPlen)
- [isIpv4prefix()](#s-isIpv4prefix)
- [isIpv6()](#s-isIpv6)
- [isIpv6AndPlen()](#s-isIpv6AndPlen)
- [isIpv6prefix()](#s-isIpv6prefix)
- [isList()](#s-isList)
- [isNoexists()](#s-isNoexists)
- [isObjectref()](#s-isObjectref)
- [isOid()](#s-isOid)
- [isPtr()](#s-isPtr)
- [isQname()](#s-isQname)
- [isStr()](#s-isStr)
- [isSymbol()](#s-isSymbol)
- [isTime()](#s-isTime)
- [isUint16()](#s-isUint16)
- [isUint32()](#s-isUint32)
- [isUint64()](#s-isUint64)
- [isUint8()](#s-isUint8)
- [isUnion()](#s-isUnion)
- [isUnknown()](#s-isUnknown)
- [isXmlbegin()](#s-isXmlbegin)
- [isXmlbegindel()](#s-isXmlbegindel)
- [isXmlend()](#s-isXmlend)
- [isXmlMoveEnd()](#s-isXmlMoveEnd)
- [isXmlMoveFirst()](#s-isXmlMoveFirst)
- [isXmltag()](#s-isXmltag)
- [setBinary(byte[])](#s-setBinary)
- [setBinary(Reader)](#s-setBinary-1)
- [setBit32(int)](#s-setBit32)
- [setBit64(long)](#s-setBit64)
- [setBitbig(Reader)](#s-setBitbig)
- [setBool(boolean)](#s-setBool)
- [setBuf(byte[])](#s-setBuf)
- [setBuf(Reader)](#s-setBuf-1)
- [setCdbBegin(Void)](#s-setCdbBegin)
- [setDate(Reader)](#s-setDate)
- [setDatetime(Reader)](#s-setDatetime)
- [setDecimal64(Reader)](#s-setDecimal64)
- [setDefault(Void)](#s-setDefault)
- [setDouble(double)](#s-setDouble)
- [setDquad(Reader)](#s-setDquad)
- [setDuration(Reader)](#s-setDuration)
- [setEmpty(Void)](#s-setEmpty)
- [setEnumValue(int)](#s-setEnumValue)
- [setHexstr(byte[])](#s-setHexstr)
- [setHexstr(Reader)](#s-setHexstr-1)
- [setIdentityref(Reader)](#s-setIdentityref)
- [setInt16(short)](#s-setInt16)
- [setInt32(int)](#s-setInt32)
- [setInt64(long)](#s-setInt64)
- [setInt8(byte)](#s-setInt8)
- [setIpv4(Reader)](#s-setIpv4)
- [setIpv4AndPlen(Reader)](#s-setIpv4AndPlen)
- [setIpv4prefix(Reader)](#s-setIpv4prefix)
- [setIpv6(Reader)](#s-setIpv6)
- [setIpv6AndPlen(Reader)](#s-setIpv6AndPlen)
- [setIpv6prefix(Reader)](#s-setIpv6prefix)
- [setList(Reader<Reader>)](#s-setList)
- [setNoexists(Void)](#s-setNoexists)
- [setObjectref(Reader<Reader>)](#s-setObjectref)
- [setOid(Reader)](#s-setOid)
- [setPtr(Void)](#s-setPtr)
- [setQname(Reader)](#s-setQname)
- [setShallowType(ShallowType)](#s-setShallowType)
- [setStr(Reader)](#s-setStr)
- [setStr(String)](#s-setStr-1)
- [setSymbol(Reader)](#s-setSymbol)
- [setTime(Reader)](#s-setTime)
- [setUint16(short)](#s-setUint16)
- [setUint32(int)](#s-setUint32)
- [setUint64(long)](#s-setUint64)
- [setUint8(byte)](#s-setUint8)
- [setUnion(Reader)](#s-setUnion)
- [setUnknown(Void)](#s-setUnknown)
- [setXmlbegin(Void)](#s-setXmlbegin)
- [setXmlbegindel(Void)](#s-setXmlbegindel)
- [setXmlend(Void)](#s-setXmlend)
- [setXmlMoveEnd(Void)](#s-setXmlMoveEnd)
- [setXmlMoveFirst(Void)](#s-setXmlMoveFirst)
- [setXmltag(Reader)](#s-setXmltag)
- [which()](#s-which)

## Constructors

<a id="s-Builder-1"></a>
### Builder(SegmentBuilder, int, int, int, short)

**Package-private**

```java
Builder(
    org.capnproto.SegmentBuilder segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount
)
```

**Parameters**

- `org.capnproto.SegmentBuilder segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`


## Methods

<a id="s-asReader"></a>
### asReader()

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getBinary"></a>
### getBinary()

```java
public final org.capnproto.Data.Builder getBinary()
```

<a id="s-getBit32"></a>
### getBit32()

```java
public final int getBit32()
```

<a id="s-getBit64"></a>
### getBit64()

```java
public final long getBit64()
```

<a id="s-getBitbig"></a>
### getBitbig()

```java
public final com.tailf.ncs.maapi.Schema.CsValueBitBig.Builder getBitbig()
```

Types: [Builder](../CsValueBitBig/Builder.md#s-Builder)

<a id="s-getBool"></a>
### getBool()

```java
public final boolean getBool()
```

<a id="s-getBuf"></a>
### getBuf()

```java
public final org.capnproto.Data.Builder getBuf()
```

<a id="s-getCdbBegin"></a>
### getCdbBegin()

```java
public final org.capnproto.Void getCdbBegin()
```

<a id="s-getDate"></a>
### getDate()

```java
public final com.tailf.ncs.maapi.Schema.CsValueDate.Builder getDate()
```

Types: [Builder](../CsValueDate/Builder.md#s-Builder)

<a id="s-getDatetime"></a>
### getDatetime()

```java
public final com.tailf.ncs.maapi.Schema.CsValueDateTime.Builder getDatetime()
```

Types: [Builder](../CsValueDateTime/Builder.md#s-Builder)

<a id="s-getDecimal64"></a>
### getDecimal64()

```java
public final com.tailf.ncs.maapi.Schema.CsValueDecimal64.Builder getDecimal64()
```

Types: [Builder](../CsValueDecimal64/Builder.md#s-Builder)

<a id="s-getDefault"></a>
### getDefault()

```java
public final org.capnproto.Void getDefault()
```

<a id="s-getDouble"></a>
### getDouble()

```java
public final double getDouble()
```

<a id="s-getDquad"></a>
### getDquad()

```java
public final com.tailf.ncs.maapi.Schema.CsValueDQuad.Builder getDquad()
```

Types: [Builder](../CsValueDQuad/Builder.md#s-Builder)

<a id="s-getDuration"></a>
### getDuration()

```java
public final com.tailf.ncs.maapi.Schema.CsValueDuration.Builder getDuration()
```

Types: [Builder](../CsValueDuration/Builder.md#s-Builder)

<a id="s-getEmpty"></a>
### getEmpty()

```java
public final org.capnproto.Void getEmpty()
```

<a id="s-getEnumValue"></a>
### getEnumValue()

```java
public final int getEnumValue()
```

<a id="s-getHexstr"></a>
### getHexstr()

```java
public final org.capnproto.Data.Builder getHexstr()
```

<a id="s-getIdentityref"></a>
### getIdentityref()

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder getIdentityref()
```

Types: [Builder](../QTag/Builder.md#s-Builder)

<a id="s-getInt16"></a>
### getInt16()

```java
public final short getInt16()
```

<a id="s-getInt32"></a>
### getInt32()

```java
public final int getInt32()
```

<a id="s-getInt64"></a>
### getInt64()

```java
public final long getInt64()
```

<a id="s-getInt8"></a>
### getInt8()

```java
public final byte getInt8()
```

<a id="s-getIpv4"></a>
### getIpv4()

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder getIpv4()
```

Types: [Builder](../CsValueIPv4Prefix/Builder.md#s-Builder)

<a id="s-getIpv4AndPlen"></a>
### getIpv4AndPlen()

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder getIpv4AndPlen()
```

Types: [Builder](../CsValueIPv4Prefix/Builder.md#s-Builder)

<a id="s-getIpv4prefix"></a>
### getIpv4prefix()

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder getIpv4prefix()
```

Types: [Builder](../CsValueIPv4Prefix/Builder.md#s-Builder)

<a id="s-getIpv6"></a>
### getIpv6()

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder getIpv6()
```

Types: [Builder](../CsValueIPv6Prefix/Builder.md#s-Builder)

<a id="s-getIpv6AndPlen"></a>
### getIpv6AndPlen()

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder getIpv6AndPlen()
```

Types: [Builder](../CsValueIPv6Prefix/Builder.md#s-Builder)

<a id="s-getIpv6prefix"></a>
### getIpv6prefix()

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder getIpv6prefix()
```

Types: [Builder](../CsValueIPv6Prefix/Builder.md#s-Builder)

<a id="s-getList"></a>
### getList()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsValue.Builder> getList()
```

Types: [Builder](Builder.md#s-Builder)

<a id="s-getNoexists"></a>
### getNoexists()

```java
public final org.capnproto.Void getNoexists()
```

<a id="s-getObjectref"></a>
### getObjectref()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsValue.Builder> getObjectref()
```

Types: [Builder](Builder.md#s-Builder)

<a id="s-getOid"></a>
### getOid()

```java
public final org.capnproto.PrimitiveList.Long.Builder getOid()
```

<a id="s-getPtr"></a>
### getPtr()

```java
public final org.capnproto.Void getPtr()
```

<a id="s-getQname"></a>
### getQname()

```java
public final com.tailf.ncs.maapi.Schema.CsValueQName.Builder getQname()
```

Types: [Builder](../CsValueQName/Builder.md#s-Builder)

<a id="s-getShallowType"></a>
### getShallowType()

```java
public final com.tailf.ncs.maapi.Schema.ShallowType getShallowType()
```

Types: [ShallowType](../ShallowType.md#s-ShallowType)

<a id="s-getStr"></a>
### getStr()

```java
public final org.capnproto.Text.Builder getStr()
```

<a id="s-getSymbol"></a>
### getSymbol()

```java
public final com.tailf.ncs.maapi.Schema.CsValueSymbol.Builder getSymbol()
```

Types: [Builder](../CsValueSymbol/Builder.md#s-Builder)

<a id="s-getTime"></a>
### getTime()

```java
public final com.tailf.ncs.maapi.Schema.CsValueTime.Builder getTime()
```

Types: [Builder](../CsValueTime/Builder.md#s-Builder)

<a id="s-getUint16"></a>
### getUint16()

```java
public final short getUint16()
```

<a id="s-getUint32"></a>
### getUint32()

```java
public final int getUint32()
```

<a id="s-getUint64"></a>
### getUint64()

```java
public final long getUint64()
```

<a id="s-getUint8"></a>
### getUint8()

```java
public final byte getUint8()
```

<a id="s-getUnion"></a>
### getUnion()

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder getUnion()
```

Types: [Builder](Builder.md#s-Builder)

<a id="s-getUnknown"></a>
### getUnknown()

```java
public final org.capnproto.Void getUnknown()
```

<a id="s-getXmlbegin"></a>
### getXmlbegin()

```java
public final org.capnproto.Void getXmlbegin()
```

<a id="s-getXmlbegindel"></a>
### getXmlbegindel()

```java
public final org.capnproto.Void getXmlbegindel()
```

<a id="s-getXmlend"></a>
### getXmlend()

```java
public final org.capnproto.Void getXmlend()
```

<a id="s-getXmlMoveEnd"></a>
### getXmlMoveEnd()

```java
public final org.capnproto.Void getXmlMoveEnd()
```

<a id="s-getXmlMoveFirst"></a>
### getXmlMoveFirst()

```java
public final org.capnproto.Void getXmlMoveFirst()
```

<a id="s-getXmltag"></a>
### getXmltag()

```java
public final com.tailf.ncs.maapi.Schema.CsValueXmlTag.Builder getXmltag()
```

Types: [Builder](../CsValueXmlTag/Builder.md#s-Builder)

<a id="s-hasBinary"></a>
### hasBinary()

```java
public final boolean hasBinary()
```

<a id="s-hasBuf"></a>
### hasBuf()

```java
public final boolean hasBuf()
```

<a id="s-hasHexstr"></a>
### hasHexstr()

```java
public final boolean hasHexstr()
```

<a id="s-hasList"></a>
### hasList()

```java
public final boolean hasList()
```

<a id="s-hasObjectref"></a>
### hasObjectref()

```java
public final boolean hasObjectref()
```

<a id="s-hasOid"></a>
### hasOid()

```java
public final boolean hasOid()
```

<a id="s-hasStr"></a>
### hasStr()

```java
public final boolean hasStr()
```

<a id="s-initBinary"></a>
### initBinary(int)

```java
public final org.capnproto.Data.Builder initBinary(int size)
```

**Parameters**

- `int size`

<a id="s-initBitbig"></a>
### initBitbig()

```java
public final com.tailf.ncs.maapi.Schema.CsValueBitBig.Builder initBitbig()
```

Types: [Builder](../CsValueBitBig/Builder.md#s-Builder)

<a id="s-initBuf"></a>
### initBuf(int)

```java
public final org.capnproto.Data.Builder initBuf(int size)
```

**Parameters**

- `int size`

<a id="s-initDate"></a>
### initDate()

```java
public final com.tailf.ncs.maapi.Schema.CsValueDate.Builder initDate()
```

Types: [Builder](../CsValueDate/Builder.md#s-Builder)

<a id="s-initDatetime"></a>
### initDatetime()

```java
public final com.tailf.ncs.maapi.Schema.CsValueDateTime.Builder initDatetime()
```

Types: [Builder](../CsValueDateTime/Builder.md#s-Builder)

<a id="s-initDecimal64"></a>
### initDecimal64()

```java
public final com.tailf.ncs.maapi.Schema.CsValueDecimal64.Builder initDecimal64()
```

Types: [Builder](../CsValueDecimal64/Builder.md#s-Builder)

<a id="s-initDquad"></a>
### initDquad()

```java
public final com.tailf.ncs.maapi.Schema.CsValueDQuad.Builder initDquad()
```

Types: [Builder](../CsValueDQuad/Builder.md#s-Builder)

<a id="s-initDuration"></a>
### initDuration()

```java
public final com.tailf.ncs.maapi.Schema.CsValueDuration.Builder initDuration()
```

Types: [Builder](../CsValueDuration/Builder.md#s-Builder)

<a id="s-initHexstr"></a>
### initHexstr(int)

```java
public final org.capnproto.Data.Builder initHexstr(int size)
```

**Parameters**

- `int size`

<a id="s-initIdentityref"></a>
### initIdentityref()

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder initIdentityref()
```

Types: [Builder](../QTag/Builder.md#s-Builder)

<a id="s-initIpv4"></a>
### initIpv4()

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder initIpv4()
```

Types: [Builder](../CsValueIPv4Prefix/Builder.md#s-Builder)

<a id="s-initIpv4AndPlen"></a>
### initIpv4AndPlen()

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder initIpv4AndPlen()
```

Types: [Builder](../CsValueIPv4Prefix/Builder.md#s-Builder)

<a id="s-initIpv4prefix"></a>
### initIpv4prefix()

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder initIpv4prefix()
```

Types: [Builder](../CsValueIPv4Prefix/Builder.md#s-Builder)

<a id="s-initIpv6"></a>
### initIpv6()

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder initIpv6()
```

Types: [Builder](../CsValueIPv6Prefix/Builder.md#s-Builder)

<a id="s-initIpv6AndPlen"></a>
### initIpv6AndPlen()

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder initIpv6AndPlen()
```

Types: [Builder](../CsValueIPv6Prefix/Builder.md#s-Builder)

<a id="s-initIpv6prefix"></a>
### initIpv6prefix()

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder initIpv6prefix()
```

Types: [Builder](../CsValueIPv6Prefix/Builder.md#s-Builder)

<a id="s-initList"></a>
### initList(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsValue.Builder> initList(
    int size
)
```

Types: [Builder](Builder.md#s-Builder)

**Parameters**

- `int size`

<a id="s-initObjectref"></a>
### initObjectref(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsValue.Builder> initObjectref(
    int size
)
```

Types: [Builder](Builder.md#s-Builder)

**Parameters**

- `int size`

<a id="s-initOid"></a>
### initOid(int)

```java
public final org.capnproto.PrimitiveList.Long.Builder initOid(int size)
```

**Parameters**

- `int size`

<a id="s-initQname"></a>
### initQname()

```java
public final com.tailf.ncs.maapi.Schema.CsValueQName.Builder initQname()
```

Types: [Builder](../CsValueQName/Builder.md#s-Builder)

<a id="s-initStr"></a>
### initStr(int)

```java
public final org.capnproto.Text.Builder initStr(int size)
```

**Parameters**

- `int size`

<a id="s-initSymbol"></a>
### initSymbol()

```java
public final com.tailf.ncs.maapi.Schema.CsValueSymbol.Builder initSymbol()
```

Types: [Builder](../CsValueSymbol/Builder.md#s-Builder)

<a id="s-initTime"></a>
### initTime()

```java
public final com.tailf.ncs.maapi.Schema.CsValueTime.Builder initTime()
```

Types: [Builder](../CsValueTime/Builder.md#s-Builder)

<a id="s-initUnion"></a>
### initUnion()

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder initUnion()
```

Types: [Builder](Builder.md#s-Builder)

<a id="s-initXmltag"></a>
### initXmltag()

```java
public final com.tailf.ncs.maapi.Schema.CsValueXmlTag.Builder initXmltag()
```

Types: [Builder](../CsValueXmlTag/Builder.md#s-Builder)

<a id="s-isBinary"></a>
### isBinary()

```java
public final boolean isBinary()
```

<a id="s-isBit32"></a>
### isBit32()

```java
public final boolean isBit32()
```

<a id="s-isBit64"></a>
### isBit64()

```java
public final boolean isBit64()
```

<a id="s-isBitbig"></a>
### isBitbig()

```java
public final boolean isBitbig()
```

<a id="s-isBool"></a>
### isBool()

```java
public final boolean isBool()
```

<a id="s-isBuf"></a>
### isBuf()

```java
public final boolean isBuf()
```

<a id="s-isCdbBegin"></a>
### isCdbBegin()

```java
public final boolean isCdbBegin()
```

<a id="s-isDate"></a>
### isDate()

```java
public final boolean isDate()
```

<a id="s-isDatetime"></a>
### isDatetime()

```java
public final boolean isDatetime()
```

<a id="s-isDecimal64"></a>
### isDecimal64()

```java
public final boolean isDecimal64()
```

<a id="s-isDefault"></a>
### isDefault()

```java
public final boolean isDefault()
```

<a id="s-isDouble"></a>
### isDouble()

```java
public final boolean isDouble()
```

<a id="s-isDquad"></a>
### isDquad()

```java
public final boolean isDquad()
```

<a id="s-isDuration"></a>
### isDuration()

```java
public final boolean isDuration()
```

<a id="s-isEmpty"></a>
### isEmpty()

```java
public final boolean isEmpty()
```

<a id="s-isEnumValue"></a>
### isEnumValue()

```java
public final boolean isEnumValue()
```

<a id="s-isHexstr"></a>
### isHexstr()

```java
public final boolean isHexstr()
```

<a id="s-isIdentityref"></a>
### isIdentityref()

```java
public final boolean isIdentityref()
```

<a id="s-isInt16"></a>
### isInt16()

```java
public final boolean isInt16()
```

<a id="s-isInt32"></a>
### isInt32()

```java
public final boolean isInt32()
```

<a id="s-isInt64"></a>
### isInt64()

```java
public final boolean isInt64()
```

<a id="s-isInt8"></a>
### isInt8()

```java
public final boolean isInt8()
```

<a id="s-isIpv4"></a>
### isIpv4()

```java
public final boolean isIpv4()
```

<a id="s-isIpv4AndPlen"></a>
### isIpv4AndPlen()

```java
public final boolean isIpv4AndPlen()
```

<a id="s-isIpv4prefix"></a>
### isIpv4prefix()

```java
public final boolean isIpv4prefix()
```

<a id="s-isIpv6"></a>
### isIpv6()

```java
public final boolean isIpv6()
```

<a id="s-isIpv6AndPlen"></a>
### isIpv6AndPlen()

```java
public final boolean isIpv6AndPlen()
```

<a id="s-isIpv6prefix"></a>
### isIpv6prefix()

```java
public final boolean isIpv6prefix()
```

<a id="s-isList"></a>
### isList()

```java
public final boolean isList()
```

<a id="s-isNoexists"></a>
### isNoexists()

```java
public final boolean isNoexists()
```

<a id="s-isObjectref"></a>
### isObjectref()

```java
public final boolean isObjectref()
```

<a id="s-isOid"></a>
### isOid()

```java
public final boolean isOid()
```

<a id="s-isPtr"></a>
### isPtr()

```java
public final boolean isPtr()
```

<a id="s-isQname"></a>
### isQname()

```java
public final boolean isQname()
```

<a id="s-isStr"></a>
### isStr()

```java
public final boolean isStr()
```

<a id="s-isSymbol"></a>
### isSymbol()

```java
public final boolean isSymbol()
```

<a id="s-isTime"></a>
### isTime()

```java
public final boolean isTime()
```

<a id="s-isUint16"></a>
### isUint16()

```java
public final boolean isUint16()
```

<a id="s-isUint32"></a>
### isUint32()

```java
public final boolean isUint32()
```

<a id="s-isUint64"></a>
### isUint64()

```java
public final boolean isUint64()
```

<a id="s-isUint8"></a>
### isUint8()

```java
public final boolean isUint8()
```

<a id="s-isUnion"></a>
### isUnion()

```java
public final boolean isUnion()
```

<a id="s-isUnknown"></a>
### isUnknown()

```java
public final boolean isUnknown()
```

<a id="s-isXmlbegin"></a>
### isXmlbegin()

```java
public final boolean isXmlbegin()
```

<a id="s-isXmlbegindel"></a>
### isXmlbegindel()

```java
public final boolean isXmlbegindel()
```

<a id="s-isXmlend"></a>
### isXmlend()

```java
public final boolean isXmlend()
```

<a id="s-isXmlMoveEnd"></a>
### isXmlMoveEnd()

```java
public final boolean isXmlMoveEnd()
```

<a id="s-isXmlMoveFirst"></a>
### isXmlMoveFirst()

```java
public final boolean isXmlMoveFirst()
```

<a id="s-isXmltag"></a>
### isXmltag()

```java
public final boolean isXmltag()
```

<a id="s-setBinary"></a>
### setBinary(byte[])

```java
public final void setBinary(byte[] value)
```

**Parameters**

- `byte[] value`

<a id="s-setBinary-1"></a>
### setBinary(Reader)

```java
public final void setBinary(org.capnproto.Data.Reader value)
```

**Parameters**

- `org.capnproto.Data.Reader value`

<a id="s-setBit32"></a>
### setBit32(int)

```java
public final void setBit32(int value)
```

**Parameters**

- `int value`

<a id="s-setBit64"></a>
### setBit64(long)

```java
public final void setBit64(long value)
```

**Parameters**

- `long value`

<a id="s-setBitbig"></a>
### setBitbig(Reader)

```java
public final void setBitbig(com.tailf.ncs.maapi.Schema.CsValueBitBig.Reader value)
```

Types: [Reader](../CsValueBitBig/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueBitBig.Reader value`

<a id="s-setBool"></a>
### setBool(boolean)

```java
public final void setBool(boolean value)
```

**Parameters**

- `boolean value`

<a id="s-setBuf"></a>
### setBuf(byte[])

```java
public final void setBuf(byte[] value)
```

**Parameters**

- `byte[] value`

<a id="s-setBuf-1"></a>
### setBuf(Reader)

```java
public final void setBuf(org.capnproto.Data.Reader value)
```

**Parameters**

- `org.capnproto.Data.Reader value`

<a id="s-setCdbBegin"></a>
### setCdbBegin(Void)

```java
public final void setCdbBegin(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="s-setDate"></a>
### setDate(Reader)

```java
public final void setDate(com.tailf.ncs.maapi.Schema.CsValueDate.Reader value)
```

Types: [Reader](../CsValueDate/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDate.Reader value`

<a id="s-setDatetime"></a>
### setDatetime(Reader)

```java
public final void setDatetime(com.tailf.ncs.maapi.Schema.CsValueDateTime.Reader value)
```

Types: [Reader](../CsValueDateTime/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDateTime.Reader value`

<a id="s-setDecimal64"></a>
### setDecimal64(Reader)

```java
public final void setDecimal64(com.tailf.ncs.maapi.Schema.CsValueDecimal64.Reader value)
```

Types: [Reader](../CsValueDecimal64/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDecimal64.Reader value`

<a id="s-setDefault"></a>
### setDefault(Void)

```java
public final void setDefault(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="s-setDouble"></a>
### setDouble(double)

```java
public final void setDouble(double value)
```

**Parameters**

- `double value`

<a id="s-setDquad"></a>
### setDquad(Reader)

```java
public final void setDquad(com.tailf.ncs.maapi.Schema.CsValueDQuad.Reader value)
```

Types: [Reader](../CsValueDQuad/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDQuad.Reader value`

<a id="s-setDuration"></a>
### setDuration(Reader)

```java
public final void setDuration(com.tailf.ncs.maapi.Schema.CsValueDuration.Reader value)
```

Types: [Reader](../CsValueDuration/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDuration.Reader value`

<a id="s-setEmpty"></a>
### setEmpty(Void)

```java
public final void setEmpty(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="s-setEnumValue"></a>
### setEnumValue(int)

```java
public final void setEnumValue(int value)
```

**Parameters**

- `int value`

<a id="s-setHexstr"></a>
### setHexstr(byte[])

```java
public final void setHexstr(byte[] value)
```

**Parameters**

- `byte[] value`

<a id="s-setHexstr-1"></a>
### setHexstr(Reader)

```java
public final void setHexstr(org.capnproto.Data.Reader value)
```

**Parameters**

- `org.capnproto.Data.Reader value`

<a id="s-setIdentityref"></a>
### setIdentityref(Reader)

```java
public final void setIdentityref(com.tailf.ncs.maapi.Schema.QTag.Reader value)
```

Types: [Reader](../QTag/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.QTag.Reader value`

<a id="s-setInt16"></a>
### setInt16(short)

```java
public final void setInt16(short value)
```

**Parameters**

- `short value`

<a id="s-setInt32"></a>
### setInt32(int)

```java
public final void setInt32(int value)
```

**Parameters**

- `int value`

<a id="s-setInt64"></a>
### setInt64(long)

```java
public final void setInt64(long value)
```

**Parameters**

- `long value`

<a id="s-setInt8"></a>
### setInt8(byte)

```java
public final void setInt8(byte value)
```

**Parameters**

- `byte value`

<a id="s-setIpv4"></a>
### setIpv4(Reader)

```java
public final void setIpv4(com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader value)
```

Types: [Reader](../CsValueIPv4Prefix/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader value`

<a id="s-setIpv4AndPlen"></a>
### setIpv4AndPlen(Reader)

```java
public final void setIpv4AndPlen(com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader value)
```

Types: [Reader](../CsValueIPv4Prefix/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader value`

<a id="s-setIpv4prefix"></a>
### setIpv4prefix(Reader)

```java
public final void setIpv4prefix(com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader value)
```

Types: [Reader](../CsValueIPv4Prefix/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader value`

<a id="s-setIpv6"></a>
### setIpv6(Reader)

```java
public final void setIpv6(com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader value)
```

Types: [Reader](../CsValueIPv6Prefix/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader value`

<a id="s-setIpv6AndPlen"></a>
### setIpv6AndPlen(Reader)

```java
public final void setIpv6AndPlen(com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader value)
```

Types: [Reader](../CsValueIPv6Prefix/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader value`

<a id="s-setIpv6prefix"></a>
### setIpv6prefix(Reader)

```java
public final void setIpv6prefix(com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader value)
```

Types: [Reader](../CsValueIPv6Prefix/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader value`

<a id="s-setList"></a>
### setList(Reader<Reader>)

```java
public final void setList(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsValue.Reader> value
)
```

Types: [Reader](Reader.md#s-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsValue.Reader> value`

<a id="s-setNoexists"></a>
### setNoexists(Void)

```java
public final void setNoexists(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="s-setObjectref"></a>
### setObjectref(Reader<Reader>)

```java
public final void setObjectref(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsValue.Reader> value
)
```

Types: [Reader](Reader.md#s-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsValue.Reader> value`

<a id="s-setOid"></a>
### setOid(Reader)

```java
public final void setOid(org.capnproto.PrimitiveList.Long.Reader value)
```

**Parameters**

- `org.capnproto.PrimitiveList.Long.Reader value`

<a id="s-setPtr"></a>
### setPtr(Void)

```java
public final void setPtr(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="s-setQname"></a>
### setQname(Reader)

```java
public final void setQname(com.tailf.ncs.maapi.Schema.CsValueQName.Reader value)
```

Types: [Reader](../CsValueQName/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueQName.Reader value`

<a id="s-setShallowType"></a>
### setShallowType(ShallowType)

```java
public final void setShallowType(com.tailf.ncs.maapi.Schema.ShallowType value)
```

Types: [ShallowType](../ShallowType.md#s-ShallowType)

**Parameters**

- `com.tailf.ncs.maapi.Schema.ShallowType value`

<a id="s-setStr"></a>
### setStr(Reader)

```java
public final void setStr(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="s-setStr-1"></a>
### setStr(String)

```java
public final void setStr(String value)
```

**Parameters**

- `String value`

<a id="s-setSymbol"></a>
### setSymbol(Reader)

```java
public final void setSymbol(com.tailf.ncs.maapi.Schema.CsValueSymbol.Reader value)
```

Types: [Reader](../CsValueSymbol/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueSymbol.Reader value`

<a id="s-setTime"></a>
### setTime(Reader)

```java
public final void setTime(com.tailf.ncs.maapi.Schema.CsValueTime.Reader value)
```

Types: [Reader](../CsValueTime/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueTime.Reader value`

<a id="s-setUint16"></a>
### setUint16(short)

```java
public final void setUint16(short value)
```

**Parameters**

- `short value`

<a id="s-setUint32"></a>
### setUint32(int)

```java
public final void setUint32(int value)
```

**Parameters**

- `int value`

<a id="s-setUint64"></a>
### setUint64(long)

```java
public final void setUint64(long value)
```

**Parameters**

- `long value`

<a id="s-setUint8"></a>
### setUint8(byte)

```java
public final void setUint8(byte value)
```

**Parameters**

- `byte value`

<a id="s-setUnion"></a>
### setUnion(Reader)

```java
public final void setUnion(com.tailf.ncs.maapi.Schema.CsValue.Reader value)
```

Types: [Reader](Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValue.Reader value`

<a id="s-setUnknown"></a>
### setUnknown(Void)

```java
public final void setUnknown(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="s-setXmlbegin"></a>
### setXmlbegin(Void)

```java
public final void setXmlbegin(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="s-setXmlbegindel"></a>
### setXmlbegindel(Void)

```java
public final void setXmlbegindel(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="s-setXmlend"></a>
### setXmlend(Void)

```java
public final void setXmlend(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="s-setXmlMoveEnd"></a>
### setXmlMoveEnd(Void)

```java
public final void setXmlMoveEnd(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="s-setXmlMoveFirst"></a>
### setXmlMoveFirst(Void)

```java
public final void setXmlMoveFirst(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="s-setXmltag"></a>
### setXmltag(Reader)

```java
public final void setXmltag(com.tailf.ncs.maapi.Schema.CsValueXmlTag.Reader value)
```

Types: [Reader](../CsValueXmlTag/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueXmlTag.Reader value`

<a id="s-which"></a>
### which()

```java
public com.tailf.ncs.maapi.Schema.CsValue.Which which()
```

Types: [Which](Which.md#s-Which)
