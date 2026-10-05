<a id="s-ConfNamespaceStub"></a>
# ConfNamespaceStub

```java
public class com.tailf.conf.ConfNamespaceStub
    extends com.tailf.conf.ConfNamespace
```

Types: [ConfNamespace](ConfNamespace.md#s-ConfNamespace)

A ConfNamespaceStub can be used in place of a real namespace file when
 accessing removed data models during a cdb upgrade.

## Members

**Constructors**:

- [ConfNamespaceStub(int, String, String, String)](#s-ConfNamespaceStub-1)

**Fields**:

- [hash](#s-hash)
- [id](#s-id)
- [prefix](#s-prefix)
- [uri](#s-uri)

**Methods**:

- [findNamespace(int, List<ConfNamespace>)](ConfNamespace.md#s-findNamespace) from ConfNamespace
- [findNamespace(String)](ConfNamespace.md#s-findNamespace-1) from ConfNamespace
- [findNamespace(String, List<ConfNamespace>)](ConfNamespace.md#s-findNamespace-2) from ConfNamespace
- [findNamespaceFromMountPrefix(List<String>, String)](ConfNamespace.md#s-findNamespaceFromMountPrefix) from ConfNamespace
- [findNamespaceFromNsName(ConfPath, MountIdInterface, String)](ConfNamespace.md#s-findNamespaceFromNsName) from ConfNamespace
- [findNamespaceFromPrefix(ConfPath, MountIdInterface, String)](ConfNamespace.md#s-findNamespaceFromPrefix) from ConfNamespace
- [findNamespaceFromPrefix(String)](ConfNamespace.md#s-findNamespaceFromPrefix-1) from ConfNamespace
- [findNamespaceFromPrefix(String, List<ConfNamespace>)](ConfNamespace.md#s-findNamespaceFromPrefix-2) from ConfNamespace
- [findNamespaceFromRootTag(String)](ConfNamespace.md#s-findNamespaceFromRootTag) from ConfNamespace
- [hash()](#s-hash-1)
- [hashToString(int)](ConfNamespace.md#s-hashToString) from ConfNamespace
- [id()](#s-id-1)
- [isCrunchedNs(String)](ConfNamespace.md#s-isCrunchedNs) from ConfNamespace
- [lookupNamespaceFromHash(int)](ConfNamespace.md#s-lookupNamespaceFromHash) from ConfNamespace
- [lookupNamespaceFromPrefix(ConfPath, MountIdInterface, String)](ConfNamespace.md#s-lookupNamespaceFromPrefix) from ConfNamespace
- [lookupNamespaceFromPrefix(String)](ConfNamespace.md#s-lookupNamespaceFromPrefix-1) from ConfNamespace
- [lookupNamespaceFromURI(String)](ConfNamespace.md#s-lookupNamespaceFromURI) from ConfNamespace
- [prefix()](#s-prefix-1)
- [reinstallRemovedNs(List<ConfNamespace>)](ConfNamespace.md#s-reinstallRemovedNs) from ConfNamespace
- [stringToHash(String)](ConfNamespace.md#s-stringToHash) from ConfNamespace
- [toString()](ConfNamespace.md#s-toString) from ConfNamespace
- [truncateToXMLUri(String)](ConfNamespace.md#s-truncateToXMLUri) from ConfNamespace
- [uri()](#s-uri-1)
- [xmlUri()](#s-xmlUri)

## Constructors

<a id="s-ConfNamespaceStub-1"></a>
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

<a id="s-hash"></a>
### hash

```java
public final int hash = null;
```

<a id="s-id"></a>
### id

```java
public final String id = null;
```

<a id="s-prefix"></a>
### prefix

```java
public final String prefix = null;
```

<a id="s-uri"></a>
### uri

```java
public final String uri = null;
```


## Methods

<a id="s-hash-1"></a>
### hash()

```java
public int hash()
```

<a id="s-id-1"></a>
### id()

```java
public String id()
```

<a id="s-prefix-1"></a>
### prefix()

```java
public String prefix()
```

<a id="s-uri-1"></a>
### uri()

```java
public String uri()
```

<a id="s-xmlUri"></a>
### xmlUri()

```java
public String xmlUri()
```
