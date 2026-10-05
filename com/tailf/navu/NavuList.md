# NavuList <a href="#cls-NavuList" id="cls-NavuList"></a>

```java
public class com.tailf.navu.NavuList
    extends com.tailf.navu.NavuNode
    implements Iterable<com.tailf.navu.NavuListEntry>
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuListEntry](NavuListEntry.md#cls-NavuListEntry)

`NavuList` is a representation of the *YANG* list node.

 A `NavuList` holds a map of list entries,
 [`NavuListEntry`](NavuListEntry.md#cls-NavuListEntry), each associated with a key, [`ConfKey`](../conf/ConfKey.md#cls-ConfKey), thus
 each child is indexed by its key and the individual entry is retrieved
 by the `elem(ConfKey)` method.

 The `elem` method declares that it returns
 a [`NavuContainer`](NavuContainer.md#cls-NavuContainer) but its underlying subtype is actually a
 [`NavuListEntry`](NavuListEntry.md#cls-NavuListEntry).

 `NavuList` also supports keyless lists (lists without keys).

 If the *YANG* list is keyless, an individual child is retrieved
 through its "pseudo-key" which must always be of the type
 [`ConfInt64`](../conf/ConfInt64.md#cls-ConfInt64).




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
 [`children()`](NavuList.md#m-children-7d31300d62c3), [`elements()`](NavuList.md#m-elements-1ac1cabc0e96) or by retrieving
 an iterator [`iterator()`](NavuList.md#m-iterator-188aa52d1f86).




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

- [NavuList(Maapi, int, MaapiSchemas, CSNode, NavuNode, String, Object[])](#m-NavuList-441cdb57852f)
- [NavuList(NavuContext, MaapiSchemas, CSNode, NavuNode, Formats)](#m-NavuList-4974496312b1)
- [NavuList(NavuContext, MaapiSchemas, CSNode, NavuNode, String, Object[])](#m-NavuList-be9598ccb1c3)

**Fields**:

- [arguments](NavuNode.md#m-arguments) from NavuNode
- [change](NavuNode.md#m-change) from NavuNode
- [context](NavuNode.md#m-context) from NavuNode
- [fmt](NavuNode.md#m-fmt) from NavuNode
- [mountId](NavuNode.md#m-mountId) from NavuNode
- [myConfPath](NavuNode.md#m-myConfPath) from NavuNode
- [node](NavuNode.md#m-node) from NavuNode
- [parent](NavuNode.md#m-parent) from NavuNode

**Methods**:

- [children()](#m-children-7d31300d62c3)
- [container(ConfNamespace, String)](NavuNode.md#m-container-31c604ba30e3) from NavuNode
- [container(Integer)](NavuNode.md#m-container-abb10ecdc3f6) from NavuNode
- [container(String)](NavuNode.md#m-container-76f5d191b16d) from NavuNode
- [containsNode(ConfKey)](#m-containsNode-cc5638d33d8f)
- [containsNode(NavuContainer)](#m-containsNode-78948adb0e66)
- [containsNode(String)](#m-containsNode-445990dba920)
- [containsNode(String[])](#m-containsNode-dfae76dca10c)
- [context()](NavuNode.md#m-context-0990f1a0bb68) from NavuNode
- [create(ConfKey)](#m-create-c5469df729c3)
- [create(ConfObject)](#m-create-c10d5ef19510)
- [create(String)](#m-create-7117d2531c85)
- [create(String[])](#m-create-bb5b4583dcf5)
- [delete()](NavuListEntry.md#m-delete-a9e76d49da61) from NavuListEntry
- [delete(ConfKey)](#m-delete-e654021e5e2c)
- [delete(String)](#m-delete-16af8bc13c9c)
- [delete(String[])](#m-delete-8d2acbf4221d)
- [deleteAll()](#m-deleteAll-3c419d9e9586)
- [elem(ConfKey)](#m-elem-172930b5966b)
- [elem(String)](#m-elem-9ab35f036d02)
- [elem(String[])](#m-elem-083efd6c9325)
- [elements()](#m-elements-1ac1cabc0e96)
- [encodeValues()](#m-encodeValues-7bd911383b1a)
- [encodeXML()](#m-encodeXML-bdbcd52c2505)
- [entrySet()](#m-entrySet-20b678143b7e)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [exists()](#m-exists-56968a4c7bda)
- [filterChildren(CSNode)](NavuNode.md#m-filterChildren-e72b7b1ab25d) from NavuNode
- [getChangeFlag()](#m-getChangeFlag-33cadf5a32ba)
- [getChanges(NavuContext)](NavuNode.md#m-getChanges-c106383f174d) from NavuNode
- [getChanges(NavuContext, boolean)](NavuNode.md#m-getChanges-bcf5b6dbccf2) from NavuNode
- [getChanges(NavuContext, boolean, DiffIterateOperFlag[])](NavuNode.md#m-getChanges-9f13a683b086) from NavuNode
- [getConfPath()](NavuNode.md#m-getConfPath-c7ca3cb63c17) from NavuNode
- [getInfo()](NavuNode.md#m-getInfo-259a72b5d74c) from NavuNode
- [getKey()](NavuListEntry.md#m-getKey-9a8856159458) from NavuListEntry
- [getKeyPath()](NavuNode.md#m-getKeyPath-4c9200912948) from NavuNode
- [getName()](NavuNode.md#m-getName-2634b18b4a25) from NavuNode
- [getNavuNode(ConfPath)](NavuNode.md#m-getNavuNode-d19ad1dd90fc) from NavuNode
- [getParent()](#m-getParent-45c1b196ed70)
- [getRootNS()](NavuNode.md#m-getRootNS-3f1d054cecd6) from NavuNode
- [getValues(ConfXMLParam[])](NavuNode.md#m-getValues-1eb02439a757) from NavuNode
- [getValues(String)](NavuNode.md#m-getValues-c03de090764d) from NavuNode
- [hashCode()](#m-hashCode-ef797a217903)
- [insert(ConfKey, boolean)](#m-insert-d78425063c87)
- [isEmpty()](#m-isEmpty-4dde48126244)
- [isNodeNavuLocal()](#m-isNodeNavuLocal-3af8ba5398d1)
- [iterator()](#m-iterator-188aa52d1f86)
- [keySet()](#m-keySet-66de8917ecb8)
- [leaf(ConfNamespace, String)](NavuNode.md#m-leaf-da3758f37f21) from NavuNode
- [leaf(Integer)](NavuNode.md#m-leaf-47fda8402c20) from NavuNode
- [leaf(String)](NavuNode.md#m-leaf-ac189787d67d) from NavuNode
- [leafList(ConfNamespace, String)](NavuNode.md#m-leafList-a2d5ad836b3e) from NavuNode
- [leafList(Integer)](NavuNode.md#m-leafList-552c8007ecb4) from NavuNode
- [leafList(String)](NavuNode.md#m-leafList-5811cbb534ec) from NavuNode
- [list(ConfNamespace, String)](NavuNode.md#m-list-6b15381fd14a) from NavuNode
- [list(Integer)](NavuNode.md#m-list-7dc96bdbb69a) from NavuNode
- [list(String)](NavuNode.md#m-list-2c1a74a3cf07) from NavuNode
- [move(ConfKey, WhereTo, ConfKey)](#m-move-dbba3e109e78)
- [move(String, WhereTo, String)](#m-move-2e3f4f4fe7c9)
- [namespace(String)](NavuNode.md#m-namespace-e29ad62ed095) from NavuNode
- [prefix(String)](NavuNode.md#m-prefix-fdd71b8275bb) from NavuNode
- [prepareXMLCall(String)](NavuNode.md#m-prepareXMLCall-c22e250f2cac) from NavuNode
- [refresh()](#m-refresh-3852c3f76c8e)
- [reset()](#m-reset-6927918ac70a)
- [safeCreate(ConfKey)](#m-safeCreate-91589643f1b0)
- [safeCreate(ConfObject)](#m-safeCreate-217b89495744)
- [safeCreate(String)](#m-safeCreate-e4235ee54874)
- [safeCreate(String[])](#m-safeCreate-04a6751c7a49)
- [select(ConfObject[])](#m-select-336dd76cd112)
- [select(List<String>)](#m-select-e81f36150174)
- [select(String)](#m-select-5031325154b9)
- [setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext)](#m-setChange-0bbeb54ebc15)
- [setMaxListSize(int)](#m-setMaxListSize-f73dc316f2f1)
- [setValues(ConfXMLParam[])](NavuNode.md#m-setValues-50d8edffa795) from NavuNode
- [setValues(String)](NavuNode.md#m-setValues-3ec9581ce266) from NavuNode
- [sharedCreate(ConfKey)](#m-sharedCreate-fd9caea86f03)
- [sharedCreate(ConfObject)](#m-sharedCreate-f382ccaab8f7)
- [sharedCreate(String)](#m-sharedCreate-931ab178735a)
- [sharedCreate(String[])](#m-sharedCreate-6bd749aafdff)
- [sharedSetValues(ConfXMLParam[])](NavuNode.md#m-sharedSetValues-705549be9df0) from NavuNode
- [sharedSetValues(String)](NavuNode.md#m-sharedSetValues-ad93c38b671f) from NavuNode
- [size()](#m-size-c6d8505255fd)
- [stopCdbSession()](NavuNode.md#m-stopCdbSession-17418252a986) from NavuNode
- [toString()](#m-toString-e9d48c5503ef)
- [valueUpdateInd(NavuNode)](#m-valueUpdateInd-e7cd65f79d78)
- [xPathSelect(String)](NavuNode.md#m-xPathSelect-0fb26b9f41e0) from NavuNode
- [xPathSelectIterate(String, NavuNodeSetIterate)](NavuNode.md#m-xPathSelectIterate-12547f34f47c) from NavuNode

**Nested Types**:

- [WhereTo](NavuList/WhereTo.md#cls-WhereTo)

## Constructors

### NavuList(Maapi, int, MaapiSchemas, CSNode, NavuNode, String, Object[]) <a href="#m-NavuList-441cdb57852f" id="m-NavuList-441cdb57852f"></a>

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

Types: [Maapi](../maapi/Maapi.md#cls-Maapi), [MaapiSchemas](../maapi/MaapiSchemas.md#cls-MaapiSchemas), [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [NavuNode](NavuNode.md#cls-NavuNode)

**Parameters**

- `com.tailf.maapi.Maapi m`
- `int handle`
- `com.tailf.maapi.MaapiSchemas sch`
- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.navu.NavuNode parent`
- `String fmt`
- `Object[] arguments`

