# MaapiSchemaNS <a href="#maapischemans-0020218f86d5" id="maapischemans-0020218f86d5"></a>

```java
public class com.tailf.maapi.MaapiSchemaNS
    extends com.tailf.conf.ConfNamespace
```

Types: [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1)

This class is used to emulate and replace the classes that was previously
 loaded manually.

## Members

**Constructors**:

- [MaapiSchemaNS\(int, String, String, String\)](#maapischemans-f9eb2cc0b9e7)

**Methods**:

- [findNamespace\(int, List\<ConfNamespace\>\)](../conf/ConfNamespace.md#findnamespace-3608c9e64446) from ConfNamespace
- [findNamespace\(String\)](../conf/ConfNamespace.md#findnamespace-ffbcd6481b17) from ConfNamespace
- [findNamespace\(String, List\<ConfNamespace\>\)](../conf/ConfNamespace.md#findnamespace-d388c2984448) from ConfNamespace
- [findNamespaceFromMountPrefix\(List\<String\>, String\)](../conf/ConfNamespace.md#findnamespacefrommountprefix-bab7e96778db) from ConfNamespace
- [findNamespaceFromNsName\(ConfPath, MountIdInterface, String\)](../conf/ConfNamespace.md#findnamespacefromnsname-48eec0922648) from ConfNamespace
- [findNamespaceFromPrefix\(ConfPath, MountIdInterface, String\)](../conf/ConfNamespace.md#findnamespacefromprefix-6e0581090f53) from ConfNamespace
- [findNamespaceFromPrefix\(String\)](../conf/ConfNamespace.md#findnamespacefromprefix-869c6d668202) from ConfNamespace
- [findNamespaceFromPrefix\(String, List\<ConfNamespace\>\)](../conf/ConfNamespace.md#findnamespacefromprefix-66c7e977c972) from ConfNamespace
- [findNamespaceFromRootTag\(String\)](../conf/ConfNamespace.md#findnamespacefromroottag-f2df2fa2fc2d) from ConfNamespace
- [hash\(\)](#hash-88880b48029e)
- [hashToString\(int\)](../conf/ConfNamespace.md#hashtostring-54eaaef71976) from ConfNamespace
- [id\(\)](#id-1352448ec267)
- [isCrunchedNs\(String\)](../conf/ConfNamespace.md#iscrunchedns-360c1c86027d) from ConfNamespace
- [lookupNamespaceFromHash\(int\)](../conf/ConfNamespace.md#lookupnamespacefromhash-da403ab8aac5) from ConfNamespace
- [lookupNamespaceFromPrefix\(ConfPath, MountIdInterface, String\)](../conf/ConfNamespace.md#lookupnamespacefromprefix-8f1e7973fb08) from ConfNamespace
- [lookupNamespaceFromPrefix\(String\)](../conf/ConfNamespace.md#lookupnamespacefromprefix-2c59900bb38b) from ConfNamespace
- [lookupNamespaceFromURI\(String\)](../conf/ConfNamespace.md#lookupnamespacefromuri-c4f1a0a098c7) from ConfNamespace
- [prefix\(\)](#prefix-668176aac777)
- [reinstallRemovedNs\(List\<ConfNamespace\>\)](../conf/ConfNamespace.md#reinstallremovedns-87cc8747702c) from ConfNamespace
- [stringToHash\(String\)](../conf/ConfNamespace.md#stringtohash-7c2af24796ac) from ConfNamespace
- [toString\(\)](../conf/ConfNamespace.md#tostring-e9d48c5503ef) from ConfNamespace
- [truncateToXMLUri\(String\)](../conf/ConfNamespace.md#truncatetoxmluri-601243c5d74e) from ConfNamespace
- [uri\(\)](#uri-3fbfda96db65)
- [xmlUri\(\)](#xmluri-e04f3f35f4eb)

## Constructors

### MaapiSchemaNS(int, String, String, String) <a href="#maapischemans-f9eb2cc0b9e7" id="maapischemans-f9eb2cc0b9e7"></a>

```java
public MaapiSchemaNS(int hash, String uri, String id, String prefix)
```

**Parameters**

- `int hash`
- `String uri`
- `String id`
- `String prefix`


## Methods

### hash() <a href="#hash-88880b48029e" id="hash-88880b48029e"></a>

```java
public int hash()
```

**See also:** [`ConfNamespace#hash()`](../conf/ConfNamespace.md#hash-88880b48029e)

### id() <a href="#id-1352448ec267" id="id-1352448ec267"></a>

```java
public String id()
```

**See also:** [`ConfNamespace#id()`](../conf/ConfNamespace.md#id-1352448ec267)

### prefix() <a href="#prefix-668176aac777" id="prefix-668176aac777"></a>

```java
public String prefix()
```

**See also:** [`ConfNamespace#prefix()`](../conf/ConfNamespace.md#prefix-668176aac777)

### uri() <a href="#uri-3fbfda96db65" id="uri-3fbfda96db65"></a>

```java
public String uri()
```

**See also:** [`ConfNamespace#uri()`](../conf/ConfNamespace.md#uri-3fbfda96db65)

### xmlUri() <a href="#xmluri-e04f3f35f4eb" id="xmluri-e04f3f35f4eb"></a>

```java
public String xmlUri()
```

**See also:** [`ConfNamespace#uri()`](../conf/ConfNamespace.md#uri-3fbfda96db65)
