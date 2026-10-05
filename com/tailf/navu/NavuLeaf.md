<a id="s-NavuLeaf"></a>
# NavuLeaf

```java
public class com.tailf.navu.NavuLeaf
    extends com.tailf.navu.NavuNode
```

Types: [NavuNode](NavuNode.md#s-NavuNode)

The `NavuLeaf` class corresponds to the
 YANG *leaf* and *leaf-list* node types.
 A `NavuLeaf` is a node in the NAVU-Tree that
 that does not have any children and holds a value.

 To retrieve a value the method `#value()` should be called
 which on first invocation retrieves the value through the current context.
 Subsequent calls to the `value` method will return the "cached"
 value.

 It is important to understand that the first call to `value`
 method will cache the value in the instance which means that
 subsequent calls to the `value` will return the
 cached value.

 To clear the cache held by an instance of `NavuLeaf`, the method
 `#reset()` should be called.

**Related classes**

- [NavuLeafList](NavuLeafList.md#s-NavuLeafList)

## Members

**Constructors**:

- [NavuLeaf(Maapi, int, MaapiSchemas, CSNode, NavuNode, String, Object[])](#s-NavuLeaf-1)
- [NavuLeaf(NavuContext, MaapiSchemas, CSNode, NavuNode, Formats)](#s-NavuLeaf-2)
- [NavuLeaf(NavuContext, MaapiSchemas, CSNode, NavuNode, String, Object[])](#s-NavuLeaf-3)

**Fields**:

- [arguments](NavuNode.md#s-arguments) from NavuNode
- [change](NavuNode.md#s-change) from NavuNode
- [context](NavuNode.md#s-context) from NavuNode
- [fmt](NavuNode.md#s-fmt) from NavuNode
- [isRefreshed](#s-isRefreshed)
- [mountId](NavuNode.md#s-mountId) from NavuNode
- [myConfPath](NavuNode.md#s-myConfPath) from NavuNode
- [node](NavuNode.md#s-node) from NavuNode
- [parent](NavuNode.md#s-parent) from NavuNode
- [val](#s-val)

**Methods**:

- [children()](NavuNode.md#s-children) from NavuNode
- [container(ConfNamespace, String)](NavuNode.md#s-container) from NavuNode
- [container(Integer)](NavuNode.md#s-container-1) from NavuNode
- [container(String)](NavuNode.md#s-container-2) from NavuNode
- [context()](NavuNode.md#s-context-1) from NavuNode
- [create()](#s-create)
- [delete()](#s-delete)
- [deref()](#s-deref)
- [encodeValues()](#s-encodeValues)
- [encodeXML()](#s-encodeXML)
- [equals(Object)](#s-equals)
- [exists()](#s-exists)
- [filterChildren(CSNode)](NavuNode.md#s-filterChildren) from NavuNode
- [getChangeFlag()](#s-getChangeFlag)
- [getChanges(NavuContext)](NavuNode.md#s-getChanges) from NavuNode
- [getChanges(NavuContext, boolean)](NavuNode.md#s-getChanges-1) from NavuNode
- [getChanges(NavuContext, boolean, DiffIterateOperFlag[])](NavuNode.md#s-getChanges-2) from NavuNode
- [getConfPath()](NavuNode.md#s-getConfPath) from NavuNode
- [getInfo()](NavuNode.md#s-getInfo) from NavuNode
- [getKeyPath()](NavuNode.md#s-getKeyPath) from NavuNode
- [getName()](NavuNode.md#s-getName) from NavuNode
- [getNavuNode(ConfPath)](NavuNode.md#s-getNavuNode) from NavuNode
- [getOldValue()](#s-getOldValue)
- [getParent()](#s-getParent)
- [getRootNS()](#s-getRootNS)
- [getValues(ConfXMLParam[])](NavuNode.md#s-getValues) from NavuNode
- [getValues(String)](#s-getValues)
- [hashCode()](#s-hashCode)
- [idrefDerivedOrSelf(ConfIdentityRef)](#s-idrefDerivedOrSelf)
- [isKey()](#s-isKey)
- [leaf(ConfNamespace, String)](NavuNode.md#s-leaf) from NavuNode
- [leaf(Integer)](NavuNode.md#s-leaf-1) from NavuNode
- [leaf(String)](NavuNode.md#s-leaf-2) from NavuNode
- [leafList(ConfNamespace, String)](NavuNode.md#s-leafList) from NavuNode
- [leafList(Integer)](NavuNode.md#s-leafList-1) from NavuNode
- [leafList(String)](NavuNode.md#s-leafList-2) from NavuNode
- [list(ConfNamespace, String)](NavuNode.md#s-list) from NavuNode
- [list(Integer)](NavuNode.md#s-list-1) from NavuNode
- [list(String)](NavuNode.md#s-list-2) from NavuNode
- [namespace(String)](NavuNode.md#s-namespace) from NavuNode
- [prefix(String)](NavuNode.md#s-prefix) from NavuNode
- [prepareXMLCall(String)](NavuNode.md#s-prepareXMLCall) from NavuNode
- [refresh()](#s-refresh)
- [reset()](#s-reset)
- [safeCreate()](#s-safeCreate)
- [select(ConfObject[])](#s-select)
- [select(List<String>)](#s-select-1)
- [select(String)](#s-select-2)
- [set(ConfValue)](#s-set)
- [set(String)](#s-set-1)
- [setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext)](#s-setChange)
- [setValues(ConfXMLParam[])](NavuNode.md#s-setValues) from NavuNode
- [setValues(String)](#s-setValues)
- [sharedCreate()](#s-sharedCreate)
- [sharedSet(ConfValue)](#s-sharedSet)
- [sharedSet(String)](#s-sharedSet-1)
- [sharedSetValues(ConfXMLParam[])](NavuNode.md#s-sharedSetValues) from NavuNode
- [sharedSetValues(String)](NavuNode.md#s-sharedSetValues-1) from NavuNode
- [stopCdbSession()](NavuNode.md#s-stopCdbSession) from NavuNode
- [toKey()](#s-toKey)
- [toString()](#s-toString)
- [value()](#s-value)
- [valueAsString()](#s-valueAsString)
- [valueUpdateInd(NavuNode)](#s-valueUpdateInd)
- [xPathSelect(String)](NavuNode.md#s-xPathSelect) from NavuNode
- [xPathSelectIterate(String, NavuNodeSetIterate)](NavuNode.md#s-xPathSelectIterate) from NavuNode

## Constructors

<a id="s-NavuLeaf-1"></a>
### NavuLeaf(Maapi, int, MaapiSchemas, CSNode, NavuNode, String, Object[])

```java
protected NavuLeaf(
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

This constructor creates a leaf node, and an attempt to read its
 value is made.

**Parameters**

- `com.tailf.maapi.Maapi m` - a MAAPI socket to use for MAAPI operations.
- `int handle` - a transaction handle to use for reading or writing.
- `com.tailf.maapi.MaapiSchemas sch` - a SCHEMA to use for queries regarding SCHEMA nodes.
- `com.tailf.maapi.MaapiSchemas.CSNode node` - the SCHEMA node information regarding this leaf node.
- `com.tailf.navu.NavuNode parent` - the parent node.
- `String fmt`
- `Object[] arguments`

<a id="s-NavuLeaf-2"></a>
### NavuLeaf(NavuContext, MaapiSchemas, CSNode, NavuNode, Formats)

```java
protected NavuLeaf(
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

<a id="s-NavuLeaf-3"></a>
### NavuLeaf(NavuContext, MaapiSchemas, CSNode, NavuNode, String, Object[])

```java
protected NavuLeaf(
    com.tailf.navu.NavuContext context,
    com.tailf.maapi.MaapiSchemas sch,
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.navu.NavuNode parent,
    String fmt,
    Object[] arguments
)
```

Types: [NavuContext](NavuContext.md#s-NavuContext), [MaapiSchemas](../maapi/MaapiSchemas.md#s-MaapiSchemas), [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [NavuNode](NavuNode.md#s-NavuNode)

Constructor.

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas sch`
- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.navu.NavuNode parent`
- `String fmt`
- `Object[] arguments`


## Fields

<a id="s-isRefreshed"></a>
### isRefreshed

```java
protected boolean isRefreshed = null;
```

<a id="s-val"></a>
### val

```java
protected com.tailf.conf.ConfValue val = null;
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue)


## Methods

<a id="s-create"></a>
### create()

```java
public void create() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Create an empty leaf node.

**Throws**

- `NavuException` - on failure to create

<a id="s-delete"></a>
### delete()

```java
public com.tailf.navu.NavuLeaf delete() throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#s-NavuLeaf), [NavuException](NavuException.md#s-NavuException)

Deletes a leaf.

**Returns:** a pointer to self.

**Throws**

- `NavuException`

<a id="s-deref"></a>
### deref()

```java
public java.util.List<com.tailf.navu.NavuNode> deref() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

Derefs a leafref and returns the referenced objects

**Returns:** array of keypaths where each keypath is an array of ConfObject

<a id="s-encodeValues"></a>
### encodeValues()

```java
public java.util.List<com.tailf.conf.ConfXMLParam> encodeValues() throws com.tailf.navu.NavuException
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [NavuException](NavuException.md#s-NavuException)

<a id="s-encodeXML"></a>
### encodeXML()

```java
public java.util.List<com.tailf.conf.ConfXMLParam> encodeXML() throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [NavuException](NavuException.md#s-NavuException)

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Compares the specified object with this `NavuLeaf`
 for equality.
 Returns `true` if the given object is also a
 `NavuLeaf` and it has the same [`ConfPath`](../conf/ConfPath.md#s-ConfPath) as this
 `NavuLeaf`. Note that the actual values held by the leaves
 (if any) are ignored as they are not relevant to this comparison.

**Parameters**

- `Object o` - the object to be compared for equality with this
          `NavuLeaf`

**Returns:** `true` if the specified object is equal to this
         `NavuLeaf`

<a id="s-exists"></a>
### exists()

```java
public boolean exists() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Tests for the existence of the leaf node.

**Throws**

- `NavuException` - on failure

<a id="s-getChangeFlag"></a>
### getChangeFlag()

```java
public com.tailf.conf.DiffIterateOperFlag getChangeFlag()
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag)

See: [`NavuNode.getChangeFlag()`](NavuNode.md#s-getChangeFlag)

<a id="s-getOldValue"></a>
### getOldValue()

```java
public com.tailf.conf.ConfValue getOldValue()
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue)

**Returns:** the old value. null if no old value exists.

<a id="s-getParent"></a>
### getParent()

```java
public com.tailf.navu.NavuNode getParent()
```

Types: [NavuNode](NavuNode.md#s-NavuNode)

<a id="s-getRootNS"></a>
### getRootNS()

```java
public com.tailf.conf.ConfNamespace getRootNS()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#s-ConfNamespace)

<a id="s-getValues"></a>
### getValues(String)

```java
public com.tailf.conf.ConfXMLParam[] getValues(String xml) throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `String xml`

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-idrefDerivedOrSelf"></a>
### idrefDerivedOrSelf(ConfIdentityRef)

```java
public boolean idrefDerivedOrSelf(
    com.tailf.conf.ConfIdentityRef base
)
    throws com.tailf.navu.NavuException
```

Types: [ConfIdentityRef](../conf/ConfIdentityRef.md#s-ConfIdentityRef), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.conf.ConfIdentityRef base`

<a id="s-isKey"></a>
### isKey()

```java
public boolean isKey()
```

Returns true if this `NavuLeaf` is a key node.

**Returns:** true whether this `NavuLeaf` is a key node
 false otherwise

<a id="s-refresh"></a>
### refresh()

```java
protected void refresh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

<a id="s-reset"></a>
### reset()

```java
public void reset()
```

When navigating through NAVU to a certain leaf and retrieving its value,
 this value will be cached.

 This method will reset the cache and indicate that the value should
 be re-read next time the value is retrieved.

<a id="s-safeCreate"></a>
### safeCreate()

```java
public void safeCreate() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Create an empty leaf node, silently succeeding
 if the leaf already exists

**Throws**

- `NavuException` - on failure to create

<a id="s-select"></a>
### select(ConfObject[])

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(com.tailf.conf.ConfObject[] query)
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [ConfObject](../conf/ConfObject.md#s-ConfObject)

**Parameters**

- `com.tailf.conf.ConfObject[] query`

<a id="s-select-1"></a>
### select(List<String>)

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    java.util.List<String> path
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `java.util.List<String> path`

<a id="s-select-2"></a>
### select(String)

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    String path
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `String path`

<a id="s-set"></a>
### set(ConfValue)

```java
public void set(com.tailf.conf.ConfValue val) throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [NavuException](NavuException.md#s-NavuException)

Sets the value of the leaf node.

 When setting a leaf node the cached value inside the instance
 is reflected. Subsequent calls to `value` retrieves
 the cached value.

 Setting a leaf value is only valid when writing to a
 transaction or when writing to operational data store.

  When writing to the operational data store the write
 is done with the [`CdbLockType`](../cdb/CdbLockType.md#s-CdbLockType) lock
 type set.

**Parameters**

- `com.tailf.conf.ConfValue val` - - the value to set

**Throws**

- `NavuException` - If an error occurred when setting the leaf
 value the underlying/caused exception is wrapped inside
 the NavuException and should be retrieved through
 `getCause` method of Throwable.

  An `IllegalArgumentException` is wrapped inside
 a `NavuException` if writes is done to
 running with `NavuContext` created with
 `CdbSession` or `Cdb`.

<a id="s-set-1"></a>
### set(String)

```java
public void set(String val) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Sets the value and tries to perform an update.

 For this to succeed, it must be possible to convert this string
 value into a value consistent with the type of the NavuLeaf.
 For example "123" if the YANG model has a leaf of, for example "int32".

**Parameters**

- `String val` - The string representation of a new value. For this to
 succeed, it must be possible to convert this string value into a value
 consistent with the type of the NavuLeaf. For example "123" if
 the YANG model has a leaf of, for example "int32".

**Throws**

- `NavuException`

<a id="s-setChange"></a>
### setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext)

```java
public com.tailf.navu.NavuNode setChange(
    java.util.List<com.tailf.conf.ConfObject> kp,
    com.tailf.conf.DiffIterateOperFlag op,
    com.tailf.conf.ConfValue oldValue,
    com.tailf.navu.NavuContext delContext
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [ConfObject](../conf/ConfObject.md#s-ConfObject), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag), [ConfValue](../conf/ConfValue.md#s-ConfValue), [NavuContext](NavuContext.md#s-NavuContext), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `java.util.List<com.tailf.conf.ConfObject> kp`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfValue oldValue`
- `com.tailf.navu.NavuContext delContext`

<a id="s-setValues"></a>
### setValues(String)

```java
public void setValues(String xml) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

This method is almost identical to `#set(String)` with the
  exception that the value should be wrapped inside XML tag.

  For example to set the value "123" it needs to be wrapped
  with "leaf-name123 /leaf-name.

**Parameters**

- `String xml` - A string value wrapped inside XML tag.

<a id="s-sharedCreate"></a>
### sharedCreate()

```java
public void sharedCreate() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Create an empty leaf node, silently succeeding
 if the leaf already exists and also maintain the
 FASTMAP reference counter on the leaf.

**Throws**

- `NavuException` - on failure to create

<a id="s-sharedSet"></a>
### sharedSet(ConfValue)

```java
public void sharedSet(com.tailf.conf.ConfValue val) throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [NavuException](NavuException.md#s-NavuException)

Sets the value of a leaf node with FastMap support, creating
 backpointers and reference counter similar to sharedCreate()
 All FastMap code shall (in principle) allways use this method instead
 of set()

**Parameters**

- `com.tailf.conf.ConfValue val`

<a id="s-sharedSet-1"></a>
### sharedSet(String)

```java
public void sharedSet(String val) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

SharedSet using string representation of value.

 Sets the value of a leaf node with FastMap support, creating
 backpointers and reference counter similar to sharedCreate()
 All FastMap code shall (in principle) always use this method instead
 of set()

**Parameters**

- `String val`

<a id="s-toKey"></a>
### toKey()

```java
public com.tailf.conf.ConfKey toKey() throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#s-ConfKey), [NavuException](NavuException.md#s-NavuException)

Convert the leaf value to a ConfKey. This is convenient, but only
 works for lists that have singleton keys.

**Returns:** the leaf value represented as a key.

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

<a id="s-value"></a>
### value()

```java
public com.tailf.conf.ConfValue value() throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [NavuException](NavuException.md#s-NavuException)

Returns the *effective* value on the first call,
 or cached value in the subsequent calls
 of this leaf.

 After this method has been called the first time
 it stores the value in this object which means
 that subsequent calls to this method will return the
 cached value.

**Returns:** the effective value (first call) or cached value
 in subsequent calls of this leaf.

<a id="s-valueAsString"></a>
### valueAsString()

```java
public String valueAsString() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Returns the Schema aware string representation of a leaf.

 An example of the difference between this method and
 `toString()` is
 for `ConfEnumerations` where the schema aware
 representation is the label
 while `toString()` returns a representation of
 the ordinal value.

**Returns:** String representation of the leaf

<a id="s-valueUpdateInd"></a>
### valueUpdateInd(NavuNode)

```java
public void valueUpdateInd(com.tailf.navu.NavuNode child)
```

Types: [NavuNode](NavuNode.md#s-NavuNode)

**Parameters**

- `com.tailf.navu.NavuNode child`
