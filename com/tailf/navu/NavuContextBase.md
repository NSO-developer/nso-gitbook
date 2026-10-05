<a id="s-NavuContextBase"></a>
# NavuContextBase

```java
public abstract class com.tailf.navu.NavuContextBase
```

This class is the base class for [`NavuContext`](NavuContext.md#s-NavuContext).
 It many contains methods for handling CDB type contexts i.e contexts created
 by the [`NavuContextBase`](NavuContextBase.md#s-NavuContextBase) or
 [`NavuContextBase`](NavuContextBase.md#s-NavuContextBase) constructors.

 Note, that instead of using CDB type contexts it is possible to instead use
 the [`NavuContext`](NavuContext.md#s-NavuContext) constructor followed by a call of
 [`NavuContext`](NavuContext.md#s-NavuContext)

**Related classes**

- [NavuContext](NavuContext.md#s-NavuContext)

## Members

**Constructors**:

- [NavuContextBase(Cdb)](#s-NavuContextBase-1)
- [NavuContextBase(CdbSession)](#s-NavuContextBase-2)
- [NavuContextBase(CdbSubscription)](#s-NavuContextBase-3)
- [NavuContextBase(Maapi, int)](#s-NavuContextBase-4)

**Fields**:

- [unsetCaseInChoice](#s-unsetCaseInChoice)

**Methods**:

- [clear()](#s-clear)
- [copy(NavuContextBase)](#s-copy)
- [create(NavuNode, int, String, Object[])](#s-create)
- [delete(NavuNode, String, Object[])](#s-delete)
- [deref(NavuNode, String, Object[])](#s-deref)
- [diffIterate(MaapiDiffIterate, NavuContextBase)](#s-diffIterate)
- [exists(NavuNodeInfo, String, Object[])](#s-exists)
- [getBackingStoreCdb()](#s-getBackingStoreCdb)
- [getBackingStoreCdbSession()](#s-getBackingStoreCdbSession)
- [getCase(NavuChoice, String, ConfPath)](#s-getCase)
- [getCdbSubscriber()](#s-getCdbSubscriber)
- [getElem(NavuNode, String, Object[])](#s-getElem)
- [getLeafListIterator(NavuLeafList)](#s-getLeafListIterator)
- [getMaapi()](#s-getMaapi)
- [getMaapiHandle()](#s-getMaapiHandle)
- [getNavuListIterator(NavuList)](#s-getNavuListIterator)
- [getNsList()](#s-getNsList)
- [getReadConfSession()](#s-getReadConfSession)
- [getReadOperSession()](#s-getReadOperSession)
- [getValues(NavuNode, ConfXMLParam[])](#s-getValues)
- [getWriteConfSession()](#s-getWriteConfSession)
- [getWriteOperSession()](#s-getWriteOperSession)
- [hasCdbSubscriber()](#s-hasCdbSubscriber)
- [idrefDerivedOrSelf(NavuNode, ConfIdentityRef, String, Object[])](#s-idrefDerivedOrSelf)
- [initMaapiCursor(NavuNode, String, Object[])](#s-initMaapiCursor)
- [insert(NavuList, boolean, String, Object[])](#s-insert)
- [isActAsSuper()](#s-isActAsSuper)
- [isCdb()](#s-isCdb)
- [isCdbSession()](#s-isCdbSession)
- [isMaapi()](#s-isMaapi)
- [isOnline()](#s-isOnline)
- [moveOrdered(NavuNode, MoveWhereFlag, ConfKey, String, Object[])](#s-moveOrdered)
- [numOfInstances(NavuNode)](#s-numOfInstances)
- [removeCdbSessions()](#s-removeCdbSessions)
- [requestAction(NavuAction, ConfXMLParam[], String, Object[])](#s-requestAction)
- [set(NavuContextBase)](#s-set)
- [setElem(NavuNode, ConfValue, boolean, String, Object[])](#s-setElem)
- [setElem(NavuNode, String, boolean, String, Object[])](#s-setElem-1)
- [setMaapiHandle(int)](#s-setMaapiHandle)
- [setOption(UnSetCaseInChoice)](#s-setOption)
- [setReadConfLocks(EnumSet<CdbLockType>)](#s-setReadConfLocks)
- [setReadOperLocks(EnumSet<CdbLockType>)](#s-setReadOperLocks)
- [setValues(NavuNode, ConfXMLParam[], boolean)](#s-setValues)
- [setWriteOperLocks(EnumSet<CdbLockType>)](#s-setWriteOperLocks)
- [toString()](#s-toString)
- [xpathEval(NavuXPathSelectResultSet, MaapiXPathEvalTrace, String, Object, String)](#s-xpathEval)

**Nested Types**:

- [UnSetCaseInChoice](NavuContextBase/UnSetCaseInChoice.md#s-UnSetCaseInChoice)

## Constructors

<a id="s-NavuContextBase-1"></a>
### NavuContextBase(Cdb)

```java
protected NavuContextBase(com.tailf.cdb.Cdb cdb)
```

Types: [Cdb](../cdb/Cdb.md#s-Cdb)

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

<a id="s-NavuContextBase-2"></a>
### NavuContextBase(CdbSession)

```java
protected NavuContextBase(com.tailf.cdb.CdbSession session)
```

Types: [CdbSession](../cdb/CdbSession.md#s-CdbSession)

CDB Session constructor.
 This session will be used for reading configuration data
 expected to be started for [`CdbDBType`](../cdb/CdbDBType.md#s-CdbDBType)
 all locks for this session will apply.

**Parameters**

- `com.tailf.cdb.CdbSession session`

<a id="s-NavuContextBase-3"></a>
### NavuContextBase(CdbSubscription)

```java
protected NavuContextBase(com.tailf.cdb.CdbSubscription cdbsub)
```

Types: [CdbSubscription](../cdb/CdbSubscription.md#s-CdbSubscription)

**Parameters**

- `com.tailf.cdb.CdbSubscription cdbsub`

<a id="s-NavuContextBase-4"></a>
### NavuContextBase(Maapi, int)

```java
protected NavuContextBase(com.tailf.maapi.Maapi m, int handle)
```

Types: [Maapi](../maapi/Maapi.md#s-Maapi)

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

<a id="s-unsetCaseInChoice"></a>
### unsetCaseInChoice

```java
public com.tailf.navu.NavuContextBase.UnSetCaseInChoice unsetCaseInChoice = null;
```

Types: [UnSetCaseInChoice](NavuContextBase/UnSetCaseInChoice.md#s-UnSetCaseInChoice)

Default behavior for unset case in choice.
 print warn msg in the log.


## Methods

<a id="s-clear"></a>
### clear()

```java
protected void clear()
```

Clears all connection attributes.

<a id="s-copy"></a>
### copy(NavuContextBase)

```java
protected void copy(com.tailf.navu.NavuContextBase context)
```

Types: [NavuContextBase](NavuContextBase.md#s-NavuContextBase)

Copy the contents of a context.

**Parameters**

- `com.tailf.navu.NavuContextBase context`

<a id="s-create"></a>
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

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `int how`
- `String fmt`
- `Object[] args`

<a id="s-delete"></a>
### delete(NavuNode, String, Object[])

```java
protected void delete(
    com.tailf.navu.NavuNode node,
    String fmt,
    Object[] args
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String fmt`
- `Object[] args`

<a id="s-deref"></a>
### deref(NavuNode, String, Object[])

```java
protected java.util.List<com.tailf.navu.NavuNode> deref(
    com.tailf.navu.NavuNode node,
    String fmt,
    Object[] args
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String fmt`
- `Object[] args`

<a id="s-diffIterate"></a>
### diffIterate(MaapiDiffIterate, NavuContextBase)

```java
protected void diffIterate(
    com.tailf.maapi.MaapiDiffIterate iter,
    com.tailf.navu.NavuContextBase delContext
)
    throws com.tailf.navu.NavuException
```

Types: [MaapiDiffIterate](../maapi/MaapiDiffIterate.md#s-MaapiDiffIterate), [NavuContextBase](NavuContextBase.md#s-NavuContextBase), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.maapi.MaapiDiffIterate iter`
- `com.tailf.navu.NavuContextBase delContext`

<a id="s-exists"></a>
### exists(NavuNodeInfo, String, Object[])

```java
public boolean exists(
    com.tailf.navu.NavuNodeInfo node,
    String fmt,
    Object[] arguments
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNodeInfo](NavuNodeInfo.md#s-NavuNodeInfo), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNodeInfo node`
- `String fmt`
- `Object[] arguments`

<a id="s-getBackingStoreCdb"></a>
### getBackingStoreCdb()

```java
public com.tailf.cdb.Cdb getBackingStoreCdb()
```

Types: [Cdb](../cdb/Cdb.md#s-Cdb)

Get the backing store Cdb instance.
 The backing store Cdb is actually never used, instead it is used as
 primary for the internal NavuCdbSessionPool. The reason for this is
 that NAVU needs several CdbSessions concurrently and a Cdb instance can
 only hold one open CdbSession

**Returns:** backing store Cdb if applicable for this context

<a id="s-getBackingStoreCdbSession"></a>
### getBackingStoreCdbSession()

```java
public com.tailf.cdb.CdbSession getBackingStoreCdbSession()
```

Types: [CdbSession](../cdb/CdbSession.md#s-CdbSession)

Get the backing store CdbSession in this context was based on this.
 Otherwise this method returns null.

 Creating a context based on a CdbSession is an alternative to creating
 context based on a Cdb instance. If the CdbSession option is used, this
 session will be the backing store session and also its related Cdb
 instance is retrieved and stored as backing store Cdb instance.
 This CdbSession is never used by NAVU, instead it is primary for the
 internal NavuCdbSessionPool.

**Returns:** backing store CdbSession if applicable for this context

<a id="s-getCase"></a>
### getCase(NavuChoice, String, ConfPath)

```java
protected com.tailf.conf.ConfTag getCase(
    com.tailf.navu.NavuChoice nchoice,
    String choiceName,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.navu.NavuException
```

Types: [ConfTag](../conf/ConfTag.md#s-ConfTag), [NavuChoice](NavuChoice.md#s-NavuChoice), [ConfPath](../conf/ConfPath.md#s-ConfPath), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuChoice nchoice`
- `String choiceName`
- `com.tailf.conf.ConfPath path`

<a id="s-getCdbSubscriber"></a>
### getCdbSubscriber()

```java
public com.tailf.cdb.CdbSubscription getCdbSubscriber()
```

Types: [CdbSubscription](../cdb/CdbSubscription.md#s-CdbSubscription)

<a id="s-getElem"></a>
### getElem(NavuNode, String, Object[])

```java
protected com.tailf.conf.ConfValue getElem(
    com.tailf.navu.NavuNode node,
    String fmt,
    Object[] args
)
    throws com.tailf.navu.NavuException
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String fmt`
- `Object[] args`

<a id="s-getLeafListIterator"></a>
### getLeafListIterator(NavuLeafList)

```java
protected com.tailf.navu.NavuLeafListIterator getLeafListIterator(
    com.tailf.navu.NavuLeafList navuLeafList
)
    throws com.tailf.navu.NavuException
```

Types: [NavuLeafListIterator](NavuLeafListIterator.md#s-NavuLeafListIterator), [NavuLeafList](NavuLeafList.md#s-NavuLeafList), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuLeafList navuLeafList`

<a id="s-getMaapi"></a>
### getMaapi()

```java
public com.tailf.maapi.Maapi getMaapi()
```

Types: [Maapi](../maapi/Maapi.md#s-Maapi)

Getter for MAAPI

**Returns:** current Maapi object

<a id="s-getMaapiHandle"></a>
### getMaapiHandle()

```java
public int getMaapiHandle()
```

Getter for MAAPI transaction handle.

**Returns:** current maapi transaction handle

<a id="s-getNavuListIterator"></a>
### getNavuListIterator(NavuList)

```java
protected com.tailf.navu.NavuListEntryIterator getNavuListIterator(
    com.tailf.navu.NavuList navuList
)
    throws com.tailf.navu.NavuException
```

Types: [NavuListEntryIterator](NavuListEntryIterator.md#s-NavuListEntryIterator), [NavuList](NavuList.md#s-NavuList), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuList navuList`

<a id="s-getNsList"></a>
### getNsList()

```java
public java.util.ArrayList<com.tailf.conf.ConfNamespace> getNsList()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#s-ConfNamespace)

**Returns:** registered namespaces.

<a id="s-getReadConfSession"></a>
### getReadConfSession()

```java
public com.tailf.cdb.CdbSession getReadConfSession()
```

Types: [CdbSession](../cdb/CdbSession.md#s-CdbSession)

If the context is created with
 [`NavuContextBase`](NavuContextBase.md#s-NavuContextBase)
 this session will be returned.
 Otherwise retrieves a CdbSession for reading CDB_RUNNING database with
 the default locks if not defined by `#setReadConfLocks(EnumSet)`

**Returns:** CdbSession

<a id="s-getReadOperSession"></a>
### getReadOperSession()

```java
public com.tailf.cdb.CdbSession getReadOperSession()
```

Types: [CdbSession](../cdb/CdbSession.md#s-CdbSession)

Retrieves a CdbSession for reading CDB_OPERATIONAL database with the
 default locks if not defined by `#setReadOperLocks(EnumSet)`

**Returns:** CdbSession

<a id="s-getValues"></a>
### getValues(NavuNode, ConfXMLParam[])

```java
protected com.tailf.conf.ConfXMLParam[] getValues(
    com.tailf.navu.NavuNode node,
    com.tailf.conf.ConfXMLParam[] confXMLParams
)
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `com.tailf.conf.ConfXMLParam[] confXMLParams`

<a id="s-getWriteConfSession"></a>
### getWriteConfSession()

```java
protected com.tailf.cdb.CdbSession getWriteConfSession()
```

Types: [CdbSession](../cdb/CdbSession.md#s-CdbSession)

<a id="s-getWriteOperSession"></a>
### getWriteOperSession()

```java
public com.tailf.cdb.CdbSession getWriteOperSession()
```

Types: [CdbSession](../cdb/CdbSession.md#s-CdbSession)

Retrieves a CdbSession for writing CDB_OPERATIONAL database with the
 default locks if not defined by `#setWriteOperLocks(EnumSet)`

**Returns:** CdbSession

<a id="s-hasCdbSubscriber"></a>
### hasCdbSubscriber()

```java
public boolean hasCdbSubscriber()
```

<a id="s-idrefDerivedOrSelf"></a>
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

Types: [NavuNode](NavuNode.md#s-NavuNode), [ConfIdentityRef](../conf/ConfIdentityRef.md#s-ConfIdentityRef), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `com.tailf.conf.ConfIdentityRef base`
- `String fmt`
- `Object[] args`

<a id="s-initMaapiCursor"></a>
### initMaapiCursor(NavuNode, String, Object[])

```java
protected java.util.List<com.tailf.conf.ConfKey> initMaapiCursor(
    com.tailf.navu.NavuNode node,
    String fmt,
    Object[] arguments
)
    throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#s-ConfKey), [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String fmt`
- `Object[] arguments`

<a id="s-insert"></a>
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

Types: [NavuList](NavuList.md#s-NavuList), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuList navuList`
- `boolean createBackpointer`
- `String fmt`
- `Object[] args`

<a id="s-isActAsSuper"></a>
### isActAsSuper()

```java
protected boolean isActAsSuper()
```

<a id="s-isCdb"></a>
### isCdb()

```java
public boolean isCdb()
```

<a id="s-isCdbSession"></a>
### isCdbSession()

```java
public boolean isCdbSession()
```

<a id="s-isMaapi"></a>
### isMaapi()

```java
public boolean isMaapi()
```

**Returns:** true if the a Maapi context.

<a id="s-isOnline"></a>
### isOnline()

```java
public boolean isOnline()
```

<a id="s-moveOrdered"></a>
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

Types: [NavuNode](NavuNode.md#s-NavuNode), [MoveWhereFlag](../maapi/MoveWhereFlag.md#s-MoveWhereFlag), [ConfKey](../conf/ConfKey.md#s-ConfKey), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode list`
- `com.tailf.maapi.MoveWhereFlag whereTo`
- `com.tailf.conf.ConfKey to`
- `String fmt`
- `Object[] args`

<a id="s-numOfInstances"></a>
### numOfInstances(NavuNode)

```java
protected int numOfInstances(com.tailf.navu.NavuNode navuList) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode navuList`

<a id="s-removeCdbSessions"></a>
### removeCdbSessions()

```java
public void removeCdbSessions()
```

Clears all the CDB sessions associates with the mapping
 between the the supplied Cdb socket and the ( in CDB mode )

<a id="s-requestAction"></a>
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

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [NavuAction](NavuAction.md#s-NavuAction), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuAction action`
- `com.tailf.conf.ConfXMLParam[] params`
- `String fmt`
- `Object[] args`

<a id="s-set"></a>
### set(NavuContextBase)

```java
public void set(com.tailf.navu.NavuContextBase context)
```

Types: [NavuContextBase](NavuContextBase.md#s-NavuContextBase)

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

<a id="s-setElem"></a>
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

Types: [NavuNode](NavuNode.md#s-NavuNode), [ConfValue](../conf/ConfValue.md#s-ConfValue), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `com.tailf.conf.ConfValue val`
- `boolean shared`
- `String fmt`
- `Object[] args`

<a id="s-setElem-1"></a>
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

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `String strVal`
- `boolean shared`
- `String fmt`
- `Object[] args`

<a id="s-setMaapiHandle"></a>
### setMaapiHandle(int)

```java
protected void setMaapiHandle(int th)
```

**Parameters**

- `int th`

<a id="s-setOption"></a>
### setOption(UnSetCaseInChoice)

```java
public void setOption(com.tailf.navu.NavuContextBase.UnSetCaseInChoice unSetChoiceInCase)
```

Types: [UnSetCaseInChoice](NavuContextBase/UnSetCaseInChoice.md#s-UnSetCaseInChoice)

Set the behavior of how a unset case in choice should be
 treated.

**Parameters**

- `com.tailf.navu.NavuContextBase.UnSetCaseInChoice unSetChoiceInCase` - the specified option for behavior
                                        of unset case in choice

<a id="s-setReadConfLocks"></a>
### setReadConfLocks(EnumSet<CdbLockType>)

```java
public void setReadConfLocks(java.util.EnumSet<com.tailf.cdb.CdbLockType> locks)
```

Types: [CdbLockType](../cdb/CdbLockType.md#s-CdbLockType)

Sets the locks for a read CDB configuration data session
 Default is no locks.

**Parameters**

- `java.util.EnumSet<com.tailf.cdb.CdbLockType> locks`

<a id="s-setReadOperLocks"></a>
### setReadOperLocks(EnumSet<CdbLockType>)

```java
public void setReadOperLocks(java.util.EnumSet<com.tailf.cdb.CdbLockType> locks)
```

Types: [CdbLockType](../cdb/CdbLockType.md#s-CdbLockType)

Sets the locks for a read CDB operational data session
 Default is no locks.

**Parameters**

- `java.util.EnumSet<com.tailf.cdb.CdbLockType> locks`

<a id="s-setValues"></a>
### setValues(NavuNode, ConfXMLParam[], boolean)

```java
protected void setValues(
    com.tailf.navu.NavuNode node,
    com.tailf.conf.ConfXMLParam[] confXMLParams,
    boolean shared
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `com.tailf.conf.ConfXMLParam[] confXMLParams`
- `boolean shared`

<a id="s-setWriteOperLocks"></a>
### setWriteOperLocks(EnumSet<CdbLockType>)

```java
public void setWriteOperLocks(java.util.EnumSet<com.tailf.cdb.CdbLockType> locks)
```

Types: [CdbLockType](../cdb/CdbLockType.md#s-CdbLockType)

Sets the locks for a write CDB operational data session
 Default is EnumSet.of(CdbLockType.LOCK_REQUEST,CdbLockType.LOCK_PARTIAL)

**Parameters**

- `java.util.EnumSet<com.tailf.cdb.CdbLockType> locks`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

<a id="s-xpathEval"></a>
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

Types: [NavuXPathSelectResultSet](NavuXPathSelectResultSet.md#s-NavuXPathSelectResultSet), [MaapiXPathEvalTrace](../maapi/MaapiXPathEvalTrace.md#s-MaapiXPathEvalTrace), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuXPathSelectResultSet rs`
- `com.tailf.maapi.MaapiXPathEvalTrace trace`
- `String query`
- `Object initstate`
- `String keyPath`


## Nested Types

- [UnSetCaseInChoice](NavuContextBase/UnSetCaseInChoice.md)
