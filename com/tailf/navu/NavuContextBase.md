# NavuContextBase <a href="#cls-NavuContextBase" id="cls-NavuContextBase"></a>

```java
public abstract class com.tailf.navu.NavuContextBase
```

This class is the base class for [`NavuContext`](NavuContext.md#cls-NavuContext).
 It many contains methods for handling CDB type contexts i.e contexts created
 by the [`NavuContextBase#NavuContextBase(Cdb)`](NavuContextBase.md#m-NavuContextBase-ee046d09a061) or
 [`NavuContextBase#NavuContextBase(CdbSession)`](NavuContextBase.md#m-NavuContextBase-00da29370b33) constructors.

 Note, that instead of using CDB type contexts it is possible to instead use
 the [`NavuContext#NavuContext(Maapi)`](NavuContext.md#m-NavuContext-af99f9cc97c7) constructor followed by a call of
 [`NavuContext#startOperationalTrans(int)`](NavuContext.md#m-startOperationalTrans-9d10bde402ce)

**Related classes**

- [NavuContext](NavuContext.md#cls-NavuContext)

## Members

**Constructors**:

- [NavuContextBase(Cdb)](#m-NavuContextBase-ee046d09a061)
- [NavuContextBase(CdbSession)](#m-NavuContextBase-00da29370b33)
- [NavuContextBase(CdbSubscription)](#m-NavuContextBase-0d85dfcdf9a5)
- [NavuContextBase(Maapi, int)](#m-NavuContextBase-819322861b91)

**Fields**:

- [unsetCaseInChoice](#m-unsetCaseInChoice)

**Methods**:

- [clear()](#m-clear-ca3baec040cb)
- [copy(NavuContextBase)](#m-copy-7436fcb6cfc1)
- [create(NavuNode, int, String, Object[])](#m-create-df02612e3971)
- [delete(NavuNode, String, Object[])](#m-delete-63a54ea2de30)
- [deref(NavuNode, String, Object[])](#m-deref-ae39a7d6fdde)
- [diffIterate(MaapiDiffIterate, NavuContextBase)](#m-diffIterate-a6cc344016cf)
- [getBackingStoreCdb()](#m-getBackingStoreCdb-73329cf7d4e1)
- [getBackingStoreCdbSession()](#m-getBackingStoreCdbSession-8b0ef17e8ea3)
- [getCase(NavuChoice, String, ConfPath)](#m-getCase-653069cc39c6)
- [getCdbSubscriber()](#m-getCdbSubscriber-f292c8c67d4d)
- [getElem(NavuNode, String, Object[])](#m-getElem-99bc0267bad6)
- [getLeafListIterator(NavuLeafList)](#m-getLeafListIterator-7174ac6a32ca)
- [getMaapi()](#m-getMaapi-0ce8975d8ec6)
- [getMaapiHandle()](#m-getMaapiHandle-ba447f5d4e3f)
- [getNavuListIterator(NavuList)](#m-getNavuListIterator-c0c49395e08e)
- [getNsList()](#m-getNsList-0345f486e876)
- [getReadConfSession()](#m-getReadConfSession-ece7e5773db9)
- [getReadOperSession()](#m-getReadOperSession-7e103aba03ba)
- [getValues(NavuNode, ConfXMLParam[])](#m-getValues-ecb3f8096a7c)
- [getWriteConfSession()](#m-getWriteConfSession-a042057a7cb8)
- [getWriteOperSession()](#m-getWriteOperSession-eb5d274da267)
- [hasCdbSubscriber()](#m-hasCdbSubscriber-3650a7c55283)
- [idrefDerivedOrSelf(NavuNode, ConfIdentityRef, String, Object[])](#m-idrefDerivedOrSelf-6a08c9a390be)
- [initMaapiCursor(NavuNode, String, Object[])](#m-initMaapiCursor-dfdad1aa4163)
- [insert(NavuList, boolean, String, Object[])](#m-insert-55bd5e6f415f)
- [isActAsSuper()](#m-isActAsSuper-ce02ade4553b)
- [isCdb()](#m-isCdb-20ec16d14862)
- [isCdbSession()](#m-isCdbSession-71fe8b2aab5d)
- [isMaapi()](#m-isMaapi-5c500ef256ce)
- [isOnline()](#m-isOnline-90688b264b83)
- [moveOrdered(NavuNode, MoveWhereFlag, ConfKey, String, Object[])](#m-moveOrdered-373c795909ce)
- [numOfInstances(NavuNode)](#m-numOfInstances-d5b1fc4e65c9)
- [removeCdbSessions()](#m-removeCdbSessions-71502a05a702)
- [requestAction(NavuAction, ConfXMLParam[], String, Object[])](#m-requestAction-164fcf6d0208)
- [set(NavuContextBase)](#m-set-aa955bb80732)
- [setElem(NavuNode, ConfValue, boolean, String, Object[])](#m-setElem-0daaa25a8e50)
- [setElem(NavuNode, String, boolean, String, Object[])](#m-setElem-e887291ef6b0)
- [setMaapiHandle(int)](#m-setMaapiHandle-62fe88de5765)
- [setOption(UnSetCaseInChoice)](#m-setOption-13f7d349ceea)
- [setReadConfLocks(EnumSet<CdbLockType>)](#m-setReadConfLocks-43f86af9b510)
- [setReadOperLocks(EnumSet<CdbLockType>)](#m-setReadOperLocks-9c615c121ad2)
- [setValues(NavuNode, ConfXMLParam[], boolean)](#m-setValues-8ac6838a32ab)
- [setWriteOperLocks(EnumSet<CdbLockType>)](#m-setWriteOperLocks-d3a3d78b7d7d)
- [toString()](#m-toString-e9d48c5503ef)
- [xpathEval(NavuXPathSelectResultSet, MaapiXPathEvalTrace, String, Object, String)](#m-xpathEval-9750f496e526)

**Nested Types**:

- [UnSetCaseInChoice](NavuContextBase/UnSetCaseInChoice.md#cls-UnSetCaseInChoice)

## Constructors

### NavuContextBase(Cdb) <a href="#m-NavuContextBase-ee046d09a061" id="m-NavuContextBase-ee046d09a061"></a>

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

### NavuContextBase(CdbSession) <a href="#m-NavuContextBase-00da29370b33" id="m-NavuContextBase-00da29370b33"></a>

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

### NavuContextBase(CdbSubscription) <a href="#m-NavuContextBase-0d85dfcdf9a5" id="m-NavuContextBase-0d85dfcdf9a5"></a>

```java
protected NavuContextBase(com.tailf.cdb.CdbSubscription cdbsub)
```

Types: [CdbSubscription](../cdb/CdbSubscription.md#cls-CdbSubscription)

**Parameters**

- `com.tailf.cdb.CdbSubscription cdbsub`

### NavuContextBase(Maapi, int) <a href="#m-NavuContextBase-819322861b91" id="m-NavuContextBase-819322861b91"></a>

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

### unsetCaseInChoice <a href="#m-unsetCaseInChoice" id="m-unsetCaseInChoice"></a>

```java
public com.tailf.navu.NavuContextBase.UnSetCaseInChoice unsetCaseInChoice = null;
```

Types: [UnSetCaseInChoice](NavuContextBase/UnSetCaseInChoice.md#cls-UnSetCaseInChoice)

Default behavior for unset case in choice.
 print warn msg in the log.


## Methods

### clear() <a href="#m-clear-ca3baec040cb" id="m-clear-ca3baec040cb"></a>

```java
protected void clear()
```

Clears all connection attributes.

### copy(NavuContextBase) <a href="#m-copy-7436fcb6cfc1" id="m-copy-7436fcb6cfc1"></a>

```java
protected void copy(com.tailf.navu.NavuContextBase context)
```

Types: [NavuContextBase](NavuContextBase.md#cls-NavuContextBase)

Copy the contents of a context.

**Parameters**

- `com.tailf.navu.NavuContextBase context`

### create(NavuNode, int, String, Object[]) <a href="#m-create-df02612e3971" id="m-create-df02612e3971"></a>

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

### delete(NavuNode, String, Object[]) <a href="#m-delete-63a54ea2de30" id="m-delete-63a54ea2de30"></a>

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

### deref(NavuNode, String, Object[]) <a href="#m-deref-ae39a7d6fdde" id="m-deref-ae39a7d6fdde"></a>

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

### diffIterate(MaapiDiffIterate, NavuContextBase) <a href="#m-diffIterate-a6cc344016cf" id="m-diffIterate-a6cc344016cf"></a>

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

### getBackingStoreCdb() <a href="#m-getBackingStoreCdb-73329cf7d4e1" id="m-getBackingStoreCdb-73329cf7d4e1"></a>

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

### getBackingStoreCdbSession() <a href="#m-getBackingStoreCdbSession-8b0ef17e8ea3" id="m-getBackingStoreCdbSession-8b0ef17e8ea3"></a>

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

### getCase(NavuChoice, String, ConfPath) <a href="#m-getCase-653069cc39c6" id="m-getCase-653069cc39c6"></a>

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

### getCdbSubscriber() <a href="#m-getCdbSubscriber-f292c8c67d4d" id="m-getCdbSubscriber-f292c8c67d4d"></a>

```java
public com.tailf.cdb.CdbSubscription getCdbSubscriber()
```

Types: [CdbSubscription](../cdb/CdbSubscription.md#cls-CdbSubscription)

### getElem(NavuNode, String, Object[]) <a href="#m-getElem-99bc0267bad6" id="m-getElem-99bc0267bad6"></a>

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

### getLeafListIterator(NavuLeafList) <a href="#m-getLeafListIterator-7174ac6a32ca" id="m-getLeafListIterator-7174ac6a32ca"></a>

```java
protected com.tailf.navu.NavuLeafListIterator getLeafListIterator(
    com.tailf.navu.NavuLeafList navuLeafList
)
    throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#cls-NavuLeafList), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuLeafList navuLeafList`

### getMaapi() <a href="#m-getMaapi-0ce8975d8ec6" id="m-getMaapi-0ce8975d8ec6"></a>

```java
public com.tailf.maapi.Maapi getMaapi()
```

Types: [Maapi](../maapi/Maapi.md#cls-Maapi)

Getter for MAAPI

**Returns:** current Maapi object

### getMaapiHandle() <a href="#m-getMaapiHandle-ba447f5d4e3f" id="m-getMaapiHandle-ba447f5d4e3f"></a>

```java
public int getMaapiHandle()
```

Getter for MAAPI transaction handle.

**Returns:** current maapi transaction handle

### getNavuListIterator(NavuList) <a href="#m-getNavuListIterator-c0c49395e08e" id="m-getNavuListIterator-c0c49395e08e"></a>

```java
protected com.tailf.navu.NavuListEntryIterator getNavuListIterator(
    com.tailf.navu.NavuList navuList
)
    throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#cls-NavuList), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuList navuList`

### getNsList() <a href="#m-getNsList-0345f486e876" id="m-getNsList-0345f486e876"></a>

```java
public java.util.ArrayList<com.tailf.conf.ConfNamespace> getNsList()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace)

**Returns:** registered namespaces.

### getReadConfSession() <a href="#m-getReadConfSession-ece7e5773db9" id="m-getReadConfSession-ece7e5773db9"></a>

```java
public com.tailf.cdb.CdbSession getReadConfSession()
```

Types: [CdbSession](../cdb/CdbSession.md#cls-CdbSession)

If the context is created with
 [`NavuContextBase#NavuContextBase(CdbSession)`](NavuContextBase.md#m-NavuContextBase-00da29370b33)
 this session will be returned.
 Otherwise retrieves a CdbSession for reading CDB_RUNNING database with
 the default locks if not defined by `setReadConfLocks(EnumSet)`

**Returns:** CdbSession

### getReadOperSession() <a href="#m-getReadOperSession-7e103aba03ba" id="m-getReadOperSession-7e103aba03ba"></a>

```java
public com.tailf.cdb.CdbSession getReadOperSession()
```

Types: [CdbSession](../cdb/CdbSession.md#cls-CdbSession)

Retrieves a CdbSession for reading CDB_OPERATIONAL database with the
 default locks if not defined by `setReadOperLocks(EnumSet)`

**Returns:** CdbSession

### getValues(NavuNode, ConfXMLParam[]) <a href="#m-getValues-ecb3f8096a7c" id="m-getValues-ecb3f8096a7c"></a>

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

### getWriteConfSession() <a href="#m-getWriteConfSession-a042057a7cb8" id="m-getWriteConfSession-a042057a7cb8"></a>

```java
protected com.tailf.cdb.CdbSession getWriteConfSession()
```

Types: [CdbSession](../cdb/CdbSession.md#cls-CdbSession)

### getWriteOperSession() <a href="#m-getWriteOperSession-eb5d274da267" id="m-getWriteOperSession-eb5d274da267"></a>

```java
public com.tailf.cdb.CdbSession getWriteOperSession()
```

Types: [CdbSession](../cdb/CdbSession.md#cls-CdbSession)

Retrieves a CdbSession for writing CDB_OPERATIONAL database with the
 default locks if not defined by `setWriteOperLocks(EnumSet)`

**Returns:** CdbSession

### hasCdbSubscriber() <a href="#m-hasCdbSubscriber-3650a7c55283" id="m-hasCdbSubscriber-3650a7c55283"></a>

```java
public boolean hasCdbSubscriber()
```

### idrefDerivedOrSelf(NavuNode, ConfIdentityRef, String, Object[]) <a href="#m-idrefDerivedOrSelf-6a08c9a390be" id="m-idrefDerivedOrSelf-6a08c9a390be"></a>

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

### initMaapiCursor(NavuNode, String, Object[]) <a href="#m-initMaapiCursor-dfdad1aa4163" id="m-initMaapiCursor-dfdad1aa4163"></a>

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

### insert(NavuList, boolean, String, Object[]) <a href="#m-insert-55bd5e6f415f" id="m-insert-55bd5e6f415f"></a>

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

### isActAsSuper() <a href="#m-isActAsSuper-ce02ade4553b" id="m-isActAsSuper-ce02ade4553b"></a>

```java
protected boolean isActAsSuper()
```

### isCdb() <a href="#m-isCdb-20ec16d14862" id="m-isCdb-20ec16d14862"></a>

```java
public boolean isCdb()
```

### isCdbSession() <a href="#m-isCdbSession-71fe8b2aab5d" id="m-isCdbSession-71fe8b2aab5d"></a>

```java
public boolean isCdbSession()
```

### isMaapi() <a href="#m-isMaapi-5c500ef256ce" id="m-isMaapi-5c500ef256ce"></a>

```java
public boolean isMaapi()
```

**Returns:** true if the a Maapi context.

### isOnline() <a href="#m-isOnline-90688b264b83" id="m-isOnline-90688b264b83"></a>

```java
public boolean isOnline()
```

### moveOrdered(NavuNode, MoveWhereFlag, ConfKey, String, Object[]) <a href="#m-moveOrdered-373c795909ce" id="m-moveOrdered-373c795909ce"></a>

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

### numOfInstances(NavuNode) <a href="#m-numOfInstances-d5b1fc4e65c9" id="m-numOfInstances-d5b1fc4e65c9"></a>

```java
protected int numOfInstances(com.tailf.navu.NavuNode navuList) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode navuList`

### removeCdbSessions() <a href="#m-removeCdbSessions-71502a05a702" id="m-removeCdbSessions-71502a05a702"></a>

```java
public void removeCdbSessions()
```

Clears all the CDB sessions associates with the mapping
 between the the supplied Cdb socket and the ( in CDB mode )

### requestAction(NavuAction, ConfXMLParam[], String, Object[]) <a href="#m-requestAction-164fcf6d0208" id="m-requestAction-164fcf6d0208"></a>

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

### set(NavuContextBase) <a href="#m-set-aa955bb80732" id="m-set-aa955bb80732"></a>

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

### setElem(NavuNode, ConfValue, boolean, String, Object[]) <a href="#m-setElem-0daaa25a8e50" id="m-setElem-0daaa25a8e50"></a>

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

### setElem(NavuNode, String, boolean, String, Object[]) <a href="#m-setElem-e887291ef6b0" id="m-setElem-e887291ef6b0"></a>

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

### setMaapiHandle(int) <a href="#m-setMaapiHandle-62fe88de5765" id="m-setMaapiHandle-62fe88de5765"></a>

```java
protected void setMaapiHandle(int th)
```

**Parameters**

- `int th`

### setOption(UnSetCaseInChoice) <a href="#m-setOption-13f7d349ceea" id="m-setOption-13f7d349ceea"></a>

```java
public void setOption(com.tailf.navu.NavuContextBase.UnSetCaseInChoice unSetChoiceInCase)
```

Types: [UnSetCaseInChoice](NavuContextBase/UnSetCaseInChoice.md#cls-UnSetCaseInChoice)

Set the behavior of how a unset case in choice should be
 treated.

**Parameters**

- `com.tailf.navu.NavuContextBase.UnSetCaseInChoice unSetChoiceInCase` - the specified option for behavior
                                        of unset case in choice

### setReadConfLocks(EnumSet<CdbLockType>) <a href="#m-setReadConfLocks-43f86af9b510" id="m-setReadConfLocks-43f86af9b510"></a>

```java
public void setReadConfLocks(java.util.EnumSet<com.tailf.cdb.CdbLockType> locks)
```

Types: [CdbLockType](../cdb/CdbLockType.md#cls-CdbLockType)

Sets the locks for a read CDB configuration data session
 Default is no locks.

**Parameters**

- `java.util.EnumSet<com.tailf.cdb.CdbLockType> locks`

### setReadOperLocks(EnumSet<CdbLockType>) <a href="#m-setReadOperLocks-9c615c121ad2" id="m-setReadOperLocks-9c615c121ad2"></a>

```java
public void setReadOperLocks(java.util.EnumSet<com.tailf.cdb.CdbLockType> locks)
```

Types: [CdbLockType](../cdb/CdbLockType.md#cls-CdbLockType)

Sets the locks for a read CDB operational data session
 Default is no locks.

**Parameters**

- `java.util.EnumSet<com.tailf.cdb.CdbLockType> locks`

### setValues(NavuNode, ConfXMLParam[], boolean) <a href="#m-setValues-8ac6838a32ab" id="m-setValues-8ac6838a32ab"></a>

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

### setWriteOperLocks(EnumSet<CdbLockType>) <a href="#m-setWriteOperLocks-d3a3d78b7d7d" id="m-setWriteOperLocks-d3a3d78b7d7d"></a>

```java
public void setWriteOperLocks(java.util.EnumSet<com.tailf.cdb.CdbLockType> locks)
```

Types: [CdbLockType](../cdb/CdbLockType.md#cls-CdbLockType)

Sets the locks for a write CDB operational data session
 Default is EnumSet.of(CdbLockType.LOCK_REQUEST,CdbLockType.LOCK_PARTIAL)

**Parameters**

- `java.util.EnumSet<com.tailf.cdb.CdbLockType> locks`

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

### xpathEval(NavuXPathSelectResultSet, MaapiXPathEvalTrace, String, Object, String) <a href="#m-xpathEval-9750f496e526" id="m-xpathEval-9750f496e526"></a>

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
