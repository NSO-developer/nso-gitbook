# ConfNamespaceStub <a href="#confnamespacestub-81838488f663" id="confnamespacestub-81838488f663"></a>

```java
public class com.tailf.conf.ConfNamespaceStub
    extends com.tailf.conf.ConfNamespace
```

Types: [ConfNamespace](ConfNamespace.md#confnamespace-51b928e168d1)

A ConfNamespaceStub can be used in place of a real namespace file when
 accessing removed data models during a cdb upgrade.

## Members

**Constructors**:

- [ConfNamespaceStub(int, String, String, String)](#confnamespacestub-901e454ed0d8)

**Fields**:

- [hash](#hash-f73624869884)
- [id](#id-048276095f61)
- [prefix](#prefix-f4cd8051dc9a)
- [uri](#uri-0e8d1758ed1a)

**Methods**:

- [findNamespace(int, List<ConfNamespace>)](ConfNamespace.md#findnamespace-3608c9e64446) from ConfNamespace
- [findNamespace(String)](ConfNamespace.md#findnamespace-ffbcd6481b17) from ConfNamespace
- [findNamespace(String, List<ConfNamespace>)](ConfNamespace.md#findnamespace-d388c2984448) from ConfNamespace
- [findNamespaceFromMountPrefix(List<String>, String)](ConfNamespace.md#findnamespacefrommountprefix-bab7e96778db) from ConfNamespace
- [findNamespaceFromNsName(ConfPath, MountIdInterface, String)](ConfNamespace.md#findnamespacefromnsname-48eec0922648) from ConfNamespace
- [findNamespaceFromPrefix(ConfPath, MountIdInterface, String)](ConfNamespace.md#findnamespacefromprefix-6e0581090f53) from ConfNamespace
- [findNamespaceFromPrefix(String)](ConfNamespace.md#findnamespacefromprefix-869c6d668202) from ConfNamespace
- [findNamespaceFromPrefix(String, List<ConfNamespace>)](ConfNamespace.md#findnamespacefromprefix-66c7e977c972) from ConfNamespace
- [findNamespaceFromRootTag(String)](ConfNamespace.md#findnamespacefromroottag-f2df2fa2fc2d) from ConfNamespace
- [hash()](#hash-88880b48029e)
- [hashToString(int)](ConfNamespace.md#hashtostring-54eaaef71976) from ConfNamespace
- [id()](#id-1352448ec267)
- [isCrunchedNs(String)](ConfNamespace.md#iscrunchedns-360c1c86027d) from ConfNamespace
- [lookupNamespaceFromHash(int)](ConfNamespace.md#lookupnamespacefromhash-da403ab8aac5) from ConfNamespace
- [lookupNamespaceFromPrefix(ConfPath, MountIdInterface, String)](ConfNamespace.md#lookupnamespacefromprefix-8f1e7973fb08) from ConfNamespace
- [lookupNamespaceFromPrefix(String)](ConfNamespace.md#lookupnamespacefromprefix-2c59900bb38b) from ConfNamespace
- [lookupNamespaceFromURI(String)](ConfNamespace.md#lookupnamespacefromuri-c4f1a0a098c7) from ConfNamespace
- [prefix()](#prefix-668176aac777)
- [reinstallRemovedNs(List<ConfNamespace>)](ConfNamespace.md#reinstallremovedns-87cc8747702c) from ConfNamespace
- [stringToHash(String)](ConfNamespace.md#stringtohash-7c2af24796ac) from ConfNamespace
- [toString()](ConfNamespace.md#tostring-e9d48c5503ef) from ConfNamespace
- [truncateToXMLUri(String)](ConfNamespace.md#truncatetoxmluri-601243c5d74e) from ConfNamespace
- [uri()](#uri-3fbfda96db65)
- [xmlUri()](#xmluri-e04f3f35f4eb)

## Constructors

### ConfNamespaceStub(int, String, String, String) <a href="#confnamespacestub-901e454ed0d8" id="confnamespacestub-901e454ed0d8"></a>

```java
public ConfNamespaceStub(int hash, String id, String uri, String prefix)
```

**Parameters**

- `int hash`
- `String id`
- `String uri`
- `String prefix`


## Fields

### hash <a href="#hash-f73624869884" id="hash-f73624869884"></a>

```java
public final int hash = null;
```

### id <a href="#id-048276095f61" id="id-048276095f61"></a>

```java
public final String id = null;
```

### prefix <a href="#prefix-f4cd8051dc9a" id="prefix-f4cd8051dc9a"></a>

```java
public final String prefix = null;
```

### uri <a href="#uri-0e8d1758ed1a" id="uri-0e8d1758ed1a"></a>

```java
public final String uri = null;
```


## Methods

### hash() <a href="#hash-88880b48029e" id="hash-88880b48029e"></a>

```java
public int hash()
```

### id() <a href="#id-1352448ec267" id="id-1352448ec267"></a>

```java
public String id()
```

### prefix() <a href="#prefix-668176aac777" id="prefix-668176aac777"></a>

```java
public String prefix()
```

### uri() <a href="#uri-3fbfda96db65" id="uri-3fbfda96db65"></a>

```java
public String uri()
```

### xmlUri() <a href="#xmluri-e04f3f35f4eb" id="xmluri-e04f3f35f4eb"></a>

```java
public String xmlUri()
```
