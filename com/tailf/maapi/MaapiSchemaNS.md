# MaapiSchemaNS <a href="#cls-MaapiSchemaNS" id="cls-MaapiSchemaNS"></a>

```java
public class com.tailf.maapi.MaapiSchemaNS
    extends com.tailf.conf.ConfNamespace
```

Types: [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace)

This class is used to emulate and replace the classes that was previously
 loaded manually.

## Members

**Constructors**:

- [MaapiSchemaNS(int, String, String, String)](#m-MaapiSchemaNS-f9eb2cc0b9e7)

**Methods**:

- [findNamespace(int, List<ConfNamespace>)](../conf/ConfNamespace.md#m-findNamespace-3608c9e64446) from ConfNamespace
- [findNamespace(String)](../conf/ConfNamespace.md#m-findNamespace-ffbcd6481b17) from ConfNamespace
- [findNamespace(String, List<ConfNamespace>)](../conf/ConfNamespace.md#m-findNamespace-d388c2984448) from ConfNamespace
- [findNamespaceFromMountPrefix(List<String>, String)](../conf/ConfNamespace.md#m-findNamespaceFromMountPrefix-bab7e96778db) from ConfNamespace
- [findNamespaceFromNsName(ConfPath, MountIdInterface, String)](../conf/ConfNamespace.md#m-findNamespaceFromNsName-48eec0922648) from ConfNamespace
- [findNamespaceFromPrefix(ConfPath, MountIdInterface, String)](../conf/ConfNamespace.md#m-findNamespaceFromPrefix-6e0581090f53) from ConfNamespace
- [findNamespaceFromPrefix(String)](../conf/ConfNamespace.md#m-findNamespaceFromPrefix-869c6d668202) from ConfNamespace
- [findNamespaceFromPrefix(String, List<ConfNamespace>)](../conf/ConfNamespace.md#m-findNamespaceFromPrefix-66c7e977c972) from ConfNamespace
- [findNamespaceFromRootTag(String)](../conf/ConfNamespace.md#m-findNamespaceFromRootTag-f2df2fa2fc2d) from ConfNamespace
- [hash()](#m-hash-88880b48029e)
- [hashToString(int)](../conf/ConfNamespace.md#m-hashToString-54eaaef71976) from ConfNamespace
- [id()](#m-id-1352448ec267)
- [isCrunchedNs(String)](../conf/ConfNamespace.md#m-isCrunchedNs-360c1c86027d) from ConfNamespace
- [lookupNamespaceFromHash(int)](../conf/ConfNamespace.md#m-lookupNamespaceFromHash-da403ab8aac5) from ConfNamespace
- [lookupNamespaceFromPrefix(ConfPath, MountIdInterface, String)](../conf/ConfNamespace.md#m-lookupNamespaceFromPrefix-8f1e7973fb08) from ConfNamespace
- [lookupNamespaceFromPrefix(String)](../conf/ConfNamespace.md#m-lookupNamespaceFromPrefix-2c59900bb38b) from ConfNamespace
- [lookupNamespaceFromURI(String)](../conf/ConfNamespace.md#m-lookupNamespaceFromURI-c4f1a0a098c7) from ConfNamespace
- [prefix()](#m-prefix-668176aac777)
- [reinstallRemovedNs(List<ConfNamespace>)](../conf/ConfNamespace.md#m-reinstallRemovedNs-87cc8747702c) from ConfNamespace
- [stringToHash(String)](../conf/ConfNamespace.md#m-stringToHash-7c2af24796ac) from ConfNamespace
- [toString()](../conf/ConfNamespace.md#m-toString-e9d48c5503ef) from ConfNamespace
- [truncateToXMLUri(String)](../conf/ConfNamespace.md#m-truncateToXMLUri-601243c5d74e) from ConfNamespace
- [uri()](#m-uri-3fbfda96db65)
- [xmlUri()](#m-xmlUri-e04f3f35f4eb)

## Constructors

### MaapiSchemaNS(int, String, String, String) <a href="#m-MaapiSchemaNS-f9eb2cc0b9e7" id="m-MaapiSchemaNS-f9eb2cc0b9e7"></a>

```java
public MaapiSchemaNS(int hash, String uri, String id, String prefix)
```

**Parameters**

- `int hash`
- `String uri`
- `String id`
- `String prefix`


## Methods

### hash() <a href="#m-hash-88880b48029e" id="m-hash-88880b48029e"></a>

```java
public int hash()
```

**See also:** [`ConfNamespace#hash()`](../conf/ConfNamespace.md#m-hash-88880b48029e)

### id() <a href="#m-id-1352448ec267" id="m-id-1352448ec267"></a>

```java
public String id()
```

**See also:** [`ConfNamespace#id()`](../conf/ConfNamespace.md#m-id-1352448ec267)

### prefix() <a href="#m-prefix-668176aac777" id="m-prefix-668176aac777"></a>

```java
public String prefix()
```

**See also:** [`ConfNamespace#prefix()`](../conf/ConfNamespace.md#m-prefix-668176aac777)

### uri() <a href="#m-uri-3fbfda96db65" id="m-uri-3fbfda96db65"></a>

```java
public String uri()
```

**See also:** [`ConfNamespace#uri()`](../conf/ConfNamespace.md#m-uri-3fbfda96db65)

### xmlUri() <a href="#m-xmlUri-e04f3f35f4eb" id="m-xmlUri-e04f3f35f4eb"></a>

```java
public String xmlUri()
```

**See also:** [`ConfNamespace#uri()`](../conf/ConfNamespace.md#m-uri-3fbfda96db65)
