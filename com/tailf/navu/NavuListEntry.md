# NavuListEntry <a href="#cls-NavuListEntry" id="cls-NavuListEntry"></a>

```java
public class com.tailf.navu.NavuListEntry
    extends com.tailf.navu.NavuContainer
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer)

A `NavuList` holds this representation of a entry as its
 children or entry set.

## Members

**Constructors**:

- [NavuListEntry(NavuContext, CSNode, NavuNode, ConfKey, String, Object[])](#m-NavuListEntry-6558a2da572b)

**Fields**:

- [arguments](NavuNode.md#m-arguments) from NavuNode
- [change](NavuNode.md#m-change) from NavuNode
- [changeMap](NavuContainer.md#m-changeMap) from NavuContainer
- [context](NavuNode.md#m-context) from NavuNode
- [criteria](NavuContainer.md#m-criteria) from NavuContainer
- [duplicateSet](NavuContainer.md#m-duplicateSet) from NavuContainer
- [fmt](NavuNode.md#m-fmt) from NavuNode
- [isCreated](NavuContainer.md#m-isCreated) from NavuContainer
- [isRefreshed](NavuContainer.md#m-isRefreshed) from NavuContainer
- [isRootModulesPopulated](NavuContainer.md#m-isRootModulesPopulated) from NavuContainer
- [key](NavuContainer.md#m-key) from NavuContainer
- [map](NavuContainer.md#m-map) from NavuContainer
- [mountId](NavuNode.md#m-mountId) from NavuNode
- [myConfPath](NavuNode.md#m-myConfPath) from NavuNode
- [name2Choice](NavuContainer.md#m-name2Choice) from NavuContainer
- [node](NavuNode.md#m-node) from NavuNode
- [node2Choice](NavuContainer.md#m-node2Choice) from NavuContainer
- [parent](NavuNode.md#m-parent) from NavuNode
- [rootHash](NavuContainer.md#m-rootHash) from NavuContainer
- [sch](NavuContainer.md#m-sch) from NavuContainer

**Methods**:

- [action(Integer)](NavuContainer.md#m-action-31e90b24df5f) from NavuContainer
- [action(String)](NavuContainer.md#m-action-ac3b339033ab) from NavuContainer
- [addModule(NavuContainer)](NavuContainer.md#m-addModule-379e17a46072) from NavuContainer
- [children()](NavuContainer.md#m-children-7d31300d62c3) from NavuContainer
- [choice(String)](NavuContainer.md#m-choice-45a67115903b) from NavuContainer
- [container(ConfNamespace, String)](NavuContainer.md#m-container-31c604ba30e3) from NavuContainer
- [container(Integer)](NavuContainer.md#m-container-abb10ecdc3f6) from NavuContainer
- [container(String)](NavuContainer.md#m-container-76f5d191b16d) from NavuContainer
- [containsNode(NavuNode)](NavuContainer.md#m-containsNode-f554fdc5bf96) from NavuContainer
- [containsNode(String)](NavuContainer.md#m-containsNode-445990dba920) from NavuContainer
- [context()](NavuNode.md#m-context-0990f1a0bb68) from NavuNode
- [create()](NavuContainer.md#m-create-06e0ee4a42c2) from NavuContainer
- [delete()](#m-delete-a9e76d49da61)
- [encodeValues()](NavuContainer.md#m-encodeValues-7bd911383b1a) from NavuContainer
- [encodeXML()](NavuContainer.md#m-encodeXML-bdbcd52c2505) from NavuContainer
- [entrySet()](NavuContainer.md#m-entrySet-20b678143b7e) from NavuContainer
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [exists()](NavuContainer.md#m-exists-56968a4c7bda) from NavuContainer
- [filterChildren(CSNode)](NavuNode.md#m-filterChildren-e72b7b1ab25d) from NavuNode
- [findChanges(NavuContext, Integer[])](NavuContainer.md#m-findChanges-e1e823411f98) from NavuContainer
- [get(String)](NavuContainer.md#m-get-e86cd4d90bf3) from NavuContainer
- [getChangeFlag()](NavuNode.md#m-getChangeFlag-33cadf5a32ba) from NavuNode
- [getChanges(NavuContext)](NavuNode.md#m-getChanges-c106383f174d) from NavuNode
- [getChanges(NavuContext, boolean)](NavuNode.md#m-getChanges-bcf5b6dbccf2) from NavuNode
- [getChanges(NavuContext, boolean, DiffIterateOperFlag[])](NavuNode.md#m-getChanges-9f13a683b086) from NavuNode
- [getConfPath()](NavuNode.md#m-getConfPath-c7ca3cb63c17) from NavuNode
- [getInfo()](NavuNode.md#m-getInfo-259a72b5d74c) from NavuNode
- [getKey()](#m-getKey-9a8856159458)
- [getKeyPath()](NavuNode.md#m-getKeyPath-4c9200912948) from NavuNode
- [getName()](NavuNode.md#m-getName-2634b18b4a25) from NavuNode
- [getNavuNode(ConfPath)](NavuNode.md#m-getNavuNode-d19ad1dd90fc) from NavuNode
- [getParent()](NavuNode.md#m-getParent-45c1b196ed70) from NavuNode
- [getRootNS()](NavuContainer.md#m-getRootNS-3f1d054cecd6) from NavuContainer
- [getSchema(int)](NavuContainer.md#m-getSchema-d43ad42eba79) from NavuContainer
- [getSelectCaseAsNavuChoice(String)](NavuContainer.md#m-getSelectCaseAsNavuChoice-f6626477e806) from NavuContainer
- [getSelectCaseAsNavuNode(String)](NavuContainer.md#m-getSelectCaseAsNavuNode-46fa4e27d61f) from NavuContainer
- [getSelectedCase(String)](NavuContainer.md#m-getSelectedCase-3b005e9181ed) from NavuContainer
- [getUserSession()](NavuContainer.md#m-getUserSession-7a9eeeb92f85) from NavuContainer
- [getValues(ConfXMLParam[])](NavuNode.md#m-getValues-1eb02439a757) from NavuNode
- [getValues(String)](NavuNode.md#m-getValues-c03de090764d) from NavuNode
- [h2str(Integer)](NavuContainer.md#m-h2str-3096e9ba352b) from NavuContainer
- [handleDuplicateChildren(List<CSNode>)](NavuContainer.md#m-handleDuplicateChildren-e69c1564b6e7) from NavuContainer
- [hashCode()](#m-hashCode-ef797a217903)
- [isCreated()](NavuContainer.md#m-isCreated-bc9b3cb40910) from NavuContainer
- [isEmpty()](NavuContainer.md#m-isEmpty-4dde48126244) from NavuContainer
- [isListInstance()](NavuContainer.md#m-isListInstance-16ea9625f0d2) from NavuContainer
- [isNodeNavuLocal()](NavuContainer.md#m-isNodeNavuLocal-3af8ba5398d1) from NavuContainer
- [iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object)](NavuContainer.md#m-iterate-d80a566b7e0a) from NavuContainer
- [keySet()](NavuContainer.md#m-keySet-66de8917ecb8) from NavuContainer
- [leaf(ConfNamespace, String)](NavuContainer.md#m-leaf-da3758f37f21) from NavuContainer
- [leaf(Integer)](NavuContainer.md#m-leaf-47fda8402c20) from NavuContainer
- [leaf(String)](NavuContainer.md#m-leaf-ac189787d67d) from NavuContainer
- [leafList(ConfNamespace, String)](NavuContainer.md#m-leafList-a2d5ad836b3e) from NavuContainer
- [leafList(Integer)](NavuContainer.md#m-leafList-552c8007ecb4) from NavuContainer
- [leafList(String)](NavuContainer.md#m-leafList-5811cbb534ec) from NavuContainer
- [list(ConfNamespace, String)](NavuContainer.md#m-list-6b15381fd14a) from NavuContainer
- [list(Integer)](NavuContainer.md#m-list-7dc96bdbb69a) from NavuContainer
- [list(String)](NavuContainer.md#m-list-2c1a74a3cf07) from NavuContainer
- [namespace(String)](NavuContainer.md#m-namespace-e29ad62ed095) from NavuContainer
- [populateChildren(List<CSNode>)](NavuContainer.md#m-populateChildren-40519dc6bd8c) from NavuContainer
- [populateChoices()](NavuContainer.md#m-populateChoices-de48df56d517) from NavuContainer
- [prefix(String)](NavuContainer.md#m-prefix-fdd71b8275bb) from NavuContainer
- [prepareXMLCall(String)](NavuNode.md#m-prepareXMLCall-c22e250f2cac) from NavuNode
- [refresh()](NavuContainer.md#m-refresh-3852c3f76c8e) from NavuContainer
- [reset()](NavuContainer.md#m-reset-6927918ac70a) from NavuContainer
- [safeCreate()](NavuContainer.md#m-safeCreate-8125e14d387f) from NavuContainer
- [select(ConfObject[])](NavuContainer.md#m-select-336dd76cd112) from NavuContainer
- [select(List<String>)](NavuContainer.md#m-select-e81f36150174) from NavuContainer
- [select(String)](NavuContainer.md#m-select-5031325154b9) from NavuContainer
- [setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext)](NavuContainer.md#m-setChange-0bbeb54ebc15) from NavuContainer
- [setKey(ConfKey)](NavuContainer.md#m-setKey-b8489388971b) from NavuContainer
- [setOperFlag(DiffIterateOperFlag)](NavuContainer.md#m-setOperFlag-b50e9a2a8d38) from NavuContainer
- [setValues(ConfXMLParam[])](NavuNode.md#m-setValues-50d8edffa795) from NavuNode
- [setValues(String)](NavuNode.md#m-setValues-3ec9581ce266) from NavuNode
- [sharedCreate()](NavuContainer.md#m-sharedCreate-7aef2e24f04b) from NavuContainer
- [sharedSetValues(ConfXMLParam[])](NavuNode.md#m-sharedSetValues-705549be9df0) from NavuNode
- [sharedSetValues(String)](NavuNode.md#m-sharedSetValues-ad93c38b671f) from NavuNode
- [size()](NavuContainer.md#m-size-c6d8505255fd) from NavuContainer
- [stopCdbSession()](NavuNode.md#m-stopCdbSession-17418252a986) from NavuNode
- [toString()](NavuContainer.md#m-toString-e9d48c5503ef) from NavuContainer
- [valueUpdateInd(NavuNode)](NavuContainer.md#m-valueUpdateInd-e7cd65f79d78) from NavuContainer
- [xPathSelect(String)](NavuNode.md#m-xPathSelect-0fb26b9f41e0) from NavuNode
- [xPathSelectIterate(String, NavuNodeSetIterate)](NavuNode.md#m-xPathSelectIterate-12547f34f47c) from NavuNode

## Constructors

### NavuListEntry(NavuContext, CSNode, NavuNode, ConfKey, String, Object[]) <a href="#m-NavuListEntry-6558a2da572b" id="m-NavuListEntry-6558a2da572b"></a>

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

Types: [NavuContext](NavuContext.md#cls-NavuContext), [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [NavuNode](NavuNode.md#cls-NavuNode), [ConfKey](../conf/ConfKey.md#cls-ConfKey)

Constructor for child container.

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas.CSNode listCsNode`
- `com.tailf.navu.NavuNode parent`
- `com.tailf.conf.ConfKey key`
- `String fmt`
- `Object[] arguments`


