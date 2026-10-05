<a id="cls-NavuLeaf"></a>
# NavuLeaf

```java
public class com.tailf.navu.NavuLeaf
    extends com.tailf.navu.NavuNode
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

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

- [NavuLeafList](NavuLeafList.md#cls-NavuLeafList)

## Members

**Constructors**:

- [NavuLeaf(Maapi, int, MaapiSchemas, CSNode, NavuNode, String, Object[])](#m-navuleaf-6b9cb35562bb)
- [NavuLeaf(NavuContext, MaapiSchemas, CSNode, NavuNode, Formats)](#m-navuleaf-cdaff80a0d08)
- [NavuLeaf(NavuContext, MaapiSchemas, CSNode, NavuNode, String, Object[])](#m-navuleaf-76b0a4cfb596)

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
- [encodeValues()](#m-encodevalues-7bd911383b1a)
- [encodeXML()](#m-encodexml-bdbcd52c2505)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [exists()](#m-exists-56968a4c7bda)
- [filterChildren(CSNode)](NavuNode.md#m-filterchildren-e72b7b1ab25d) from NavuNode
- [getChangeFlag()](#m-getchangeflag-33cadf5a32ba)
- [getChanges(NavuContext)](NavuNode.md#m-getchanges-c106383f174d) from NavuNode
- [getChanges(NavuContext, boolean)](NavuNode.md#m-getchanges-bcf5b6dbccf2) from NavuNode
- [getChanges(NavuContext, boolean, DiffIterateOperFlag[])](NavuNode.md#m-getchanges-9f13a683b086) from NavuNode
- [getConfPath()](NavuNode.md#m-getconfpath-c7ca3cb63c17) from NavuNode
- [getInfo()](NavuNode.md#m-getinfo-259a72b5d74c) from NavuNode
- [getKeyPath()](NavuNode.md#m-getkeypath-4c9200912948) from NavuNode
- [getName()](NavuNode.md#m-getname-2634b18b4a25) from NavuNode
- [getNavuNode(ConfPath)](NavuNode.md#m-getnavunode-d19ad1dd90fc) from NavuNode
- [getOldValue()](#m-getoldvalue-9e1eede07276)
- [getParent()](#m-getparent-45c1b196ed70)
- [getRootNS()](#m-getrootns-3f1d054cecd6)
- [getValues(ConfXMLParam[])](NavuNode.md#m-getvalues-1eb02439a757) from NavuNode
- [getValues(String)](#m-getvalues-c03de090764d)
- [hashCode()](#m-hashcode-ef797a217903)
- [idrefDerivedOrSelf(ConfIdentityRef)](#m-idrefderivedorself-d788d4007702)
- [isKey()](#m-iskey-7bdf17ac8255)
- [leaf(ConfNamespace, String)](NavuNode.md#m-leaf-da3758f37f21) from NavuNode
- [leaf(Integer)](NavuNode.md#m-leaf-47fda8402c20) from NavuNode
- [leaf(String)](NavuNode.md#m-leaf-ac189787d67d) from NavuNode
- [leafList(ConfNamespace, String)](NavuNode.md#m-leaflist-a2d5ad836b3e) from NavuNode
- [leafList(Integer)](NavuNode.md#m-leaflist-552c8007ecb4) from NavuNode
- [leafList(String)](NavuNode.md#m-leaflist-5811cbb534ec) from NavuNode
- [list(ConfNamespace, String)](NavuNode.md#m-list-6b15381fd14a) from NavuNode
- [list(Integer)](NavuNode.md#m-list-7dc96bdbb69a) from NavuNode
- [list(String)](NavuNode.md#m-list-2c1a74a3cf07) from NavuNode
- [namespace(String)](NavuNode.md#m-namespace-e29ad62ed095) from NavuNode
- [prefix(String)](NavuNode.md#m-prefix-fdd71b8275bb) from NavuNode
- [prepareXMLCall(String)](NavuNode.md#m-preparexmlcall-c22e250f2cac) from NavuNode
- [refresh()](#m-refresh-3852c3f76c8e)
- [reset()](#m-reset-6927918ac70a)
- [safeCreate()](#m-safecreate-8125e14d387f)
- [select(ConfObject[])](#m-select-336dd76cd112)
- [select(List<String>)](#m-select-e81f36150174)
- [select(String)](#m-select-5031325154b9)
- [set(ConfValue)](#m-set-974b7071ae31)
- [set(String)](#m-set-f04d84aad801)
- [setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext)](#m-setchange-0bbeb54ebc15)
- [setValues(ConfXMLParam[])](NavuNode.md#m-setvalues-50d8edffa795) from NavuNode
- [setValues(String)](#m-setvalues-3ec9581ce266)
- [sharedCreate()](#m-sharedcreate-7aef2e24f04b)
- [sharedSet(ConfValue)](#m-sharedset-fa8b98758fe5)
- [sharedSet(String)](#m-sharedset-2e970131c473)
- [sharedSetValues(ConfXMLParam[])](NavuNode.md#m-sharedsetvalues-705549be9df0) from NavuNode
- [sharedSetValues(String)](NavuNode.md#m-sharedsetvalues-ad93c38b671f) from NavuNode
- [stopCdbSession()](NavuNode.md#m-stopcdbsession-17418252a986) from NavuNode
- [toKey()](#m-tokey-87dff64e43ab)
- [toString()](#m-tostring-e9d48c5503ef)
- [value()](#m-value-9e1512d1a0ce)
- [valueAsString()](#m-valueasstring-27fd10adb145)
- [valueUpdateInd(NavuNode)](#m-valueupdateind-e7cd65f79d78)
- [xPathSelect(String)](NavuNode.md#m-xpathselect-0fb26b9f41e0) from NavuNode
- [xPathSelectIterate(String, NavuNodeSetIterate)](NavuNode.md#m-xpathselectiterate-12547f34f47c) from NavuNode

## Constructors

<a id="m-navuleaf-6b9cb35562bb"></a>
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

<a id="m-navuleaf-cdaff80a0d08"></a>
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

Types: [NavuContext](NavuContext.md#cls-NavuContext), [MaapiSchemas](../maapi/MaapiSchemas.md#cls-MaapiSchemas), [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [NavuNode](NavuNode.md#cls-NavuNode), [Formats](KeyPath2NavuNode/Formats.md#cls-Formats)

KeyPath2NavuNode specific constructor

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas sch`
- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.navu.NavuNode parent`
- `com.tailf.navu.KeyPath2NavuNode.Formats fs`

<a id="m-navuleaf-76b0a4cfb596"></a>
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

<a id="m-isRefreshed"></a>
### isRefreshed

```java
protected boolean isRefreshed = null;
```

<a id="m-val"></a>
### val

```java
protected com.tailf.conf.ConfValue val = null;
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue)


