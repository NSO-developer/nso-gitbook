# NoSuchNavuNodeException <a href="#nosuchnavunodeexception-55702ea478b0" id="nosuchnavunodeexception-55702ea478b0"></a>

```java
public class com.tailf.navu.NoSuchNavuNodeException
    extends com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

## Members

**Constructors**:

- [NoSuchNavuNodeException\(String, NavuNode, Collection\<NavuNode\>, String, String, String\)](#nosuchnavunodeexception-d5a414a33ff3)
- [NoSuchNavuNodeException\(String, NavuNode, ConfKey\)](#nosuchnavunodeexception-430e6f47982c)

**Methods**:

- [children\(\)](#children-7d31300d62c3)
- [getErrorCode\(\)](../conf/ConfException.md#geterrorcode-812152fc083a) from ConfException
- [getOpaque\(\)](../conf/ConfException.md#getopaque-92e4945ec92d) from ConfException
- [mk\(ConfResponse\)](NavuException.md#mk-de1cedfc6ea8) from NavuException
- [mk\(ConfResponse, ConfPath\)](../conf/ConfException.md#mk-79e69ffbc022) from ConfException
- [mk\(NavuList, ConfKey\)](#mk-d51c83d9d83e)
- [mk\(NavuNode, String\)](#mk-860d8e42906c)
- [mk\(NavuNode, String, EnumSet\<Verbosity\>\)](#mk-fcb69a1fb8ec)
- [mk\(NavuNode, String, String\)](#mk-ad2e5332a6e1)
- [mk\(NavuNode, String, String, EnumSet\<Verbosity\>\)](#mk-2ec83f2a0045)

## Constructors

### NoSuchNavuNodeException(String, NavuNode, Collection&lt;NavuNode&gt;, String, String, String) <a href="#nosuchnavunodeexception-d5a414a33ff3" id="nosuchnavunodeexception-d5a414a33ff3"></a>

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

Types: [NavuNode](NavuNode.md#navunode-73944820c8db)

**Parameters**

- `String path`
- `com.tailf.navu.NavuNode parentNode`
- `java.util.Collection<com.tailf.navu.NavuNode> children`
- `String childType`
- `String errorNodeName`
- `String childrenMsg`

### NoSuchNavuNodeException(String, NavuNode, ConfKey) <a href="#nosuchnavunodeexception-430e6f47982c" id="nosuchnavunodeexception-430e6f47982c"></a>

```java
protected NoSuchNavuNodeException(
    String path,
    com.tailf.navu.NavuNode parentNode,
    com.tailf.conf.ConfKey errorKey
)
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867)

**Parameters**

- `String path`
- `com.tailf.navu.NavuNode parentNode`
- `com.tailf.conf.ConfKey errorKey`


## Methods

### children() <a href="#children-7d31300d62c3" id="children-7d31300d62c3"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> children() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

### mk(NavuList, ConfKey) <a href="#mk-d51c83d9d83e" id="mk-d51c83d9d83e"></a>

```java
public static com.tailf.navu.NoSuchNavuNodeException mk(
    com.tailf.navu.NavuList navuList,
    com.tailf.conf.ConfKey key
)
```

Types: [NoSuchNavuNodeException](NoSuchNavuNodeException.md#nosuchnavunodeexception-55702ea478b0), [NavuList](NavuList.md#navulist-472e8d6d3745), [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867)

**Parameters**

- `com.tailf.navu.NavuList navuList`
- `com.tailf.conf.ConfKey key`

### mk(NavuNode, String) <a href="#mk-860d8e42906c" id="mk-860d8e42906c"></a>

```java
public static com.tailf.navu.NoSuchNavuNodeException mk(com.tailf.navu.NavuNode node, String errKey)
```

Types: [NoSuchNavuNodeException](NoSuchNavuNodeException.md#nosuchnavunodeexception-55702ea478b0), [NavuNode](NavuNode.md#navunode-73944820c8db)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String errKey`

### mk(NavuNode, String, EnumSet&lt;Verbosity&gt;) <a href="#mk-fcb69a1fb8ec" id="mk-fcb69a1fb8ec"></a>

```java
public static com.tailf.navu.NoSuchNavuNodeException mk(
    com.tailf.navu.NavuNode node,
    String errKey,
    java.util.EnumSet<com.tailf.navu.Verbosity> verbosity
)
```

Types: [NoSuchNavuNodeException](NoSuchNavuNodeException.md#nosuchnavunodeexception-55702ea478b0), [NavuNode](NavuNode.md#navunode-73944820c8db), [Verbosity](Verbosity.md#verbosity-a9c618ec424f)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String errKey`
- `java.util.EnumSet<com.tailf.navu.Verbosity> verbosity`

### mk(NavuNode, String, String) <a href="#mk-ad2e5332a6e1" id="mk-ad2e5332a6e1"></a>

```java
public static com.tailf.navu.NoSuchNavuNodeException mk(
    com.tailf.navu.NavuNode node,
    String childType,
    String errKey
)
```

Types: [NoSuchNavuNodeException](NoSuchNavuNodeException.md#nosuchnavunodeexception-55702ea478b0), [NavuNode](NavuNode.md#navunode-73944820c8db)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String childType`
- `String errKey`

### mk(NavuNode, String, String, EnumSet&lt;Verbosity&gt;) <a href="#mk-2ec83f2a0045" id="mk-2ec83f2a0045"></a>

```java
public static com.tailf.navu.NoSuchNavuNodeException mk(
    com.tailf.navu.NavuNode node,
    String childType,
    String errKey,
    java.util.EnumSet<com.tailf.navu.Verbosity> verbosity
)
```

Types: [NoSuchNavuNodeException](NoSuchNavuNodeException.md#nosuchnavunodeexception-55702ea478b0), [NavuNode](NavuNode.md#navunode-73944820c8db), [Verbosity](Verbosity.md#verbosity-a9c618ec424f)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String childType`
- `String errKey`
- `java.util.EnumSet<com.tailf.navu.Verbosity> verbosity`
