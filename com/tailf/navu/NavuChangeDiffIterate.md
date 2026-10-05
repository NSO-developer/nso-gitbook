<a id="s-NavuChangeDiffIterate"></a>
# NavuChangeDiffIterate

```java
public final class com.tailf.navu.NavuChangeDiffIterate
    implements com.tailf.maapi.MaapiDiffIterate
```

Types: [MaapiDiffIterate](../maapi/MaapiDiffIterate.md#s-MaapiDiffIterate)

## Members

**Constructors**:

- [NavuChangeDiffIterate(NavuNode, NavuContext)](#s-NavuChangeDiffIterate-1)
- [NavuChangeDiffIterate(NavuNode, NavuContext, boolean, DiffIterateOperFlag[])](#s-NavuChangeDiffIterate-2)

**Methods**:

- [getChangeSet()](#s-getChangeSet)
- [iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object)](#s-iterate)

## Constructors

<a id="s-NavuChangeDiffIterate-1"></a>
### NavuChangeDiffIterate(NavuNode, NavuContext)

```java
protected NavuChangeDiffIterate(
    com.tailf.navu.NavuNode node,
    com.tailf.navu.NavuContext context
)
    throws com.tailf.navu.NavuException, com.tailf.conf.ConfException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuContext](NavuContext.md#s-NavuContext), [NavuException](NavuException.md#s-NavuException), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `com.tailf.navu.NavuContext context`

<a id="s-NavuChangeDiffIterate-2"></a>
### NavuChangeDiffIterate(NavuNode, NavuContext, boolean, DiffIterateOperFlag[])

```java
protected NavuChangeDiffIterate(
    com.tailf.navu.NavuNode node,
    com.tailf.navu.NavuContext context,
    boolean emitSubtree,
    com.tailf.conf.DiffIterateOperFlag[] forOps
)
    throws com.tailf.navu.NavuException, com.tailf.conf.ConfException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuContext](NavuContext.md#s-NavuContext), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag), [NavuException](NavuException.md#s-NavuException), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `com.tailf.navu.NavuContext context`
- `boolean emitSubtree`
- `com.tailf.conf.DiffIterateOperFlag[] forOps`


## Methods

<a id="s-getChangeSet"></a>
### getChangeSet()

```java
protected java.util.List<com.tailf.navu.NavuNode> getChangeSet()
```

Types: [NavuNode](NavuNode.md#s-NavuNode)

<a id="s-iterate"></a>
### iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object)

```java
public com.tailf.conf.DiffIterateResultFlag iterate(
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.DiffIterateOperFlag op,
    com.tailf.conf.ConfObject oldValue,
    com.tailf.conf.ConfObject newValue,
    Object initstate
)
```

Types: [DiffIterateResultFlag](../conf/DiffIterateResultFlag.md#s-DiffIterateResultFlag), [ConfObject](../conf/ConfObject.md#s-ConfObject), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfObject oldValue`
- `com.tailf.conf.ConfObject newValue`
- `Object initstate`