## Methods

<a id="m-create-06e0ee4a42c2"></a>
### create()

```java
public void create() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Create an empty leaf node.

**Throws**

- `NavuException` - on failure to create

<a id="m-delete-a9e76d49da61"></a>
### delete()

```java
public com.tailf.navu.NavuLeaf delete() throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#cls-NavuLeaf), [NavuException](NavuException.md#cls-NavuException)

Deletes a leaf.

**Returns:** a pointer to self.

**Throws**

- `NavuException`

<a id="m-deref-2626f40058b1"></a>
### deref()

```java
public java.util.List<com.tailf.navu.NavuNode> deref() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

Derefs a leafref and returns the referenced objects

**Returns:** array of keypaths where each keypath is an array of ConfObject

<a id="m-encodevalues-7bd911383b1a"></a>
### encodeValues()

```java
public java.util.List<com.tailf.conf.ConfXMLParam> encodeValues() throws com.tailf.navu.NavuException
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

<a id="m-encodexml-bdbcd52c2505"></a>
### encodeXML()

```java
public java.util.List<com.tailf.conf.ConfXMLParam> encodeXML() throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

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

<a id="m-exists-56968a4c7bda"></a>
### exists()

```java
public boolean exists() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Tests for the existence of the leaf node.

**Throws**

- `NavuException` - on failure

<a id="m-getchangeflag-33cadf5a32ba"></a>
### getChangeFlag()

```java
public com.tailf.conf.DiffIterateOperFlag getChangeFlag()
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag)

See: [`NavuNode.getChangeFlag()`](NavuNode.md#m-getchangeflag-33cadf5a32ba)

<a id="m-getoldvalue-9e1eede07276"></a>
### getOldValue()

```java
public com.tailf.conf.ConfValue getOldValue()
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue)

**Returns:** the old value. null if no old value exists.

<a id="m-getparent-45c1b196ed70"></a>
### getParent()

