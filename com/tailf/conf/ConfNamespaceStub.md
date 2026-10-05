<a id="cls-ConfNamespaceStub"></a>
# ConfNamespaceStub

```java
public class com.tailf.conf.ConfNamespaceStub
    extends com.tailf.conf.ConfNamespace
```

Types: [ConfNamespace](ConfNamespace.md#cls-ConfNamespace)

A ConfNamespaceStub can be used in place of a real namespace file when
 accessing removed data models during a cdb upgrade.

## Members

**Constructors**:

- [ConfNamespaceStub(int, String, String, String)](#m-confnamespacestub-901e454ed0d8)

**Fields**:

- [hash](#m-hash)
- [id](#m-id)
- [prefix](#m-prefix)
- [uri](#m-uri)

**Methods**:

- [findNamespace(int, List<ConfNamespace>)](ConfNamespace.md#m-findnamespace-3608c9e64446) from ConfNamespace
- [findNamespace(String)](ConfNamespace.md#m-findnamespace-ffbcd6481b17) from ConfNamespace
- [findNamespace(String, List<ConfNamespace>)](ConfNamespace.md#m-findnamespace-d388c2984448) from ConfNamespace
- [findNamespaceFromMountPrefix(List<String>, String)](ConfNamespace.md#m-findnamespacefrommountprefix-bab7e96778db) from ConfNamespace
- [findNamespaceFromNsName(ConfPath, MountIdInterface, String)](ConfNamespace.md#m-findnamespacefromnsname-48eec0922648) from ConfNamespace
- [findNamespaceFromPrefix(ConfPath, MountIdInterface, String)](ConfNamespace.md#m-findnamespacefromprefix-6e0581090f53) from ConfNamespace
- [findNamespaceFromPrefix(String)](ConfNamespace.md#m-findnamespacefromprefix-869c6d668202) from ConfNamespace
- [findNamespaceFromPrefix(String, List<ConfNamespace>)](ConfNamespace.md#m-findnamespacefromprefix-66c7e977c972) from ConfNamespace
- [findNamespaceFromRootTag(String)](ConfNamespace.md#m-findnamespacefromroottag-f2df2fa2fc2d) from ConfNamespace
- [hash()](#m-hash-88880b48029e)
- [hashToString(int)](ConfNamespace.md#m-hashtostring-54eaaef71976) from ConfNamespace
- [id()](#m-id-1352448ec267)
- [isCrunchedNs(String)](ConfNamespace.md#m-iscrunchedns-360c1c86027d) from ConfNamespace
- [lookupNamespaceFromHash(int)](ConfNamespace.md#m-lookupnamespacefromhash-da403ab8aac5) from ConfNamespace
- [lookupNamespaceFromPrefix(ConfPath, MountIdInterface, String)](ConfNamespace.md#m-lookupnamespacefromprefix-8f1e7973fb08) from ConfNamespace
- [lookupNamespaceFromPrefix(String)](ConfNamespace.md#m-lookupnamespacefromprefix-2c59900bb38b) from ConfNamespace
- [lookupNamespaceFromURI(String)](ConfNamespace.md#m-lookupnamespacefromuri-c4f1a0a098c7) from ConfNamespace
- [prefix()](#m-prefix-668176aac777)
- [reinstallRemovedNs(List<ConfNamespace>)](ConfNamespace.md#m-reinstallremovedns-87cc8747702c) from ConfNamespace
- [stringToHash(String)](ConfNamespace.md#m-stringtohash-7c2af24796ac) from ConfNamespace
- [toString()](ConfNamespace.md#m-tostring-e9d48c5503ef) from ConfNamespace
- [truncateToXMLUri(String)](ConfNamespace.md#m-truncatetoxmluri-601243c5d74e) from ConfNamespace
- [uri()](#m-uri-3fbfda96db65)
- [xmlUri()](#m-xmluri-e04f3f35f4eb)

## Constructors

<a id="m-confnamespacestub-901e454ed0d8"></a>
### ConfNamespaceStub(int, String, String, String)

```java
public ConfNamespaceStub(int hash, String id, String uri, String prefix)
```

**Parameters**

- `int hash`
- `String id`
- `String uri`
- `String prefix`


## Fields

<a id="m-hash"></a>
### hash

```java
public final int hash = null;
```

<a id="m-id"></a>
### id

```java
public final String id = null;
```

<a id="m-prefix"></a>
### prefix

```java
public final String prefix = null;
```

<a id="m-uri"></a>
### uri

```java
public final String uri = null;
```


## Methods

<a id="m-hash-88880b48029e"></a>
### hash()

```java
public int hash()
```

<a id="m-id-1352448ec267"></a>
### id()

```java
public String id()
```

<a id="m-prefix-668176aac777"></a>
### prefix()

```java
public String prefix()
```

<a id="m-uri-3fbfda96db65"></a>
### uri()

```java
public String uri()
```

<a id="m-xmluri-e04f3f35f4eb"></a>
### xmlUri()

```java
public String xmlUri()
```
