# NavuLeaf <a href="#cls-NavuLeaf" id="cls-NavuLeaf"></a>

```java
public class com.tailf.navu.NavuLeaf
    extends com.tailf.navu.NavuNode
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

The `NavuLeaf` class corresponds to the
 YANG *leaf* and *leaf-list* node types.
 A `NavuLeaf` is a node in the NAVU-Tree that
 that does not have any children and holds a value.

 To retrieve a value the method [`value()`](NavuLeaf.md#m-value-9e1512d1a0ce) should be called
 which on first invocation retrieves the value through the current context.
 Subsequent calls to the `value` method will return the "cached"
 value.

 It is important to understand that the first call to `value`
 method will cache the value in the instance which means that
 subsequent calls to the `value` will return the
 cached value.

 To clear the cache held by an instance of `NavuLeaf`, the method
 [`reset()`](NavuLeaf.md#m-reset-6927918ac70a) should be called.

**Related classes**

- [NavuLeafList](NavuLeafList.md#cls-NavuLeafList)

## Members

**Constructors**:

- [NavuLeaf(Maapi, int, MaapiSchemas, CSNode, NavuNode, String, Object[])](#m-NavuLeaf-6b9cb35562bb)
- [NavuLeaf(NavuContext, MaapiSchemas, CSNode, NavuNode, Formats)](#m-NavuLeaf-cdaff80a0d08)
- [NavuLeaf(NavuContext, MaapiSchemas, CSNode, NavuNode, String, Object[])](#m-NavuLeaf-76b0a4cfb596)

**Fields**:

- [arguments](NavuNode.md#m-arguments) from NavuNode
- [change](NavuNode.md#m-change) from NavuNode
- [context](NavuNode.md#m-context) from NavuNode
- [fmt](NavuNode.md#m-fmt) from NavuNode
- [isRefreshed](#m-isRefreshed)
- [mountId](NavuNode.md#m-mountId) from NavuNode
- [myConfPath](NavuNode.md#m-myConfPath) from NavuNode
- [node](NavuNode.md#m-node) from NavuNode
- [parent](NavuNode.md#m-parent) from NavuNode
- [val](#m-val)

**Methods**:

- [children()](NavuNode.md#m-children-7d31300d62c3) from NavuNode
- [container(ConfNamespace, String)](NavuNode.md#m-container-31c604ba30e3) from NavuNode
- [container(Integer)](NavuNode.md#m-container-abb10ecdc3f6) from NavuNode
- [container(String)](NavuNode.md#m-container-76f5d191b16d) from NavuNode
- [context()](NavuNode.md#m-context-0990f1a0bb68) from NavuNode
- [create()](#m-create-06e0ee4a42c2)
- [delete()](#m-delete-a9e76d49da61)
- [deref()](#m-deref-2626f40058b1)
- [encodeValues()](#m-encodeValues-7bd911383b1a)
- [encodeXML()](#m-encodeXML-bdbcd52c2505)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [exists()](#m-exists-56968a4c7bda)
- [filterChildren(CSNode)](NavuNode.md#m-filterChildren-e72b7b1ab25d) from NavuNode
- [getChangeFlag()](#m-getChangeFlag-33cadf5a32ba)
- [getChanges(NavuContext)](NavuNode.md#m-getChanges-c106383f174d) from NavuNode
- [getChanges(NavuContext, boolean)](NavuNode.md#m-getChanges-bcf5b6dbccf2) from NavuNode
- [getChanges(NavuContext, boolean, DiffIterateOperFlag[])](NavuNode.md#m-getChanges-9f13a683b086) from NavuNode
- [getConfPath()](NavuNode.md#m-getConfPath-c7ca3cb63c17) from NavuNode
- [getInfo()](NavuNode.md#m-getInfo-259a72b5d74c) from NavuNode
- [getKeyPath()](NavuNode.md#m-getKeyPath-4c9200912948) from NavuNode
- [getName()](NavuNode.md#m-getName-2634b18b4a25) from NavuNode
- [getNavuNode(ConfPath)](NavuNode.md#m-getNavuNode-d19ad1dd90fc) from NavuNode
- [getOldValue()](#m-getOldValue-9e1eede07276)
- [getParent()](#m-getParent-45c1b196ed70)
- [getRootNS()](#m-getRootNS-3f1d054cecd6)
- [getValues(ConfXMLParam[])](NavuNode.md#m-getValues-1eb02439a757) from NavuNode
- [getValues(String)](#m-getValues-c03de090764d)
- [hashCode()](#m-hashCode-ef797a217903)
- [idrefDerivedOrSelf(ConfIdentityRef)](#m-idrefDerivedOrSelf-d788d4007702)
- [isKey()](#m-isKey-7bdf17ac8255)
- [leaf(ConfNamespace, String)](NavuNode.md#m-leaf-da3758f37f21) from NavuNode
- [leaf(Integer)](NavuNode.md#m-leaf-47fda8402c20) from NavuNode
- [leaf(String)](NavuNode.md#m-leaf-ac189787d67d) from NavuNode
- [leafList(ConfNamespace, String)](NavuNode.md#m-leafList-a2d5ad836b3e) from NavuNode
- [leafList(Integer)](NavuNode.md#m-leafList-552c8007ecb4) from NavuNode
- [leafList(String)](NavuNode.md#m-leafList-5811cbb534ec) from NavuNode
- [list(ConfNamespace, String)](NavuNode.md#m-list-6b15381fd14a) from NavuNode
- [list(Integer)](NavuNode.md#m-list-7dc96bdbb69a) from NavuNode
- [list(String)](NavuNode.md#m-list-2c1a74a3cf07) from NavuNode
- [namespace(String)](NavuNode.md#m-namespace-e29ad62ed095) from NavuNode
- [prefix(String)](NavuNode.md#m-prefix-fdd71b8275bb) from NavuNode
- [prepareXMLCall(String)](NavuNode.md#m-prepareXMLCall-c22e250f2cac) from NavuNode
- [refresh()](#m-refresh-3852c3f76c8e)
- [reset()](#m-reset-6927918ac70a)
- [safeCreate()](#m-safeCreate-8125e14d387f)
- [select(ConfObject[])](#m-select-336dd76cd112)
- [select(List<String>)](#m-select-e81f36150174)
- [select(String)](#m-select-5031325154b9)
- [set(ConfValue)](#m-set-974b7071ae31)
- [set(String)](#m-set-f04d84aad801)
- [setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext)](#m-setChange-0bbeb54ebc15)
- [setValues(ConfXMLParam[])](NavuNode.md#m-setValues-50d8edffa795) from NavuNode
- [setValues(String)](#m-setValues-3ec9581ce266)
- [sharedCreate()](#m-sharedCreate-7aef2e24f04b)
- [sharedSet(ConfValue)](#m-sharedSet-fa8b98758fe5)
- [sharedSet(String)](#m-sharedSet-2e970131c473)
- [sharedSetValues(ConfXMLParam[])](NavuNode.md#m-sharedSetValues-705549be9df0) from NavuNode
- [sharedSetValues(String)](NavuNode.md#m-sharedSetValues-ad93c38b671f) from NavuNode
- [stopCdbSession()](NavuNode.md#m-stopCdbSession-17418252a986) from NavuNode
- [toKey()](#m-toKey-87dff64e43ab)
- [toString()](#m-toString-e9d48c5503ef)
- [value()](#m-value-9e1512d1a0ce)
- [valueAsString()](#m-valueAsString-27fd10adb145)
- [valueUpdateInd(NavuNode)](#m-valueUpdateInd-e7cd65f79d78)
- [xPathSelect(String)](NavuNode.md#m-xPathSelect-0fb26b9f41e0) from NavuNode
- [xPathSelectIterate(String, NavuNodeSetIterate)](NavuNode.md#m-xPathSelectIterate-12547f34f47c) from NavuNode

## Constructors

### NavuLeaf(Maapi, int, MaapiSchemas, CSNode, NavuNode, String, Object[]) <a href="#m-NavuLeaf-6b9cb35562bb" id="m-NavuLeaf-6b9cb35562bb"></a>

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

Types: [Maapi](../maapi/Maapi.md#cls-Maapi), [MaapiSchemas](../maapi/MaapiSchemas.md#cls-MaapiSchemas), [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [NavuNode](NavuNode.md#cls-NavuNode)

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

### NavuLeaf(NavuContext, MaapiSchemas, CSNode, NavuNode, Formats) <a href="#m-NavuLeaf-cdaff80a0d08" id="m-NavuLeaf-cdaff80a0d08"></a>

```java
protected NavuLeaf(
    com.tailf.navu.NavuContext context,
    com.tailf.maapi.MaapiSchemas sch,
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.navu.NavuNode parent,
    com.tailf.navu.KeyPath2NavuNode.Formats fs
)
```

Types: [NavuContext](NavuContext.md#cls-NavuContext), [MaapiSchemas](../maapi/MaapiSchemas.md#cls-MaapiSchemas), [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [NavuNode](NavuNode.md#cls-NavuNode), [Formats](KeyPath2NavuNode/Formats.md#cls-Formats)

KeyPath2NavuNode specific constructor

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas sch`
- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.navu.NavuNode parent`
- `com.tailf.navu.KeyPath2NavuNode.Formats fs`

### NavuLeaf(NavuContext, MaapiSchemas, CSNode, NavuNode, String, Object[]) <a href="#m-NavuLeaf-76b0a4cfb596" id="m-NavuLeaf-76b0a4cfb596"></a>

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

Types: [NavuContext](NavuContext.md#cls-NavuContext), [MaapiSchemas](../maapi/MaapiSchemas.md#cls-MaapiSchemas), [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [NavuNode](NavuNode.md#cls-NavuNode)

Constructor.

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas sch`
- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.navu.NavuNode parent`
- `String fmt`
- `Object[] arguments`


## Fields

### isRefreshed <a href="#m-isRefreshed" id="m-isRefreshed"></a>

```java
protected boolean isRefreshed = null;
```

### val <a href="#m-val" id="m-val"></a>

```java
protected com.tailf.conf.ConfValue val = null;
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue)


