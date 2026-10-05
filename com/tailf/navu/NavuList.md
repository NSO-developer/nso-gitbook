<a id="s-NavuList"></a>
# NavuList

```java
public class com.tailf.navu.NavuList
    extends com.tailf.navu.NavuNode
    implements Iterable<com.tailf.navu.NavuListEntry>
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuListEntry](NavuListEntry.md#s-NavuListEntry)

`NavuList` is a representation of the *YANG* list node.

 A `NavuList` holds a map of list entries,
 [`NavuListEntry`](NavuListEntry.md#s-NavuListEntry), each associated with a key, [`ConfKey`](../conf/ConfKey.md#s-ConfKey), thus
 each child is indexed by its key and the individual entry is retrieved
 by the [`ConfKey`](../conf/ConfKey.md#s-ConfKey) method.

 The `elem` method declares that it returns
 a [`NavuContainer`](NavuContainer.md#s-NavuContainer) but its underlying subtype is actually a
 [`NavuListEntry`](NavuListEntry.md#s-NavuListEntry).

 `NavuList` also supports keyless lists (lists without keys).

 If the *YANG* list is keyless, an individual child is retrieved
 through its "pseudo-key" which must always be of the type
 [`ConfInt64`](../conf/ConfInt64.md#s-ConfInt64).




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
 `#children()`, `#elements()` or by retrieving
 an iterator `#iterator()`.




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

