# NavuLeaf <a href="#navuleaf-aa68380b180b" id="navuleaf-aa68380b180b"></a>

```java
public class com.tailf.navu.NavuLeaf
    extends com.tailf.navu.NavuNode
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db)

The `NavuLeaf` class corresponds to the
 YANG *leaf* and *leaf-list* node types.
 A `NavuLeaf` is a node in the NAVU-Tree that
 that does not have any children and holds a value.

 To retrieve a value the method [`value()`](NavuLeaf.md#value-9e1512d1a0ce) should be called
 which on first invocation retrieves the value through the current context.
 Subsequent calls to the `value` method will return the "cached"
 value.

 It is important to understand that the first call to `value`
 method will cache the value in the instance which means that
 subsequent calls to the `value` will return the
 cached value.

 To clear the cache held by an instance of `NavuLeaf`, the method
 [`reset()`](NavuLeaf.md#reset-6927918ac70a) should be called.

**Related classes**

- [NavuLeafList](NavuLeafList.md#navuleaflist-8d16c43a9b96)

## Members

**Constructors**:

- [NavuLeaf\(Maapi, int, MaapiSchemas, CSNode, NavuNode, String, Object\[\]\)](#navuleaf-6b9cb35562bb)
- [NavuLeaf\(NavuContext, MaapiSchemas, CSNode, NavuNode, Formats\)](#navuleaf-cdaff80a0d08)
- [NavuLeaf\(NavuContext, MaapiSchemas, CSNode, NavuNode, String, Object\[\]\)](#navuleaf-76b0a4cfb596)

**Fields**:

- [arguments](NavuNode.md#arguments-28ffa3c54d2c) from NavuNode
- [change](NavuNode.md#change-470927160c2a) from NavuNode
- [context](NavuNode.md#context-b9bed500f8c9) from NavuNode
- [fmt](NavuNode.md#fmt-94d3250bd2b9) from NavuNode
- [isRefreshed](#isrefreshed-17594a091fc4)
- [mountId](NavuNode.md#mountid-a6b63dedba52) from NavuNode
- [myConfPath](NavuNode.md#myconfpath-cec7a88dfaf3) from NavuNode
- [node](NavuNode.md#node-ff68e6a3ebc6) from NavuNode
- [parent](NavuNode.md#parent-26ad1434956a) from NavuNode
- [val](#val-a02e160da60f)

**Methods**:

- [children\(\)](NavuNode.md#children-7d31300d62c3) from NavuNode
- [container\(ConfNamespace, String\)](NavuNode.md#container-31c604ba30e3) from NavuNode
- [container\(Integer\)](NavuNode.md#container-abb10ecdc3f6) from NavuNode
- [container\(String\)](NavuNode.md#container-76f5d191b16d) from NavuNode
- [context\(\)](NavuNode.md#context-0990f1a0bb68) from NavuNode
- [create\(\)](#create-06e0ee4a42c2)
- [delete\(\)](#delete-a9e76d49da61)
- [deref\(\)](#deref-2626f40058b1)
- [encodeValues\(\)](#encodevalues-7bd911383b1a)
- [encodeXML\(\)](#encodexml-bdbcd52c2505)
- [equals\(Object\)](#equals-fcd6492e0d6c)
- [exists\(\)](#exists-56968a4c7bda)
- [filterChildren\(CSNode\)](NavuNode.md#filterchildren-e72b7b1ab25d) from NavuNode
- [getChangeFlag\(\)](#getchangeflag-33cadf5a32ba)
- [getChanges\(NavuContext\)](NavuNode.md#getchanges-c106383f174d) from NavuNode
- [getChanges\(NavuContext, boolean\)](NavuNode.md#getchanges-bcf5b6dbccf2) from NavuNode
- [getChanges\(NavuContext, boolean, DiffIterateOperFlag\[\]\)](NavuNode.md#getchanges-9f13a683b086) from NavuNode
- [getConfPath\(\)](NavuNode.md#getconfpath-c7ca3cb63c17) from NavuNode
- [getInfo\(\)](NavuNode.md#getinfo-259a72b5d74c) from NavuNode
- [getKeyPath\(\)](NavuNode.md#getkeypath-4c9200912948) from NavuNode
- [getName\(\)](NavuNode.md#getname-2634b18b4a25) from NavuNode
- [getNavuNode\(ConfPath\)](NavuNode.md#getnavunode-d19ad1dd90fc) from NavuNode
- [getOldValue\(\)](#getoldvalue-9e1eede07276)
- [getParent\(\)](#getparent-45c1b196ed70)
- [getRootNS\(\)](#getrootns-3f1d054cecd6)
- [getValues\(ConfXMLParam\[\]\)](NavuNode.md#getvalues-1eb02439a757) from NavuNode
- [getValues\(String\)](#getvalues-c03de090764d)
- [hashCode\(\)](#hashcode-ef797a217903)
- [idrefDerivedOrSelf\(ConfIdentityRef\)](#idrefderivedorself-d788d4007702)
- [isKey\(\)](#iskey-7bdf17ac8255)
- [leaf\(ConfNamespace, String\)](NavuNode.md#leaf-da3758f37f21) from NavuNode
- [leaf\(Integer\)](NavuNode.md#leaf-47fda8402c20) from NavuNode
- [leaf\(String\)](NavuNode.md#leaf-ac189787d67d) from NavuNode
- [leafList\(ConfNamespace, String\)](NavuNode.md#leaflist-a2d5ad836b3e) from NavuNode
- [leafList\(Integer\)](NavuNode.md#leaflist-552c8007ecb4) from NavuNode
- [leafList\(String\)](NavuNode.md#leaflist-5811cbb534ec) from NavuNode
- [list\(ConfNamespace, String\)](NavuNode.md#list-6b15381fd14a) from NavuNode
- [list\(Integer\)](NavuNode.md#list-7dc96bdbb69a) from NavuNode
- [list\(String\)](NavuNode.md#list-2c1a74a3cf07) from NavuNode
- [namespace\(String\)](NavuNode.md#namespace-e29ad62ed095) from NavuNode
- [prefix\(String\)](NavuNode.md#prefix-fdd71b8275bb) from NavuNode
- [prepareXMLCall\(String\)](NavuNode.md#preparexmlcall-c22e250f2cac) from NavuNode
- [refresh\(\)](#refresh-3852c3f76c8e)
- [reset\(\)](#reset-6927918ac70a)
- [safeCreate\(\)](#safecreate-8125e14d387f)
- [select\(ConfObject\[\]\)](#select-336dd76cd112)
- [select\(List\<String\>\)](#select-e81f36150174)
- [select\(String\)](#select-5031325154b9)
- [set\(ConfValue\)](#set-974b7071ae31)
- [set\(String\)](#set-f04d84aad801)
- [setChange\(List\<ConfObject\>, DiffIterateOperFlag, ConfValue, NavuContext\)](#setchange-0bbeb54ebc15)
- [setValues\(ConfXMLParam\[\]\)](NavuNode.md#setvalues-50d8edffa795) from NavuNode
- [setValues\(String\)](#setvalues-3ec9581ce266)
- [sharedCreate\(\)](#sharedcreate-7aef2e24f04b)
- [sharedSet\(ConfValue\)](#sharedset-fa8b98758fe5)
- [sharedSet\(String\)](#sharedset-2e970131c473)
- [sharedSetValues\(ConfXMLParam\[\]\)](NavuNode.md#sharedsetvalues-705549be9df0) from NavuNode
- [sharedSetValues\(String\)](NavuNode.md#sharedsetvalues-ad93c38b671f) from NavuNode
- [stopCdbSession\(\)](NavuNode.md#stopcdbsession-17418252a986) from NavuNode
- [toKey\(\)](#tokey-87dff64e43ab)
- [toString\(\)](#tostring-e9d48c5503ef)
- [value\(\)](#value-9e1512d1a0ce)
- [valueAsString\(\)](#valueasstring-27fd10adb145)
- [valueUpdateInd\(NavuNode\)](#valueupdateind-e7cd65f79d78)
- [xPathSelect\(String\)](NavuNode.md#xpathselect-0fb26b9f41e0) from NavuNode
- [xPathSelectIterate\(String, NavuNodeSetIterate\)](NavuNode.md#xpathselectiterate-12547f34f47c) from NavuNode

## Constructors

### NavuLeaf(Maapi, int, MaapiSchemas, CSNode, NavuNode, String, Object[]) <a href="#navuleaf-6b9cb35562bb" id="navuleaf-6b9cb35562bb"></a>

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

Types: [Maapi](../maapi/Maapi.md#maapi-67bcbe89c42e), [MaapiSchemas](../maapi/MaapiSchemas.md#maapischemas-821ac70b83b7), [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [NavuNode](NavuNode.md#navunode-73944820c8db)

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

### NavuLeaf(NavuContext, MaapiSchemas, CSNode, NavuNode, Formats) <a href="#navuleaf-cdaff80a0d08" id="navuleaf-cdaff80a0d08"></a>

```java
protected NavuLeaf(
    com.tailf.navu.NavuContext context,
    com.tailf.maapi.MaapiSchemas sch,
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.navu.NavuNode parent,
    com.tailf.navu.KeyPath2NavuNode.Formats fs
)
```

Types: [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [MaapiSchemas](../maapi/MaapiSchemas.md#maapischemas-821ac70b83b7), [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [NavuNode](NavuNode.md#navunode-73944820c8db), [Formats](KeyPath2NavuNode/Formats.md#formats-699695f9b70f)

KeyPath2NavuNode specific constructor

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas sch`
- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.navu.NavuNode parent`
- `com.tailf.navu.KeyPath2NavuNode.Formats fs`

### NavuLeaf(NavuContext, MaapiSchemas, CSNode, NavuNode, String, Object[]) <a href="#navuleaf-76b0a4cfb596" id="navuleaf-76b0a4cfb596"></a>

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

Types: [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [MaapiSchemas](../maapi/MaapiSchemas.md#maapischemas-821ac70b83b7), [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [NavuNode](NavuNode.md#navunode-73944820c8db)

Constructor.

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas sch`
- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.navu.NavuNode parent`
- `String fmt`
- `Object[] arguments`


## Fields

### isRefreshed <a href="#isrefreshed-17594a091fc4" id="isrefreshed-17594a091fc4"></a>

```java
protected boolean isRefreshed = null;
```

### val <a href="#val-a02e160da60f" id="val-a02e160da60f"></a>

```java
protected com.tailf.conf.ConfValue val = null;
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d)


