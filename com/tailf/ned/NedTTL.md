<a id="s-NedTTL"></a>
# NedTTL

```java
public class com.tailf.ned.NedTTL
```

The NedTTL class is used to pass time-to-live information
 to NCS for the entries in a config=false cache.

## Members

**Constructors**:

- [NedTTL(ConfPath, int)](#s-NedTTL-1)
- [NedTTL(ConfPath, int, boolean)](#s-NedTTL-2)

**Methods**:

- [encode()](#s-encode)
- [getPath()](#s-getPath)
- [getTTL()](#s-getTTL)
- [isSubtree()](#s-isSubtree)
- [toString()](#s-toString)

## Constructors

<a id="s-NedTTL-1"></a>
### NedTTL(ConfPath, int)

```java
public NedTTL(com.tailf.conf.ConfPath path, int ttl)
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath)

Creates a single TTL entry.

**Parameters**

- `com.tailf.conf.ConfPath path` - The path for which the TTL holds.
- `int ttl` - The time-to-live in seconds.

<a id="s-NedTTL-2"></a>
### NedTTL(ConfPath, int, boolean)

```java
public NedTTL(com.tailf.conf.ConfPath path, int ttl, boolean isSubtree)
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath)

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

<a id="s-encode"></a>
### encode()

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

<a id="s-getPath"></a>
### getPath()

```java
public com.tailf.conf.ConfPath getPath()
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath)

<a id="s-getTTL"></a>
### getTTL()

```java
public int getTTL()
```

<a id="s-isSubtree"></a>
### isSubtree()

```java
public boolean isSubtree()
```

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
