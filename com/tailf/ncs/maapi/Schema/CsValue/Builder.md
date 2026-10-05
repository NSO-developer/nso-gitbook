<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsValue.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
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
- [hasBuf()](#m-hasbuf-89f2325600ad)
- [hasHexstr()](#m-hashexstr-dcb9d92bfaa7)
- [hasList()](#m-haslist-3712d7ce73ac)
- [hasObjectref()](#m-hasobjectref-a79354acdb9f)
- [hasOid()](#m-hasoid-64b45096c850)
- [hasStr()](#m-hasstr-4da753ffd6f2)
- [initBinary(int)](#m-initbinary-da8376321dd1)
- [initBitbig()](#m-initbitbig-fd6227122084)
- [initBuf(int)](#m-initbuf-283316a1539d)
- [initDate()](#m-initdate-0d1ab510efb2)
- [initDatetime()](#m-initdatetime-e2839d63f272)
- [initDecimal64()](#m-initdecimal64-beda8ac08084)
- [initDquad()](#m-initdquad-27bd6cd9a9ed)
- [initDuration()](#m-initduration-21d0c79353af)
- [initHexstr(int)](#m-inithexstr-547aec4d26f3)
- [initIdentityref()](#m-initidentityref-1b5ab2bb6330)
- [initIpv4()](#m-initipv4-17f92309b472)
- [initIpv4AndPlen()](#m-initipv4andplen-9c9e2cd3eaa1)
- [initIpv4prefix()](#m-initipv4prefix-b565b6b79384)
- [initIpv6()](#m-initipv6-36bf15e539f7)
- [initIpv6AndPlen()](#m-initipv6andplen-a9fe90c6f7de)
- [initIpv6prefix()](#m-initipv6prefix-a2792366b617)
- [initList(int)](#m-initlist-619d59db076f)
- [initObjectref(int)](#m-initobjectref-935e26a90e6e)
- [initOid(int)](#m-initoid-715b58cbb921)
- [initQname()](#m-initqname-748564905228)
- [initStr(int)](#m-initstr-af52d7d08f9f)
- [initSymbol()](#m-initsymbol-df0c748a0655)
- [initTime()](#m-inittime-eeed5ea5f00a)
- [initUnion()](#m-initunion-8c18e3f27de0)
- [initXmltag()](#m-initxmltag-bb2742edf9eb)
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
- [setBinary(byte[])](#m-setbinary-b01c99e75889)
- [setBinary(Reader)](#m-setbinary-8a1cf4ce84a9)
- [setBit32(int)](#m-setbit32-1316fc224e19)
- [setBit64(long)](#m-setbit64-a3a27f6ef6d2)
- [setBitbig(Reader)](#m-setbitbig-a514b9d55ab1)
- [setBool(boolean)](#m-setbool-88160242dcf7)
- [setBuf(byte[])](#m-setbuf-881fa0552479)
- [setBuf(Reader)](#m-setbuf-610948d9381a)
- [setCdbBegin(Void)](#m-setcdbbegin-902391c8a14e)
- [setDate(Reader)](#m-setdate-3bcb9c346567)
- [setDatetime(Reader)](#m-setdatetime-6dc599e86f6a)
- [setDecimal64(Reader)](#m-setdecimal64-7a6a8717701c)
- [setDefault(Void)](#m-setdefault-298bc2ea4f4c)
- [setDouble(double)](#m-setdouble-00357c17ab3e)
- [setDquad(Reader)](#m-setdquad-0ea8faa4deab)
- [setDuration(Reader)](#m-setduration-c6226971f7aa)
- [setEmpty(Void)](#m-setempty-02e106b89f69)
- [setEnumValue(int)](#m-setenumvalue-b69852580f08)
- [setHexstr(byte[])](#m-sethexstr-f501765c9de4)
- [setHexstr(Reader)](#m-sethexstr-d236864650dc)
- [setIdentityref(Reader)](#m-setidentityref-8c7c2d7f9e09)
- [setInt16(short)](#m-setint16-50cfe70769f2)
- [setInt32(int)](#m-setint32-92c50824ef51)
- [setInt64(long)](#m-setint64-f17f1ec8e04c)
- [setInt8(byte)](#m-setint8-2ac62944aabe)
- [setIpv4(Reader)](#m-setipv4-619e62fbc436)
- [setIpv4AndPlen(Reader)](#m-setipv4andplen-93f3be1ab458)
- [setIpv4prefix(Reader)](#m-setipv4prefix-91794916e9c8)
- [setIpv6(Reader)](#m-setipv6-5b31d658aa62)
- [setIpv6AndPlen(Reader)](#m-setipv6andplen-99b5b9880429)
- [setIpv6prefix(Reader)](#m-setipv6prefix-691f4193aeb7)
- [setList(Reader<Reader>)](#m-setlist-6e8e469cc90d)
- [setNoexists(Void)](#m-setnoexists-168255f46871)
- [setObjectref(Reader<Reader>)](#m-setobjectref-c835e9918173)
- [setOid(Reader)](#m-setoid-543cdf0a3811)
- [setPtr(Void)](#m-setptr-3ef5da141ca3)
- [setQname(Reader)](#m-setqname-a6726111b988)
- [setShallowType(ShallowType)](#m-setshallowtype-d21ce22018e7)
- [setStr(Reader)](#m-setstr-6d57a5d11cf3)
- [setStr(String)](#m-setstr-21fe97a65221)
- [setSymbol(Reader)](#m-setsymbol-4da320ce2606)
- [setTime(Reader)](#m-settime-fc6f93bd991e)
- [setUint16(short)](#m-setuint16-043282128543)
- [setUint32(int)](#m-setuint32-0f4bc4823456)
- [setUint64(long)](#m-setuint64-14de0afc3c33)
- [setUint8(byte)](#m-setuint8-a2e25ee00758)
- [setUnion(Reader)](#m-setunion-f269d70e4284)
- [setUnknown(Void)](#m-setunknown-6d434acf5507)
- [setXmlbegin(Void)](#m-setxmlbegin-299c46b694bb)
- [setXmlbegindel(Void)](#m-setxmlbegindel-c87f2fa20081)
- [setXmlend(Void)](#m-setxmlend-24c58d6147d3)
- [setXmlMoveEnd(Void)](#m-setxmlmoveend-e11b6c17145f)
- [setXmlMoveFirst(Void)](#m-setxmlmovefirst-3d1233316007)
- [setXmltag(Reader)](#m-setxmltag-b5877e9f93d5)
- [which()](#m-which-0b2d23db5ed0)

## Constructors

<a id="m-builder-179fba5038bd"></a>
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

<a id="m-asreader-b5c0f2a8d115"></a>
### asReader()

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getbinary-f332a896a1bb"></a>
### getBinary()

```java
public final org.capnproto.Data.Builder getBinary()
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
public final com.tailf.ncs.maapi.Schema.CsValueBitBig.Builder getBitbig()
```

Types: [Builder](../CsValueBitBig/Builder.md#cls-Builder)

<a id="m-getbool-bfc6de52d8c0"></a>
### getBool()

```java
public final boolean getBool()
```

<a id="m-getbuf-3beb55b0999e"></a>
### getBuf()

```java
public final org.capnproto.Data.Builder getBuf()
```

<a id="m-getcdbbegin-de343abd3d60"></a>
### getCdbBegin()

```java
public final org.capnproto.Void getCdbBegin()
```

<a id="m-getdate-835e7d70e8d1"></a>
### getDate()

```java
public final com.tailf.ncs.maapi.Schema.CsValueDate.Builder getDate()
```

Types: [Builder](../CsValueDate/Builder.md#cls-Builder)

<a id="m-getdatetime-388189505619"></a>
### getDatetime()

```java
public final com.tailf.ncs.maapi.Schema.CsValueDateTime.Builder getDatetime()
```

Types: [Builder](../CsValueDateTime/Builder.md#cls-Builder)

<a id="m-getdecimal64-193bb466ba33"></a>
### getDecimal64()

```java
public final com.tailf.ncs.maapi.Schema.CsValueDecimal64.Builder getDecimal64()
```

Types: [Builder](../CsValueDecimal64/Builder.md#cls-Builder)

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
public final com.tailf.ncs.maapi.Schema.CsValueDQuad.Builder getDquad()
```

Types: [Builder](../CsValueDQuad/Builder.md#cls-Builder)

<a id="m-getduration-aee615ea7fe2"></a>
### getDuration()

```java
public final com.tailf.ncs.maapi.Schema.CsValueDuration.Builder getDuration()
```

Types: [Builder](../CsValueDuration/Builder.md#cls-Builder)

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
public final org.capnproto.Data.Builder getHexstr()
```

<a id="m-getidentityref-da99f3e4419f"></a>
### getIdentityref()

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder getIdentityref()
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

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
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder getIpv4()
```

Types: [Builder](../CsValueIPv4Prefix/Builder.md#cls-Builder)

<a id="m-getipv4andplen-6283b58ee146"></a>
### getIpv4AndPlen()

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder getIpv4AndPlen()
```

Types: [Builder](../CsValueIPv4Prefix/Builder.md#cls-Builder)

<a id="m-getipv4prefix-01000113e705"></a>
### getIpv4prefix()

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder getIpv4prefix()
```

Types: [Builder](../CsValueIPv4Prefix/Builder.md#cls-Builder)

<a id="m-getipv6-075bb9cd9153"></a>
### getIpv6()

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder getIpv6()
```

Types: [Builder](../CsValueIPv6Prefix/Builder.md#cls-Builder)

<a id="m-getipv6andplen-de70a17471a3"></a>
### getIpv6AndPlen()

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder getIpv6AndPlen()
```

Types: [Builder](../CsValueIPv6Prefix/Builder.md#cls-Builder)

<a id="m-getipv6prefix-474193492c1a"></a>
### getIpv6prefix()

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder getIpv6prefix()
```

Types: [Builder](../CsValueIPv6Prefix/Builder.md#cls-Builder)

<a id="m-getlist-bb3f8cbe83be"></a>
### getList()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsValue.Builder> getList()
```

Types: [Builder](Builder.md#cls-Builder)

<a id="m-getnoexists-f692a7fc16f3"></a>
### getNoexists()

```java
public final org.capnproto.Void getNoexists()
```

<a id="m-getobjectref-eb216e093ad4"></a>
### getObjectref()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsValue.Builder> getObjectref()
```

Types: [Builder](Builder.md#cls-Builder)

<a id="m-getoid-2faa98066d96"></a>
### getOid()

```java
public final org.capnproto.PrimitiveList.Long.Builder getOid()
```

<a id="m-getptr-9b1702eaedfe"></a>
### getPtr()

```java
public final org.capnproto.Void getPtr()
```

<a id="m-getqname-022156d42738"></a>
### getQname()

```java
public final com.tailf.ncs.maapi.Schema.CsValueQName.Builder getQname()
```

Types: [Builder](../CsValueQName/Builder.md#cls-Builder)

<a id="m-getshallowtype-2e2b5f294983"></a>
### getShallowType()

```java
public final com.tailf.ncs.maapi.Schema.ShallowType getShallowType()
```

Types: [ShallowType](../ShallowType.md#cls-ShallowType)

<a id="m-getstr-52d1ecf4d92e"></a>
### getStr()

```java
public final org.capnproto.Text.Builder getStr()
```

<a id="m-getsymbol-702f4641963e"></a>
### getSymbol()

```java
public final com.tailf.ncs.maapi.Schema.CsValueSymbol.Builder getSymbol()
```

Types: [Builder](../CsValueSymbol/Builder.md#cls-Builder)

<a id="m-gettime-1429b351f3a0"></a>
### getTime()

```java
public final com.tailf.ncs.maapi.Schema.CsValueTime.Builder getTime()
```

Types: [Builder](../CsValueTime/Builder.md#cls-Builder)

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
public final com.tailf.ncs.maapi.Schema.CsValue.Builder getUnion()
```

Types: [Builder](Builder.md#cls-Builder)

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
public final com.tailf.ncs.maapi.Schema.CsValueXmlTag.Builder getXmltag()
```

Types: [Builder](../CsValueXmlTag/Builder.md#cls-Builder)

<a id="m-hasbinary-ca7a9e4bd9ff"></a>
### hasBinary()

```java
public final boolean hasBinary()
```

<a id="m-hasbuf-89f2325600ad"></a>
### hasBuf()

```java
public final boolean hasBuf()
```

<a id="m-hashexstr-dcb9d92bfaa7"></a>
### hasHexstr()

```java
public final boolean hasHexstr()
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

<a id="m-hasstr-4da753ffd6f2"></a>
### hasStr()

```java
public final boolean hasStr()
```

<a id="m-initbinary-da8376321dd1"></a>
### initBinary(int)

```java
public final org.capnproto.Data.Builder initBinary(int size)
```

**Parameters**

- `int size`

<a id="m-initbitbig-fd6227122084"></a>
### initBitbig()

```java
public final com.tailf.ncs.maapi.Schema.CsValueBitBig.Builder initBitbig()
```

Types: [Builder](../CsValueBitBig/Builder.md#cls-Builder)

<a id="m-initbuf-283316a1539d"></a>
### initBuf(int)

```java
public final org.capnproto.Data.Builder initBuf(int size)
```

**Parameters**

- `int size`

<a id="m-initdate-0d1ab510efb2"></a>
### initDate()

```java
public final com.tailf.ncs.maapi.Schema.CsValueDate.Builder initDate()
```

Types: [Builder](../CsValueDate/Builder.md#cls-Builder)

<a id="m-initdatetime-e2839d63f272"></a>
### initDatetime()

```java
public final com.tailf.ncs.maapi.Schema.CsValueDateTime.Builder initDatetime()
```

Types: [Builder](../CsValueDateTime/Builder.md#cls-Builder)

<a id="m-initdecimal64-beda8ac08084"></a>
### initDecimal64()

```java
public final com.tailf.ncs.maapi.Schema.CsValueDecimal64.Builder initDecimal64()
```

Types: [Builder](../CsValueDecimal64/Builder.md#cls-Builder)

<a id="m-initdquad-27bd6cd9a9ed"></a>
### initDquad()

```java
public final com.tailf.ncs.maapi.Schema.CsValueDQuad.Builder initDquad()
```

Types: [Builder](../CsValueDQuad/Builder.md#cls-Builder)

<a id="m-initduration-21d0c79353af"></a>
### initDuration()

```java
public final com.tailf.ncs.maapi.Schema.CsValueDuration.Builder initDuration()
```

Types: [Builder](../CsValueDuration/Builder.md#cls-Builder)

<a id="m-inithexstr-547aec4d26f3"></a>
### initHexstr(int)

```java
public final org.capnproto.Data.Builder initHexstr(int size)
```

**Parameters**

- `int size`

<a id="m-initidentityref-1b5ab2bb6330"></a>
### initIdentityref()

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder initIdentityref()
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

<a id="m-initipv4-17f92309b472"></a>
### initIpv4()

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder initIpv4()
```

Types: [Builder](../CsValueIPv4Prefix/Builder.md#cls-Builder)

<a id="m-initipv4andplen-9c9e2cd3eaa1"></a>
### initIpv4AndPlen()

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder initIpv4AndPlen()
```

Types: [Builder](../CsValueIPv4Prefix/Builder.md#cls-Builder)

<a id="m-initipv4prefix-b565b6b79384"></a>
### initIpv4prefix()

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder initIpv4prefix()
```

Types: [Builder](../CsValueIPv4Prefix/Builder.md#cls-Builder)

<a id="m-initipv6-36bf15e539f7"></a>
### initIpv6()

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder initIpv6()
```

Types: [Builder](../CsValueIPv6Prefix/Builder.md#cls-Builder)

<a id="m-initipv6andplen-a9fe90c6f7de"></a>
### initIpv6AndPlen()

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder initIpv6AndPlen()
```

Types: [Builder](../CsValueIPv6Prefix/Builder.md#cls-Builder)

<a id="m-initipv6prefix-a2792366b617"></a>
### initIpv6prefix()

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder initIpv6prefix()
```

Types: [Builder](../CsValueIPv6Prefix/Builder.md#cls-Builder)

<a id="m-initlist-619d59db076f"></a>
### initList(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsValue.Builder> initList(
    int size
)
```

Types: [Builder](Builder.md#cls-Builder)

**Parameters**

- `int size`

<a id="m-initobjectref-935e26a90e6e"></a>
### initObjectref(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsValue.Builder> initObjectref(
    int size
)
```

Types: [Builder](Builder.md#cls-Builder)

**Parameters**

- `int size`

<a id="m-initoid-715b58cbb921"></a>
### initOid(int)

```java
public final org.capnproto.PrimitiveList.Long.Builder initOid(int size)
```

**Parameters**

- `int size`

<a id="m-initqname-748564905228"></a>
### initQname()

```java
public final com.tailf.ncs.maapi.Schema.CsValueQName.Builder initQname()
```

Types: [Builder](../CsValueQName/Builder.md#cls-Builder)

<a id="m-initstr-af52d7d08f9f"></a>
### initStr(int)

```java
public final org.capnproto.Text.Builder initStr(int size)
```

**Parameters**

- `int size`

<a id="m-initsymbol-df0c748a0655"></a>
### initSymbol()

```java
public final com.tailf.ncs.maapi.Schema.CsValueSymbol.Builder initSymbol()
```

Types: [Builder](../CsValueSymbol/Builder.md#cls-Builder)

<a id="m-inittime-eeed5ea5f00a"></a>
### initTime()

```java
public final com.tailf.ncs.maapi.Schema.CsValueTime.Builder initTime()
```

Types: [Builder](../CsValueTime/Builder.md#cls-Builder)

<a id="m-initunion-8c18e3f27de0"></a>
### initUnion()

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder initUnion()
```

Types: [Builder](Builder.md#cls-Builder)

<a id="m-initxmltag-bb2742edf9eb"></a>
### initXmltag()

```java
public final com.tailf.ncs.maapi.Schema.CsValueXmlTag.Builder initXmltag()
```

Types: [Builder](../CsValueXmlTag/Builder.md#cls-Builder)

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

<a id="m-setbinary-b01c99e75889"></a>
### setBinary(byte[])

```java
public final void setBinary(byte[] value)
```

**Parameters**

- `byte[] value`

<a id="m-setbinary-8a1cf4ce84a9"></a>
### setBinary(Reader)

```java
public final void setBinary(org.capnproto.Data.Reader value)
```

**Parameters**

- `org.capnproto.Data.Reader value`

<a id="m-setbit32-1316fc224e19"></a>
### setBit32(int)

```java
public final void setBit32(int value)
```

**Parameters**

- `int value`

<a id="m-setbit64-a3a27f6ef6d2"></a>
### setBit64(long)

```java
public final void setBit64(long value)
```

**Parameters**

- `long value`

<a id="m-setbitbig-a514b9d55ab1"></a>
### setBitbig(Reader)

```java
public final void setBitbig(com.tailf.ncs.maapi.Schema.CsValueBitBig.Reader value)
```

Types: [Reader](../CsValueBitBig/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueBitBig.Reader value`

<a id="m-setbool-88160242dcf7"></a>
### setBool(boolean)

```java
public final void setBool(boolean value)
```

**Parameters**

- `boolean value`

<a id="m-setbuf-881fa0552479"></a>
### setBuf(byte[])

```java
public final void setBuf(byte[] value)
```

**Parameters**

- `byte[] value`

<a id="m-setbuf-610948d9381a"></a>
### setBuf(Reader)

```java
public final void setBuf(org.capnproto.Data.Reader value)
```

**Parameters**

- `org.capnproto.Data.Reader value`

<a id="m-setcdbbegin-902391c8a14e"></a>
### setCdbBegin(Void)

```java
public final void setCdbBegin(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="m-setdate-3bcb9c346567"></a>
### setDate(Reader)

```java
public final void setDate(com.tailf.ncs.maapi.Schema.CsValueDate.Reader value)
```

Types: [Reader](../CsValueDate/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDate.Reader value`

<a id="m-setdatetime-6dc599e86f6a"></a>
### setDatetime(Reader)

```java
public final void setDatetime(com.tailf.ncs.maapi.Schema.CsValueDateTime.Reader value)
```

Types: [Reader](../CsValueDateTime/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDateTime.Reader value`

<a id="m-setdecimal64-7a6a8717701c"></a>
### setDecimal64(Reader)

```java
public final void setDecimal64(com.tailf.ncs.maapi.Schema.CsValueDecimal64.Reader value)
```

Types: [Reader](../CsValueDecimal64/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDecimal64.Reader value`

<a id="m-setdefault-298bc2ea4f4c"></a>
### setDefault(Void)

```java
public final void setDefault(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="m-setdouble-00357c17ab3e"></a>
### setDouble(double)

```java
public final void setDouble(double value)
```

**Parameters**

- `double value`

<a id="m-setdquad-0ea8faa4deab"></a>
### setDquad(Reader)

```java
public final void setDquad(com.tailf.ncs.maapi.Schema.CsValueDQuad.Reader value)
```

Types: [Reader](../CsValueDQuad/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDQuad.Reader value`

<a id="m-setduration-c6226971f7aa"></a>
### setDuration(Reader)

```java
public final void setDuration(com.tailf.ncs.maapi.Schema.CsValueDuration.Reader value)
```

Types: [Reader](../CsValueDuration/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDuration.Reader value`

<a id="m-setempty-02e106b89f69"></a>
### setEmpty(Void)

```java
public final void setEmpty(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="m-setenumvalue-b69852580f08"></a>
### setEnumValue(int)

```java
public final void setEnumValue(int value)
```

**Parameters**

- `int value`

<a id="m-sethexstr-f501765c9de4"></a>
### setHexstr(byte[])

```java
public final void setHexstr(byte[] value)
```

**Parameters**

- `byte[] value`

<a id="m-sethexstr-d236864650dc"></a>
### setHexstr(Reader)

```java
public final void setHexstr(org.capnproto.Data.Reader value)
```

**Parameters**

- `org.capnproto.Data.Reader value`

<a id="m-setidentityref-8c7c2d7f9e09"></a>
### setIdentityref(Reader)

```java
public final void setIdentityref(com.tailf.ncs.maapi.Schema.QTag.Reader value)
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.QTag.Reader value`

<a id="m-setint16-50cfe70769f2"></a>
### setInt16(short)

```java
public final void setInt16(short value)
```

**Parameters**

- `short value`

<a id="m-setint32-92c50824ef51"></a>
### setInt32(int)

```java
public final void setInt32(int value)
```

**Parameters**

- `int value`

<a id="m-setint64-f17f1ec8e04c"></a>
### setInt64(long)

```java
public final void setInt64(long value)
```

**Parameters**

- `long value`

<a id="m-setint8-2ac62944aabe"></a>
### setInt8(byte)

```java
public final void setInt8(byte value)
```

**Parameters**

- `byte value`

<a id="m-setipv4-619e62fbc436"></a>
### setIpv4(Reader)

```java
public final void setIpv4(com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader value)
```

Types: [Reader](../CsValueIPv4Prefix/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader value`

<a id="m-setipv4andplen-93f3be1ab458"></a>
### setIpv4AndPlen(Reader)

```java
public final void setIpv4AndPlen(com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader value)
```

Types: [Reader](../CsValueIPv4Prefix/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader value`

<a id="m-setipv4prefix-91794916e9c8"></a>
### setIpv4prefix(Reader)

```java
public final void setIpv4prefix(com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader value)
```

Types: [Reader](../CsValueIPv4Prefix/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader value`

<a id="m-setipv6-5b31d658aa62"></a>
### setIpv6(Reader)

```java
public final void setIpv6(com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader value)
```

Types: [Reader](../CsValueIPv6Prefix/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader value`

<a id="m-setipv6andplen-99b5b9880429"></a>
### setIpv6AndPlen(Reader)

```java
public final void setIpv6AndPlen(com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader value)
```

Types: [Reader](../CsValueIPv6Prefix/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader value`

<a id="m-setipv6prefix-691f4193aeb7"></a>
### setIpv6prefix(Reader)

```java
public final void setIpv6prefix(com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader value)
```

Types: [Reader](../CsValueIPv6Prefix/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader value`

<a id="m-setlist-6e8e469cc90d"></a>
### setList(Reader<Reader>)

```java
public final void setList(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsValue.Reader> value
)
```

Types: [Reader](Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsValue.Reader> value`

<a id="m-setnoexists-168255f46871"></a>
### setNoexists(Void)

```java
public final void setNoexists(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="m-setobjectref-c835e9918173"></a>
### setObjectref(Reader<Reader>)

```java
public final void setObjectref(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsValue.Reader> value
)
```

Types: [Reader](Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsValue.Reader> value`

<a id="m-setoid-543cdf0a3811"></a>
### setOid(Reader)

```java
public final void setOid(org.capnproto.PrimitiveList.Long.Reader value)
```

**Parameters**

- `org.capnproto.PrimitiveList.Long.Reader value`

<a id="m-setptr-3ef5da141ca3"></a>
### setPtr(Void)

```java
public final void setPtr(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="m-setqname-a6726111b988"></a>
### setQname(Reader)

```java
public final void setQname(com.tailf.ncs.maapi.Schema.CsValueQName.Reader value)
```

Types: [Reader](../CsValueQName/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueQName.Reader value`

<a id="m-setshallowtype-d21ce22018e7"></a>
### setShallowType(ShallowType)

```java
public final void setShallowType(com.tailf.ncs.maapi.Schema.ShallowType value)
```

Types: [ShallowType](../ShallowType.md#cls-ShallowType)

**Parameters**

- `com.tailf.ncs.maapi.Schema.ShallowType value`

<a id="m-setstr-6d57a5d11cf3"></a>
### setStr(Reader)

```java
public final void setStr(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="m-setstr-21fe97a65221"></a>
### setStr(String)

```java
public final void setStr(String value)
```

**Parameters**

- `String value`

<a id="m-setsymbol-4da320ce2606"></a>
### setSymbol(Reader)

```java
public final void setSymbol(com.tailf.ncs.maapi.Schema.CsValueSymbol.Reader value)
```

Types: [Reader](../CsValueSymbol/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueSymbol.Reader value`

<a id="m-settime-fc6f93bd991e"></a>
### setTime(Reader)

```java
public final void setTime(com.tailf.ncs.maapi.Schema.CsValueTime.Reader value)
```

Types: [Reader](../CsValueTime/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueTime.Reader value`

<a id="m-setuint16-043282128543"></a>
### setUint16(short)

```java
public final void setUint16(short value)
```

**Parameters**

- `short value`

<a id="m-setuint32-0f4bc4823456"></a>
### setUint32(int)

```java
public final void setUint32(int value)
```

**Parameters**

- `int value`

<a id="m-setuint64-14de0afc3c33"></a>
### setUint64(long)

```java
public final void setUint64(long value)
```

**Parameters**

- `long value`

<a id="m-setuint8-a2e25ee00758"></a>
### setUint8(byte)

```java
public final void setUint8(byte value)
```

**Parameters**

- `byte value`

<a id="m-setunion-f269d70e4284"></a>
### setUnion(Reader)

```java
public final void setUnion(com.tailf.ncs.maapi.Schema.CsValue.Reader value)
```

Types: [Reader](Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValue.Reader value`

<a id="m-setunknown-6d434acf5507"></a>
### setUnknown(Void)

```java
public final void setUnknown(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="m-setxmlbegin-299c46b694bb"></a>
### setXmlbegin(Void)

```java
public final void setXmlbegin(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="m-setxmlbegindel-c87f2fa20081"></a>
### setXmlbegindel(Void)

```java
public final void setXmlbegindel(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="m-setxmlend-24c58d6147d3"></a>
### setXmlend(Void)

```java
public final void setXmlend(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="m-setxmlmoveend-e11b6c17145f"></a>
### setXmlMoveEnd(Void)

```java
public final void setXmlMoveEnd(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="m-setxmlmovefirst-3d1233316007"></a>
### setXmlMoveFirst(Void)

```java
public final void setXmlMoveFirst(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="m-setxmltag-b5877e9f93d5"></a>
### setXmltag(Reader)

```java
public final void setXmltag(com.tailf.ncs.maapi.Schema.CsValueXmlTag.Reader value)
```

Types: [Reader](../CsValueXmlTag/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueXmlTag.Reader value`

<a id="m-which-0b2d23db5ed0"></a>
### which()

```java
public com.tailf.ncs.maapi.Schema.CsValue.Which which()
```

Types: [Which](Which.md#cls-Which)
