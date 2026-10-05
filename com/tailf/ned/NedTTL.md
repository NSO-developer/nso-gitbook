<a id="cls-NedTTL"></a>
# NedTTL

```java
public class com.tailf.ned.NedTTL
```

The NedTTL class is used to pass time-to-live information
 to NCS for the entries in a config=false cache.

## Members

**Constructors**:

- [NedTTL(ConfPath, int)](#m-nedttl-d59ba0f9d8e4)
- [NedTTL(ConfPath, int, boolean)](#m-nedttl-16d294d5a6a3)

**Methods**:

- [encode()](#m-encode-fbae522bba37)
- [getPath()](#m-getpath-88fb21895561)
- [getTTL()](#m-getttl-7693f68ee5b0)
- [isSubtree()](#m-issubtree-0d784a2e567c)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-nedttl-d59ba0f9d8e4"></a>
### NedTTL(ConfPath, int)

```java
public NedTTL(com.tailf.conf.ConfPath path, int ttl)
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath)

Creates a single TTL entry.

**Parameters**

- `com.tailf.conf.ConfPath path` - The path for which the TTL holds.
- `int ttl` - The time-to-live in seconds.

<a id="m-nedttl-16d294d5a6a3"></a>
### NedTTL(ConfPath, int, boolean)

```java
public NedTTL(com.tailf.conf.ConfPath path, int ttl, boolean isSubtree)
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath)

Creates a single TTL entry.

**Parameters**

- `com.tailf.conf.ConfPath path` - The path for which the TTL holds.
- `int ttl` - The time-to-live in seconds.
- `boolean isSubtree` - Signals that the entire subtree for the path
   was fetched and that this is the default TTL for it.
   Unless there exists a TTL on a path below it, NCS will not
   fetch more data below this path until this TTL expires.
   This parameter only works together with
   showStatsPath().


## Methods

<a id="m-encode-fbae522bba37"></a>
### encode()

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

<a id="m-getpath-88fb21895561"></a>
### getPath()

```java
public com.tailf.conf.ConfPath getPath()
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath)

<a id="m-getttl-7693f68ee5b0"></a>
### getTTL()

```java
public int getTTL()
```

<a id="m-issubtree-0d784a2e567c"></a>
### isSubtree()

```java
public boolean isSubtree()
```

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