- [NavuList(Maapi, int, MaapiSchemas, CSNode, NavuNode, String, Object[])](#s-NavuList-1)
- [NavuList(NavuContext, MaapiSchemas, CSNode, NavuNode, Formats)](#s-NavuList-2)
- [NavuList(NavuContext, MaapiSchemas, CSNode, NavuNode, String, Object[])](#s-NavuList-3)

**Fields**:

- [arguments](NavuNode.md#s-arguments) from NavuNode
- [change](NavuNode.md#s-change) from NavuNode
- [context](NavuNode.md#s-context) from NavuNode
- [fmt](NavuNode.md#s-fmt) from NavuNode
- [mountId](NavuNode.md#s-mountId) from NavuNode
- [myConfPath](NavuNode.md#s-myConfPath) from NavuNode
- [node](NavuNode.md#s-node) from NavuNode
- [parent](NavuNode.md#s-parent) from NavuNode

**Methods**:

- [children()](#s-children)
- [container(ConfNamespace, String)](NavuNode.md#s-container) from NavuNode
- [container(Integer)](NavuNode.md#s-container-1) from NavuNode
- [container(String)](NavuNode.md#s-container-2) from NavuNode
- [containsNode(ConfKey)](#s-containsNode)
- [containsNode(NavuContainer)](#s-containsNode-1)
- [containsNode(String)](#s-containsNode-2)
- [containsNode(String[])](#s-containsNode-3)
- [context()](NavuNode.md#s-context-1) from NavuNode
- [create(ConfKey)](#s-create)
- [create(ConfObject)](#s-create-1)
- [create(String)](#s-create-2)
- [create(String[])](#s-create-3)
- [delete()](NavuListEntry.md#s-delete) from NavuListEntry
- [delete(ConfKey)](#s-delete)
- [delete(String)](#s-delete-1)
- [delete(String[])](#s-delete-2)
- [deleteAll()](#s-deleteAll)
- [elem(ConfKey)](#s-elem)
- [elem(String)](#s-elem-1)
- [elem(String[])](#s-elem-2)
- [elements()](#s-elements)
- [encodeValues()](#s-encodeValues)
- [encodeXML()](#s-encodeXML)
- [entrySet()](#s-entrySet)
- [equals(Object)](#s-equals)
- [exists()](#s-exists)
- [filterChildren(CSNode)](NavuNode.md#s-filterChildren) from NavuNode
- [getChangeFlag()](#s-getChangeFlag)
- [getChanges(NavuContext)](NavuNode.md#s-getChanges) from NavuNode
- [getChanges(NavuContext, boolean)](NavuNode.md#s-getChanges-1) from NavuNode
- [getChanges(NavuContext, boolean, DiffIterateOperFlag[])](NavuNode.md#s-getChanges-2) from NavuNode
- [getConfPath()](NavuNode.md#s-getConfPath) from NavuNode
- [getInfo()](NavuNode.md#s-getInfo) from NavuNode
- [getKey()](NavuListEntry.md#s-getKey) from NavuListEntry
- [getKeyPath()](NavuNode.md#s-getKeyPath) from NavuNode
- [getName()](NavuNode.md#s-getName) from NavuNode
- [getNavuNode(ConfPath)](NavuNode.md#s-getNavuNode) from NavuNode
- [getParent()](#s-getParent)
- [getRootNS()](NavuNode.md#s-getRootNS) from NavuNode
- [getValues(ConfXMLParam[])](NavuNode.md#s-getValues) from NavuNode
- [getValues(String)](NavuNode.md#s-getValues-1) from NavuNode
- [hashCode()](#s-hashCode)
- [insert(ConfKey, boolean)](#s-insert)
- [isEmpty()](#s-isEmpty)
- [isNodeNavuLocal()](#s-isNodeNavuLocal)
- [iterator()](#s-iterator)
- [keySet()](#s-keySet)
- [leaf(ConfNamespace, String)](NavuNode.md#s-leaf) from NavuNode
- [leaf(Integer)](NavuNode.md#s-leaf-1) from NavuNode
- [leaf(String)](NavuNode.md#s-leaf-2) from NavuNode
- [leafList(ConfNamespace, String)](NavuNode.md#s-leafList) from NavuNode
- [leafList(Integer)](NavuNode.md#s-leafList-1) from NavuNode
- [leafList(String)](NavuNode.md#s-leafList-2) from NavuNode
- [list(ConfNamespace, String)](NavuNode.md#s-list) from NavuNode
- [list(Integer)](NavuNode.md#s-list-1) from NavuNode
- [list(String)](NavuNode.md#s-list-2) from NavuNode
- [move(ConfKey, WhereTo, ConfKey)](#s-move)
- [move(String, WhereTo, String)](#s-move-1)
- [namespace(String)](NavuNode.md#s-namespace) from NavuNode
- [prefix(String)](NavuNode.md#s-prefix) from NavuNode
- [prepareXMLCall(String)](NavuNode.md#s-prepareXMLCall) from NavuNode
- [refresh()](#s-refresh)
- [reset()](#s-reset)
- [safeCreate(ConfKey)](#s-safeCreate)
- [safeCreate(ConfObject)](#s-safeCreate-1)
- [safeCreate(String)](#s-safeCreate-2)
- [safeCreate(String[])](#s-safeCreate-3)
- [select(ConfObject[])](#s-select)
- [select(List<String>)](#s-select-1)
- [select(String)](#s-select-2)
- [setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext)](#s-setChange)
- [setMaxListSize(int)](#s-setMaxListSize)
- [setValues(ConfXMLParam[])](NavuNode.md#s-setValues) from NavuNode
- [setValues(String)](NavuNode.md#s-setValues-1) from NavuNode
- [sharedCreate(ConfKey)](#s-sharedCreate)
- [sharedCreate(ConfObject)](#s-sharedCreate-1)
- [sharedCreate(String)](#s-sharedCreate-2)
- [sharedCreate(String[])](#s-sharedCreate-3)
- [sharedSetValues(ConfXMLParam[])](NavuNode.md#s-sharedSetValues) from NavuNode
- [sharedSetValues(String)](NavuNode.md#s-sharedSetValues-1) from NavuNode
- [size()](#s-size)
- [stopCdbSession()](NavuNode.md#s-stopCdbSession) from NavuNode
- [toString()](#s-toString)
- [valueUpdateInd(NavuNode)](#s-valueUpdateInd)
- [xPathSelect(String)](NavuNode.md#s-xPathSelect) from NavuNode
- [xPathSelectIterate(String, NavuNodeSetIterate)](NavuNode.md#s-xPathSelectIterate) from NavuNode

**Nested Types**:

- [WhereTo](NavuList/WhereTo.md#s-WhereTo)

## Constructors

<a id="s-NavuList-1"></a>
### NavuList(Maapi, int, MaapiSchemas, CSNode, NavuNode, String, Object[])

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

Types: [Maapi](../maapi/Maapi.md#s-Maapi), [MaapiSchemas](../maapi/MaapiSchemas.md#s-MaapiSchemas), [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [NavuNode](NavuNode.md#s-NavuNode)

**Parameters**

- `com.tailf.maapi.Maapi m`
- `int handle`
- `com.tailf.maapi.MaapiSchemas sch`
- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.navu.NavuNode parent`
- `String fmt`
- `Object[] arguments`

<a id="s-NavuList-2"></a>
### NavuList(NavuContext, MaapiSchemas, CSNode, NavuNode, Formats)

```java
protected NavuList(
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

<a id="s-NavuList-3"></a>
### NavuList(NavuContext, MaapiSchemas, CSNode, NavuNode, String, Object[])

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

Types: [NavuContext](NavuContext.md#s-NavuContext), [MaapiSchemas](../maapi/MaapiSchemas.md#s-MaapiSchemas), [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [NavuNode](NavuNode.md#s-NavuNode)

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas sch`
- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.navu.NavuNode parent`
- `String fmt`
- `Object[] arguments`


## Methods

<a id="s-children"></a>
### children()

```java
public java.util.Collection<com.tailf.navu.NavuNode> children() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

Returns all elements contained by the list node.

**Returns:** a collection of list elements

**Throws**

- `NavuException` - if the elements could not be retrieved

<a id="s-containsNode"></a>
### containsNode(ConfKey)

```java
public boolean containsNode(com.tailf.conf.ConfKey key) throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#s-ConfKey), [NavuException](NavuException.md#s-NavuException)

Returns true if and only if this `NavuList`
 contains a `NavuListEntry` where
 [`NavuListEntry`](NavuListEntry.md#s-NavuListEntry) `equals` the specified
 `key`.

**Parameters**

- `com.tailf.conf.ConfKey key` - whose presence in this `NavuList` is to be
 tested

**Returns:** `true` if this `NavuList` contains a entry
 with the specified `key`

<a id="s-containsNode-1"></a>
### containsNode(NavuContainer)

```java
public boolean containsNode(com.tailf.navu.NavuContainer node)
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer)

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

<a id="s-containsNode-2"></a>
### containsNode(String)

```java
public boolean containsNode(String keyStr) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Returns `true` if this `NavuList` contains a mapping
 for the specified string representation of a key.

**Parameters**

- `String keyStr` - a string representation of a key whose presence in this
        `NavuList` is to be tested

**Returns:** `true` if this `NavuList` maps a  keys to the
         specified node

<a id="s-containsNode-3"></a>
### containsNode(String[])

```java
public boolean containsNode(String[] keyArr) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

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

<a id="s-create"></a>
### create(ConfKey)

```java
public com.tailf.navu.NavuContainer create(
    com.tailf.conf.ConfKey key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [ConfKey](../conf/ConfKey.md#s-ConfKey), [NavuException](NavuException.md#s-NavuException)

Create and return a new list element in this `NavuList`.

 We have 3 different variants of `create`.


2. `create()` This method will fail with a
 [`NavuException`](NavuException.md#s-NavuException) with the error code set to
 [`ErrorCode`](../conf/ErrorCode.md#s-ErrorCode) if the key already exists.

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

<a id="s-create-1"></a>
### create(ConfObject)

```java
public com.tailf.navu.NavuContainer create(
    com.tailf.conf.ConfObject key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [ConfObject](../conf/ConfObject.md#s-ConfObject), [NavuException](NavuException.md#s-NavuException)

Convenience variant of [`ConfKey`](../conf/ConfKey.md#s-ConfKey) accepting a
 [`ConfObject`](../conf/ConfObject.md#s-ConfObject) as the (single element) key.

**Parameters**

- `com.tailf.conf.ConfObject key` - the key with which the newly created list entry is to be
            associated

**Returns:** the created list entry

<a id="s-create-2"></a>
### create(String)

```java
public com.tailf.navu.NavuContainer create(String keyStr) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [NavuException](NavuException.md#s-NavuException)

Convenience variant of [`ConfKey`](../conf/ConfKey.md#s-ConfKey) accepting a
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

<a id="s-create-3"></a>
### create(String[])

```java
public com.tailf.navu.NavuContainer create(String[] keyArr) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [NavuException](NavuException.md#s-NavuException)

Convenience variant of [`ConfKey`](../conf/ConfKey.md#s-ConfKey) accepting a
 string array as the key. Typically useful for multiple element keys.

**Parameters**

- `String[] keyArr` - the string array from which to create the key that the
               newly created list entry is to be associated with

**Returns:** the created list entry

<a id="s-delete"></a>
### delete(ConfKey)

```java
public void delete(com.tailf.conf.ConfKey key) throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#s-ConfKey), [NavuException](NavuException.md#s-NavuException)

Deletes an element from the list.

**Parameters**

- `com.tailf.conf.ConfKey key` - the key of the element to delete

<a id="s-delete-1"></a>
### delete(String)

```java
public void delete(String keyStr) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Deletes an element from the list.

 This is a convenience method for lists with single element
 key. If the string is enclosed in curly braces like {test},
 the curly braces are stripped. If this not desired another
 overloaded method should be used.

**Parameters**

- `String keyStr` - string representation of a single element key

<a id="s-delete-2"></a>
### delete(String[])

```java
public void delete(String[] keyArr) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Deletes an element from the list.

 This is a convenience method for lists with multiple element
 keys.

**Parameters**

- `String[] keyArr` - string array representation of a multiple element key

<a id="s-deleteAll"></a>
### deleteAll()

```java
public void deleteAll() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Deletes all element from the list.

<a id="s-elem"></a>
### elem(ConfKey)

```java
public com.tailf.navu.NavuListEntry elem(
    com.tailf.conf.ConfKey key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuListEntry](NavuListEntry.md#s-NavuListEntry), [ConfKey](../conf/ConfKey.md#s-ConfKey), [NavuException](NavuException.md#s-NavuException)

Returns a list element according to the given key.

**Parameters**

- `com.tailf.conf.ConfKey key` - a key identifying the list element

**Returns:** a matching element, or null if no matching element is found

<a id="s-elem-1"></a>
### elem(String)

```java
public com.tailf.navu.NavuContainer elem(String keyStr) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [NavuException](NavuException.md#s-NavuException)

Returns a list element according to the given key.

 This is a convenience method for lists with single element
 key. If the string is enclosed in curly braces like {test},
 the curly braces are stripped. If this not desired another
 overloaded method should be used.

**Parameters**

- `String keyStr` - string representation on single element key

**Returns:** a matching list element or null, if no matching element is found.

<a id="s-elem-2"></a>
### elem(String[])

```java
public com.tailf.navu.NavuContainer elem(String[] keyArr) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [NavuException](NavuException.md#s-NavuException)

Returns a list element according to the given array of keys.

 This is a convenience method for lists with multiple element
 keys.

**Parameters**

- `String[] keyArr` - string array representation of a multiple element key

**Returns:** a matching list element, or null if no matching element is found

<a id="s-elements"></a>
### elements()

```java
public java.util.Collection<com.tailf.navu.NavuContainer> elements() throws com.tailf.navu.NavuException
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [NavuException](NavuException.md#s-NavuException)

Returns a shallow copy of all elements contained by the list node.

 The elements contained by this list node are not cloned

**Returns:** a copy of the collection of list elements

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

<a id="s-entrySet"></a>
### entrySet()

```java
public java.util.Set<java.util.Map.Entry<com.tailf.conf.ConfKey,com.tailf.navu.NavuListEntry>> entrySet() throws com.tailf.navu.NavuException
    throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#s-ConfKey), [NavuListEntry](NavuListEntry.md#s-NavuListEntry), [NavuException](NavuException.md#s-NavuException)

Returns a set of entries with element key and element.

**Returns:** a set of entries

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Compares the specified object with this `NavuList`
 for equality.
 Returns `true` if the given object is also a
 `NavuList` and it has the same [`ConfPath`](../conf/ConfPath.md#s-ConfPath) as this
 `NavuList`.

**Parameters**

- `Object o` - the object to be compared for equality with this
          `NavuList`

**Returns:** `true` if the specified object is equal to this
         `NavuList`

<a id="s-exists"></a>
### exists()

```java
public boolean exists() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

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

<a id="s-getChangeFlag"></a>
### getChangeFlag()

```java
public com.tailf.conf.DiffIterateOperFlag getChangeFlag()
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag)

See: [`NavuNode.getChangeFlag()`](NavuNode.md#s-getChangeFlag)

<a id="s-getParent"></a>
### getParent()

```java
public com.tailf.navu.NavuNode getParent()
```

Types: [NavuNode](NavuNode.md#s-NavuNode)

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-insert"></a>
### insert(ConfKey, boolean)

```java
public com.tailf.navu.NavuContainer insert(
    com.tailf.conf.ConfKey key,
    boolean createBackpointer
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [ConfKey](../conf/ConfKey.md#s-ConfKey), [NavuException](NavuException.md#s-NavuException)

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

<a id="s-isEmpty"></a>
### isEmpty()

```java
public boolean isEmpty() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Checks if there are any elements in the list.

**Returns:** true if there are no list entries, false otherwise,

<a id="s-isNodeNavuLocal"></a>
### isNodeNavuLocal()

```java
public boolean isNodeNavuLocal()
```

<a id="s-iterator"></a>
### iterator()

```java
public java.util.Iterator<com.tailf.navu.NavuListEntry> iterator()
```

Types: [NavuListEntry](NavuListEntry.md#s-NavuListEntry)

Retrieve a iterator over the elements in this `NavuList`
 (in proper sequence).

<a id="s-keySet"></a>
### keySet()

```java
public java.util.Set<com.tailf.conf.ConfKey> keySet() throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#s-ConfKey), [NavuException](NavuException.md#s-NavuException)

Returns a Set containing all of the keys for this list.

**Returns:** the full set of keys for this list

<a id="s-move"></a>
### move(ConfKey, WhereTo, ConfKey)

```java
public void move(
    com.tailf.conf.ConfKey key,
    com.tailf.navu.NavuList.WhereTo whereTo,
    com.tailf.conf.ConfKey to
)
    throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#s-ConfKey), [WhereTo](NavuList/WhereTo.md#s-WhereTo), [NavuException](NavuException.md#s-NavuException)

Move a list element to a new position in the list.

 The destination
 can be at the beginning, the end or in a relation to another element.
 See: `#move(String keyStr, WhereTo whereTo, String toStr)`

**Parameters**

- `com.tailf.conf.ConfKey key` - Move key according to whereTo
- `com.tailf.navu.NavuList.WhereTo whereTo` - How the move should be performed. Move key
                WhereTo.FIRST or WhereTo.LAST or move key
                WhereTo.BEFORE or WhereTo.AFTER the element to.
- `com.tailf.conf.ConfKey to` - If the value of whereTo is WhereTo.FIRST or WhereTo.LAST
                this argument ignored

**Throws**

- `NavuException`

<a id="s-move-1"></a>
### move(String, WhereTo, String)

```java
public void move(
    String keyStr,
    com.tailf.navu.NavuList.WhereTo whereTo,
    String toStr
)
    throws com.tailf.navu.NavuException
```

Types: [WhereTo](NavuList/WhereTo.md#s-WhereTo), [NavuException](NavuException.md#s-NavuException)

Move a list element to a new position in the list.

 The destination
 can be at the beginning, the end or in a relation to another element.
 Elements are referenced by their string representation.
 See: [`ConfKey`](../conf/ConfKey.md#s-ConfKey)
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

<a id="s-refresh"></a>
### refresh()

```java
protected void refresh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Reads list entries through the [`NavuCursor`](NavuCursor.md#s-NavuCursor) which handles
 key retrieval through Maapi and CDB.

<a id="s-reset"></a>
### reset()

```java
public void reset()
```

When navigating through NAVU to a certain list, the list values are
 cached as they are read.

 This method clears this cache and and indicates to Navu that the list
 elements should be re-read as they are retrieved.

<a id="s-safeCreate"></a>
### safeCreate(ConfKey)

```java
public com.tailf.navu.NavuContainer safeCreate(
    com.tailf.conf.ConfKey key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [ConfKey](../conf/ConfKey.md#s-ConfKey), [NavuException](NavuException.md#s-NavuException)

Variant of [`ConfKey`](../conf/ConfKey.md#s-ConfKey) that succeeds even if the
 key already exists.

**Parameters**

- `com.tailf.conf.ConfKey key` - the key with which the newly created list entry is to be
            associated

**Returns:** the created list entry or, if it already exists, the list entry
         corresponding to the given key, `key`

<a id="s-safeCreate-1"></a>
### safeCreate(ConfObject)

```java
public com.tailf.navu.NavuContainer safeCreate(
    com.tailf.conf.ConfObject key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [ConfObject](../conf/ConfObject.md#s-ConfObject), [NavuException](NavuException.md#s-NavuException)

Variant of [`ConfObject`](../conf/ConfObject.md#s-ConfObject) that succeeds even if
 the key already exists.

**Parameters**

- `com.tailf.conf.ConfObject key` - the key with which the newly created list entry is to be
            associated

**Returns:** the created list entry or, if it already exists, the list entry
         corresponding to the given key, `key`

<a id="s-safeCreate-2"></a>
### safeCreate(String)

```java
public com.tailf.navu.NavuContainer safeCreate(String keyStr) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [NavuException](NavuException.md#s-NavuException)

Variant of `#create(String)` that succeeds even if the
 key already exists.

**Parameters**

- `String keyStr` - the string representation of the key value with which the
               newly created list entry is to be associated

**Returns:** the created list entry or, if it already exists, the list entry
         corresponding to the given key, `key`

<a id="s-safeCreate-3"></a>
### safeCreate(String[])

```java
public com.tailf.navu.NavuContainer safeCreate(String[] keyArr) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [NavuException](NavuException.md#s-NavuException)

Variant of `#create(String[])` that succeeds even if the
 key already exists.

**Parameters**

- `String[] keyArr` - the string array from which to create the key that the
               newly created list entry is to be associated with

**Returns:** the created list entry or, if it already exists, the list entry
         corresponding to the given key, `keyArr`

<a id="s-select"></a>
### select(ConfObject[])

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [ConfObject](../conf/ConfObject.md#s-ConfObject), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`

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

<a id="s-setChange"></a>
### setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext)

```java
public com.tailf.navu.NavuNode setChange(
    java.util.List<com.tailf.conf.ConfObject> path,
    com.tailf.conf.DiffIterateOperFlag op,
    com.tailf.conf.ConfValue oldValue,
    com.tailf.navu.NavuContext delContext
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [ConfObject](../conf/ConfObject.md#s-ConfObject), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag), [ConfValue](../conf/ConfValue.md#s-ConfValue), [NavuContext](NavuContext.md#s-NavuContext), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `java.util.List<com.tailf.conf.ConfObject> path`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfValue oldValue`
- `com.tailf.navu.NavuContext delContext`

<a id="s-setMaxListSize"></a>
### setMaxListSize(int)

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

<a id="s-sharedCreate"></a>
### sharedCreate(ConfKey)

```java
public com.tailf.navu.NavuContainer sharedCreate(
    com.tailf.conf.ConfKey key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [ConfKey](../conf/ConfKey.md#s-ConfKey), [NavuException](NavuException.md#s-NavuException)

Variant of [`ConfKey`](../conf/ConfKey.md#s-ConfKey) that succeeds even if the
 key already exists, and also maintains a reference counter
 on the object.

**Parameters**

- `com.tailf.conf.ConfKey key` - the key with which the newly created list entry is to be
            associated

**Returns:** the created list entry or, if it already exists, the list entry
         corresponding to the given key, `key`

<a id="s-sharedCreate-1"></a>
### sharedCreate(ConfObject)

```java
public com.tailf.navu.NavuContainer sharedCreate(
    com.tailf.conf.ConfObject key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [ConfObject](../conf/ConfObject.md#s-ConfObject), [NavuException](NavuException.md#s-NavuException)

Variant of [`ConfObject`](../conf/ConfObject.md#s-ConfObject) that succeeds even if the
 key already exists, and also maintains a reference counter
 on the object.

**Parameters**

- `com.tailf.conf.ConfObject key` - the key with which the newly created list entry is to be
            associated

**Returns:** the created list entry or, if it already exists, the list entry
         corresponding to the given key, `key`

<a id="s-sharedCreate-2"></a>
### sharedCreate(String)

```java
public com.tailf.navu.NavuContainer sharedCreate(String keyStr) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [NavuException](NavuException.md#s-NavuException)

Variant of `#create(String)` that succeeds even if the
 key already exists, and also maintains a reference counter
 on the object.

**Parameters**

- `String keyStr` - the string representation of the key value with which
               the newly created list entry is to be associated

**Returns:** the created list entry or, if it already exists, the list entry
         corresponding to the given key, `key`

<a id="s-sharedCreate-3"></a>
### sharedCreate(String[])

```java
public com.tailf.navu.NavuContainer sharedCreate(
    String[] keyArr
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [NavuException](NavuException.md#s-NavuException)

Variant of `#create(String[])` that succeeds even if the
 key already exists, and also maintains a reference counter
 on the object.

**Parameters**

- `String[] keyArr` - the string array from which to create the key that the
               newly created list entry is to be associated with

**Returns:** the created list entry or, if it already exists, the list entry
         corresponding to the given key, `keyArr`

<a id="s-size"></a>
### size()

```java
public int size() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Returns the number of list elements contained by the list node.

**Returns:** the number of elements in this list

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

<a id="s-valueUpdateInd"></a>
### valueUpdateInd(NavuNode)

```java
public void valueUpdateInd(com.tailf.navu.NavuNode child) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode child`


## Nested Types

- [WhereTo](NavuList/WhereTo.md)
