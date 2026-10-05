# Factory <a href="#cls-Factory" id="cls-Factory"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValue.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsValue.Builder,com.tailf.ncs.maapi.Schema.CsValue.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-Factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asReader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asReader-053f932dbd84)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructBuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructReader-fbce6f4f912a)
- [getBinary()](Builder.md#m-getBinary-f332a896a1bb) from Builder
- [getBit32()](Builder.md#m-getBit32-27693f0a3df1) from Builder
- [getBit64()](Builder.md#m-getBit64-51ba19e6036e) from Builder
- [getBitbig()](Builder.md#m-getBitbig-ce729847bcfd) from Builder
- [getBool()](Builder.md#m-getBool-bfc6de52d8c0) from Builder
- [getBuf()](Builder.md#m-getBuf-3beb55b0999e) from Builder
- [getCdbBegin()](Builder.md#m-getCdbBegin-de343abd3d60) from Builder
- [getDate()](Builder.md#m-getDate-835e7d70e8d1) from Builder
- [getDatetime()](Builder.md#m-getDatetime-388189505619) from Builder
- [getDecimal64()](Builder.md#m-getDecimal64-193bb466ba33) from Builder
- [getDefault()](Builder.md#m-getDefault-3b99fa7321e2) from Builder
- [getDouble()](Builder.md#m-getDouble-2f3cdb03174e) from Builder
- [getDquad()](Builder.md#m-getDquad-4a29a8e328e2) from Builder
- [getDuration()](Builder.md#m-getDuration-aee615ea7fe2) from Builder
- [getEmpty()](Builder.md#m-getEmpty-500b00e51161) from Builder
- [getEnumValue()](Builder.md#m-getEnumValue-5222f58810c9) from Builder
- [getHexstr()](Builder.md#m-getHexstr-7bdee4ec31cf) from Builder
- [getIdentityref()](Builder.md#m-getIdentityref-da99f3e4419f) from Builder
- [getInt16()](Builder.md#m-getInt16-5744ecc89efb) from Builder
- [getInt32()](Builder.md#m-getInt32-81084bf6c564) from Builder
- [getInt64()](Builder.md#m-getInt64-12855180ebd0) from Builder
- [getInt8()](Builder.md#m-getInt8-f88ea0bcdca8) from Builder
- [getIpv4()](Builder.md#m-getIpv4-9ce1b70400a4) from Builder
- [getIpv4AndPlen()](Builder.md#m-getIpv4AndPlen-6283b58ee146) from Builder
- [getIpv4prefix()](Builder.md#m-getIpv4prefix-01000113e705) from Builder
- [getIpv6()](Builder.md#m-getIpv6-075bb9cd9153) from Builder
- [getIpv6AndPlen()](Builder.md#m-getIpv6AndPlen-de70a17471a3) from Builder
- [getIpv6prefix()](Builder.md#m-getIpv6prefix-474193492c1a) from Builder
- [getList()](Builder.md#m-getList-bb3f8cbe83be) from Builder
- [getNoexists()](Builder.md#m-getNoexists-f692a7fc16f3) from Builder
- [getObjectref()](Builder.md#m-getObjectref-eb216e093ad4) from Builder
- [getOid()](Builder.md#m-getOid-2faa98066d96) from Builder
- [getPtr()](Builder.md#m-getPtr-9b1702eaedfe) from Builder
- [getQname()](Builder.md#m-getQname-022156d42738) from Builder
- [getShallowType()](Builder.md#m-getShallowType-2e2b5f294983) from Builder
- [getStr()](Builder.md#m-getStr-52d1ecf4d92e) from Builder
- [getSymbol()](Builder.md#m-getSymbol-702f4641963e) from Builder
- [getTime()](Builder.md#m-getTime-1429b351f3a0) from Builder
- [getUint16()](Builder.md#m-getUint16-2c1ad5a64222) from Builder
- [getUint32()](Builder.md#m-getUint32-fa11eb2e5b91) from Builder
- [getUint64()](Builder.md#m-getUint64-f84c3cc8734c) from Builder
- [getUint8()](Builder.md#m-getUint8-35a48ed7f6a6) from Builder
- [getUnion()](Builder.md#m-getUnion-09a450ad6ddb) from Builder
- [getUnknown()](Builder.md#m-getUnknown-70adb8ae54c3) from Builder
- [getXmlbegin()](Builder.md#m-getXmlbegin-d03e242d4096) from Builder
- [getXmlbegindel()](Builder.md#m-getXmlbegindel-920a8ac89e37) from Builder
- [getXmlend()](Builder.md#m-getXmlend-ae3cef179327) from Builder
- [getXmlMoveEnd()](Builder.md#m-getXmlMoveEnd-9e767f8514b2) from Builder
- [getXmlMoveFirst()](Builder.md#m-getXmlMoveFirst-580a69a9f9d8) from Builder
- [getXmltag()](Builder.md#m-getXmltag-15a59d5d02ef) from Builder
- [hasBinary()](Builder.md#m-hasBinary-ca7a9e4bd9ff) from Builder
- [hasBuf()](Builder.md#m-hasBuf-89f2325600ad) from Builder
- [hasHexstr()](Builder.md#m-hasHexstr-dcb9d92bfaa7) from Builder
- [hasList()](Builder.md#m-hasList-3712d7ce73ac) from Builder
- [hasObjectref()](Builder.md#m-hasObjectref-a79354acdb9f) from Builder
- [hasOid()](Builder.md#m-hasOid-64b45096c850) from Builder
- [hasStr()](Builder.md#m-hasStr-4da753ffd6f2) from Builder
- [initBinary(int)](Builder.md#m-initBinary-da8376321dd1) from Builder
- [initBitbig()](Builder.md#m-initBitbig-fd6227122084) from Builder
- [initBuf(int)](Builder.md#m-initBuf-283316a1539d) from Builder
- [initDate()](Builder.md#m-initDate-0d1ab510efb2) from Builder
- [initDatetime()](Builder.md#m-initDatetime-e2839d63f272) from Builder
- [initDecimal64()](Builder.md#m-initDecimal64-beda8ac08084) from Builder
- [initDquad()](Builder.md#m-initDquad-27bd6cd9a9ed) from Builder
- [initDuration()](Builder.md#m-initDuration-21d0c79353af) from Builder
- [initHexstr(int)](Builder.md#m-initHexstr-547aec4d26f3) from Builder
- [initIdentityref()](Builder.md#m-initIdentityref-1b5ab2bb6330) from Builder
- [initIpv4()](Builder.md#m-initIpv4-17f92309b472) from Builder
- [initIpv4AndPlen()](Builder.md#m-initIpv4AndPlen-9c9e2cd3eaa1) from Builder
- [initIpv4prefix()](Builder.md#m-initIpv4prefix-b565b6b79384) from Builder
- [initIpv6()](Builder.md#m-initIpv6-36bf15e539f7) from Builder
- [initIpv6AndPlen()](Builder.md#m-initIpv6AndPlen-a9fe90c6f7de) from Builder
- [initIpv6prefix()](Builder.md#m-initIpv6prefix-a2792366b617) from Builder
- [initList(int)](Builder.md#m-initList-619d59db076f) from Builder
- [initObjectref(int)](Builder.md#m-initObjectref-935e26a90e6e) from Builder
- [initOid(int)](Builder.md#m-initOid-715b58cbb921) from Builder
- [initQname()](Builder.md#m-initQname-748564905228) from Builder
- [initStr(int)](Builder.md#m-initStr-af52d7d08f9f) from Builder
- [initSymbol()](Builder.md#m-initSymbol-df0c748a0655) from Builder
- [initTime()](Builder.md#m-initTime-eeed5ea5f00a) from Builder
- [initUnion()](Builder.md#m-initUnion-8c18e3f27de0) from Builder
- [initXmltag()](Builder.md#m-initXmltag-bb2742edf9eb) from Builder
- [isBinary()](Builder.md#m-isBinary-d92620e842a5) from Builder
- [isBit32()](Builder.md#m-isBit32-ae0f1c3885a6) from Builder
- [isBit64()](Builder.md#m-isBit64-2ec3459ff82c) from Builder
- [isBitbig()](Builder.md#m-isBitbig-84cd2f0ebaeb) from Builder
- [isBool()](Builder.md#m-isBool-e771ae3d3e55) from Builder
- [isBuf()](Builder.md#m-isBuf-254af72d81f0) from Builder
- [isCdbBegin()](Builder.md#m-isCdbBegin-aeff9465850d) from Builder
- [isDate()](Builder.md#m-isDate-c423781b293a) from Builder
- [isDatetime()](Builder.md#m-isDatetime-4e79c97b2bd5) from Builder
- [isDecimal64()](Builder.md#m-isDecimal64-fbfc5a5de098) from Builder
- [isDefault()](Builder.md#m-isDefault-9a6b81cd55f6) from Builder
- [isDouble()](Builder.md#m-isDouble-47da85f502c9) from Builder
- [isDquad()](Builder.md#m-isDquad-1986dbac6f44) from Builder
- [isDuration()](Builder.md#m-isDuration-7960407492db) from Builder
- [isEmpty()](Builder.md#m-isEmpty-4dde48126244) from Builder
- [isEnumValue()](Builder.md#m-isEnumValue-b6e22d09884f) from Builder
- [isHexstr()](Builder.md#m-isHexstr-b866520006d5) from Builder
- [isIdentityref()](Builder.md#m-isIdentityref-975db106a225) from Builder
- [isInt16()](Builder.md#m-isInt16-7462eecb083e) from Builder
- [isInt32()](Builder.md#m-isInt32-3341e7603763) from Builder
- [isInt64()](Builder.md#m-isInt64-c54b20486cbe) from Builder
- [isInt8()](Builder.md#m-isInt8-908482a868e0) from Builder
- [isIpv4()](Builder.md#m-isIpv4-f769f8c600b5) from Builder
- [isIpv4AndPlen()](Builder.md#m-isIpv4AndPlen-e1536a127f9e) from Builder
- [isIpv4prefix()](Builder.md#m-isIpv4prefix-7b973eaefa1d) from Builder
- [isIpv6()](Builder.md#m-isIpv6-a32651632b39) from Builder
- [isIpv6AndPlen()](Builder.md#m-isIpv6AndPlen-1963093ce68a) from Builder
- [isIpv6prefix()](Builder.md#m-isIpv6prefix-6dce0b40b9d7) from Builder
- [isList()](Builder.md#m-isList-c36bce63b506) from Builder
- [isNoexists()](Builder.md#m-isNoexists-a1ec13d21a56) from Builder
- [isObjectref()](Builder.md#m-isObjectref-2120317a92dd) from Builder
- [isOid()](Builder.md#m-isOid-368ae9c713d1) from Builder
- [isPtr()](Builder.md#m-isPtr-276f1553635d) from Builder
- [isQname()](Builder.md#m-isQname-79c1cbb01029) from Builder
- [isStr()](Builder.md#m-isStr-81c3840f26d4) from Builder
- [isSymbol()](Builder.md#m-isSymbol-d7206a92c0eb) from Builder
- [isTime()](Builder.md#m-isTime-250a56dbdac5) from Builder
- [isUint16()](Builder.md#m-isUint16-d8c251a40ead) from Builder
- [isUint32()](Builder.md#m-isUint32-fd3a00ffba15) from Builder
- [isUint64()](Builder.md#m-isUint64-ce4ee69a295b) from Builder
- [isUint8()](Builder.md#m-isUint8-9f400b8116f3) from Builder
- [isUnion()](Builder.md#m-isUnion-6183f968c3e8) from Builder
- [isUnknown()](Builder.md#m-isUnknown-88a5b80751a0) from Builder
- [isXmlbegin()](Builder.md#m-isXmlbegin-3a07f5fed3da) from Builder
- [isXmlbegindel()](Builder.md#m-isXmlbegindel-4e1966d82109) from Builder
- [isXmlend()](Builder.md#m-isXmlend-9111f39d186c) from Builder
- [isXmlMoveEnd()](Builder.md#m-isXmlMoveEnd-45ed9b27d7cf) from Builder
- [isXmlMoveFirst()](Builder.md#m-isXmlMoveFirst-7c07b98bd060) from Builder
- [isXmltag()](Builder.md#m-isXmltag-da0707b0ae43) from Builder
- [setBinary(byte[])](Builder.md#m-setBinary-b01c99e75889) from Builder
- [setBinary(Reader)](Builder.md#m-setBinary-8a1cf4ce84a9) from Builder
- [setBit32(int)](Builder.md#m-setBit32-1316fc224e19) from Builder
- [setBit64(long)](Builder.md#m-setBit64-a3a27f6ef6d2) from Builder
- [setBitbig(Reader)](Builder.md#m-setBitbig-a514b9d55ab1) from Builder
- [setBool(boolean)](Builder.md#m-setBool-88160242dcf7) from Builder
- [setBuf(byte[])](Builder.md#m-setBuf-881fa0552479) from Builder
- [setBuf(Reader)](Builder.md#m-setBuf-610948d9381a) from Builder
- [setCdbBegin(Void)](Builder.md#m-setCdbBegin-902391c8a14e) from Builder
- [setDate(Reader)](Builder.md#m-setDate-3bcb9c346567) from Builder
- [setDatetime(Reader)](Builder.md#m-setDatetime-6dc599e86f6a) from Builder
- [setDecimal64(Reader)](Builder.md#m-setDecimal64-7a6a8717701c) from Builder
- [setDefault(Void)](Builder.md#m-setDefault-298bc2ea4f4c) from Builder
- [setDouble(double)](Builder.md#m-setDouble-00357c17ab3e) from Builder
- [setDquad(Reader)](Builder.md#m-setDquad-0ea8faa4deab) from Builder
- [setDuration(Reader)](Builder.md#m-setDuration-c6226971f7aa) from Builder
- [setEmpty(Void)](Builder.md#m-setEmpty-02e106b89f69) from Builder
- [setEnumValue(int)](Builder.md#m-setEnumValue-b69852580f08) from Builder
- [setHexstr(byte[])](Builder.md#m-setHexstr-f501765c9de4) from Builder
- [setHexstr(Reader)](Builder.md#m-setHexstr-d236864650dc) from Builder
- [setIdentityref(Reader)](Builder.md#m-setIdentityref-8c7c2d7f9e09) from Builder
- [setInt16(short)](Builder.md#m-setInt16-50cfe70769f2) from Builder
- [setInt32(int)](Builder.md#m-setInt32-92c50824ef51) from Builder
- [setInt64(long)](Builder.md#m-setInt64-f17f1ec8e04c) from Builder
- [setInt8(byte)](Builder.md#m-setInt8-2ac62944aabe) from Builder
- [setIpv4(Reader)](Builder.md#m-setIpv4-619e62fbc436) from Builder
- [setIpv4AndPlen(Reader)](Builder.md#m-setIpv4AndPlen-93f3be1ab458) from Builder
- [setIpv4prefix(Reader)](Builder.md#m-setIpv4prefix-91794916e9c8) from Builder
- [setIpv6(Reader)](Builder.md#m-setIpv6-5b31d658aa62) from Builder
- [setIpv6AndPlen(Reader)](Builder.md#m-setIpv6AndPlen-99b5b9880429) from Builder
- [setIpv6prefix(Reader)](Builder.md#m-setIpv6prefix-691f4193aeb7) from Builder
- [setList(Reader<Reader>)](Builder.md#m-setList-6e8e469cc90d) from Builder
- [setNoexists(Void)](Builder.md#m-setNoexists-168255f46871) from Builder
- [setObjectref(Reader<Reader>)](Builder.md#m-setObjectref-c835e9918173) from Builder
- [setOid(Reader)](Builder.md#m-setOid-543cdf0a3811) from Builder
- [setPtr(Void)](Builder.md#m-setPtr-3ef5da141ca3) from Builder
- [setQname(Reader)](Builder.md#m-setQname-a6726111b988) from Builder
- [setShallowType(ShallowType)](Builder.md#m-setShallowType-d21ce22018e7) from Builder
- [setStr(Reader)](Builder.md#m-setStr-6d57a5d11cf3) from Builder
- [setStr(String)](Builder.md#m-setStr-21fe97a65221) from Builder
- [setSymbol(Reader)](Builder.md#m-setSymbol-4da320ce2606) from Builder
- [setTime(Reader)](Builder.md#m-setTime-fc6f93bd991e) from Builder
- [setUint16(short)](Builder.md#m-setUint16-043282128543) from Builder
- [setUint32(int)](Builder.md#m-setUint32-0f4bc4823456) from Builder
- [setUint64(long)](Builder.md#m-setUint64-14de0afc3c33) from Builder
- [setUint8(byte)](Builder.md#m-setUint8-a2e25ee00758) from Builder
- [setUnion(Reader)](Builder.md#m-setUnion-f269d70e4284) from Builder
- [setUnknown(Void)](Builder.md#m-setUnknown-6d434acf5507) from Builder
- [setXmlbegin(Void)](Builder.md#m-setXmlbegin-299c46b694bb) from Builder
- [setXmlbegindel(Void)](Builder.md#m-setXmlbegindel-c87f2fa20081) from Builder
- [setXmlend(Void)](Builder.md#m-setXmlend-24c58d6147d3) from Builder
- [setXmlMoveEnd(Void)](Builder.md#m-setXmlMoveEnd-e11b6c17145f) from Builder
- [setXmlMoveFirst(Void)](Builder.md#m-setXmlMoveFirst-3d1233316007) from Builder
- [setXmltag(Reader)](Builder.md#m-setXmltag-b5877e9f93d5) from Builder
- [structSize()](#m-structSize-1fa68dcadd21)
- [which()](Builder.md#m-which-0b2d23db5ed0) from Builder

## Constructors

### Factory() <a href="#m-Factory-0e9f9d7f4e84" id="m-Factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#m-asReader-053f932dbd84" id="m-asReader-053f932dbd84"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsValue.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValue.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#m-constructBuilder-5a2abf3209f9" id="m-constructBuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder constructBuilder(
    org.capnproto.SegmentBuilder segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount
)
```

Types: [Builder](Builder.md#cls-Builder)

**Parameters**

- `org.capnproto.SegmentBuilder segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`

### constructReader(SegmentReader, int, int, int, short, int) <a href="#m-constructReader-fbce6f4f912a" id="m-constructReader-fbce6f4f912a"></a>

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

Types: [Reader](Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`

### structSize() <a href="#m-structSize-1fa68dcadd21" id="m-structSize-1fa68dcadd21"></a>

```java
public final org.capnproto.StructSize structSize()
```
