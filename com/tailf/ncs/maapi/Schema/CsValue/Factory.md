# Factory <a href="#factory-1787784624e8" id="factory-1787784624e8"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValue.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsValue.Builder,com.tailf.ncs.maapi.Schema.CsValue.Reader>
```

Types: [Builder](Builder.md#builder-21f09e83781d), [Reader](Reader.md#reader-b2467a96ddff)

## Members

**Constructors**:

- [Factory\(\)](#factory-0e9f9d7f4e84)

**Methods**:

- [asReader\(\)](Builder.md#asreader-b5c0f2a8d115) from Builder
- [asReader\(Builder\)](#asreader-053f932dbd84)
- [constructBuilder\(SegmentBuilder, int, int, int, short\)](#constructbuilder-5a2abf3209f9)
- [constructReader\(SegmentReader, int, int, int, short, int\)](#constructreader-fbce6f4f912a)
- [getBinary\(\)](Builder.md#getbinary-f332a896a1bb) from Builder
- [getBit32\(\)](Builder.md#getbit32-27693f0a3df1) from Builder
- [getBit64\(\)](Builder.md#getbit64-51ba19e6036e) from Builder
- [getBitbig\(\)](Builder.md#getbitbig-ce729847bcfd) from Builder
- [getBool\(\)](Builder.md#getbool-bfc6de52d8c0) from Builder
- [getBuf\(\)](Builder.md#getbuf-3beb55b0999e) from Builder
- [getCdbBegin\(\)](Builder.md#getcdbbegin-de343abd3d60) from Builder
- [getDate\(\)](Builder.md#getdate-835e7d70e8d1) from Builder
- [getDatetime\(\)](Builder.md#getdatetime-388189505619) from Builder
- [getDecimal64\(\)](Builder.md#getdecimal64-193bb466ba33) from Builder
- [getDefault\(\)](Builder.md#getdefault-3b99fa7321e2) from Builder
- [getDouble\(\)](Builder.md#getdouble-2f3cdb03174e) from Builder
- [getDquad\(\)](Builder.md#getdquad-4a29a8e328e2) from Builder
- [getDuration\(\)](Builder.md#getduration-aee615ea7fe2) from Builder
- [getEmpty\(\)](Builder.md#getempty-500b00e51161) from Builder
- [getEnumValue\(\)](Builder.md#getenumvalue-5222f58810c9) from Builder
- [getHexstr\(\)](Builder.md#gethexstr-7bdee4ec31cf) from Builder
- [getIdentityref\(\)](Builder.md#getidentityref-da99f3e4419f) from Builder
- [getInt16\(\)](Builder.md#getint16-5744ecc89efb) from Builder
- [getInt32\(\)](Builder.md#getint32-81084bf6c564) from Builder
- [getInt64\(\)](Builder.md#getint64-12855180ebd0) from Builder
- [getInt8\(\)](Builder.md#getint8-f88ea0bcdca8) from Builder
- [getIpv4\(\)](Builder.md#getipv4-9ce1b70400a4) from Builder
- [getIpv4AndPlen\(\)](Builder.md#getipv4andplen-6283b58ee146) from Builder
- [getIpv4prefix\(\)](Builder.md#getipv4prefix-01000113e705) from Builder
- [getIpv6\(\)](Builder.md#getipv6-075bb9cd9153) from Builder
- [getIpv6AndPlen\(\)](Builder.md#getipv6andplen-de70a17471a3) from Builder
- [getIpv6prefix\(\)](Builder.md#getipv6prefix-474193492c1a) from Builder
- [getList\(\)](Builder.md#getlist-bb3f8cbe83be) from Builder
- [getNoexists\(\)](Builder.md#getnoexists-f692a7fc16f3) from Builder
- [getObjectref\(\)](Builder.md#getobjectref-eb216e093ad4) from Builder
- [getOid\(\)](Builder.md#getoid-2faa98066d96) from Builder
- [getPtr\(\)](Builder.md#getptr-9b1702eaedfe) from Builder
- [getQname\(\)](Builder.md#getqname-022156d42738) from Builder
- [getShallowType\(\)](Builder.md#getshallowtype-2e2b5f294983) from Builder
- [getStr\(\)](Builder.md#getstr-52d1ecf4d92e) from Builder
- [getSymbol\(\)](Builder.md#getsymbol-702f4641963e) from Builder
- [getTime\(\)](Builder.md#gettime-1429b351f3a0) from Builder
- [getUint16\(\)](Builder.md#getuint16-2c1ad5a64222) from Builder
- [getUint32\(\)](Builder.md#getuint32-fa11eb2e5b91) from Builder
- [getUint64\(\)](Builder.md#getuint64-f84c3cc8734c) from Builder
- [getUint8\(\)](Builder.md#getuint8-35a48ed7f6a6) from Builder
- [getUnion\(\)](Builder.md#getunion-09a450ad6ddb) from Builder
- [getUnknown\(\)](Builder.md#getunknown-70adb8ae54c3) from Builder
- [getXmlbegin\(\)](Builder.md#getxmlbegin-d03e242d4096) from Builder
- [getXmlbegindel\(\)](Builder.md#getxmlbegindel-920a8ac89e37) from Builder
- [getXmlend\(\)](Builder.md#getxmlend-ae3cef179327) from Builder
- [getXmlMoveEnd\(\)](Builder.md#getxmlmoveend-9e767f8514b2) from Builder
- [getXmlMoveFirst\(\)](Builder.md#getxmlmovefirst-580a69a9f9d8) from Builder
- [getXmltag\(\)](Builder.md#getxmltag-15a59d5d02ef) from Builder
- [hasBinary\(\)](Builder.md#hasbinary-ca7a9e4bd9ff) from Builder
- [hasBuf\(\)](Builder.md#hasbuf-89f2325600ad) from Builder
- [hasHexstr\(\)](Builder.md#hashexstr-dcb9d92bfaa7) from Builder
- [hasList\(\)](Builder.md#haslist-3712d7ce73ac) from Builder
- [hasObjectref\(\)](Builder.md#hasobjectref-a79354acdb9f) from Builder
- [hasOid\(\)](Builder.md#hasoid-64b45096c850) from Builder
- [hasStr\(\)](Builder.md#hasstr-4da753ffd6f2) from Builder
- [initBinary\(int\)](Builder.md#initbinary-da8376321dd1) from Builder
- [initBitbig\(\)](Builder.md#initbitbig-fd6227122084) from Builder
- [initBuf\(int\)](Builder.md#initbuf-283316a1539d) from Builder
- [initDate\(\)](Builder.md#initdate-0d1ab510efb2) from Builder
- [initDatetime\(\)](Builder.md#initdatetime-e2839d63f272) from Builder
- [initDecimal64\(\)](Builder.md#initdecimal64-beda8ac08084) from Builder
- [initDquad\(\)](Builder.md#initdquad-27bd6cd9a9ed) from Builder
- [initDuration\(\)](Builder.md#initduration-21d0c79353af) from Builder
- [initHexstr\(int\)](Builder.md#inithexstr-547aec4d26f3) from Builder
- [initIdentityref\(\)](Builder.md#initidentityref-1b5ab2bb6330) from Builder
- [initIpv4\(\)](Builder.md#initipv4-17f92309b472) from Builder
- [initIpv4AndPlen\(\)](Builder.md#initipv4andplen-9c9e2cd3eaa1) from Builder
- [initIpv4prefix\(\)](Builder.md#initipv4prefix-b565b6b79384) from Builder
- [initIpv6\(\)](Builder.md#initipv6-36bf15e539f7) from Builder
- [initIpv6AndPlen\(\)](Builder.md#initipv6andplen-a9fe90c6f7de) from Builder
- [initIpv6prefix\(\)](Builder.md#initipv6prefix-a2792366b617) from Builder
- [initList\(int\)](Builder.md#initlist-619d59db076f) from Builder
- [initObjectref\(int\)](Builder.md#initobjectref-935e26a90e6e) from Builder
- [initOid\(int\)](Builder.md#initoid-715b58cbb921) from Builder
- [initQname\(\)](Builder.md#initqname-748564905228) from Builder
- [initStr\(int\)](Builder.md#initstr-af52d7d08f9f) from Builder
- [initSymbol\(\)](Builder.md#initsymbol-df0c748a0655) from Builder
- [initTime\(\)](Builder.md#inittime-eeed5ea5f00a) from Builder
- [initUnion\(\)](Builder.md#initunion-8c18e3f27de0) from Builder
- [initXmltag\(\)](Builder.md#initxmltag-bb2742edf9eb) from Builder
- [isBinary\(\)](Builder.md#isbinary-d92620e842a5) from Builder
- [isBit32\(\)](Builder.md#isbit32-ae0f1c3885a6) from Builder
- [isBit64\(\)](Builder.md#isbit64-2ec3459ff82c) from Builder
- [isBitbig\(\)](Builder.md#isbitbig-84cd2f0ebaeb) from Builder
- [isBool\(\)](Builder.md#isbool-e771ae3d3e55) from Builder
- [isBuf\(\)](Builder.md#isbuf-254af72d81f0) from Builder
- [isCdbBegin\(\)](Builder.md#iscdbbegin-aeff9465850d) from Builder
- [isDate\(\)](Builder.md#isdate-c423781b293a) from Builder
- [isDatetime\(\)](Builder.md#isdatetime-4e79c97b2bd5) from Builder
- [isDecimal64\(\)](Builder.md#isdecimal64-fbfc5a5de098) from Builder
- [isDefault\(\)](Builder.md#isdefault-9a6b81cd55f6) from Builder
- [isDouble\(\)](Builder.md#isdouble-47da85f502c9) from Builder
- [isDquad\(\)](Builder.md#isdquad-1986dbac6f44) from Builder
- [isDuration\(\)](Builder.md#isduration-7960407492db) from Builder
- [isEmpty\(\)](Builder.md#isempty-4dde48126244) from Builder
- [isEnumValue\(\)](Builder.md#isenumvalue-b6e22d09884f) from Builder
- [isHexstr\(\)](Builder.md#ishexstr-b866520006d5) from Builder
- [isIdentityref\(\)](Builder.md#isidentityref-975db106a225) from Builder
- [isInt16\(\)](Builder.md#isint16-7462eecb083e) from Builder
- [isInt32\(\)](Builder.md#isint32-3341e7603763) from Builder
- [isInt64\(\)](Builder.md#isint64-c54b20486cbe) from Builder
- [isInt8\(\)](Builder.md#isint8-908482a868e0) from Builder
- [isIpv4\(\)](Builder.md#isipv4-f769f8c600b5) from Builder
- [isIpv4AndPlen\(\)](Builder.md#isipv4andplen-e1536a127f9e) from Builder
- [isIpv4prefix\(\)](Builder.md#isipv4prefix-7b973eaefa1d) from Builder
- [isIpv6\(\)](Builder.md#isipv6-a32651632b39) from Builder
- [isIpv6AndPlen\(\)](Builder.md#isipv6andplen-1963093ce68a) from Builder
- [isIpv6prefix\(\)](Builder.md#isipv6prefix-6dce0b40b9d7) from Builder
- [isList\(\)](Builder.md#islist-c36bce63b506) from Builder
- [isNoexists\(\)](Builder.md#isnoexists-a1ec13d21a56) from Builder
- [isObjectref\(\)](Builder.md#isobjectref-2120317a92dd) from Builder
- [isOid\(\)](Builder.md#isoid-368ae9c713d1) from Builder
- [isPtr\(\)](Builder.md#isptr-276f1553635d) from Builder
- [isQname\(\)](Builder.md#isqname-79c1cbb01029) from Builder
- [isStr\(\)](Builder.md#isstr-81c3840f26d4) from Builder
- [isSymbol\(\)](Builder.md#issymbol-d7206a92c0eb) from Builder
- [isTime\(\)](Builder.md#istime-250a56dbdac5) from Builder
- [isUint16\(\)](Builder.md#isuint16-d8c251a40ead) from Builder
- [isUint32\(\)](Builder.md#isuint32-fd3a00ffba15) from Builder
- [isUint64\(\)](Builder.md#isuint64-ce4ee69a295b) from Builder
- [isUint8\(\)](Builder.md#isuint8-9f400b8116f3) from Builder
- [isUnion\(\)](Builder.md#isunion-6183f968c3e8) from Builder
- [isUnknown\(\)](Builder.md#isunknown-88a5b80751a0) from Builder
- [isXmlbegin\(\)](Builder.md#isxmlbegin-3a07f5fed3da) from Builder
- [isXmlbegindel\(\)](Builder.md#isxmlbegindel-4e1966d82109) from Builder
- [isXmlend\(\)](Builder.md#isxmlend-9111f39d186c) from Builder
- [isXmlMoveEnd\(\)](Builder.md#isxmlmoveend-45ed9b27d7cf) from Builder
- [isXmlMoveFirst\(\)](Builder.md#isxmlmovefirst-7c07b98bd060) from Builder
- [isXmltag\(\)](Builder.md#isxmltag-da0707b0ae43) from Builder
- [setBinary\(byte\[\]\)](Builder.md#setbinary-b01c99e75889) from Builder
- [setBinary\(Reader\)](Builder.md#setbinary-8a1cf4ce84a9) from Builder
- [setBit32\(int\)](Builder.md#setbit32-1316fc224e19) from Builder
- [setBit64\(long\)](Builder.md#setbit64-a3a27f6ef6d2) from Builder
- [setBitbig\(Reader\)](Builder.md#setbitbig-a514b9d55ab1) from Builder
- [setBool\(boolean\)](Builder.md#setbool-88160242dcf7) from Builder
- [setBuf\(byte\[\]\)](Builder.md#setbuf-881fa0552479) from Builder
- [setBuf\(Reader\)](Builder.md#setbuf-610948d9381a) from Builder
- [setCdbBegin\(Void\)](Builder.md#setcdbbegin-902391c8a14e) from Builder
- [setDate\(Reader\)](Builder.md#setdate-3bcb9c346567) from Builder
- [setDatetime\(Reader\)](Builder.md#setdatetime-6dc599e86f6a) from Builder
- [setDecimal64\(Reader\)](Builder.md#setdecimal64-7a6a8717701c) from Builder
- [setDefault\(Void\)](Builder.md#setdefault-298bc2ea4f4c) from Builder
- [setDouble\(double\)](Builder.md#setdouble-00357c17ab3e) from Builder
- [setDquad\(Reader\)](Builder.md#setdquad-0ea8faa4deab) from Builder
- [setDuration\(Reader\)](Builder.md#setduration-c6226971f7aa) from Builder
- [setEmpty\(Void\)](Builder.md#setempty-02e106b89f69) from Builder
- [setEnumValue\(int\)](Builder.md#setenumvalue-b69852580f08) from Builder
- [setHexstr\(byte\[\]\)](Builder.md#sethexstr-f501765c9de4) from Builder
- [setHexstr\(Reader\)](Builder.md#sethexstr-d236864650dc) from Builder
- [setIdentityref\(Reader\)](Builder.md#setidentityref-8c7c2d7f9e09) from Builder
- [setInt16\(short\)](Builder.md#setint16-50cfe70769f2) from Builder
- [setInt32\(int\)](Builder.md#setint32-92c50824ef51) from Builder
- [setInt64\(long\)](Builder.md#setint64-f17f1ec8e04c) from Builder
- [setInt8\(byte\)](Builder.md#setint8-2ac62944aabe) from Builder
- [setIpv4\(Reader\)](Builder.md#setipv4-619e62fbc436) from Builder
- [setIpv4AndPlen\(Reader\)](Builder.md#setipv4andplen-93f3be1ab458) from Builder
- [setIpv4prefix\(Reader\)](Builder.md#setipv4prefix-91794916e9c8) from Builder
- [setIpv6\(Reader\)](Builder.md#setipv6-5b31d658aa62) from Builder
- [setIpv6AndPlen\(Reader\)](Builder.md#setipv6andplen-99b5b9880429) from Builder
- [setIpv6prefix\(Reader\)](Builder.md#setipv6prefix-691f4193aeb7) from Builder
- [setList\(Reader\<Reader\>\)](Builder.md#setlist-6e8e469cc90d) from Builder
- [setNoexists\(Void\)](Builder.md#setnoexists-168255f46871) from Builder
- [setObjectref\(Reader\<Reader\>\)](Builder.md#setobjectref-c835e9918173) from Builder
- [setOid\(Reader\)](Builder.md#setoid-543cdf0a3811) from Builder
- [setPtr\(Void\)](Builder.md#setptr-3ef5da141ca3) from Builder
- [setQname\(Reader\)](Builder.md#setqname-a6726111b988) from Builder
- [setShallowType\(ShallowType\)](Builder.md#setshallowtype-d21ce22018e7) from Builder
- [setStr\(Reader\)](Builder.md#setstr-6d57a5d11cf3) from Builder
- [setStr\(String\)](Builder.md#setstr-21fe97a65221) from Builder
- [setSymbol\(Reader\)](Builder.md#setsymbol-4da320ce2606) from Builder
- [setTime\(Reader\)](Builder.md#settime-fc6f93bd991e) from Builder
- [setUint16\(short\)](Builder.md#setuint16-043282128543) from Builder
- [setUint32\(int\)](Builder.md#setuint32-0f4bc4823456) from Builder
- [setUint64\(long\)](Builder.md#setuint64-14de0afc3c33) from Builder
- [setUint8\(byte\)](Builder.md#setuint8-a2e25ee00758) from Builder
- [setUnion\(Reader\)](Builder.md#setunion-f269d70e4284) from Builder
- [setUnknown\(Void\)](Builder.md#setunknown-6d434acf5507) from Builder
- [setXmlbegin\(Void\)](Builder.md#setxmlbegin-299c46b694bb) from Builder
- [setXmlbegindel\(Void\)](Builder.md#setxmlbegindel-c87f2fa20081) from Builder
- [setXmlend\(Void\)](Builder.md#setxmlend-24c58d6147d3) from Builder
- [setXmlMoveEnd\(Void\)](Builder.md#setxmlmoveend-e11b6c17145f) from Builder
- [setXmlMoveFirst\(Void\)](Builder.md#setxmlmovefirst-3d1233316007) from Builder
- [setXmltag\(Reader\)](Builder.md#setxmltag-b5877e9f93d5) from Builder
- [structSize\(\)](#structsize-1fa68dcadd21)
- [which\(\)](Builder.md#which-0b2d23db5ed0) from Builder

## Constructors

### Factory() <a href="#factory-0e9f9d7f4e84" id="factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#asreader-053f932dbd84" id="asreader-053f932dbd84"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsValue.Builder builder
)
```

Types: [Reader](Reader.md#reader-b2467a96ddff), [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValue.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#constructbuilder-5a2abf3209f9" id="constructbuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder constructBuilder(
    org.capnproto.SegmentBuilder segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount
)
```

Types: [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `org.capnproto.SegmentBuilder segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`

### constructReader(SegmentReader, int, int, int, short, int) <a href="#constructreader-fbce6f4f912a" id="constructreader-fbce6f4f912a"></a>

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

Types: [Reader](Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`

### structSize() <a href="#structsize-1fa68dcadd21" id="structsize-1fa68dcadd21"></a>

```java
public final org.capnproto.StructSize structSize()
```
