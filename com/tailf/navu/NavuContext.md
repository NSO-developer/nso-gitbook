<a id="cls-NavuContext"></a>
# NavuContext

```java
public class com.tailf.navu.NavuContext
    extends com.tailf.navu.NavuContextBase
```

Types: [NavuContextBase](NavuContextBase.md#cls-NavuContextBase)

This class controls how NAVU should read/write data to ncs.
 With data we mean configuration and/or operational data.

 All data (config/oper) can be read using a Maapi transaction
 towards the DB_RUNNING database. If this transaction is opened in
 MODE_READ_WRITE mode, then configuration data can be written with
 this same transaction.

 Another constructor [`NavuContext#NavuContext(Maapi)`](NavuContext.md#m-navucontext-af99f9cc97c7) exists as an option.
 This constructor prepares a context and expects a [`Maapi`](../maapi/Maapi.md#cls-Maapi) instance
 with a started user session. Before using this type of context it is
 mandatory to call either [`NavuContext#startRunningTrans(int)`](NavuContext.md#m-startrunningtrans-f44b804de65a) or
 [`NavuContext#startOperationalTrans(int)`](NavuContext.md#m-startoperationaltrans-9d10bde402ce) to retrieve a maapi
 transaction.

 The user must manage the transaction which are started using the NavuContext.
 This can be done either by the user storing the retrieved transaction id
 and calling the low level Maapi methods
 [`Maapi#applyTrans(int, boolean)`](../maapi/Maapi.md#m-applytrans-94f52f2648ce) and/or
 [`Maapi#finishTrans(int)`](../maapi/Maapi.md#m-finishtrans-0f920518d3c3) to commit and end the transaction.

 There are also a set of convenience methods in the NavuContext to handle
 the transaction like [`NavuContext#applyClearTrans()`](NavuContext.md#m-applycleartrans-3f1898cf9189) and
 [`NavuContext#finishClearTrans()`](NavuContext.md#m-finishcleartrans-0f9c689756ea) etc.

 Using [`NavuContext#startRunningTrans(int)`](NavuContext.md#m-startrunningtrans-f44b804de65a) is equivalent to using a
 context created with the [`NavuContext#NavuContext(Maapi, int)`](NavuContext.md#m-navucontext-08f21a9fb7b4) constructor which
 is kept for backward compatibility.

 A typical scenario using the [`NavuContext#NavuContext(Maapi)`](NavuContext.md#m-navucontext-af99f9cc97c7) constructor
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

- [NavuContext(Maapi)](#m-navucontext-af99f9cc97c7)
- [NavuContext(Maapi, int)](#m-navucontext-08f21a9fb7b4)

**Fields**:

- [unsetCaseInChoice](NavuContextBase.md#m-unsetCaseInChoice) from NavuContextBase

**Methods**:

- [applyClearTrans()](#m-applycleartrans-3f1898cf9189)
- [applyReplaceTrans()](#m-applyreplacetrans-8ed9b5f50308)
- [aquireReadTh()](#m-aquirereadth-cbeb80470556)
- [aquireWriteOperTh(boolean)](#m-aquirewriteoperth-70cdc82b9bd7)
- [aquireWriteRunTh()](#m-aquirewriterunth-f1dd7d07d6f1)
- [aquireWriteTh(NavuChoice)](#m-aquirewriteth-94557404af59)
- [aquireWriteTh(NavuNode)](#m-aquirewriteth-f4016b4db5b6)
- [aquireWriteTh(NavuNodeInfo)](#m-aquirewriteth-4f4b47d2a03a)
- [attachRunningTrans(int)](#m-attachrunningtrans-7c31c137d0c7)
- [clear()](#m-clear-ca3baec040cb)
- [clearTrans()](#m-cleartrans-bdef1d47dfdf)
- [copy(NavuContext)](#m-copy-87eecbcd063a)
- [copy(NavuContextBase)](NavuContextBase.md#m-copy-7436fcb6cfc1) from NavuContextBase
- [create(NavuNode, int, String, Object[])](#m-create-df02612e3971)
- [delete(NavuNode, String, Object[])](#m-delete-63a54ea2de30)
- [deref(NavuNode, String, Object[])](#m-deref-ae39a7d6fdde)
- [detachRunningTrans()](#m-detachrunningtrans-e735bed11543)
- [diffIterate(MaapiDiffIterate, NavuContext)](#m-diffiterate-4cc73971858b)
- [diffIterate(MaapiDiffIterate, NavuContextBase)](NavuContextBase.md#m-diffiterate-a6cc344016cf) from NavuContextBase
- [finishClearTrans()](#m-finishcleartrans-0f9c689756ea)
- [getBackingStoreCdb()](NavuContextBase.md#m-getbackingstorecdb-73329cf7d4e1) from NavuContextBase
- [getBackingStoreCdbSession()](NavuContextBase.md#m-getbackingstorecdbsession-8b0ef17e8ea3) from NavuContextBase
- [getCase(NavuChoice, String, ConfPath)](#m-getcase-653069cc39c6)
- [getCdbSubscriber()](NavuContextBase.md#m-getcdbsubscriber-f292c8c67d4d) from NavuContextBase
- [getElem(NavuNode, String, Object[])](#m-getelem-99bc0267bad6)
- [getLeafListIterator(NavuLeafList)](#m-getleaflistiterator-7174ac6a32ca)
- [getMaapi()](NavuContextBase.md#m-getmaapi-0ce8975d8ec6) from NavuContextBase
- [getMaapiHandle()](NavuContextBase.md#m-getmaapihandle-ba447f5d4e3f) from NavuContextBase
- [getMountIdInterface()](#m-getmountidinterface-2aa19a564366)
- [getNavuListIterator(NavuList)](#m-getnavulistiterator-c0c49395e08e)
- [getNsList()](NavuContextBase.md#m-getnslist-0345f486e876) from NavuContextBase
- [getReadConfSession()](NavuContextBase.md#m-getreadconfsession-ece7e5773db9) from NavuContextBase
- [getReadOperSession()](NavuContextBase.md#m-getreadopersession-7e103aba03ba) from NavuContextBase
- [getValues(NavuNode, ConfXMLParam[])](#m-getvalues-ecb3f8096a7c)
- [getWriteConfSession()](NavuContextBase.md#m-getwriteconfsession-a042057a7cb8) from NavuContextBase
- [getWriteOperSession()](NavuContextBase.md#m-getwriteopersession-eb5d274da267) from NavuContextBase
- [hasCdbSubscriber()](NavuContextBase.md#m-hascdbsubscriber-3650a7c55283) from NavuContextBase
- [idrefDerivedOrSelf(NavuNode, ConfIdentityRef, String, Object[])](#m-idrefderivedorself-6a08c9a390be)
- [initMaapiCursor(NavuNode, String, Object[])](#m-initmaapicursor-dfdad1aa4163)
- [insert(NavuList, boolean, String, Object[])](#m-insert-55bd5e6f415f)
- [isActAsSuper()](NavuContextBase.md#m-isactassuper-ce02ade4553b) from NavuContextBase
- [isCdb()](NavuContextBase.md#m-iscdb-20ec16d14862) from NavuContextBase
- [isCdbSession()](NavuContextBase.md#m-iscdbsession-71fe8b2aab5d) from NavuContextBase
- [isMaapi()](NavuContextBase.md#m-ismaapi-5c500ef256ce) from NavuContextBase
- [isOnline()](NavuContextBase.md#m-isonline-90688b264b83) from NavuContextBase
- [moveOrdered(NavuNode, MoveWhereFlag, ConfKey, String, Object[])](#m-moveordered-373c795909ce)
- [numOfInstances(NavuNode)](#m-numofinstances-d5b1fc4e65c9)
- [releaseReadTh()](#m-releasereadth-d8af0d751903)
- [releaseWriteOperTh()](#m-releasewriteoperth-c449c5895f07)
- [releaseWriteRunTh()](#m-releasewriterunth-f866e93a678c)
- [releaseWriteTh(NavuChoice)](#m-releasewriteth-42da0aac3b34)
- [releaseWriteTh(NavuNode)](#m-releasewriteth-2f10aa89af15)
- [releaseWriteTh(NavuNodeInfo)](#m-releasewriteth-a3f7338814e0)
- [removeCdbSessions()](NavuContextBase.md#m-removecdbsessions-71502a05a702) from NavuContextBase
- [requestAction(NavuAction, ConfXMLParam[], String, Object[])](#m-requestaction-164fcf6d0208)
- [set(NavuContext)](#m-set-a96f2680982e)
- [set(NavuContextBase)](NavuContextBase.md#m-set-aa955bb80732) from NavuContextBase
- [setElem(NavuNode, ConfValue, boolean, String, Object[])](#m-setelem-0daaa25a8e50)
- [setElem(NavuNode, String, boolean, String, Object[])](#m-setelem-e887291ef6b0)
- [setMaapiHandle(int)](NavuContextBase.md#m-setmaapihandle-62fe88de5765) from NavuContextBase
- [setOption(UnSetCaseInChoice)](NavuContextBase.md#m-setoption-13f7d349ceea) from NavuContextBase
- [setReadConfLocks(EnumSet<CdbLockType>)](NavuContextBase.md#m-setreadconflocks-43f86af9b510) from NavuContextBase
- [setReadOperLocks(EnumSet<CdbLockType>)](NavuContextBase.md#m-setreadoperlocks-9c615c121ad2) from NavuContextBase
- [setValues(NavuNode, ConfXMLParam[], boolean)](#m-setvalues-8ac6838a32ab)
- [setWriteOperLocks(EnumSet<CdbLockType>)](NavuContextBase.md#m-setwriteoperlocks-d3a3d78b7d7d) from NavuContextBase
- [shareReadTh()](#m-sharereadth-00bb7605f233)
- [startOperationalTrans(int)](#m-startoperationaltrans-9d10bde402ce)
- [startOperationalTrans(int, String, String, String, String)](#m-startoperationaltrans-f0b7896eb7ea)
- [startPreCommitRunningTrans()](#m-startprecommitrunningtrans-1608c1c0d9e6)
- [startPreCommitRunningTrans(String, String, String, String)](#m-startprecommitrunningtrans-a6bcef757ab6)
- [startRunningTrans(int)](#m-startrunningtrans-f44b804de65a)
- [startRunningTrans(int, String, String, String, String)](#m-startrunningtrans-0b37ed6a4aa8)
- [toString()](#m-tostring-e9d48c5503ef)
- [xpathEval(NavuXPathSelectResultSet, MaapiXPathEvalTrace, String, Object, String)](#m-xpatheval-9750f496e526)

**Nested Types**:

- [DataMode](NavuContext/DataMode.md#cls-DataMode)

## Constructors

<a id="m-navucontext-af99f9cc97c7"></a>
### NavuContext(Maapi)

```java
public NavuContext(com.tailf.maapi.Maapi m)
```

Types: [Maapi](../maapi/Maapi.md#cls-Maapi)

This constructor prepares a context to be used with a maapi transaction
 towards either [`Conf#DB_RUNNING`](../conf/Conf.md#m-DB_RUNNING) or [`Conf#DB_OPERATIONAL`](../conf/Conf.md#m-DB_OPERATIONAL).
 This transactions has to be started with one of
 [`NavuContext#startRunningTrans(int)`](NavuContext.md#m-startrunningtrans-f44b804de65a) or
 [`NavuContext#startOperationalTrans(int)`](NavuContext.md#m-startoperationaltrans-9d10bde402ce) before the context can
 be used in NAVU.

**Parameters**

- `com.tailf.maapi.Maapi m` - the `Maapi` instance to be used

<a id="m-navucontext-08f21a9fb7b4"></a>
### NavuContext(Maapi, int)

```java
public NavuContext(com.tailf.maapi.Maapi m, int confTh)
```

Types: [Maapi](../maapi/Maapi.md#cls-Maapi)

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

<a id="m-applycleartrans-3f1898cf9189"></a>
### applyClearTrans()

```java
public synchronized void applyClearTrans() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

This method applies any changes in this transaction (Commit) using
 [`Maapi#applyTrans(int, boolean)`](../maapi/Maapi.md#m-applytrans-94f52f2648ce). Afterwards the transaction is
 finished using [`Maapi#finishTrans(int)`](../maapi/Maapi.md#m-finishtrans-0f920518d3c3) and cleared form this
 NavuContext.

 After apply and clear of the transaction using this method
 it is possible to start a new transaction using
 `#startRunningTrans(int)` or `#startOperationalTrans(int)`.

 If no new transaction is started further navigation with this context
 will not be possible.

 finishes the transaction. The NavuConn

**Throws**

- `NavuException`

<a id="m-applyreplacetrans-8ed9b5f50308"></a>
### applyReplaceTrans()

```java
public synchronized void applyReplaceTrans() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

This method applies (commit) and finish the transaction using
 [`Maapi#applyTrans(int, boolean)`](../maapi/Maapi.md#m-applytrans-94f52f2648ce)
 and [`Maapi#finishTrans(int)`](../maapi/Maapi.md#m-finishtrans-0f920518d3c3).
 Afterwards an new transaction of same type (operational or running) and
 mode ([`Conf#MODE_READ`](../conf/Conf.md#m-MODE_READ) or [`Conf#MODE_READ_WRITE`](../conf/Conf.md#m-MODE_READ_WRITE)) is created
 and replaces the old applied transaction.

 Hence, navigation using this context can be resumed directly after
 this method call.
 Note, however that the depending of the committed transaction the
 Navu tree migth or migth not be up to date. There is no automatic sync
 or validation of the present Navu tree against the new transaction.

**Throws**

- `NavuException`

<a id="m-aquirereadth-cbeb80470556"></a>
### aquireReadTh()

```java
protected int aquireReadTh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

<a id="m-aquirewriteoperth-70cdc82b9bd7"></a>
### aquireWriteOperTh(boolean)

```java
protected int aquireWriteOperTh(boolean isWriteAll) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `boolean isWriteAll`

<a id="m-aquirewriterunth-f1dd7d07d6f1"></a>
### aquireWriteRunTh()

```java
protected int aquireWriteRunTh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

<a id="m-aquirewriteth-94557404af59"></a>
### aquireWriteTh(NavuChoice)

```java
protected int aquireWriteTh(com.tailf.navu.NavuChoice nchoice) throws com.tailf.navu.NavuException
```

Types: [NavuChoice](NavuChoice.md#cls-NavuChoice), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuChoice nchoice`

<a id="m-aquirewriteth-f4016b4db5b6"></a>
### aquireWriteTh(NavuNode)

```java
protected int aquireWriteTh(com.tailf.navu.NavuNode node) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`

<a id="m-aquirewriteth-4f4b47d2a03a"></a>
### aquireWriteTh(NavuNodeInfo)

```java
protected int aquireWriteTh(com.tailf.navu.NavuNodeInfo ninfo) throws com.tailf.navu.NavuException
```

Types: [NavuNodeInfo](NavuNodeInfo.md#cls-NavuNodeInfo), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNodeInfo ninfo`

<a id="m-attachrunningtrans-7c31c137d0c7"></a>
### attachRunningTrans(int)

```java
public void attachRunningTrans(int th) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Attach an existing transaction towards the [`Conf#DB_RUNNING`](../conf/Conf.md#m-DB_RUNNING)
 database to be used in the context.

 Because the transaction is attached and not started by the NavuContext
 no finish or apply operations are allowed from the context.

 For example the `#finishClearTrans()` will throw an exception
 for this type of context.

**Parameters**

- `int th` - transaction id

**Throws**

- `NavuException`

<a id="m-clear-ca3baec040cb"></a>
### clear()

```java
protected void clear()
```

Clears all connection attributes.

<a id="m-cleartrans-bdef1d47dfdf"></a>
### clearTrans()

```java
public synchronized int clearTrans() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

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

<a id="m-copy-87eecbcd063a"></a>
### copy(NavuContext)

```java
protected void copy(com.tailf.navu.NavuContext context)
```

Types: [NavuContext](NavuContext.md#cls-NavuContext)

Copy the contents of a context.

**Parameters**

- `com.tailf.navu.NavuContext context`

<a id="m-create-df02612e3971"></a>
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

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `int how`
- `String fmt`
- `Object[] args`

<a id="m-delete-63a54ea2de30"></a>
### delete(NavuNode, String, Object[])

```java
protected synchronized void delete(
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
protected synchronized java.util.List<com.tailf.navu.NavuNode> deref(
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

<a id="m-detachrunningtrans-e735bed11543"></a>
### detachRunningTrans()

```java
public void detachRunningTrans() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

For an context with an attached transaction using
 `#attachRunningTrans(int)` this method will detach
 the transaction from the NavuContext maapi instance

**Throws**

- `NavuException`

<a id="m-diffiterate-4cc73971858b"></a>
### diffIterate(MaapiDiffIterate, NavuContext)

```java
protected synchronized void diffIterate(
    com.tailf.maapi.MaapiDiffIterate iter,
    com.tailf.navu.NavuContext delContext
)
    throws com.tailf.navu.NavuException
```

Types: [MaapiDiffIterate](../maapi/MaapiDiffIterate.md#cls-MaapiDiffIterate), [NavuContext](NavuContext.md#cls-NavuContext), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.maapi.MaapiDiffIterate iter`
- `com.tailf.navu.NavuContext delContext`

<a id="m-finishcleartrans-0f9c689756ea"></a>
### finishClearTrans()

```java
public synchronized void finishClearTrans() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Finishes current trans using [`Maapi#finishTrans(int)`](../maapi/Maapi.md#m-finishtrans-0f920518d3c3) and
 clears the trans from this NavuContext.

 After finish and clear of the transaction using this method
 it is possible to start a new transaction using
 `#startRunningTrans(int)` or `#startOperationalTrans(int)`.

 If no new transaction is started further navigation with this context
 will not be possible.

**Throws**

- `NavuException`

<a id="m-getcase-653069cc39c6"></a>
### getCase(NavuChoice, String, ConfPath)

```java
protected synchronized com.tailf.conf.ConfTag getCase(
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

<a id="m-getelem-99bc0267bad6"></a>
### getElem(NavuNode, String, Object[])

```java
protected synchronized com.tailf.conf.ConfValue getElem(
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
protected synchronized com.tailf.navu.NavuLeafListIterator getLeafListIterator(
    com.tailf.navu.NavuLeafList navuLeafList
)
    throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#cls-NavuLeafList), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuLeafList navuLeafList`

<a id="m-getmountidinterface-2aa19a564366"></a>
### getMountIdInterface()

```java
public com.tailf.conf.MountIdInterface getMountIdInterface()
```

Types: [MountIdInterface](../conf/MountIdInterface.md#cls-MountIdInterface)

<a id="m-getnavulistiterator-c0c49395e08e"></a>
### getNavuListIterator(NavuList)

```java
protected synchronized com.tailf.navu.NavuListEntryIterator getNavuListIterator(
    com.tailf.navu.NavuList navuList
)
    throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#cls-NavuList), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuList navuList`

<a id="m-getvalues-ecb3f8096a7c"></a>
### getValues(NavuNode, ConfXMLParam[])

```java
protected synchronized com.tailf.conf.ConfXMLParam[] getValues(
    com.tailf.navu.NavuNode node,
    com.tailf.conf.ConfXMLParam[] confXMLPs
)
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `com.tailf.conf.ConfXMLParam[] confXMLPs`

<a id="m-idrefderivedorself-6a08c9a390be"></a>
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

Types: [NavuNode](NavuNode.md#cls-NavuNode), [ConfIdentityRef](../conf/ConfIdentityRef.md#cls-ConfIdentityRef), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`
- `com.tailf.conf.ConfIdentityRef base`
- `String fmt`
- `Object[] args`

<a id="m-initmaapicursor-dfdad1aa4163"></a>
### initMaapiCursor(NavuNode, String, Object[])

```java
protected synchronized java.util.List<com.tailf.conf.ConfKey> initMaapiCursor(
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
protected synchronized void insert(
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

<a id="m-moveordered-373c795909ce"></a>
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

Types: [NavuNode](NavuNode.md#cls-NavuNode), [MoveWhereFlag](../maapi/MoveWhereFlag.md#cls-MoveWhereFlag), [ConfKey](../conf/ConfKey.md#cls-ConfKey), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode navuList`
- `com.tailf.maapi.MoveWhereFlag whereTo`
- `com.tailf.conf.ConfKey to`
- `String fmt`
- `Object[] args`

<a id="m-numofinstances-d5b1fc4e65c9"></a>
### numOfInstances(NavuNode)

```java
protected synchronized int numOfInstances(
    com.tailf.navu.NavuNode navuList
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode navuList`

<a id="m-releasereadth-d8af0d751903"></a>
### releaseReadTh()

```java
protected void releaseReadTh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

<a id="m-releasewriteoperth-c449c5895f07"></a>
### releaseWriteOperTh()

```java
protected void releaseWriteOperTh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

<a id="m-releasewriterunth-f866e93a678c"></a>
### releaseWriteRunTh()

```java
protected void releaseWriteRunTh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

<a id="m-releasewriteth-42da0aac3b34"></a>
### releaseWriteTh(NavuChoice)

```java
protected void releaseWriteTh(com.tailf.navu.NavuChoice nchoice) throws com.tailf.navu.NavuException
```

Types: [NavuChoice](NavuChoice.md#cls-NavuChoice), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuChoice nchoice`

<a id="m-releasewriteth-2f10aa89af15"></a>
### releaseWriteTh(NavuNode)

```java
protected void releaseWriteTh(com.tailf.navu.NavuNode node) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`

<a id="m-releasewriteth-a3f7338814e0"></a>
### releaseWriteTh(NavuNodeInfo)

```java
protected void releaseWriteTh(com.tailf.navu.NavuNodeInfo ninfo) throws com.tailf.navu.NavuException
```

Types: [NavuNodeInfo](NavuNodeInfo.md#cls-NavuNodeInfo), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNodeInfo ninfo`

<a id="m-requestaction-164fcf6d0208"></a>
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

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuAction](NavuAction.md#cls-NavuAction), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuAction action`
- `com.tailf.conf.ConfXMLParam[] params`
- `String fmt`
- `Object[] args`

<a id="m-set-a96f2680982e"></a>
### set(NavuContext)

```java
public synchronized void set(com.tailf.navu.NavuContext context)
```

Types: [NavuContext](NavuContext.md#cls-NavuContext)

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

<a id="m-setelem-0daaa25a8e50"></a>
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
protected synchronized com.tailf.conf.ConfValue setElem(
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

<a id="m-setvalues-8ac6838a32ab"></a>
### setValues(NavuNode, ConfXMLParam[], boolean)

```java
protected synchronized void setValues(
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

<a id="m-sharereadth-00bb7605f233"></a>
### shareReadTh()

```java
protected int shareReadTh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

<a id="m-startoperationaltrans-9d10bde402ce"></a>
### startOperationalTrans(int)

```java
public synchronized int startOperationalTrans(int mode) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

This method starts a transaction towards the [`Conf#DB_OPERATIONAL`](../conf/Conf.md#m-DB_OPERATIONAL)
 database to be used in the context.

 This method or its counterpart `#startRunningTrans(int)` is
 mandatory to call for a context created by the
 [`NavuContext#NavuContext(Maapi)`](NavuContext.md#m-navucontext-af99f9cc97c7) constructor before the context is
 being used in NAVU.

 Calling this method on contexts that already started an transaction will
 throw an NavuException.
 The user will need to manage the started transaction (apply/finish).

**Parameters**

- `int mode` - one of [`Conf#MODE_READ_WRITE`](../conf/Conf.md#m-MODE_READ_WRITE), [`Conf#MODE_READ`](../conf/Conf.md#m-MODE_READ)

**Returns:** transaction id for the started transaction

**Throws**

- `NavuException`

<a id="m-startoperationaltrans-f0b7896eb7ea"></a>
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

Types: [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `int mode`
- `String vendor`
- `String product`
- `String version`
- `String clientId`

<a id="m-startprecommitrunningtrans-1608c1c0d9e6"></a>
### startPreCommitRunningTrans()

```java
public synchronized int startPreCommitRunningTrans() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

This method starts a transaction towards the PRE_COMMIT_RUNNING
 datastore. This datastore only exists between a
 [`CdbSubscription#read()`](../cdb/CdbSubscription.md#m-read-b28b830b98d6) and the following
 [`CdbSubscription#sync(
 com.tailf.cdb.CdbSubscriptionSyncType)`](../cdb/CdbSubscription.md#m-sync-e4ae9cc34a8a).

 The normal use for this transaction type is to be used in a
 diffIteration where the operation is
 [`DiffIterateOperFlag#MOP_DELETED`](../conf/DiffIterateOperFlag.md#m-MOP_DELETED) and the deleted
 data values are of interest.

 This datastore can only be open in [`Conf#MODE_READ`](../conf/Conf.md#m-MODE_READ)
 Calling this method on contexts that already started an transaction will
 throw an NavuException.
 The user will need to manage the finish of this transaction.

**Returns:** transaction id for the started transaction

**Throws**

- `NavuException`

<a id="m-startprecommitrunningtrans-a6bcef757ab6"></a>
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

Types: [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String vendor`
- `String product`
- `String version`
- `String clientId`

<a id="m-startrunningtrans-f44b804de65a"></a>
### startRunningTrans(int)

```java
public synchronized int startRunningTrans(int mode) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

This method starts a transaction towards the [`Conf#DB_RUNNING`](../conf/Conf.md#m-DB_RUNNING)
 database to be used in the context.

 This method or its counterpart `#startOperationalTrans(int)` is
 mandatory to call for a context created by the
 [`NavuContext#NavuContext(Maapi)`](NavuContext.md#m-navucontext-af99f9cc97c7) constructor before the context is
 being used in NAVU.

 Calling this method on contexts that already started an transaction will
 throw an NavuException.
 The user will need to manage the started transaction (apply/finish).

**Parameters**

- `int mode` - one of [`Conf#MODE_READ_WRITE`](../conf/Conf.md#m-MODE_READ_WRITE), [`Conf#MODE_READ`](../conf/Conf.md#m-MODE_READ)

**Returns:** transaction id for the started transaction

**Throws**

- `NavuException`

<a id="m-startrunningtrans-0b37ed6a4aa8"></a>
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

Types: [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `int mode`
- `String vendor`
- `String product`
- `String version`
- `String clientId`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

<a id="m-xpatheval-9750f496e526"></a>
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

Types: [MaapiXPathEvalTrace](../maapi/MaapiXPathEvalTrace.md#cls-MaapiXPathEvalTrace), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuXPathSelectResultSet rs`
- `com.tailf.maapi.MaapiXPathEvalTrace trace`
- `String query`
- `Object initstate`
- `String keyPath`


## Nested Types

- [DataMode](NavuContext/DataMode.md#cls-DataMode)
