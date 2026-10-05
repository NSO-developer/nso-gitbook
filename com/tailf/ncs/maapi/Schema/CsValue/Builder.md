# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValue.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
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
- [hasBuf()](#m-hasBuf-89f2325600ad)
- [hasHexstr()](#m-hasHexstr-dcb9d92bfaa7)
- [hasList()](#m-hasList-3712d7ce73ac)
- [hasObjectref()](#m-hasObjectref-a79354acdb9f)
- [hasOid()](#m-hasOid-64b45096c850)
- [hasStr()](#m-hasStr-4da753ffd6f2)
- [initBinary(int)](#m-initBinary-da8376321dd1)
- [initBitbig()](#m-initBitbig-fd6227122084)
- [initBuf(int)](#m-initBuf-283316a1539d)
- [initDate()](#m-initDate-0d1ab510efb2)
- [initDatetime()](#m-initDatetime-e2839d63f272)
- [initDecimal64()](#m-initDecimal64-beda8ac08084)
- [initDquad()](#m-initDquad-27bd6cd9a9ed)
- [initDuration()](#m-initDuration-21d0c79353af)
- [initHexstr(int)](#m-initHexstr-547aec4d26f3)
- [initIdentityref()](#m-initIdentityref-1b5ab2bb6330)
- [initIpv4()](#m-initIpv4-17f92309b472)
- [initIpv4AndPlen()](#m-initIpv4AndPlen-9c9e2cd3eaa1)
- [initIpv4prefix()](#m-initIpv4prefix-b565b6b79384)
- [initIpv6()](#m-initIpv6-36bf15e539f7)
- [initIpv6AndPlen()](#m-initIpv6AndPlen-a9fe90c6f7de)
- [initIpv6prefix()](#m-initIpv6prefix-a2792366b617)
- [initList(int)](#m-initList-619d59db076f)
- [initObjectref(int)](#m-initObjectref-935e26a90e6e)
- [initOid(int)](#m-initOid-715b58cbb921)
- [initQname()](#m-initQname-748564905228)
- [initStr(int)](#m-initStr-af52d7d08f9f)
- [initSymbol()](#m-initSymbol-df0c748a0655)
- [initTime()](#m-initTime-eeed5ea5f00a)
- [initUnion()](#m-initUnion-8c18e3f27de0)
- [initXmltag()](#m-initXmltag-bb2742edf9eb)
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
- [setBinary(byte[])](#m-setBinary-b01c99e75889)
- [setBinary(Reader)](#m-setBinary-8a1cf4ce84a9)
- [setBit32(int)](#m-setBit32-1316fc224e19)
- [setBit64(long)](#m-setBit64-a3a27f6ef6d2)
- [setBitbig(Reader)](#m-setBitbig-a514b9d55ab1)
- [setBool(boolean)](#m-setBool-88160242dcf7)
- [setBuf(byte[])](#m-setBuf-881fa0552479)
- [setBuf(Reader)](#m-setBuf-610948d9381a)
- [setCdbBegin(Void)](#m-setCdbBegin-902391c8a14e)
- [setDate(Reader)](#m-setDate-3bcb9c346567)
- [setDatetime(Reader)](#m-setDatetime-6dc599e86f6a)
- [setDecimal64(Reader)](#m-setDecimal64-7a6a8717701c)
- [setDefault(Void)](#m-setDefault-298bc2ea4f4c)
- [setDouble(double)](#m-setDouble-00357c17ab3e)
- [setDquad(Reader)](#m-setDquad-0ea8faa4deab)
- [setDuration(Reader)](#m-setDuration-c6226971f7aa)
- [setEmpty(Void)](#m-setEmpty-02e106b89f69)
- [setEnumValue(int)](#m-setEnumValue-b69852580f08)
- [setHexstr(byte[])](#m-setHexstr-f501765c9de4)
- [setHexstr(Reader)](#m-setHexstr-d236864650dc)
- [setIdentityref(Reader)](#m-setIdentityref-8c7c2d7f9e09)
- [setInt16(short)](#m-setInt16-50cfe70769f2)
- [setInt32(int)](#m-setInt32-92c50824ef51)
- [setInt64(long)](#m-setInt64-f17f1ec8e04c)
- [setInt8(byte)](#m-setInt8-2ac62944aabe)
- [setIpv4(Reader)](#m-setIpv4-619e62fbc436)
- [setIpv4AndPlen(Reader)](#m-setIpv4AndPlen-93f3be1ab458)
- [setIpv4prefix(Reader)](#m-setIpv4prefix-91794916e9c8)
- [setIpv6(Reader)](#m-setIpv6-5b31d658aa62)
- [setIpv6AndPlen(Reader)](#m-setIpv6AndPlen-99b5b9880429)
- [setIpv6prefix(Reader)](#m-setIpv6prefix-691f4193aeb7)
- [setList(Reader<Reader>)](#m-setList-6e8e469cc90d)
- [setNoexists(Void)](#m-setNoexists-168255f46871)
- [setObjectref(Reader<Reader>)](#m-setObjectref-c835e9918173)
- [setOid(Reader)](#m-setOid-543cdf0a3811)
- [setPtr(Void)](#m-setPtr-3ef5da141ca3)
- [setQname(Reader)](#m-setQname-a6726111b988)
- [setShallowType(ShallowType)](#m-setShallowType-d21ce22018e7)
- [setStr(Reader)](#m-setStr-6d57a5d11cf3)
- [setStr(String)](#m-setStr-21fe97a65221)
- [setSymbol(Reader)](#m-setSymbol-4da320ce2606)
- [setTime(Reader)](#m-setTime-fc6f93bd991e)
- [setUint16(short)](#m-setUint16-043282128543)
- [setUint32(int)](#m-setUint32-0f4bc4823456)
- [setUint64(long)](#m-setUint64-14de0afc3c33)
- [setUint8(byte)](#m-setUint8-a2e25ee00758)
- [setUnion(Reader)](#m-setUnion-f269d70e4284)
- [setUnknown(Void)](#m-setUnknown-6d434acf5507)
- [setXmlbegin(Void)](#m-setXmlbegin-299c46b694bb)
- [setXmlbegindel(Void)](#m-setXmlbegindel-c87f2fa20081)
- [setXmlend(Void)](#m-setXmlend-24c58d6147d3)
- [setXmlMoveEnd(Void)](#m-setXmlMoveEnd-e11b6c17145f)
- [setXmlMoveFirst(Void)](#m-setXmlMoveFirst-3d1233316007)
- [setXmltag(Reader)](#m-setXmltag-b5877e9f93d5)
- [which()](#m-which-0b2d23db5ed0)

## Constructors

### Builder(SegmentBuilder, int, int, int, short) <a href="#m-Builder-179fba5038bd" id="m-Builder-179fba5038bd"></a>

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

### asReader() <a href="#m-asReader-b5c0f2a8d115" id="m-asReader-b5c0f2a8d115"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getBinary() <a href="#m-getBinary-f332a896a1bb" id="m-getBinary-f332a896a1bb"></a>

```java
public final org.capnproto.Data.Builder getBinary()
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
public final com.tailf.ncs.maapi.Schema.CsValueBitBig.Builder getBitbig()
```

Types: [Builder](../CsValueBitBig/Builder.md#cls-Builder)

### getBool() <a href="#m-getBool-bfc6de52d8c0" id="m-getBool-bfc6de52d8c0"></a>

```java
public final boolean getBool()
```

### getBuf() <a href="#m-getBuf-3beb55b0999e" id="m-getBuf-3beb55b0999e"></a>

```java
public final org.capnproto.Data.Builder getBuf()
```

### getCdbBegin() <a href="#m-getCdbBegin-de343abd3d60" id="m-getCdbBegin-de343abd3d60"></a>

```java
public final org.capnproto.Void getCdbBegin()
```

### getDate() <a href="#m-getDate-835e7d70e8d1" id="m-getDate-835e7d70e8d1"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDate.Builder getDate()
```

Types: [Builder](../CsValueDate/Builder.md#cls-Builder)

### getDatetime() <a href="#m-getDatetime-388189505619" id="m-getDatetime-388189505619"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDateTime.Builder getDatetime()
```

Types: [Builder](../CsValueDateTime/Builder.md#cls-Builder)

### getDecimal64() <a href="#m-getDecimal64-193bb466ba33" id="m-getDecimal64-193bb466ba33"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDecimal64.Builder getDecimal64()
```

Types: [Builder](../CsValueDecimal64/Builder.md#cls-Builder)

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
public final com.tailf.ncs.maapi.Schema.CsValueDQuad.Builder getDquad()
```

Types: [Builder](../CsValueDQuad/Builder.md#cls-Builder)

### getDuration() <a href="#m-getDuration-aee615ea7fe2" id="m-getDuration-aee615ea7fe2"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDuration.Builder getDuration()
```

Types: [Builder](../CsValueDuration/Builder.md#cls-Builder)

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
public final org.capnproto.Data.Builder getHexstr()
```

### getIdentityref() <a href="#m-getIdentityref-da99f3e4419f" id="m-getIdentityref-da99f3e4419f"></a>

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder getIdentityref()
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

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
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder getIpv4()
```

Types: [Builder](../CsValueIPv4Prefix/Builder.md#cls-Builder)

### getIpv4AndPlen() <a href="#m-getIpv4AndPlen-6283b58ee146" id="m-getIpv4AndPlen-6283b58ee146"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder getIpv4AndPlen()
```

Types: [Builder](../CsValueIPv4Prefix/Builder.md#cls-Builder)

### getIpv4prefix() <a href="#m-getIpv4prefix-01000113e705" id="m-getIpv4prefix-01000113e705"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder getIpv4prefix()
```

Types: [Builder](../CsValueIPv4Prefix/Builder.md#cls-Builder)

### getIpv6() <a href="#m-getIpv6-075bb9cd9153" id="m-getIpv6-075bb9cd9153"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder getIpv6()
```

Types: [Builder](../CsValueIPv6Prefix/Builder.md#cls-Builder)

### getIpv6AndPlen() <a href="#m-getIpv6AndPlen-de70a17471a3" id="m-getIpv6AndPlen-de70a17471a3"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder getIpv6AndPlen()
```

Types: [Builder](../CsValueIPv6Prefix/Builder.md#cls-Builder)

### getIpv6prefix() <a href="#m-getIpv6prefix-474193492c1a" id="m-getIpv6prefix-474193492c1a"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder getIpv6prefix()
```

Types: [Builder](../CsValueIPv6Prefix/Builder.md#cls-Builder)

### getList() <a href="#m-getList-bb3f8cbe83be" id="m-getList-bb3f8cbe83be"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsValue.Builder> getList()
```

Types: [Builder](Builder.md#cls-Builder)

### getNoexists() <a href="#m-getNoexists-f692a7fc16f3" id="m-getNoexists-f692a7fc16f3"></a>

```java
public final org.capnproto.Void getNoexists()
```

### getObjectref() <a href="#m-getObjectref-eb216e093ad4" id="m-getObjectref-eb216e093ad4"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsValue.Builder> getObjectref()
```

Types: [Builder](Builder.md#cls-Builder)

### getOid() <a href="#m-getOid-2faa98066d96" id="m-getOid-2faa98066d96"></a>

```java
public final org.capnproto.PrimitiveList.Long.Builder getOid()
```

### getPtr() <a href="#m-getPtr-9b1702eaedfe" id="m-getPtr-9b1702eaedfe"></a>

```java
public final org.capnproto.Void getPtr()
```

### getQname() <a href="#m-getQname-022156d42738" id="m-getQname-022156d42738"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueQName.Builder getQname()
```

Types: [Builder](../CsValueQName/Builder.md#cls-Builder)

### getShallowType() <a href="#m-getShallowType-2e2b5f294983" id="m-getShallowType-2e2b5f294983"></a>

```java
public final com.tailf.ncs.maapi.Schema.ShallowType getShallowType()
```

Types: [ShallowType](../ShallowType.md#cls-ShallowType)

### getStr() <a href="#m-getStr-52d1ecf4d92e" id="m-getStr-52d1ecf4d92e"></a>

```java
public final org.capnproto.Text.Builder getStr()
```

### getSymbol() <a href="#m-getSymbol-702f4641963e" id="m-getSymbol-702f4641963e"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueSymbol.Builder getSymbol()
```

Types: [Builder](../CsValueSymbol/Builder.md#cls-Builder)

### getTime() <a href="#m-getTime-1429b351f3a0" id="m-getTime-1429b351f3a0"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueTime.Builder getTime()
```

Types: [Builder](../CsValueTime/Builder.md#cls-Builder)

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
public final com.tailf.ncs.maapi.Schema.CsValue.Builder getUnion()
```

Types: [Builder](Builder.md#cls-Builder)

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
public final com.tailf.ncs.maapi.Schema.CsValueXmlTag.Builder getXmltag()
```

Types: [Builder](../CsValueXmlTag/Builder.md#cls-Builder)

### hasBinary() <a href="#m-hasBinary-ca7a9e4bd9ff" id="m-hasBinary-ca7a9e4bd9ff"></a>

```java
public final boolean hasBinary()
```

### hasBuf() <a href="#m-hasBuf-89f2325600ad" id="m-hasBuf-89f2325600ad"></a>

```java
public final boolean hasBuf()
```

### hasHexstr() <a href="#m-hasHexstr-dcb9d92bfaa7" id="m-hasHexstr-dcb9d92bfaa7"></a>

```java
public final boolean hasHexstr()
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

### hasStr() <a href="#m-hasStr-4da753ffd6f2" id="m-hasStr-4da753ffd6f2"></a>

```java
public final boolean hasStr()
```

### initBinary(int) <a href="#m-initBinary-da8376321dd1" id="m-initBinary-da8376321dd1"></a>

```java
public final org.capnproto.Data.Builder initBinary(int size)
```

**Parameters**

- `int size`

### initBitbig() <a href="#m-initBitbig-fd6227122084" id="m-initBitbig-fd6227122084"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueBitBig.Builder initBitbig()
```

Types: [Builder](../CsValueBitBig/Builder.md#cls-Builder)

### initBuf(int) <a href="#m-initBuf-283316a1539d" id="m-initBuf-283316a1539d"></a>

```java
public final org.capnproto.Data.Builder initBuf(int size)
```

**Parameters**

- `int size`

### initDate() <a href="#m-initDate-0d1ab510efb2" id="m-initDate-0d1ab510efb2"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDate.Builder initDate()
```

Types: [Builder](../CsValueDate/Builder.md#cls-Builder)

### initDatetime() <a href="#m-initDatetime-e2839d63f272" id="m-initDatetime-e2839d63f272"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDateTime.Builder initDatetime()
```

Types: [Builder](../CsValueDateTime/Builder.md#cls-Builder)

### initDecimal64() <a href="#m-initDecimal64-beda8ac08084" id="m-initDecimal64-beda8ac08084"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDecimal64.Builder initDecimal64()
```

Types: [Builder](../CsValueDecimal64/Builder.md#cls-Builder)

### initDquad() <a href="#m-initDquad-27bd6cd9a9ed" id="m-initDquad-27bd6cd9a9ed"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDQuad.Builder initDquad()
```

Types: [Builder](../CsValueDQuad/Builder.md#cls-Builder)

### initDuration() <a href="#m-initDuration-21d0c79353af" id="m-initDuration-21d0c79353af"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueDuration.Builder initDuration()
```

Types: [Builder](../CsValueDuration/Builder.md#cls-Builder)

### initHexstr(int) <a href="#m-initHexstr-547aec4d26f3" id="m-initHexstr-547aec4d26f3"></a>

```java
public final org.capnproto.Data.Builder initHexstr(int size)
```

**Parameters**

- `int size`

### initIdentityref() <a href="#m-initIdentityref-1b5ab2bb6330" id="m-initIdentityref-1b5ab2bb6330"></a>

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder initIdentityref()
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

### initIpv4() <a href="#m-initIpv4-17f92309b472" id="m-initIpv4-17f92309b472"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder initIpv4()
```

Types: [Builder](../CsValueIPv4Prefix/Builder.md#cls-Builder)

### initIpv4AndPlen() <a href="#m-initIpv4AndPlen-9c9e2cd3eaa1" id="m-initIpv4AndPlen-9c9e2cd3eaa1"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder initIpv4AndPlen()
```

Types: [Builder](../CsValueIPv4Prefix/Builder.md#cls-Builder)

### initIpv4prefix() <a href="#m-initIpv4prefix-b565b6b79384" id="m-initIpv4prefix-b565b6b79384"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder initIpv4prefix()
```

Types: [Builder](../CsValueIPv4Prefix/Builder.md#cls-Builder)

### initIpv6() <a href="#m-initIpv6-36bf15e539f7" id="m-initIpv6-36bf15e539f7"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder initIpv6()
```

Types: [Builder](../CsValueIPv6Prefix/Builder.md#cls-Builder)

### initIpv6AndPlen() <a href="#m-initIpv6AndPlen-a9fe90c6f7de" id="m-initIpv6AndPlen-a9fe90c6f7de"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder initIpv6AndPlen()
```

Types: [Builder](../CsValueIPv6Prefix/Builder.md#cls-Builder)

### initIpv6prefix() <a href="#m-initIpv6prefix-a2792366b617" id="m-initIpv6prefix-a2792366b617"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder initIpv6prefix()
```

Types: [Builder](../CsValueIPv6Prefix/Builder.md#cls-Builder)

### initList(int) <a href="#m-initList-619d59db076f" id="m-initList-619d59db076f"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsValue.Builder> initList(
    int size
)
```

Types: [Builder](Builder.md#cls-Builder)

**Parameters**

- `int size`

### initObjectref(int) <a href="#m-initObjectref-935e26a90e6e" id="m-initObjectref-935e26a90e6e"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsValue.Builder> initObjectref(
    int size
)
```

Types: [Builder](Builder.md#cls-Builder)

**Parameters**

- `int size`

### initOid(int) <a href="#m-initOid-715b58cbb921" id="m-initOid-715b58cbb921"></a>

```java
public final org.capnproto.PrimitiveList.Long.Builder initOid(int size)
```

**Parameters**

- `int size`

### initQname() <a href="#m-initQname-748564905228" id="m-initQname-748564905228"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueQName.Builder initQname()
```

Types: [Builder](../CsValueQName/Builder.md#cls-Builder)

### initStr(int) <a href="#m-initStr-af52d7d08f9f" id="m-initStr-af52d7d08f9f"></a>

```java
public final org.capnproto.Text.Builder initStr(int size)
```

**Parameters**

- `int size`

### initSymbol() <a href="#m-initSymbol-df0c748a0655" id="m-initSymbol-df0c748a0655"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueSymbol.Builder initSymbol()
```

Types: [Builder](../CsValueSymbol/Builder.md#cls-Builder)

### initTime() <a href="#m-initTime-eeed5ea5f00a" id="m-initTime-eeed5ea5f00a"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueTime.Builder initTime()
```

Types: [Builder](../CsValueTime/Builder.md#cls-Builder)

### initUnion() <a href="#m-initUnion-8c18e3f27de0" id="m-initUnion-8c18e3f27de0"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder initUnion()
```

Types: [Builder](Builder.md#cls-Builder)

### initXmltag() <a href="#m-initXmltag-bb2742edf9eb" id="m-initXmltag-bb2742edf9eb"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueXmlTag.Builder initXmltag()
```

Types: [Builder](../CsValueXmlTag/Builder.md#cls-Builder)

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

### setBinary(byte[]) <a href="#m-setBinary-b01c99e75889" id="m-setBinary-b01c99e75889"></a>

```java
public final void setBinary(byte[] value)
```

**Parameters**

- `byte[] value`

### setBinary(Reader) <a href="#m-setBinary-8a1cf4ce84a9" id="m-setBinary-8a1cf4ce84a9"></a>

```java
public final void setBinary(org.capnproto.Data.Reader value)
```

**Parameters**

- `org.capnproto.Data.Reader value`

### setBit32(int) <a href="#m-setBit32-1316fc224e19" id="m-setBit32-1316fc224e19"></a>

```java
public final void setBit32(int value)
```

**Parameters**

- `int value`

### setBit64(long) <a href="#m-setBit64-a3a27f6ef6d2" id="m-setBit64-a3a27f6ef6d2"></a>

```java
public final void setBit64(long value)
```

**Parameters**

- `long value`

### setBitbig(Reader) <a href="#m-setBitbig-a514b9d55ab1" id="m-setBitbig-a514b9d55ab1"></a>

```java
public final void setBitbig(com.tailf.ncs.maapi.Schema.CsValueBitBig.Reader value)
```

Types: [Reader](../CsValueBitBig/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueBitBig.Reader value`

### setBool(boolean) <a href="#m-setBool-88160242dcf7" id="m-setBool-88160242dcf7"></a>

```java
public final void setBool(boolean value)
```

**Parameters**

- `boolean value`

### setBuf(byte[]) <a href="#m-setBuf-881fa0552479" id="m-setBuf-881fa0552479"></a>

```java
public final void setBuf(byte[] value)
```

**Parameters**

- `byte[] value`

### setBuf(Reader) <a href="#m-setBuf-610948d9381a" id="m-setBuf-610948d9381a"></a>

```java
public final void setBuf(org.capnproto.Data.Reader value)
```

**Parameters**

- `org.capnproto.Data.Reader value`

### setCdbBegin(Void) <a href="#m-setCdbBegin-902391c8a14e" id="m-setCdbBegin-902391c8a14e"></a>

```java
public final void setCdbBegin(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setDate(Reader) <a href="#m-setDate-3bcb9c346567" id="m-setDate-3bcb9c346567"></a>

```java
public final void setDate(com.tailf.ncs.maapi.Schema.CsValueDate.Reader value)
```

Types: [Reader](../CsValueDate/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDate.Reader value`

### setDatetime(Reader) <a href="#m-setDatetime-6dc599e86f6a" id="m-setDatetime-6dc599e86f6a"></a>

```java
public final void setDatetime(com.tailf.ncs.maapi.Schema.CsValueDateTime.Reader value)
```

Types: [Reader](../CsValueDateTime/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDateTime.Reader value`

### setDecimal64(Reader) <a href="#m-setDecimal64-7a6a8717701c" id="m-setDecimal64-7a6a8717701c"></a>

```java
public final void setDecimal64(com.tailf.ncs.maapi.Schema.CsValueDecimal64.Reader value)
```

Types: [Reader](../CsValueDecimal64/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDecimal64.Reader value`

### setDefault(Void) <a href="#m-setDefault-298bc2ea4f4c" id="m-setDefault-298bc2ea4f4c"></a>

```java
public final void setDefault(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setDouble(double) <a href="#m-setDouble-00357c17ab3e" id="m-setDouble-00357c17ab3e"></a>

```java
public final void setDouble(double value)
```

**Parameters**

- `double value`

### setDquad(Reader) <a href="#m-setDquad-0ea8faa4deab" id="m-setDquad-0ea8faa4deab"></a>

```java
public final void setDquad(com.tailf.ncs.maapi.Schema.CsValueDQuad.Reader value)
```

Types: [Reader](../CsValueDQuad/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDQuad.Reader value`

### setDuration(Reader) <a href="#m-setDuration-c6226971f7aa" id="m-setDuration-c6226971f7aa"></a>

```java
public final void setDuration(com.tailf.ncs.maapi.Schema.CsValueDuration.Reader value)
```

Types: [Reader](../CsValueDuration/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDuration.Reader value`

### setEmpty(Void) <a href="#m-setEmpty-02e106b89f69" id="m-setEmpty-02e106b89f69"></a>

```java
public final void setEmpty(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setEnumValue(int) <a href="#m-setEnumValue-b69852580f08" id="m-setEnumValue-b69852580f08"></a>

```java
public final void setEnumValue(int value)
```

**Parameters**

- `int value`

### setHexstr(byte[]) <a href="#m-setHexstr-f501765c9de4" id="m-setHexstr-f501765c9de4"></a>

```java
public final void setHexstr(byte[] value)
```

**Parameters**

- `byte[] value`

### setHexstr(Reader) <a href="#m-setHexstr-d236864650dc" id="m-setHexstr-d236864650dc"></a>

```java
public final void setHexstr(org.capnproto.Data.Reader value)
```

**Parameters**

- `org.capnproto.Data.Reader value`

### setIdentityref(Reader) <a href="#m-setIdentityref-8c7c2d7f9e09" id="m-setIdentityref-8c7c2d7f9e09"></a>

```java
public final void setIdentityref(com.tailf.ncs.maapi.Schema.QTag.Reader value)
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.QTag.Reader value`

### setInt16(short) <a href="#m-setInt16-50cfe70769f2" id="m-setInt16-50cfe70769f2"></a>

```java
public final void setInt16(short value)
```

**Parameters**

- `short value`

### setInt32(int) <a href="#m-setInt32-92c50824ef51" id="m-setInt32-92c50824ef51"></a>

```java
public final void setInt32(int value)
```

**Parameters**

- `int value`

### setInt64(long) <a href="#m-setInt64-f17f1ec8e04c" id="m-setInt64-f17f1ec8e04c"></a>

```java
public final void setInt64(long value)
```

**Parameters**

- `long value`

### setInt8(byte) <a href="#m-setInt8-2ac62944aabe" id="m-setInt8-2ac62944aabe"></a>

```java
public final void setInt8(byte value)
```

**Parameters**

- `byte value`

### setIpv4(Reader) <a href="#m-setIpv4-619e62fbc436" id="m-setIpv4-619e62fbc436"></a>

```java
public final void setIpv4(com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader value)
```

Types: [Reader](../CsValueIPv4Prefix/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader value`

### setIpv4AndPlen(Reader) <a href="#m-setIpv4AndPlen-93f3be1ab458" id="m-setIpv4AndPlen-93f3be1ab458"></a>

```java
public final void setIpv4AndPlen(com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader value)
```

Types: [Reader](../CsValueIPv4Prefix/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader value`

### setIpv4prefix(Reader) <a href="#m-setIpv4prefix-91794916e9c8" id="m-setIpv4prefix-91794916e9c8"></a>

```java
public final void setIpv4prefix(com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader value)
```

Types: [Reader](../CsValueIPv4Prefix/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader value`

### setIpv6(Reader) <a href="#m-setIpv6-5b31d658aa62" id="m-setIpv6-5b31d658aa62"></a>

```java
public final void setIpv6(com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader value)
```

Types: [Reader](../CsValueIPv6Prefix/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader value`

### setIpv6AndPlen(Reader) <a href="#m-setIpv6AndPlen-99b5b9880429" id="m-setIpv6AndPlen-99b5b9880429"></a>

```java
public final void setIpv6AndPlen(com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader value)
```

Types: [Reader](../CsValueIPv6Prefix/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader value`

### setIpv6prefix(Reader) <a href="#m-setIpv6prefix-691f4193aeb7" id="m-setIpv6prefix-691f4193aeb7"></a>

```java
public final void setIpv6prefix(com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader value)
```

Types: [Reader](../CsValueIPv6Prefix/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader value`

### setList(Reader<Reader>) <a href="#m-setList-6e8e469cc90d" id="m-setList-6e8e469cc90d"></a>

```java
public final void setList(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsValue.Reader> value
)
```

Types: [Reader](Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsValue.Reader> value`

### setNoexists(Void) <a href="#m-setNoexists-168255f46871" id="m-setNoexists-168255f46871"></a>

```java
public final void setNoexists(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setObjectref(Reader<Reader>) <a href="#m-setObjectref-c835e9918173" id="m-setObjectref-c835e9918173"></a>

```java
public final void setObjectref(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsValue.Reader> value
)
```

Types: [Reader](Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsValue.Reader> value`

### setOid(Reader) <a href="#m-setOid-543cdf0a3811" id="m-setOid-543cdf0a3811"></a>

```java
public final void setOid(org.capnproto.PrimitiveList.Long.Reader value)
```

**Parameters**

- `org.capnproto.PrimitiveList.Long.Reader value`

### setPtr(Void) <a href="#m-setPtr-3ef5da141ca3" id="m-setPtr-3ef5da141ca3"></a>

```java
public final void setPtr(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setQname(Reader) <a href="#m-setQname-a6726111b988" id="m-setQname-a6726111b988"></a>

```java
public final void setQname(com.tailf.ncs.maapi.Schema.CsValueQName.Reader value)
```

Types: [Reader](../CsValueQName/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueQName.Reader value`

### setShallowType(ShallowType) <a href="#m-setShallowType-d21ce22018e7" id="m-setShallowType-d21ce22018e7"></a>

```java
public final void setShallowType(com.tailf.ncs.maapi.Schema.ShallowType value)
```

Types: [ShallowType](../ShallowType.md#cls-ShallowType)

**Parameters**

- `com.tailf.ncs.maapi.Schema.ShallowType value`

### setStr(Reader) <a href="#m-setStr-6d57a5d11cf3" id="m-setStr-6d57a5d11cf3"></a>

```java
public final void setStr(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setStr(String) <a href="#m-setStr-21fe97a65221" id="m-setStr-21fe97a65221"></a>

```java
public final void setStr(String value)
```

**Parameters**

- `String value`

### setSymbol(Reader) <a href="#m-setSymbol-4da320ce2606" id="m-setSymbol-4da320ce2606"></a>

```java
public final void setSymbol(com.tailf.ncs.maapi.Schema.CsValueSymbol.Reader value)
```

Types: [Reader](../CsValueSymbol/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueSymbol.Reader value`

### setTime(Reader) <a href="#m-setTime-fc6f93bd991e" id="m-setTime-fc6f93bd991e"></a>

```java
public final void setTime(com.tailf.ncs.maapi.Schema.CsValueTime.Reader value)
```

Types: [Reader](../CsValueTime/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueTime.Reader value`

### setUint16(short) <a href="#m-setUint16-043282128543" id="m-setUint16-043282128543"></a>

```java
public final void setUint16(short value)
```

**Parameters**

- `short value`

### setUint32(int) <a href="#m-setUint32-0f4bc4823456" id="m-setUint32-0f4bc4823456"></a>

```java
public final void setUint32(int value)
```

**Parameters**

- `int value`

### setUint64(long) <a href="#m-setUint64-14de0afc3c33" id="m-setUint64-14de0afc3c33"></a>

```java
public final void setUint64(long value)
```

**Parameters**

- `long value`

### setUint8(byte) <a href="#m-setUint8-a2e25ee00758" id="m-setUint8-a2e25ee00758"></a>

```java
public final void setUint8(byte value)
```

**Parameters**

- `byte value`

### setUnion(Reader) <a href="#m-setUnion-f269d70e4284" id="m-setUnion-f269d70e4284"></a>

```java
public final void setUnion(com.tailf.ncs.maapi.Schema.CsValue.Reader value)
```

Types: [Reader](Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValue.Reader value`

### setUnknown(Void) <a href="#m-setUnknown-6d434acf5507" id="m-setUnknown-6d434acf5507"></a>

```java
public final void setUnknown(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setXmlbegin(Void) <a href="#m-setXmlbegin-299c46b694bb" id="m-setXmlbegin-299c46b694bb"></a>

```java
public final void setXmlbegin(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setXmlbegindel(Void) <a href="#m-setXmlbegindel-c87f2fa20081" id="m-setXmlbegindel-c87f2fa20081"></a>

```java
public final void setXmlbegindel(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setXmlend(Void) <a href="#m-setXmlend-24c58d6147d3" id="m-setXmlend-24c58d6147d3"></a>

```java
public final void setXmlend(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setXmlMoveEnd(Void) <a href="#m-setXmlMoveEnd-e11b6c17145f" id="m-setXmlMoveEnd-e11b6c17145f"></a>

```java
public final void setXmlMoveEnd(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setXmlMoveFirst(Void) <a href="#m-setXmlMoveFirst-3d1233316007" id="m-setXmlMoveFirst-3d1233316007"></a>

```java
public final void setXmlMoveFirst(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### setXmltag(Reader) <a href="#m-setXmltag-b5877e9f93d5" id="m-setXmltag-b5877e9f93d5"></a>

```java
public final void setXmltag(com.tailf.ncs.maapi.Schema.CsValueXmlTag.Reader value)
```

Types: [Reader](../CsValueXmlTag/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueXmlTag.Reader value`

### which() <a href="#m-which-0b2d23db5ed0" id="m-which-0b2d23db5ed0"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValue.Which which()
```

Types: [Which](Which.md#cls-Which)
