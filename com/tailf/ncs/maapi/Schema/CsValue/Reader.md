# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValue.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getBinary()](#m-getBinary-f332a896a1bb)
- [getBit32()](#m-getBit32-27693f0a3df1)
- [getBit64()](#m-getBit64-51ba19e6036e)
- [getBitbig()](#m-getBitbig-ce729847bcfd)
- [getBool()](#m-getBool-bfc6de52d8c0)
- [getBuf()](#m-getBuf-3beb55b0999e)
- [getCdbBegin()](#m-getCdbBegin-de343abd3d60)
- [getDate()](#m-getDate-835e7d70e8d1)
- [getDatetime()](#m-getDatetime-388189505619)
- [getDecimal64()](#m-getDecimal64-193bb466ba33)
- [getDefault()](#m-getDefault-3b99fa7321e2)
- [getDouble()](#m-getDouble-2f3cdb03174e)
- [getDquad()](#m-getDquad-4a29a8e328e2)
- [getDuration()](#m-getDuration-aee615ea7fe2)
- [getEmpty()](#m-getEmpty-500b00e51161)
- [getEnumValue()](#m-getEnumValue-5222f58810c9)
- [getHexstr()](#m-getHexstr-7bdee4ec31cf)
- [getIdentityref()](#m-getIdentityref-da99f3e4419f)
- [getInt16()](#m-getInt16-5744ecc89efb)
- [getInt32()](#m-getInt32-81084bf6c564)
- [getInt64()](#m-getInt64-12855180ebd0)
- [getInt8()](#m-getInt8-f88ea0bcdca8)
- [getIpv4()](#m-getIpv4-9ce1b70400a4)
- [getIpv4AndPlen()](#m-getIpv4AndPlen-6283b58ee146)
- [getIpv4prefix()](#m-getIpv4prefix-01000113e705)
- [getIpv6()](#m-getIpv6-075bb9cd9153)
- [getIpv6AndPlen()](#m-getIpv6AndPlen-de70a17471a3)
- [getIpv6prefix()](#m-getIpv6prefix-474193492c1a)
- [getList()](#m-getList-bb3f8cbe83be)
- [getNoexists()](#m-getNoexists-f692a7fc16f3)
- [getObjectref()](#m-getObjectref-eb216e093ad4)
- [getOid()](#m-getOid-2faa98066d96)
- [getPtr()](#m-getPtr-9b1702eaedfe)
- [getQname()](#m-getQname-022156d42738)
- [getShallowType()](#m-getShallowType-2e2b5f294983)
- [getStr()](#m-getStr-52d1ecf4d92e)
- [getSymbol()](#m-getSymbol-702f4641963e)
- [getTime()](#m-getTime-1429b351f3a0)
- [getUint16()](#m-getUint16-2c1ad5a64222)
- [getUint32()](#m-getUint32-fa11eb2e5b91)
- [getUint64()](#m-getUint64-f84c3cc8734c)
- [getUint8()](#m-getUint8-35a48ed7f6a6)
- [getUnion()](#m-getUnion-09a450ad6ddb)
- [getUnknown()](#m-getUnknown-70adb8ae54c3)
- [getXmlbegin()](#m-getXmlbegin-d03e242d4096)
- [getXmlbegindel()](#m-getXmlbegindel-920a8ac89e37)
- [getXmlend()](#m-getXmlend-ae3cef179327)
- [getXmlMoveEnd()](#m-getXmlMoveEnd-9e767f8514b2)
- [getXmlMoveFirst()](#m-getXmlMoveFirst-580a69a9f9d8)
- [getXmltag()](#m-getXmltag-15a59d5d02ef)
- [hasBinary()](#m-hasBinary-ca7a9e4bd9ff)
- [hasBitbig()](#m-hasBitbig-ce7c2f407d41)
- [hasBuf()](#m-hasBuf-89f2325600ad)
- [hasDate()](#m-hasDate-0e18e477f8d2)
- [hasDatetime()](#m-hasDatetime-05a705114985)
- [hasDecimal64()](#m-hasDecimal64-85dcdb2b131e)
- [hasDquad()](#m-hasDquad-527d1ccedadf)
- [hasDuration()](#m-hasDuration-ccb038026ecc)
- [hasHexstr()](#m-hasHexstr-dcb9d92bfaa7)
- [hasIdentityref()](#m-hasIdentityref-8b7bd6f11b9c)
- [hasIpv4()](#m-hasIpv4-3133077df861)
- [hasIpv4AndPlen()](#m-hasIpv4AndPlen-b8a422f53d9f)
- [hasIpv4prefix()](#m-hasIpv4prefix-9c8dcd0c712c)
- [hasIpv6()](#m-hasIpv6-9895b8d93f23)
- [hasIpv6AndPlen()](#m-hasIpv6AndPlen-4edf7d0a4bbc)
- [hasIpv6prefix()](#m-hasIpv6prefix-8a2bdd383c32)
- [hasList()](#m-hasList-3712d7ce73ac)
- [hasObjectref()](#m-hasObjectref-a79354acdb9f)
- [hasOid()](#m-hasOid-64b45096c850)
- [hasQname()](#m-hasQname-3146e94ee2c2)
- [hasStr()](#m-hasStr-4da753ffd6f2)
- [hasSymbol()](#m-hasSymbol-19b8459c5d53)
- [hasTime()](#m-hasTime-f12208352daa)
- [hasUnion()](#m-hasUnion-b08deffc4123)
- [hasXmltag()](#m-hasXmltag-1764776a4b41)
- [isBinary()](#m-isBinary-d92620e842a5)
- [isBit32()](#m-isBit32-ae0f1c3885a6)
- [isBit64()](#m-isBit64-2ec3459ff82c)
- [isBitbig()](#m-isBitbig-84cd2f0ebaeb)
- [isBool()](#m-isBool-e771ae3d3e55)
- [isBuf()](#m-isBuf-254af72d81f0)
- [isCdbBegin()](#m-isCdbBegin-aeff9465850d)
- [isDate()](#m-isDate-c423781b293a)
- [isDatetime()](#m-isDatetime-4e79c97b2bd5)
- [isDecimal64()](#m-isDecimal64-fbfc5a5de098)
- [isDefault()](#m-isDefault-9a6b81cd55f6)
- [isDouble()](#m-isDouble-47da85f502c9)
- [isDquad()](#m-isDquad-1986dbac6f44)
- [isDuration()](#m-isDuration-7960407492db)
- [isEmpty()](#m-isEmpty-4dde48126244)
- [isEnumValue()](#m-isEnumValue-b6e22d09884f)
- [isHexstr()](#m-isHexstr-b866520006d5)
- [isIdentityref()](#m-isIdentityref-975db106a225)
- [isInt16()](#m-isInt16-7462eecb083e)
- [isInt32()](#m-isInt32-3341e7603763)
- [isInt64()](#m-isInt64-c54b20486cbe)
- [isInt8()](#m-isInt8-908482a868e0)
- [isIpv4()](#m-isIpv4-f769f8c600b5)
- [isIpv4AndPlen()](#m-isIpv4AndPlen-e1536a127f9e)
- [isIpv4prefix()](#m-isIpv4prefix-7b973eaefa1d)
- [isIpv6()](#m-isIpv6-a32651632b39)
- [isIpv6AndPlen()](#m-isIpv6AndPlen-1963093ce68a)
- [isIpv6prefix()](#m-isIpv6prefix-6dce0b40b9d7)
- [isList()](#m-isList-c36bce63b506)
- [isNoexists()](#m-isNoexists-a1ec13d21a56)
- [isObjectref()](#m-isObjectref-2120317a92dd)
- [isOid()](#m-isOid-368ae9c713d1)
- [isPtr()](#m-isPtr-276f1553635d)
- [isQname()](#m-isQname-79c1cbb01029)
- [isStr()](#m-isStr-81c3840f26d4)
- [isSymbol()](#m-isSymbol-d7206a92c0eb)
- [isTime()](#m-isTime-250a56dbdac5)
- [isUint16()](#m-isUint16-d8c251a40ead)
- [isUint32()](#m-isUint32-fd3a00ffba15)
- [isUint64()](#m-isUint64-ce4ee69a295b)
- [isUint8()](#m-isUint8-9f400b8116f3)
- [isUnion()](#m-isUnion-6183f968c3e8)
- [isUnknown()](#m-isUnknown-88a5b80751a0)
- [isXmlbegin()](#m-isXmlbegin-3a07f5fed3da)
- [isXmlbegindel()](#m-isXmlbegindel-4e1966d82109)
- [isXmlend()](#m-isXmlend-9111f39d186c)
- [isXmlMoveEnd()](#m-isXmlMoveEnd-45ed9b27d7cf)
- [isXmlMoveFirst()](#m-isXmlMoveFirst-7c07b98bd060)
- [isXmltag()](#m-isXmltag-da0707b0ae43)
- [which()](#m-which-0b2d23db5ed0)

## Constructors

### Reader(SegmentReader, int, int, int, short, int) <a href="#m-Reader-cf5e962c3323" id="m-Reader-cf5e962c3323"></a>

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

### getBinary() <a href="#m-getBinary-f332a896a1bb" id="m-getBinary-f332a896a1bb"></a>

```java
public org.capnproto.Data.Reader getBinary()
```

### getBit32() <a href="#m-getBit32-27693f0a3df1" id="m-getBit32-27693f0a3df1"></a>

```java
public final int getBit32()
```

### getBit64() <a href="#m-getBit64-51ba19e6036e" id="m-getBit64-51ba19e6036e"></a>

```java
public final long getBit64()
```

### getBitbig() <a href="#m-getBitbig-ce729847bcfd" id="m-getBitbig-ce729847bcfd"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueBitBig.Reader getBitbig()
```

Types: [Reader](../CsValueBitBig/Reader.md#cls-Reader)

### getBool() <a href="#m-getBool-bfc6de52d8c0" id="m-getBool-bfc6de52d8c0"></a>

```java
public final boolean getBool()
```

### getBuf() <a href="#m-getBuf-3beb55b0999e" id="m-getBuf-3beb55b0999e"></a>

```java
public org.capnproto.Data.Reader getBuf()
```

### getCdbBegin() <a href="#m-getCdbBegin-de343abd3d60" id="m-getCdbBegin-de343abd3d60"></a>

```java
public final org.capnproto.Void getCdbBegin()
```

### getDate() <a href="#m-getDate-835e7d70e8d1" id="m-getDate-835e7d70e8d1"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueDate.Reader getDate()
```

Types: [Reader](../CsValueDate/Reader.md#cls-Reader)

### getDatetime() <a href="#m-getDatetime-388189505619" id="m-getDatetime-388189505619"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueDateTime.Reader getDatetime()
```

Types: [Reader](../CsValueDateTime/Reader.md#cls-Reader)

### getDecimal64() <a href="#m-getDecimal64-193bb466ba33" id="m-getDecimal64-193bb466ba33"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueDecimal64.Reader getDecimal64()
```

Types: [Reader](../CsValueDecimal64/Reader.md#cls-Reader)

### getDefault() <a href="#m-getDefault-3b99fa7321e2" id="m-getDefault-3b99fa7321e2"></a>

```java
public final org.capnproto.Void getDefault()
```

### getDouble() <a href="#m-getDouble-2f3cdb03174e" id="m-getDouble-2f3cdb03174e"></a>

```java
public final double getDouble()
```

### getDquad() <a href="#m-getDquad-4a29a8e328e2" id="m-getDquad-4a29a8e328e2"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueDQuad.Reader getDquad()
```

Types: [Reader](../CsValueDQuad/Reader.md#cls-Reader)

### getDuration() <a href="#m-getDuration-aee615ea7fe2" id="m-getDuration-aee615ea7fe2"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueDuration.Reader getDuration()
```

Types: [Reader](../CsValueDuration/Reader.md#cls-Reader)

### getEmpty() <a href="#m-getEmpty-500b00e51161" id="m-getEmpty-500b00e51161"></a>

```java
public final org.capnproto.Void getEmpty()
```

### getEnumValue() <a href="#m-getEnumValue-5222f58810c9" id="m-getEnumValue-5222f58810c9"></a>

```java
public final int getEnumValue()
```

### getHexstr() <a href="#m-getHexstr-7bdee4ec31cf" id="m-getHexstr-7bdee4ec31cf"></a>

```java
public org.capnproto.Data.Reader getHexstr()
```

### getIdentityref() <a href="#m-getIdentityref-da99f3e4419f" id="m-getIdentityref-da99f3e4419f"></a>

```java
public com.tailf.ncs.maapi.Schema.QTag.Reader getIdentityref()
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

### getInt16() <a href="#m-getInt16-5744ecc89efb" id="m-getInt16-5744ecc89efb"></a>

```java
public final short getInt16()
```

### getInt32() <a href="#m-getInt32-81084bf6c564" id="m-getInt32-81084bf6c564"></a>

```java
public final int getInt32()
```

### getInt64() <a href="#m-getInt64-12855180ebd0" id="m-getInt64-12855180ebd0"></a>

```java
public final long getInt64()
```

### getInt8() <a href="#m-getInt8-f88ea0bcdca8" id="m-getInt8-f88ea0bcdca8"></a>

```java
public final byte getInt8()
```

### getIpv4() <a href="#m-getIpv4-9ce1b70400a4" id="m-getIpv4-9ce1b70400a4"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader getIpv4()
```

Types: [Reader](../CsValueIPv4Prefix/Reader.md#cls-Reader)

### getIpv4AndPlen() <a href="#m-getIpv4AndPlen-6283b58ee146" id="m-getIpv4AndPlen-6283b58ee146"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader getIpv4AndPlen()
```

Types: [Reader](../CsValueIPv4Prefix/Reader.md#cls-Reader)

### getIpv4prefix() <a href="#m-getIpv4prefix-01000113e705" id="m-getIpv4prefix-01000113e705"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader getIpv4prefix()
```

Types: [Reader](../CsValueIPv4Prefix/Reader.md#cls-Reader)

### getIpv6() <a href="#m-getIpv6-075bb9cd9153" id="m-getIpv6-075bb9cd9153"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader getIpv6()
```

Types: [Reader](../CsValueIPv6Prefix/Reader.md#cls-Reader)

### getIpv6AndPlen() <a href="#m-getIpv6AndPlen-de70a17471a3" id="m-getIpv6AndPlen-de70a17471a3"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader getIpv6AndPlen()
```

Types: [Reader](../CsValueIPv6Prefix/Reader.md#cls-Reader)

### getIpv6prefix() <a href="#m-getIpv6prefix-474193492c1a" id="m-getIpv6prefix-474193492c1a"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader getIpv6prefix()
```

Types: [Reader](../CsValueIPv6Prefix/Reader.md#cls-Reader)

### getList() <a href="#m-getList-bb3f8cbe83be" id="m-getList-bb3f8cbe83be"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsValue.Reader> getList()
```

Types: [Reader](Reader.md#cls-Reader)

### getNoexists() <a href="#m-getNoexists-f692a7fc16f3" id="m-getNoexists-f692a7fc16f3"></a>

```java
public final org.capnproto.Void getNoexists()
```

### getObjectref() <a href="#m-getObjectref-eb216e093ad4" id="m-getObjectref-eb216e093ad4"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsValue.Reader> getObjectref()
```

Types: [Reader](Reader.md#cls-Reader)

### getOid() <a href="#m-getOid-2faa98066d96" id="m-getOid-2faa98066d96"></a>

```java
public final org.capnproto.PrimitiveList.Long.Reader getOid()
```

### getPtr() <a href="#m-getPtr-9b1702eaedfe" id="m-getPtr-9b1702eaedfe"></a>

```java
public final org.capnproto.Void getPtr()
```

### getQname() <a href="#m-getQname-022156d42738" id="m-getQname-022156d42738"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueQName.Reader getQname()
```

Types: [Reader](../CsValueQName/Reader.md#cls-Reader)

### getShallowType() <a href="#m-getShallowType-2e2b5f294983" id="m-getShallowType-2e2b5f294983"></a>

```java
public final com.tailf.ncs.maapi.Schema.ShallowType getShallowType()
```

Types: [ShallowType](../ShallowType.md#cls-ShallowType)

### getStr() <a href="#m-getStr-52d1ecf4d92e" id="m-getStr-52d1ecf4d92e"></a>

```java
public org.capnproto.Text.Reader getStr()
```

### getSymbol() <a href="#m-getSymbol-702f4641963e" id="m-getSymbol-702f4641963e"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueSymbol.Reader getSymbol()
```

Types: [Reader](../CsValueSymbol/Reader.md#cls-Reader)

### getTime() <a href="#m-getTime-1429b351f3a0" id="m-getTime-1429b351f3a0"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueTime.Reader getTime()
```

Types: [Reader](../CsValueTime/Reader.md#cls-Reader)

### getUint16() <a href="#m-getUint16-2c1ad5a64222" id="m-getUint16-2c1ad5a64222"></a>

```java
public final short getUint16()
```

### getUint32() <a href="#m-getUint32-fa11eb2e5b91" id="m-getUint32-fa11eb2e5b91"></a>

```java
public final int getUint32()
```

### getUint64() <a href="#m-getUint64-f84c3cc8734c" id="m-getUint64-f84c3cc8734c"></a>

```java
public final long getUint64()
```

### getUint8() <a href="#m-getUint8-35a48ed7f6a6" id="m-getUint8-35a48ed7f6a6"></a>

```java
public final byte getUint8()
```

### getUnion() <a href="#m-getUnion-09a450ad6ddb" id="m-getUnion-09a450ad6ddb"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValue.Reader getUnion()
```

Types: [Reader](Reader.md#cls-Reader)

### getUnknown() <a href="#m-getUnknown-70adb8ae54c3" id="m-getUnknown-70adb8ae54c3"></a>

```java
public final org.capnproto.Void getUnknown()
```

### getXmlbegin() <a href="#m-getXmlbegin-d03e242d4096" id="m-getXmlbegin-d03e242d4096"></a>

```java
public final org.capnproto.Void getXmlbegin()
```

### getXmlbegindel() <a href="#m-getXmlbegindel-920a8ac89e37" id="m-getXmlbegindel-920a8ac89e37"></a>

```java
public final org.capnproto.Void getXmlbegindel()
```

### getXmlend() <a href="#m-getXmlend-ae3cef179327" id="m-getXmlend-ae3cef179327"></a>

```java
public final org.capnproto.Void getXmlend()
```

### getXmlMoveEnd() <a href="#m-getXmlMoveEnd-9e767f8514b2" id="m-getXmlMoveEnd-9e767f8514b2"></a>

```java
public final org.capnproto.Void getXmlMoveEnd()
```

### getXmlMoveFirst() <a href="#m-getXmlMoveFirst-580a69a9f9d8" id="m-getXmlMoveFirst-580a69a9f9d8"></a>

```java
public final org.capnproto.Void getXmlMoveFirst()
```

### getXmltag() <a href="#m-getXmltag-15a59d5d02ef" id="m-getXmltag-15a59d5d02ef"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueXmlTag.Reader getXmltag()
```

Types: [Reader](../CsValueXmlTag/Reader.md#cls-Reader)

### hasBinary() <a href="#m-hasBinary-ca7a9e4bd9ff" id="m-hasBinary-ca7a9e4bd9ff"></a>

```java
public boolean hasBinary()
```

### hasBitbig() <a href="#m-hasBitbig-ce7c2f407d41" id="m-hasBitbig-ce7c2f407d41"></a>

```java
public boolean hasBitbig()
```

### hasBuf() <a href="#m-hasBuf-89f2325600ad" id="m-hasBuf-89f2325600ad"></a>

```java
public boolean hasBuf()
```

### hasDate() <a href="#m-hasDate-0e18e477f8d2" id="m-hasDate-0e18e477f8d2"></a>

```java
public boolean hasDate()
```

### hasDatetime() <a href="#m-hasDatetime-05a705114985" id="m-hasDatetime-05a705114985"></a>

```java
public boolean hasDatetime()
```

### hasDecimal64() <a href="#m-hasDecimal64-85dcdb2b131e" id="m-hasDecimal64-85dcdb2b131e"></a>

```java
public boolean hasDecimal64()
```

### hasDquad() <a href="#m-hasDquad-527d1ccedadf" id="m-hasDquad-527d1ccedadf"></a>

```java
public boolean hasDquad()
```

### hasDuration() <a href="#m-hasDuration-ccb038026ecc" id="m-hasDuration-ccb038026ecc"></a>

```java
public boolean hasDuration()
```

### hasHexstr() <a href="#m-hasHexstr-dcb9d92bfaa7" id="m-hasHexstr-dcb9d92bfaa7"></a>

```java
public boolean hasHexstr()
```

### hasIdentityref() <a href="#m-hasIdentityref-8b7bd6f11b9c" id="m-hasIdentityref-8b7bd6f11b9c"></a>

```java
public boolean hasIdentityref()
```

### hasIpv4() <a href="#m-hasIpv4-3133077df861" id="m-hasIpv4-3133077df861"></a>

```java
public boolean hasIpv4()
```

### hasIpv4AndPlen() <a href="#m-hasIpv4AndPlen-b8a422f53d9f" id="m-hasIpv4AndPlen-b8a422f53d9f"></a>

```java
public boolean hasIpv4AndPlen()
```

### hasIpv4prefix() <a href="#m-hasIpv4prefix-9c8dcd0c712c" id="m-hasIpv4prefix-9c8dcd0c712c"></a>

```java
public boolean hasIpv4prefix()
```

### hasIpv6() <a href="#m-hasIpv6-9895b8d93f23" id="m-hasIpv6-9895b8d93f23"></a>

```java
public boolean hasIpv6()
```

### hasIpv6AndPlen() <a href="#m-hasIpv6AndPlen-4edf7d0a4bbc" id="m-hasIpv6AndPlen-4edf7d0a4bbc"></a>

```java
public boolean hasIpv6AndPlen()
```

### hasIpv6prefix() <a href="#m-hasIpv6prefix-8a2bdd383c32" id="m-hasIpv6prefix-8a2bdd383c32"></a>

```java
public boolean hasIpv6prefix()
```

### hasList() <a href="#m-hasList-3712d7ce73ac" id="m-hasList-3712d7ce73ac"></a>

```java
public final boolean hasList()
```

### hasObjectref() <a href="#m-hasObjectref-a79354acdb9f" id="m-hasObjectref-a79354acdb9f"></a>

```java
public final boolean hasObjectref()
```

### hasOid() <a href="#m-hasOid-64b45096c850" id="m-hasOid-64b45096c850"></a>

```java
public final boolean hasOid()
```

### hasQname() <a href="#m-hasQname-3146e94ee2c2" id="m-hasQname-3146e94ee2c2"></a>

```java
public boolean hasQname()
```

### hasStr() <a href="#m-hasStr-4da753ffd6f2" id="m-hasStr-4da753ffd6f2"></a>

```java
public boolean hasStr()
```

### hasSymbol() <a href="#m-hasSymbol-19b8459c5d53" id="m-hasSymbol-19b8459c5d53"></a>

```java
public boolean hasSymbol()
```

### hasTime() <a href="#m-hasTime-f12208352daa" id="m-hasTime-f12208352daa"></a>

```java
public boolean hasTime()
```

### hasUnion() <a href="#m-hasUnion-b08deffc4123" id="m-hasUnion-b08deffc4123"></a>

```java
public boolean hasUnion()
```

### hasXmltag() <a href="#m-hasXmltag-1764776a4b41" id="m-hasXmltag-1764776a4b41"></a>

```java
public boolean hasXmltag()
```

### isBinary() <a href="#m-isBinary-d92620e842a5" id="m-isBinary-d92620e842a5"></a>

```java
public final boolean isBinary()
```

### isBit32() <a href="#m-isBit32-ae0f1c3885a6" id="m-isBit32-ae0f1c3885a6"></a>

```java
public final boolean isBit32()
```

### isBit64() <a href="#m-isBit64-2ec3459ff82c" id="m-isBit64-2ec3459ff82c"></a>

```java
public final boolean isBit64()
```

### isBitbig() <a href="#m-isBitbig-84cd2f0ebaeb" id="m-isBitbig-84cd2f0ebaeb"></a>

```java
public final boolean isBitbig()
```

### isBool() <a href="#m-isBool-e771ae3d3e55" id="m-isBool-e771ae3d3e55"></a>

```java
public final boolean isBool()
```

### isBuf() <a href="#m-isBuf-254af72d81f0" id="m-isBuf-254af72d81f0"></a>

```java
public final boolean isBuf()
```

### isCdbBegin() <a href="#m-isCdbBegin-aeff9465850d" id="m-isCdbBegin-aeff9465850d"></a>

```java
public final boolean isCdbBegin()
```

### isDate() <a href="#m-isDate-c423781b293a" id="m-isDate-c423781b293a"></a>

```java
public final boolean isDate()
```

### isDatetime() <a href="#m-isDatetime-4e79c97b2bd5" id="m-isDatetime-4e79c97b2bd5"></a>

```java
public final boolean isDatetime()
```

### isDecimal64() <a href="#m-isDecimal64-fbfc5a5de098" id="m-isDecimal64-fbfc5a5de098"></a>

```java
public final boolean isDecimal64()
```

### isDefault() <a href="#m-isDefault-9a6b81cd55f6" id="m-isDefault-9a6b81cd55f6"></a>

```java
public final boolean isDefault()
```

### isDouble() <a href="#m-isDouble-47da85f502c9" id="m-isDouble-47da85f502c9"></a>

```java
public final boolean isDouble()
```

### isDquad() <a href="#m-isDquad-1986dbac6f44" id="m-isDquad-1986dbac6f44"></a>

```java
public final boolean isDquad()
```

### isDuration() <a href="#m-isDuration-7960407492db" id="m-isDuration-7960407492db"></a>

```java
public final boolean isDuration()
```

### isEmpty() <a href="#m-isEmpty-4dde48126244" id="m-isEmpty-4dde48126244"></a>

```java
public final boolean isEmpty()
```

### isEnumValue() <a href="#m-isEnumValue-b6e22d09884f" id="m-isEnumValue-b6e22d09884f"></a>

```java
public final boolean isEnumValue()
```

### isHexstr() <a href="#m-isHexstr-b866520006d5" id="m-isHexstr-b866520006d5"></a>

```java
public final boolean isHexstr()
```

### isIdentityref() <a href="#m-isIdentityref-975db106a225" id="m-isIdentityref-975db106a225"></a>

```java
public final boolean isIdentityref()
```

### isInt16() <a href="#m-isInt16-7462eecb083e" id="m-isInt16-7462eecb083e"></a>

```java
public final boolean isInt16()
```

### isInt32() <a href="#m-isInt32-3341e7603763" id="m-isInt32-3341e7603763"></a>

```java
public final boolean isInt32()
```

### isInt64() <a href="#m-isInt64-c54b20486cbe" id="m-isInt64-c54b20486cbe"></a>

```java
public final boolean isInt64()
```

### isInt8() <a href="#m-isInt8-908482a868e0" id="m-isInt8-908482a868e0"></a>

```java
public final boolean isInt8()
```

### isIpv4() <a href="#m-isIpv4-f769f8c600b5" id="m-isIpv4-f769f8c600b5"></a>

```java
public final boolean isIpv4()
```

### isIpv4AndPlen() <a href="#m-isIpv4AndPlen-e1536a127f9e" id="m-isIpv4AndPlen-e1536a127f9e"></a>

```java
public final boolean isIpv4AndPlen()
```

### isIpv4prefix() <a href="#m-isIpv4prefix-7b973eaefa1d" id="m-isIpv4prefix-7b973eaefa1d"></a>

```java
public final boolean isIpv4prefix()
```

### isIpv6() <a href="#m-isIpv6-a32651632b39" id="m-isIpv6-a32651632b39"></a>

```java
public final boolean isIpv6()
```

### isIpv6AndPlen() <a href="#m-isIpv6AndPlen-1963093ce68a" id="m-isIpv6AndPlen-1963093ce68a"></a>

```java
public final boolean isIpv6AndPlen()
```

### isIpv6prefix() <a href="#m-isIpv6prefix-6dce0b40b9d7" id="m-isIpv6prefix-6dce0b40b9d7"></a>

```java
public final boolean isIpv6prefix()
```

### isList() <a href="#m-isList-c36bce63b506" id="m-isList-c36bce63b506"></a>

```java
public final boolean isList()
```

### isNoexists() <a href="#m-isNoexists-a1ec13d21a56" id="m-isNoexists-a1ec13d21a56"></a>

```java
public final boolean isNoexists()
```

### isObjectref() <a href="#m-isObjectref-2120317a92dd" id="m-isObjectref-2120317a92dd"></a>

```java
public final boolean isObjectref()
```

### isOid() <a href="#m-isOid-368ae9c713d1" id="m-isOid-368ae9c713d1"></a>

```java
public final boolean isOid()
```

### isPtr() <a href="#m-isPtr-276f1553635d" id="m-isPtr-276f1553635d"></a>

```java
public final boolean isPtr()
```

### isQname() <a href="#m-isQname-79c1cbb01029" id="m-isQname-79c1cbb01029"></a>

```java
public final boolean isQname()
```

### isStr() <a href="#m-isStr-81c3840f26d4" id="m-isStr-81c3840f26d4"></a>

```java
public final boolean isStr()
```

### isSymbol() <a href="#m-isSymbol-d7206a92c0eb" id="m-isSymbol-d7206a92c0eb"></a>

```java
public final boolean isSymbol()
```

### isTime() <a href="#m-isTime-250a56dbdac5" id="m-isTime-250a56dbdac5"></a>

```java
public final boolean isTime()
```

### isUint16() <a href="#m-isUint16-d8c251a40ead" id="m-isUint16-d8c251a40ead"></a>

```java
public final boolean isUint16()
```

### isUint32() <a href="#m-isUint32-fd3a00ffba15" id="m-isUint32-fd3a00ffba15"></a>

```java
public final boolean isUint32()
```

### isUint64() <a href="#m-isUint64-ce4ee69a295b" id="m-isUint64-ce4ee69a295b"></a>

```java
public final boolean isUint64()
```

### isUint8() <a href="#m-isUint8-9f400b8116f3" id="m-isUint8-9f400b8116f3"></a>

```java
public final boolean isUint8()
```

### isUnion() <a href="#m-isUnion-6183f968c3e8" id="m-isUnion-6183f968c3e8"></a>

```java
public final boolean isUnion()
```

### isUnknown() <a href="#m-isUnknown-88a5b80751a0" id="m-isUnknown-88a5b80751a0"></a>

```java
public final boolean isUnknown()
```

### isXmlbegin() <a href="#m-isXmlbegin-3a07f5fed3da" id="m-isXmlbegin-3a07f5fed3da"></a>

```java
public final boolean isXmlbegin()
```

### isXmlbegindel() <a href="#m-isXmlbegindel-4e1966d82109" id="m-isXmlbegindel-4e1966d82109"></a>

```java
public final boolean isXmlbegindel()
```

### isXmlend() <a href="#m-isXmlend-9111f39d186c" id="m-isXmlend-9111f39d186c"></a>

```java
public final boolean isXmlend()
```

### isXmlMoveEnd() <a href="#m-isXmlMoveEnd-45ed9b27d7cf" id="m-isXmlMoveEnd-45ed9b27d7cf"></a>

```java
public final boolean isXmlMoveEnd()
```

### isXmlMoveFirst() <a href="#m-isXmlMoveFirst-7c07b98bd060" id="m-isXmlMoveFirst-7c07b98bd060"></a>

```java
public final boolean isXmlMoveFirst()
```

### isXmltag() <a href="#m-isXmltag-da0707b0ae43" id="m-isXmltag-da0707b0ae43"></a>

```java
public final boolean isXmltag()
```

### which() <a href="#m-which-0b2d23db5ed0" id="m-which-0b2d23db5ed0"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValue.Which which()
```

Types: [Which](Which.md#cls-Which)
