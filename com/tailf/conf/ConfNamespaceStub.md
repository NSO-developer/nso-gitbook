# ConfNamespaceStub <a href="#cls-ConfNamespaceStub" id="cls-ConfNamespaceStub"></a>

```java
public class com.tailf.conf.ConfNamespaceStub
    extends com.tailf.conf.ConfNamespace
```

Types: [ConfNamespace](ConfNamespace.md#cls-ConfNamespace)

A ConfNamespaceStub can be used in place of a real namespace file when
 accessing removed data models during a cdb upgrade.

## Members

**Constructors**:

- [ConfNamespaceStub(int, String, String, String)](#m-ConfNamespaceStub-901e454ed0d8)

**Fields**:

- [hash](#m-hash)
- [id](#m-id)
- [prefix](#m-prefix)
- [uri](#m-uri)

**Methods**:

- [findNamespace(int, List<ConfNamespace>)](ConfNamespace.md#m-findNamespace-3608c9e64446) from ConfNamespace
- [findNamespace(String)](ConfNamespace.md#m-findNamespace-ffbcd6481b17) from ConfNamespace
- [findNamespace(String, List<ConfNamespace>)](ConfNamespace.md#m-findNamespace-d388c2984448) from ConfNamespace
- [findNamespaceFromMountPrefix(List<String>, String)](ConfNamespace.md#m-findNamespaceFromMountPrefix-bab7e96778db) from ConfNamespace
- [findNamespaceFromNsName(ConfPath, MountIdInterface, String)](ConfNamespace.md#m-findNamespaceFromNsName-48eec0922648) from ConfNamespace
- [findNamespaceFromPrefix(ConfPath, MountIdInterface, String)](ConfNamespace.md#m-findNamespaceFromPrefix-6e0581090f53) from ConfNamespace
- [findNamespaceFromPrefix(String)](ConfNamespace.md#m-findNamespaceFromPrefix-869c6d668202) from ConfNamespace
- [findNamespaceFromPrefix(String, List<ConfNamespace>)](ConfNamespace.md#m-findNamespaceFromPrefix-66c7e977c972) from ConfNamespace
- [findNamespaceFromRootTag(String)](ConfNamespace.md#m-findNamespaceFromRootTag-f2df2fa2fc2d) from ConfNamespace
- [hash()](#m-hash-88880b48029e)
- [hashToString(int)](ConfNamespace.md#m-hashToString-54eaaef71976) from ConfNamespace
- [id()](#m-id-1352448ec267)
- [isCrunchedNs(String)](ConfNamespace.md#m-isCrunchedNs-360c1c86027d) from ConfNamespace
- [lookupNamespaceFromHash(int)](ConfNamespace.md#m-lookupNamespaceFromHash-da403ab8aac5) from ConfNamespace
- [lookupNamespaceFromPrefix(ConfPath, MountIdInterface, String)](ConfNamespace.md#m-lookupNamespaceFromPrefix-8f1e7973fb08) from ConfNamespace
- [lookupNamespaceFromPrefix(String)](ConfNamespace.md#m-lookupNamespaceFromPrefix-2c59900bb38b) from ConfNamespace
- [lookupNamespaceFromURI(String)](ConfNamespace.md#m-lookupNamespaceFromURI-c4f1a0a098c7) from ConfNamespace
- [prefix()](#m-prefix-668176aac777)
- [reinstallRemovedNs(List<ConfNamespace>)](ConfNamespace.md#m-reinstallRemovedNs-87cc8747702c) from ConfNamespace
- [stringToHash(String)](ConfNamespace.md#m-stringToHash-7c2af24796ac) from ConfNamespace
- [toString()](ConfNamespace.md#m-toString-e9d48c5503ef) from ConfNamespace
- [truncateToXMLUri(String)](ConfNamespace.md#m-truncateToXMLUri-601243c5d74e) from ConfNamespace
- [uri()](#m-uri-3fbfda96db65)
- [xmlUri()](#m-xmlUri-e04f3f35f4eb)

## Constructors

### ConfNamespaceStub(int, String, String, String) <a href="#m-ConfNamespaceStub-901e454ed0d8" id="m-ConfNamespaceStub-901e454ed0d8"></a>

```java
public ConfNamespaceStub(int hash, String id, String uri, String prefix)
```

**Parameters**

- `int hash`
- `String id`
- `String uri`
- `String prefix`


## Fields

### hash <a href="#m-hash" id="m-hash"></a>

```java
public final int hash = null;
```

### id <a href="#m-id" id="m-id"></a>

```java
public final String id = null;
```

### prefix <a href="#m-prefix" id="m-prefix"></a>

```java
public final String prefix = null;
```

### uri <a href="#m-uri" id="m-uri"></a>

```java
public final String uri = null;
```


## Methods

### hash() <a href="#m-hash-88880b48029e" id="m-hash-88880b48029e"></a>

```java
public int hash()
```

### id() <a href="#m-id-1352448ec267" id="m-id-1352448ec267"></a>

```java
public String id()
```

### prefix() <a href="#m-prefix-668176aac777" id="m-prefix-668176aac777"></a>

```java
public String prefix()
```

### uri() <a href="#m-uri-3fbfda96db65" id="m-uri-3fbfda96db65"></a>

```java
public String uri()
```

### xmlUri() <a href="#m-xmlUri-e04f3f35f4eb" id="m-xmlUri-e04f3f35f4eb"></a>

```java
public String xmlUri()
```
