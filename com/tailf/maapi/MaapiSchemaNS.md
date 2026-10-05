<a id="cls-MaapiSchemaNS"></a>
# MaapiSchemaNS

```java
public class com.tailf.maapi.MaapiSchemaNS
    extends com.tailf.conf.ConfNamespace
```

Types: [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace)

This class is used to emulate and replace the classes that was previously
 loaded manually.

## Members

**Constructors**:

- [MaapiSchemaNS(int, String, String, String)](#m-maapischemans-f9eb2cc0b9e7)

**Methods**:

- [findNamespace(int, List<ConfNamespace>)](../conf/ConfNamespace.md#m-findnamespace-3608c9e64446) from ConfNamespace
- [findNamespace(String)](../conf/ConfNamespace.md#m-findnamespace-ffbcd6481b17) from ConfNamespace
- [findNamespace(String, List<ConfNamespace>)](../conf/ConfNamespace.md#m-findnamespace-d388c2984448) from ConfNamespace
- [findNamespaceFromMountPrefix(List<String>, String)](../conf/ConfNamespace.md#m-findnamespacefrommountprefix-bab7e96778db) from ConfNamespace
- [findNamespaceFromNsName(ConfPath, MountIdInterface, String)](../conf/ConfNamespace.md#m-findnamespacefromnsname-48eec0922648) from ConfNamespace
- [findNamespaceFromPrefix(ConfPath, MountIdInterface, String)](../conf/ConfNamespace.md#m-findnamespacefromprefix-6e0581090f53) from ConfNamespace
- [findNamespaceFromPrefix(String)](../conf/ConfNamespace.md#m-findnamespacefromprefix-869c6d668202) from ConfNamespace
- [findNamespaceFromPrefix(String, List<ConfNamespace>)](../conf/ConfNamespace.md#m-findnamespacefromprefix-66c7e977c972) from ConfNamespace
- [findNamespaceFromRootTag(String)](../conf/ConfNamespace.md#m-findnamespacefromroottag-f2df2fa2fc2d) from ConfNamespace
- [hash()](#m-hash-88880b48029e)
- [hashToString(int)](../conf/ConfNamespace.md#m-hashtostring-54eaaef71976) from ConfNamespace
- [id()](#m-id-1352448ec267)
- [isCrunchedNs(String)](../conf/ConfNamespace.md#m-iscrunchedns-360c1c86027d) from ConfNamespace
- [lookupNamespaceFromHash(int)](../conf/ConfNamespace.md#m-lookupnamespacefromhash-da403ab8aac5) from ConfNamespace
- [lookupNamespaceFromPrefix(ConfPath, MountIdInterface, String)](../conf/ConfNamespace.md#m-lookupnamespacefromprefix-8f1e7973fb08) from ConfNamespace
- [lookupNamespaceFromPrefix(String)](../conf/ConfNamespace.md#m-lookupnamespacefromprefix-2c59900bb38b) from ConfNamespace
- [lookupNamespaceFromURI(String)](../conf/ConfNamespace.md#m-lookupnamespacefromuri-c4f1a0a098c7) from ConfNamespace
- [prefix()](#m-prefix-668176aac777)
- [reinstallRemovedNs(List<ConfNamespace>)](../conf/ConfNamespace.md#m-reinstallremovedns-87cc8747702c) from ConfNamespace
- [stringToHash(String)](../conf/ConfNamespace.md#m-stringtohash-7c2af24796ac) from ConfNamespace
- [toString()](../conf/ConfNamespace.md#m-tostring-e9d48c5503ef) from ConfNamespace
- [truncateToXMLUri(String)](../conf/ConfNamespace.md#m-truncatetoxmluri-601243c5d74e) from ConfNamespace
- [uri()](#m-uri-3fbfda96db65)
- [xmlUri()](#m-xmluri-e04f3f35f4eb)

## Constructors

<a id="m-maapischemans-f9eb2cc0b9e7"></a>
### MaapiSchemaNS(int, String, String, String)

```java
public MaapiSchemaNS(int hash, String uri, String id, String prefix)
```

**Parameters**

- `int hash`
- `String uri`
- `String id`
- `String prefix`


## Methods

<a id="m-hash-88880b48029e"></a>
### hash()

```java
public int hash()
```

**See also:** [`ConfNamespace#hash()`](../conf/ConfNamespace.md#m-hash-88880b48029e)

<a id="m-id-1352448ec267"></a>
### id()

```java
public String id()
```

**See also:** [`ConfNamespace#id()`](../conf/ConfNamespace.md#m-id-1352448ec267)

<a id="m-prefix-668176aac777"></a>
### prefix()

```java
public String prefix()
```

**See also:** [`ConfNamespace#prefix()`](../conf/ConfNamespace.md#m-prefix-668176aac777)

<a id="m-uri-3fbfda96db65"></a>
### uri()

```java
public String uri()
```

**See also:** [`ConfNamespace#uri()`](../conf/ConfNamespace.md#m-uri-3fbfda96db65)

<a id="m-xmluri-e04f3f35f4eb"></a>
### xmlUri()

```java
public String xmlUri()
```

**See also:** [`ConfNamespace#uri()`](../conf/ConfNamespace.md#m-uri-3fbfda96db65)