## Methods

### create() <a href="#m-create-06e0ee4a42c2" id="m-create-06e0ee4a42c2"></a>

```java
public void create() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Create an empty leaf node.

**Throws**

- `NavuException` - on failure to create

### delete() <a href="#m-delete-a9e76d49da61" id="m-delete-a9e76d49da61"></a>

```java
public com.tailf.navu.NavuLeaf delete() throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#cls-NavuLeaf), [NavuException](NavuException.md#cls-NavuException)

Deletes a leaf.

**Returns:** a pointer to self.

**Throws**

- `NavuException`

### deref() <a href="#m-deref-2626f40058b1" id="m-deref-2626f40058b1"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> deref() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

Derefs a leafref and returns the referenced objects

**Returns:** array of keypaths where each keypath is an array of ConfObject

### encodeValues() <a href="#m-encodeValues-7bd911383b1a" id="m-encodeValues-7bd911383b1a"></a>

```java
public java.util.List<com.tailf.conf.ConfXMLParam> encodeValues() throws com.tailf.navu.NavuException
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

### encodeXML() <a href="#m-encodeXML-bdbcd52c2505" id="m-encodeXML-bdbcd52c2505"></a>

```java
public java.util.List<com.tailf.conf.ConfXMLParam> encodeXML() throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Compares the specified object with this `NavuLeaf`
 for equality.
 Returns `true` if the given object is also a
 `NavuLeaf` and it has the same [`ConfPath`](../conf/ConfPath.md#cls-ConfPath) as this
 `NavuLeaf`. Note that the actual values held by the leaves
 (if any) are ignored as they are not relevant to this comparison.

**Parameters**

- `Object o` - the object to be compared for equality with this
          `NavuLeaf`

**Returns:** `true` if the specified object is equal to this
         `NavuLeaf`

### exists() <a href="#m-exists-56968a4c7bda" id="m-exists-56968a4c7bda"></a>

```java
public boolean exists() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Tests for the existence of the leaf node.

**Throws**

- `NavuException` - on failure

### getChangeFlag() <a href="#m-getChangeFlag-33cadf5a32ba" id="m-getChangeFlag-33cadf5a32ba"></a>

```java
public com.tailf.conf.DiffIterateOperFlag getChangeFlag()
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag)