## Methods

### create() <a href="#create-06e0ee4a42c2" id="create-06e0ee4a42c2"></a>

```java
public void create() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Create an empty leaf node.

**Throws**

- `NavuException` - on failure to create

### delete() <a href="#delete-a9e76d49da61" id="delete-a9e76d49da61"></a>

```java
public com.tailf.navu.NavuLeaf delete() throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#navuleaf-aa68380b180b), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Deletes a leaf.

**Returns:** a pointer to self.

**Throws**

- `NavuException`

### deref() <a href="#deref-2626f40058b1" id="deref-2626f40058b1"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> deref() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Derefs a leafref and returns the referenced objects

**Returns:** array of keypaths where each keypath is an array of ConfObject

### encodeValues() <a href="#encodevalues-7bd911383b1a" id="encodevalues-7bd911383b1a"></a>

```java
public java.util.List<com.tailf.conf.ConfXMLParam> encodeValues() throws com.tailf.navu.NavuException
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

### encodeXML() <a href="#encodexml-bdbcd52c2505" id="encodexml-bdbcd52c2505"></a>

```java
public java.util.List<com.tailf.conf.ConfXMLParam> encodeXML() throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Compares the specified object with this `NavuLeaf`
 for equality.
 Returns `true` if the given object is also a
 `NavuLeaf` and it has the same [`ConfPath`](../conf/ConfPath.md#confpath-327831c6fc7d) as this
 `NavuLeaf`. Note that the actual values held by the leaves
 (if any) are ignored as they are not relevant to this comparison.

**Parameters**

- `Object o` - the object to be compared for equality with this
          `NavuLeaf`

**Returns:** `true` if the specified object is equal to this
         `NavuLeaf`

### exists() <a href="#exists-56968a4c7bda" id="exists-56968a4c7bda"></a>

```java
public boolean exists() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Tests for the existence of the leaf node.

**Throws**

- `NavuException` - on failure

### getChangeFlag() <a href="#getchangeflag-33cadf5a32ba" id="getchangeflag-33cadf5a32ba"></a>

```java
public com.tailf.conf.DiffIterateOperFlag getChangeFlag()
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec)

