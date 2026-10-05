<a id="s-NoSuchNavuNodeException"></a>
# NoSuchNavuNodeException

```java
public class com.tailf.navu.NoSuchNavuNodeException
    extends com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

## Members

**Constructors**:

- [NoSuchNavuNodeException(String, NavuNode, Collection<NavuNode>, String, String, String)](#s-NoSuchNavuNodeException-1)
- [NoSuchNavuNodeException(String, NavuNode, ConfKey)](#s-NoSuchNavuNodeException-2)

**Methods**:

- [children()](#s-children)
- [getErrorCode()](../conf/ConfException.md#s-getErrorCode) from ConfException
- [getOpaque()](../conf/ConfException.md#s-getOpaque) from ConfException
- [mk(ConfResponse)](NavuException.md#s-mk) from NavuException
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#s-mk-1) from ConfException
- [mk(NavuList, ConfKey)](#s-mk)
- [mk(NavuNode, String)](#s-mk-1)
- [mk(NavuNode, String, EnumSet<Verbosity>)](#s-mk-2)
- [mk(NavuNode, String, String)](#s-mk-3)
- [mk(NavuNode, String, String, EnumSet<Verbosity>)](#s-mk-4)

## Constructors

<a id="s-NoSuchNavuNodeException-1"></a>
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

Types: [NavuNode](NavuNode.md#s-NavuNode)

**Parameters**

- `String path`
- `com.tailf.navu.NavuNode parentNode`
- `java.util.Collection<com.tailf.navu.NavuNode> children`
- `String childType`
- `String errorNodeName`
- `String childrenMsg`

<a id="s-NoSuchNavuNodeException-2"></a>
### NoSuchNavuNodeException(String, NavuNode, ConfKey)

```java
protected NoSuchNavuNodeException(
    String path,
    com.tailf.navu.NavuNode parentNode,
    com.tailf.conf.ConfKey errorKey
)
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [ConfKey](../conf/ConfKey.md#s-ConfKey)

**Parameters**

- `String path`
- `com.tailf.navu.NavuNode parentNode`
- `com.tailf.conf.ConfKey errorKey`


## Methods

<a id="s-children"></a>
### children()

```java
public java.util.Collection<com.tailf.navu.NavuNode> children() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

<a id="s-mk"></a>
### mk(NavuList, ConfKey)

```java
public static com.tailf.navu.NoSuchNavuNodeException mk(
    com.tailf.navu.NavuList navuList,
    com.tailf.conf.ConfKey key
)
```

Types: [NoSuchNavuNodeException](NoSuchNavuNodeException.md#s-NoSuchNavuNodeException), [NavuList](NavuList.md#s-NavuList), [ConfKey](../conf/ConfKey.md#s-ConfKey)

**Parameters**

- `com.tailf.navu.NavuList navuList`
- `com.tailf.conf.ConfKey key`

<a id="s-mk-1"></a>
### mk(NavuNode, String)

```java
public static com.tailf.navu.NoSuchNavuNodeException mk(com.tailf.navu.NavuNode node, String errKey)
```

Types: [NoSuchNavuNodeException](NoSuchNavuNodeException.md#s-NoSuchNavuNodeException), [NavuNode](NavuNode.md#s-NavuNode)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String errKey`

<a id="s-mk-2"></a>
### mk(NavuNode, String, EnumSet<Verbosity>)

```java
public static com.tailf.navu.NoSuchNavuNodeException mk(
    com.tailf.navu.NavuNode node,
    String errKey,
    java.util.EnumSet<com.tailf.navu.Verbosity> verbosity
)
```

Types: [NoSuchNavuNodeException](NoSuchNavuNodeException.md#s-NoSuchNavuNodeException), [NavuNode](NavuNode.md#s-NavuNode), [Verbosity](Verbosity.md#s-Verbosity)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String errKey`
- `java.util.EnumSet<com.tailf.navu.Verbosity> verbosity`

<a id="s-mk-3"></a>
### mk(NavuNode, String, String)

```java
public static com.tailf.navu.NoSuchNavuNodeException mk(
    com.tailf.navu.NavuNode node,
    String childType,
    String errKey
)
```

Types: [NoSuchNavuNodeException](NoSuchNavuNodeException.md#s-NoSuchNavuNodeException), [NavuNode](NavuNode.md#s-NavuNode)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String childType`
- `String errKey`

<a id="s-mk-4"></a>
### mk(NavuNode, String, String, EnumSet<Verbosity>)

```java
public static com.tailf.navu.NoSuchNavuNodeException mk(
    com.tailf.navu.NavuNode node,
    String childType,
    String errKey,
    java.util.EnumSet<com.tailf.navu.Verbosity> verbosity
)
```

Types: [NoSuchNavuNodeException](NoSuchNavuNodeException.md#s-NoSuchNavuNodeException), [NavuNode](NavuNode.md#s-NavuNode), [Verbosity](Verbosity.md#s-Verbosity)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String childType`
- `String errKey`
- `java.util.EnumSet<com.tailf.navu.Verbosity> verbosity`
