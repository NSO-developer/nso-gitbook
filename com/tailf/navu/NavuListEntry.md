<a id="s-NavuListEntry"></a>
# NavuListEntry

```java
public class com.tailf.navu.NavuListEntry
    extends com.tailf.navu.NavuContainer
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer)

A `NavuList` holds this representation of a entry as its
 children or entry set.

## Members

**Constructors**:

- [NavuListEntry(NavuContext, CSNode, NavuNode, ConfKey, String, Object[])](#s-NavuListEntry-1)

**Fields**:

- [arguments](NavuNode.md#s-arguments) from NavuNode
- [change](NavuNode.md#s-change) from NavuNode
- [changeMap](NavuContainer.md#s-changeMap) from NavuContainer
- [context](NavuNode.md#s-context) from NavuNode
- [criteria](NavuContainer.md#s-criteria) from NavuContainer
- [duplicateSet](NavuContainer.md#s-duplicateSet) from NavuContainer
- [fmt](NavuNode.md#s-fmt) from NavuNode
- [isCreated](NavuContainer.md#s-isCreated) from NavuContainer
- [isRefreshed](NavuContainer.md#s-isRefreshed) from NavuContainer
- [isRootModulesPopulated](NavuContainer.md#s-isRootModulesPopulated) from NavuContainer
- [key](NavuContainer.md#s-key) from NavuContainer
- [map](NavuContainer.md#s-map) from NavuContainer
- [mountId](NavuNode.md#s-mountId) from NavuNode
- [myConfPath](NavuNode.md#s-myConfPath) from NavuNode
- [name2Choice](NavuContainer.md#s-name2Choice) from NavuContainer
- [node](NavuNode.md#s-node) from NavuNode
- [node2Choice](NavuContainer.md#s-node2Choice) from NavuContainer
- [parent](NavuNode.md#s-parent) from NavuNode
- [rootHash](NavuContainer.md#s-rootHash) from NavuContainer
- [sch](NavuContainer.md#s-sch) from NavuContainer

**Methods**:

- [action(Integer)](NavuContainer.md#s-action) from NavuContainer
- [action(String)](NavuContainer.md#s-action-1) from NavuContainer
- [addModule(NavuContainer)](NavuContainer.md#s-addModule) from NavuContainer
- [children()](NavuContainer.md#s-children) from NavuContainer
- [choice(String)](NavuContainer.md#s-choice) from NavuContainer
- [container(ConfNamespace, String)](NavuContainer.md#s-container) from NavuContainer
- [container(Integer)](NavuContainer.md#s-container-1) from NavuContainer
- [container(String)](NavuContainer.md#s-container-2) from NavuContainer
- [containsNode(NavuNode)](NavuContainer.md#s-containsNode) from NavuContainer
- [containsNode(String)](NavuContainer.md#s-containsNode-1) from NavuContainer
- [context()](NavuNode.md#s-context-1) from NavuNode
- [create()](NavuContainer.md#s-create) from NavuContainer
- [delete()](#s-delete)
- [encodeValues()](NavuContainer.md#s-encodeValues) from NavuContainer
- [encodeXML()](NavuContainer.md#s-encodeXML) from NavuContainer
- [entrySet()](NavuContainer.md#s-entrySet) from NavuContainer
- [equals(Object)](#s-equals)
- [exists()](NavuContainer.md#s-exists) from NavuContainer
- [filterChildren(CSNode)](NavuNode.md#s-filterChildren) from NavuNode
- [findChanges(NavuContext, Integer[])](NavuContainer.md#s-findChanges) from NavuContainer
- [get(String)](NavuContainer.md#s-get) from NavuContainer
- [getChangeFlag()](NavuNode.md#s-getChangeFlag) from NavuNode
- [getChanges(NavuContext)](NavuNode.md#s-getChanges) from NavuNode
- [getChanges(NavuContext, boolean)](NavuNode.md#s-getChanges-1) from NavuNode
- [getChanges(NavuContext, boolean, DiffIterateOperFlag[])](NavuNode.md#s-getChanges-2) from NavuNode
- [getConfPath()](NavuNode.md#s-getConfPath) from NavuNode
- [getInfo()](NavuNode.md#s-getInfo) from NavuNode
- [getKey()](#s-getKey)
- [getKeyPath()](NavuNode.md#s-getKeyPath) from NavuNode
- [getName()](NavuNode.md#s-getName) from NavuNode
- [getNavuNode(ConfPath)](NavuNode.md#s-getNavuNode) from NavuNode
- [getParent()](NavuNode.md#s-getParent) from NavuNode
- [getRootNS()](NavuContainer.md#s-getRootNS) from NavuContainer
- [getSchema(int)](NavuContainer.md#s-getSchema) from NavuContainer
- [getSelectCaseAsNavuChoice(String)](NavuContainer.md#s-getSelectCaseAsNavuChoice) from NavuContainer
- [getSelectCaseAsNavuNode(String)](NavuContainer.md#s-getSelectCaseAsNavuNode) from NavuContainer
- [getSelectedCase(String)](NavuContainer.md#s-getSelectedCase) from NavuContainer
- [getUserSession()](NavuContainer.md#s-getUserSession) from NavuContainer
- [getValues(ConfXMLParam[])](NavuNode.md#s-getValues) from NavuNode
- [getValues(String)](NavuNode.md#s-getValues-1) from NavuNode
- [h2str(Integer)](NavuContainer.md#s-h2str) from NavuContainer
- [handleDuplicateChildren(List<CSNode>)](NavuContainer.md#s-handleDuplicateChildren) from NavuContainer
- [hashCode()](#s-hashCode)
- [isCreated()](NavuContainer.md#s-isCreated-1) from NavuContainer
- [isEmpty()](NavuContainer.md#s-isEmpty) from NavuContainer
- [isListInstance()](NavuContainer.md#s-isListInstance) from NavuContainer
- [isNodeNavuLocal()](NavuContainer.md#s-isNodeNavuLocal) from NavuContainer
- [iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object)](NavuContainer.md#s-iterate) from NavuContainer
- [keySet()](NavuContainer.md#s-keySet) from NavuContainer
- [leaf(ConfNamespace, String)](NavuContainer.md#s-leaf) from NavuContainer
- [leaf(Integer)](NavuContainer.md#s-leaf-1) from NavuContainer
- [leaf(String)](NavuContainer.md#s-leaf-2) from NavuContainer
- [leafList(ConfNamespace, String)](NavuContainer.md#s-leafList) from NavuContainer
- [leafList(Integer)](NavuContainer.md#s-leafList-1) from NavuContainer
- [leafList(String)](NavuContainer.md#s-leafList-2) from NavuContainer
- [list(ConfNamespace, String)](NavuContainer.md#s-list) from NavuContainer
- [list(Integer)](NavuContainer.md#s-list-1) from NavuContainer
- [list(String)](NavuContainer.md#s-list-2) from NavuContainer
- [namespace(String)](NavuContainer.md#s-namespace) from NavuContainer
- [populateChildren(List<CSNode>)](NavuContainer.md#s-populateChildren) from NavuContainer
- [populateChoices()](NavuContainer.md#s-populateChoices) from NavuContainer
- [prefix(String)](NavuContainer.md#s-prefix) from NavuContainer
- [prepareXMLCall(String)](NavuNode.md#s-prepareXMLCall) from NavuNode
- [refresh()](NavuContainer.md#s-refresh) from NavuContainer
- [reset()](NavuContainer.md#s-reset) from NavuContainer
- [safeCreate()](NavuContainer.md#s-safeCreate) from NavuContainer
- [select(ConfObject[])](NavuContainer.md#s-select) from NavuContainer
- [select(List<String>)](NavuContainer.md#s-select-1) from NavuContainer
- [select(String)](NavuContainer.md#s-select-2) from NavuContainer
- [setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext)](NavuContainer.md#s-setChange) from NavuContainer
- [setKey(ConfKey)](NavuContainer.md#s-setKey) from NavuContainer
- [setOperFlag(DiffIterateOperFlag)](NavuContainer.md#s-setOperFlag) from NavuContainer
- [setValues(ConfXMLParam[])](NavuNode.md#s-setValues) from NavuNode
- [setValues(String)](NavuNode.md#s-setValues-1) from NavuNode
- [sharedCreate()](NavuContainer.md#s-sharedCreate) from NavuContainer
- [sharedSetValues(ConfXMLParam[])](NavuNode.md#s-sharedSetValues) from NavuNode
- [sharedSetValues(String)](NavuNode.md#s-sharedSetValues-1) from NavuNode
- [size()](NavuContainer.md#s-size) from NavuContainer
- [stopCdbSession()](NavuNode.md#s-stopCdbSession) from NavuNode
- [toString()](NavuContainer.md#s-toString) from NavuContainer
- [valueUpdateInd(NavuNode)](NavuContainer.md#s-valueUpdateInd) from NavuContainer
- [xPathSelect(String)](NavuNode.md#s-xPathSelect) from NavuNode
- [xPathSelectIterate(String, NavuNodeSetIterate)](NavuNode.md#s-xPathSelectIterate) from NavuNode

## Constructors

<a id="s-NavuListEntry-1"></a>
### NavuListEntry(NavuContext, CSNode, NavuNode, ConfKey, String, Object[])

**Package-private**

```java
NavuListEntry(
    com.tailf.navu.NavuContext context,
    com.tailf.maapi.MaapiSchemas.CSNode listCsNode,
    com.tailf.navu.NavuNode parent,
    com.tailf.conf.ConfKey key,
    String fmt,
    Object[] arguments
)
```

Types: [NavuContext](NavuContext.md#s-NavuContext), [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [NavuNode](NavuNode.md#s-NavuNode), [ConfKey](../conf/ConfKey.md#s-ConfKey)

Constructor for child container.

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas.CSNode listCsNode`
- `com.tailf.navu.NavuNode parent`
- `com.tailf.conf.ConfKey key`
- `String fmt`
- `Object[] arguments`


## Methods

<a id="s-delete"></a>
### delete()

```java
public com.tailf.navu.NavuContainer delete() throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [NavuException](NavuException.md#s-NavuException)

Deletes this entry from the NavuList it contains
 returns this NavuListEntry as NavuContainer.

 Sets the [`NavuNode`](NavuNode.md#s-NavuNode) flag to
 `MOP_DELETED`

**Returns:** The NavuContainer removed by this operation
 `getChange` on the return `NavuContainer`
 returns `MOP_DELETED`

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Compares the specified object with this `NavuListEntry`
 for equality.
 Returns `true` if the given object is also a
 `NavuListEntry` and it has the same
 [ConfPath](../conf/ConfPath.md#s-ConfPath) as this
 `NavuListEntry`.

**Parameters**

- `Object o` - object to be compared for equality with this
          `NavuListEntry`

**Returns:** `true` if the specified object is equal to this
         `NavuListEntry`

<a id="s-getKey"></a>
### getKey()

```java
public com.tailf.conf.ConfKey getKey()
```

Types: [ConfKey](../conf/ConfKey.md#s-ConfKey)

Return the associate key that this NavuList
  is mapped to.

**Returns:** the corresponding key

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```
