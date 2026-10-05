# NavuList <a href="#navulist-472e8d6d3745" id="navulist-472e8d6d3745"></a>

```java
public class com.tailf.navu.NavuList
    extends com.tailf.navu.NavuNode
    implements Iterable<com.tailf.navu.NavuListEntry>
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuListEntry](NavuListEntry.md#navulistentry-6c6e1431f291)

`NavuList` is a representation of the *YANG* list node.

 A `NavuList` holds a map of list entries,
 [`NavuListEntry`](NavuListEntry.md#navulistentry-6c6e1431f291), each associated with a key, [`ConfKey`](../conf/ConfKey.md#confkey-e4e1ca98e867), thus
 each child is indexed by its key and the individual entry is retrieved
 by the `elem(ConfKey)` method.

 The `elem` method declares that it returns
 a [`NavuContainer`](NavuContainer.md#navucontainer-8e321756755f) but its underlying subtype is actually a
 [`NavuListEntry`](NavuListEntry.md#navulistentry-6c6e1431f291).

 `NavuList` also supports keyless lists (lists without keys).

 If the *YANG* list is keyless, an individual child is retrieved
 through its "pseudo-key" which must always be of the type
 [`ConfInt64`](../conf/ConfInt64.md#confint64-0d4ed81a2e2f).




```
  NavuList keyLessList = ...;
  ConfKey pseudo = new ConfKey(new ConfInt64(10));

  NavuContainer entry10 = keyLessList.elem(pseudo);

      assert(entry10.isListInstance());
      assert(entry10.getInfo().isListEntry());

  NavuListEntry navuListEntry10 = (NavuListEntry) entry10;
```




 When accessing individual elements through `elem`,
 `NavuList` will only make one single `exists`
 call (over MAAPI or CDB depending on the context) to check the
 existence of the key, thus making the operation cheap.


 The set of children, or the list elements, are retrieved through
 [`children()`](NavuList.md#children-7d31300d62c3), [`elements()`](NavuList.md#elements-1ac1cabc0e96) or by retrieving
 an iterator [`iterator()`](NavuList.md#iterator-188aa52d1f86).




```
  NavuList serverList = ...;

  for (NavuNode childEntry : serverList.children()) {
      // Do something with each child instance
  }
```




 `NavuList` also implements the `Iterable` interface
 which means that the child elements can be retrieved implicitly.




```
  NavuList serverList = ...;

  for (NavuNode childEntry : serverList) {
      // Do something with each child instance
  }
