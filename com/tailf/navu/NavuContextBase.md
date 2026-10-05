<a id="cls-NavuContextBase"></a>
# NavuContextBase

```java
public abstract class com.tailf.navu.NavuContextBase
```

This class is the base class for [`NavuContext`](NavuContext.md#cls-NavuContext).
 It many contains methods for handling CDB type contexts i.e contexts created
 by the [`NavuContextBase#NavuContextBase(Cdb)`](NavuContextBase.md#m-navucontextbase-ee046d09a061) or
 [`NavuContextBase#NavuContextBase(CdbSession)`](NavuContextBase.md#m-navucontextbase-00da29370b33) constructors.

 Note, that instead of using CDB type contexts it is possible to instead use
 the [`NavuContext#NavuContext(Maapi)`](NavuContext.md#m-navucontext-af99f9cc97c7) constructor followed by a call of
 [`NavuContext#startOperationalTrans(int)`](NavuContext.md#m-startoperationaltrans-9d10bde402ce)

**Related classes**

- [NavuContext](NavuContext.md#cls-NavuContext)

## Members

**Constructors**:

- [NavuContextBase(Cdb)](#m-navucontextbase-ee046d09a061)
- [NavuContextBase(CdbSession)](#m-navucontextbase-00da29370b33)
- [NavuContextBase(CdbSubscription)](#m-navucontextbase-0d85dfcdf9a5)
- [NavuContextBase(Maapi, int)](#m-navucontextbase-819322861b91)

**Fields**:

- [unsetCaseInChoice](#m-unsetCaseInChoice)

**Methods**:

- [clear()](#m-clear-ca3baec040cb)
- [copy(NavuContextBase)](#m-copy-7436fcb6cfc1)
- [create(NavuNode, int, String, Object[])](#m-create-df02612e3971)
- [delete(NavuNode, String, Object[])](#m-delete-63a54ea2de30)
- [deref(NavuNode, String, Object[])](#m-deref-ae39a7d6fdde)
- [diffIterate(MaapiDiffIterate, NavuContextBase)](#m-diffiterate-a6cc344016cf)
- [getBackingStoreCdb()](#m-getbackingstorecdb-73329cf7d4e1)
- [getBackingStoreCdbSession()](#m-getbackingstorecdbsession-8b0ef17e8ea3)
- [getCase(NavuChoice, String, ConfPath)](#m-getcase-653069cc39c6)
- [getCdbSubscriber()](#m-getcdbsubscriber-f292c8c67d4d)
- [getElem(NavuNode, String, Object[])](#m-getelem-99bc0267bad6)
- [getLeafListIterator(NavuLeafList)](#m-getleaflistiterator-7174ac6a32ca)
- [getMaapi()](#m-getmaapi-0ce8975d8ec6)
- [getMaapiHandle()](#m-getmaapihandle-ba447f5d4e3f)
- [getNavuListIterator(NavuList)](#m-getnavulistiterator-c0c49395e08e)
- [getNsList()](#m-getnslist-0345f486e876)
- [getReadConfSession()](#m-getreadconfsession-ece7e5773db9)
- [getReadOperSession()](#m-getreadopersession-7e103aba03ba)
- [getValues(NavuNode, ConfXMLParam[])](#m-getvalues-ecb3f8096a7c)
- [getWriteConfSession()](#m-getwriteconfsession-a042057a7cb8)
- [getWriteOperSession()](#m-getwriteopersession-eb5d274da267)
- [hasCdbSubscriber()](#m-hascdbsubscriber-3650a7c55283)
- [idrefDerivedOrSelf(NavuNode, ConfIdentityRef, String, Object[])](#m-idrefderivedorself-6a08c9a390be)
- [initMaapiCursor(NavuNode, String, Object[])](#m-initmaapicursor-dfdad1aa4163)
- [insert(NavuList, boolean, String, Object[])](#m-insert-55bd5e6f415f)
- [isActAsSuper()](#m-isactassuper-ce02ade4553b)
- [isCdb()](#m-iscdb-20ec16d14862)
- [isCdbSession()](#m-iscdbsession-71fe8b2aab5d)
- [isMaapi()](#m-ismaapi-5c500ef256ce)
- [isOnline()](#m-isonline-90688b264b83)
- [moveOrdered(NavuNode, MoveWhereFlag, ConfKey, String, Object[])](#m-moveordered-373c795909ce)
- [numOfInstances(NavuNode)](#m-numofinstances-d5b1fc4e65c9)
- [removeCdbSessions()](#m-removecdbsessions-71502a05a702)
- [requestAction(NavuAction, ConfXMLParam[], String, Object[])](#m-requestaction-164fcf6d0208)
- [set(NavuContextBase)](#m-set-aa955bb80732)
- [setElem(NavuNode, ConfValue, boolean, String, Object[])](#m-setelem-0daaa25a8e50)
- [setElem(NavuNode, String, boolean, String, Object[])](#m-setelem-e887291ef6b0)
- [setMaapiHandle(int)](#m-setmaapihandle-62fe88de5765)
- [setOption(UnSetCaseInChoice)](#m-setoption-13f7d349ceea)
- [setReadConfLocks(EnumSet<CdbLockType>)](#m-setreadconflocks-43f86af9b510)
- [setReadOperLocks(EnumSet<CdbLockType>)](#m-setreadoperlocks-9c615c121ad2)
- [setValues(NavuNode, ConfXMLParam[], boolean)](#m-setvalues-8ac6838a32ab)
- [setWriteOperLocks(EnumSet<CdbLockType>)](#m-setwriteoperlocks-d3a3d78b7d7d)
- [toString()](#m-tostring-e9d48c5503ef)
- [xpathEval(NavuXPathSelectResultSet, MaapiXPathEvalTrace, String, Object, String)](#m-xpatheval-9750f496e526)

**Nested Types**:

- [UnSetCaseInChoice](NavuContextBase/UnSetCaseInChoice.md#cls-UnSetCaseInChoice)

## Constructors

<a id="m-navucontextbase-ee046d09a061"></a>
### NavuContextBase(Cdb)

```java
protected NavuContextBase(com.tailf.cdb.Cdb cdb)
```

Types: [Cdb](../cdb/Cdb.md#cls-Cdb)

Constructor for running NAVU with the `Cdb`
 mode.

 As this constructor takes a `Cdb`
 but it is never touched i.e no new Cdb sessions are opened
 on the supplied socket. Instead a new `Cdb` socket is
 constructed and used for new sessions.

  The Cdb sockets will be named "supplied-name"-pool:x
  where "supplied-name" is the name of the supplied
  `Cdb` socket name ( cdb.getName() ). The string
  "-pool:x" is appended where x is a internal integer counter.

**Parameters**

- `com.tailf.cdb.Cdb cdb` - The Cdb socket used as the template or

 `NavuContext`

<a id="m-navucontextbase-00da29370b33"></a>
### NavuContextBase(CdbSession)

```java
protected NavuContextBase(com.tailf.cdb.CdbSession session)
```

Types: [CdbSession](../cdb/CdbSession.md#cls-CdbSession)

CDB Session constructor.
 This session will be used for reading configuration data
 expected to be started for [`CdbDBType#CDB_RUNNING`](../cdb/CdbDBType.md#m-CDB_RUNNING)
 all locks for this session will apply.

**Parameters**

- `com.tailf.cdb.CdbSession session`

<a id="m-navucontextbase-0d85dfcdf9a5"></a>
### NavuContextBase(CdbSubscription)

```java
protected NavuContextBase(com.tailf.cdb.CdbSubscription cdbsub)
```

Types: [CdbSubscription](../cdb/CdbSubscription.md#cls-CdbSubscription)

**Parameters**

- `com.tailf.cdb.CdbSubscription cdbsub`

<a id="m-navucontextbase-819322861b91"></a>
### NavuContextBase(Maapi, int)

```java
protected NavuContextBase(com.tailf.maapi.Maapi m, int handle)
```

Types: [Maapi](../maapi/Maapi.md#cls-Maapi)

Constructor for running NAVU with the `Maapi`
 mode.

 As this constructor takes a transaction handle as
 its second parameter it implies that either a attached
 transaction is used or a started transaction is opened.

**Parameters**

- `com.tailf.maapi.Maapi m` - the `Maapi` instance to be used
- `int handle` - the transaction handle used for this
 `NavuContext`


## Fields

<a id="m-unsetCaseInChoice"></a>
### unsetCaseInChoice

```java
public com.tailf.navu.NavuContextBase.UnSetCaseInChoice unsetCaseInChoice = null;
```

Types: [UnSetCaseInChoice](NavuContextBase/UnSetCaseInChoice.md#cls-UnSetCaseInChoice)

Default behavior for unset case in choice.
 print warn msg in the log.


## Methods

<a id="m-clear-ca3baec040cb"></a>
### clear()

```java
protected void clear()
```

Clears all connection attributes.

<a id="m-copy-7436fcb6cfc1"></a>
### copy(NavuContextBase)

```java
protected void copy(com.tailf.navu.NavuContextBase context)
```

Types: [NavuContextBase](NavuContextBase.md#cls-NavuContextBase)

Copy the contents of a context.

**Parameters**

- `com.tailf.navu.NavuContextBase context`

<a id="m-create-df02612e3971"></a>
### create(NavuNode, int, String, Object[])

```java
protected void create(
    com.tailf.navu.NavuNode node,
    int how,
    String fmt,
    Object[] args
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `int how`
- `String fmt`
- `Object[] args`

<a id="m-delete-63a54ea2de30"></a>
### delete(NavuNode, String, Object[])

```java
protected void delete(
    com.tailf.navu.NavuNode node,
    String fmt,
    Object[] args
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String fmt`
- `Object[] args`

<a id="m-deref-ae39a7d6fdde"></a>
### deref(NavuNode, String, Object[])

```java
protected java.util.List<com.tailf.navu.NavuNode> deref(
    com.tailf.navu.NavuNode node,
    String fmt,
    Object[] args
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String fmt`
- `Object[] args`

<a id="m-diffiterate-a6cc344016cf"></a>
### diffIterate(MaapiDiffIterate, NavuContextBase)

```java
protected void diffIterate(
    com.tailf.maapi.MaapiDiffIterate iter,
    com.tailf.navu.NavuContextBase delContext
)
    throws com.tailf.navu.NavuException
```

Types: [MaapiDiffIterate](../maapi/MaapiDiffIterate.md#cls-MaapiDiffIterate), [NavuContextBase](NavuContextBase.md#cls-NavuContextBase), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.maapi.MaapiDiffIterate iter`
- `com.tailf.navu.NavuContextBase delContext`

<a id="m-getbackingstorecdb-73329cf7d4e1"></a>
### getBackingStoreCdb()

```java
public com.tailf.cdb.Cdb getBackingStoreCdb()
```

Types: [Cdb](../cdb/Cdb.md#cls-Cdb)

Get the backing store Cdb instance.
 The backing store Cdb is actually never used, instead it is used as
 primary for the internal NavuCdbSessionPool. The reason for this is
 that NAVU needs several CdbSessions concurrently and a Cdb instance can
 only hold one open CdbSession

**Returns:** backing store Cdb if applicable for this context

<a id="m-getbackingstorecdbsession-8b0ef17e8ea3"></a>
### getBackingStoreCdbSession()

```java
public com.tailf.cdb.CdbSession getBackingStoreCdbSession()
```

Types: [CdbSession](../cdb/CdbSession.md#cls-CdbSession)

Get the backing store CdbSession in this context was based on this.
 Otherwise this method returns null.

 Creating a context based on a CdbSession is an alternative to creating
 context based on a Cdb instance. If the CdbSession option is used, this
 session will be the backing store session and also its related Cdb
 instance is retrieved and stored as backing store Cdb instance.
 This CdbSession is never used by NAVU, instead it is primary for the
 internal NavuCdbSessionPool.

**Returns:** backing store CdbSession if applicable for this context

<a id="m-getcase-653069cc39c6"></a>
### getCase(NavuChoice, String, ConfPath)

```java
protected com.tailf.conf.ConfTag getCase(
    com.tailf.navu.NavuChoice nchoice,
    String choiceName,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.navu.NavuException
```

Types: [ConfTag](../conf/ConfTag.md#cls-ConfTag), [NavuChoice](NavuChoice.md#cls-NavuChoice), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuChoice nchoice`
- `String choiceName`
- `com.tailf.conf.ConfPath path`

<a id="m-getcdbsubscriber-f292c8c67d4d"></a>
### getCdbSubscriber()

```java
public com.tailf.cdb.CdbSubscription getCdbSubscriber()
```

Types: [CdbSubscription](../cdb/CdbSubscription.md#cls-CdbSubscription)

<a id="m-getelem-99bc0267bad6"></a>
### getElem(NavuNode, String, Object[])

```java
protected com.tailf.conf.ConfValue getElem(
    com.tailf.navu.NavuNode node,
    String fmt,
    Object[] args
)
    throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue), [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String fmt`
- `Object[] args`

<a id="m-getleaflistiterator-7174ac6a32ca"></a>
### getLeafListIterator(NavuLeafList)

```java
protected com.tailf.navu.NavuLeafListIterator getLeafListIterator(
    com.tailf.navu.NavuLeafList navuLeafList
)
    throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#cls-NavuLeafList), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuLeafList navuLeafList`

<a id="m-getmaapi-0ce8975d8ec6"></a>
### getMaapi()

```java
public com.tailf.maapi.Maapi getMaapi()
```

Types: [Maapi](../maapi/Maapi.md#cls-Maapi)

Getter for MAAPI

**Returns:** current Maapi object

<a id="m-getmaapihandle-ba447f5d4e3f"></a>
### getMaapiHandle()

```java
public int getMaapiHandle()
```

Getter for MAAPI transaction handle.

**Returns:** current maapi transaction handle

<a id="m-getnavulistiterator-c0c49395e08e"></a>
### getNavuListIterator(NavuList)

```java
protected com.tailf.navu.NavuListEntryIterator getNavuListIterator(
    com.tailf.navu.NavuList navuList
)
    throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#cls-NavuList), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuList navuList`

<a id="m-getnslist-0345f486e876"></a>
### getNsList()

```java
public java.util.ArrayList<com.tailf.conf.ConfNamespace> getNsList()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace)

**Returns:** registered namespaces.

<a id="m-getreadconfsession-ece7e5773db9"></a>
### getReadConfSession()

```java
public com.tailf.cdb.CdbSession getReadConfSession()
```

Types: [CdbSession](../cdb/CdbSession.md#cls-CdbSession)

If the context is created with
 [`NavuContextBase#NavuContextBase(CdbSession)`](NavuContextBase.md#m-navucontextbase-00da29370b33)
 this session will be returned.
 Otherwise retrieves a CdbSession for reading CDB_RUNNING database with
 the default locks if not defined by `#setReadConfLocks(EnumSet)`

**Returns:** CdbSession

<a id="m-getreadopersession-7e103aba03ba"></a>
### getReadOperSession()

```java
public com.tailf.cdb.CdbSession getReadOperSession()
```

Types: [CdbSession](../cdb/CdbSession.md#cls-CdbSession)

Retrieves a CdbSession for reading CDB_OPERATIONAL database with the
 default locks if not defined by `#setReadOperLocks(EnumSet)`

**Returns:** CdbSession

<a id="m-getvalues-ecb3f8096a7c"></a>
### getValues(NavuNode, ConfXMLParam[])

```java
protected com.tailf.conf.ConfXMLParam[] getValues(
    com.tailf.navu.NavuNode node,
    com.tailf.conf.ConfXMLParam[] confXMLParams
)
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `com.tailf.conf.ConfXMLParam[] confXMLParams`

<a id="m-getwriteconfsession-a042057a7cb8"></a>
### getWriteConfSession()

```java
protected com.tailf.cdb.CdbSession getWriteConfSession()
```

Types: [CdbSession](../cdb/CdbSession.md#cls-CdbSession)

<a id="m-getwriteopersession-eb5d274da267"></a>
### getWriteOperSession()

```java
public com.tailf.cdb.CdbSession getWriteOperSession()
```

Types: [CdbSession](../cdb/CdbSession.md#cls-CdbSession)

Retrieves a CdbSession for writing CDB_OPERATIONAL database with the
 default locks if not defined by `#setWriteOperLocks(EnumSet)`

**Returns:** CdbSession

<a id="m-hascdbsubscriber-3650a7c55283"></a>
### hasCdbSubscriber()

```java
public boolean hasCdbSubscriber()
```

<a id="m-idrefderivedorself-6a08c9a390be"></a>
### idrefDerivedOrSelf(NavuNode, ConfIdentityRef, String, Object[])

```java
protected boolean idrefDerivedOrSelf(
    com.tailf.navu.NavuNode node,
    com.tailf.conf.ConfIdentityRef base,
    String fmt,
    Object[] args
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [ConfIdentityRef](../conf/ConfIdentityRef.md#cls-ConfIdentityRef), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `com.tailf.conf.ConfIdentityRef base`
- `String fmt`
- `Object[] args`

<a id="m-initmaapicursor-dfdad1aa4163"></a>
### initMaapiCursor(NavuNode, String, Object[])

```java
protected java.util.List<com.tailf.conf.ConfKey> initMaapiCursor(
    com.tailf.navu.NavuNode node,
    String fmt,
    Object[] arguments
)
    throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#cls-ConfKey), [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String fmt`
- `Object[] arguments`

<a id="m-insert-55bd5e6f415f"></a>
### insert(NavuList, boolean, String, Object[])

```java
protected void insert(
    com.tailf.navu.NavuList navuList,
    boolean createBackpointer,
    String fmt,
    Object[] args
)
    throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#cls-NavuList), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuList navuList`
- `boolean createBackpointer`
- `String fmt`
- `Object[] args`

<a id="m-isactassuper-ce02ade4553b"></a>
### isActAsSuper()

```java
protected boolean isActAsSuper()
```

<a id="m-iscdb-20ec16d14862"></a>
### isCdb()

```java
public boolean isCdb()
```

<a id="m-iscdbsession-71fe8b2aab5d"></a>
### isCdbSession()

```java
public boolean isCdbSession()
```

<a id="m-ismaapi-5c500ef256ce"></a>
### isMaapi()

```java
public boolean isMaapi()
```

**Returns:** true if the a Maapi context.

<a id="m-isonline-90688b264b83"></a>
### isOnline()

```java
public boolean isOnline()
```

<a id="m-moveordered-373c795909ce"></a>
### moveOrdered(NavuNode, MoveWhereFlag, ConfKey, String, Object[])

```java
protected void moveOrdered(
    com.tailf.navu.NavuNode list,
    com.tailf.maapi.MoveWhereFlag whereTo,
    com.tailf.conf.ConfKey to,
    String fmt,
    Object[] args
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [MoveWhereFlag](../maapi/MoveWhereFlag.md#cls-MoveWhereFlag), [ConfKey](../conf/ConfKey.md#cls-ConfKey), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode list`
- `com.tailf.maapi.MoveWhereFlag whereTo`
- `com.tailf.conf.ConfKey to`
- `String fmt`
- `Object[] args`

<a id="m-numofinstances-d5b1fc4e65c9"></a>
### numOfInstances(NavuNode)

```java
protected int numOfInstances(com.tailf.navu.NavuNode navuList) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode navuList`

<a id="m-removecdbsessions-71502a05a702"></a>
### removeCdbSessions()

```java
public void removeCdbSessions()
```

Clears all the CDB sessions associates with the mapping
 between the the supplied Cdb socket and the ( in CDB mode )

<a id="m-requestaction-164fcf6d0208"></a>
### requestAction(NavuAction, ConfXMLParam[], String, Object[])

```java
protected com.tailf.conf.ConfXMLParam[] requestAction(
    com.tailf.navu.NavuAction action,
    com.tailf.conf.ConfXMLParam[] params,
    String fmt,
    Object[] args
)
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuAction](NavuAction.md#cls-NavuAction), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuAction action`
- `com.tailf.conf.ConfXMLParam[] params`
- `String fmt`
- `Object[] args`

<a id="m-set-aa955bb80732"></a>
### set(NavuContextBase)

```java
public void set(com.tailf.navu.NavuContextBase context)
```

Types: [NavuContextBase](NavuContextBase.md#cls-NavuContextBase)

Set the context attributes using another context object.

 This this operation will make an abrupt change in connection
 type, transactions etc. Therefore it is the responsibility of
 the user to handle open transactions, locks, socket or any
 other resources that otherwise will be left orphaned.

 Note, that the context is normally set at the creation of the NAVU
 root node. The context is then shared between all child nodes and a
 change of context attributes will therefore affect all nodes in
 the current NAVU tree. This implies that data can become stale between
 maapi transactions or cdb locks and the it is the responsibility of
 the user to handle when and how stale data should be dismissed.

**Parameters**

- `com.tailf.navu.NavuContextBase context`

<a id="m-setelem-0daaa25a8e50"></a>
### setElem(NavuNode, ConfValue, boolean, String, Object[])

```java
protected void setElem(
    com.tailf.navu.NavuNode node,
    com.tailf.conf.ConfValue val,
    boolean shared,
    String fmt,
    Object[] args
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [ConfValue](../conf/ConfValue.md#cls-ConfValue), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `com.tailf.conf.ConfValue val`
- `boolean shared`
- `String fmt`
- `Object[] args`

<a id="m-setelem-e887291ef6b0"></a>
### setElem(NavuNode, String, boolean, String, Object[])

```java
protected com.tailf.conf.ConfValue setElem(
    com.tailf.navu.NavuNode node,
    String strVal,
    boolean shared,
    String fmt,
    Object[] args
)
    throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue), [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String strVal`
- `boolean shared`
- `String fmt`
- `Object[] args`

<a id="m-setmaapihandle-62fe88de5765"></a>
### setMaapiHandle(int)

```java
protected void setMaapiHandle(int th)
```

**Parameters**

- `int th`

<a id="m-setoption-13f7d349ceea"></a>
### setOption(UnSetCaseInChoice)

```java
public void setOption(com.tailf.navu.NavuContextBase.UnSetCaseInChoice unSetChoiceInCase)
```

Types: [UnSetCaseInChoice](NavuContextBase/UnSetCaseInChoice.md#cls-UnSetCaseInChoice)

Set the behavior of how a unset case in choice should be
 treated.

**Parameters**

- `com.tailf.navu.NavuContextBase.UnSetCaseInChoice unSetChoiceInCase` - the specified option for behavior
                                        of unset case in choice

<a id="m-setreadconflocks-43f86af9b510"></a>
### setReadConfLocks(EnumSet<CdbLockType>)

```java
public void setReadConfLocks(java.util.EnumSet<com.tailf.cdb.CdbLockType> locks)
```

Types: [CdbLockType](../cdb/CdbLockType.md#cls-CdbLockType)

Sets the locks for a read CDB configuration data session
 Default is no locks.

**Parameters**

- `java.util.EnumSet<com.tailf.cdb.CdbLockType> locks`

<a id="m-setreadoperlocks-9c615c121ad2"></a>
### setReadOperLocks(EnumSet<CdbLockType>)

```java
public void setReadOperLocks(java.util.EnumSet<com.tailf.cdb.CdbLockType> locks)
```

Types: [CdbLockType](../cdb/CdbLockType.md#cls-CdbLockType)

Sets the locks for a read CDB operational data session
 Default is no locks.

**Parameters**

- `java.util.EnumSet<com.tailf.cdb.CdbLockType> locks`

<a id="m-setvalues-8ac6838a32ab"></a>
### setValues(NavuNode, ConfXMLParam[], boolean)

```java
protected void setValues(
    com.tailf.navu.NavuNode node,
    com.tailf.conf.ConfXMLParam[] confXMLParams,
    boolean shared
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `com.tailf.conf.ConfXMLParam[] confXMLParams`
- `boolean shared`

<a id="m-setwriteoperlocks-d3a3d78b7d7d"></a>
### setWriteOperLocks(EnumSet<CdbLockType>)

```java
public void setWriteOperLocks(java.util.EnumSet<com.tailf.cdb.CdbLockType> locks)
```

Types: [CdbLockType](../cdb/CdbLockType.md#cls-CdbLockType)

Sets the locks for a write CDB operational data session
 Default is EnumSet.of(CdbLockType.LOCK_REQUEST,CdbLockType.LOCK_PARTIAL)

**Parameters**

- `java.util.EnumSet<com.tailf.cdb.CdbLockType> locks`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

<a id="m-xpatheval-9750f496e526"></a>
### xpathEval(NavuXPathSelectResultSet, MaapiXPathEvalTrace, String, Object, String)

```java
protected void xpathEval(
    com.tailf.navu.NavuXPathSelectResultSet rs,
    com.tailf.maapi.MaapiXPathEvalTrace trace,
    String query,
    Object initstate,
    String keyPath
)
    throws com.tailf.navu.NavuException
```

Types: [MaapiXPathEvalTrace](../maapi/MaapiXPathEvalTrace.md#cls-MaapiXPathEvalTrace), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuXPathSelectResultSet rs`
- `com.tailf.maapi.MaapiXPathEvalTrace trace`
- `String query`
- `Object initstate`
- `String keyPath`


## Nested Types

- [UnSetCaseInChoice](NavuContextBase/UnSetCaseInChoice.md#cls-UnSetCaseInChoice)
