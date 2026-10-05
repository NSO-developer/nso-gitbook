# NavuContext <a href="#cls-NavuContext" id="cls-NavuContext"></a>

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

 Another constructor [`NavuContext(Maapi)`](NavuContext.md#m-NavuContext-af99f9cc97c7) exists as an option.
 This constructor prepares a context and expects a [`Maapi`](../maapi/Maapi.md#cls-Maapi) instance
 with a started user session. Before using this type of context it is
 mandatory to call either [`NavuContext#startRunningTrans(int)`](NavuContext.md#m-startRunningTrans-f44b804de65a) or
 [`NavuContext#startOperationalTrans(int)`](NavuContext.md#m-startOperationalTrans-9d10bde402ce) to retrieve a maapi
 transaction.

 The user must manage the transaction which are started using the NavuContext.
 This can be done either by the user storing the retrieved transaction id
 and calling the low level Maapi methods
 [`Maapi#applyTrans(int, boolean)`](../maapi/Maapi.md#m-applyTrans-94f52f2648ce) and/or
 [`Maapi#finishTrans(int)`](../maapi/Maapi.md#m-finishTrans-0f920518d3c3) to commit and end the transaction.

 There are also a set of convenience methods in the NavuContext to handle
 the transaction like [`NavuContext#applyClearTrans()`](NavuContext.md#m-applyClearTrans-3f1898cf9189) and
 [`NavuContext#finishClearTrans()`](NavuContext.md#m-finishClearTrans-0f9c689756ea) etc.

 Using [`NavuContext#startRunningTrans(int)`](NavuContext.md#m-startRunningTrans-f44b804de65a) is equivalent to using a
 context created with the [`NavuContext(Maapi, int)`](NavuContext.md#m-NavuContext-08f21a9fb7b4) constructor which
 is kept for backward compatibility.

 A typical scenario using the [`NavuContext(Maapi)`](NavuContext.md#m-NavuContext-af99f9cc97c7) constructor
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

- [NavuContext(Maapi)](#m-NavuContext-af99f9cc97c7)
- [NavuContext(Maapi, int)](#m-NavuContext-08f21a9fb7b4)

**Fields**:

- [unsetCaseInChoice](NavuContextBase.md#m-unsetCaseInChoice) from NavuContextBase

**Methods**:

- [applyClearTrans()](#m-applyClearTrans-3f1898cf9189)
- [applyReplaceTrans()](#m-applyReplaceTrans-8ed9b5f50308)
- [aquireReadTh()](#m-aquireReadTh-cbeb80470556)
- [aquireWriteOperTh(boolean)](#m-aquireWriteOperTh-70cdc82b9bd7)
- [aquireWriteRunTh()](#m-aquireWriteRunTh-f1dd7d07d6f1)
- [aquireWriteTh(NavuChoice)](#m-aquireWriteTh-94557404af59)
- [aquireWriteTh(NavuNode)](#m-aquireWriteTh-f4016b4db5b6)
- [aquireWriteTh(NavuNodeInfo)](#m-aquireWriteTh-4f4b47d2a03a)
- [attachRunningTrans(int)](#m-attachRunningTrans-7c31c137d0c7)
- [clear()](#m-clear-ca3baec040cb)
- [clearTrans()](#m-clearTrans-bdef1d47dfdf)
- [copy(NavuContext)](#m-copy-87eecbcd063a)
- [copy(NavuContextBase)](NavuContextBase.md#m-copy-7436fcb6cfc1) from NavuContextBase
- [create(NavuNode, int, String, Object[])](#m-create-df02612e3971)
- [delete(NavuNode, String, Object[])](#m-delete-63a54ea2de30)
- [deref(NavuNode, String, Object[])](#m-deref-ae39a7d6fdde)
- [detachRunningTrans()](#m-detachRunningTrans-e735bed11543)
- [diffIterate(MaapiDiffIterate, NavuContext)](#m-diffIterate-4cc73971858b)
- [diffIterate(MaapiDiffIterate, NavuContextBase)](NavuContextBase.md#m-diffIterate-a6cc344016cf) from NavuContextBase
- [finishClearTrans()](#m-finishClearTrans-0f9c689756ea)
- [getBackingStoreCdb()](NavuContextBase.md#m-getBackingStoreCdb-73329cf7d4e1) from NavuContextBase
- [getBackingStoreCdbSession()](NavuContextBase.md#m-getBackingStoreCdbSession-8b0ef17e8ea3) from NavuContextBase
- [getCase(NavuChoice, String, ConfPath)](#m-getCase-653069cc39c6)
- [getCdbSubscriber()](NavuContextBase.md#m-getCdbSubscriber-f292c8c67d4d) from NavuContextBase
- [getElem(NavuNode, String, Object[])](#m-getElem-99bc0267bad6)
- [getLeafListIterator(NavuLeafList)](#m-getLeafListIterator-7174ac6a32ca)
- [getMaapi()](NavuContextBase.md#m-getMaapi-0ce8975d8ec6) from NavuContextBase
- [getMaapiHandle()](NavuContextBase.md#m-getMaapiHandle-ba447f5d4e3f) from NavuContextBase
- [getMountIdInterface()](#m-getMountIdInterface-2aa19a564366)
- [getNavuListIterator(NavuList)](#m-getNavuListIterator-c0c49395e08e)
- [getNsList()](NavuContextBase.md#m-getNsList-0345f486e876) from NavuContextBase
- [getReadConfSession()](NavuContextBase.md#m-getReadConfSession-ece7e5773db9) from NavuContextBase
- [getReadOperSession()](NavuContextBase.md#m-getReadOperSession-7e103aba03ba) from NavuContextBase
- [getValues(NavuNode, ConfXMLParam[])](#m-getValues-ecb3f8096a7c)
- [getWriteConfSession()](NavuContextBase.md#m-getWriteConfSession-a042057a7cb8) from NavuContextBase
- [getWriteOperSession()](NavuContextBase.md#m-getWriteOperSession-eb5d274da267) from NavuContextBase
- [hasCdbSubscriber()](NavuContextBase.md#m-hasCdbSubscriber-3650a7c55283) from NavuContextBase
- [idrefDerivedOrSelf(NavuNode, ConfIdentityRef, String, Object[])](#m-idrefDerivedOrSelf-6a08c9a390be)
- [initMaapiCursor(NavuNode, String, Object[])](#m-initMaapiCursor-dfdad1aa4163)
- [insert(NavuList, boolean, String, Object[])](#m-insert-55bd5e6f415f)
- [isActAsSuper()](NavuContextBase.md#m-isActAsSuper-ce02ade4553b) from NavuContextBase
- [isCdb()](NavuContextBase.md#m-isCdb-20ec16d14862) from NavuContextBase
- [isCdbSession()](NavuContextBase.md#m-isCdbSession-71fe8b2aab5d) from NavuContextBase
- [isMaapi()](NavuContextBase.md#m-isMaapi-5c500ef256ce) from NavuContextBase
- [isOnline()](NavuContextBase.md#m-isOnline-90688b264b83) from NavuContextBase
- [moveOrdered(NavuNode, MoveWhereFlag, ConfKey, String, Object[])](#m-moveOrdered-373c795909ce)
- [numOfInstances(NavuNode)](#m-numOfInstances-d5b1fc4e65c9)
- [releaseReadTh()](#m-releaseReadTh-d8af0d751903)
- [releaseWriteOperTh()](#m-releaseWriteOperTh-c449c5895f07)
- [releaseWriteRunTh()](#m-releaseWriteRunTh-f866e93a678c)
- [releaseWriteTh(NavuChoice)](#m-releaseWriteTh-42da0aac3b34)
- [releaseWriteTh(NavuNode)](#m-releaseWriteTh-2f10aa89af15)
- [releaseWriteTh(NavuNodeInfo)](#m-releaseWriteTh-a3f7338814e0)
- [removeCdbSessions()](NavuContextBase.md#m-removeCdbSessions-71502a05a702) from NavuContextBase
- [requestAction(NavuAction, ConfXMLParam[], String, Object[])](#m-requestAction-164fcf6d0208)
- [set(NavuContext)](#m-set-a96f2680982e)
- [set(NavuContextBase)](NavuContextBase.md#m-set-aa955bb80732) from NavuContextBase
- [setElem(NavuNode, ConfValue, boolean, String, Object[])](#m-setElem-0daaa25a8e50)
- [setElem(NavuNode, String, boolean, String, Object[])](#m-setElem-e887291ef6b0)
- [setMaapiHandle(int)](NavuContextBase.md#m-setMaapiHandle-62fe88de5765) from NavuContextBase
- [setOption(UnSetCaseInChoice)](NavuContextBase.md#m-setOption-13f7d349ceea) from NavuContextBase
- [setReadConfLocks(EnumSet<CdbLockType>)](NavuContextBase.md#m-setReadConfLocks-43f86af9b510) from NavuContextBase
- [setReadOperLocks(EnumSet<CdbLockType>)](NavuContextBase.md#m-setReadOperLocks-9c615c121ad2) from NavuContextBase
- [setValues(NavuNode, ConfXMLParam[], boolean)](#m-setValues-8ac6838a32ab)
- [setWriteOperLocks(EnumSet<CdbLockType>)](NavuContextBase.md#m-setWriteOperLocks-d3a3d78b7d7d) from NavuContextBase
- [shareReadTh()](#m-shareReadTh-00bb7605f233)
- [startOperationalTrans(int)](#m-startOperationalTrans-9d10bde402ce)
- [startOperationalTrans(int, String, String, String, String)](#m-startOperationalTrans-f0b7896eb7ea)
- [startPreCommitRunningTrans()](#m-startPreCommitRunningTrans-1608c1c0d9e6)
- [startPreCommitRunningTrans(String, String, String, String)](#m-startPreCommitRunningTrans-a6bcef757ab6)
- [startRunningTrans(int)](#m-startRunningTrans-f44b804de65a)
- [startRunningTrans(int, String, String, String, String)](#m-startRunningTrans-0b37ed6a4aa8)
- [toString()](#m-toString-e9d48c5503ef)
- [xpathEval(NavuXPathSelectResultSet, MaapiXPathEvalTrace, String, Object, String)](#m-xpathEval-9750f496e526)

**Nested Types**:

- [DataMode](NavuContext/DataMode.md#cls-DataMode)

## Constructors

### NavuContext(Maapi) <a href="#m-NavuContext-af99f9cc97c7" id="m-NavuContext-af99f9cc97c7"></a>

```java
public NavuContext(com.tailf.maapi.Maapi m)
```

Types: [Maapi](../maapi/Maapi.md#cls-Maapi)

This constructor prepares a context to be used with a maapi transaction
 towards either [`Conf#DB_RUNNING`](../conf/Conf.md#m-DB_RUNNING) or [`Conf#DB_OPERATIONAL`](../conf/Conf.md#m-DB_OPERATIONAL).
 This transactions has to be started with one of
 [`NavuContext#startRunningTrans(int)`](NavuContext.md#m-startRunningTrans-f44b804de65a) or
 [`NavuContext#startOperationalTrans(int)`](NavuContext.md#m-startOperationalTrans-9d10bde402ce) before the context can
 be used in NAVU.

**Parameters**

- `com.tailf.maapi.Maapi m` - the `Maapi` instance to be used

### NavuContext(Maapi, int) <a href="#m-NavuContext-08f21a9fb7b4" id="m-NavuContext-08f21a9fb7b4"></a>

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

### applyClearTrans() <a href="#m-applyClearTrans-3f1898cf9189" id="m-applyClearTrans-3f1898cf9189"></a>

```java
public synchronized void applyClearTrans() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

This method applies any changes in this transaction (Commit) using
 [`Maapi#applyTrans(int, boolean)`](../maapi/Maapi.md#m-applyTrans-94f52f2648ce). Afterwards the transaction is
 finished using [`Maapi#finishTrans(int)`](../maapi/Maapi.md#m-finishTrans-0f920518d3c3) and cleared form this
 NavuContext.

 After apply and clear of the transaction using this method
 it is possible to start a new transaction using
 [`startRunningTrans(int)`](NavuContext.md#m-startRunningTrans-f44b804de65a) or [`startOperationalTrans(int)`](NavuContext.md#m-startOperationalTrans-9d10bde402ce).

 If no new transaction is started further navigation with this context
 will not be possible.

 finishes the transaction. The NavuConn

**Throws**

- `NavuException`

### applyReplaceTrans() <a href="#m-applyReplaceTrans-8ed9b5f50308" id="m-applyReplaceTrans-8ed9b5f50308"></a>

```java
public synchronized void applyReplaceTrans() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

This method applies (commit) and finish the transaction using
 [`Maapi#applyTrans(int, boolean)`](../maapi/Maapi.md#m-applyTrans-94f52f2648ce)
 and [`Maapi#finishTrans(int)`](../maapi/Maapi.md#m-finishTrans-0f920518d3c3).
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

### aquireReadTh() <a href="#m-aquireReadTh-cbeb80470556" id="m-aquireReadTh-cbeb80470556"></a>

```java
protected int aquireReadTh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

### aquireWriteOperTh(boolean) <a href="#m-aquireWriteOperTh-70cdc82b9bd7" id="m-aquireWriteOperTh-70cdc82b9bd7"></a>

```java
protected int aquireWriteOperTh(boolean isWriteAll) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `boolean isWriteAll`

### aquireWriteRunTh() <a href="#m-aquireWriteRunTh-f1dd7d07d6f1" id="m-aquireWriteRunTh-f1dd7d07d6f1"></a>

```java
protected int aquireWriteRunTh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

### aquireWriteTh(NavuChoice) <a href="#m-aquireWriteTh-94557404af59" id="m-aquireWriteTh-94557404af59"></a>

```java
protected int aquireWriteTh(com.tailf.navu.NavuChoice nchoice) throws com.tailf.navu.NavuException
```

Types: [NavuChoice](NavuChoice.md#cls-NavuChoice), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuChoice nchoice`

### aquireWriteTh(NavuNode) <a href="#m-aquireWriteTh-f4016b4db5b6" id="m-aquireWriteTh-f4016b4db5b6"></a>

```java
protected int aquireWriteTh(com.tailf.navu.NavuNode node) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`

### aquireWriteTh(NavuNodeInfo) <a href="#m-aquireWriteTh-4f4b47d2a03a" id="m-aquireWriteTh-4f4b47d2a03a"></a>

```java
protected int aquireWriteTh(com.tailf.navu.NavuNodeInfo ninfo) throws com.tailf.navu.NavuException
```

Types: [NavuNodeInfo](NavuNodeInfo.md#cls-NavuNodeInfo), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNodeInfo ninfo`

### attachRunningTrans(int) <a href="#m-attachRunningTrans-7c31c137d0c7" id="m-attachRunningTrans-7c31c137d0c7"></a>

```java
public void attachRunningTrans(int th) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Attach an existing transaction towards the [`Conf#DB_RUNNING`](../conf/Conf.md#m-DB_RUNNING)
 database to be used in the context.

 Because the transaction is attached and not started by the NavuContext
 no finish or apply operations are allowed from the context.

 For example the [`finishClearTrans()`](NavuContext.md#m-finishClearTrans-0f9c689756ea) will throw an exception
 for this type of context.

**Parameters**

- `int th` - transaction id

**Throws**

- `NavuException`

### clear() <a href="#m-clear-ca3baec040cb" id="m-clear-ca3baec040cb"></a>

```java
protected void clear()
```

Clears all connection attributes.

### clearTrans() <a href="#m-clearTrans-bdef1d47dfdf" id="m-clearTrans-bdef1d47dfdf"></a>

```java
public synchronized int clearTrans() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Clears the internal transaction defined by
 [`startRunningTrans(int)`](NavuContext.md#m-startRunningTrans-f44b804de65a) or [`startOperationalTrans(int)`](NavuContext.md#m-startOperationalTrans-9d10bde402ce)
 The previous transaction id if any is returned but left unattended.
 If the transaction needs to be committed or finished this has to be
 performed outside of Navu.

 After clearing the transaction it is possible to start a new
 transaction using
 [`startRunningTrans(int)`](NavuContext.md#m-startRunningTrans-f44b804de65a) or [`startOperationalTrans(int)`](NavuContext.md#m-startOperationalTrans-9d10bde402ce).

 If no new transaction is started further navigation with this context
 will not be possible.

**Returns:** the previous transaction id or -1 if no transaction was started

**Throws**

- `NavuException`

### copy(NavuContext) <a href="#m-copy-87eecbcd063a" id="m-copy-87eecbcd063a"></a>

```java
protected void copy(com.tailf.navu.NavuContext context)
```

Types: [NavuContext](NavuContext.md#cls-NavuContext)

Copy the contents of a context.

**Parameters**

- `com.tailf.navu.NavuContext context`

### create(NavuNode, int, String, Object[]) <a href="#m-create-df02612e3971" id="m-create-df02612e3971"></a>

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

### delete(NavuNode, String, Object[]) <a href="#m-delete-63a54ea2de30" id="m-delete-63a54ea2de30"></a>

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

### deref(NavuNode, String, Object[]) <a href="#m-deref-ae39a7d6fdde" id="m-deref-ae39a7d6fdde"></a>

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

### detachRunningTrans() <a href="#m-detachRunningTrans-e735bed11543" id="m-detachRunningTrans-e735bed11543"></a>

```java
public void detachRunningTrans() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

For an context with an attached transaction using
 [`attachRunningTrans(int)`](NavuContext.md#m-attachRunningTrans-7c31c137d0c7) this method will detach
 the transaction from the NavuContext maapi instance

**Throws**

- `NavuException`

### diffIterate(MaapiDiffIterate, NavuContext) <a href="#m-diffIterate-4cc73971858b" id="m-diffIterate-4cc73971858b"></a>

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

### finishClearTrans() <a href="#m-finishClearTrans-0f9c689756ea" id="m-finishClearTrans-0f9c689756ea"></a>

```java
public synchronized void finishClearTrans() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Finishes current trans using [`Maapi#finishTrans(int)`](../maapi/Maapi.md#m-finishTrans-0f920518d3c3) and
 clears the trans from this NavuContext.

 After finish and clear of the transaction using this method
 it is possible to start a new transaction using
 [`startRunningTrans(int)`](NavuContext.md#m-startRunningTrans-f44b804de65a) or [`startOperationalTrans(int)`](NavuContext.md#m-startOperationalTrans-9d10bde402ce).

 If no new transaction is started further navigation with this context
 will not be possible.

**Throws**

- `NavuException`

### getCase(NavuChoice, String, ConfPath) <a href="#m-getCase-653069cc39c6" id="m-getCase-653069cc39c6"></a>

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

### getElem(NavuNode, String, Object[]) <a href="#m-getElem-99bc0267bad6" id="m-getElem-99bc0267bad6"></a>

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

### getLeafListIterator(NavuLeafList) <a href="#m-getLeafListIterator-7174ac6a32ca" id="m-getLeafListIterator-7174ac6a32ca"></a>

```java
protected synchronized com.tailf.navu.NavuLeafListIterator getLeafListIterator(
    com.tailf.navu.NavuLeafList navuLeafList
)
    throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#cls-NavuLeafList), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuLeafList navuLeafList`

### getMountIdInterface() <a href="#m-getMountIdInterface-2aa19a564366" id="m-getMountIdInterface-2aa19a564366"></a>

```java
public com.tailf.conf.MountIdInterface getMountIdInterface()
```

Types: [MountIdInterface](../conf/MountIdInterface.md#cls-MountIdInterface)

### getNavuListIterator(NavuList) <a href="#m-getNavuListIterator-c0c49395e08e" id="m-getNavuListIterator-c0c49395e08e"></a>

```java
protected synchronized com.tailf.navu.NavuListEntryIterator getNavuListIterator(
    com.tailf.navu.NavuList navuList
)
    throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#cls-NavuList), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuList navuList`

### getValues(NavuNode, ConfXMLParam[]) <a href="#m-getValues-ecb3f8096a7c" id="m-getValues-ecb3f8096a7c"></a>

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

### idrefDerivedOrSelf(NavuNode, ConfIdentityRef, String, Object[]) <a href="#m-idrefDerivedOrSelf-6a08c9a390be" id="m-idrefDerivedOrSelf-6a08c9a390be"></a>

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

### initMaapiCursor(NavuNode, String, Object[]) <a href="#m-initMaapiCursor-dfdad1aa4163" id="m-initMaapiCursor-dfdad1aa4163"></a>

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

### insert(NavuList, boolean, String, Object[]) <a href="#m-insert-55bd5e6f415f" id="m-insert-55bd5e6f415f"></a>

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

### moveOrdered(NavuNode, MoveWhereFlag, ConfKey, String, Object[]) <a href="#m-moveOrdered-373c795909ce" id="m-moveOrdered-373c795909ce"></a>

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

### numOfInstances(NavuNode) <a href="#m-numOfInstances-d5b1fc4e65c9" id="m-numOfInstances-d5b1fc4e65c9"></a>

```java
protected synchronized int numOfInstances(
    com.tailf.navu.NavuNode navuList
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode navuList`

### releaseReadTh() <a href="#m-releaseReadTh-d8af0d751903" id="m-releaseReadTh-d8af0d751903"></a>

```java
protected void releaseReadTh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

### releaseWriteOperTh() <a href="#m-releaseWriteOperTh-c449c5895f07" id="m-releaseWriteOperTh-c449c5895f07"></a>

```java
protected void releaseWriteOperTh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

### releaseWriteRunTh() <a href="#m-releaseWriteRunTh-f866e93a678c" id="m-releaseWriteRunTh-f866e93a678c"></a>

```java
protected void releaseWriteRunTh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

### releaseWriteTh(NavuChoice) <a href="#m-releaseWriteTh-42da0aac3b34" id="m-releaseWriteTh-42da0aac3b34"></a>

```java
protected void releaseWriteTh(com.tailf.navu.NavuChoice nchoice) throws com.tailf.navu.NavuException
```

Types: [NavuChoice](NavuChoice.md#cls-NavuChoice), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuChoice nchoice`

### releaseWriteTh(NavuNode) <a href="#m-releaseWriteTh-2f10aa89af15" id="m-releaseWriteTh-2f10aa89af15"></a>

```java
protected void releaseWriteTh(com.tailf.navu.NavuNode node) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode node`

### releaseWriteTh(NavuNodeInfo) <a href="#m-releaseWriteTh-a3f7338814e0" id="m-releaseWriteTh-a3f7338814e0"></a>

```java
protected void releaseWriteTh(com.tailf.navu.NavuNodeInfo ninfo) throws com.tailf.navu.NavuException
```

Types: [NavuNodeInfo](NavuNodeInfo.md#cls-NavuNodeInfo), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNodeInfo ninfo`

### requestAction(NavuAction, ConfXMLParam[], String, Object[]) <a href="#m-requestAction-164fcf6d0208" id="m-requestAction-164fcf6d0208"></a>

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

### set(NavuContext) <a href="#m-set-a96f2680982e" id="m-set-a96f2680982e"></a>

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

### setElem(NavuNode, ConfValue, boolean, String, Object[]) <a href="#m-setElem-0daaa25a8e50" id="m-setElem-0daaa25a8e50"></a>

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

### setElem(NavuNode, String, boolean, String, Object[]) <a href="#m-setElem-e887291ef6b0" id="m-setElem-e887291ef6b0"></a>

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

### setValues(NavuNode, ConfXMLParam[], boolean) <a href="#m-setValues-8ac6838a32ab" id="m-setValues-8ac6838a32ab"></a>

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

### shareReadTh() <a href="#m-shareReadTh-00bb7605f233" id="m-shareReadTh-00bb7605f233"></a>

```java
protected int shareReadTh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

### startOperationalTrans(int) <a href="#m-startOperationalTrans-9d10bde402ce" id="m-startOperationalTrans-9d10bde402ce"></a>

```java
public synchronized int startOperationalTrans(int mode) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

This method starts a transaction towards the [`Conf#DB_OPERATIONAL`](../conf/Conf.md#m-DB_OPERATIONAL)
 database to be used in the context.

 This method or its counterpart [`startRunningTrans(int)`](NavuContext.md#m-startRunningTrans-f44b804de65a) is
 mandatory to call for a context created by the
 [`NavuContext(Maapi)`](NavuContext.md#m-NavuContext-af99f9cc97c7) constructor before the context is
 being used in NAVU.

 Calling this method on contexts that already started an transaction will
 throw an NavuException.
 The user will need to manage the started transaction (apply/finish).

**Parameters**

- `int mode` - one of [`Conf#MODE_READ_WRITE`](../conf/Conf.md#m-MODE_READ_WRITE), [`Conf#MODE_READ`](../conf/Conf.md#m-MODE_READ)

**Returns:** transaction id for the started transaction

**Throws**

- `NavuException`

### startOperationalTrans(int, String, String, String, String) <a href="#m-startOperationalTrans-f0b7896eb7ea" id="m-startOperationalTrans-f0b7896eb7ea"></a>

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

### startPreCommitRunningTrans() <a href="#m-startPreCommitRunningTrans-1608c1c0d9e6" id="m-startPreCommitRunningTrans-1608c1c0d9e6"></a>

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

### startPreCommitRunningTrans(String, String, String, String) <a href="#m-startPreCommitRunningTrans-a6bcef757ab6" id="m-startPreCommitRunningTrans-a6bcef757ab6"></a>

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

### startRunningTrans(int) <a href="#m-startRunningTrans-f44b804de65a" id="m-startRunningTrans-f44b804de65a"></a>

```java
public synchronized int startRunningTrans(int mode) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

This method starts a transaction towards the [`Conf#DB_RUNNING`](../conf/Conf.md#m-DB_RUNNING)
 database to be used in the context.

 This method or its counterpart [`startOperationalTrans(int)`](NavuContext.md#m-startOperationalTrans-9d10bde402ce) is
 mandatory to call for a context created by the
 [`NavuContext(Maapi)`](NavuContext.md#m-NavuContext-af99f9cc97c7) constructor before the context is
 being used in NAVU.

 Calling this method on contexts that already started an transaction will
 throw an NavuException.
 The user will need to manage the started transaction (apply/finish).

**Parameters**

- `int mode` - one of [`Conf#MODE_READ_WRITE`](../conf/Conf.md#m-MODE_READ_WRITE), [`Conf#MODE_READ`](../conf/Conf.md#m-MODE_READ)

**Returns:** transaction id for the started transaction

**Throws**

- `NavuException`

### startRunningTrans(int, String, String, String, String) <a href="#m-startRunningTrans-0b37ed6a4aa8" id="m-startRunningTrans-0b37ed6a4aa8"></a>

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

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

### xpathEval(NavuXPathSelectResultSet, MaapiXPathEvalTrace, String, Object, String) <a href="#m-xpathEval-9750f496e526" id="m-xpathEval-9750f496e526"></a>

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
