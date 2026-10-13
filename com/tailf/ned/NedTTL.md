# NedTTL <a href="#nedttl-1e58c228ec0f" id="nedttl-1e58c228ec0f"></a>

```java
public class com.tailf.ned.NedTTL
```

The NedTTL class is used to pass time-to-live information
 to NCS for the entries in a config=false cache.

## Members

**Constructors**:

- [NedTTL\(ConfPath, int\)](#nedttl-d59ba0f9d8e4)
- [NedTTL\(ConfPath, int, boolean\)](#nedttl-16d294d5a6a3)

**Methods**:

- [encode\(\)](#encode-fbae522bba37)
- [getPath\(\)](#getpath-88fb21895561)
- [getTTL\(\)](#getttl-7693f68ee5b0)
- [isSubtree\(\)](#issubtree-0d784a2e567c)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### NedTTL(ConfPath, int) <a href="#nedttl-d59ba0f9d8e4" id="nedttl-d59ba0f9d8e4"></a>

```java
public NedTTL(com.tailf.conf.ConfPath path, int ttl)
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d)

Creates a single TTL entry.

**Parameters**

- `com.tailf.conf.ConfPath path` - The path for which the TTL holds.
- `int ttl` - The time-to-live in seconds.

### NedTTL(ConfPath, int, boolean) <a href="#nedttl-16d294d5a6a3" id="nedttl-16d294d5a6a3"></a>

```java
public NedTTL(com.tailf.conf.ConfPath path, int ttl, boolean isSubtree)
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d)

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

### encode() <a href="#encode-fbae522bba37" id="encode-fbae522bba37"></a>

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350)

### getPath() <a href="#getpath-88fb21895561" id="getpath-88fb21895561"></a>

```java
public com.tailf.conf.ConfPath getPath()
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d)

### getTTL() <a href="#getttl-7693f68ee5b0" id="getttl-7693f68ee5b0"></a>

```java
public int getTTL()
```

### isSubtree() <a href="#issubtree-0d784a2e567c" id="issubtree-0d784a2e567c"></a>

```java
public boolean isSubtree()
```

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
