<a id="s-NavuLeafList"></a>
# NavuLeafList

```java
public class com.tailf.navu.NavuLeafList
    extends com.tailf.navu.NavuLeaf
    implements Iterable<com.tailf.conf.ConfValue>
```

Types: [NavuLeaf](NavuLeaf.md#s-NavuLeaf), [ConfValue](../conf/ConfValue.md#s-ConfValue)

`NavuLeafList` is a representation of the *YANG* leaf-list.

 When accessing individual elements trough `containsNode`,
 `NavuLeafList` will only make one single `exists`
 call (over MAAPI or CDB depending on the context) to check the
 existence of the key, thus making the operation cheap.


 The set of leaf-list entries can be retrieved through `#elements()`
 or by retrieving an iterator `#iterator()`. The difference between the
 two is that `#elements()` will make a single call to retrieve all
 the leaf-list elements, while `#iterator()` will try to fetch
 leaf-list elements one by one using getNext() calls whenever possible.




```
 NavuNode parent = ...;
 NavuLeafList someLeafList = parent.leafList(someNamespace._someLeafList);

 for (ConfValue value : someLeafList) {
     // Here the elements will be fetched one by one
 }

 for (ConfValue value : someLeafList.elements()) {
     // Here the elements will be fetched using a single call
     // and stored in memory for the duration of the iteration
 }
```

## Members

**Constructors**:

- [NavuLeafList(Maapi, int, MaapiSchemas, CSNode, NavuNode, String, Object[])](#s-NavuLeafList-1)
- [NavuLeafList(NavuContext, MaapiSchemas, CSNode, NavuNode, Formats)](#s-NavuLeafList-2)
- [NavuLeafList(NavuContext, MaapiSchemas, CSNode, NavuNode, String, Object[])](#s-NavuLeafList-3)

**Fields**:

- [arguments](NavuNode.md#s-arguments) from NavuNode
- [change](NavuNode.md#s-change) from NavuNode
- [context](NavuNode.md#s-context) from NavuNode
- [fmt](NavuNode.md#s-fmt) from NavuNode
- [isRefreshed](NavuLeaf.md#s-isRefreshed) from NavuLeaf
- [mountId](NavuNode.md#s-mountId) from NavuNode
- [myConfPath](NavuNode.md#s-myConfPath) from NavuNode
- [node](NavuNode.md#s-node) from NavuNode
- [parent](NavuNode.md#s-parent) from NavuNode
- [val](NavuLeaf.md#s-val) from NavuLeaf

**Methods**:

- [children()](NavuNode.md#s-children) from NavuNode
- [container(ConfNamespace, String)](NavuNode.md#s-container) from NavuNode
- [container(Integer)](NavuNode.md#s-container-1) from NavuNode
- [container(String)](NavuNode.md#s-container-2) from NavuNode
- [containsNode(ConfValue)](#s-containsNode)
- [containsNode(String)](#s-containsNode-1)
- [context()](NavuNode.md#s-context-1) from NavuNode
- [create()](NavuLeaf.md#s-create) from NavuLeaf
- [create(ConfValue)](#s-create)
- [create(String)](#s-create-1)
- [delete()](NavuLeaf.md#s-delete) from NavuLeaf
- [delete(ConfValue)](#s-delete)
- [delete(String)](#s-delete-1)
- [deref()](NavuLeaf.md#s-deref) from NavuLeaf
- [elements()](#s-elements)
- [encode()](../conf/ConfValue.md#s-encode) from ConfValue
- [encodeValues()](NavuLeaf.md#s-encodeValues) from NavuLeaf
- [encodeXML()](NavuLeaf.md#s-encodeXML) from NavuLeaf
- [equals(Object)](NavuLeaf.md#s-equals) from NavuLeaf
- [exists()](NavuLeaf.md#s-exists) from NavuLeaf
- [filterChildren(CSNode)](NavuNode.md#s-filterChildren) from NavuNode
- [getChangeFlag()](NavuLeaf.md#s-getChangeFlag) from NavuLeaf
- [getChanges(NavuContext)](NavuNode.md#s-getChanges) from NavuNode
- [getChanges(NavuContext, boolean)](NavuNode.md#s-getChanges-1) from NavuNode
- [getChanges(NavuContext, boolean, DiffIterateOperFlag[])](NavuNode.md#s-getChanges-2) from NavuNode
- [getConfPath()](NavuNode.md#s-getConfPath) from NavuNode
- [getInfo()](NavuNode.md#s-getInfo) from NavuNode
- [getKeyPath()](NavuNode.md#s-getKeyPath) from NavuNode
- [getName()](NavuNode.md#s-getName) from NavuNode
- [getNavuNode(ConfPath)](NavuNode.md#s-getNavuNode) from NavuNode
- [getOldValue()](NavuLeaf.md#s-getOldValue) from NavuLeaf
- [getParent()](NavuLeaf.md#s-getParent) from NavuLeaf
- [getRootNS()](NavuLeaf.md#s-getRootNS) from NavuLeaf
- [getStringByValue(ConfPath, ConfValue)](../conf/ConfValue.md#s-getStringByValue) from ConfValue
- [getStringByValue(String, ConfValue)](../conf/ConfValue.md#s-getStringByValue-1) from ConfValue
- [getValueByString(ConfPath, String)](../conf/ConfValue.md#s-getValueByString) from ConfValue
- [getValueByString(String, String)](../conf/ConfValue.md#s-getValueByString-1) from ConfValue
- [getValues(ConfXMLParam[])](NavuNode.md#s-getValues) from NavuNode
- [getValues(String)](NavuLeaf.md#s-getValues) from NavuLeaf
- [hashCode()](NavuLeaf.md#s-hashCode) from NavuLeaf
- [idrefDerivedOrSelf(ConfIdentityRef)](NavuLeaf.md#s-idrefDerivedOrSelf) from NavuLeaf
- [isEmpty()](#s-isEmpty)
- [isKey()](NavuLeaf.md#s-isKey) from NavuLeaf
- [isNodeNavuLocal()](#s-isNodeNavuLocal)
- [iterator()](#s-iterator)
- [leaf(ConfNamespace, String)](NavuNode.md#s-leaf) from NavuNode
- [leaf(Integer)](NavuNode.md#s-leaf-1) from NavuNode
- [leaf(String)](NavuNode.md#s-leaf-2) from NavuNode
- [leafList(ConfNamespace, String)](NavuNode.md#s-leafList) from NavuNode
- [leafList(Integer)](NavuNode.md#s-leafList-1) from NavuNode
- [leafList(String)](NavuNode.md#s-leafList-2) from NavuNode
- [list(ConfNamespace, String)](NavuNode.md#s-list) from NavuNode
- [list(Integer)](NavuNode.md#s-list-1) from NavuNode
- [list(String)](NavuNode.md#s-list-2) from NavuNode
- [move(ConfValue, WhereTo, ConfValue)](#s-move)
- [move(String, WhereTo, String)](#s-move-1)
- [namespace(String)](NavuNode.md#s-namespace) from NavuNode
- [prefix(String)](NavuNode.md#s-prefix) from NavuNode
- [prepareXMLCall(String)](NavuNode.md#s-prepareXMLCall) from NavuNode
- [refresh()](NavuLeaf.md#s-refresh) from NavuLeaf
- [reset()](NavuLeaf.md#s-reset) from NavuLeaf
- [safeCreate()](NavuLeaf.md#s-safeCreate) from NavuLeaf
- [safeCreate(ConfValue)](#s-safeCreate)
- [safeCreate(String)](#s-safeCreate-1)
- [select(ConfObject[])](NavuLeaf.md#s-select) from NavuLeaf
- [select(List<String>)](NavuLeaf.md#s-select-1) from NavuLeaf
- [select(String)](NavuLeaf.md#s-select-2) from NavuLeaf
- [set(ConfValue)](NavuLeaf.md#s-set) from NavuLeaf
- [set(String)](NavuLeaf.md#s-set-1) from NavuLeaf
- [setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext)](NavuLeaf.md#s-setChange) from NavuLeaf
- [setValues(ConfXMLParam[])](NavuNode.md#s-setValues) from NavuNode
- [setValues(String)](NavuLeaf.md#s-setValues) from NavuLeaf
- [sharedCreate()](NavuLeaf.md#s-sharedCreate) from NavuLeaf
- [sharedCreate(ConfValue)](#s-sharedCreate)
- [sharedCreate(String)](#s-sharedCreate-1)
- [sharedSet(ConfValue)](NavuLeaf.md#s-sharedSet) from NavuLeaf
- [sharedSet(String)](NavuLeaf.md#s-sharedSet-1) from NavuLeaf
- [sharedSetValues(ConfXMLParam[])](NavuNode.md#s-sharedSetValues) from NavuNode
- [sharedSetValues(String)](NavuNode.md#s-sharedSetValues-1) from NavuNode
- [size()](#s-size)
- [stopCdbSession()](NavuNode.md#s-stopCdbSession) from NavuNode
- [toKey()](NavuLeaf.md#s-toKey) from NavuLeaf
- [toString()](NavuLeaf.md#s-toString) from NavuLeaf
- [value()](NavuLeaf.md#s-value) from NavuLeaf
- [valueAsString()](NavuLeaf.md#s-valueAsString) from NavuLeaf
- [valueUpdateInd(NavuNode)](NavuLeaf.md#s-valueUpdateInd) from NavuLeaf
- [xPathSelect(String)](NavuNode.md#s-xPathSelect) from NavuNode
- [xPathSelectIterate(String, NavuNodeSetIterate)](NavuNode.md#s-xPathSelectIterate) from NavuNode

**Nested Types**:

- [WhereTo](NavuLeafList/WhereTo.md#s-WhereTo)

## Constructors

<a id="s-NavuLeafList-1"></a>
### NavuLeafList(Maapi, int, MaapiSchemas, CSNode, NavuNode, String, Object[])

```java
protected NavuLeafList(
    com.tailf.maapi.Maapi m,
    int handle,
    com.tailf.maapi.MaapiSchemas sch,
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.navu.NavuNode parent,
    String fmt,
    Object[] arguments
)
```

Types: [Maapi](../maapi/Maapi.md#s-Maapi), [MaapiSchemas](../maapi/MaapiSchemas.md#s-MaapiSchemas), [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [NavuNode](NavuNode.md#s-NavuNode)

**Parameters**

- `com.tailf.maapi.Maapi m`
- `int handle`
- `com.tailf.maapi.MaapiSchemas sch`
- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.navu.NavuNode parent`
- `String fmt`
- `Object[] arguments`

<a id="s-NavuLeafList-2"></a>
### NavuLeafList(NavuContext, MaapiSchemas, CSNode, NavuNode, Formats)

```java
protected NavuLeafList(
    com.tailf.navu.NavuContext context,
    com.tailf.maapi.MaapiSchemas sch,
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.navu.NavuNode parent,
    com.tailf.navu.KeyPath2NavuNode.Formats fs
)
```

Types: [NavuContext](NavuContext.md#s-NavuContext), [MaapiSchemas](../maapi/MaapiSchemas.md#s-MaapiSchemas), [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [NavuNode](NavuNode.md#s-NavuNode), [Formats](KeyPath2NavuNode/Formats.md#s-Formats)

KeyPath2NavuNode specific constructor

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas sch`
- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.navu.NavuNode parent`
- `com.tailf.navu.KeyPath2NavuNode.Formats fs`

<a id="s-NavuLeafList-3"></a>
### NavuLeafList(NavuContext, MaapiSchemas, CSNode, NavuNode, String, Object[])

```java
protected NavuLeafList(
    com.tailf.navu.NavuContext context,
    com.tailf.maapi.MaapiSchemas sch,
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.navu.NavuNode parent,
    String fmt,
    Object[] arguments
)
```

Types: [NavuContext](NavuContext.md#s-NavuContext), [MaapiSchemas](../maapi/MaapiSchemas.md#s-MaapiSchemas), [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [NavuNode](NavuNode.md#s-NavuNode)

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas sch`
- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.navu.NavuNode parent`
- `String fmt`
- `Object[] arguments`


## Methods

<a id="s-containsNode"></a>
### containsNode(ConfValue)

```java
public boolean containsNode(com.tailf.conf.ConfValue elem) throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [NavuException](NavuException.md#s-NavuException)

Returns true if and only if this `NavuLeafList`
 contains this element.

**Parameters**

- `com.tailf.conf.ConfValue elem` - whose presence in this `NavuLeafList` is to be
 tested

**Returns:** `true` if this `NavuLeafList` contains the element

<a id="s-containsNode-1"></a>
### containsNode(String)

```java
public boolean containsNode(String elemStr) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Returns true if and only if this `NavuLeafList`
 contains this element.

**Parameters**

- `String elemStr` - string representation of the element whose presence
 in this `NavuLeafList` is to be tested

**Returns:** `true` if this `NavuLeafList` contains the element

<a id="s-create"></a>
### create(ConfValue)

```java
public void create(com.tailf.conf.ConfValue elem) throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [NavuException](NavuException.md#s-NavuException)

Creates leaf-list entry.

 We have 3 different variants of `create`.


2. `create()` This method creates the leaf-list entry.
 If such entry already exists tt will fail with a [`NavuException`](NavuException.md#s-NavuException)
 with the error code set to [`ErrorCode`](../conf/ErrorCode.md#s-ErrorCode).

   - `safeCreate()` similar to `create()`
 with the sole difference that is silently succeeds even if the
 leaf-list entry already exists.

     - `sharedCreate()` This method is useful when
 creating element in FASTMAP code, i.e code that implements
 a FASTMAP service. The `sharedCreate()`
 method maintains a reference counter on the created object.
 Furthermore, and attribute "backpointer" will be created on the created
 leaf-list entry indicating which "service" created the object

**Parameters**

- `com.tailf.conf.ConfValue elem` - the leaf-list entry to be created

**Throws**

- `NavuException` - if any MAAPI operations fail during the
  create or IOException if socket errors would occur,
  or such entry already exists

<a id="s-create-1"></a>
### create(String)

```java
public void create(String elemStr) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Creates leaf-list entry.

 We have 3 different variants of `create`.


2. `create()` This method creates the leaf-list entry.
 If such entry already exists tt will fail with a [`NavuException`](NavuException.md#s-NavuException)
 with the error code set to [`ErrorCode`](../conf/ErrorCode.md#s-ErrorCode).

   - `safeCreate()` similar to `create()`
 with the sole difference that is silently succeeds even if the
 leaf-list entry already exists.

     - `sharedCreate()` This method is useful when
 creating element in FASTMAP code, i.e code that implements
 a FASTMAP service. The `sharedCreate()`
 method maintains a reference counter on the created object.
 Furthermore, and attribute "backpointer" will be created on the created
 leaf-list entry indicating which "service" created the object

**Parameters**

- `String elemStr` - the string representation of the leaf-list entry
 to be created

**Throws**

- `NavuException` - if any MAAPI operations fail during the
  create or IOException if socket errors would occur,
  or such entry already exists.

<a id="s-delete"></a>
### delete(ConfValue)

```java
public void delete(com.tailf.conf.ConfValue elem) throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [NavuException](NavuException.md#s-NavuException)

Deletes an entry from the leaf-list.

**Parameters**

- `com.tailf.conf.ConfValue elem` - the element to delete.

**Throws**

- `NavuException` - If the method fails to delete the element.

<a id="s-delete-1"></a>
### delete(String)

```java
public void delete(String elemStr) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Deletes an entry from the leaf-list.

**Parameters**

- `String elemStr` - string representation of the element to delete.

**Throws**

- `NavuException` - If the method fails to delete the element.

<a id="s-elements"></a>
### elements()

```java
public java.util.Collection<com.tailf.conf.ConfValue> elements() throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [NavuException](NavuException.md#s-NavuException)

Returns a copy of elements contained by the leaf-list node.

**Returns:** a copy of the collection of list elements.

**Throws**

- `NavuException` - if the elements could not be retrieved.

<a id="s-isEmpty"></a>
### isEmpty()

```java
public boolean isEmpty() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Checks if there are any elements in the leaf-list.

**Returns:** true if there no list entries, false otherwise,

<a id="s-isNodeNavuLocal"></a>
### isNodeNavuLocal()

```java
public boolean isNodeNavuLocal()
```

<a id="s-iterator"></a>
### iterator()

```java
public java.util.Iterator<com.tailf.conf.ConfValue> iterator()
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue)

Retrieve a iterator over the elements in this `NavuLeafList`
 (in proper sequence).

<a id="s-move"></a>
### move(ConfValue, WhereTo, ConfValue)

```java
public void move(
    com.tailf.conf.ConfValue elem,
    com.tailf.navu.NavuLeafList.WhereTo whereTo,
    com.tailf.conf.ConfValue to
)
    throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [WhereTo](NavuLeafList/WhereTo.md#s-WhereTo), [NavuException](NavuException.md#s-NavuException)

Move a leaf-list element to a new position.

 The destination can be at the beginning, the end or in a relation
 to another element.

**Parameters**

- `com.tailf.conf.ConfValue elem` - Move elem according to whereTo
- `com.tailf.navu.NavuLeafList.WhereTo whereTo` - How the move should be performed. Move elem
                WhereTo.FIRST or WhereTo.LAST or move elem
                WhereTo.BEFORE or WhereTo.AFTER the element to.
- `com.tailf.conf.ConfValue to` - If the value of whereTo is WhereTo.FIRST or WhereTo.LAST
                this argument ignored

**Throws**

- `NavuException`

<a id="s-move-1"></a>
### move(String, WhereTo, String)

```java
public void move(
    String elemStr,
    com.tailf.navu.NavuLeafList.WhereTo whereTo,
    String toStr
)
    throws com.tailf.navu.NavuException
```

Types: [WhereTo](NavuLeafList/WhereTo.md#s-WhereTo), [NavuException](NavuException.md#s-NavuException)

Move a leaf-list element to a new position.

 The destination
 can be at the beginning, the end or in a relation to another element.
 Elements are referenced by their string representation.
 See also: [`ConfValue`](../conf/ConfValue.md#s-ConfValue)

**Parameters**

- `String elemStr` - Move elemStr according to whereTo
- `com.tailf.navu.NavuLeafList.WhereTo whereTo` - How the move should be performed. Move elemStr
                WhereTo.FIRST or WhereTo.LAST or move elemStr
                WhereTo.BEFORE or WhereTo.AFTER the element toStr.
- `String toStr` - If the value of whereTo is WhereTo.FIRST or WhereTo.LAST
                this argument ignored

**Throws**

- `NavuException`

<a id="s-safeCreate"></a>
### safeCreate(ConfValue)

```java
public void safeCreate(com.tailf.conf.ConfValue elem) throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [NavuException](NavuException.md#s-NavuException)

The variant of `create` that succeeds even if the
 object already exists.

**Parameters**

- `com.tailf.conf.ConfValue elem` - the leaf-list entry to be created

**Throws**

- `NavuException` - if any MAAPI operations fail during the
  create or IOException if socket errors would occur.

<a id="s-safeCreate-1"></a>
### safeCreate(String)

```java
public void safeCreate(String elemStr) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

The variant of `create` that succeeds even if the
 object already exists.

**Parameters**

- `String elemStr` - the string representation of the leaf-list entry
 to be created

**Throws**

- `NavuException` - if any MAAPI operations fail during the
  create or IOException if socket errors would occur.

<a id="s-sharedCreate"></a>
### sharedCreate(ConfValue)

```java
public void sharedCreate(com.tailf.conf.ConfValue elem) throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [NavuException](NavuException.md#s-NavuException)

The variant of `create` that succeeds even if the
 object already exists, and also maintains a reference counter
 on the object. When the FASTMAP algorithm applies to objects
 created with `sharedCreate` the object is not
 removed, but rather the reference counter is decremented.

**Parameters**

- `com.tailf.conf.ConfValue elem` - the leaf-list entry to be created

**Throws**

- `NavuException` - if any MAAPI operations fail during the
  create or IOException if socket errors would occur.

<a id="s-sharedCreate-1"></a>
### sharedCreate(String)

```java
public void sharedCreate(String elemStr) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

The variant of `create` that succeeds even if the
 object already exists, and also maintains a reference counter
 on the object. When The FASTMAP algorithm applies to objects
 created with `sharedCreate` the object is not
 removed, but rather the reference counter is decremented.

**Parameters**

- `String elemStr` - the string representation of the leaf-list entry
 to be created

**Throws**

- `NavuException` - if any MAAPI operations fail during the
  create or IOException if socket errors would occur.

<a id="s-size"></a>
### size()

```java
public int size() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Returns the number of leaf-list elements contained by the leaf-list.

**Returns:** the number of elements.


## Nested Types

- [WhereTo](NavuLeafList/WhereTo.md)
