# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValue.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#reader-cf5e962c3323)

**Methods**:

- [getBinary()](#getbinary-f332a896a1bb)
- [getBit32()](#getbit32-27693f0a3df1)
- [getBit64()](#getbit64-51ba19e6036e)
- [getBitbig()](#getbitbig-ce729847bcfd)
- [getBool()](#getbool-bfc6de52d8c0)
- [getBuf()](#getbuf-3beb55b0999e)
- [getCdbBegin()](#getcdbbegin-de343abd3d60)
- [getDate()](#getdate-835e7d70e8d1)
- [getDatetime()](#getdatetime-388189505619)
- [getDecimal64()](#getdecimal64-193bb466ba33)
- [getDefault()](#getdefault-3b99fa7321e2)
- [getDouble()](#getdouble-2f3cdb03174e)
- [getDquad()](#getdquad-4a29a8e328e2)
- [getDuration()](#getduration-aee615ea7fe2)
- [getEmpty()](#getempty-500b00e51161)
- [getEnumValue()](#getenumvalue-5222f58810c9)
- [getHexstr()](#gethexstr-7bdee4ec31cf)
- [getIdentityref()](#getidentityref-da99f3e4419f)
- [getInt16()](#getint16-5744ecc89efb)
- [getInt32()](#getint32-81084bf6c564)
- [getInt64()](#getint64-12855180ebd0)
- [getInt8()](#getint8-f88ea0bcdca8)
- [getIpv4()](#getipv4-9ce1b70400a4)
- [getIpv4AndPlen()](#getipv4andplen-6283b58ee146)
- [getIpv4prefix()](#getipv4prefix-01000113e705)
- [getIpv6()](#getipv6-075bb9cd9153)
- [getIpv6AndPlen()](#getipv6andplen-de70a17471a3)
- [getIpv6prefix()](#getipv6prefix-474193492c1a)
- [getList()](#getlist-bb3f8cbe83be)
- [getNoexists()](#getnoexists-f692a7fc16f3)
- [getObjectref()](#getobjectref-eb216e093ad4)
- [getOid()](#getoid-2faa98066d96)
- [getPtr()](#getptr-9b1702eaedfe)
- [getQname()](#getqname-022156d42738)
- [getShallowType()](#getshallowtype-2e2b5f294983)
- [getStr()](#getstr-52d1ecf4d92e)
- [getSymbol()](#getsymbol-702f4641963e)
- [getTime()](#gettime-1429b351f3a0)
- [getUint16()](#getuint16-2c1ad5a64222)
- [getUint32()](#getuint32-fa11eb2e5b91)
- [getUint64()](#getuint64-f84c3cc8734c)
- [getUint8()](#getuint8-35a48ed7f6a6)
- [getUnion()](#getunion-09a450ad6ddb)
- [getUnknown()](#getunknown-70adb8ae54c3)
- [getXmlbegin()](#getxmlbegin-d03e242d4096)
- [getXmlbegindel()](#getxmlbegindel-920a8ac89e37)
- [getXmlend()](#getxmlend-ae3cef179327)
- [getXmlMoveEnd()](#getxmlmoveend-9e767f8514b2)
- [getXmlMoveFirst()](#getxmlmovefirst-580a69a9f9d8)
- [getXmltag()](#getxmltag-15a59d5d02ef)
- [hasBinary()](#hasbinary-ca7a9e4bd9ff)
- [hasBitbig()](#hasbitbig-ce7c2f407d41)
- [hasBuf()](#hasbuf-89f2325600ad)
- [hasDate()](#hasdate-0e18e477f8d2)
- [hasDatetime()](#hasdatetime-05a705114985)
- [hasDecimal64()](#hasdecimal64-85dcdb2b131e)
- [hasDquad()](#hasdquad-527d1ccedadf)
- [hasDuration()](#hasduration-ccb038026ecc)
- [hasHexstr()](#hashexstr-dcb9d92bfaa7)
- [hasIdentityref()](#hasidentityref-8b7bd6f11b9c)
- [hasIpv4()](#hasipv4-3133077df861)
- [hasIpv4AndPlen()](#hasipv4andplen-b8a422f53d9f)
- [hasIpv4prefix()](#hasipv4prefix-9c8dcd0c712c)
- [hasIpv6()](#hasipv6-9895b8d93f23)
- [hasIpv6AndPlen()](#hasipv6andplen-4edf7d0a4bbc)
- [hasIpv6prefix()](#hasipv6prefix-8a2bdd383c32)
- [hasList()](#haslist-3712d7ce73ac)
- [hasObjectref()](#hasobjectref-a79354acdb9f)
- [hasOid()](#hasoid-64b45096c850)
- [hasQname()](#hasqname-3146e94ee2c2)
- [hasStr()](#hasstr-4da753ffd6f2)
- [hasSymbol()](#hassymbol-19b8459c5d53)
- [hasTime()](#hastime-f12208352daa)
- [hasUnion()](#hasunion-b08deffc4123)
- [hasXmltag()](#hasxmltag-1764776a4b41)
- [isBinary()](#isbinary-d92620e842a5)
- [isBit32()](#isbit32-ae0f1c3885a6)
- [isBit64()](#isbit64-2ec3459ff82c)
- [isBitbig()](#isbitbig-84cd2f0ebaeb)
- [isBool()](#isbool-e771ae3d3e55)
- [isBuf()](#isbuf-254af72d81f0)
- [isCdbBegin()](#iscdbbegin-aeff9465850d)
- [isDate()](#isdate-c423781b293a)
- [isDatetime()](#isdatetime-4e79c97b2bd5)
- [isDecimal64()](#isdecimal64-fbfc5a5de098)
- [isDefault()](#isdefault-9a6b81cd55f6)
- [isDouble()](#isdouble-47da85f502c9)
- [isDquad()](#isdquad-1986dbac6f44)
- [isDuration()](#isduration-7960407492db)
- [isEmpty()](#isempty-4dde48126244)
- [isEnumValue()](#isenumvalue-b6e22d09884f)
- [isHexstr()](#ishexstr-b866520006d5)
- [isIdentityref()](#isidentityref-975db106a225)
- [isInt16()](#isint16-7462eecb083e)
- [isInt32()](#isint32-3341e7603763)
- [isInt64()](#isint64-c54b20486cbe)
- [isInt8()](#isint8-908482a868e0)
- [isIpv4()](#isipv4-f769f8c600b5)
- [isIpv4AndPlen()](#isipv4andplen-e1536a127f9e)
- [isIpv4prefix()](#isipv4prefix-7b973eaefa1d)
- [isIpv6()](#isipv6-a32651632b39)
- [isIpv6AndPlen()](#isipv6andplen-1963093ce68a)
- [isIpv6prefix()](#isipv6prefix-6dce0b40b9d7)
- [isList()](#islist-c36bce63b506)
- [isNoexists()](#isnoexists-a1ec13d21a56)
- [isObjectref()](#isobjectref-2120317a92dd)
- [isOid()](#isoid-368ae9c713d1)
- [isPtr()](#isptr-276f1553635d)
- [isQname()](#isqname-79c1cbb01029)
- [isStr()](#isstr-81c3840f26d4)
- [isSymbol()](#issymbol-d7206a92c0eb)
- [isTime()](#istime-250a56dbdac5)
- [isUint16()](#isuint16-d8c251a40ead)
- [isUint32()](#isuint32-fd3a00ffba15)
- [isUint64()](#isuint64-ce4ee69a295b)
- [isUint8()](#isuint8-9f400b8116f3)
- [isUnion()](#isunion-6183f968c3e8)
- [isUnknown()](#isunknown-88a5b80751a0)
- [isXmlbegin()](#isxmlbegin-3a07f5fed3da)
- [isXmlbegindel()](#isxmlbegindel-4e1966d82109)
- [isXmlend()](#isxmlend-9111f39d186c)
- [isXmlMoveEnd()](#isxmlmoveend-45ed9b27d7cf)
- [isXmlMoveFirst()](#isxmlmovefirst-7c07b98bd060)
- [isXmltag()](#isxmltag-da0707b0ae43)
- [which()](#which-0b2d23db5ed0)

## Constructors

### Reader(SegmentReader, int, int, int, short, int) <a href="#reader-cf5e962c3323" id="reader-cf5e962c3323"></a>

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

### getBinary() <a href="#getbinary-f332a896a1bb" id="getbinary-f332a896a1bb"></a>

```java
public org.capnproto.Data.Reader getBinary()
```

### getBit32() <a href="#getbit32-27693f0a3df1" id="getbit32-27693f0a3df1"></a>

```java
public final int getBit32()
```

### getBit64() <a href="#getbit64-51ba19e6036e" id="getbit64-51ba19e6036e"></a>

```java
public final long getBit64()
```

### getBitbig() <a href="#getbitbig-ce729847bcfd" id="getbitbig-ce729847bcfd"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueBitBig.Reader getBitbig()
```

Types: [Reader](../CsValueBitBig/Reader.md#reader-b2467a96ddff)

### getBool() <a href="#getbool-bfc6de52d8c0" id="getbool-bfc6de52d8c0"></a>

```java
public final boolean getBool()
```

### getBuf() <a href="#getbuf-3beb55b0999e" id="getbuf-3beb55b0999e"></a>

```java
public org.capnproto.Data.Reader getBuf()
```

### getCdbBegin() <a href="#getcdbbegin-de343abd3d60" id="getcdbbegin-de343abd3d60"></a>

```java
public final org.capnproto.Void getCdbBegin()
```

### getDate() <a href="#getdate-835e7d70e8d1" id="getdate-835e7d70e8d1"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueDate.Reader getDate()
```

Types: [Reader](../CsValueDate/Reader.md#reader-b2467a96ddff)

### getDatetime() <a href="#getdatetime-388189505619" id="getdatetime-388189505619"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueDateTime.Reader getDatetime()
```

Types: [Reader](../CsValueDateTime/Reader.md#reader-b2467a96ddff)

### getDecimal64() <a href="#getdecimal64-193bb466ba33" id="getdecimal64-193bb466ba33"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueDecimal64.Reader getDecimal64()
```

Types: [Reader](../CsValueDecimal64/Reader.md#reader-b2467a96ddff)

### getDefault() <a href="#getdefault-3b99fa7321e2" id="getdefault-3b99fa7321e2"></a>

```java
public final org.capnproto.Void getDefault()
```

### getDouble() <a href="#getdouble-2f3cdb03174e" id="getdouble-2f3cdb03174e"></a>

```java
public final double getDouble()
```

### getDquad() <a href="#getdquad-4a29a8e328e2" id="getdquad-4a29a8e328e2"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueDQuad.Reader getDquad()
```

Types: [Reader](../CsValueDQuad/Reader.md#reader-b2467a96ddff)

### getDuration() <a href="#getduration-aee615ea7fe2" id="getduration-aee615ea7fe2"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueDuration.Reader getDuration()
```

Types: [Reader](../CsValueDuration/Reader.md#reader-b2467a96ddff)

### getEmpty() <a href="#getempty-500b00e51161" id="getempty-500b00e51161"></a>

```java
public final org.capnproto.Void getEmpty()
```

### getEnumValue() <a href="#getenumvalue-5222f58810c9" id="getenumvalue-5222f58810c9"></a>

```java
public final int getEnumValue()
```

### getHexstr() <a href="#gethexstr-7bdee4ec31cf" id="gethexstr-7bdee4ec31cf"></a>

```java
public org.capnproto.Data.Reader getHexstr()
```

### getIdentityref() <a href="#getidentityref-da99f3e4419f" id="getidentityref-da99f3e4419f"></a>

```java
public com.tailf.ncs.maapi.Schema.QTag.Reader getIdentityref()
```

Types: [Reader](../QTag/Reader.md#reader-b2467a96ddff)

### getInt16() <a href="#getint16-5744ecc89efb" id="getint16-5744ecc89efb"></a>

```java
public final short getInt16()
```

### getInt32() <a href="#getint32-81084bf6c564" id="getint32-81084bf6c564"></a>

```java
public final int getInt32()
```

### getInt64() <a href="#getint64-12855180ebd0" id="getint64-12855180ebd0"></a>

```java
public final long getInt64()
```

### getInt8() <a href="#getint8-f88ea0bcdca8" id="getint8-f88ea0bcdca8"></a>

```java
public final byte getInt8()
```

### getIpv4() <a href="#getipv4-9ce1b70400a4" id="getipv4-9ce1b70400a4"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader getIpv4()
```

Types: [Reader](../CsValueIPv4Prefix/Reader.md#reader-b2467a96ddff)

### getIpv4AndPlen() <a href="#getipv4andplen-6283b58ee146" id="getipv4andplen-6283b58ee146"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader getIpv4AndPlen()
```

Types: [Reader](../CsValueIPv4Prefix/Reader.md#reader-b2467a96ddff)

### getIpv4prefix() <a href="#getipv4prefix-01000113e705" id="getipv4prefix-01000113e705"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader getIpv4prefix()
```

Types: [Reader](../CsValueIPv4Prefix/Reader.md#reader-b2467a96ddff)

### getIpv6() <a href="#getipv6-075bb9cd9153" id="getipv6-075bb9cd9153"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader getIpv6()
```

Types: [Reader](../CsValueIPv6Prefix/Reader.md#reader-b2467a96ddff)

### getIpv6AndPlen() <a href="#getipv6andplen-de70a17471a3" id="getipv6andplen-de70a17471a3"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader getIpv6AndPlen()
```

Types: [Reader](../CsValueIPv6Prefix/Reader.md#reader-b2467a96ddff)

### getIpv6prefix() <a href="#getipv6prefix-474193492c1a" id="getipv6prefix-474193492c1a"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader getIpv6prefix()
```

Types: [Reader](../CsValueIPv6Prefix/Reader.md#reader-b2467a96ddff)

### getList() <a href="#getlist-bb3f8cbe83be" id="getlist-bb3f8cbe83be"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsValue.Reader> getList()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getNoexists() <a href="#getnoexists-f692a7fc16f3" id="getnoexists-f692a7fc16f3"></a>

```java
public final org.capnproto.Void getNoexists()
```

### getObjectref() <a href="#getobjectref-eb216e093ad4" id="getobjectref-eb216e093ad4"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsValue.Reader> getObjectref()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getOid() <a href="#getoid-2faa98066d96" id="getoid-2faa98066d96"></a>

```java
public final org.capnproto.PrimitiveList.Long.Reader getOid()
```

### getPtr() <a href="#getptr-9b1702eaedfe" id="getptr-9b1702eaedfe"></a>

```java
public final org.capnproto.Void getPtr()
```

### getQname() <a href="#getqname-022156d42738" id="getqname-022156d42738"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueQName.Reader getQname()
```

Types: [Reader](../CsValueQName/Reader.md#reader-b2467a96ddff)

### getShallowType() <a href="#getshallowtype-2e2b5f294983" id="getshallowtype-2e2b5f294983"></a>

```java
public final com.tailf.ncs.maapi.Schema.ShallowType getShallowType()
```

Types: [ShallowType](../ShallowType.md#shallowtype-736a38acb289)

### getStr() <a href="#getstr-52d1ecf4d92e" id="getstr-52d1ecf4d92e"></a>

```java
public org.capnproto.Text.Reader getStr()
```

### getSymbol() <a href="#getsymbol-702f4641963e" id="getsymbol-702f4641963e"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueSymbol.Reader getSymbol()
```

Types: [Reader](../CsValueSymbol/Reader.md#reader-b2467a96ddff)

### getTime() <a href="#gettime-1429b351f3a0" id="gettime-1429b351f3a0"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueTime.Reader getTime()
```

Types: [Reader](../CsValueTime/Reader.md#reader-b2467a96ddff)

### getUint16() <a href="#getuint16-2c1ad5a64222" id="getuint16-2c1ad5a64222"></a>

```java
public final short getUint16()
```

### getUint32() <a href="#getuint32-fa11eb2e5b91" id="getuint32-fa11eb2e5b91"></a>

```java
public final int getUint32()
```

### getUint64() <a href="#getuint64-f84c3cc8734c" id="getuint64-f84c3cc8734c"></a>

```java
public final long getUint64()
```

### getUint8() <a href="#getuint8-35a48ed7f6a6" id="getuint8-35a48ed7f6a6"></a>

```java
public final byte getUint8()
```

### getUnion() <a href="#getunion-09a450ad6ddb" id="getunion-09a450ad6ddb"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValue.Reader getUnion()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getUnknown() <a href="#getunknown-70adb8ae54c3" id="getunknown-70adb8ae54c3"></a>

```java
public final org.capnproto.Void getUnknown()
```

### getXmlbegin() <a href="#getxmlbegin-d03e242d4096" id="getxmlbegin-d03e242d4096"></a>

```java
public final org.capnproto.Void getXmlbegin()
```

### getXmlbegindel() <a href="#getxmlbegindel-920a8ac89e37" id="getxmlbegindel-920a8ac89e37"></a>

```java
public final org.capnproto.Void getXmlbegindel()
```

### getXmlend() <a href="#getxmlend-ae3cef179327" id="getxmlend-ae3cef179327"></a>

```java
public final org.capnproto.Void getXmlend()
```

### getXmlMoveEnd() <a href="#getxmlmoveend-9e767f8514b2" id="getxmlmoveend-9e767f8514b2"></a>

```java
public final org.capnproto.Void getXmlMoveEnd()
```

### getXmlMoveFirst() <a href="#getxmlmovefirst-580a69a9f9d8" id="getxmlmovefirst-580a69a9f9d8"></a>

```java
public final org.capnproto.Void getXmlMoveFirst()
```

### getXmltag() <a href="#getxmltag-15a59d5d02ef" id="getxmltag-15a59d5d02ef"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValueXmlTag.Reader getXmltag()
```

Types: [Reader](../CsValueXmlTag/Reader.md#reader-b2467a96ddff)

### hasBinary() <a href="#hasbinary-ca7a9e4bd9ff" id="hasbinary-ca7a9e4bd9ff"></a>

```java
public boolean hasBinary()
```

### hasBitbig() <a href="#hasbitbig-ce7c2f407d41" id="hasbitbig-ce7c2f407d41"></a>

```java
public boolean hasBitbig()
```

### hasBuf() <a href="#hasbuf-89f2325600ad" id="hasbuf-89f2325600ad"></a>

```java
public boolean hasBuf()
```

### hasDate() <a href="#hasdate-0e18e477f8d2" id="hasdate-0e18e477f8d2"></a>

```java
public boolean hasDate()
```

### hasDatetime() <a href="#hasdatetime-05a705114985" id="hasdatetime-05a705114985"></a>

```java
public boolean hasDatetime()
```

### hasDecimal64() <a href="#hasdecimal64-85dcdb2b131e" id="hasdecimal64-85dcdb2b131e"></a>

```java
public boolean hasDecimal64()
```

### hasDquad() <a href="#hasdquad-527d1ccedadf" id="hasdquad-527d1ccedadf"></a>

```java
public boolean hasDquad()
```

### hasDuration() <a href="#hasduration-ccb038026ecc" id="hasduration-ccb038026ecc"></a>

```java
public boolean hasDuration()
```

### hasHexstr() <a href="#hashexstr-dcb9d92bfaa7" id="hashexstr-dcb9d92bfaa7"></a>

```java
public boolean hasHexstr()
```

### hasIdentityref() <a href="#hasidentityref-8b7bd6f11b9c" id="hasidentityref-8b7bd6f11b9c"></a>

```java
public boolean hasIdentityref()
```

### hasIpv4() <a href="#hasipv4-3133077df861" id="hasipv4-3133077df861"></a>

```java
public boolean hasIpv4()
```

### hasIpv4AndPlen() <a href="#hasipv4andplen-b8a422f53d9f" id="hasipv4andplen-b8a422f53d9f"></a>

```java
public boolean hasIpv4AndPlen()
```

### hasIpv4prefix() <a href="#hasipv4prefix-9c8dcd0c712c" id="hasipv4prefix-9c8dcd0c712c"></a>

```java
public boolean hasIpv4prefix()
```

### hasIpv6() <a href="#hasipv6-9895b8d93f23" id="hasipv6-9895b8d93f23"></a>

```java
public boolean hasIpv6()
```

### hasIpv6AndPlen() <a href="#hasipv6andplen-4edf7d0a4bbc" id="hasipv6andplen-4edf7d0a4bbc"></a>

```java
public boolean hasIpv6AndPlen()
```

### hasIpv6prefix() <a href="#hasipv6prefix-8a2bdd383c32" id="hasipv6prefix-8a2bdd383c32"></a>

```java
public boolean hasIpv6prefix()
```

### hasList() <a href="#haslist-3712d7ce73ac" id="haslist-3712d7ce73ac"></a>

```java
public final boolean hasList()
```

### hasObjectref() <a href="#hasobjectref-a79354acdb9f" id="hasobjectref-a79354acdb9f"></a>

```java
public final boolean hasObjectref()
```

### hasOid() <a href="#hasoid-64b45096c850" id="hasoid-64b45096c850"></a>

```java
public final boolean hasOid()
```

### hasQname() <a href="#hasqname-3146e94ee2c2" id="hasqname-3146e94ee2c2"></a>

```java
public boolean hasQname()
```

### hasStr() <a href="#hasstr-4da753ffd6f2" id="hasstr-4da753ffd6f2"></a>

```java
public boolean hasStr()
```

### hasSymbol() <a href="#hassymbol-19b8459c5d53" id="hassymbol-19b8459c5d53"></a>

```java
public boolean hasSymbol()
```

### hasTime() <a href="#hastime-f12208352daa" id="hastime-f12208352daa"></a>

```java
public boolean hasTime()
```

### hasUnion() <a href="#hasunion-b08deffc4123" id="hasunion-b08deffc4123"></a>

```java
public boolean hasUnion()
```

### hasXmltag() <a href="#hasxmltag-1764776a4b41" id="hasxmltag-1764776a4b41"></a>

```java
public boolean hasXmltag()
```

### isBinary() <a href="#isbinary-d92620e842a5" id="isbinary-d92620e842a5"></a>

```java
public final boolean isBinary()
```

### isBit32() <a href="#isbit32-ae0f1c3885a6" id="isbit32-ae0f1c3885a6"></a>

```java
public final boolean isBit32()
```

### isBit64() <a href="#isbit64-2ec3459ff82c" id="isbit64-2ec3459ff82c"></a>

```java
public final boolean isBit64()
```

### isBitbig() <a href="#isbitbig-84cd2f0ebaeb" id="isbitbig-84cd2f0ebaeb"></a>

```java
public final boolean isBitbig()
```

### isBool() <a href="#isbool-e771ae3d3e55" id="isbool-e771ae3d3e55"></a>

```java
public final boolean isBool()
```

### isBuf() <a href="#isbuf-254af72d81f0" id="isbuf-254af72d81f0"></a>

```java
public final boolean isBuf()
```

### isCdbBegin() <a href="#iscdbbegin-aeff9465850d" id="iscdbbegin-aeff9465850d"></a>

```java
public final boolean isCdbBegin()
```

### isDate() <a href="#isdate-c423781b293a" id="isdate-c423781b293a"></a>

```java
public final boolean isDate()
```

### isDatetime() <a href="#isdatetime-4e79c97b2bd5" id="isdatetime-4e79c97b2bd5"></a>

```java
public final boolean isDatetime()
```

### isDecimal64() <a href="#isdecimal64-fbfc5a5de098" id="isdecimal64-fbfc5a5de098"></a>

```java
public final boolean isDecimal64()
```

### isDefault() <a href="#isdefault-9a6b81cd55f6" id="isdefault-9a6b81cd55f6"></a>

```java
public final boolean isDefault()
```

### isDouble() <a href="#isdouble-47da85f502c9" id="isdouble-47da85f502c9"></a>

```java
public final boolean isDouble()
```

### isDquad() <a href="#isdquad-1986dbac6f44" id="isdquad-1986dbac6f44"></a>

```java
public final boolean isDquad()
```

### isDuration() <a href="#isduration-7960407492db" id="isduration-7960407492db"></a>

```java
public final boolean isDuration()
```

### isEmpty() <a href="#isempty-4dde48126244" id="isempty-4dde48126244"></a>

```java
public final boolean isEmpty()
```

### isEnumValue() <a href="#isenumvalue-b6e22d09884f" id="isenumvalue-b6e22d09884f"></a>

```java
public final boolean isEnumValue()
```

### isHexstr() <a href="#ishexstr-b866520006d5" id="ishexstr-b866520006d5"></a>

```java
public final boolean isHexstr()
```

### isIdentityref() <a href="#isidentityref-975db106a225" id="isidentityref-975db106a225"></a>

```java
public final boolean isIdentityref()
```

### isInt16() <a href="#isint16-7462eecb083e" id="isint16-7462eecb083e"></a>

```java
public final boolean isInt16()
```

### isInt32() <a href="#isint32-3341e7603763" id="isint32-3341e7603763"></a>

```java
public final boolean isInt32()
```

### isInt64() <a href="#isint64-c54b20486cbe" id="isint64-c54b20486cbe"></a>

```java
public final boolean isInt64()
```

### isInt8() <a href="#isint8-908482a868e0" id="isint8-908482a868e0"></a>

```java
public final boolean isInt8()
```

### isIpv4() <a href="#isipv4-f769f8c600b5" id="isipv4-f769f8c600b5"></a>

```java
public final boolean isIpv4()
```

### isIpv4AndPlen() <a href="#isipv4andplen-e1536a127f9e" id="isipv4andplen-e1536a127f9e"></a>

```java
public final boolean isIpv4AndPlen()
```

### isIpv4prefix() <a href="#isipv4prefix-7b973eaefa1d" id="isipv4prefix-7b973eaefa1d"></a>

```java
public final boolean isIpv4prefix()
```

### isIpv6() <a href="#isipv6-a32651632b39" id="isipv6-a32651632b39"></a>

```java
public final boolean isIpv6()
```

### isIpv6AndPlen() <a href="#isipv6andplen-1963093ce68a" id="isipv6andplen-1963093ce68a"></a>

```java
public final boolean isIpv6AndPlen()
```

### isIpv6prefix() <a href="#isipv6prefix-6dce0b40b9d7" id="isipv6prefix-6dce0b40b9d7"></a>

```java
public final boolean isIpv6prefix()
```

### isList() <a href="#islist-c36bce63b506" id="islist-c36bce63b506"></a>

```java
public final boolean isList()
```

### isNoexists() <a href="#isnoexists-a1ec13d21a56" id="isnoexists-a1ec13d21a56"></a>

```java
public final boolean isNoexists()
```

### isObjectref() <a href="#isobjectref-2120317a92dd" id="isobjectref-2120317a92dd"></a>

```java
public final boolean isObjectref()
```

### isOid() <a href="#isoid-368ae9c713d1" id="isoid-368ae9c713d1"></a>

```java
public final boolean isOid()
```

### isPtr() <a href="#isptr-276f1553635d" id="isptr-276f1553635d"></a>

```java
public final boolean isPtr()
```

### isQname() <a href="#isqname-79c1cbb01029" id="isqname-79c1cbb01029"></a>

```java
public final boolean isQname()
```

### isStr() <a href="#isstr-81c3840f26d4" id="isstr-81c3840f26d4"></a>

```java
public final boolean isStr()
```

### isSymbol() <a href="#issymbol-d7206a92c0eb" id="issymbol-d7206a92c0eb"></a>

```java
public final boolean isSymbol()
```

### isTime() <a href="#istime-250a56dbdac5" id="istime-250a56dbdac5"></a>

```java
public final boolean isTime()
```

### isUint16() <a href="#isuint16-d8c251a40ead" id="isuint16-d8c251a40ead"></a>

```java
public final boolean isUint16()
```

### isUint32() <a href="#isuint32-fd3a00ffba15" id="isuint32-fd3a00ffba15"></a>

```java
public final boolean isUint32()
```

### isUint64() <a href="#isuint64-ce4ee69a295b" id="isuint64-ce4ee69a295b"></a>

```java
public final boolean isUint64()
```

### isUint8() <a href="#isuint8-9f400b8116f3" id="isuint8-9f400b8116f3"></a>

```java
public final boolean isUint8()
```

### isUnion() <a href="#isunion-6183f968c3e8" id="isunion-6183f968c3e8"></a>

```java
public final boolean isUnion()
```

### isUnknown() <a href="#isunknown-88a5b80751a0" id="isunknown-88a5b80751a0"></a>

```java
public final boolean isUnknown()
```

### isXmlbegin() <a href="#isxmlbegin-3a07f5fed3da" id="isxmlbegin-3a07f5fed3da"></a>

```java
public final boolean isXmlbegin()
```

### isXmlbegindel() <a href="#isxmlbegindel-4e1966d82109" id="isxmlbegindel-4e1966d82109"></a>

```java
public final boolean isXmlbegindel()
```

### isXmlend() <a href="#isxmlend-9111f39d186c" id="isxmlend-9111f39d186c"></a>

```java
public final boolean isXmlend()
```

### isXmlMoveEnd() <a href="#isxmlmoveend-45ed9b27d7cf" id="isxmlmoveend-45ed9b27d7cf"></a>

```java
public final boolean isXmlMoveEnd()
```

### isXmlMoveFirst() <a href="#isxmlmovefirst-7c07b98bd060" id="isxmlmovefirst-7c07b98bd060"></a>

```java
public final boolean isXmlMoveFirst()
```

### isXmltag() <a href="#isxmltag-da0707b0ae43" id="isxmltag-da0707b0ae43"></a>

```java
public final boolean isXmltag()
```

### which() <a href="#which-0b2d23db5ed0" id="which-0b2d23db5ed0"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValue.Which which()
```

Types: [Which](Which.md#which-92b652653aa7)
