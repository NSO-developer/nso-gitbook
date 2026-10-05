# NavuContextBase <a href="#navucontextbase-0061e2b12534" id="navucontextbase-0061e2b12534"></a>

```java
public abstract class com.tailf.navu.NavuContextBase
```

This class is the base class for [`NavuContext`](NavuContext.md#navucontext-2974e9f92a9e).
 It many contains methods for handling CDB type contexts i.e contexts created
 by the [`NavuContextBase#NavuContextBase(Cdb)`](NavuContextBase.md#navucontextbase-ee046d09a061) or
 [`NavuContextBase#NavuContextBase(CdbSession)`](NavuContextBase.md#navucontextbase-00da29370b33) constructors.

 Note, that instead of using CDB type contexts it is possible to instead use
 the [`NavuContext#NavuContext(Maapi)`](NavuContext.md#navucontext-af99f9cc97c7) constructor followed by a call of
 [`NavuContext#startOperationalTrans(int)`](NavuContext.md#startoperationaltrans-9d10bde402ce)

**Related classes**

- [NavuContext](NavuContext.md#navucontext-2974e9f92a9e)

## Members

**Constructors**:

- [NavuContextBase\(Cdb\)](#navucontextbase-ee046d09a061)
- [NavuContextBase\(CdbSession\)](#navucontextbase-00da29370b33)
- [NavuContextBase\(CdbSubscription\)](#navucontextbase-0d85dfcdf9a5)
- [NavuContextBase\(Maapi, int\)](#navucontextbase-819322861b91)

**Fields**:

- [unsetCaseInChoice](#unsetcaseinchoice-6309da590bfe)

**Methods**:

- [clear\(\)](#clear-ca3baec040cb)
- [copy\(NavuContextBase\)](#copy-7436fcb6cfc1)
- [create\(NavuNode, int, String, Object\[\]\)](#create-df02612e3971)
- [delete\(NavuNode, String, Object\[\]\)](#delete-63a54ea2de30)
- [deref\(NavuNode, String, Object\[\]\)](#deref-ae39a7d6fdde)
- [diffIterate\(MaapiDiffIterate, NavuContextBase\)](#diffiterate-a6cc344016cf)
- [getBackingStoreCdb\(\)](#getbackingstorecdb-73329cf7d4e1)
- [getBackingStoreCdbSession\(\)](#getbackingstorecdbsession-8b0ef17e8ea3)
- [getCase\(NavuChoice, String, ConfPath\)](#getcase-653069cc39c6)
- [getCdbSubscriber\(\)](#getcdbsubscriber-f292c8c67d4d)
- [getElem\(NavuNode, String, Object\[\]\)](#getelem-99bc0267bad6)
- [getLeafListIterator\(NavuLeafList\)](#getleaflistiterator-7174ac6a32ca)
- [getMaapi\(\)](#getmaapi-0ce8975d8ec6)
- [getMaapiHandle\(\)](#getmaapihandle-ba447f5d4e3f)
- [getNavuListIterator\(NavuList\)](#getnavulistiterator-c0c49395e08e)
- [getNsList\(\)](#getnslist-0345f486e876)
- [getReadConfSession\(\)](#getreadconfsession-ece7e5773db9)
- [getReadOperSession\(\)](#getreadopersession-7e103aba03ba)
- [getValues\(NavuNode, ConfXMLParam\[\]\)](#getvalues-ecb3f8096a7c)
- [getWriteConfSession\(\)](#getwriteconfsession-a042057a7cb8)
- [getWriteOperSession\(\)](#getwriteopersession-eb5d274da267)
- [hasCdbSubscriber\(\)](#hascdbsubscriber-3650a7c55283)
- [idrefDerivedOrSelf\(NavuNode, ConfIdentityRef, String, Object\[\]\)](#idrefderivedorself-6a08c9a390be)
- [initMaapiCursor\(NavuNode, String, Object\[\]\)](#initmaapicursor-dfdad1aa4163)
- [insert\(NavuList, boolean, String, Object\[\]\)](#insert-55bd5e6f415f)
- [isActAsSuper\(\)](#isactassuper-ce02ade4553b)
- [isCdb\(\)](#iscdb-20ec16d14862)
- [isCdbSession\(\)](#iscdbsession-71fe8b2aab5d)
- [isMaapi\(\)](#ismaapi-5c500ef256ce)
- [isOnline\(\)](#isonline-90688b264b83)
- [moveOrdered\(NavuNode, MoveWhereFlag, ConfKey, String, Object\[\]\)](#moveordered-373c795909ce)
- [numOfInstances\(NavuNode\)](#numofinstances-d5b1fc4e65c9)
- [removeCdbSessions\(\)](#removecdbsessions-71502a05a702)
- [requestAction\(NavuAction, ConfXMLParam\[\], String, Object\[\]\)](#requestaction-164fcf6d0208)
- [set\(NavuContextBase\)](#set-aa955bb80732)
- [setElem\(NavuNode, ConfValue, boolean, String, Object\[\]\)](#setelem-0daaa25a8e50)
- [setElem\(NavuNode, String, boolean, String, Object\[\]\)](#setelem-e887291ef6b0)
- [setMaapiHandle\(int\)](#setmaapihandle-62fe88de5765)
- [setOption\(UnSetCaseInChoice\)](#setoption-13f7d349ceea)
- [setReadConfLocks\(EnumSet\<CdbLockType\>\)](#setreadconflocks-43f86af9b510)
- [setReadOperLocks\(EnumSet\<CdbLockType\>\)](#setreadoperlocks-9c615c121ad2)
- [setValues\(NavuNode, ConfXMLParam\[\], boolean\)](#setvalues-8ac6838a32ab)
- [setWriteOperLocks\(EnumSet\<CdbLockType\>\)](#setwriteoperlocks-d3a3d78b7d7d)
- [toString\(\)](#tostring-e9d48c5503ef)
- [xpathEval\(NavuXPathSelectResultSet, MaapiXPathEvalTrace, String, Object, String\)](#xpatheval-9750f496e526)

**Nested Types**:

- [UnSetCaseInChoice](NavuContextBase/UnSetCaseInChoice.md#unsetcaseinchoice-f6b21f3bb1fe)

## Constructors

### NavuContextBase(Cdb) <a href="#navucontextbase-ee046d09a061" id="navucontextbase-ee046d09a061"></a>

```java
protected NavuContextBase(com.tailf.cdb.Cdb cdb)
```

Types: [Cdb](../cdb/Cdb.md#cdb-cb7fc41768c9)

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

### NavuContextBase(CdbSession) <a href="#navucontextbase-00da29370b33" id="navucontextbase-00da29370b33"></a>

```java
protected NavuContextBase(com.tailf.cdb.CdbSession session)
```

Types: [CdbSession](../cdb/CdbSession.md#cdbsession-9ffa54666283)

CDB Session constructor.
 This session will be used for reading configuration data
 expected to be started for [`CdbDBType#CDB_RUNNING`](../cdb/CdbDBType.md#cdb_running-a1f43295f116)
 all locks for this session will apply.

**Parameters**

- `com.tailf.cdb.CdbSession session`

### NavuContextBase(CdbSubscription) <a href="#navucontextbase-0d85dfcdf9a5" id="navucontextbase-0d85dfcdf9a5"></a>

```java
protected NavuContextBase(com.tailf.cdb.CdbSubscription cdbsub)
```

Types: [CdbSubscription](../cdb/CdbSubscription.md#cdbsubscription-f17c8fe4dc81)

**Parameters**

- `com.tailf.cdb.CdbSubscription cdbsub`

### NavuContextBase(Maapi, int) <a href="#navucontextbase-819322861b91" id="navucontextbase-819322861b91"></a>

```java
protected NavuContextBase(com.tailf.maapi.Maapi m, int handle)
```

Types: [Maapi](../maapi/Maapi.md#maapi-67bcbe89c42e)

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

### unsetCaseInChoice <a href="#unsetcaseinchoice-6309da590bfe" id="unsetcaseinchoice-6309da590bfe"></a>

```java
public com.tailf.navu.NavuContextBase.UnSetCaseInChoice unsetCaseInChoice = null;
```

Types: [UnSetCaseInChoice](NavuContextBase/UnSetCaseInChoice.md#unsetcaseinchoice-f6b21f3bb1fe)

Default behavior for unset case in choice.
 print warn msg in the log.


## Methods

### clear() <a href="#clear-ca3baec040cb" id="clear-ca3baec040cb"></a>

```java
protected void clear()
```

Clears all connection attributes.

### copy(NavuContextBase) <a href="#copy-7436fcb6cfc1" id="copy-7436fcb6cfc1"></a>

```java
protected void copy(com.tailf.navu.NavuContextBase context)
```

Types: [NavuContextBase](NavuContextBase.md#navucontextbase-0061e2b12534)

Copy the contents of a context.

**Parameters**

- `com.tailf.navu.NavuContextBase context`

### create(NavuNode, int, String, Object[]) <a href="#create-df02612e3971" id="create-df02612e3971"></a>

```java
protected void create(
    com.tailf.navu.NavuNode node,
    int how,
    String fmt,
    Object[] args
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `int how`
- `String fmt`
- `Object[] args`

### delete(NavuNode, String, Object[]) <a href="#delete-63a54ea2de30" id="delete-63a54ea2de30"></a>

```java
protected void delete(
    com.tailf.navu.NavuNode node,
    String fmt,
    Object[] args
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String fmt`
- `Object[] args`

### deref(NavuNode, String, Object[]) <a href="#deref-ae39a7d6fdde" id="deref-ae39a7d6fdde"></a>

```java
protected java.util.List<com.tailf.navu.NavuNode> deref(
    com.tailf.navu.NavuNode node,
    String fmt,
    Object[] args
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String fmt`
- `Object[] args`

### diffIterate(MaapiDiffIterate, NavuContextBase) <a href="#diffiterate-a6cc344016cf" id="diffiterate-a6cc344016cf"></a>

```java
protected void diffIterate(
    com.tailf.maapi.MaapiDiffIterate iter,
    com.tailf.navu.NavuContextBase delContext
)
    throws com.tailf.navu.NavuException
```

Types: [MaapiDiffIterate](../maapi/MaapiDiffIterate.md#maapidiffiterate-199d02e1da37), [NavuContextBase](NavuContextBase.md#navucontextbase-0061e2b12534), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.maapi.MaapiDiffIterate iter`
- `com.tailf.navu.NavuContextBase delContext`

### getBackingStoreCdb() <a href="#getbackingstorecdb-73329cf7d4e1" id="getbackingstorecdb-73329cf7d4e1"></a>

```java
public com.tailf.cdb.Cdb getBackingStoreCdb()
```

Types: [Cdb](../cdb/Cdb.md#cdb-cb7fc41768c9)

Get the backing store Cdb instance.
 The backing store Cdb is actually never used, instead it is used as
 primary for the internal NavuCdbSessionPool. The reason for this is
 that NAVU needs several CdbSessions concurrently and a Cdb instance can
 only hold one open CdbSession

**Returns:** backing store Cdb if applicable for this context

### getBackingStoreCdbSession() <a href="#getbackingstorecdbsession-8b0ef17e8ea3" id="getbackingstorecdbsession-8b0ef17e8ea3"></a>

```java
public com.tailf.cdb.CdbSession getBackingStoreCdbSession()
```

Types: [CdbSession](../cdb/CdbSession.md#cdbsession-9ffa54666283)

Get the backing store CdbSession in this context was based on this.
 Otherwise this method returns null.

 Creating a context based on a CdbSession is an alternative to creating
 context based on a Cdb instance. If the CdbSession option is used, this
 session will be the backing store session and also its related Cdb
 instance is retrieved and stored as backing store Cdb instance.
 This CdbSession is never used by NAVU, instead it is primary for the
 internal NavuCdbSessionPool.

**Returns:** backing store CdbSession if applicable for this context

### getCase(NavuChoice, String, ConfPath) <a href="#getcase-653069cc39c6" id="getcase-653069cc39c6"></a>

```java
protected com.tailf.conf.ConfTag getCase(
    com.tailf.navu.NavuChoice nchoice,
    String choiceName,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.navu.NavuException
```

Types: [ConfTag](../conf/ConfTag.md#conftag-73757b87bc93), [NavuChoice](NavuChoice.md#navuchoice-e8914a50eee5), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.navu.NavuChoice nchoice`
- `String choiceName`
- `com.tailf.conf.ConfPath path`

### getCdbSubscriber() <a href="#getcdbsubscriber-f292c8c67d4d" id="getcdbsubscriber-f292c8c67d4d"></a>

```java
public com.tailf.cdb.CdbSubscription getCdbSubscriber()
```

Types: [CdbSubscription](../cdb/CdbSubscription.md#cdbsubscription-f17c8fe4dc81)

### getElem(NavuNode, String, Object[]) <a href="#getelem-99bc0267bad6" id="getelem-99bc0267bad6"></a>

```java
protected com.tailf.conf.ConfValue getElem(
    com.tailf.navu.NavuNode node,
    String fmt,
    Object[] args
)
    throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String fmt`
- `Object[] args`

### getLeafListIterator(NavuLeafList) <a href="#getleaflistiterator-7174ac6a32ca" id="getleaflistiterator-7174ac6a32ca"></a>

```java
protected com.tailf.navu.NavuLeafListIterator getLeafListIterator(
    com.tailf.navu.NavuLeafList navuLeafList
)
    throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#navuleaflist-8d16c43a9b96), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.navu.NavuLeafList navuLeafList`

### getMaapi() <a href="#getmaapi-0ce8975d8ec6" id="getmaapi-0ce8975d8ec6"></a>

```java
public com.tailf.maapi.Maapi getMaapi()
```

Types: [Maapi](../maapi/Maapi.md#maapi-67bcbe89c42e)

Getter for MAAPI

**Returns:** current Maapi object

### getMaapiHandle() <a href="#getmaapihandle-ba447f5d4e3f" id="getmaapihandle-ba447f5d4e3f"></a>

```java
public int getMaapiHandle()
```

Getter for MAAPI transaction handle.

**Returns:** current maapi transaction handle

### getNavuListIterator(NavuList) <a href="#getnavulistiterator-c0c49395e08e" id="getnavulistiterator-c0c49395e08e"></a>

```java
protected com.tailf.navu.NavuListEntryIterator getNavuListIterator(
    com.tailf.navu.NavuList navuList
)
    throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#navulist-472e8d6d3745), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.navu.NavuList navuList`

### getNsList() <a href="#getnslist-0345f486e876" id="getnslist-0345f486e876"></a>

```java
public java.util.ArrayList<com.tailf.conf.ConfNamespace> getNsList()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1)

**Returns:** registered namespaces.

### getReadConfSession() <a href="#getreadconfsession-ece7e5773db9" id="getreadconfsession-ece7e5773db9"></a>

```java
public com.tailf.cdb.CdbSession getReadConfSession()
```

Types: [CdbSession](../cdb/CdbSession.md#cdbsession-9ffa54666283)

If the context is created with
 [`NavuContextBase#NavuContextBase(CdbSession)`](NavuContextBase.md#navucontextbase-00da29370b33)
 this session will be returned.
 Otherwise retrieves a CdbSession for reading CDB_RUNNING database with
 the default locks if not defined by `setReadConfLocks(EnumSet)`

**Returns:** CdbSession

### getReadOperSession() <a href="#getreadopersession-7e103aba03ba" id="getreadopersession-7e103aba03ba"></a>

```java
public com.tailf.cdb.CdbSession getReadOperSession()
```

Types: [CdbSession](../cdb/CdbSession.md#cdbsession-9ffa54666283)

Retrieves a CdbSession for reading CDB_OPERATIONAL database with the
 default locks if not defined by `setReadOperLocks(EnumSet)`

**Returns:** CdbSession

### getValues(NavuNode, ConfXMLParam[]) <a href="#getvalues-ecb3f8096a7c" id="getvalues-ecb3f8096a7c"></a>

```java
protected com.tailf.conf.ConfXMLParam[] getValues(
    com.tailf.navu.NavuNode node,
    com.tailf.conf.ConfXMLParam[] confXMLParams
)
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `com.tailf.conf.ConfXMLParam[] confXMLParams`

### getWriteConfSession() <a href="#getwriteconfsession-a042057a7cb8" id="getwriteconfsession-a042057a7cb8"></a>

```java
protected com.tailf.cdb.CdbSession getWriteConfSession()
```

Types: [CdbSession](../cdb/CdbSession.md#cdbsession-9ffa54666283)

### getWriteOperSession() <a href="#getwriteopersession-eb5d274da267" id="getwriteopersession-eb5d274da267"></a>

```java
public com.tailf.cdb.CdbSession getWriteOperSession()
```

Types: [CdbSession](../cdb/CdbSession.md#cdbsession-9ffa54666283)

Retrieves a CdbSession for writing CDB_OPERATIONAL database with the
 default locks if not defined by `setWriteOperLocks(EnumSet)`

**Returns:** CdbSession

### hasCdbSubscriber() <a href="#hascdbsubscriber-3650a7c55283" id="hascdbsubscriber-3650a7c55283"></a>

```java
public boolean hasCdbSubscriber()
```

### idrefDerivedOrSelf(NavuNode, ConfIdentityRef, String, Object[]) <a href="#idrefderivedorself-6a08c9a390be" id="idrefderivedorself-6a08c9a390be"></a>

```java
protected boolean idrefDerivedOrSelf(
    com.tailf.navu.NavuNode node,
    com.tailf.conf.ConfIdentityRef base,
    String fmt,
    Object[] args
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [ConfIdentityRef](../conf/ConfIdentityRef.md#confidentityref-1a367056e764), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `com.tailf.conf.ConfIdentityRef base`
- `String fmt`
- `Object[] args`

### initMaapiCursor(NavuNode, String, Object[]) <a href="#initmaapicursor-dfdad1aa4163" id="initmaapicursor-dfdad1aa4163"></a>

```java
protected java.util.List<com.tailf.conf.ConfKey> initMaapiCursor(
    com.tailf.navu.NavuNode node,
    String fmt,
    Object[] arguments
)
    throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867), [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String fmt`
- `Object[] arguments`

### insert(NavuList, boolean, String, Object[]) <a href="#insert-55bd5e6f415f" id="insert-55bd5e6f415f"></a>

```java
protected void insert(
    com.tailf.navu.NavuList navuList,
    boolean createBackpointer,
    String fmt,
    Object[] args
)
    throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#navulist-472e8d6d3745), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.navu.NavuList navuList`
- `boolean createBackpointer`
- `String fmt`
- `Object[] args`

### isActAsSuper() <a href="#isactassuper-ce02ade4553b" id="isactassuper-ce02ade4553b"></a>

```java
protected boolean isActAsSuper()
```

### isCdb() <a href="#iscdb-20ec16d14862" id="iscdb-20ec16d14862"></a>

```java
public boolean isCdb()
```

### isCdbSession() <a href="#iscdbsession-71fe8b2aab5d" id="iscdbsession-71fe8b2aab5d"></a>

```java
public boolean isCdbSession()
```

### isMaapi() <a href="#ismaapi-5c500ef256ce" id="ismaapi-5c500ef256ce"></a>

```java
public boolean isMaapi()
```

**Returns:** true if the a Maapi context.

### isOnline() <a href="#isonline-90688b264b83" id="isonline-90688b264b83"></a>

```java
public boolean isOnline()
```

### moveOrdered(NavuNode, MoveWhereFlag, ConfKey, String, Object[]) <a href="#moveordered-373c795909ce" id="moveordered-373c795909ce"></a>

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

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [MoveWhereFlag](../maapi/MoveWhereFlag.md#movewhereflag-bbc0edc34bda), [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.navu.NavuNode list`
- `com.tailf.maapi.MoveWhereFlag whereTo`
- `com.tailf.conf.ConfKey to`
- `String fmt`
- `Object[] args`

### numOfInstances(NavuNode) <a href="#numofinstances-d5b1fc4e65c9" id="numofinstances-d5b1fc4e65c9"></a>

```java
protected int numOfInstances(com.tailf.navu.NavuNode navuList) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.navu.NavuNode navuList`

### removeCdbSessions() <a href="#removecdbsessions-71502a05a702" id="removecdbsessions-71502a05a702"></a>

```java
public void removeCdbSessions()
```

Clears all the CDB sessions associates with the mapping
 between the the supplied Cdb socket and the ( in CDB mode )

### requestAction(NavuAction, ConfXMLParam[], String, Object[]) <a href="#requestaction-164fcf6d0208" id="requestaction-164fcf6d0208"></a>

```java
protected com.tailf.conf.ConfXMLParam[] requestAction(
    com.tailf.navu.NavuAction action,
    com.tailf.conf.ConfXMLParam[] params,
    String fmt,
    Object[] args
)
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [NavuAction](NavuAction.md#navuaction-d853bc49f0e8), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.navu.NavuAction action`
- `com.tailf.conf.ConfXMLParam[] params`
- `String fmt`
- `Object[] args`

### set(NavuContextBase) <a href="#set-aa955bb80732" id="set-aa955bb80732"></a>

```java
public void set(com.tailf.navu.NavuContextBase context)
```

Types: [NavuContextBase](NavuContextBase.md#navucontextbase-0061e2b12534)

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

### setElem(NavuNode, ConfValue, boolean, String, Object[]) <a href="#setelem-0daaa25a8e50" id="setelem-0daaa25a8e50"></a>

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

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `com.tailf.conf.ConfValue val`
- `boolean shared`
- `String fmt`
- `Object[] args`

### setElem(NavuNode, String, boolean, String, Object[]) <a href="#setelem-e887291ef6b0" id="setelem-e887291ef6b0"></a>

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

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String strVal`
- `boolean shared`
- `String fmt`
- `Object[] args`

### setMaapiHandle(int) <a href="#setmaapihandle-62fe88de5765" id="setmaapihandle-62fe88de5765"></a>

```java
protected void setMaapiHandle(int th)
```

**Parameters**

- `int th`

### setOption(UnSetCaseInChoice) <a href="#setoption-13f7d349ceea" id="setoption-13f7d349ceea"></a>

```java
public void setOption(com.tailf.navu.NavuContextBase.UnSetCaseInChoice unSetChoiceInCase)
```

Types: [UnSetCaseInChoice](NavuContextBase/UnSetCaseInChoice.md#unsetcaseinchoice-f6b21f3bb1fe)

Set the behavior of how a unset case in choice should be
 treated.

**Parameters**

- `com.tailf.navu.NavuContextBase.UnSetCaseInChoice unSetChoiceInCase` - the specified option for behavior
                                        of unset case in choice

### setReadConfLocks(EnumSet&lt;CdbLockType&gt;) <a href="#setreadconflocks-43f86af9b510" id="setreadconflocks-43f86af9b510"></a>

```java
public void setReadConfLocks(java.util.EnumSet<com.tailf.cdb.CdbLockType> locks)
```

Types: [CdbLockType](../cdb/CdbLockType.md#cdblocktype-1d165621c0a3)

Sets the locks for a read CDB configuration data session
 Default is no locks.

**Parameters**

- `java.util.EnumSet<com.tailf.cdb.CdbLockType> locks`

### setReadOperLocks(EnumSet&lt;CdbLockType&gt;) <a href="#setreadoperlocks-9c615c121ad2" id="setreadoperlocks-9c615c121ad2"></a>

```java
public void setReadOperLocks(java.util.EnumSet<com.tailf.cdb.CdbLockType> locks)
```

Types: [CdbLockType](../cdb/CdbLockType.md#cdblocktype-1d165621c0a3)

Sets the locks for a read CDB operational data session
 Default is no locks.

**Parameters**

- `java.util.EnumSet<com.tailf.cdb.CdbLockType> locks`

### setValues(NavuNode, ConfXMLParam[], boolean) <a href="#setvalues-8ac6838a32ab" id="setvalues-8ac6838a32ab"></a>

```java
protected void setValues(
    com.tailf.navu.NavuNode node,
    com.tailf.conf.ConfXMLParam[] confXMLParams,
    boolean shared
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `com.tailf.conf.ConfXMLParam[] confXMLParams`
- `boolean shared`

### setWriteOperLocks(EnumSet&lt;CdbLockType&gt;) <a href="#setwriteoperlocks-d3a3d78b7d7d" id="setwriteoperlocks-d3a3d78b7d7d"></a>

```java
public void setWriteOperLocks(java.util.EnumSet<com.tailf.cdb.CdbLockType> locks)
```

Types: [CdbLockType](../cdb/CdbLockType.md#cdblocktype-1d165621c0a3)

Sets the locks for a write CDB operational data session
 Default is EnumSet.of(CdbLockType.LOCK_REQUEST,CdbLockType.LOCK_PARTIAL)

**Parameters**

- `java.util.EnumSet<com.tailf.cdb.CdbLockType> locks`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

### xpathEval(NavuXPathSelectResultSet, MaapiXPathEvalTrace, String, Object, String) <a href="#xpatheval-9750f496e526" id="xpatheval-9750f496e526"></a>

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

Types: [MaapiXPathEvalTrace](../maapi/MaapiXPathEvalTrace.md#maapixpathevaltrace-4a63725791bd), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.navu.NavuXPathSelectResultSet rs`
- `com.tailf.maapi.MaapiXPathEvalTrace trace`
- `String query`
- `Object initstate`
- `String keyPath`


## Nested Types

- [UnSetCaseInChoice](NavuContextBase/UnSetCaseInChoice.md#unsetcaseinchoice-f6b21f3bb1fe)
