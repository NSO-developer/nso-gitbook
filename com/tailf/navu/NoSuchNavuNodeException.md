<a id="cls-NoSuchNavuNodeException"></a>
# NoSuchNavuNodeException

```java
public class com.tailf.navu.NoSuchNavuNodeException
    extends com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

## Members

**Constructors**:

- [NoSuchNavuNodeException(String, NavuNode, Collection<NavuNode>, String, String, String)](#m-nosuchnavunodeexception-d5a414a33ff3)
- [NoSuchNavuNodeException(String, NavuNode, ConfKey)](#m-nosuchnavunodeexception-430e6f47982c)

**Methods**:

- [children()](#m-children-7d31300d62c3)
- [getErrorCode()](../conf/ConfException.md#m-geterrorcode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getopaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](NavuException.md#m-mk-de1cedfc6ea8) from NavuException
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#m-mk-79e69ffbc022) from ConfException
- [mk(NavuList, ConfKey)](#m-mk-d51c83d9d83e)
- [mk(NavuNode, String)](#m-mk-860d8e42906c)
- [mk(NavuNode, String, EnumSet<Verbosity>)](#m-mk-fcb69a1fb8ec)
- [mk(NavuNode, String, String)](#m-mk-ad2e5332a6e1)
- [mk(NavuNode, String, String, EnumSet<Verbosity>)](#m-mk-2ec83f2a0045)

## Constructors

<a id="m-nosuchnavunodeexception-d5a414a33ff3"></a>
### NoSuchNavuNodeException(String, NavuNode, Collection<NavuNode>, String, String, String)

```java
protected NoSuchNavuNodeException(
    String path,
    com.tailf.navu.NavuNode parentNode,
    java.util.Collection<com.tailf.navu.NavuNode> children,
    String childType,
    String errorNodeName,
    String childrenMsg
)
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

**Parameters**

- `String path`
- `com.tailf.navu.NavuNode parentNode`
- `java.util.Collection<com.tailf.navu.NavuNode> children`
- `String childType`
- `String errorNodeName`
- `String childrenMsg`

<a id="m-nosuchnavunodeexception-430e6f47982c"></a>
### NoSuchNavuNodeException(String, NavuNode, ConfKey)

```java
protected NoSuchNavuNodeException(
    String path,
    com.tailf.navu.NavuNode parentNode,
    com.tailf.conf.ConfKey errorKey
)
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [ConfKey](../conf/ConfKey.md#cls-ConfKey)

**Parameters**

- `String path`
- `com.tailf.navu.NavuNode parentNode`
- `com.tailf.conf.ConfKey errorKey`


## Methods

<a id="m-children-7d31300d62c3"></a>
### children()

```java
public java.util.Collection<com.tailf.navu.NavuNode> children() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

<a id="m-mk-d51c83d9d83e"></a>
### mk(NavuList, ConfKey)

```java
public static com.tailf.navu.NoSuchNavuNodeException mk(
    com.tailf.navu.NavuList navuList,
    com.tailf.conf.ConfKey key
)
```

Types: [NoSuchNavuNodeException](NoSuchNavuNodeException.md#cls-NoSuchNavuNodeException), [NavuList](NavuList.md#cls-NavuList), [ConfKey](../conf/ConfKey.md#cls-ConfKey)

**Parameters**

- `com.tailf.navu.NavuList navuList`
- `com.tailf.conf.ConfKey key`

<a id="m-mk-860d8e42906c"></a>
### mk(NavuNode, String)

```java
public static com.tailf.navu.NoSuchNavuNodeException mk(com.tailf.navu.NavuNode node, String errKey)
```

Types: [NoSuchNavuNodeException](NoSuchNavuNodeException.md#cls-NoSuchNavuNodeException), [NavuNode](NavuNode.md#cls-NavuNode)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String errKey`

<a id="m-mk-fcb69a1fb8ec"></a>
### mk(NavuNode, String, EnumSet<Verbosity>)

```java
public static com.tailf.navu.NoSuchNavuNodeException mk(
    com.tailf.navu.NavuNode node,
    String errKey,
    java.util.EnumSet<com.tailf.navu.Verbosity> verbosity
)
```

Types: [NoSuchNavuNodeException](NoSuchNavuNodeException.md#cls-NoSuchNavuNodeException), [NavuNode](NavuNode.md#cls-NavuNode), [Verbosity](Verbosity.md#cls-Verbosity)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String errKey`
- `java.util.EnumSet<com.tailf.navu.Verbosity> verbosity`

<a id="m-mk-ad2e5332a6e1"></a>
### mk(NavuNode, String, String)

```java
public static com.tailf.navu.NoSuchNavuNodeException mk(
    com.tailf.navu.NavuNode node,
    String childType,
    String errKey
)
```

Types: [NoSuchNavuNodeException](NoSuchNavuNodeException.md#cls-NoSuchNavuNodeException), [NavuNode](NavuNode.md#cls-NavuNode)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String childType`
- `String errKey`

<a id="m-mk-2ec83f2a0045"></a>
### mk(NavuNode, String, String, EnumSet<Verbosity>)

```java
public static com.tailf.navu.NoSuchNavuNodeException mk(
    com.tailf.navu.NavuNode node,
    String childType,
    String errKey,
    java.util.EnumSet<com.tailf.navu.Verbosity> verbosity
)
```

Types: [NoSuchNavuNodeException](NoSuchNavuNodeException.md#cls-NoSuchNavuNodeException), [NavuNode](NavuNode.md#cls-NavuNode), [Verbosity](Verbosity.md#cls-Verbosity)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String childType`
- `String errKey`
- `java.util.EnumSet<com.tailf.navu.Verbosity> verbosity`