## Methods

### delete() <a href="#m-delete-a9e76d49da61" id="m-delete-a9e76d49da61"></a>

```java
public com.tailf.navu.NavuContainer delete() throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [NavuException](NavuException.md#cls-NavuException)

Deletes this entry from the NavuList it contains
 returns this NavuListEntry as NavuContainer.

 Sets the [`NavuNode#getChangeFlag()`](NavuNode.md#m-getChangeFlag-33cadf5a32ba) flag to
 `MOP_DELETED`

**Returns:** The NavuContainer removed by this operation
 `getChange` on the return `NavuContainer`
 returns `MOP_DELETED`

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Compares the specified object with this `NavuListEntry`
 for equality.
 Returns `true` if the given object is also a
 `NavuListEntry` and it has the same
 [ConfPath](../conf/ConfPath.md#cls-ConfPath) as this
 `NavuListEntry`.

**Parameters**

- `Object o` - object to be compared for equality with this
          `NavuListEntry`

**Returns:** `true` if the specified object is equal to this
         `NavuListEntry`

### getKey() <a href="#m-getKey-9a8856159458" id="m-getKey-9a8856159458"></a>

```java
public com.tailf.conf.ConfKey getKey()
```

Types: [ConfKey](../conf/ConfKey.md#cls-ConfKey)

Return the associate key that this NavuList
  is mapped to.

**Returns:** the corresponding key

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```