### NavuList(NavuContext, MaapiSchemas, CSNode, NavuNode, Formats) <a href="#m-NavuList-4974496312b1" id="m-NavuList-4974496312b1"></a>

```java
protected NavuList(
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

### NavuList(NavuContext, MaapiSchemas, CSNode, NavuNode, String, Object[]) <a href="#m-NavuList-be9598ccb1c3" id="m-NavuList-be9598ccb1c3"></a>

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

Types: [NavuContext](NavuContext.md#cls-NavuContext), [MaapiSchemas](../maapi/MaapiSchemas.md#cls-MaapiSchemas), [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [NavuNode](NavuNode.md#cls-NavuNode)

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas sch`
- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.navu.NavuNode parent`
- `String fmt`
- `Object[] arguments`


## Methods

### children() <a href="#m-children-7d31300d62c3" id="m-children-7d31300d62c3"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> children() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

Returns all elements contained by the list node.

**Returns:** a collection of list elements

**Throws**

- `NavuException` - if the elements could not be retrieved

### containsNode(ConfKey) <a href="#m-containsNode-cc5638d33d8f" id="m-containsNode-cc5638d33d8f"></a>

```java
public boolean containsNode(com.tailf.conf.ConfKey key) throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#cls-ConfKey), [NavuException](NavuException.md#cls-NavuException)

