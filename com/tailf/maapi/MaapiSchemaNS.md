<a id="s-MaapiSchemaNS"></a>
# MaapiSchemaNS

```java
public class com.tailf.maapi.MaapiSchemaNS
    extends com.tailf.conf.ConfNamespace
```

Types: [ConfNamespace](../conf/ConfNamespace.md#s-ConfNamespace)

This class is used to emulate and replace the classes that was previously
 loaded manually.

## Members

**Constructors**:

- [MaapiSchemaNS(int, String, String, String)](#s-MaapiSchemaNS-1)

**Methods**:

- [findNamespace(int, List<ConfNamespace>)](../conf/ConfNamespace.md#s-findNamespace) from ConfNamespace
- [findNamespace(String)](../conf/ConfNamespace.md#s-findNamespace-1) from ConfNamespace
- [findNamespace(String, List<ConfNamespace>)](../conf/ConfNamespace.md#s-findNamespace-2) from ConfNamespace
- [findNamespaceFromMountPrefix(List<String>, String)](../conf/ConfNamespace.md#s-findNamespaceFromMountPrefix) from ConfNamespace
- [findNamespaceFromNsName(ConfPath, MountIdInterface, String)](../conf/ConfNamespace.md#s-findNamespaceFromNsName) from ConfNamespace
- [findNamespaceFromPrefix(ConfPath, MountIdInterface, String)](../conf/ConfNamespace.md#s-findNamespaceFromPrefix) from ConfNamespace
- [findNamespaceFromPrefix(String)](../conf/ConfNamespace.md#s-findNamespaceFromPrefix-1) from ConfNamespace
- [findNamespaceFromPrefix(String, List<ConfNamespace>)](../conf/ConfNamespace.md#s-findNamespaceFromPrefix-2) from ConfNamespace
- [findNamespaceFromRootTag(String)](../conf/ConfNamespace.md#s-findNamespaceFromRootTag) from ConfNamespace
- [hash()](#s-hash)
- [hashToString(int)](../conf/ConfNamespace.md#s-hashToString) from ConfNamespace
- [id()](#s-id)
- [isCrunchedNs(String)](../conf/ConfNamespace.md#s-isCrunchedNs) from ConfNamespace
- [lookupNamespaceFromHash(int)](../conf/ConfNamespace.md#s-lookupNamespaceFromHash) from ConfNamespace
- [lookupNamespaceFromPrefix(ConfPath, MountIdInterface, String)](../conf/ConfNamespace.md#s-lookupNamespaceFromPrefix) from ConfNamespace
- [lookupNamespaceFromPrefix(String)](../conf/ConfNamespace.md#s-lookupNamespaceFromPrefix-1) from ConfNamespace
- [lookupNamespaceFromURI(String)](../conf/ConfNamespace.md#s-lookupNamespaceFromURI) from ConfNamespace
- [prefix()](#s-prefix)
- [reinstallRemovedNs(List<ConfNamespace>)](../conf/ConfNamespace.md#s-reinstallRemovedNs) from ConfNamespace
- [stringToHash(String)](../conf/ConfNamespace.md#s-stringToHash) from ConfNamespace
- [toString()](../conf/ConfNamespace.md#s-toString) from ConfNamespace
- [truncateToXMLUri(String)](../conf/ConfNamespace.md#s-truncateToXMLUri) from ConfNamespace
- [uri()](#s-uri)
- [xmlUri()](#s-xmlUri)

## Constructors

<a id="s-MaapiSchemaNS-1"></a>
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

<a id="s-hash"></a>
### hash()

```java
public int hash()
```

**See also:** [`ConfNamespace#hash()`](../conf/ConfNamespace.md#s-hash)

<a id="s-id"></a>
### id()

```java
public String id()
```

**See also:** [`ConfNamespace#id()`](../conf/ConfNamespace.md#s-id)

<a id="s-prefix"></a>
### prefix()

```java
public String prefix()
```

**See also:** [`ConfNamespace#prefix()`](../conf/ConfNamespace.md#s-prefix)

<a id="s-uri"></a>
### uri()

```java
public String uri()
```

**See also:** [`ConfNamespace#uri()`](../conf/ConfNamespace.md#s-uri)

<a id="s-xmlUri"></a>
### xmlUri()

```java
public String xmlUri()
```

**See also:** [`ConfNamespace#uri()`](../conf/ConfNamespace.md#s-uri)