```java
public com.tailf.navu.NavuNode getParent()
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

<a id="m-getrootns-3f1d054cecd6"></a>
### getRootNS()

```java
public com.tailf.conf.ConfNamespace getRootNS()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace)

<a id="m-getvalues-c03de090764d"></a>
### getValues(String)

```java
public com.tailf.conf.ConfXMLParam[] getValues(String xml) throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String xml`

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```

<a id="m-idrefderivedorself-d788d4007702"></a>
### idrefDerivedOrSelf(ConfIdentityRef)

```java
public boolean idrefDerivedOrSelf(
    com.tailf.conf.ConfIdentityRef base
)
    throws com.tailf.navu.NavuException
```

Types: [ConfIdentityRef](../conf/ConfIdentityRef.md#cls-ConfIdentityRef), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.conf.ConfIdentityRef base`

<a id="m-iskey-7bdf17ac8255"></a>
### isKey()

```java
public boolean isKey()
```

Returns true if this `NavuLeaf` is a key node.

**Returns:** true whether this `NavuLeaf` is a key node
 false otherwise

<a id="m-refresh-3852c3f76c8e"></a>
### refresh()

```java
protected void refresh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

<a id="m-reset-6927918ac70a"></a>
### reset()

```java
public void reset()
```

When navigating through NAVU to a certain leaf and retrieving its value,
 this value will be cached.

 This method will reset the cache and indicate that the value should
 be re-read next time the value is retrieved.

<a id="m-safecreate-8125e14d387f"></a>
### safeCreate()

```java
public void safeCreate() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Create an empty leaf node, silently succeeding
 if the leaf already exists

**Throws**

- `NavuException` - on failure to create

<a id="m-select-336dd76cd112"></a>
### select(ConfObject[])

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(com.tailf.conf.ConfObject[] query)
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [ConfObject](../conf/ConfObject.md#cls-ConfObject)

**Parameters**

- `com.tailf.conf.ConfObject[] query`

<a id="m-select-e81f36150174"></a>
### select(List<String>)

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    java.util.List<String> path
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `java.util.List<String> path`

<a id="m-select-5031325154b9"></a>
### select(String)

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    String path
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String path`

<a id="m-set-974b7071ae31"></a>
### set(ConfValue)

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

<a id="m-set-f04d84aad801"></a>
### set(String)

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

<a id="m-setchange-0bbeb54ebc15"></a>
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

Types: [NavuNode](NavuNode.md#cls-NavuNode), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag), [ConfValue](../conf/ConfValue.md#cls-ConfValue), [NavuContext](NavuContext.md#cls-NavuContext), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `java.util.List<com.tailf.conf.ConfObject> kp`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfValue oldValue`
- `com.tailf.navu.NavuContext delContext`

<a id="m-setvalues-3ec9581ce266"></a>
### setValues(String)

```java
public void setValues(String xml) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

This method is almost identical to `#set(String)` with the
  exception that the value should be wrapped inside XML tag.

  For example to set the value "123" it needs to be wrapped
  with "leaf-name123 /leaf-name.

**Parameters**

- `String xml` - A string value wrapped inside XML tag.

<a id="m-sharedcreate-7aef2e24f04b"></a>
### sharedCreate()

```java
public void sharedCreate() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Create an empty leaf node, silently succeeding
 if the leaf already exists and also maintain the
 FASTMAP reference counter on the leaf.

**Throws**

- `NavuException` - on failure to create

<a id="m-sharedset-fa8b98758fe5"></a>
### sharedSet(ConfValue)

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

<a id="m-sharedset-2e970131c473"></a>
### sharedSet(String)

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

<a id="m-tokey-87dff64e43ab"></a>
### toKey()

```java
public com.tailf.conf.ConfKey toKey() throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#cls-ConfKey), [NavuException](NavuException.md#cls-NavuException)

Convert the leaf value to a ConfKey. This is convenient, but only
 works for lists that have singleton keys.

**Returns:** the leaf value represented as a key.

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

<a id="m-value-9e1512d1a0ce"></a>
### value()

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

<a id="m-valueasstring-27fd10adb145"></a>
### valueAsString()

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

<a id="m-valueupdateind-e7cd65f79d78"></a>
### valueUpdateInd(NavuNode)

```java
public void valueUpdateInd(com.tailf.navu.NavuNode child)
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

**Parameters**

- `com.tailf.navu.NavuNode child`