See: [`NavuNode.getChangeFlag()`](NavuNode.md#getchangeflag-33cadf5a32ba)

### getOldValue() <a href="#getoldvalue-9e1eede07276" id="getoldvalue-9e1eede07276"></a>

```java
public com.tailf.conf.ConfValue getOldValue()
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d)

**Returns:** the old value. null if no old value exists.

### getParent() <a href="#getparent-45c1b196ed70" id="getparent-45c1b196ed70"></a>

```java
public com.tailf.navu.NavuNode getParent()
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db)

### getRootNS() <a href="#getrootns-3f1d054cecd6" id="getrootns-3f1d054cecd6"></a>

```java
public com.tailf.conf.ConfNamespace getRootNS()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1)

### getValues(String) <a href="#getvalues-c03de090764d" id="getvalues-c03de090764d"></a>

```java
public com.tailf.conf.ConfXMLParam[] getValues(String xml) throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `String xml`

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

### idrefDerivedOrSelf(ConfIdentityRef) <a href="#idrefderivedorself-d788d4007702" id="idrefderivedorself-d788d4007702"></a>

```java
public boolean idrefDerivedOrSelf(
    com.tailf.conf.ConfIdentityRef base
)
    throws com.tailf.navu.NavuException
```

Types: [ConfIdentityRef](../conf/ConfIdentityRef.md#confidentityref-1a367056e764), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.conf.ConfIdentityRef base`

### isKey() <a href="#iskey-7bdf17ac8255" id="iskey-7bdf17ac8255"></a>

```java
public boolean isKey()
```

Returns true if this `NavuLeaf` is a key node.

**Returns:** true whether this `NavuLeaf` is a key node
 false otherwise

### refresh() <a href="#refresh-3852c3f76c8e" id="refresh-3852c3f76c8e"></a>

```java
protected void refresh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

### reset() <a href="#reset-6927918ac70a" id="reset-6927918ac70a"></a>

```java
public void reset()
```

When navigating through NAVU to a certain leaf and retrieving its value,
 this value will be cached.

 This method will reset the cache and indicate that the value should
 be re-read next time the value is retrieved.

### safeCreate() <a href="#safecreate-8125e14d387f" id="safecreate-8125e14d387f"></a>

```java
public void safeCreate() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Create an empty leaf node, silently succeeding
 if the leaf already exists

**Throws**

- `NavuException` - on failure to create

### select(ConfObject[]) <a href="#select-336dd76cd112" id="select-336dd76cd112"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(com.tailf.conf.ConfObject[] query)
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [ConfObject](../conf/ConfObject.md#confobject-5433616953b2)

**Parameters**

- `com.tailf.conf.ConfObject[] query`

### select(List&lt;String&gt;) <a href="#select-e81f36150174" id="select-e81f36150174"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    java.util.List<String> path
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `java.util.List<String> path`

### select(String) <a href="#select-5031325154b9" id="select-5031325154b9"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    String path
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `String path`

### set(ConfValue) <a href="#set-974b7071ae31" id="set-974b7071ae31"></a>

```java
public void set(com.tailf.conf.ConfValue val) throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Sets the value of the leaf node.

 When setting a leaf node the cached value inside the instance
 is reflected. Subsequent calls to `value` retrieves
 the cached value.

 Setting a leaf value is only valid when writing to a
 transaction or when writing to operational data store.

  When writing to the operational data store the write
 is done with the [`CdbLockType#LOCK_REQUEST`](../cdb/CdbLockType.md#lock_request-7644a883c14e) lock
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

### set(String) <a href="#set-f04d84aad801" id="set-f04d84aad801"></a>

```java
public void set(String val) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

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

### setChange(List&lt;ConfObject&gt;, DiffIterateOperFlag, ConfValue, NavuContext) <a href="#setchange-0bbeb54ebc15" id="setchange-0bbeb54ebc15"></a>

```java
public com.tailf.navu.NavuNode setChange(
    java.util.List<com.tailf.conf.ConfObject> kp,
    com.tailf.conf.DiffIterateOperFlag op,
    com.tailf.conf.ConfValue oldValue,
    com.tailf.navu.NavuContext delContext
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec), [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `java.util.List<com.tailf.conf.ConfObject> kp`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfValue oldValue`
- `com.tailf.navu.NavuContext delContext`

### setValues(String) <a href="#setvalues-3ec9581ce266" id="setvalues-3ec9581ce266"></a>

```java
public void setValues(String xml) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

This method is almost identical to [`set(String)`](NavuLeaf.md#set-f04d84aad801) with the
  exception that the value should be wrapped inside XML tag.

  For example to set the value "123" it needs to be wrapped
  with "leaf-name123 /leaf-name.

**Parameters**

- `String xml` - A string value wrapped inside XML tag.

### sharedCreate() <a href="#sharedcreate-7aef2e24f04b" id="sharedcreate-7aef2e24f04b"></a>

```java
public void sharedCreate() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Create an empty leaf node, silently succeeding
 if the leaf already exists and also maintain the
 FASTMAP reference counter on the leaf.

**Throws**

- `NavuException` - on failure to create

### sharedSet(ConfValue) <a href="#sharedset-fa8b98758fe5" id="sharedset-fa8b98758fe5"></a>

```java
public void sharedSet(com.tailf.conf.ConfValue val) throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Sets the value of a leaf node with FastMap support, creating
 backpointers and reference counter similar to sharedCreate()
 All FastMap code shall (in principle) allways use this method instead
 of set()

**Parameters**

- `com.tailf.conf.ConfValue val`

### sharedSet(String) <a href="#sharedset-2e970131c473" id="sharedset-2e970131c473"></a>

```java
public void sharedSet(String val) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

SharedSet using string representation of value.

 Sets the value of a leaf node with FastMap support, creating
 backpointers and reference counter similar to sharedCreate()
 All FastMap code shall (in principle) always use this method instead
 of set()

**Parameters**

- `String val`

### toKey() <a href="#tokey-87dff64e43ab" id="tokey-87dff64e43ab"></a>

```java
public com.tailf.conf.ConfKey toKey() throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Convert the leaf value to a ConfKey. This is convenient, but only
 works for lists that have singleton keys.

**Returns:** the leaf value represented as a key.

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

### value() <a href="#value-9e1512d1a0ce" id="value-9e1512d1a0ce"></a>

```java
public com.tailf.conf.ConfValue value() throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns the *effective* value on the first call,
 or cached value in the subsequent calls
 of this leaf.

 After this method has been called the first time
 it stores the value in this object which means
 that subsequent calls to this method will return the
 cached value.

**Returns:** the effective value (first call) or cached value
 in subsequent calls of this leaf.

### valueAsString() <a href="#valueasstring-27fd10adb145" id="valueasstring-27fd10adb145"></a>

```java
public String valueAsString() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns the Schema aware string representation of a leaf.

 An example of the difference between this method and
 `toString()` is
 for `ConfEnumerations` where the schema aware
 representation is the label
 while `toString()` returns a representation of
 the ordinal value.

**Returns:** String representation of the leaf

### valueUpdateInd(NavuNode) <a href="#valueupdateind-e7cd65f79d78" id="valueupdateind-e7cd65f79d78"></a>

```java
public void valueUpdateInd(com.tailf.navu.NavuNode child)
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db)

**Parameters**

- `com.tailf.navu.NavuNode child`
