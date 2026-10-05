# NavuLeafList <a href="#navuleaflist-8d16c43a9b96" id="navuleaflist-8d16c43a9b96"></a>

```java
public class com.tailf.navu.NavuLeafList
    extends com.tailf.navu.NavuLeaf
    implements Iterable<com.tailf.conf.ConfValue>
```

Types: [NavuLeaf](NavuLeaf.md#navuleaf-aa68380b180b), [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d)

`NavuLeafList` is a representation of the *YANG* leaf-list.

 When accessing individual elements trough `containsNode`,
 `NavuLeafList` will only make one single `exists`
 call (over MAAPI or CDB depending on the context) to check the
 existence of the key, thus making the operation cheap.


 The set of leaf-list entries can be retrieved through [`elements()`](NavuLeafList.md#elements-1ac1cabc0e96)
 or by retrieving an iterator [`iterator()`](NavuLeafList.md#iterator-188aa52d1f86). The difference between the
 two is that [`elements()`](NavuLeafList.md#elements-1ac1cabc0e96) will make a single call to retrieve all
 the leaf-list elements, while [`iterator()`](NavuLeafList.md#iterator-188aa52d1f86) will try to fetch
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

- [NavuLeafList(Maapi, int, MaapiSchemas, CSNode, NavuNode, String, Object[])](#navuleaflist-cd315e673ba7)
- [NavuLeafList(NavuContext, MaapiSchemas, CSNode, NavuNode, Formats)](#navuleaflist-99a7288678b2)
- [NavuLeafList(NavuContext, MaapiSchemas, CSNode, NavuNode, String, Object[])](#navuleaflist-3b4d00f49b0d)

**Fields**:

- [arguments](NavuNode.md#arguments-28ffa3c54d2c) from NavuNode
- [change](NavuNode.md#change-470927160c2a) from NavuNode
- [context](NavuNode.md#context-b9bed500f8c9) from NavuNode
- [fmt](NavuNode.md#fmt-94d3250bd2b9) from NavuNode
- [isRefreshed](NavuLeaf.md#isrefreshed-17594a091fc4) from NavuLeaf
- [mountId](NavuNode.md#mountid-a6b63dedba52) from NavuNode
- [myConfPath](NavuNode.md#myconfpath-cec7a88dfaf3) from NavuNode
- [node](NavuNode.md#node-ff68e6a3ebc6) from NavuNode
- [parent](NavuNode.md#parent-26ad1434956a) from NavuNode
- [val](NavuLeaf.md#val-a02e160da60f) from NavuLeaf

**Methods**:

- [children()](NavuNode.md#children-7d31300d62c3) from NavuNode
- [container(ConfNamespace, String)](NavuNode.md#container-31c604ba30e3) from NavuNode
- [container(Integer)](NavuNode.md#container-abb10ecdc3f6) from NavuNode
- [container(String)](NavuNode.md#container-76f5d191b16d) from NavuNode
- [containsNode(ConfValue)](#containsnode-071882e18c33)
- [containsNode(String)](#containsnode-445990dba920)
- [context()](NavuNode.md#context-0990f1a0bb68) from NavuNode
- [create()](NavuLeaf.md#create-06e0ee4a42c2) from NavuLeaf
- [create(ConfValue)](#create-ac5af9918823)
- [create(String)](#create-7117d2531c85)
- [delete()](NavuLeaf.md#delete-a9e76d49da61) from NavuLeaf
- [delete(ConfValue)](#delete-61bc058b7301)
- [delete(String)](#delete-16af8bc13c9c)
- [deref()](NavuLeaf.md#deref-2626f40058b1) from NavuLeaf
- [elements()](#elements-1ac1cabc0e96)
- [encode()](../conf/ConfValue.md#encode-fbae522bba37) from ConfValue
- [encodeValues()](NavuLeaf.md#encodevalues-7bd911383b1a) from NavuLeaf
- [encodeXML()](NavuLeaf.md#encodexml-bdbcd52c2505) from NavuLeaf
- [equals(Object)](NavuLeaf.md#equals-fcd6492e0d6c) from NavuLeaf
- [exists()](NavuLeaf.md#exists-56968a4c7bda) from NavuLeaf
- [filterChildren(CSNode)](NavuNode.md#filterchildren-e72b7b1ab25d) from NavuNode
- [getChangeFlag()](NavuLeaf.md#getchangeflag-33cadf5a32ba) from NavuLeaf
- [getChanges(NavuContext)](NavuNode.md#getchanges-c106383f174d) from NavuNode
- [getChanges(NavuContext, boolean)](NavuNode.md#getchanges-bcf5b6dbccf2) from NavuNode
- [getChanges(NavuContext, boolean, DiffIterateOperFlag[])](NavuNode.md#getchanges-9f13a683b086) from NavuNode
- [getConfPath()](NavuNode.md#getconfpath-c7ca3cb63c17) from NavuNode
- [getInfo()](NavuNode.md#getinfo-259a72b5d74c) from NavuNode
- [getKeyPath()](NavuNode.md#getkeypath-4c9200912948) from NavuNode
- [getName()](NavuNode.md#getname-2634b18b4a25) from NavuNode
- [getNavuNode(ConfPath)](NavuNode.md#getnavunode-d19ad1dd90fc) from NavuNode
- [getOldValue()](NavuLeaf.md#getoldvalue-9e1eede07276) from NavuLeaf
- [getParent()](NavuLeaf.md#getparent-45c1b196ed70) from NavuLeaf
- [getRootNS()](NavuLeaf.md#getrootns-3f1d054cecd6) from NavuLeaf
- [getStringByValue(ConfPath, ConfValue)](../conf/ConfValue.md#getstringbyvalue-841fa68ad0f9) from ConfValue
- [getStringByValue(String, ConfValue)](../conf/ConfValue.md#getstringbyvalue-8ed173dcf8dc) from ConfValue
- [getValueByString(ConfPath, String)](../conf/ConfValue.md#getvaluebystring-e75fd0337a87) from ConfValue
- [getValueByString(String, String)](../conf/ConfValue.md#getvaluebystring-7804643cb027) from ConfValue
- [getValues(ConfXMLParam[])](NavuNode.md#getvalues-1eb02439a757) from NavuNode
- [getValues(String)](NavuLeaf.md#getvalues-c03de090764d) from NavuLeaf
- [hashCode()](NavuLeaf.md#hashcode-ef797a217903) from NavuLeaf
- [idrefDerivedOrSelf(ConfIdentityRef)](NavuLeaf.md#idrefderivedorself-d788d4007702) from NavuLeaf
- [isEmpty()](#isempty-4dde48126244)
- [isKey()](NavuLeaf.md#iskey-7bdf17ac8255) from NavuLeaf
- [iterator()](#iterator-188aa52d1f86)
- [leaf(ConfNamespace, String)](NavuNode.md#leaf-da3758f37f21) from NavuNode
- [leaf(Integer)](NavuNode.md#leaf-47fda8402c20) from NavuNode
- [leaf(String)](NavuNode.md#leaf-ac189787d67d) from NavuNode
- [leafList(ConfNamespace, String)](NavuNode.md#leaflist-a2d5ad836b3e) from NavuNode
- [leafList(Integer)](NavuNode.md#leaflist-552c8007ecb4) from NavuNode
- [leafList(String)](NavuNode.md#leaflist-5811cbb534ec) from NavuNode
- [list(ConfNamespace, String)](NavuNode.md#list-6b15381fd14a) from NavuNode
- [list(Integer)](NavuNode.md#list-7dc96bdbb69a) from NavuNode
- [list(String)](NavuNode.md#list-2c1a74a3cf07) from NavuNode
- [move(ConfValue, WhereTo, ConfValue)](#move-da549c25d390)
- [move(String, WhereTo, String)](#move-7fc455d160ab)
- [namespace(String)](NavuNode.md#namespace-e29ad62ed095) from NavuNode
- [prefix(String)](NavuNode.md#prefix-fdd71b8275bb) from NavuNode
- [prepareXMLCall(String)](NavuNode.md#preparexmlcall-c22e250f2cac) from NavuNode
- [refresh()](NavuLeaf.md#refresh-3852c3f76c8e) from NavuLeaf
- [reset()](NavuLeaf.md#reset-6927918ac70a) from NavuLeaf
- [safeCreate()](NavuLeaf.md#safecreate-8125e14d387f) from NavuLeaf
- [safeCreate(ConfValue)](#safecreate-3d8fab71365a)
- [safeCreate(String)](#safecreate-e4235ee54874)
- [select(ConfObject[])](NavuLeaf.md#select-336dd76cd112) from NavuLeaf
- [select(List<String>)](NavuLeaf.md#select-e81f36150174) from NavuLeaf
- [select(String)](NavuLeaf.md#select-5031325154b9) from NavuLeaf
- [set(ConfValue)](NavuLeaf.md#set-974b7071ae31) from NavuLeaf
- [set(String)](NavuLeaf.md#set-f04d84aad801) from NavuLeaf
- [setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext)](NavuLeaf.md#setchange-0bbeb54ebc15) from NavuLeaf
- [setValues(ConfXMLParam[])](NavuNode.md#setvalues-50d8edffa795) from NavuNode
- [setValues(String)](NavuLeaf.md#setvalues-3ec9581ce266) from NavuLeaf
- [sharedCreate()](NavuLeaf.md#sharedcreate-7aef2e24f04b) from NavuLeaf
- [sharedCreate(ConfValue)](#sharedcreate-48ee43b1130f)
- [sharedCreate(String)](#sharedcreate-931ab178735a)
- [sharedSet(ConfValue)](NavuLeaf.md#sharedset-fa8b98758fe5) from NavuLeaf
- [sharedSet(String)](NavuLeaf.md#sharedset-2e970131c473) from NavuLeaf
- [sharedSetValues(ConfXMLParam[])](NavuNode.md#sharedsetvalues-705549be9df0) from NavuNode
- [sharedSetValues(String)](NavuNode.md#sharedsetvalues-ad93c38b671f) from NavuNode
- [size()](#size-c6d8505255fd)
- [stopCdbSession()](NavuNode.md#stopcdbsession-17418252a986) from NavuNode
- [toKey()](NavuLeaf.md#tokey-87dff64e43ab) from NavuLeaf
- [toString()](NavuLeaf.md#tostring-e9d48c5503ef) from NavuLeaf
- [value()](NavuLeaf.md#value-9e1512d1a0ce) from NavuLeaf
- [valueAsString()](NavuLeaf.md#valueasstring-27fd10adb145) from NavuLeaf
- [valueUpdateInd(NavuNode)](NavuLeaf.md#valueupdateind-e7cd65f79d78) from NavuLeaf
- [xPathSelect(String)](NavuNode.md#xpathselect-0fb26b9f41e0) from NavuNode
- [xPathSelectIterate(String, NavuNodeSetIterate)](NavuNode.md#xpathselectiterate-12547f34f47c) from NavuNode

**Nested Types**:

- [WhereTo](NavuLeafList/WhereTo.md#whereto-ed479ce50b9a)

## Constructors

### NavuLeafList(Maapi, int, MaapiSchemas, CSNode, NavuNode, String, Object[]) <a href="#navuleaflist-cd315e673ba7" id="navuleaflist-cd315e673ba7"></a>

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

Types: [Maapi](../maapi/Maapi.md#maapi-67bcbe89c42e), [MaapiSchemas](../maapi/MaapiSchemas.md#maapischemas-821ac70b83b7), [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [NavuNode](NavuNode.md#navunode-73944820c8db)

**Parameters**

- `com.tailf.maapi.Maapi m`
- `int handle`
- `com.tailf.maapi.MaapiSchemas sch`
- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.navu.NavuNode parent`
- `String fmt`
- `Object[] arguments`

### NavuLeafList(NavuContext, MaapiSchemas, CSNode, NavuNode, Formats) <a href="#navuleaflist-99a7288678b2" id="navuleaflist-99a7288678b2"></a>

```java
protected NavuLeafList(
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

### NavuLeafList(NavuContext, MaapiSchemas, CSNode, NavuNode, String, Object[]) <a href="#navuleaflist-3b4d00f49b0d" id="navuleaflist-3b4d00f49b0d"></a>

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

Types: [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [MaapiSchemas](../maapi/MaapiSchemas.md#maapischemas-821ac70b83b7), [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [NavuNode](NavuNode.md#navunode-73944820c8db)

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas sch`
- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.navu.NavuNode parent`
- `String fmt`
- `Object[] arguments`


## Methods

### containsNode(ConfValue) <a href="#containsnode-071882e18c33" id="containsnode-071882e18c33"></a>

```java
public boolean containsNode(com.tailf.conf.ConfValue elem) throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns true if and only if this `NavuLeafList`
 contains this element.

**Parameters**

- `com.tailf.conf.ConfValue elem` - whose presence in this `NavuLeafList` is to be
 tested

**Returns:** `true` if this `NavuLeafList` contains the element

### containsNode(String) <a href="#containsnode-445990dba920" id="containsnode-445990dba920"></a>

```java
public boolean containsNode(String elemStr) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns true if and only if this `NavuLeafList`
 contains this element.

**Parameters**

- `String elemStr` - string representation of the element whose presence
 in this `NavuLeafList` is to be tested

**Returns:** `true` if this `NavuLeafList` contains the element

### create(ConfValue) <a href="#create-ac5af9918823" id="create-ac5af9918823"></a>

```java
public void create(com.tailf.conf.ConfValue elem) throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Creates leaf-list entry.

 We have 3 different variants of `create`.


2. `create()` This method creates the leaf-list entry.
 If such entry already exists tt will fail with a [`NavuException`](NavuException.md#navuexception-d80fa0cb4f3f)
 with the error code set to [`ErrorCode#ERR_ALREADY_EXISTS`](../conf/ErrorCode.md#err_already_exists-79abf22f339e).

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

### create(String) <a href="#create-7117d2531c85" id="create-7117d2531c85"></a>

```java
public void create(String elemStr) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Creates leaf-list entry.

 We have 3 different variants of `create`.


2. `create()` This method creates the leaf-list entry.
 If such entry already exists tt will fail with a [`NavuException`](NavuException.md#navuexception-d80fa0cb4f3f)
 with the error code set to [`ErrorCode#ERR_ALREADY_EXISTS`](../conf/ErrorCode.md#err_already_exists-79abf22f339e).

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

### delete(ConfValue) <a href="#delete-61bc058b7301" id="delete-61bc058b7301"></a>

```java
public void delete(com.tailf.conf.ConfValue elem) throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Deletes an entry from the leaf-list.

**Parameters**

- `com.tailf.conf.ConfValue elem` - the element to delete.

**Throws**

- `NavuException` - If the method fails to delete the element.

### delete(String) <a href="#delete-16af8bc13c9c" id="delete-16af8bc13c9c"></a>

```java
public void delete(String elemStr) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Deletes an entry from the leaf-list.

**Parameters**

- `String elemStr` - string representation of the element to delete.

**Throws**

- `NavuException` - If the method fails to delete the element.

### elements() <a href="#elements-1ac1cabc0e96" id="elements-1ac1cabc0e96"></a>

```java
public java.util.Collection<com.tailf.conf.ConfValue> elements() throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns a copy of elements contained by the leaf-list node.

**Returns:** a copy of the collection of list elements.

**Throws**

- `NavuException` - if the elements could not be retrieved.

### isEmpty() <a href="#isempty-4dde48126244" id="isempty-4dde48126244"></a>

```java
public boolean isEmpty() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Checks if there are any elements in the leaf-list.

**Returns:** true if there no list entries, false otherwise,

### iterator() <a href="#iterator-188aa52d1f86" id="iterator-188aa52d1f86"></a>

```java
public java.util.Iterator<com.tailf.conf.ConfValue> iterator()
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d)

Retrieve a iterator over the elements in this `NavuLeafList`
 (in proper sequence).

### move(ConfValue, WhereTo, ConfValue) <a href="#move-da549c25d390" id="move-da549c25d390"></a>

```java
public void move(
    com.tailf.conf.ConfValue elem,
    com.tailf.navu.NavuLeafList.WhereTo whereTo,
    com.tailf.conf.ConfValue to
)
    throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [WhereTo](NavuLeafList/WhereTo.md#whereto-ed479ce50b9a), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

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

### move(String, WhereTo, String) <a href="#move-7fc455d160ab" id="move-7fc455d160ab"></a>

```java
public void move(
    String elemStr,
    com.tailf.navu.NavuLeafList.WhereTo whereTo,
    String toStr
)
    throws com.tailf.navu.NavuException
```

Types: [WhereTo](NavuLeafList/WhereTo.md#whereto-ed479ce50b9a), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Move a leaf-list element to a new position.

 The destination
 can be at the beginning, the end or in a relation to another element.
 Elements are referenced by their string representation.
 See also: `move(ConfValue key, WhereTo whereTo, ConfValue to)`

**Parameters**

- `String elemStr` - Move elemStr according to whereTo
- `com.tailf.navu.NavuLeafList.WhereTo whereTo` - How the move should be performed. Move elemStr
                WhereTo.FIRST or WhereTo.LAST or move elemStr
                WhereTo.BEFORE or WhereTo.AFTER the element toStr.
- `String toStr` - If the value of whereTo is WhereTo.FIRST or WhereTo.LAST
                this argument ignored

**Throws**

- `NavuException`

### safeCreate(ConfValue) <a href="#safecreate-3d8fab71365a" id="safecreate-3d8fab71365a"></a>

```java
public void safeCreate(com.tailf.conf.ConfValue elem) throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

The variant of `create` that succeeds even if the
 object already exists.

**Parameters**

- `com.tailf.conf.ConfValue elem` - the leaf-list entry to be created

**Throws**

- `NavuException` - if any MAAPI operations fail during the
  create or IOException if socket errors would occur.

### safeCreate(String) <a href="#safecreate-e4235ee54874" id="safecreate-e4235ee54874"></a>

```java
public void safeCreate(String elemStr) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

The variant of `create` that succeeds even if the
 object already exists.

**Parameters**

- `String elemStr` - the string representation of the leaf-list entry
 to be created

**Throws**

- `NavuException` - if any MAAPI operations fail during the
  create or IOException if socket errors would occur.

### sharedCreate(ConfValue) <a href="#sharedcreate-48ee43b1130f" id="sharedcreate-48ee43b1130f"></a>

```java
public void sharedCreate(com.tailf.conf.ConfValue elem) throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

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

### sharedCreate(String) <a href="#sharedcreate-931ab178735a" id="sharedcreate-931ab178735a"></a>

```java
public void sharedCreate(String elemStr) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

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

### size() <a href="#size-c6d8505255fd" id="size-c6d8505255fd"></a>

```java
public int size() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns the number of leaf-list elements contained by the leaf-list.

**Returns:** the number of elements.


## Nested Types

- [WhereTo](NavuLeafList/WhereTo.md#whereto-ed479ce50b9a)
