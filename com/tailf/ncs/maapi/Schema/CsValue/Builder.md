# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValue.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#builder-179fba5038bd)

**Methods**:

- [asReader()](#asreader-b5c0f2a8d115)
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
- [hasBuf()](#hasbuf-89f2325600ad)
- [hasHexstr()](#hashexstr-dcb9d92bfaa7)
- [hasList()](#haslist-3712d7ce73ac)
- [hasObjectref()](#hasobjectref-a79354acdb9f)
- [hasOid()](#hasoid-64b45096c850)
- [hasStr()](#hasstr-4da753ffd6f2)
- [initBinary(int)](#initbinary-da8376321dd1)
- [initBitbig()](#initbitbig-fd6227122084)
- [initBuf(int)](#initbuf-283316a1539d)
- [initDate()](#initdate-0d1ab510efb2)
- [initDatetime()](#initdatetime-e2839d63f272)
- [initDecimal64()](#initdecimal64-beda8ac08084)
- [initDquad()](#initdquad-27bd6cd9a9ed)
- [initDuration()](#initduration-21d0c79353af)
- [initHexstr(int)](#inithexstr-547aec4d26f3)
- [initIdentityref()](#initidentityref-1b5ab2bb6330)
- [initIpv4()](#initipv4-17f92309b472)
- [initIpv4AndPlen()](#initipv4andplen-9c9e2cd3eaa1)
- [initIpv4prefix()](#initipv4prefix-b565b6b79384)
- [initIpv6()](#initipv6-36bf15e539f7)
- [initIpv6AndPlen()](#initipv6andplen-a9fe90c6f7de)
- [initIpv6prefix()](#initipv6prefix-a2792366b617)
- [initList(int)](#initlist-619d59db076f)
- [initObjectref(int)](#initobjectref-935e26a90e6e)
- [initOid(int)](#initoid-715b58cbb921)
- [initQname()](#initqname-748564905228)
- [initStr(int)](#initstr-af52d7d08f9f)
- [initSymbol()](#initsymbol-df0c748a0655)
- [initTime()](#inittime-eeed5ea5f00a)
- [initUnion()](#initunion-8c18e3f27de0)
- [initXmltag()](#initxmltag-bb2742edf9eb)
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
- [setBinary(byte[])](#setbinary-b01c99e75889)
- [setBinary(Reader)](#setbinary-8a1cf4ce84a9)
- [setBit32(int)](#setbit32-1316fc224e19)
- [setBit64(long)](#setbit64-a3a27f6ef6d2)
- [setBitbig(Reader)](#setbitbig-a514b9d55ab1)
- [setBool(boolean)](#setbool-88160242dcf7)
- [setBuf(byte[])](#setbuf-881fa0552479)
- [setBuf(Reader)](#setbuf-610948d9381a)
- [setCdbBegin(Void)](#setcdbbegin-902391c8a14e)
- [setDate(Reader)](#setdate-3bcb9c346567)
- [setDatetime(Reader)](#setdatetime-6dc599e86f6a)
- [setDecimal64(Reader)](#setdecimal64-7a6a8717701c)
- [setDefault(Void)](#setdefault-298bc2ea4f4c)
- [setDouble(double)](#setdouble-00357c17ab3e)
- [setDquad(Reader)](#setdquad-0ea8faa4deab)
- [setDuration(Reader)](#setduration-c6226971f7aa)
- [setEmpty(Void)](#setempty-02e106b89f69)
- [setEnumValue(int)](#setenumvalue-b69852580f08)
- [setHexstr(byte[])](#sethexstr-f501765c9de4)
- [setHexstr(Reader)](#sethexstr-d236864650dc)
- [setIdentityref(Reader)](#setidentityref-8c7c2d7f9e09)
- [setInt16(short)](#setint16-50cfe70769f2)
- [setInt32(int)](#setint32-92c50824ef51)
- [setInt64(long)](#setint64-f17f1ec8e04c)
- [setInt8(byte)](#setint8-2ac62944aabe)
- [setIpv4(Reader)](#setipv4-619e62fbc436)
- [setIpv4AndPlen(Reader)](#setipv4andplen-93f3be1ab458)
- [setIpv4prefix(Reader)](#setipv4prefix-91794916e9c8)
- [setIpv6(Reader)](#setipv6-5b31d658aa62)
- [setIpv6AndPlen(Reader)](#setipv6andplen-99b5b9880429)
- [setIpv6prefix(Reader)](#setipv6prefix-691f4193aeb7)
- [setList(Reader<Reader>)](#setlist-6e8e469cc90d)
- [setNoexists(Void)](#setnoexists-168255f46871)
- [setObjectref(Reader<Reader>)](#setobjectref-c835e9918173)
- [setOid(Reader)](#setoid-543cdf0a3811)
- [setPtr(Void)](#setptr-3ef5da141ca3)
- [setQname(Reader)](#setqname-a6726111b988)
- [setShallowType(ShallowType)](#setshallowtype-d21ce22018e7)
- [setStr(Reader)](#setstr-6d57a5d11cf3)
- [setStr(String)](#setstr-21fe97a65221)
- [setSymbol(Reader)](#setsymbol-4da320ce2606)
- [setTime(Reader)](#settime-fc6f93bd991e)
- [setUint16(short)](#setuint16-043282128543)
- [setUint32(int)](#setuint32-0f4bc4823456)
- [setUint64(long)](#setuint64-14de0afc3c33)
- [setUint8(byte)](#setuint8-a2e25ee00758)
- [setUnion(Reader)](#setunion-f269d70e4284)
- [setUnknown(Void)](#setunknown-6d434acf5507)
- [setXmlbegin(Void)](#setxmlbegin-299c46b694bb)
- [setXmlbegindel(Void)](#setxmlbegindel-c87f2fa20081)
- [setXmlend(Void)](#setxmlend-24c58d6147d3)
- [setXmlMoveEnd(Void)](#setxmlmoveend-e11b6c17145f)
- [setXmlMoveFirst(Void)](#setxmlmovefirst-3d1233316007)
- [setXmltag(Reader)](#setxmltag-b5877e9f93d5)
- [which()](#which-0b2d23db5ed0)

## Constructors

### Builder(SegmentBuilder, int, int, int, short) <a href="#builder-179fba5038bd" id="builder-179fba5038bd"></a>

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

### asReader() <a href="#asreader-b5c0f2a8d115" id="asreader-b5c0f2a8d115"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getBinary() <a href="#getbinary-f332a896a1bb" id="getbinary-f332a896a1bb"></a>

```java
public final org.capnproto.Data.Builder getBinary()
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
public final com.tailf.ncs.maapi.Schema.CsValueBitBig.Builder getBitbig()
```

Types: [Builder](../CsValueBitBig/Builder.md#builder-21f09e83781d)

### getBool() <a href="#getbool-bfc6de52d8c0" id="getbool-bfc6de52d8c0"></a>

```java
public final boolean getBool()
```

### getBuf() <a href="#getbuf-3beb55b0999e" id="getbuf-3beb55b0999e"></a>

```java
public final org.capnproto.Data.Builder getBuf()
```

### getCdbBegin() <a href="#getcdbbegin-de343abd3d60" id="getcdbbegin-de343abd3d60"></a>

```java
public final org.capnproto.Void getCdbBegin()
```

### getDate() <a href="#getdate-835e7d70e8d1" id="getdate-835e7d70e8d1"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDate.Builder getDate()
```

Types: [Builder](../CsValueDate/Builder.md#builder-21f09e83781d)

### getDatetime() <a href="#getdatetime-388189505619" id="getdatetime-388189505619"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDateTime.Builder getDatetime()
```

Types: [Builder](../CsValueDateTime/Builder.md#builder-21f09e83781d)

### getDecimal64() <a href="#getdecimal64-193bb466ba33" id="getdecimal64-193bb466ba33"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDecimal64.Builder getDecimal64()
```

Types: [Builder](../CsValueDecimal64/Builder.md#builder-21f09e83781d)

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
public final com.tailf.ncs.maapi.Schema.CsValueDQuad.Builder getDquad()
```

Types: [Builder](../CsValueDQuad/Builder.md#builder-21f09e83781d)

### getDuration() <a href="#getduration-aee615ea7fe2" id="getduration-aee615ea7fe2"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDuration.Builder getDuration()
```

Types: [Builder](../CsValueDuration/Builder.md#builder-21f09e83781d)

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
public final org.capnproto.Data.Builder getHexstr()
```

### getIdentityref() <a href="#getidentityref-da99f3e4419f" id="getidentityref-da99f3e4419f"></a>

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder getIdentityref()
```

Types: [Builder](../QTag/Builder.md#builder-21f09e83781d)

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
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder getIpv4()
```

Types: [Builder](../CsValueIPv4Prefix/Builder.md#builder-21f09e83781d)

### getIpv4AndPlen() <a href="#getipv4andplen-6283b58ee146" id="getipv4andplen-6283b58ee146"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder getIpv4AndPlen()
```

Types: [Builder](../CsValueIPv4Prefix/Builder.md#builder-21f09e83781d)

### getIpv4prefix() <a href="#getipv4prefix-01000113e705" id="getipv4prefix-01000113e705"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder getIpv4prefix()
```

Types: [Builder](../CsValueIPv4Prefix/Builder.md#builder-21f09e83781d)

### getIpv6() <a href="#getipv6-075bb9cd9153" id="getipv6-075bb9cd9153"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder getIpv6()
```

Types: [Builder](../CsValueIPv6Prefix/Builder.md#builder-21f09e83781d)

### getIpv6AndPlen() <a href="#getipv6andplen-de70a17471a3" id="getipv6andplen-de70a17471a3"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder getIpv6AndPlen()
```

Types: [Builder](../CsValueIPv6Prefix/Builder.md#builder-21f09e83781d)

### getIpv6prefix() <a href="#getipv6prefix-474193492c1a" id="getipv6prefix-474193492c1a"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder getIpv6prefix()
```

Types: [Builder](../CsValueIPv6Prefix/Builder.md#builder-21f09e83781d)

### getList() <a href="#getlist-bb3f8cbe83be" id="getlist-bb3f8cbe83be"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsValue.Builder> getList()
```

Types: [Builder](Builder.md#builder-21f09e83781d)

### getNoexists() <a href="#getnoexists-f692a7fc16f3" id="getnoexists-f692a7fc16f3"></a>

```java
public final org.capnproto.Void getNoexists()
```

### getObjectref() <a href="#getobjectref-eb216e093ad4" id="getobjectref-eb216e093ad4"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsValue.Builder> getObjectref()
```

Types: [Builder](Builder.md#builder-21f09e83781d)

### getOid() <a href="#getoid-2faa98066d96" id="getoid-2faa98066d96"></a>

```java
public final org.capnproto.PrimitiveList.Long.Builder getOid()
```

### getPtr() <a href="#getptr-9b1702eaedfe" id="getptr-9b1702eaedfe"></a>

```java
public final org.capnproto.Void getPtr()
```

### getQname() <a href="#getqname-022156d42738" id="getqname-022156d42738"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueQName.Builder getQname()
```

Types: [Builder](../CsValueQName/Builder.md#builder-21f09e83781d)

### getShallowType() <a href="#getshallowtype-2e2b5f294983" id="getshallowtype-2e2b5f294983"></a>

```java
public final com.tailf.ncs.maapi.Schema.ShallowType getShallowType()
```

Types: [ShallowType](../ShallowType.md#shallowtype-736a38acb289)

### getStr() <a href="#getstr-52d1ecf4d92e" id="getstr-52d1ecf4d92e"></a>

```java
public final org.capnproto.Text.Builder getStr()
```

### getSymbol() <a href="#getsymbol-702f4641963e" id="getsymbol-702f4641963e"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueSymbol.Builder getSymbol()
```

Types: [Builder](../CsValueSymbol/Builder.md#builder-21f09e83781d)

### getTime() <a href="#gettime-1429b351f3a0" id="gettime-1429b351f3a0"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueTime.Builder getTime()
```

Types: [Builder](../CsValueTime/Builder.md#builder-21f09e83781d)

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
public final com.tailf.ncs.maapi.Schema.CsValue.Builder getUnion()
```

Types: [Builder](Builder.md#builder-21f09e83781d)

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
public final com.tailf.ncs.maapi.Schema.CsValueXmlTag.Builder getXmltag()
```

Types: [Builder](../CsValueXmlTag/Builder.md#builder-21f09e83781d)

### hasBinary() <a href="#hasbinary-ca7a9e4bd9ff" id="hasbinary-ca7a9e4bd9ff"></a>

```java
public final boolean hasBinary()
```

### hasBuf() <a href="#hasbuf-89f2325600ad" id="hasbuf-89f2325600ad"></a>

```java
public final boolean hasBuf()
```

### hasHexstr() <a href="#hashexstr-dcb9d92bfaa7" id="hashexstr-dcb9d92bfaa7"></a>

```java
public final boolean hasHexstr()
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

### hasStr() <a href="#hasstr-4da753ffd6f2" id="hasstr-4da753ffd6f2"></a>

```java
public final boolean hasStr()
```

### initBinary(int) <a href="#initbinary-da8376321dd1" id="initbinary-da8376321dd1"></a>

```java
public final org.capnproto.Data.Builder initBinary(int size)
```

**Parameters**

- `int size`

### initBitbig() <a href="#initbitbig-fd6227122084" id="initbitbig-fd6227122084"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueBitBig.Builder initBitbig()
```

Types: [Builder](../CsValueBitBig/Builder.md#builder-21f09e83781d)

### initBuf(int) <a href="#initbuf-283316a1539d" id="initbuf-283316a1539d"></a>

```java
public final org.capnproto.Data.Builder initBuf(int size)
```

**Parameters**

- `int size`

### initDate() <a href="#initdate-0d1ab510efb2" id="initdate-0d1ab510efb2"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDate.Builder initDate()
```

Types: [Builder](../CsValueDate/Builder.md#builder-21f09e83781d)

### initDatetime() <a href="#initdatetime-e2839d63f272" id="initdatetime-e2839d63f272"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDateTime.Builder initDatetime()
```

Types: [Builder](../CsValueDateTime/Builder.md#builder-21f09e83781d)

### initDecimal64() <a href="#initdecimal64-beda8ac08084" id="initdecimal64-beda8ac08084"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDecimal64.Builder initDecimal64()
```

Types: [Builder](../CsValueDecimal64/Builder.md#builder-21f09e83781d)

### initDquad() <a href="#initdquad-27bd6cd9a9ed" id="initdquad-27bd6cd9a9ed"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDQuad.Builder initDquad()
```

Types: [Builder](../CsValueDQuad/Builder.md#builder-21f09e83781d)

### initDuration() <a href="#initduration-21d0c79353af" id="initduration-21d0c79353af"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDuration.Builder initDuration()
```

Types: [Builder](../CsValueDuration/Builder.md#builder-21f09e83781d)

### initHexstr(int) <a href="#inithexstr-547aec4d26f3" id="inithexstr-547aec4d26f3"></a>

```java
public final org.capnproto.Data.Builder initHexstr(int size)
```

**Parameters**

- `int size`

### initIdentityref() <a href="#initidentityref-1b5ab2bb6330" id="initidentityref-1b5ab2bb6330"></a>

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder initIdentityref()
```

Types: [Builder](../QTag/Builder.md#builder-21f09e83781d)

### initIpv4() <a href="#initipv4-17f92309b472" id="initipv4-17f92309b472"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder initIpv4()
```

Types: [Builder](../CsValueIPv4Prefix/Builder.md#builder-21f09e83781d)

### initIpv4AndPlen() <a href="#initipv4andplen-9c9e2cd3eaa1" id="initipv4andplen-9c9e2cd3eaa1"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder initIpv4AndPlen()
```

Types: [Builder](../CsValueIPv4Prefix/Builder.md#builder-21f09e83781d)

### initIpv4prefix() <a href="#initipv4prefix-b565b6b79384" id="initipv4prefix-b565b6b79384"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder initIpv4prefix()
```

Types: [Builder](../CsValueIPv4Prefix/Builder.md#builder-21f09e83781d)

### initIpv6() <a href="#initipv6-36bf15e539f7" id="initipv6-36bf15e539f7"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder initIpv6()
```

Types: [Builder](../CsValueIPv6Prefix/Builder.md#builder-21f09e83781d)

### initIpv6AndPlen() <a href="#initipv6andplen-a9fe90c6f7de" id="initipv6andplen-a9fe90c6f7de"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder initIpv6AndPlen()
```

Types: [Builder](../CsValueIPv6Prefix/Builder.md#builder-21f09e83781d)

### initIpv6prefix() <a href="#initipv6prefix-a2792366b617" id="initipv6prefix-a2792366b617"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder initIpv6prefix()
```

Types: [Builder](../CsValueIPv6Prefix/Builder.md#builder-21f09e83781d)

### initList(int) <a href="#initlist-619d59db076f" id="initlist-619d59db076f"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsValue.Builder> initList(
    int size
)
```

Types: [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `int size`

### initObjectref(int) <a href="#initobjectref-935e26a90e6e" id="initobjectref-935e26a90e6e"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsValue.Builder> initObjectref(
    int size
)
```

Types: [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `int size`

### initOid(int) <a href="#initoid-715b58cbb921" id="initoid-715b58cbb921"></a>

```java
public final org.capnproto.PrimitiveList.Long.Builder initOid(int size)
```

**Parameters**

- `int size`

### initQname() <a href="#initqname-748564905228" id="initqname-748564905228"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueQName.Builder initQname()
```

Types: [Builder](../CsValueQName/Builder.md#builder-21f09e83781d)

### initStr(int) <a href="#initstr-af52d7d08f9f" id="initstr-af52d7d08f9f"></a>

```java
public final org.capnproto.Text.Builder initStr(int size)
```

**Parameters**

- `int size`

### initSymbol() <a href="#initsymbol-df0c748a0655" id="initsymbol-df0c748a0655"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueSymbol.Builder initSymbol()
```

Types: [Builder](../CsValueSymbol/Builder.md#builder-21f09e83781d)

### initTime() <a href="#inittime-eeed5ea5f00a" id="inittime-eeed5ea5f00a"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueTime.Builder initTime()
```

Types: [Builder](../CsValueTime/Builder.md#builder-21f09e83781d)

### initUnion() <a href="#initunion-8c18e3f27de0" id="initunion-8c18e3f27de0"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder initUnion()
```

Types: [Builder](Builder.md#builder-21f09e83781d)

### initXmltag() <a href="#initxmltag-bb2742edf9eb" id="initxmltag-bb2742edf9eb"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueXmlTag.Builder initXmltag()
```

Types: [Builder](../CsValueXmlTag/Builder.md#builder-21f09e83781d)

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

### setBinary(byte[]) <a href="#setbinary-b01c99e75889" id="setbinary-b01c99e75889"></a>

```java
public final void setBinary(byte[] value)
```

**Parameters**

- `byte[] value`

### setBinary(Reader) <a href="#setbinary-8a1cf4ce84a9" id="setbinary-8a1cf4ce84a9"></a>

```java
public final void setBinary(org.capnproto.Data.Reader value)
```

**Parameters**

- `org.capnproto.Data.Reader value`

### setBit32(int) <a href="#setbit32-1316fc224e19" id="setbit32-1316fc224e19"></a>

```java
public final void setBit32(int value)
```

**Parameters**

- `int value`

### setBit64(long) <a href="#setbit64-a3a27f6ef6d2" id="setbit64-a3a27f6ef6d2"></a>

```java
public final void setBit64(long value)
```

**Parameters**

- `long value`

### setBitbig(Reader) <a href="#setbitbig-a514b9d55ab1" id="setbitbig-a514b9d55ab1"></a>

```java
public final void setBitbig(com.tailf.ncs.maapi.Schema.CsValueBitBig.Reader value)
```

Types: [Reader](../CsValueBitBig/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueBitBig.Reader value`

### setBool(boolean) <a href="#setbool-88160242dcf7" id="setbool-88160242dcf7"></a>

```java
public final void setBool(boolean value)
```

**Parameters**

- `boolean value`

### setBuf(byte[]) <a href="#setbuf-881fa0552479" id="setbuf-881fa0552479"></a>

```java
public final void setBuf(byte[] value)
```

**Parameters**

- `byte[] value`

### setBuf(Reader) <a href="#setbuf-610948d9381a" id="setbuf-610948d9381a"></a>

```java
public final void setBuf(org.capnproto.Data.Reader value)
```

**Parameters**

- `org.capnproto.Data.Reader value`

### setCdbBegin(Void) <a href="#setcdbbegin-902391c8a14e" id="setcdbbegin-902391c8a14e"></a>

```java
public final void setCdbBegin(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setDate(Reader) <a href="#setdate-3bcb9c346567" id="setdate-3bcb9c346567"></a>

```java
public final void setDate(com.tailf.ncs.maapi.Schema.CsValueDate.Reader value)
```

Types: [Reader](../CsValueDate/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDate.Reader value`

### setDatetime(Reader) <a href="#setdatetime-6dc599e86f6a" id="setdatetime-6dc599e86f6a"></a>

```java
public final void setDatetime(com.tailf.ncs.maapi.Schema.CsValueDateTime.Reader value)
```

Types: [Reader](../CsValueDateTime/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDateTime.Reader value`

### setDecimal64(Reader) <a href="#setdecimal64-7a6a8717701c" id="setdecimal64-7a6a8717701c"></a>

```java
public final void setDecimal64(com.tailf.ncs.maapi.Schema.CsValueDecimal64.Reader value)
```

Types: [Reader](../CsValueDecimal64/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDecimal64.Reader value`

### setDefault(Void) <a href="#setdefault-298bc2ea4f4c" id="setdefault-298bc2ea4f4c"></a>

```java
public final void setDefault(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setDouble(double) <a href="#setdouble-00357c17ab3e" id="setdouble-00357c17ab3e"></a>

```java
public final void setDouble(double value)
```

**Parameters**

- `double value`

### setDquad(Reader) <a href="#setdquad-0ea8faa4deab" id="setdquad-0ea8faa4deab"></a>

```java
public final void setDquad(com.tailf.ncs.maapi.Schema.CsValueDQuad.Reader value)
```

Types: [Reader](../CsValueDQuad/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDQuad.Reader value`

### setDuration(Reader) <a href="#setduration-c6226971f7aa" id="setduration-c6226971f7aa"></a>

```java
public final void setDuration(com.tailf.ncs.maapi.Schema.CsValueDuration.Reader value)
```

Types: [Reader](../CsValueDuration/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDuration.Reader value`

### setEmpty(Void) <a href="#setempty-02e106b89f69" id="setempty-02e106b89f69"></a>

```java
public final void setEmpty(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setEnumValue(int) <a href="#setenumvalue-b69852580f08" id="setenumvalue-b69852580f08"></a>

```java
public final void setEnumValue(int value)
```

**Parameters**

- `int value`

### setHexstr(byte[]) <a href="#sethexstr-f501765c9de4" id="sethexstr-f501765c9de4"></a>

```java
public final void setHexstr(byte[] value)
```

**Parameters**

- `byte[] value`

### setHexstr(Reader) <a href="#sethexstr-d236864650dc" id="sethexstr-d236864650dc"></a>

```java
public final void setHexstr(org.capnproto.Data.Reader value)
```

**Parameters**

- `org.capnproto.Data.Reader value`

### setIdentityref(Reader) <a href="#setidentityref-8c7c2d7f9e09" id="setidentityref-8c7c2d7f9e09"></a>

```java
public final void setIdentityref(com.tailf.ncs.maapi.Schema.QTag.Reader value)
```

Types: [Reader](../QTag/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.QTag.Reader value`

### setInt16(short) <a href="#setint16-50cfe70769f2" id="setint16-50cfe70769f2"></a>

```java
public final void setInt16(short value)
```

**Parameters**

- `short value`

### setInt32(int) <a href="#setint32-92c50824ef51" id="setint32-92c50824ef51"></a>

```java
public final void setInt32(int value)
```

**Parameters**

- `int value`

### setInt64(long) <a href="#setint64-f17f1ec8e04c" id="setint64-f17f1ec8e04c"></a>

```java
public final void setInt64(long value)
```

**Parameters**

- `long value`

### setInt8(byte) <a href="#setint8-2ac62944aabe" id="setint8-2ac62944aabe"></a>

```java
public final void setInt8(byte value)
```

**Parameters**

- `byte value`

### setIpv4(Reader) <a href="#setipv4-619e62fbc436" id="setipv4-619e62fbc436"></a>

```java
public final void setIpv4(com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader value)
```

Types: [Reader](../CsValueIPv4Prefix/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader value`

### setIpv4AndPlen(Reader) <a href="#setipv4andplen-93f3be1ab458" id="setipv4andplen-93f3be1ab458"></a>

```java
public final void setIpv4AndPlen(com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader value)
```

Types: [Reader](../CsValueIPv4Prefix/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader value`

### setIpv4prefix(Reader) <a href="#setipv4prefix-91794916e9c8" id="setipv4prefix-91794916e9c8"></a>

```java
public final void setIpv4prefix(com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader value)
```

Types: [Reader](../CsValueIPv4Prefix/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader value`

### setIpv6(Reader) <a href="#setipv6-5b31d658aa62" id="setipv6-5b31d658aa62"></a>

```java
public final void setIpv6(com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader value)
```

Types: [Reader](../CsValueIPv6Prefix/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader value`

### setIpv6AndPlen(Reader) <a href="#setipv6andplen-99b5b9880429" id="setipv6andplen-99b5b9880429"></a>

```java
public final void setIpv6AndPlen(com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader value)
```

Types: [Reader](../CsValueIPv6Prefix/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader value`

### setIpv6prefix(Reader) <a href="#setipv6prefix-691f4193aeb7" id="setipv6prefix-691f4193aeb7"></a>

```java
public final void setIpv6prefix(com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader value)
```

Types: [Reader](../CsValueIPv6Prefix/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader value`

### setList(Reader&lt;Reader&gt;) <a href="#setlist-6e8e469cc90d" id="setlist-6e8e469cc90d"></a>

```java
public final void setList(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsValue.Reader> value
)
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsValue.Reader> value`

### setNoexists(Void) <a href="#setnoexists-168255f46871" id="setnoexists-168255f46871"></a>

```java
public final void setNoexists(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setObjectref(Reader&lt;Reader&gt;) <a href="#setobjectref-c835e9918173" id="setobjectref-c835e9918173"></a>

```java
public final void setObjectref(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsValue.Reader> value
)
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsValue.Reader> value`

### setOid(Reader) <a href="#setoid-543cdf0a3811" id="setoid-543cdf0a3811"></a>

```java
public final void setOid(org.capnproto.PrimitiveList.Long.Reader value)
```

**Parameters**

- `org.capnproto.PrimitiveList.Long.Reader value`

### setPtr(Void) <a href="#setptr-3ef5da141ca3" id="setptr-3ef5da141ca3"></a>

```java
public final void setPtr(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setQname(Reader) <a href="#setqname-a6726111b988" id="setqname-a6726111b988"></a>

```java
public final void setQname(com.tailf.ncs.maapi.Schema.CsValueQName.Reader value)
```

Types: [Reader](../CsValueQName/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueQName.Reader value`

### setShallowType(ShallowType) <a href="#setshallowtype-d21ce22018e7" id="setshallowtype-d21ce22018e7"></a>

```java
public final void setShallowType(com.tailf.ncs.maapi.Schema.ShallowType value)
```

Types: [ShallowType](../ShallowType.md#shallowtype-736a38acb289)

**Parameters**

- `com.tailf.ncs.maapi.Schema.ShallowType value`

### setStr(Reader) <a href="#setstr-6d57a5d11cf3" id="setstr-6d57a5d11cf3"></a>

```java
public final void setStr(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setStr(String) <a href="#setstr-21fe97a65221" id="setstr-21fe97a65221"></a>

```java
public final void setStr(String value)
```

**Parameters**

- `String value`

### setSymbol(Reader) <a href="#setsymbol-4da320ce2606" id="setsymbol-4da320ce2606"></a>

```java
public final void setSymbol(com.tailf.ncs.maapi.Schema.CsValueSymbol.Reader value)
```

Types: [Reader](../CsValueSymbol/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueSymbol.Reader value`

### setTime(Reader) <a href="#settime-fc6f93bd991e" id="settime-fc6f93bd991e"></a>

```java
public final void setTime(com.tailf.ncs.maapi.Schema.CsValueTime.Reader value)
```

Types: [Reader](../CsValueTime/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueTime.Reader value`

### setUint16(short) <a href="#setuint16-043282128543" id="setuint16-043282128543"></a>

```java
public final void setUint16(short value)
```

**Parameters**

- `short value`

### setUint32(int) <a href="#setuint32-0f4bc4823456" id="setuint32-0f4bc4823456"></a>

```java
public final void setUint32(int value)
```

**Parameters**

- `int value`

### setUint64(long) <a href="#setuint64-14de0afc3c33" id="setuint64-14de0afc3c33"></a>

```java
public final void setUint64(long value)
```

**Parameters**

- `long value`

### setUint8(byte) <a href="#setuint8-a2e25ee00758" id="setuint8-a2e25ee00758"></a>

```java
public final void setUint8(byte value)
```

**Parameters**

- `byte value`

### setUnion(Reader) <a href="#setunion-f269d70e4284" id="setunion-f269d70e4284"></a>

```java
public final void setUnion(com.tailf.ncs.maapi.Schema.CsValue.Reader value)
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValue.Reader value`

### setUnknown(Void) <a href="#setunknown-6d434acf5507" id="setunknown-6d434acf5507"></a>

```java
public final void setUnknown(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setXmlbegin(Void) <a href="#setxmlbegin-299c46b694bb" id="setxmlbegin-299c46b694bb"></a>

```java
public final void setXmlbegin(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setXmlbegindel(Void) <a href="#setxmlbegindel-c87f2fa20081" id="setxmlbegindel-c87f2fa20081"></a>

```java
public final void setXmlbegindel(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setXmlend(Void) <a href="#setxmlend-24c58d6147d3" id="setxmlend-24c58d6147d3"></a>

```java
public final void setXmlend(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setXmlMoveEnd(Void) <a href="#setxmlmoveend-e11b6c17145f" id="setxmlmoveend-e11b6c17145f"></a>

```java
public final void setXmlMoveEnd(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setXmlMoveFirst(Void) <a href="#setxmlmovefirst-3d1233316007" id="setxmlmovefirst-3d1233316007"></a>

```java
public final void setXmlMoveFirst(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setXmltag(Reader) <a href="#setxmltag-b5877e9f93d5" id="setxmltag-b5877e9f93d5"></a>

```java
public final void setXmltag(com.tailf.ncs.maapi.Schema.CsValueXmlTag.Reader value)
```

Types: [Reader](../CsValueXmlTag/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueXmlTag.Reader value`

### which() <a href="#which-0b2d23db5ed0" id="which-0b2d23db5ed0"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValue.Which which()
```

Types: [Which](Which.md#which-92b652653aa7)