```




 `NavuList` loads its children on demand but
 when invoking the methods `children`,
 `elements`, `encodeXML`, `entrySet`,
 `isEmpty`, `keySet`, `select`
 it must trigger a load of all its keys from the
 datastore. Use these methods with caution when the list is big.

 Consider using the `iterator` instead wherever possible.

## Members

**Constructors**:

- [NavuList\(Maapi, int, MaapiSchemas, CSNode, NavuNode, String, Object\[\]\)](#navulist-441cdb57852f)
- [NavuList\(NavuContext, MaapiSchemas, CSNode, NavuNode, Formats\)](#navulist-4974496312b1)
- [NavuList\(NavuContext, MaapiSchemas, CSNode, NavuNode, String, Object\[\]\)](#navulist-be9598ccb1c3)

**Fields**:

- [arguments](NavuNode.md#arguments-28ffa3c54d2c) from NavuNode
- [change](NavuNode.md#change-470927160c2a) from NavuNode
- [context](NavuNode.md#context-b9bed500f8c9) from NavuNode
- [fmt](NavuNode.md#fmt-94d3250bd2b9) from NavuNode
- [mountId](NavuNode.md#mountid-a6b63dedba52) from NavuNode
- [myConfPath](NavuNode.md#myconfpath-cec7a88dfaf3) from NavuNode
- [node](NavuNode.md#node-ff68e6a3ebc6) from NavuNode
- [parent](NavuNode.md#parent-26ad1434956a) from NavuNode

**Methods**:

- [children\(\)](#children-7d31300d62c3)
- [container\(ConfNamespace, String\)](NavuNode.md#container-31c604ba30e3) from NavuNode
- [container\(Integer\)](NavuNode.md#container-abb10ecdc3f6) from NavuNode
- [container\(String\)](NavuNode.md#container-76f5d191b16d) from NavuNode
- [containsNode\(ConfKey\)](#containsnode-cc5638d33d8f)
- [containsNode\(NavuContainer\)](#containsnode-78948adb0e66)
- [containsNode\(String\)](#containsnode-445990dba920)
- [containsNode\(String\[\]\)](#containsnode-dfae76dca10c)
- [context\(\)](NavuNode.md#context-0990f1a0bb68) from NavuNode
- [create\(ConfKey\)](#create-c5469df729c3)
- [create\(ConfObject\)](#create-c10d5ef19510)
- [create\(String\)](#create-7117d2531c85)
- [create\(String\[\]\)](#create-bb5b4583dcf5)
- [delete\(\)](NavuListEntry.md#delete-a9e76d49da61) from NavuListEntry
- [delete\(ConfKey\)](#delete-e654021e5e2c)
- [delete\(String\)](#delete-16af8bc13c9c)
- [delete\(String\[\]\)](#delete-8d2acbf4221d)
- [deleteAll\(\)](#deleteall-3c419d9e9586)
- [elem\(ConfKey\)](#elem-172930b5966b)
- [elem\(String\)](#elem-9ab35f036d02)
- [elem\(String\[\]\)](#elem-083efd6c9325)
- [elements\(\)](#elements-1ac1cabc0e96)
- [encodeValues\(\)](#encodevalues-7bd911383b1a)
- [encodeXML\(\)](#encodexml-bdbcd52c2505)
- [entrySet\(\)](#entryset-20b678143b7e)
- [equals\(Object\)](#equals-fcd6492e0d6c)
- [exists\(\)](#exists-56968a4c7bda)
- [filterChildren\(CSNode\)](NavuNode.md#filterchildren-e72b7b1ab25d) from NavuNode
- [getChangeFlag\(\)](#getchangeflag-33cadf5a32ba)
- [getChanges\(NavuContext\)](NavuNode.md#getchanges-c106383f174d) from NavuNode
- [getChanges\(NavuContext, boolean\)](NavuNode.md#getchanges-bcf5b6dbccf2) from NavuNode
- [getChanges\(NavuContext, boolean, DiffIterateOperFlag\[\]\)](NavuNode.md#getchanges-9f13a683b086) from NavuNode
- [getConfPath\(\)](NavuNode.md#getconfpath-c7ca3cb63c17) from NavuNode
- [getInfo\(\)](NavuNode.md#getinfo-259a72b5d74c) from NavuNode
- [getKey\(\)](NavuListEntry.md#getkey-9a8856159458) from NavuListEntry
- [getKeyPath\(\)](NavuNode.md#getkeypath-4c9200912948) from NavuNode
- [getName\(\)](NavuNode.md#getname-2634b18b4a25) from NavuNode
- [getNavuNode\(ConfPath\)](NavuNode.md#getnavunode-d19ad1dd90fc) from NavuNode
- [getParent\(\)](#getparent-45c1b196ed70)
- [getRootNS\(\)](NavuNode.md#getrootns-3f1d054cecd6) from NavuNode
- [getValues\(ConfXMLParam\[\]\)](NavuNode.md#getvalues-1eb02439a757) from NavuNode
- [getValues\(String\)](NavuNode.md#getvalues-c03de090764d) from NavuNode
- [hashCode\(\)](#hashcode-ef797a217903)
- [insert\(ConfKey, boolean\)](#insert-d78425063c87)
- [isEmpty\(\)](#isempty-4dde48126244)
- [isNodeNavuLocal\(\)](#isnodenavulocal-3af8ba5398d1)
- [iterator\(\)](#iterator-188aa52d1f86)
- [keySet\(\)](#keyset-66de8917ecb8)
- [leaf\(ConfNamespace, String\)](NavuNode.md#leaf-da3758f37f21) from NavuNode
- [leaf\(Integer\)](NavuNode.md#leaf-47fda8402c20) from NavuNode
- [leaf\(String\)](NavuNode.md#leaf-ac189787d67d) from NavuNode
- [leafList\(ConfNamespace, String\)](NavuNode.md#leaflist-a2d5ad836b3e) from NavuNode
- [leafList\(Integer\)](NavuNode.md#leaflist-552c8007ecb4) from NavuNode
- [leafList\(String\)](NavuNode.md#leaflist-5811cbb534ec) from NavuNode
- [list\(ConfNamespace, String\)](NavuNode.md#list-6b15381fd14a) from NavuNode
- [list\(Integer\)](NavuNode.md#list-7dc96bdbb69a) from NavuNode
- [list\(String\)](NavuNode.md#list-2c1a74a3cf07) from NavuNode
- [move\(ConfKey, WhereTo, ConfKey\)](#move-dbba3e109e78)
- [move\(String, WhereTo, String\)](#move-2e3f4f4fe7c9)
- [namespace\(String\)](NavuNode.md#namespace-e29ad62ed095) from NavuNode
- [prefix\(String\)](NavuNode.md#prefix-fdd71b8275bb) from NavuNode
- [prepareXMLCall\(String\)](NavuNode.md#preparexmlcall-c22e250f2cac) from NavuNode
- [refresh\(\)](#refresh-3852c3f76c8e)
- [reset\(\)](#reset-6927918ac70a)
- [safeCreate\(ConfKey\)](#safecreate-91589643f1b0)
- [safeCreate\(ConfObject\)](#safecreate-217b89495744)
- [safeCreate\(String\)](#safecreate-e4235ee54874)
- [safeCreate\(String\[\]\)](#safecreate-04a6751c7a49)
- [select\(ConfObject\[\]\)](#select-336dd76cd112)
- [select\(List\<String\>\)](#select-e81f36150174)
- [select\(String\)](#select-5031325154b9)
- [setChange\(List\<ConfObject\>, DiffIterateOperFlag, ConfValue, NavuContext\)](#setchange-0bbeb54ebc15)
- [setMaxListSize\(int\)](#setmaxlistsize-f73dc316f2f1)
- [setValues\(ConfXMLParam\[\]\)](NavuNode.md#setvalues-50d8edffa795) from NavuNode
- [setValues\(String\)](NavuNode.md#setvalues-3ec9581ce266) from NavuNode
- [sharedCreate\(ConfKey\)](#sharedcreate-fd9caea86f03)
- [sharedCreate\(ConfObject\)](#sharedcreate-f382ccaab8f7)
- [sharedCreate\(String\)](#sharedcreate-931ab178735a)
- [sharedCreate\(String\[\]\)](#sharedcreate-6bd749aafdff)
- [sharedSetValues\(ConfXMLParam\[\]\)](NavuNode.md#sharedsetvalues-705549be9df0) from NavuNode
- [sharedSetValues\(String\)](NavuNode.md#sharedsetvalues-ad93c38b671f) from NavuNode
- [size\(\)](#size-c6d8505255fd)
- [stopCdbSession\(\)](NavuNode.md#stopcdbsession-17418252a986) from NavuNode
- [toString\(\)](#tostring-e9d48c5503ef)
- [valueUpdateInd\(NavuNode\)](#valueupdateind-e7cd65f79d78)
- [xPathSelect\(String\)](NavuNode.md#xpathselect-0fb26b9f41e0) from NavuNode
- [xPathSelectIterate\(String, NavuNodeSetIterate\)](NavuNode.md#xpathselectiterate-12547f34f47c) from NavuNode

**Nested Types**:

- [WhereTo](NavuList/WhereTo.md#whereto-ed479ce50b9a)

## Constructors

### NavuList(Maapi, int, MaapiSchemas, CSNode, NavuNode, String, Object[]) <a href="#navulist-441cdb57852f" id="navulist-441cdb57852f"></a>

```java
protected NavuList(
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

### NavuList(NavuContext, MaapiSchemas, CSNode, NavuNode, Formats) <a href="#navulist-4974496312b1" id="navulist-4974496312b1"></a>

```java
protected NavuList(
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

### NavuList(NavuContext, MaapiSchemas, CSNode, NavuNode, String, Object[]) <a href="#navulist-be9598ccb1c3" id="navulist-be9598ccb1c3"></a>

```java
protected NavuList(
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

### children() <a href="#children-7d31300d62c3" id="children-7d31300d62c3"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> children() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns all elements contained by the list node.

**Returns:** a collection of list elements

**Throws**

- `NavuException` - if the elements could not be retrieved

### containsNode(ConfKey) <a href="#containsnode-cc5638d33d8f" id="containsnode-cc5638d33d8f"></a>

```java
public boolean containsNode(com.tailf.conf.ConfKey key) throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns true if and only if this `NavuList`
 contains a `NavuListEntry` where
 [`NavuListEntry#getKey()`](NavuListEntry.md#getkey-9a8856159458) `equals` the specified
 `key`.

**Parameters**

- `com.tailf.conf.ConfKey key` - whose presence in this `NavuList` is to be
 tested

**Returns:** `true` if this `NavuList` contains a entry
 with the specified `key`

### containsNode(NavuContainer) <a href="#containsnode-78948adb0e66" id="containsnode-78948adb0e66"></a>

```java
public boolean containsNode(com.tailf.navu.NavuContainer node)
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f)

Returns `true` if this `NavuList` maps a
 `ConfKey` to the specified `NavuContainer`.
 specified value.  More formally, returns `true` if and only if
 this `NavuList` contains a mapping to a `NavuContainer`
 `n` such that `(node==null ? n==null : node.equals(n))`.

**Parameters**

- `com.tailf.navu.NavuContainer node` - `NavuContainer` whose presence in this
        `NavuList` is to be tested

**Returns:** `true` if this `NavuList` maps a keys to the
         specified node

### containsNode(String) <a href="#containsnode-445990dba920" id="containsnode-445990dba920"></a>

```java
public boolean containsNode(String keyStr) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns `true` if this `NavuList` contains a mapping
 for the specified string representation of a key.

**Parameters**

- `String keyStr` - a string representation of a key whose presence in this
        `NavuList` is to be tested

**Returns:** `true` if this `NavuList` maps a  keys to the
         specified node

### containsNode(String[]) <a href="#containsnode-dfae76dca10c" id="containsnode-dfae76dca10c"></a>

```java
public boolean containsNode(String[] keyArr) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns `true` if this `NavuList` contains a mapping
 for the specified string representation of a key.

 This is a convenience method for lists with multiple element
 key.

**Parameters**

- `String[] keyArr` - elements of the specified key contains string
        representation of a key whose presence in this
        `NavuList` is to be tested

**Returns:** `true` if this `NavuList` maps a the specified
        keys in the array

### create(ConfKey) <a href="#create-c5469df729c3" id="create-c5469df729c3"></a>

```java
public com.tailf.navu.NavuContainer create(
    com.tailf.conf.ConfKey key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Create and return a new list element in this `NavuList`.

 We have 3 different variants of `create`.


2. `create()` This method will fail with a
 [`NavuException`](NavuException.md#navuexception-d80fa0cb4f3f) with the error code set to
 [`ErrorCode#ERR_ALREADY_EXISTS`](../conf/ErrorCode.md#err_already_exists-79abf22f339e) if the key already exists.

   - `safeCreate()` Similar to `create()`
 with the sole difference that is silently succeeds even if the
 key already exists.

     - `sharedCreate()` This method is useful when
 creating structures from FASTMAP code, i.e., code that implements
 the com.tailf.nsmux.NcsResourceFacingService interface.
 The `sharedCreate()` method maintains a reference counter on
 the created object. Furthermore, a backpointer attribute will be
 created on the created object indicating which service(s) created the
 object.
 All of the `create()` methods are overloaded with
 convenience methods accepting keys of different types.

**Parameters**

- `com.tailf.conf.ConfKey key` - the key with which the newly created list entry is to be
            associated

**Returns:** the created list entry

### create(ConfObject) <a href="#create-c10d5ef19510" id="create-c10d5ef19510"></a>

```java
public com.tailf.navu.NavuContainer create(
    com.tailf.conf.ConfObject key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Convenience variant of `create(ConfKey)` accepting a
 [`ConfObject`](../conf/ConfObject.md#confobject-5433616953b2) as the (single element) key.

**Parameters**

- `com.tailf.conf.ConfObject key` - the key with which the newly created list entry is to be
            associated

**Returns:** the created list entry

### create(String) <a href="#create-7117d2531c85" id="create-7117d2531c85"></a>

```java
public com.tailf.navu.NavuContainer create(String keyStr) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Convenience variant of `create(ConfKey)` accepting a
 string as the (single element) key.

 If the string is surrounded by curly braces, e.g. "{test}", they will
 be removed. If this is not desired, another variant of create() should
 be used.

 The YANG type of the list key does not necessarily have to be a
 string. The key string will be encoded as the proper YANG type according
 to the schema.

**Parameters**

- `String keyStr` - the key with which the newly created list entry is to be
               associated

**Returns:** the created list entry

### create(String[]) <a href="#create-bb5b4583dcf5" id="create-bb5b4583dcf5"></a>

```java
public com.tailf.navu.NavuContainer create(String[] keyArr) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Convenience variant of `create(ConfKey)` accepting a
 string array as the key. Typically useful for multiple element keys.

**Parameters**

- `String[] keyArr` - the string array from which to create the key that the
               newly created list entry is to be associated with

**Returns:** the created list entry

### delete(ConfKey) <a href="#delete-e654021e5e2c" id="delete-e654021e5e2c"></a>

```java
public void delete(com.tailf.conf.ConfKey key) throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Deletes an element from the list.

**Parameters**

- `com.tailf.conf.ConfKey key` - the key of the element to delete

### delete(String) <a href="#delete-16af8bc13c9c" id="delete-16af8bc13c9c"></a>

```java
public void delete(String keyStr) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Deletes an element from the list.

 This is a convenience method for lists with single element
 key. If the string is enclosed in curly braces like {test},
 the curly braces are stripped. If this not desired another
 overloaded method should be used.

**Parameters**

- `String keyStr` - string representation of a single element key

### delete(String[]) <a href="#delete-8d2acbf4221d" id="delete-8d2acbf4221d"></a>

```java
public void delete(String[] keyArr) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Deletes an element from the list.

 This is a convenience method for lists with multiple element
 keys.

**Parameters**

- `String[] keyArr` - string array representation of a multiple element key

### deleteAll() <a href="#deleteall-3c419d9e9586" id="deleteall-3c419d9e9586"></a>

```java
public void deleteAll() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Deletes all element from the list.

### elem(ConfKey) <a href="#elem-172930b5966b" id="elem-172930b5966b"></a>

```java
public com.tailf.navu.NavuListEntry elem(
    com.tailf.conf.ConfKey key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuListEntry](NavuListEntry.md#navulistentry-6c6e1431f291), [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns a list element according to the given key.

**Parameters**

- `com.tailf.conf.ConfKey key` - a key identifying the list element

**Returns:** a matching element, or null if no matching element is found

### elem(String) <a href="#elem-9ab35f036d02" id="elem-9ab35f036d02"></a>

```java
public com.tailf.navu.NavuContainer elem(String keyStr) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns a list element according to the given key.

 This is a convenience method for lists with single element
 key. If the string is enclosed in curly braces like {test},
 the curly braces are stripped. If this not desired another
 overloaded method should be used.

**Parameters**

- `String keyStr` - string representation on single element key

**Returns:** a matching list element or null, if no matching element is found.

### elem(String[]) <a href="#elem-083efd6c9325" id="elem-083efd6c9325"></a>

```java
public com.tailf.navu.NavuContainer elem(String[] keyArr) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns a list element according to the given array of keys.

 This is a convenience method for lists with multiple element
 keys.

**Parameters**

- `String[] keyArr` - string array representation of a multiple element key

**Returns:** a matching list element, or null if no matching element is found

### elements() <a href="#elements-1ac1cabc0e96" id="elements-1ac1cabc0e96"></a>

```java
public java.util.Collection<com.tailf.navu.NavuContainer> elements() throws com.tailf.navu.NavuException
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns a shallow copy of all elements contained by the list node.

 The elements contained by this list node are not cloned

**Returns:** a copy of the collection of list elements

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

### entrySet() <a href="#entryset-20b678143b7e" id="entryset-20b678143b7e"></a>

```java
public java.util.Set<java.util.Map.Entry<com.tailf.conf.ConfKey,com.tailf.navu.NavuListEntry>> entrySet() throws com.tailf.navu.NavuException
    throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867), [NavuListEntry](NavuListEntry.md#navulistentry-6c6e1431f291), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns a set of entries with element key and element.

**Returns:** a set of entries

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Compares the specified object with this `NavuList`
 for equality.
 Returns `true` if the given object is also a
 `NavuList` and it has the same [`ConfPath`](../conf/ConfPath.md#confpath-327831c6fc7d) as this
 `NavuList`.

**Parameters**

- `Object o` - the object to be compared for equality with this
          `NavuList`

**Returns:** `true` if the specified object is equal to this
         `NavuList`

### exists() <a href="#exists-56968a4c7bda" id="exists-56968a4c7bda"></a>

```java
public boolean exists() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Tests for the existence of the List node in the instance tree.

 A list node can be contained inside a presence container.
 If the container is not created the
 `exists` will return false. Similary if a
 list node is contained within a case in choice that is
 not selected `exists` should return false.

**Returns:** true/false on existence of this `NavuList`
 instance in the instance tree

**Throws**

- `NavuException` - on failure

### getChangeFlag() <a href="#getchangeflag-33cadf5a32ba" id="getchangeflag-33cadf5a32ba"></a>

```java
public com.tailf.conf.DiffIterateOperFlag getChangeFlag()
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec)

See: [`NavuNode.getChangeFlag()`](NavuNode.md#getchangeflag-33cadf5a32ba)

### getParent() <a href="#getparent-45c1b196ed70" id="getparent-45c1b196ed70"></a>

```java
public com.tailf.navu.NavuNode getParent()
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db)

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

### insert(ConfKey, boolean) <a href="#insert-d78425063c87" id="insert-d78425063c87"></a>

```java
public com.tailf.navu.NavuContainer insert(
    com.tailf.conf.ConfKey key,
    boolean createBackpointer
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Inserts an element into a list using Maapi.insert(). This is only
 applicable for lists that have the annotation tailf:indexed-view
 An interesting special case is when a list has also the annotation
 tailf:auto-compact. The createBackpointer variable should then be
 set to true. When we insert an entry into an auto compact list, the
 createBackpointer makes NCS follow all backpointers in the list and
 update the corresponding diffsets so that FastMap continues to work.

 The Key must be an integer key.
 In NCS this construct is sometimes used in NEDs, modelling devices
 that have lists that 'auto compact' sometimes ACLs can be like that,
 if we remove an entry in the middle, the following entries are moved up.

 It is only allowed to create new entries at the end of lists that
 are auto-compact. The first entry of the list has key one (1).

**Parameters**

- `com.tailf.conf.ConfKey key`
- `boolean createBackpointer`

### isEmpty() <a href="#isempty-4dde48126244" id="isempty-4dde48126244"></a>

```java
public boolean isEmpty() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Checks if there are any elements in the list.

**Returns:** true if there are no list entries, false otherwise,

### isNodeNavuLocal() <a href="#isnodenavulocal-3af8ba5398d1" id="isnodenavulocal-3af8ba5398d1"></a>

```java
public boolean isNodeNavuLocal()
```

### iterator() <a href="#iterator-188aa52d1f86" id="iterator-188aa52d1f86"></a>

```java
public java.util.Iterator<com.tailf.navu.NavuListEntry> iterator()
```

Types: [NavuListEntry](NavuListEntry.md#navulistentry-6c6e1431f291)

Retrieve a iterator over the elements in this `NavuList`
 (in proper sequence).

### keySet() <a href="#keyset-66de8917ecb8" id="keyset-66de8917ecb8"></a>

```java
public java.util.Set<com.tailf.conf.ConfKey> keySet() throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns a Set containing all of the keys for this list.

**Returns:** the full set of keys for this list

### move(ConfKey, WhereTo, ConfKey) <a href="#move-dbba3e109e78" id="move-dbba3e109e78"></a>

```java
public void move(
    com.tailf.conf.ConfKey key,
    com.tailf.navu.NavuList.WhereTo whereTo,
    com.tailf.conf.ConfKey to
)
    throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867), [WhereTo](NavuList/WhereTo.md#whereto-ed479ce50b9a), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Move a list element to a new position in the list.

 The destination
 can be at the beginning, the end or in a relation to another element.
 See: `move(String keyStr, WhereTo whereTo, String toStr)`

**Parameters**

- `com.tailf.conf.ConfKey key` - Move key according to whereTo
- `com.tailf.navu.NavuList.WhereTo whereTo` - How the move should be performed. Move key
                WhereTo.FIRST or WhereTo.LAST or move key
                WhereTo.BEFORE or WhereTo.AFTER the element to.
- `com.tailf.conf.ConfKey to` - If the value of whereTo is WhereTo.FIRST or WhereTo.LAST
                this argument ignored

**Throws**

- `NavuException`

### move(String, WhereTo, String) <a href="#move-2e3f4f4fe7c9" id="move-2e3f4f4fe7c9"></a>

```java
public void move(
    String keyStr,
    com.tailf.navu.NavuList.WhereTo whereTo,
    String toStr
)
    throws com.tailf.navu.NavuException
```

Types: [WhereTo](NavuList/WhereTo.md#whereto-ed479ce50b9a), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Move a list element to a new position in the list.

 The destination
 can be at the beginning, the end or in a relation to another element.
 Elements are referenced by their string representation.
 See: `move(ConfKey key, WhereTo whereTo, ConfKey to)`
 This is a convenience method for lists with single element
 key. If the string is enclosed in curly braces like {test},
 the curly braces are stripped. If this not desired another
 overlaid method should be used

**Parameters**

- `String keyStr` - Move keyStr according to whereTo
- `com.tailf.navu.NavuList.WhereTo whereTo` - How the move should be performed. Move keyStr
                WhereTo.FIRST or WhereTo.LAST or move keyStr
                WhereTo.BEFORE or WhereTo.AFTER the element toStr.
- `String toStr` - If the value of whereTo is WhereTo.FIRST or WhereTo.LAST
                this argument ignored

**Throws**

- `NavuException`

### refresh() <a href="#refresh-3852c3f76c8e" id="refresh-3852c3f76c8e"></a>

```java
protected void refresh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Reads list entries through the [`NavuCursor`](NavuCursor.md#navucursor-11e7b4ede514) which handles
 key retrieval through Maapi and CDB.

### reset() <a href="#reset-6927918ac70a" id="reset-6927918ac70a"></a>

```java
public void reset()
```

When navigating through NAVU to a certain list, the list values are
 cached as they are read.

 This method clears this cache and and indicates to Navu that the list
 elements should be re-read as they are retrieved.

### safeCreate(ConfKey) <a href="#safecreate-91589643f1b0" id="safecreate-91589643f1b0"></a>

```java
public com.tailf.navu.NavuContainer safeCreate(
    com.tailf.conf.ConfKey key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Variant of `create(ConfKey)` that succeeds even if the
 key already exists.

**Parameters**

- `com.tailf.conf.ConfKey key` - the key with which the newly created list entry is to be
            associated

**Returns:** the created list entry or, if it already exists, the list entry
         corresponding to the given key, `key`

### safeCreate(ConfObject) <a href="#safecreate-217b89495744" id="safecreate-217b89495744"></a>

```java
public com.tailf.navu.NavuContainer safeCreate(
    com.tailf.conf.ConfObject key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Variant of `create(ConfObject)` that succeeds even if
 the key already exists.

**Parameters**

- `com.tailf.conf.ConfObject key` - the key with which the newly created list entry is to be
            associated

**Returns:** the created list entry or, if it already exists, the list entry
         corresponding to the given key, `key`

### safeCreate(String) <a href="#safecreate-e4235ee54874" id="safecreate-e4235ee54874"></a>

```java
public com.tailf.navu.NavuContainer safeCreate(String keyStr) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Variant of [`create(String)`](NavuList.md#create-7117d2531c85) that succeeds even if the
 key already exists.

**Parameters**

- `String keyStr` - the string representation of the key value with which the
               newly created list entry is to be associated

**Returns:** the created list entry or, if it already exists, the list entry
         corresponding to the given key, `key`

### safeCreate(String[]) <a href="#safecreate-04a6751c7a49" id="safecreate-04a6751c7a49"></a>

```java
public com.tailf.navu.NavuContainer safeCreate(String[] keyArr) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Variant of [`create(String[])`](NavuList.md#create-bb5b4583dcf5) that succeeds even if the
 key already exists.

**Parameters**

- `String[] keyArr` - the string array from which to create the key that the
               newly created list entry is to be associated with

**Returns:** the created list entry or, if it already exists, the list entry
         corresponding to the given key, `keyArr`

### select(ConfObject[]) <a href="#select-336dd76cd112" id="select-336dd76cd112"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`

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

### setChange(List&lt;ConfObject&gt;, DiffIterateOperFlag, ConfValue, NavuContext) <a href="#setchange-0bbeb54ebc15" id="setchange-0bbeb54ebc15"></a>

```java
public com.tailf.navu.NavuNode setChange(
    java.util.List<com.tailf.conf.ConfObject> path,
    com.tailf.conf.DiffIterateOperFlag op,
    com.tailf.conf.ConfValue oldValue,
    com.tailf.navu.NavuContext delContext
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec), [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `java.util.List<com.tailf.conf.ConfObject> path`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfValue oldValue`
- `com.tailf.navu.NavuContext delContext`

### setMaxListSize(int) <a href="#setmaxlistsize-f73dc316f2f1" id="setmaxlistsize-f73dc316f2f1"></a>

```java
public void setMaxListSize(int maxSize)
```

Sets the maxSize of the internal HashMap of list elements.
 If the maxSize is reached new elements will imply that
 the oldest element is silently removed.

 If set to 0 the list is unlimited.

 Note, this function should NOT be used if the implications are
 unknown or not understood.

**Parameters**

- `int maxSize` - max size of the list (default 0 unlimited)

### sharedCreate(ConfKey) <a href="#sharedcreate-fd9caea86f03" id="sharedcreate-fd9caea86f03"></a>

```java
public com.tailf.navu.NavuContainer sharedCreate(
    com.tailf.conf.ConfKey key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Variant of `create(ConfKey)` that succeeds even if the
 key already exists, and also maintains a reference counter
 on the object.

**Parameters**

- `com.tailf.conf.ConfKey key` - the key with which the newly created list entry is to be
            associated

**Returns:** the created list entry or, if it already exists, the list entry
         corresponding to the given key, `key`

### sharedCreate(ConfObject) <a href="#sharedcreate-f382ccaab8f7" id="sharedcreate-f382ccaab8f7"></a>

```java
public com.tailf.navu.NavuContainer sharedCreate(
    com.tailf.conf.ConfObject key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Variant of `create(ConfObject)` that succeeds even if the
 key already exists, and also maintains a reference counter
 on the object.

**Parameters**

- `com.tailf.conf.ConfObject key` - the key with which the newly created list entry is to be
            associated

**Returns:** the created list entry or, if it already exists, the list entry
         corresponding to the given key, `key`

### sharedCreate(String) <a href="#sharedcreate-931ab178735a" id="sharedcreate-931ab178735a"></a>

```java
public com.tailf.navu.NavuContainer sharedCreate(String keyStr) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Variant of [`create(String)`](NavuList.md#create-7117d2531c85) that succeeds even if the
 key already exists, and also maintains a reference counter
 on the object.

**Parameters**

- `String keyStr` - the string representation of the key value with which
               the newly created list entry is to be associated

**Returns:** the created list entry or, if it already exists, the list entry
         corresponding to the given key, `key`

### sharedCreate(String[]) <a href="#sharedcreate-6bd749aafdff" id="sharedcreate-6bd749aafdff"></a>

```java
public com.tailf.navu.NavuContainer sharedCreate(
    String[] keyArr
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Variant of [`create(String[])`](NavuList.md#create-bb5b4583dcf5) that succeeds even if the
 key already exists, and also maintains a reference counter
 on the object.

**Parameters**

- `String[] keyArr` - the string array from which to create the key that the
               newly created list entry is to be associated with

**Returns:** the created list entry or, if it already exists, the list entry
         corresponding to the given key, `keyArr`

### size() <a href="#size-c6d8505255fd" id="size-c6d8505255fd"></a>

```java
public int size() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns the number of list elements contained by the list node.

**Returns:** the number of elements in this list

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

### valueUpdateInd(NavuNode) <a href="#valueupdateind-e7cd65f79d78" id="valueupdateind-e7cd65f79d78"></a>

```java
public void valueUpdateInd(com.tailf.navu.NavuNode child) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.navu.NavuNode child`


## Nested Types

- [WhereTo](NavuList/WhereTo.md#whereto-ed479ce50b9a)
