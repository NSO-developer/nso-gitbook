<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsValue.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getBinary()](#m-getbinary-f332a896a1bb)
- [getBit32()](#m-getbit32-27693f0a3df1)
- [getBit64()](#m-getbit64-51ba19e6036e)
- [getBitbig()](#m-getbitbig-ce729847bcfd)
- [getBool()](#m-getbool-bfc6de52d8c0)
- [getBuf()](#m-getbuf-3beb55b0999e)
- [getCdbBegin()](#m-getcdbbegin-de343abd3d60)
- [getDate()](#m-getdate-835e7d70e8d1)
- [getDatetime()](#m-getdatetime-388189505619)
- [getDecimal64()](#m-getdecimal64-193bb466ba33)
- [getDefault()](#m-getdefault-3b99fa7321e2)
- [getDouble()](#m-getdouble-2f3cdb03174e)
- [getDquad()](#m-getdquad-4a29a8e328e2)
- [getDuration()](#m-getduration-aee615ea7fe2)
- [getEmpty()](#m-getempty-500b00e51161)
- [getEnumValue()](#m-getenumvalue-5222f58810c9)
- [getHexstr()](#m-gethexstr-7bdee4ec31cf)
- [getIdentityref()](#m-getidentityref-da99f3e4419f)
- [getInt16()](#m-getint16-5744ecc89efb)
- [getInt32()](#m-getint32-81084bf6c564)
- [getInt64()](#m-getint64-12855180ebd0)
- [getInt8()](#m-getint8-f88ea0bcdca8)
- [getIpv4()](#m-getipv4-9ce1b70400a4)
- [getIpv4AndPlen()](#m-getipv4andplen-6283b58ee146)
- [getIpv4prefix()](#m-getipv4prefix-01000113e705)
- [getIpv6()](#m-getipv6-075bb9cd9153)
- [getIpv6AndPlen()](#m-getipv6andplen-de70a17471a3)
- [getIpv6prefix()](#m-getipv6prefix-474193492c1a)
- [getList()](#m-getlist-bb3f8cbe83be)
- [getNoexists()](#m-getnoexists-f692a7fc16f3)
- [getObjectref()](#m-getobjectref-eb216e093ad4)
- [getOid()](#m-getoid-2faa98066d96)
- [getPtr()](#m-getptr-9b1702eaedfe)
- [getQname()](#m-getqname-022156d42738)
- [getShallowType()](#m-getshallowtype-2e2b5f294983)
- [getStr()](#m-getstr-52d1ecf4d92e)
- [getSymbol()](#m-getsymbol-702f4641963e)
- [getTime()](#m-gettime-1429b351f3a0)
- [getUint16()](#m-getuint16-2c1ad5a64222)
- [getUint32()](#m-getuint32-fa11eb2e5b91)
- [getUint64()](#m-getuint64-f84c3cc8734c)
- [getUint8()](#m-getuint8-35a48ed7f6a6)
- [getUnion()](#m-getunion-09a450ad6ddb)
- [getUnknown()](#m-getunknown-70adb8ae54c3)
- [getXmlbegin()](#m-getxmlbegin-d03e242d4096)
- [getXmlbegindel()](#m-getxmlbegindel-920a8ac89e37)
- [getXmlend()](#m-getxmlend-ae3cef179327)
- [getXmlMoveEnd()](#m-getxmlmoveend-9e767f8514b2)
- [getXmlMoveFirst()](#m-getxmlmovefirst-580a69a9f9d8)
- [getXmltag()](#m-getxmltag-15a59d5d02ef)
- [hasBinary()](#m-hasbinary-ca7a9e4bd9ff)
- [hasBitbig()](#m-hasbitbig-ce7c2f407d41)
- [hasBuf()](#m-hasbuf-89f2325600ad)
- [hasDate()](#m-hasdate-0e18e477f8d2)
- [hasDatetime()](#m-hasdatetime-05a705114985)
- [hasDecimal64()](#m-hasdecimal64-85dcdb2b131e)
- [hasDquad()](#m-hasdquad-527d1ccedadf)
- [hasDuration()](#m-hasduration-ccb038026ecc)
- [hasHexstr()](#m-hashexstr-dcb9d92bfaa7)
- [hasIdentityref()](#m-hasidentityref-8b7bd6f11b9c)
- [hasIpv4()](#m-hasipv4-3133077df861)
- [hasIpv4AndPlen()](#m-hasipv4andplen-b8a422f53d9f)
- [hasIpv4prefix()](#m-hasipv4prefix-9c8dcd0c712c)
- [hasIpv6()](#m-hasipv6-9895b8d93f23)
- [hasIpv6AndPlen()](#m-hasipv6andplen-4edf7d0a4bbc)
- [hasIpv6prefix()](#m-hasipv6prefix-8a2bdd383c32)
- [hasList()](#m-haslist-3712d7ce73ac)
- [hasObjectref()](#m-hasobjectref-a79354acdb9f)
- [hasOid()](#m-hasoid-64b45096c850)
- [hasQname()](#m-hasqname-3146e94ee2c2)
- [hasStr()](#m-hasstr-4da753ffd6f2)
- [hasSymbol()](#m-hassymbol-19b8459c5d53)
- [hasTime()](#m-hastime-f12208352daa)
- [hasUnion()](#m-hasunion-b08deffc4123)
- [hasXmltag()](#m-hasxmltag-1764776a4b41)
- [isBinary()](#m-isbinary-d92620e842a5)
- [isBit32()](#m-isbit32-ae0f1c3885a6)
- [isBit64()](#m-isbit64-2ec3459ff82c)
- [isBitbig()](#m-isbitbig-84cd2f0ebaeb)
- [isBool()](#m-isbool-e771ae3d3e55)
- [isBuf()](#m-isbuf-254af72d81f0)
- [isCdbBegin()](#m-iscdbbegin-aeff9465850d)
- [isDate()](#m-isdate-c423781b293a)
- [isDatetime()](#m-isdatetime-4e79c97b2bd5)
- [isDecimal64()](#m-isdecimal64-fbfc5a5de098)
- [isDefault()](#m-isdefault-9a6b81cd55f6)
- [isDouble()](#m-isdouble-47da85f502c9)
- [isDquad()](#m-isdquad-1986dbac6f44)
- [isDuration()](#m-isduration-7960407492db)
- [isEmpty()](#m-isempty-4dde48126244)
- [isEnumValue()](#m-isenumvalue-b6e22d09884f)
- [isHexstr()](#m-ishexstr-b866520006d5)
- [isIdentityref()](#m-isidentityref-975db106a225)
- [isInt16()](#m-isint16-7462eecb083e)
- [isInt32()](#m-isint32-3341e7603763)
- [isInt64()](#m-isint64-c54b20486cbe)
- [isInt8()](#m-isint8-908482a868e0)
- [isIpv4()](#m-isipv4-f769f8c600b5)
- [isIpv4AndPlen()](#m-isipv4andplen-e1536a127f9e)
- [isIpv4prefix()](#m-isipv4prefix-7b973eaefa1d)
- [isIpv6()](#m-isipv6-a32651632b39)
- [isIpv6AndPlen()](#m-isipv6andplen-1963093ce68a)
- [isIpv6prefix()](#m-isipv6prefix-6dce0b40b9d7)
- [isList()](#m-islist-c36bce63b506)
- [isNoexists()](#m-isnoexists-a1ec13d21a56)
- [isObjectref()](#m-isobjectref-2120317a92dd)
- [isOid()](#m-isoid-368ae9c713d1)
- [isPtr()](#m-isptr-276f1553635d)
- [isQname()](#m-isqname-79c1cbb01029)
- [isStr()](#m-isstr-81c3840f26d4)
- [isSymbol()](#m-issymbol-d7206a92c0eb)
- [isTime()](#m-istime-250a56dbdac5)
- [isUint16()](#m-isuint16-d8c251a40ead)
- [isUint32()](#m-isuint32-fd3a00ffba15)
- [isUint64()](#m-isuint64-ce4ee69a295b)
- [isUint8()](#m-isuint8-9f400b8116f3)
- [isUnion()](#m-isunion-6183f968c3e8)
- [isUnknown()](#m-isunknown-88a5b80751a0)
- [isXmlbegin()](#m-isxmlbegin-3a07f5fed3da)
- [isXmlbegindel()](#m-isxmlbegindel-4e1966d82109)
- [isXmlend()](#m-isxmlend-9111f39d186c)
- [isXmlMoveEnd()](#m-isxmlmoveend-45ed9b27d7cf)
- [isXmlMoveFirst()](#m-isxmlmovefirst-7c07b98bd060)
- [isXmltag()](#m-isxmltag-da0707b0ae43)
- [which()](#m-which-0b2d23db5ed0)

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

<a id="m-getbinary-f332a896a1bb"></a>
### getBinary()

```java
public org.capnproto.Data.Reader getBinary()
```

<a id="m-getbit32-27693f0a3df1"></a>
### getBit32()

```java
public final int getBit32()
```

<a id="m-getbit64-51ba19e6036e"></a>
### getBit64()

```java
public final long getBit64()
```

<a id="m-getbitbig-ce729847bcfd"></a>
### getBitbig()

```java
public com.tailf.ncs.maapi.Schema.CsValueBitBig.Reader getBitbig()
```

Types: [Reader](../CsValueBitBig/Reader.md#cls-Reader)

<a id="m-getbool-bfc6de52d8c0"></a>
### getBool()

```java
public final boolean getBool()
```

<a id="m-getbuf-3beb55b0999e"></a>
### getBuf()

```java
public org.capnproto.Data.Reader getBuf()
```

<a id="m-getcdbbegin-de343abd3d60"></a>
### getCdbBegin()

```java
public final org.capnproto.Void getCdbBegin()
```

<a id="m-getdate-835e7d70e8d1"></a>
### getDate()

```java
public com.tailf.ncs.maapi.Schema.CsValueDate.Reader getDate()
```

Types: [Reader](../CsValueDate/Reader.md#cls-Reader)

<a id="m-getdatetime-388189505619"></a>
### getDatetime()

```java
public com.tailf.ncs.maapi.Schema.CsValueDateTime.Reader getDatetime()
```

Types: [Reader](../CsValueDateTime/Reader.md#cls-Reader)

<a id="m-getdecimal64-193bb466ba33"></a>
### getDecimal64()

```java
public com.tailf.ncs.maapi.Schema.CsValueDecimal64.Reader getDecimal64()
```

Types: [Reader](../CsValueDecimal64/Reader.md#cls-Reader)

<a id="m-getdefault-3b99fa7321e2"></a>
### getDefault()

```java
public final org.capnproto.Void getDefault()
```

<a id="m-getdouble-2f3cdb03174e"></a>
### getDouble()

```java
public final double getDouble()
```

<a id="m-getdquad-4a29a8e328e2"></a>
### getDquad()

```java
public com.tailf.ncs.maapi.Schema.CsValueDQuad.Reader getDquad()
```

Types: [Reader](../CsValueDQuad/Reader.md#cls-Reader)

<a id="m-getduration-aee615ea7fe2"></a>
### getDuration()

```java
public com.tailf.ncs.maapi.Schema.CsValueDuration.Reader getDuration()
```

Types: [Reader](../CsValueDuration/Reader.md#cls-Reader)

<a id="m-getempty-500b00e51161"></a>
### getEmpty()

```java
public final org.capnproto.Void getEmpty()
```

<a id="m-getenumvalue-5222f58810c9"></a>
### getEnumValue()

```java
public final int getEnumValue()
```

<a id="m-gethexstr-7bdee4ec31cf"></a>
### getHexstr()

```java
public org.capnproto.Data.Reader getHexstr()
```

<a id="m-getidentityref-da99f3e4419f"></a>
### getIdentityref()

```java
public com.tailf.ncs.maapi.Schema.QTag.Reader getIdentityref()
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

<a id="m-getint16-5744ecc89efb"></a>
### getInt16()

```java
public final short getInt16()
```

<a id="m-getint32-81084bf6c564"></a>
### getInt32()

```java
public final int getInt32()
```

<a id="m-getint64-12855180ebd0"></a>
### getInt64()

```java
public final long getInt64()
```

<a id="m-getint8-f88ea0bcdca8"></a>
### getInt8()

```java
public final byte getInt8()
```

<a id="m-getipv4-9ce1b70400a4"></a>
### getIpv4()

```java
public com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader getIpv4()
```

Types: [Reader](../CsValueIPv4Prefix/Reader.md#cls-Reader)

<a id="m-getipv4andplen-6283b58ee146"></a>
### getIpv4AndPlen()

```java
public com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader getIpv4AndPlen()
```

Types: [Reader](../CsValueIPv4Prefix/Reader.md#cls-Reader)

<a id="m-getipv4prefix-01000113e705"></a>
### getIpv4prefix()

```java
public com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader getIpv4prefix()
```

Types: [Reader](../CsValueIPv4Prefix/Reader.md#cls-Reader)

<a id="m-getipv6-075bb9cd9153"></a>
### getIpv6()

```java
public com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader getIpv6()
```

Types: [Reader](../CsValueIPv6Prefix/Reader.md#cls-Reader)

<a id="m-getipv6andplen-de70a17471a3"></a>
### getIpv6AndPlen()

```java
public com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader getIpv6AndPlen()
```

Types: [Reader](../CsValueIPv6Prefix/Reader.md#cls-Reader)

<a id="m-getipv6prefix-474193492c1a"></a>
### getIpv6prefix()

```java
public com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader getIpv6prefix()
```

Types: [Reader](../CsValueIPv6Prefix/Reader.md#cls-Reader)

<a id="m-getlist-bb3f8cbe83be"></a>
### getList()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsValue.Reader> getList()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getnoexists-f692a7fc16f3"></a>
### getNoexists()

```java
public final org.capnproto.Void getNoexists()
```

<a id="m-getobjectref-eb216e093ad4"></a>
### getObjectref()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsValue.Reader> getObjectref()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getoid-2faa98066d96"></a>
### getOid()

```java
public final org.capnproto.PrimitiveList.Long.Reader getOid()
```

<a id="m-getptr-9b1702eaedfe"></a>
### getPtr()

```java
public final org.capnproto.Void getPtr()
```

<a id="m-getqname-022156d42738"></a>
### getQname()

```java
public com.tailf.ncs.maapi.Schema.CsValueQName.Reader getQname()
```

Types: [Reader](../CsValueQName/Reader.md#cls-Reader)

<a id="m-getshallowtype-2e2b5f294983"></a>
### getShallowType()

```java
public final com.tailf.ncs.maapi.Schema.ShallowType getShallowType()
```

Types: [ShallowType](../ShallowType.md#cls-ShallowType)

<a id="m-getstr-52d1ecf4d92e"></a>
### getStr()

```java
public org.capnproto.Text.Reader getStr()
```

<a id="m-getsymbol-702f4641963e"></a>
### getSymbol()

```java
public com.tailf.ncs.maapi.Schema.CsValueSymbol.Reader getSymbol()
```

Types: [Reader](../CsValueSymbol/Reader.md#cls-Reader)

<a id="m-gettime-1429b351f3a0"></a>
### getTime()

```java
public com.tailf.ncs.maapi.Schema.CsValueTime.Reader getTime()
```

Types: [Reader](../CsValueTime/Reader.md#cls-Reader)

<a id="m-getuint16-2c1ad5a64222"></a>
### getUint16()

```java
public final short getUint16()
```

<a id="m-getuint32-fa11eb2e5b91"></a>
### getUint32()

```java
public final int getUint32()
```

<a id="m-getuint64-f84c3cc8734c"></a>
### getUint64()

```java
public final long getUint64()
```

<a id="m-getuint8-35a48ed7f6a6"></a>
### getUint8()

```java
public final byte getUint8()
```

<a id="m-getunion-09a450ad6ddb"></a>
### getUnion()

```java
public com.tailf.ncs.maapi.Schema.CsValue.Reader getUnion()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getunknown-70adb8ae54c3"></a>
### getUnknown()

```java
public final org.capnproto.Void getUnknown()
```

<a id="m-getxmlbegin-d03e242d4096"></a>
### getXmlbegin()

```java
public final org.capnproto.Void getXmlbegin()
```

<a id="m-getxmlbegindel-920a8ac89e37"></a>
### getXmlbegindel()

```java
public final org.capnproto.Void getXmlbegindel()
```

<a id="m-getxmlend-ae3cef179327"></a>
### getXmlend()

```java
public final org.capnproto.Void getXmlend()
```

<a id="m-getxmlmoveend-9e767f8514b2"></a>
### getXmlMoveEnd()

```java
public final org.capnproto.Void getXmlMoveEnd()
```

<a id="m-getxmlmovefirst-580a69a9f9d8"></a>
### getXmlMoveFirst()

```java
public final org.capnproto.Void getXmlMoveFirst()
```

<a id="m-getxmltag-15a59d5d02ef"></a>
### getXmltag()

```java
public com.tailf.ncs.maapi.Schema.CsValueXmlTag.Reader getXmltag()
```

Types: [Reader](../CsValueXmlTag/Reader.md#cls-Reader)

<a id="m-hasbinary-ca7a9e4bd9ff"></a>
### hasBinary()

```java
public boolean hasBinary()
```

<a id="m-hasbitbig-ce7c2f407d41"></a>
### hasBitbig()

```java
public boolean hasBitbig()
```

<a id="m-hasbuf-89f2325600ad"></a>
### hasBuf()

```java
public boolean hasBuf()
```

<a id="m-hasdate-0e18e477f8d2"></a>
### hasDate()

```java
public boolean hasDate()
```

<a id="m-hasdatetime-05a705114985"></a>
### hasDatetime()

```java
public boolean hasDatetime()
```

<a id="m-hasdecimal64-85dcdb2b131e"></a>
### hasDecimal64()

```java
public boolean hasDecimal64()
```

<a id="m-hasdquad-527d1ccedadf"></a>
### hasDquad()

```java
public boolean hasDquad()
```

<a id="m-hasduration-ccb038026ecc"></a>
### hasDuration()

```java
public boolean hasDuration()
```

<a id="m-hashexstr-dcb9d92bfaa7"></a>
### hasHexstr()

```java
public boolean hasHexstr()
```

<a id="m-hasidentityref-8b7bd6f11b9c"></a>
### hasIdentityref()

```java
public boolean hasIdentityref()
```

<a id="m-hasipv4-3133077df861"></a>
### hasIpv4()

```java
public boolean hasIpv4()
```

<a id="m-hasipv4andplen-b8a422f53d9f"></a>
### hasIpv4AndPlen()

```java
public boolean hasIpv4AndPlen()
```

<a id="m-hasipv4prefix-9c8dcd0c712c"></a>
### hasIpv4prefix()

```java
public boolean hasIpv4prefix()
```

<a id="m-hasipv6-9895b8d93f23"></a>
### hasIpv6()

```java
public boolean hasIpv6()
```

<a id="m-hasipv6andplen-4edf7d0a4bbc"></a>
### hasIpv6AndPlen()

```java
public boolean hasIpv6AndPlen()
```

<a id="m-hasipv6prefix-8a2bdd383c32"></a>
### hasIpv6prefix()

```java
public boolean hasIpv6prefix()
```

<a id="m-haslist-3712d7ce73ac"></a>
### hasList()

```java
public final boolean hasList()
```

<a id="m-hasobjectref-a79354acdb9f"></a>
### hasObjectref()

```java
public final boolean hasObjectref()
```

<a id="m-hasoid-64b45096c850"></a>
### hasOid()

```java
public final boolean hasOid()
```

<a id="m-hasqname-3146e94ee2c2"></a>
### hasQname()

```java
public boolean hasQname()
```

<a id="m-hasstr-4da753ffd6f2"></a>
### hasStr()

```java
public boolean hasStr()
```

<a id="m-hassymbol-19b8459c5d53"></a>
### hasSymbol()

```java
public boolean hasSymbol()
```

<a id="m-hastime-f12208352daa"></a>
### hasTime()

```java
public boolean hasTime()
```

<a id="m-hasunion-b08deffc4123"></a>
### hasUnion()

```java
public boolean hasUnion()
```

<a id="m-hasxmltag-1764776a4b41"></a>
### hasXmltag()

```java
public boolean hasXmltag()
```

<a id="m-isbinary-d92620e842a5"></a>
### isBinary()

```java
public final boolean isBinary()
```

<a id="m-isbit32-ae0f1c3885a6"></a>
### isBit32()

```java
public final boolean isBit32()
```

<a id="m-isbit64-2ec3459ff82c"></a>
### isBit64()

```java
public final boolean isBit64()
```

<a id="m-isbitbig-84cd2f0ebaeb"></a>
### isBitbig()

```java
public final boolean isBitbig()
```

<a id="m-isbool-e771ae3d3e55"></a>
### isBool()

```java
public final boolean isBool()
```

<a id="m-isbuf-254af72d81f0"></a>
### isBuf()

```java
public final boolean isBuf()
```

<a id="m-iscdbbegin-aeff9465850d"></a>
### isCdbBegin()

```java
public final boolean isCdbBegin()
```

<a id="m-isdate-c423781b293a"></a>
### isDate()

```java
public final boolean isDate()
```

<a id="m-isdatetime-4e79c97b2bd5"></a>
### isDatetime()

```java
public final boolean isDatetime()
```

<a id="m-isdecimal64-fbfc5a5de098"></a>
### isDecimal64()

```java
public final boolean isDecimal64()
```

<a id="m-isdefault-9a6b81cd55f6"></a>
### isDefault()

```java
public final boolean isDefault()
```

<a id="m-isdouble-47da85f502c9"></a>
### isDouble()

```java
public final boolean isDouble()
```

<a id="m-isdquad-1986dbac6f44"></a>
### isDquad()

```java
public final boolean isDquad()
```

<a id="m-isduration-7960407492db"></a>
### isDuration()

```java
public final boolean isDuration()
```

<a id="m-isempty-4dde48126244"></a>
### isEmpty()

```java
public final boolean isEmpty()
```

<a id="m-isenumvalue-b6e22d09884f"></a>
### isEnumValue()

```java
public final boolean isEnumValue()
```

<a id="m-ishexstr-b866520006d5"></a>
### isHexstr()

```java
public final boolean isHexstr()
```

<a id="m-isidentityref-975db106a225"></a>
### isIdentityref()

```java
public final boolean isIdentityref()
```

<a id="m-isint16-7462eecb083e"></a>
### isInt16()

```java
public final boolean isInt16()
```

<a id="m-isint32-3341e7603763"></a>
### isInt32()

```java
public final boolean isInt32()
```

<a id="m-isint64-c54b20486cbe"></a>
### isInt64()

```java
public final boolean isInt64()
```

<a id="m-isint8-908482a868e0"></a>
### isInt8()

```java
public final boolean isInt8()
```

<a id="m-isipv4-f769f8c600b5"></a>
### isIpv4()

```java
public final boolean isIpv4()
```

<a id="m-isipv4andplen-e1536a127f9e"></a>
### isIpv4AndPlen()

```java
public final boolean isIpv4AndPlen()
```

<a id="m-isipv4prefix-7b973eaefa1d"></a>
### isIpv4prefix()

```java
public final boolean isIpv4prefix()
```

<a id="m-isipv6-a32651632b39"></a>
### isIpv6()

```java
public final boolean isIpv6()
```

<a id="m-isipv6andplen-1963093ce68a"></a>
### isIpv6AndPlen()

```java
public final boolean isIpv6AndPlen()
```

<a id="m-isipv6prefix-6dce0b40b9d7"></a>
### isIpv6prefix()

```java
public final boolean isIpv6prefix()
```

<a id="m-islist-c36bce63b506"></a>
### isList()

```java
public final boolean isList()
```

<a id="m-isnoexists-a1ec13d21a56"></a>
### isNoexists()

```java
public final boolean isNoexists()
```

<a id="m-isobjectref-2120317a92dd"></a>
### isObjectref()

```java
public final boolean isObjectref()
```

<a id="m-isoid-368ae9c713d1"></a>
### isOid()

```java
public final boolean isOid()
```

<a id="m-isptr-276f1553635d"></a>
### isPtr()

```java
public final boolean isPtr()
```

<a id="m-isqname-79c1cbb01029"></a>
### isQname()

```java
public final boolean isQname()
```

<a id="m-isstr-81c3840f26d4"></a>
### isStr()

```java
public final boolean isStr()
```

<a id="m-issymbol-d7206a92c0eb"></a>
### isSymbol()

```java
public final boolean isSymbol()
```

<a id="m-istime-250a56dbdac5"></a>
### isTime()

```java
public final boolean isTime()
```

<a id="m-isuint16-d8c251a40ead"></a>
### isUint16()

```java
public final boolean isUint16()
```

<a id="m-isuint32-fd3a00ffba15"></a>
### isUint32()

```java
public final boolean isUint32()
```

<a id="m-isuint64-ce4ee69a295b"></a>
### isUint64()

```java
public final boolean isUint64()
```

<a id="m-isuint8-9f400b8116f3"></a>
### isUint8()

```java
public final boolean isUint8()
```

<a id="m-isunion-6183f968c3e8"></a>
### isUnion()

```java
public final boolean isUnion()
```

<a id="m-isunknown-88a5b80751a0"></a>
### isUnknown()

```java
public final boolean isUnknown()
```

<a id="m-isxmlbegin-3a07f5fed3da"></a>
### isXmlbegin()

```java
public final boolean isXmlbegin()
```

<a id="m-isxmlbegindel-4e1966d82109"></a>
### isXmlbegindel()

```java
public final boolean isXmlbegindel()
```

<a id="m-isxmlend-9111f39d186c"></a>
### isXmlend()

```java
public final boolean isXmlend()
```

<a id="m-isxmlmoveend-45ed9b27d7cf"></a>
### isXmlMoveEnd()

```java
public final boolean isXmlMoveEnd()
```

<a id="m-isxmlmovefirst-7c07b98bd060"></a>
### isXmlMoveFirst()

```java
public final boolean isXmlMoveFirst()
```

<a id="m-isxmltag-da0707b0ae43"></a>
### isXmltag()

```java
public final boolean isXmltag()
```

<a id="m-which-0b2d23db5ed0"></a>
### which()

```java
public com.tailf.ncs.maapi.Schema.CsValue.Which which()
```

Types: [Which](Which.md#cls-Which)
