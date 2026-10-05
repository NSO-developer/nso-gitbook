# ConfIPv4AndPrefixLen <a href="#confipv4andprefixlen-0d777e73ddb4" id="confipv4andprefixlen-0d777e73ddb4"></a>

```java
public class com.tailf.conf.ConfIPv4AndPrefixLen
    extends com.tailf.conf.ConfIPAndPrefixLen
    implements Comparable<com.tailf.conf.ConfIPv4AndPrefixLen>
```

Types: [ConfIPAndPrefixLen](ConfIPAndPrefixLen.md#confipandprefixlen-dbeb26ceb9c7), [ConfIPv4AndPrefixLen](ConfIPv4AndPrefixLen.md#confipv4andprefixlen-0d777e73ddb4)

DATA_CONTAINER - Corresponds to the YANG tailf:ipv4-address-and-prefix-length
 type.



```
  type string {
    pattern
         '(([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.){3}'
      +  '([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])'
      + '/(([0-9])|([1-2][0-9])|(3[0-2]))';
  }
```



 The ipv4-address-and-prefix-length type represents a combination
 of an IPv4 address and a prefix length. The prefix length is given
 by the number following the slash character and must be less than
 or equal to 32.

## Members

**Constructors**:

- [ConfIPv4AndPrefixLen\(ConfEObject\)](#confipv4andprefixlen-962ee5671c96)
- [ConfIPv4AndPrefixLen\(InetAddress, int\)](#confipv4andprefixlen-8931002cbdee)
- [ConfIPv4AndPrefixLen\(int, int, int, int, int\)](#confipv4andprefixlen-d9c901e81504)
- [ConfIPv4AndPrefixLen\(int\[\], int\)](#confipv4andprefixlen-ca9c18efdf00)
- [ConfIPv4AndPrefixLen\(String\)](#confipv4andprefixlen-499d9149453d)

**Fields**:

- [J\_BINARY](ConfObject.md#j_binary-f4395337afc2) from ConfObject
- [J\_BIT32](ConfObject.md#j_bit32-40251205e2bd) from ConfObject
- [J\_BIT64](ConfObject.md#j_bit64-15d68e666b90) from ConfObject
- [J\_BITBIG](ConfObject.md#j_bitbig-835affd18d2b) from ConfObject
- [J\_BOOL](ConfObject.md#j_bool-fa62aa9e1544) from ConfObject
- [J\_BUF](ConfObject.md#j_buf-d1b0b08b798f) from ConfObject
- [J\_CDBBEGIN](ConfObject.md#j_cdbbegin-07a4f9eca5c4) from ConfObject
- [J\_DATE](ConfObject.md#j_date-00cc8f6e70e6) from ConfObject
- [J\_DATETIME](ConfObject.md#j_datetime-573fe6a9a577) from ConfObject
- [J\_DECIMAL64](ConfObject.md#j_decimal64-ff02afe47ff7) from ConfObject
- [J\_DEFAULT](ConfObject.md#j_default-54b54b027809) from ConfObject
- [J\_DOUBLE](ConfObject.md#j_double-ade902bbb1aa) from ConfObject
- [J\_DQUAD](ConfObject.md#j_dquad-852ab4ec2848) from ConfObject
- [J\_DURATION](ConfObject.md#j_duration-98ef58bed1c0) from ConfObject
- [J\_EMPTY](ConfObject.md#j_empty-cca63c6cd2c7) from ConfObject
- [J\_ENUMERATION](ConfObject.md#j_enumeration-47c69754d29b) from ConfObject
- [J\_HEXSTR](ConfObject.md#j_hexstr-90b6b86efe7b) from ConfObject
- [J\_IDENTITYREF](ConfObject.md#j_identityref-977d471383c5) from ConfObject
- [J\_INSTANCE\_IDENTIFIER](ConfObject.md#j_instance_identifier-bbb4b8e5e954) from ConfObject
- [J\_INT16](ConfObject.md#j_int16-4f9df234cba7) from ConfObject
- [J\_INT32](ConfObject.md#j_int32-db4c66331284) from ConfObject
- [J\_INT64](ConfObject.md#j_int64-c290a7cb2e11) from ConfObject
- [J\_INT8](ConfObject.md#j_int8-8f73ffef0f12) from ConfObject
- [J\_IPV4](ConfObject.md#j_ipv4-54fdc3efb49b) from ConfObject
- [J\_IPV4\_AND\_PLEN](ConfObject.md#j_ipv4_and_plen-69b1e630ab12) from ConfObject
- [J\_IPV4PREFIX](ConfObject.md#j_ipv4prefix-d36121ba89ca) from ConfObject
- [J\_IPV6](ConfObject.md#j_ipv6-03903b354701) from ConfObject
- [J\_IPV6\_AND\_PLEN](ConfObject.md#j_ipv6_and_plen-ac1054abbf31) from ConfObject
- [J\_IPV6PREFIX](ConfObject.md#j_ipv6prefix-5e95c6e896d2) from ConfObject
- [J\_LIST](ConfObject.md#j_list-d74b9f073fdc) from ConfObject
- [J\_NOEXISTS](ConfObject.md#j_noexists-1f0f9b7a9591) from ConfObject
- [J\_OBJECTREF](ConfObject.md#j_objectref-577d14956cc8) from ConfObject
- [J\_OID](ConfObject.md#j_oid-2d504f7432b3) from ConfObject
- [J\_PTR](ConfObject.md#j_ptr-ef54b9484cab) from ConfObject
- [J\_QNAME](ConfObject.md#j_qname-0d2839adff4c) from ConfObject
- [J\_STR](ConfObject.md#j_str-ae3bb3034983) from ConfObject
- [J\_SYMBOL](ConfObject.md#j_symbol-25fd3742c374) from ConfObject
- [J\_TIME](ConfObject.md#j_time-3ecdebfb0af5) from ConfObject
- [J\_UINT16](ConfObject.md#j_uint16-1f95eafb4126) from ConfObject
- [J\_UINT32](ConfObject.md#j_uint32-200f00c0ee05) from ConfObject
- [J\_UINT64](ConfObject.md#j_uint64-6960c783d61f) from ConfObject
- [J\_UINT8](ConfObject.md#j_uint8-ab0567c53d7f) from ConfObject
- [J\_UNION](ConfObject.md#j_union-7c548945cda0) from ConfObject
- [J\_XMLBEGIN](ConfObject.md#j_xmlbegin-6b887ec4c61b) from ConfObject
- [J\_XMLBEGINDEL](ConfObject.md#j_xmlbegindel-6c4d37088d90) from ConfObject
- [J\_XMLEND](ConfObject.md#j_xmlend-e2b443858058) from ConfObject
- [J\_XMLMOVEAFTER](ConfObject.md#j_xmlmoveafter-e7f2fed6d94d) from ConfObject
- [J\_XMLMOVEFIRST](ConfObject.md#j_xmlmovefirst-776c36719f23) from ConfObject
- [J\_XMLTAG](ConfObject.md#j_xmltag-0a12f537271e) from ConfObject

**Methods**:

- [clone\(\)](ConfObject.md#clone-164c86c45e9b) from ConfObject
- [compare\(ConfObject, ConfObject\)](ConfObject.md#compare-e78552baa2bf) from ConfObject
- [compareTo\(ConfIPv4AndPrefixLen\)](#compareto-01179e8df384)
- [decode\(ConfEObject\)](ConfObject.md#decode-609792d36602) from ConfObject
- [decode\(ConfEObject, ConfPath\)](ConfObject.md#decode-a814ebf64edc) from ConfObject
- [decode\(ConfEObject, String\)](ConfObject.md#decode-9b92f1de40d8) from ConfObject
- [encode\(\)](#encode-fbae522bba37)
- [equals\(Object\)](#equals-fcd6492e0d6c)
- [getAddress\(\)](#getaddress-08b11cceec4c)
- [getMaskLength\(\)](#getmasklength-c45d44e26e53)
- [getRawAddress\(\)](#getrawaddress-2dacae94069b)
- [getStringByValue\(ConfPath, ConfValue\)](ConfValue.md#getstringbyvalue-841fa68ad0f9) from ConfValue
- [getStringByValue\(String, ConfValue\)](ConfValue.md#getstringbyvalue-8ed173dcf8dc) from ConfValue
- [getValueByString\(ConfPath, String\)](ConfValue.md#getvaluebystring-e75fd0337a87) from ConfValue
- [getValueByString\(String, String\)](ConfValue.md#getvaluebystring-7804643cb027) from ConfValue
- [hashCode\(\)](#hashcode-ef797a217903)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### ConfIPv4AndPrefixLen(ConfEObject) <a href="#confipv4andprefixlen-962ee5671c96" id="confipv4andprefixlen-962ee5671c96"></a>

```java
public ConfIPv4AndPrefixLen(com.tailf.proto.ConfEObject v) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.proto.ConfEObject v`

### ConfIPv4AndPrefixLen(InetAddress, int) <a href="#confipv4andprefixlen-8931002cbdee" id="confipv4andprefixlen-8931002cbdee"></a>

```java
public ConfIPv4AndPrefixLen(java.net.InetAddress addr, int masklen)
```

**Parameters**

- `java.net.InetAddress addr`
- `int masklen`

### ConfIPv4AndPrefixLen(int, int, int, int, int) <a href="#confipv4andprefixlen-d9c901e81504" id="confipv4andprefixlen-d9c901e81504"></a>

```java
public ConfIPv4AndPrefixLen(int a, int b, int c, int d, int masklen)
```

**Parameters**

- `int a`
- `int b`
- `int c`
- `int d`
- `int masklen`

### ConfIPv4AndPrefixLen(int[], int) <a href="#confipv4andprefixlen-ca9c18efdf00" id="confipv4andprefixlen-ca9c18efdf00"></a>

```java
public ConfIPv4AndPrefixLen(int[] addr, int masklen)
```

**Parameters**

- `int[] addr`
- `int masklen`

### ConfIPv4AndPrefixLen(String) <a href="#confipv4andprefixlen-499d9149453d" id="confipv4andprefixlen-499d9149453d"></a>

```java
public ConfIPv4AndPrefixLen(String str)
```

**Parameters**

- `String str`


## Methods

### compareTo(ConfIPv4AndPrefixLen) <a href="#compareto-01179e8df384" id="compareto-01179e8df384"></a>

```java
public int compareTo(com.tailf.conf.ConfIPv4AndPrefixLen o)
```

Types: [ConfIPv4AndPrefixLen](ConfIPv4AndPrefixLen.md#confipv4andprefixlen-0d777e73ddb4)

**Parameters**

- `com.tailf.conf.ConfIPv4AndPrefixLen o`

### encode() <a href="#encode-fbae522bba37" id="encode-fbae522bba37"></a>

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350)

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

### getAddress() <a href="#getaddress-08b11cceec4c" id="getaddress-08b11cceec4c"></a>

```java
public java.net.InetAddress getAddress()
```

### getMaskLength() <a href="#getmasklength-c45d44e26e53" id="getmasklength-c45d44e26e53"></a>

```java
public int getMaskLength()
```

### getRawAddress() <a href="#getrawaddress-2dacae94069b" id="getrawaddress-2dacae94069b"></a>

```java
public int[] getRawAddress()
```

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
