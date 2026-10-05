# NedTTL <a href="#cls-NedTTL" id="cls-NedTTL"></a>

```java
public class com.tailf.ned.NedTTL
```

The NedTTL class is used to pass time-to-live information
 to NCS for the entries in a config=false cache.

## Members

**Constructors**:

- [NedTTL(ConfPath, int)](#m-NedTTL-d59ba0f9d8e4)
- [NedTTL(ConfPath, int, boolean)](#m-NedTTL-16d294d5a6a3)

**Methods**:

- [encode()](#m-encode-fbae522bba37)
- [getPath()](#m-getPath-88fb21895561)
- [getTTL()](#m-getTTL-7693f68ee5b0)
- [isSubtree()](#m-isSubtree-0d784a2e567c)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### NedTTL(ConfPath, int) <a href="#m-NedTTL-d59ba0f9d8e4" id="m-NedTTL-d59ba0f9d8e4"></a>

```java
public NedTTL(com.tailf.conf.ConfPath path, int ttl)
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath)

Creates a single TTL entry.

**Parameters**

- `com.tailf.conf.ConfPath path` - The path for which the TTL holds.
- `int ttl` - The time-to-live in seconds.

### NedTTL(ConfPath, int, boolean) <a href="#m-NedTTL-16d294d5a6a3" id="m-NedTTL-16d294d5a6a3"></a>

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

### encode() <a href="#m-encode-fbae522bba37" id="m-encode-fbae522bba37"></a>

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

### getPath() <a href="#m-getPath-88fb21895561" id="m-getPath-88fb21895561"></a>

```java
public com.tailf.conf.ConfPath getPath()
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath)

### getTTL() <a href="#m-getTTL-7693f68ee5b0" id="m-getTTL-7693f68ee5b0"></a>

```java
public int getTTL()
```

### isSubtree() <a href="#m-isSubtree-0d784a2e567c" id="m-isSubtree-0d784a2e567c"></a>

```java
public boolean isSubtree()
```

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
