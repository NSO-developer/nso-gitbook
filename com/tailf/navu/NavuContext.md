<a id="s-NavuContext"></a>
# NavuContext

```java
public class com.tailf.navu.NavuContext
    extends com.tailf.navu.NavuContextBase
```

Types: [NavuContextBase](NavuContextBase.md#s-NavuContextBase)

This class controls how NAVU should read/write data to ncs.
 With data we mean configuration and/or operational data.

 All data (config/oper) can be read using a Maapi transaction
 towards the DB_RUNNING database. If this transaction is opened in
 MODE_READ_WRITE mode, then configuration data can be written with
 this same transaction.

 Another constructor [`NavuContext`](NavuContext.md#s-NavuContext) exists as an option.
 This constructor prepares a context and expects a [`Maapi`](../maapi/Maapi.md#s-Maapi) instance
 with a started user session. Before using this type of context it is
 mandatory to call either [`NavuContext`](NavuContext.md#s-NavuContext) or
 [`NavuContext`](NavuContext.md#s-NavuContext) to retrieve a maapi
 transaction.

 The user must manage the transaction which are started using the NavuContext.
 This can be done either by the user storing the retrieved transaction id
 and calling the low level Maapi methods
 [`Maapi`](../maapi/Maapi.md#s-Maapi) and/or
 [`Maapi`](../maapi/Maapi.md#s-Maapi) to commit and end the transaction.

 There are also a set of convenience methods in the NavuContext to handle
 the transaction like [`NavuContext`](NavuContext.md#s-NavuContext) and
 [`NavuContext`](NavuContext.md#s-NavuContext) etc.

 Using [`NavuContext`](NavuContext.md#s-NavuContext) is equivalent to using a
 context created with the [`NavuContext`](NavuContext.md#s-NavuContext) constructor which
 is kept for backward compatibility.

 A typical scenario using the [`NavuContext`](NavuContext.md#s-NavuContext) constructor
 would be something like.


```
      NavuContext context = new NavuContext(maapi);
      int th context.startRunningTrans(Conf.MODE_READ_WRITE);
      // if operational data should be written the above line should be
      // replaced with:
      // int th = context.startOperationalTrans(Conf.MODE_READ_WRITE);

      ... Using Navu ....

      context.applyClearTrans();
      // if nothing has been written to the transaction then nothing should
      // be applied and and following call should be used instead
      // context.finishClearTrans();
```

## Members

**Constructors**:

- [NavuContext(Maapi)](#s-NavuContext-1)
- [NavuContext(Maapi, int)](#s-NavuContext-2)

**Fields**:

- [unsetCaseInChoice](NavuContextBase.md#s-unsetCaseInChoice) from NavuContextBase

**Methods**:

- [applyClearTrans()](#s-applyClearTrans)
- [applyReplaceTrans()](#s-applyReplaceTrans)
- [aquireReadTh()](#s-aquireReadTh)
- [aquireWriteOperTh(boolean)](#s-aquireWriteOperTh)
- [aquireWriteRunTh()](#s-aquireWriteRunTh)
- [aquireWriteTh(NavuChoice)](#s-aquireWriteTh)
- [aquireWriteTh(NavuNode)](#s-aquireWriteTh-1)
- [aquireWriteTh(NavuNodeInfo)](#s-aquireWriteTh-2)
- [attachRunningTrans(int)](#s-attachRunningTrans)
- [clear()](#s-clear)
- [clearTrans()](#s-clearTrans)
- [copy(NavuContext)](#s-copy)
- [copy(NavuContextBase)](NavuContextBase.md#s-copy) from NavuContextBase
- [create(NavuNode, int, String, Object[])](#s-create)
- [delete(NavuNode, String, Object[])](#s-delete)
- [deref(NavuNode, String, Object[])](#s-deref)
- [detachRunningTrans()](#s-detachRunningTrans)
- [diffIterate(MaapiDiffIterate, NavuContext)](#s-diffIterate)
- [diffIterate(MaapiDiffIterate, NavuContextBase)](NavuContextBase.md#s-diffIterate) from NavuContextBase
- [exists(NavuNodeInfo, String, Object[])](#s-exists)
- [finishClearTrans()](#s-finishClearTrans)
- [getBackingStoreCdb()](NavuContextBase.md#s-getBackingStoreCdb) from NavuContextBase
- [getBackingStoreCdbSession()](NavuContextBase.md#s-getBackingStoreCdbSession) from NavuContextBase
- [getCase(NavuChoice, String, ConfPath)](#s-getCase)
- [getCdbSubscriber()](NavuContextBase.md#s-getCdbSubscriber) from NavuContextBase
- [getElem(NavuNode, String, Object[])](#s-getElem)
- [getLeafListIterator(NavuLeafList)](#s-getLeafListIterator)
- [getMaapi()](NavuContextBase.md#s-getMaapi) from NavuContextBase
- [getMaapiHandle()](NavuContextBase.md#s-getMaapiHandle) from NavuContextBase
- [getMountIdInterface()](#s-getMountIdInterface)
- [getNavuListIterator(NavuList)](#s-getNavuListIterator)
- [getNsList()](NavuContextBase.md#s-getNsList) from NavuContextBase
- [getReadConfSession()](NavuContextBase.md#s-getReadConfSession) from NavuContextBase
- [getReadOperSession()](NavuContextBase.md#s-getReadOperSession) from NavuContextBase
- [getValues(NavuNode, ConfXMLParam[])](#s-getValues)
- [getWriteConfSession()](NavuContextBase.md#s-getWriteConfSession) from NavuContextBase
- [getWriteOperSession()](NavuContextBase.md#s-getWriteOperSession) from NavuContextBase
- [hasCdbSubscriber()](NavuContextBase.md#s-hasCdbSubscriber) from NavuContextBase
- [idrefDerivedOrSelf(NavuNode, ConfIdentityRef, String, Object[])](#s-idrefDerivedOrSelf)
- [initMaapiCursor(NavuNode, String, Object[])](#s-initMaapiCursor)
- [insert(NavuList, boolean, String, Object[])](#s-insert)
- [isActAsSuper()](NavuContextBase.md#s-isActAsSuper) from NavuContextBase
- [isCdb()](NavuContextBase.md#s-isCdb) from NavuContextBase
- [isCdbSession()](NavuContextBase.md#s-isCdbSession) from NavuContextBase
- [isMaapi()](NavuContextBase.md#s-isMaapi) from NavuContextBase
- [isOnline()](NavuContextBase.md#s-isOnline) from NavuContextBase
- [moveOrdered(NavuNode, MoveWhereFlag, ConfKey, String, Object[])](#s-moveOrdered)
- [numOfInstances(NavuNode)](#s-numOfInstances)
- [releaseReadTh()](#s-releaseReadTh)
- [releaseWriteOperTh()](#s-releaseWriteOperTh)
- [releaseWriteRunTh()](#s-releaseWriteRunTh)
- [releaseWriteTh(NavuChoice)](#s-releaseWriteTh)
- [releaseWriteTh(NavuNode)](#s-releaseWriteTh-1)
- [releaseWriteTh(NavuNodeInfo)](#s-releaseWriteTh-2)
- [removeCdbSessions()](NavuContextBase.md#s-removeCdbSessions) from NavuContextBase
- [requestAction(NavuAction, ConfXMLParam[], String, Object[])](#s-requestAction)
- [set(NavuContext)](#s-set)
- [set(NavuContextBase)](NavuContextBase.md#s-set) from NavuContextBase
- [setElem(NavuNode, ConfValue, boolean, String, Object[])](#s-setElem)
- [setElem(NavuNode, String, boolean, String, Object[])](#s-setElem-1)
- [setMaapiHandle(int)](NavuContextBase.md#s-setMaapiHandle) from NavuContextBase
- [setOption(UnSetCaseInChoice)](NavuContextBase.md#s-setOption) from NavuContextBase
- [setReadConfLocks(EnumSet<CdbLockType>)](NavuContextBase.md#s-setReadConfLocks) from NavuContextBase
- [setReadOperLocks(EnumSet<CdbLockType>)](NavuContextBase.md#s-setReadOperLocks) from NavuContextBase
- [setValues(NavuNode, ConfXMLParam[], boolean)](#s-setValues)
- [setWriteOperLocks(EnumSet<CdbLockType>)](NavuContextBase.md#s-setWriteOperLocks) from NavuContextBase
- [shareReadTh()](#s-shareReadTh)
- [startOperationalTrans(int)](#s-startOperationalTrans)
- [startOperationalTrans(int, String, String, String, String)](#s-startOperationalTrans-1)
- [startPreCommitRunningTrans()](#s-startPreCommitRunningTrans)
- [startPreCommitRunningTrans(String, String, String, String)](#s-startPreCommitRunningTrans-1)
- [startRunningTrans(int)](#s-startRunningTrans)
- [startRunningTrans(int, String, String, String, String)](#s-startRunningTrans-1)
- [toString()](#s-toString)
- [xpathEval(NavuXPathSelectResultSet, MaapiXPathEvalTrace, String, Object, String)](#s-xpathEval)

**Nested Types**:

- [DataMode](NavuContext/DataMode.md#s-DataMode)

## Constructors

<a id="s-NavuContext-1"></a>
### NavuContext(Maapi)

```java
public NavuContext(com.tailf.maapi.Maapi m)
```

Types: [Maapi](../maapi/Maapi.md#s-Maapi)

This constructor prepares a context to be used with a maapi transaction
 towards either [`Conf`](../conf/Conf.md#s-Conf) or [`Conf`](../conf/Conf.md#s-Conf).
 This transactions has to be started with one of
 [`NavuContext`](NavuContext.md#s-NavuContext) or
 [`NavuContext`](NavuContext.md#s-NavuContext) before the context can
 be used in NAVU.

**Parameters**

- `com.tailf.maapi.Maapi m` - the `Maapi` instance to be used

<a id="s-NavuContext-2"></a>
### NavuContext(Maapi, int)

```java
public NavuContext(com.tailf.maapi.Maapi m, int confTh)
```

Types: [Maapi](../maapi/Maapi.md#s-Maapi)

Constructor for running NAVU with a transaction towards DB_RUNNING.

 If the supplied transaction is opened with MODE_READ, then both
 config and oper data can be read but no data can be written.
 If instead the supplied transaction is opened in MODE_READ_WRITE
 the config data can be both read and written while operational data only
 can be read.

**Parameters**

- `com.tailf.maapi.Maapi m` - the `Maapi` instance to be used
- `int confTh` - the transaction handle towards DB_RUNNING used for
 this `NavuContext`


## Methods

<a id="s-applyClearTrans"></a>
### applyClearTrans()

```java
public synchronized void applyClearTrans() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

This method applies any changes in this transaction (Commit) using
 [`Maapi`](../maapi/Maapi.md#s-Maapi). Afterwards the transaction is
 finished using [`Maapi`](../maapi/Maapi.md#s-Maapi) and cleared form this
 NavuContext.

 After apply and clear of the transaction using this method
 it is possible to start a new transaction using
 `#startRunningTrans(int)` or `#startOperationalTrans(int)`.

 If no new transaction is started further navigation with this context
 will not be possible.

 finishes the transaction. The NavuConn

**Throws**

- `NavuException`

<a id="s-applyReplaceTrans"></a>
### applyReplaceTrans()

```java
public synchronized void applyReplaceTrans() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

This method applies (commit) and finish the transaction using
 [`Maapi`](../maapi/Maapi.md#s-Maapi)
 and [`Maapi`](../maapi/Maapi.md#s-Maapi).
 Afterwards an new transaction of same type (operational or running) and
 mode ([`Conf`](../conf/Conf.md#s-Conf) or [`Conf`](../conf/Conf.md#s-Conf)) is created
 and replaces the old applied transaction.

 Hence, navigation using this context can be resumed directly after
 this method call.
 Note, however that the depending of the committed transaction the
 Navu tree migth or migth not be up to date. There is no automatic sync
 or validation of the present Navu tree against the new transaction.

**Throws**

- `NavuException`

<a id="s-aquireReadTh"></a>
### aquireReadTh()

```java
protected int aquireReadTh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

<a id="s-aquireWriteOperTh"></a>
### aquireWriteOperTh(boolean)

```java
protected int aquireWriteOperTh(boolean isWriteAll) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `boolean isWriteAll`

<a id="s-aquireWriteRunTh"></a>
### aquireWriteRunTh()

```java
protected int aquireWriteRunTh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

<a id="s-aquireWriteTh"></a>
### aquireWriteTh(NavuChoice)

```java
protected int aquireWriteTh(com.tailf.navu.NavuChoice nchoice) throws com.tailf.navu.NavuException
```

Types: [NavuChoice](NavuChoice.md#s-NavuChoice), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuChoice nchoice`

<a id="s-aquireWriteTh-1"></a>
### aquireWriteTh(NavuNode)

```java
protected int aquireWriteTh(com.tailf.navu.NavuNode node) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`

<a id="s-aquireWriteTh-2"></a>
### aquireWriteTh(NavuNodeInfo)

```java
protected int aquireWriteTh(com.tailf.navu.NavuNodeInfo ninfo) throws com.tailf.navu.NavuException
```

Types: [NavuNodeInfo](NavuNodeInfo.md#s-NavuNodeInfo), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNodeInfo ninfo`

<a id="s-attachRunningTrans"></a>
### attachRunningTrans(int)

```java
public void attachRunningTrans(int th) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Attach an existing transaction towards the [`Conf`](../conf/Conf.md#s-Conf)
 database to be used in the context.

 Because the transaction is attached and not started by the NavuContext
 no finish or apply operations are allowed from the context.

 For example the `#finishClearTrans()` will throw an exception
 for this type of context.

**Parameters**

- `int th` - transaction id

**Throws**

- `NavuException`

<a id="s-clear"></a>
### clear()

```java
protected void clear()
```

Clears all connection attributes.

<a id="s-clearTrans"></a>
### clearTrans()

```java
public synchronized int clearTrans() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Clears the internal transaction defined by
 `#startRunningTrans(int)` or `#startOperationalTrans(int)`
 The previous transaction id if any is returned but left unattended.
 If the transaction needs to be committed or finished this has to be
 performed outside of Navu.

 After clearing the transaction it is possible to start a new
 transaction using
 `#startRunningTrans(int)` or `#startOperationalTrans(int)`.

 If no new transaction is started further navigation with this context
 will not be possible.

**Returns:** the previous transaction id or -1 if no transaction was started

**Throws**

- `NavuException`

<a id="s-copy"></a>
### copy(NavuContext)

```java
protected void copy(com.tailf.navu.NavuContext context)
```

Types: [NavuContext](NavuContext.md#s-NavuContext)

Copy the contents of a context.

**Parameters**

- `com.tailf.navu.NavuContext context`

<a id="s-create"></a>
### create(NavuNode, int, String, Object[])

```java
protected synchronized void create(
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
protected synchronized void delete(
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
protected synchronized java.util.List<com.tailf.navu.NavuNode> deref(
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

<a id="s-detachRunningTrans"></a>
### detachRunningTrans()

```java
public void detachRunningTrans() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

For an context with an attached transaction using
 `#attachRunningTrans(int)` this method will detach
 the transaction from the NavuContext maapi instance

**Throws**

- `NavuException`

<a id="s-diffIterate"></a>
### diffIterate(MaapiDiffIterate, NavuContext)

```java
protected synchronized void diffIterate(
    com.tailf.maapi.MaapiDiffIterate iter,
    com.tailf.navu.NavuContext delContext
)
    throws com.tailf.navu.NavuException
```

Types: [MaapiDiffIterate](../maapi/MaapiDiffIterate.md#s-MaapiDiffIterate), [NavuContext](NavuContext.md#s-NavuContext), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.maapi.MaapiDiffIterate iter`
- `com.tailf.navu.NavuContext delContext`

<a id="s-exists"></a>
### exists(NavuNodeInfo, String, Object[])

```java
public synchronized boolean exists(
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

<a id="s-finishClearTrans"></a>
### finishClearTrans()

```java
public synchronized void finishClearTrans() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Finishes current trans using [`Maapi`](../maapi/Maapi.md#s-Maapi) and
 clears the trans from this NavuContext.

 After finish and clear of the transaction using this method
 it is possible to start a new transaction using
 `#startRunningTrans(int)` or `#startOperationalTrans(int)`.

 If no new transaction is started further navigation with this context
 will not be possible.

**Throws**

- `NavuException`

<a id="s-getCase"></a>
### getCase(NavuChoice, String, ConfPath)

```java
protected synchronized com.tailf.conf.ConfTag getCase(
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

<a id="s-getElem"></a>
### getElem(NavuNode, String, Object[])

```java
protected synchronized com.tailf.conf.ConfValue getElem(
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
protected synchronized com.tailf.navu.NavuLeafListIterator getLeafListIterator(
    com.tailf.navu.NavuLeafList navuLeafList
)
    throws com.tailf.navu.NavuException
```

Types: [NavuLeafListIterator](NavuLeafListIterator.md#s-NavuLeafListIterator), [NavuLeafList](NavuLeafList.md#s-NavuLeafList), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuLeafList navuLeafList`

<a id="s-getMountIdInterface"></a>
### getMountIdInterface()

```java
public com.tailf.conf.MountIdInterface getMountIdInterface()
```

Types: [MountIdInterface](../conf/MountIdInterface.md#s-MountIdInterface)

<a id="s-getNavuListIterator"></a>
### getNavuListIterator(NavuList)

```java
protected synchronized com.tailf.navu.NavuListEntryIterator getNavuListIterator(
    com.tailf.navu.NavuList navuList
)
    throws com.tailf.navu.NavuException
```

Types: [NavuListEntryIterator](NavuListEntryIterator.md#s-NavuListEntryIterator), [NavuList](NavuList.md#s-NavuList), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuList navuList`

<a id="s-getValues"></a>
### getValues(NavuNode, ConfXMLParam[])

```java
protected synchronized com.tailf.conf.ConfXMLParam[] getValues(
    com.tailf.navu.NavuNode node,
    com.tailf.conf.ConfXMLParam[] confXMLPs
)
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `com.tailf.conf.ConfXMLParam[] confXMLPs`

<a id="s-idrefDerivedOrSelf"></a>
### idrefDerivedOrSelf(NavuNode, ConfIdentityRef, String, Object[])

```java
protected synchronized boolean idrefDerivedOrSelf(
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
protected synchronized java.util.List<com.tailf.conf.ConfKey> initMaapiCursor(
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
protected synchronized void insert(
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

<a id="s-moveOrdered"></a>
### moveOrdered(NavuNode, MoveWhereFlag, ConfKey, String, Object[])

```java
protected synchronized void moveOrdered(
    com.tailf.navu.NavuNode navuList,
    com.tailf.maapi.MoveWhereFlag whereTo,
    com.tailf.conf.ConfKey to,
    String fmt,
    Object[] args
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [MoveWhereFlag](../maapi/MoveWhereFlag.md#s-MoveWhereFlag), [ConfKey](../conf/ConfKey.md#s-ConfKey), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode navuList`
- `com.tailf.maapi.MoveWhereFlag whereTo`
- `com.tailf.conf.ConfKey to`
- `String fmt`
- `Object[] args`

<a id="s-numOfInstances"></a>
### numOfInstances(NavuNode)

```java
protected synchronized int numOfInstances(
    com.tailf.navu.NavuNode navuList
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode navuList`

<a id="s-releaseReadTh"></a>
### releaseReadTh()

```java
protected void releaseReadTh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

<a id="s-releaseWriteOperTh"></a>
### releaseWriteOperTh()

```java
protected void releaseWriteOperTh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

<a id="s-releaseWriteRunTh"></a>
### releaseWriteRunTh()

```java
protected void releaseWriteRunTh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

<a id="s-releaseWriteTh"></a>
### releaseWriteTh(NavuChoice)

```java
protected void releaseWriteTh(com.tailf.navu.NavuChoice nchoice) throws com.tailf.navu.NavuException
```

Types: [NavuChoice](NavuChoice.md#s-NavuChoice), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuChoice nchoice`

<a id="s-releaseWriteTh-1"></a>
### releaseWriteTh(NavuNode)

```java
protected void releaseWriteTh(com.tailf.navu.NavuNode node) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`

<a id="s-releaseWriteTh-2"></a>
### releaseWriteTh(NavuNodeInfo)

```java
protected void releaseWriteTh(com.tailf.navu.NavuNodeInfo ninfo) throws com.tailf.navu.NavuException
```

Types: [NavuNodeInfo](NavuNodeInfo.md#s-NavuNodeInfo), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNodeInfo ninfo`

<a id="s-requestAction"></a>
### requestAction(NavuAction, ConfXMLParam[], String, Object[])

```java
protected synchronized com.tailf.conf.ConfXMLParam[] requestAction(
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
### set(NavuContext)

```java
public synchronized void set(com.tailf.navu.NavuContext context)
```

Types: [NavuContext](NavuContext.md#s-NavuContext)

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

- `com.tailf.navu.NavuContext context`

<a id="s-setElem"></a>
### setElem(NavuNode, ConfValue, boolean, String, Object[])

```java
protected synchronized void setElem(
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
protected synchronized com.tailf.conf.ConfValue setElem(
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

<a id="s-setValues"></a>
### setValues(NavuNode, ConfXMLParam[], boolean)

```java
protected synchronized void setValues(
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

<a id="s-shareReadTh"></a>
### shareReadTh()

```java
protected int shareReadTh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

<a id="s-startOperationalTrans"></a>
### startOperationalTrans(int)

```java
public synchronized int startOperationalTrans(int mode) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

This method starts a transaction towards the [`Conf`](../conf/Conf.md#s-Conf)
 database to be used in the context.

 This method or its counterpart `#startRunningTrans(int)` is
 mandatory to call for a context created by the
 [`NavuContext`](NavuContext.md#s-NavuContext) constructor before the context is
 being used in NAVU.

 Calling this method on contexts that already started an transaction will
 throw an NavuException.
 The user will need to manage the started transaction (apply/finish).

**Parameters**

- `int mode` - one of [`Conf`](../conf/Conf.md#s-Conf), [`Conf`](../conf/Conf.md#s-Conf)

**Returns:** transaction id for the started transaction

**Throws**

- `NavuException`

<a id="s-startOperationalTrans-1"></a>
### startOperationalTrans(int, String, String, String, String)

```java
public synchronized int startOperationalTrans(
    int mode,
    String vendor,
    String product,
    String version,
    String clientId
)
    throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `int mode`
- `String vendor`
- `String product`
- `String version`
- `String clientId`

<a id="s-startPreCommitRunningTrans"></a>
### startPreCommitRunningTrans()

```java
public synchronized int startPreCommitRunningTrans() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

This method starts a transaction towards the PRE_COMMIT_RUNNING
 datastore. This datastore only exists between a
 [`CdbSubscription`](../cdb/CdbSubscription.md#s-CdbSubscription) and the following
 [`CdbSubscription`](../cdb/CdbSubscription.md#s-CdbSubscription).

 The normal use for this transaction type is to be used in a
 diffIteration where the operation is
 [`DiffIterateOperFlag`](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag) and the deleted
 data values are of interest.

 This datastore can only be open in [`Conf`](../conf/Conf.md#s-Conf)
 Calling this method on contexts that already started an transaction will
 throw an NavuException.
 The user will need to manage the finish of this transaction.

**Returns:** transaction id for the started transaction

**Throws**

- `NavuException`

<a id="s-startPreCommitRunningTrans-1"></a>
### startPreCommitRunningTrans(String, String, String, String)

```java
public synchronized int startPreCommitRunningTrans(
    String vendor,
    String product,
    String version,
    String clientId
)
    throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `String vendor`
- `String product`
- `String version`
- `String clientId`

<a id="s-startRunningTrans"></a>
### startRunningTrans(int)

```java
public synchronized int startRunningTrans(int mode) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

This method starts a transaction towards the [`Conf`](../conf/Conf.md#s-Conf)
 database to be used in the context.

 This method or its counterpart `#startOperationalTrans(int)` is
 mandatory to call for a context created by the
 [`NavuContext`](NavuContext.md#s-NavuContext) constructor before the context is
 being used in NAVU.

 Calling this method on contexts that already started an transaction will
 throw an NavuException.
 The user will need to manage the started transaction (apply/finish).

**Parameters**

- `int mode` - one of [`Conf`](../conf/Conf.md#s-Conf), [`Conf`](../conf/Conf.md#s-Conf)

**Returns:** transaction id for the started transaction

**Throws**

- `NavuException`

<a id="s-startRunningTrans-1"></a>
### startRunningTrans(int, String, String, String, String)

```java
public synchronized int startRunningTrans(
    int mode,
    String vendor,
    String product,
    String version,
    String clientId
)
    throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `int mode`
- `String vendor`
- `String product`
- `String version`
- `String clientId`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

<a id="s-xpathEval"></a>
### xpathEval(NavuXPathSelectResultSet, MaapiXPathEvalTrace, String, Object, String)

```java
protected synchronized void xpathEval(
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

- [DataMode](NavuContext/DataMode.md)