Returns true if and only if this `NavuList`
 contains a `NavuListEntry` where
 [`NavuListEntry#getKey()`](NavuListEntry.md#m-getKey-9a8856159458) `equals` the specified
 `key`.

**Parameters**

- `com.tailf.conf.ConfKey key` - whose presence in this `NavuList` is to be
 tested

**Returns:** `true` if this `NavuList` contains a entry
 with the specified `key`

### containsNode(NavuContainer) <a href="#m-containsNode-78948adb0e66" id="m-containsNode-78948adb0e66"></a>

```java
public boolean containsNode(com.tailf.navu.NavuContainer node)
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer)

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

### containsNode(String) <a href="#m-containsNode-445990dba920" id="m-containsNode-445990dba920"></a>

```java
public boolean containsNode(String keyStr) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Returns `true` if this `NavuList` contains a mapping
 for the specified string representation of a key.

**Parameters**

- `String keyStr` - a string representation of a key whose presence in this
        `NavuList` is to be tested

**Returns:** `true` if this `NavuList` maps a  keys to the
         specified node

### containsNode(String[]) <a href="#m-containsNode-dfae76dca10c" id="m-containsNode-dfae76dca10c"></a>

```java
public boolean containsNode(String[] keyArr) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

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

### create(ConfKey) <a href="#m-create-c5469df729c3" id="m-create-c5469df729c3"></a>

```java
public com.tailf.navu.NavuContainer create(
    com.tailf.conf.ConfKey key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [ConfKey](../conf/ConfKey.md#cls-ConfKey), [NavuException](NavuException.md#cls-NavuException)

Create and return a new list element in this `NavuList`.

 We have 3 different variants of `create`.


2. `create()` This method will fail with a
 [`NavuException`](NavuException.md#cls-NavuException) with the error code set to
 [`ErrorCode#ERR_ALREADY_EXISTS`](../conf/ErrorCode.md#m-ERR_ALREADY_EXISTS) if the key already exists.

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

### create(ConfObject) <a href="#m-create-c10d5ef19510" id="m-create-c10d5ef19510"></a>

```java
public com.tailf.navu.NavuContainer create(
    com.tailf.conf.ConfObject key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [NavuException](NavuException.md#cls-NavuException)

Convenience variant of `create(ConfKey)` accepting a
 [`ConfObject`](../conf/ConfObject.md#cls-ConfObject) as the (single element) key.

**Parameters**

- `com.tailf.conf.ConfObject key` - the key with which the newly created list entry is to be
            associated

**Returns:** the created list entry

### create(String) <a href="#m-create-7117d2531c85" id="m-create-7117d2531c85"></a>

```java
public com.tailf.navu.NavuContainer create(String keyStr) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [NavuException](NavuException.md#cls-NavuException)

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

### create(String[]) <a href="#m-create-bb5b4583dcf5" id="m-create-bb5b4583dcf5"></a>

```java
public com.tailf.navu.NavuContainer create(String[] keyArr) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [NavuException](NavuException.md#cls-NavuException)

Convenience variant of `create(ConfKey)` accepting a
 string array as the key. Typically useful for multiple element keys.

**Parameters**

- `String[] keyArr` - the string array from which to create the key that the
               newly created list entry is to be associated with

**Returns:** the created list entry

### delete(ConfKey) <a href="#m-delete-e654021e5e2c" id="m-delete-e654021e5e2c"></a>

```java
public void delete(com.tailf.conf.ConfKey key) throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#cls-ConfKey), [NavuException](NavuException.md#cls-NavuException)

Deletes an element from the list.

**Parameters**

- `com.tailf.conf.ConfKey key` - the key of the element to delete

### delete(String) <a href="#m-delete-16af8bc13c9c" id="m-delete-16af8bc13c9c"></a>

```java
public void delete(String keyStr) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Deletes an element from the list.

 This is a convenience method for lists with single element
 key. If the string is enclosed in curly braces like {test},
 the curly braces are stripped. If this not desired another
 overloaded method should be used.

**Parameters**

- `String keyStr` - string representation of a single element key

### delete(String[]) <a href="#m-delete-8d2acbf4221d" id="m-delete-8d2acbf4221d"></a>

```java
public void delete(String[] keyArr) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Deletes an element from the list.

 This is a convenience method for lists with multiple element
 keys.

**Parameters**

- `String[] keyArr` - string array representation of a multiple element key

### deleteAll() <a href="#m-deleteAll-3c419d9e9586" id="m-deleteAll-3c419d9e9586"></a>

```java
public void deleteAll() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Deletes all element from the list.

### elem(ConfKey) <a href="#m-elem-172930b5966b" id="m-elem-172930b5966b"></a>

```java
public com.tailf.navu.NavuListEntry elem(
    com.tailf.conf.ConfKey key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuListEntry](NavuListEntry.md#cls-NavuListEntry), [ConfKey](../conf/ConfKey.md#cls-ConfKey), [NavuException](NavuException.md#cls-NavuException)

Returns a list element according to the given key.

**Parameters**

- `com.tailf.conf.ConfKey key` - a key identifying the list element

**Returns:** a matching element, or null if no matching element is found

### elem(String) <a href="#m-elem-9ab35f036d02" id="m-elem-9ab35f036d02"></a>

```java
public com.tailf.navu.NavuContainer elem(String keyStr) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [NavuException](NavuException.md#cls-NavuException)

Returns a list element according to the given key.

 This is a convenience method for lists with single element
 key. If the string is enclosed in curly braces like {test},
 the curly braces are stripped. If this not desired another
 overloaded method should be used.

**Parameters**

- `String keyStr` - string representation on single element key

**Returns:** a matching list element or null, if no matching element is found.

### elem(String[]) <a href="#m-elem-083efd6c9325" id="m-elem-083efd6c9325"></a>

```java
public com.tailf.navu.NavuContainer elem(String[] keyArr) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [NavuException](NavuException.md#cls-NavuException)

Returns a list element according to the given array of keys.

 This is a convenience method for lists with multiple element
 keys.

**Parameters**

- `String[] keyArr` - string array representation of a multiple element key

**Returns:** a matching list element, or null if no matching element is found

### elements() <a href="#m-elements-1ac1cabc0e96" id="m-elements-1ac1cabc0e96"></a>

```java
public java.util.Collection<com.tailf.navu.NavuContainer> elements() throws com.tailf.navu.NavuException
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [NavuException](NavuException.md#cls-NavuException)

Returns a shallow copy of all elements contained by the list node.

 The elements contained by this list node are not cloned

**Returns:** a copy of the collection of list elements

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

### entrySet() <a href="#m-entrySet-20b678143b7e" id="m-entrySet-20b678143b7e"></a>

```java
public java.util.Set<java.util.Map.Entry<com.tailf.conf.ConfKey,com.tailf.navu.NavuListEntry>> entrySet() throws com.tailf.navu.NavuException
    throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#cls-ConfKey), [NavuListEntry](NavuListEntry.md#cls-NavuListEntry), [NavuException](NavuException.md#cls-NavuException)

Returns a set of entries with element key and element.

**Returns:** a set of entries

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Compares the specified object with this `NavuList`
 for equality.
 Returns `true` if the given object is also a
 `NavuList` and it has the same [`ConfPath`](../conf/ConfPath.md#cls-ConfPath) as this
 `NavuList`.

**Parameters**

- `Object o` - the object to be compared for equality with this
          `NavuList`

**Returns:** `true` if the specified object is equal to this
         `NavuList`

### exists() <a href="#m-exists-56968a4c7bda" id="m-exists-56968a4c7bda"></a>

```java
public boolean exists() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

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

### getChangeFlag() <a href="#m-getChangeFlag-33cadf5a32ba" id="m-getChangeFlag-33cadf5a32ba"></a>

```java
public com.tailf.conf.DiffIterateOperFlag getChangeFlag()
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag)

See: [`NavuNode.getChangeFlag()`](NavuNode.md#m-getChangeFlag-33cadf5a32ba)

### getParent() <a href="#m-getParent-45c1b196ed70" id="m-getParent-45c1b196ed70"></a>

```java
public com.tailf.navu.NavuNode getParent()
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### insert(ConfKey, boolean) <a href="#m-insert-d78425063c87" id="m-insert-d78425063c87"></a>

```java
public com.tailf.navu.NavuContainer insert(
    com.tailf.conf.ConfKey key,
    boolean createBackpointer
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [ConfKey](../conf/ConfKey.md#cls-ConfKey), [NavuException](NavuException.md#cls-NavuException)

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

### isEmpty() <a href="#m-isEmpty-4dde48126244" id="m-isEmpty-4dde48126244"></a>

```java
public boolean isEmpty() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Checks if there are any elements in the list.

**Returns:** true if there are no list entries, false otherwise,

### isNodeNavuLocal() <a href="#m-isNodeNavuLocal-3af8ba5398d1" id="m-isNodeNavuLocal-3af8ba5398d1"></a>

```java
public boolean isNodeNavuLocal()
```

### iterator() <a href="#m-iterator-188aa52d1f86" id="m-iterator-188aa52d1f86"></a>

```java
public java.util.Iterator<com.tailf.navu.NavuListEntry> iterator()
```

Types: [NavuListEntry](NavuListEntry.md#cls-NavuListEntry)

Retrieve a iterator over the elements in this `NavuList`
 (in proper sequence).

### keySet() <a href="#m-keySet-66de8917ecb8" id="m-keySet-66de8917ecb8"></a>

```java
public java.util.Set<com.tailf.conf.ConfKey> keySet() throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#cls-ConfKey), [NavuException](NavuException.md#cls-NavuException)

Returns a Set containing all of the keys for this list.

**Returns:** the full set of keys for this list

### move(ConfKey, WhereTo, ConfKey) <a href="#m-move-dbba3e109e78" id="m-move-dbba3e109e78"></a>

```java
public void move(
    com.tailf.conf.ConfKey key,
    com.tailf.navu.NavuList.WhereTo whereTo,
    com.tailf.conf.ConfKey to
)
    throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#cls-ConfKey), [WhereTo](NavuList/WhereTo.md#cls-WhereTo), [NavuException](NavuException.md#cls-NavuException)

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

### move(String, WhereTo, String) <a href="#m-move-2e3f4f4fe7c9" id="m-move-2e3f4f4fe7c9"></a>

```java
public void move(
    String keyStr,
    com.tailf.navu.NavuList.WhereTo whereTo,
    String toStr
)
    throws com.tailf.navu.NavuException
```

Types: [WhereTo](NavuList/WhereTo.md#cls-WhereTo), [NavuException](NavuException.md#cls-NavuException)

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

### refresh() <a href="#m-refresh-3852c3f76c8e" id="m-refresh-3852c3f76c8e"></a>

```java
protected void refresh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Reads list entries through the [`NavuCursor`](NavuCursor.md#cls-NavuCursor) which handles
 key retrieval through Maapi and CDB.

### reset() <a href="#m-reset-6927918ac70a" id="m-reset-6927918ac70a"></a>

```java
public void reset()
```

When navigating through NAVU to a certain list, the list values are
 cached as they are read.

 This method clears this cache and and indicates to Navu that the list
 elements should be re-read as they are retrieved.

### safeCreate(ConfKey) <a href="#m-safeCreate-91589643f1b0" id="m-safeCreate-91589643f1b0"></a>

```java
public com.tailf.navu.NavuContainer safeCreate(
    com.tailf.conf.ConfKey key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [ConfKey](../conf/ConfKey.md#cls-ConfKey), [NavuException](NavuException.md#cls-NavuException)

Variant of `create(ConfKey)` that succeeds even if the
 key already exists.

**Parameters**

- `com.tailf.conf.ConfKey key` - the key with which the newly created list entry is to be
            associated

**Returns:** the created list entry or, if it already exists, the list entry
         corresponding to the given key, `key`

### safeCreate(ConfObject) <a href="#m-safeCreate-217b89495744" id="m-safeCreate-217b89495744"></a>

```java
public com.tailf.navu.NavuContainer safeCreate(
    com.tailf.conf.ConfObject key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [NavuException](NavuException.md#cls-NavuException)

Variant of `create(ConfObject)` that succeeds even if
 the key already exists.

**Parameters**

- `com.tailf.conf.ConfObject key` - the key with which the newly created list entry is to be
            associated

**Returns:** the created list entry or, if it already exists, the list entry
         corresponding to the given key, `key`

### safeCreate(String) <a href="#m-safeCreate-e4235ee54874" id="m-safeCreate-e4235ee54874"></a>

```java
public com.tailf.navu.NavuContainer safeCreate(String keyStr) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [NavuException](NavuException.md#cls-NavuException)

Variant of [`create(String)`](NavuList.md#m-create-7117d2531c85) that succeeds even if the
 key already exists.

**Parameters**

- `String keyStr` - the string representation of the key value with which the
               newly created list entry is to be associated

**Returns:** the created list entry or, if it already exists, the list entry
         corresponding to the given key, `key`

### safeCreate(String[]) <a href="#m-safeCreate-04a6751c7a49" id="m-safeCreate-04a6751c7a49"></a>

```java
public com.tailf.navu.NavuContainer safeCreate(String[] keyArr) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [NavuException](NavuException.md#cls-NavuException)

Variant of [`create(String[])`](NavuList.md#m-create-bb5b4583dcf5) that succeeds even if the
 key already exists.

**Parameters**

- `String[] keyArr` - the string array from which to create the key that the
               newly created list entry is to be associated with

**Returns:** the created list entry or, if it already exists, the list entry
         corresponding to the given key, `keyArr`

### select(ConfObject[]) <a href="#m-select-336dd76cd112" id="m-select-336dd76cd112"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`

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

### setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext) <a href="#m-setChange-0bbeb54ebc15" id="m-setChange-0bbeb54ebc15"></a>

```java
public com.tailf.navu.NavuNode setChange(
    java.util.List<com.tailf.conf.ConfObject> path,
    com.tailf.conf.DiffIterateOperFlag op,
    com.tailf.conf.ConfValue oldValue,
    com.tailf.navu.NavuContext delContext
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag), [ConfValue](../conf/ConfValue.md#cls-ConfValue), [NavuContext](NavuContext.md#cls-NavuContext), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `java.util.List<com.tailf.conf.ConfObject> path`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfValue oldValue`
- `com.tailf.navu.NavuContext delContext`

### setMaxListSize(int) <a href="#m-setMaxListSize-f73dc316f2f1" id="m-setMaxListSize-f73dc316f2f1"></a>

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

### sharedCreate(ConfKey) <a href="#m-sharedCreate-fd9caea86f03" id="m-sharedCreate-fd9caea86f03"></a>

```java
public com.tailf.navu.NavuContainer sharedCreate(
    com.tailf.conf.ConfKey key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [ConfKey](../conf/ConfKey.md#cls-ConfKey), [NavuException](NavuException.md#cls-NavuException)

Variant of `create(ConfKey)` that succeeds even if the
 key already exists, and also maintains a reference counter
 on the object.

**Parameters**

- `com.tailf.conf.ConfKey key` - the key with which the newly created list entry is to be
            associated

**Returns:** the created list entry or, if it already exists, the list entry
         corresponding to the given key, `key`

### sharedCreate(ConfObject) <a href="#m-sharedCreate-f382ccaab8f7" id="m-sharedCreate-f382ccaab8f7"></a>

```java
public com.tailf.navu.NavuContainer sharedCreate(
    com.tailf.conf.ConfObject key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [NavuException](NavuException.md#cls-NavuException)

Variant of `create(ConfObject)` that succeeds even if the
 key already exists, and also maintains a reference counter
 on the object.

**Parameters**

- `com.tailf.conf.ConfObject key` - the key with which the newly created list entry is to be
            associated

**Returns:** the created list entry or, if it already exists, the list entry
         corresponding to the given key, `key`

### sharedCreate(String) <a href="#m-sharedCreate-931ab178735a" id="m-sharedCreate-931ab178735a"></a>

```java
public com.tailf.navu.NavuContainer sharedCreate(String keyStr) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [NavuException](NavuException.md#cls-NavuException)

Variant of [`create(String)`](NavuList.md#m-create-7117d2531c85) that succeeds even if the
 key already exists, and also maintains a reference counter
 on the object.

**Parameters**

- `String keyStr` - the string representation of the key value with which
               the newly created list entry is to be associated

**Returns:** the created list entry or, if it already exists, the list entry
         corresponding to the given key, `key`

### sharedCreate(String[]) <a href="#m-sharedCreate-6bd749aafdff" id="m-sharedCreate-6bd749aafdff"></a>

```java
public com.tailf.navu.NavuContainer sharedCreate(
    String[] keyArr
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [NavuException](NavuException.md#cls-NavuException)

Variant of [`create(String[])`](NavuList.md#m-create-bb5b4583dcf5) that succeeds even if the
 key already exists, and also maintains a reference counter
 on the object.

**Parameters**

- `String[] keyArr` - the string array from which to create the key that the
               newly created list entry is to be associated with

**Returns:** the created list entry or, if it already exists, the list entry
         corresponding to the given key, `keyArr`

### size() <a href="#m-size-c6d8505255fd" id="m-size-c6d8505255fd"></a>

```java
public int size() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Returns the number of list elements contained by the list node.

**Returns:** the number of elements in this list

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

### valueUpdateInd(NavuNode) <a href="#m-valueUpdateInd-e7cd65f79d78" id="m-valueUpdateInd-e7cd65f79d78"></a>

```java
public void valueUpdateInd(com.tailf.navu.NavuNode child) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode child`


## Nested Types

- [WhereTo](NavuList/WhereTo.md#cls-WhereTo)
