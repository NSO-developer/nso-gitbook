# NavuListEntry <a href="#navulistentry-6c6e1431f291" id="navulistentry-6c6e1431f291"></a>

```java
public class com.tailf.navu.NavuListEntry
    extends com.tailf.navu.NavuContainer
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f)

A `NavuList` holds this representation of a entry as its
 children or entry set.

## Members

**Constructors**:

- [NavuListEntry(NavuContext, CSNode, NavuNode, ConfKey, String, Object[])](#navulistentry-6558a2da572b)

**Fields**:

- [arguments](NavuNode.md#arguments-28ffa3c54d2c) from NavuNode
- [change](NavuNode.md#change-470927160c2a) from NavuNode
- [changeMap](NavuContainer.md#changemap-b5a294491f5a) from NavuContainer
- [context](NavuNode.md#context-b9bed500f8c9) from NavuNode
- [criteria](NavuContainer.md#criteria-2aeaea96dbdb) from NavuContainer
- [duplicateSet](NavuContainer.md#duplicateset-c134c96c9fc5) from NavuContainer
- [fmt](NavuNode.md#fmt-94d3250bd2b9) from NavuNode
- [isCreated](NavuContainer.md#iscreated-783ec1e767bb) from NavuContainer
- [isRefreshed](NavuContainer.md#isrefreshed-17594a091fc4) from NavuContainer
- [isRootModulesPopulated](NavuContainer.md#isrootmodulespopulated-1578b44f189f) from NavuContainer
- [key](NavuContainer.md#key-41a461f20bc2) from NavuContainer
- [map](NavuContainer.md#map-7fec112b12da) from NavuContainer
- [mountId](NavuNode.md#mountid-a6b63dedba52) from NavuNode
- [myConfPath](NavuNode.md#myconfpath-cec7a88dfaf3) from NavuNode
- [name2Choice](NavuContainer.md#name2choice-b90229c2e807) from NavuContainer
- [node](NavuNode.md#node-ff68e6a3ebc6) from NavuNode
- [node2Choice](NavuContainer.md#node2choice-8cbcd28d51b5) from NavuContainer
- [parent](NavuNode.md#parent-26ad1434956a) from NavuNode
- [rootHash](NavuContainer.md#roothash-a5a53d6abd62) from NavuContainer
- [sch](NavuContainer.md#sch-fd99b9646745) from NavuContainer

**Methods**:

- [action(Integer)](NavuContainer.md#action-31e90b24df5f) from NavuContainer
- [action(String)](NavuContainer.md#action-ac3b339033ab) from NavuContainer
- [addModule(NavuContainer)](NavuContainer.md#addmodule-379e17a46072) from NavuContainer
- [children()](NavuContainer.md#children-7d31300d62c3) from NavuContainer
- [choice(String)](NavuContainer.md#choice-45a67115903b) from NavuContainer
- [container(ConfNamespace, String)](NavuContainer.md#container-31c604ba30e3) from NavuContainer
- [container(Integer)](NavuContainer.md#container-abb10ecdc3f6) from NavuContainer
- [container(String)](NavuContainer.md#container-76f5d191b16d) from NavuContainer
- [containsNode(NavuNode)](NavuContainer.md#containsnode-f554fdc5bf96) from NavuContainer
- [containsNode(String)](NavuContainer.md#containsnode-445990dba920) from NavuContainer
- [context()](NavuNode.md#context-0990f1a0bb68) from NavuNode
- [create()](NavuContainer.md#create-06e0ee4a42c2) from NavuContainer
- [delete()](#delete-a9e76d49da61)
- [encodeValues()](NavuContainer.md#encodevalues-7bd911383b1a) from NavuContainer
- [encodeXML()](NavuContainer.md#encodexml-bdbcd52c2505) from NavuContainer
- [entrySet()](NavuContainer.md#entryset-20b678143b7e) from NavuContainer
- [equals(Object)](#equals-fcd6492e0d6c)
- [exists()](NavuContainer.md#exists-56968a4c7bda) from NavuContainer
- [filterChildren(CSNode)](NavuNode.md#filterchildren-e72b7b1ab25d) from NavuNode
- [findChanges(NavuContext, Integer[])](NavuContainer.md#findchanges-e1e823411f98) from NavuContainer
- [get(String)](NavuContainer.md#get-e86cd4d90bf3) from NavuContainer
- [getChangeFlag()](NavuNode.md#getchangeflag-33cadf5a32ba) from NavuNode
- [getChanges(NavuContext)](NavuNode.md#getchanges-c106383f174d) from NavuNode
- [getChanges(NavuContext, boolean)](NavuNode.md#getchanges-bcf5b6dbccf2) from NavuNode
- [getChanges(NavuContext, boolean, DiffIterateOperFlag[])](NavuNode.md#getchanges-9f13a683b086) from NavuNode
- [getConfPath()](NavuNode.md#getconfpath-c7ca3cb63c17) from NavuNode
- [getInfo()](NavuNode.md#getinfo-259a72b5d74c) from NavuNode
- [getKey()](#getkey-9a8856159458)
- [getKeyPath()](NavuNode.md#getkeypath-4c9200912948) from NavuNode
- [getName()](NavuNode.md#getname-2634b18b4a25) from NavuNode
- [getNavuNode(ConfPath)](NavuNode.md#getnavunode-d19ad1dd90fc) from NavuNode
- [getParent()](NavuNode.md#getparent-45c1b196ed70) from NavuNode
- [getRootNS()](NavuContainer.md#getrootns-3f1d054cecd6) from NavuContainer
- [getSchema(int)](NavuContainer.md#getschema-d43ad42eba79) from NavuContainer
- [getSelectCaseAsNavuChoice(String)](NavuContainer.md#getselectcaseasnavuchoice-f6626477e806) from NavuContainer
- [getSelectCaseAsNavuNode(String)](NavuContainer.md#getselectcaseasnavunode-46fa4e27d61f) from NavuContainer
- [getSelectedCase(String)](NavuContainer.md#getselectedcase-3b005e9181ed) from NavuContainer
- [getUserSession()](NavuContainer.md#getusersession-7a9eeeb92f85) from NavuContainer
- [getValues(ConfXMLParam[])](NavuNode.md#getvalues-1eb02439a757) from NavuNode
- [getValues(String)](NavuNode.md#getvalues-c03de090764d) from NavuNode
- [h2str(Integer)](NavuContainer.md#h2str-3096e9ba352b) from NavuContainer
- [handleDuplicateChildren(List<CSNode>)](NavuContainer.md#handleduplicatechildren-e69c1564b6e7) from NavuContainer
- [hashCode()](#hashcode-ef797a217903)
- [isCreated()](NavuContainer.md#iscreated-bc9b3cb40910) from NavuContainer
- [isEmpty()](NavuContainer.md#isempty-4dde48126244) from NavuContainer
- [isListInstance()](NavuContainer.md#islistinstance-16ea9625f0d2) from NavuContainer
- [isNodeNavuLocal()](NavuContainer.md#isnodenavulocal-3af8ba5398d1) from NavuContainer
- [iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object)](NavuContainer.md#iterate-d80a566b7e0a) from NavuContainer
- [keySet()](NavuContainer.md#keyset-66de8917ecb8) from NavuContainer
- [leaf(ConfNamespace, String)](NavuContainer.md#leaf-da3758f37f21) from NavuContainer
- [leaf(Integer)](NavuContainer.md#leaf-47fda8402c20) from NavuContainer
- [leaf(String)](NavuContainer.md#leaf-ac189787d67d) from NavuContainer
- [leafList(ConfNamespace, String)](NavuContainer.md#leaflist-a2d5ad836b3e) from NavuContainer
- [leafList(Integer)](NavuContainer.md#leaflist-552c8007ecb4) from NavuContainer
- [leafList(String)](NavuContainer.md#leaflist-5811cbb534ec) from NavuContainer
- [list(ConfNamespace, String)](NavuContainer.md#list-6b15381fd14a) from NavuContainer
- [list(Integer)](NavuContainer.md#list-7dc96bdbb69a) from NavuContainer
- [list(String)](NavuContainer.md#list-2c1a74a3cf07) from NavuContainer
- [namespace(String)](NavuContainer.md#namespace-e29ad62ed095) from NavuContainer
- [populateChildren(List<CSNode>)](NavuContainer.md#populatechildren-40519dc6bd8c) from NavuContainer
- [populateChoices()](NavuContainer.md#populatechoices-de48df56d517) from NavuContainer
- [prefix(String)](NavuContainer.md#prefix-fdd71b8275bb) from NavuContainer
- [prepareXMLCall(String)](NavuNode.md#preparexmlcall-c22e250f2cac) from NavuNode
- [refresh()](NavuContainer.md#refresh-3852c3f76c8e) from NavuContainer
- [reset()](NavuContainer.md#reset-6927918ac70a) from NavuContainer
- [safeCreate()](NavuContainer.md#safecreate-8125e14d387f) from NavuContainer
- [select(ConfObject[])](NavuContainer.md#select-336dd76cd112) from NavuContainer
- [select(List<String>)](NavuContainer.md#select-e81f36150174) from NavuContainer
- [select(String)](NavuContainer.md#select-5031325154b9) from NavuContainer
- [setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext)](NavuContainer.md#setchange-0bbeb54ebc15) from NavuContainer
- [setKey(ConfKey)](NavuContainer.md#setkey-b8489388971b) from NavuContainer
- [setOperFlag(DiffIterateOperFlag)](NavuContainer.md#setoperflag-b50e9a2a8d38) from NavuContainer
- [setValues(ConfXMLParam[])](NavuNode.md#setvalues-50d8edffa795) from NavuNode
- [setValues(String)](NavuNode.md#setvalues-3ec9581ce266) from NavuNode
- [sharedCreate()](NavuContainer.md#sharedcreate-7aef2e24f04b) from NavuContainer
- [sharedSetValues(ConfXMLParam[])](NavuNode.md#sharedsetvalues-705549be9df0) from NavuNode
- [sharedSetValues(String)](NavuNode.md#sharedsetvalues-ad93c38b671f) from NavuNode
- [size()](NavuContainer.md#size-c6d8505255fd) from NavuContainer
- [stopCdbSession()](NavuNode.md#stopcdbsession-17418252a986) from NavuNode
- [toString()](NavuContainer.md#tostring-e9d48c5503ef) from NavuContainer
- [valueUpdateInd(NavuNode)](NavuContainer.md#valueupdateind-e7cd65f79d78) from NavuContainer
- [xPathSelect(String)](NavuNode.md#xpathselect-0fb26b9f41e0) from NavuNode
- [xPathSelectIterate(String, NavuNodeSetIterate)](NavuNode.md#xpathselectiterate-12547f34f47c) from NavuNode

## Constructors

### NavuListEntry(NavuContext, CSNode, NavuNode, ConfKey, String, Object[]) <a href="#navulistentry-6558a2da572b" id="navulistentry-6558a2da572b"></a>

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

Types: [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [NavuNode](NavuNode.md#navunode-73944820c8db), [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867)

Constructor for child container.

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas.CSNode listCsNode`
- `com.tailf.navu.NavuNode parent`
- `com.tailf.conf.ConfKey key`
- `String fmt`
- `Object[] arguments`


## Methods

### delete() <a href="#delete-a9e76d49da61" id="delete-a9e76d49da61"></a>

```java
public com.tailf.navu.NavuContainer delete() throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Deletes this entry from the NavuList it contains
 returns this NavuListEntry as NavuContainer.

 Sets the [`NavuNode#getChangeFlag()`](NavuNode.md#getchangeflag-33cadf5a32ba) flag to
 `MOP_DELETED`

**Returns:** The NavuContainer removed by this operation
 `getChange` on the return `NavuContainer`
 returns `MOP_DELETED`

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Compares the specified object with this `NavuListEntry`
 for equality.
 Returns `true` if the given object is also a
 `NavuListEntry` and it has the same
 [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d) as this
 `NavuListEntry`.

**Parameters**

- `Object o` - object to be compared for equality with this
          `NavuListEntry`

**Returns:** `true` if the specified object is equal to this
         `NavuListEntry`

### getKey() <a href="#getkey-9a8856159458" id="getkey-9a8856159458"></a>

```java
public com.tailf.conf.ConfKey getKey()
```

Types: [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867)

Return the associate key that this NavuList
  is mapped to.

**Returns:** the corresponding key

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```
