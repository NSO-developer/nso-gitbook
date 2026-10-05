<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsValue.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

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
- [hasBitbig()](#s-hasBitbig)
- [hasBuf()](#s-hasBuf)
- [hasDate()](#s-hasDate)
- [hasDatetime()](#s-hasDatetime)
- [hasDecimal64()](#s-hasDecimal64)
- [hasDquad()](#s-hasDquad)
- [hasDuration()](#s-hasDuration)
- [hasHexstr()](#s-hasHexstr)
- [hasIdentityref()](#s-hasIdentityref)
- [hasIpv4()](#s-hasIpv4)
- [hasIpv4AndPlen()](#s-hasIpv4AndPlen)
- [hasIpv4prefix()](#s-hasIpv4prefix)
- [hasIpv6()](#s-hasIpv6)
- [hasIpv6AndPlen()](#s-hasIpv6AndPlen)
- [hasIpv6prefix()](#s-hasIpv6prefix)
- [hasList()](#s-hasList)
- [hasObjectref()](#s-hasObjectref)
- [hasOid()](#s-hasOid)
- [hasQname()](#s-hasQname)
- [hasStr()](#s-hasStr)
- [hasSymbol()](#s-hasSymbol)
- [hasTime()](#s-hasTime)
- [hasUnion()](#s-hasUnion)
- [hasXmltag()](#s-hasXmltag)
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
- [which()](#s-which)

## Constructors

<a id="s-Reader-1"></a>
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

<a id="s-getBinary"></a>
### getBinary()

```java
public org.capnproto.Data.Reader getBinary()
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
public com.tailf.ncs.maapi.Schema.CsValueBitBig.Reader getBitbig()
```

Types: [Reader](../CsValueBitBig/Reader.md#s-Reader)

<a id="s-getBool"></a>
### getBool()

```java
public final boolean getBool()
```

<a id="s-getBuf"></a>
### getBuf()

```java
public org.capnproto.Data.Reader getBuf()
```

<a id="s-getCdbBegin"></a>
### getCdbBegin()

```java
public final org.capnproto.Void getCdbBegin()
```

<a id="s-getDate"></a>
### getDate()

```java
public com.tailf.ncs.maapi.Schema.CsValueDate.Reader getDate()
```

Types: [Reader](../CsValueDate/Reader.md#s-Reader)

<a id="s-getDatetime"></a>
### getDatetime()

```java
public com.tailf.ncs.maapi.Schema.CsValueDateTime.Reader getDatetime()
```

Types: [Reader](../CsValueDateTime/Reader.md#s-Reader)

<a id="s-getDecimal64"></a>
### getDecimal64()

```java
public com.tailf.ncs.maapi.Schema.CsValueDecimal64.Reader getDecimal64()
```

Types: [Reader](../CsValueDecimal64/Reader.md#s-Reader)

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
public com.tailf.ncs.maapi.Schema.CsValueDQuad.Reader getDquad()
```

Types: [Reader](../CsValueDQuad/Reader.md#s-Reader)

<a id="s-getDuration"></a>
### getDuration()

```java
public com.tailf.ncs.maapi.Schema.CsValueDuration.Reader getDuration()
```

Types: [Reader](../CsValueDuration/Reader.md#s-Reader)

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
public org.capnproto.Data.Reader getHexstr()
```

<a id="s-getIdentityref"></a>
### getIdentityref()

```java
public com.tailf.ncs.maapi.Schema.QTag.Reader getIdentityref()
```

Types: [Reader](../QTag/Reader.md#s-Reader)

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
public com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader getIpv4()
```

Types: [Reader](../CsValueIPv4Prefix/Reader.md#s-Reader)

<a id="s-getIpv4AndPlen"></a>
### getIpv4AndPlen()

```java
public com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader getIpv4AndPlen()
```

Types: [Reader](../CsValueIPv4Prefix/Reader.md#s-Reader)

<a id="s-getIpv4prefix"></a>
### getIpv4prefix()

```java
public com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader getIpv4prefix()
```

Types: [Reader](../CsValueIPv4Prefix/Reader.md#s-Reader)

<a id="s-getIpv6"></a>
### getIpv6()

```java
public com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader getIpv6()
```

Types: [Reader](../CsValueIPv6Prefix/Reader.md#s-Reader)

<a id="s-getIpv6AndPlen"></a>
### getIpv6AndPlen()

```java
public com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader getIpv6AndPlen()
```

Types: [Reader](../CsValueIPv6Prefix/Reader.md#s-Reader)

<a id="s-getIpv6prefix"></a>
### getIpv6prefix()

```java
public com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader getIpv6prefix()
```

Types: [Reader](../CsValueIPv6Prefix/Reader.md#s-Reader)

<a id="s-getList"></a>
### getList()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsValue.Reader> getList()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getNoexists"></a>
### getNoexists()

```java
public final org.capnproto.Void getNoexists()
```

<a id="s-getObjectref"></a>
### getObjectref()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsValue.Reader> getObjectref()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getOid"></a>
### getOid()

```java
public final org.capnproto.PrimitiveList.Long.Reader getOid()
```

<a id="s-getPtr"></a>
### getPtr()

```java
public final org.capnproto.Void getPtr()
```

<a id="s-getQname"></a>
### getQname()

```java
public com.tailf.ncs.maapi.Schema.CsValueQName.Reader getQname()
```

Types: [Reader](../CsValueQName/Reader.md#s-Reader)

<a id="s-getShallowType"></a>
### getShallowType()

```java
public final com.tailf.ncs.maapi.Schema.ShallowType getShallowType()
```

Types: [ShallowType](../ShallowType.md#s-ShallowType)

<a id="s-getStr"></a>
### getStr()

```java
public org.capnproto.Text.Reader getStr()
```

<a id="s-getSymbol"></a>
### getSymbol()

```java
public com.tailf.ncs.maapi.Schema.CsValueSymbol.Reader getSymbol()
```

Types: [Reader](../CsValueSymbol/Reader.md#s-Reader)

<a id="s-getTime"></a>
### getTime()

```java
public com.tailf.ncs.maapi.Schema.CsValueTime.Reader getTime()
```

Types: [Reader](../CsValueTime/Reader.md#s-Reader)

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
public com.tailf.ncs.maapi.Schema.CsValue.Reader getUnion()
```

Types: [Reader](Reader.md#s-Reader)

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
public com.tailf.ncs.maapi.Schema.CsValueXmlTag.Reader getXmltag()
```

Types: [Reader](../CsValueXmlTag/Reader.md#s-Reader)

<a id="s-hasBinary"></a>
### hasBinary()

```java
public boolean hasBinary()
```

<a id="s-hasBitbig"></a>
### hasBitbig()

```java
public boolean hasBitbig()
```

<a id="s-hasBuf"></a>
### hasBuf()

```java
public boolean hasBuf()
```

<a id="s-hasDate"></a>
### hasDate()

```java
public boolean hasDate()
```

<a id="s-hasDatetime"></a>
### hasDatetime()

```java
public boolean hasDatetime()
```

<a id="s-hasDecimal64"></a>
### hasDecimal64()

```java
public boolean hasDecimal64()
```

<a id="s-hasDquad"></a>
### hasDquad()

```java
public boolean hasDquad()
```

<a id="s-hasDuration"></a>
### hasDuration()

```java
public boolean hasDuration()
```

<a id="s-hasHexstr"></a>
### hasHexstr()

```java
public boolean hasHexstr()
```

<a id="s-hasIdentityref"></a>
### hasIdentityref()

```java
public boolean hasIdentityref()
```

<a id="s-hasIpv4"></a>
### hasIpv4()

```java
public boolean hasIpv4()
```

<a id="s-hasIpv4AndPlen"></a>
### hasIpv4AndPlen()

```java
public boolean hasIpv4AndPlen()
```

<a id="s-hasIpv4prefix"></a>
### hasIpv4prefix()

```java
public boolean hasIpv4prefix()
```

<a id="s-hasIpv6"></a>
### hasIpv6()

```java
public boolean hasIpv6()
```

<a id="s-hasIpv6AndPlen"></a>
### hasIpv6AndPlen()

```java
public boolean hasIpv6AndPlen()
```

<a id="s-hasIpv6prefix"></a>
### hasIpv6prefix()

```java
public boolean hasIpv6prefix()
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

<a id="s-hasQname"></a>
### hasQname()

```java
public boolean hasQname()
```

<a id="s-hasStr"></a>
### hasStr()

```java
public boolean hasStr()
```

<a id="s-hasSymbol"></a>
### hasSymbol()

```java
public boolean hasSymbol()
```

<a id="s-hasTime"></a>
### hasTime()

```java
public boolean hasTime()
```

<a id="s-hasUnion"></a>
### hasUnion()

```java
public boolean hasUnion()
```

<a id="s-hasXmltag"></a>
### hasXmltag()

```java
public boolean hasXmltag()
```

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

<a id="s-which"></a>
### which()

```java
public com.tailf.ncs.maapi.Schema.CsValue.Which which()
```

Types: [Which](Which.md#s-Which)