See: [`NavuNode.getChangeFlag()`](NavuNode.md#m-getChangeFlag-33cadf5a32ba)

### getOldValue() <a href="#m-getOldValue-9e1eede07276" id="m-getOldValue-9e1eede07276"></a>

```java
public com.tailf.conf.ConfValue getOldValue()
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue)

**Returns:** the old value. null if no old value exists.

### getParent() <a href="#m-getParent-45c1b196ed70" id="m-getParent-45c1b196ed70"></a>

```java
public com.tailf.navu.NavuNode getParent()
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

### getRootNS() <a href="#m-getRootNS-3f1d054cecd6" id="m-getRootNS-3f1d054cecd6"></a>

```java
public com.tailf.conf.ConfNamespace getRootNS()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace)

### getValues(String) <a href="#m-getValues-c03de090764d" id="m-getValues-c03de090764d"></a>

```java
public com.tailf.conf.ConfXMLParam[] getValues(String xml) throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String xml`

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### idrefDerivedOrSelf(ConfIdentityRef) <a href="#m-idrefDerivedOrSelf-d788d4007702" id="m-idrefDerivedOrSelf-d788d4007702"></a>

```java
public boolean idrefDerivedOrSelf(
    com.tailf.conf.ConfIdentityRef base
)
    throws com.tailf.navu.NavuException
```

Types: [ConfIdentityRef](../conf/ConfIdentityRef.md#cls-ConfIdentityRef), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.conf.ConfIdentityRef base`

### isKey() <a href="#m-isKey-7bdf17ac8255" id="m-isKey-7bdf17ac8255"></a>

```java
public boolean isKey()
```

Returns true if this `NavuLeaf` is a key node.

**Returns:** true whether this `NavuLeaf` is a key node
 false otherwise

### refresh() <a href="#m-refresh-3852c3f76c8e" id="m-refresh-3852c3f76c8e"></a>

```java
protected void refresh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

### reset() <a href="#m-reset-6927918ac70a" id="m-reset-6927918ac70a"></a>

```java
public void reset()
```

When navigating through NAVU to a certain leaf and retrieving its value,
 this value will be cached.

 This method will reset the cache and indicate that the value should
 be re-read next time the value is retrieved.

### safeCreate() <a href="#m-safeCreate-8125e14d387f" id="m-safeCreate-8125e14d387f"></a>

```java
public void safeCreate() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Create an empty leaf node, silently succeeding
 if the leaf already exists

**Throws**

- `NavuException` - on failure to create

### select(ConfObject[]) <a href="#m-select-336dd76cd112" id="m-select-336dd76cd112"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(com.tailf.conf.ConfObject[] query)
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [ConfObject](../conf/ConfObject.md#cls-ConfObject)

**Parameters**

- `com.tailf.conf.ConfObject[] query`

### select(List<String>) <a href="#m-select-e81f36150174" id="m-select-e81f36150174"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    java.util.List<String> path
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `java.util.List<String> path`

### select(String) <a href="#m-select-5031325154b9" id="m-select-5031325154b9"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    String path
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String path`

### set(ConfValue) <a href="#m-set-974b7071ae31" id="m-set-974b7071ae31"></a>

```java
public void set(com.tailf.conf.ConfValue val) throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue), [NavuException](NavuException.md#cls-NavuException)

Sets the value of the leaf node.

 When setting a leaf node the cached value inside the instance
 is reflected. Subsequent calls to `value` retrieves
 the cached value.

 Setting a leaf value is only valid when writing to a
 transaction or when writing to operational data store.

  When writing to the operational data store the write
 is done with the [`CdbLockType#LOCK_REQUEST`](../cdb/CdbLockType.md#m-LOCK_REQUEST) lock
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

### set(String) <a href="#m-set-f04d84aad801" id="m-set-f04d84aad801"></a>

```java
public void set(String val) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

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

### setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext) <a href="#m-setChange-0bbeb54ebc15" id="m-setChange-0bbeb54ebc15"></a>

```java
public com.tailf.navu.NavuNode setChange(
    java.util.List<com.tailf.conf.ConfObject> kp,
    com.tailf.conf.DiffIterateOperFlag op,
    com.tailf.conf.ConfValue oldValue,
    com.tailf.navu.NavuContext delContext
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag), [ConfValue](../conf/ConfValue.md#cls-ConfValue), [NavuContext](NavuContext.md#cls-NavuContext), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `java.util.List<com.tailf.conf.ConfObject> kp`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfValue oldValue`
- `com.tailf.navu.NavuContext delContext`

### setValues(String) <a href="#m-setValues-3ec9581ce266" id="m-setValues-3ec9581ce266"></a>

```java
public void setValues(String xml) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

This method is almost identical to [`set(String)`](NavuLeaf.md#m-set-f04d84aad801) with the
  exception that the value should be wrapped inside XML tag.

  For example to set the value "123" it needs to be wrapped
  with "leaf-name123 /leaf-name.

**Parameters**

- `String xml` - A string value wrapped inside XML tag.

### sharedCreate() <a href="#m-sharedCreate-7aef2e24f04b" id="m-sharedCreate-7aef2e24f04b"></a>

```java
public void sharedCreate() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Create an empty leaf node, silently succeeding
 if the leaf already exists and also maintain the
 FASTMAP reference counter on the leaf.

**Throws**

- `NavuException` - on failure to create

### sharedSet(ConfValue) <a href="#m-sharedSet-fa8b98758fe5" id="m-sharedSet-fa8b98758fe5"></a>

```java
public void sharedSet(com.tailf.conf.ConfValue val) throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue), [NavuException](NavuException.md#cls-NavuException)

Sets the value of a leaf node with FastMap support, creating
 backpointers and reference counter similar to sharedCreate()
 All FastMap code shall (in principle) allways use this method instead
 of set()

**Parameters**

- `com.tailf.conf.ConfValue val`

### sharedSet(String) <a href="#m-sharedSet-2e970131c473" id="m-sharedSet-2e970131c473"></a>

```java
public void sharedSet(String val) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

SharedSet using string representation of value.

 Sets the value of a leaf node with FastMap support, creating
 backpointers and reference counter similar to sharedCreate()
 All FastMap code shall (in principle) always use this method instead
 of set()

**Parameters**

- `String val`

### toKey() <a href="#m-toKey-87dff64e43ab" id="m-toKey-87dff64e43ab"></a>

```java
public com.tailf.conf.ConfKey toKey() throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#cls-ConfKey), [NavuException](NavuException.md#cls-NavuException)

Convert the leaf value to a ConfKey. This is convenient, but only
 works for lists that have singleton keys.

**Returns:** the leaf value represented as a key.

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

### value() <a href="#m-value-9e1512d1a0ce" id="m-value-9e1512d1a0ce"></a>

```java
public com.tailf.conf.ConfValue value() throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue), [NavuException](NavuException.md#cls-NavuException)

Returns the *effective* value on the first call,
 or cached value in the subsequent calls
 of this leaf.

 After this method has been called the first time
 it stores the value in this object which means
 that subsequent calls to this method will return the
 cached value.

**Returns:** the effective value (first call) or cached value
 in subsequent calls of this leaf.

### valueAsString() <a href="#m-valueAsString-27fd10adb145" id="m-valueAsString-27fd10adb145"></a>

```java
public String valueAsString() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Returns the Schema aware string representation of a leaf.

 An example of the difference between this method and
 `toString()` is
 for `ConfEnumerations` where the schema aware
 representation is the label
 while `toString()` returns a representation of
 the ordinal value.

**Returns:** String representation of the leaf

### valueUpdateInd(NavuNode) <a href="#m-valueUpdateInd-e7cd65f79d78" id="m-valueUpdateInd-e7cd65f79d78"></a>

```java
public void valueUpdateInd(com.tailf.navu.NavuNode child)
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

**Parameters**

- `com.tailf.navu.NavuNode child`
