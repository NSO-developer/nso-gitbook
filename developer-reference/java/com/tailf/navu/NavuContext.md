# NavuContext <a href="#navucontext-2974e9f92a9e" id="navucontext-2974e9f92a9e"></a>

```java
public class com.tailf.navu.NavuContext
    extends com.tailf.navu.NavuContextBase
```

Types: [NavuContextBase](NavuContextBase.md#navucontextbase-0061e2b12534)

This class controls how NAVU should read/write data to ncs.
 With data we mean configuration and/or operational data.

All data (config/oper) can be read using a Maapi transaction
 towards the DB_RUNNING database. If this transaction is opened in
 MODE_READ_WRITE mode, then configuration data can be written with
 this same transaction.

Another constructor [`NavuContext(Maapi)`](NavuContext.md#navucontext-af99f9cc97c7) exists as an option.
 This constructor prepares a context and expects a [`Maapi`](../maapi/Maapi.md#maapi-67bcbe89c42e) instance
 with a started user session. Before using this type of context it is
 mandatory to call either [`NavuContext#startRunningTrans(int)`](NavuContext.md#startrunningtrans-f44b804de65a) or
 [`NavuContext#startOperationalTrans(int)`](NavuContext.md#startoperationaltrans-9d10bde402ce) to retrieve a maapi
 transaction.

 The user must manage the transaction which are started using the NavuContext.
 This can be done either by the user storing the retrieved transaction id
 and calling the low level Maapi methods
 [`Maapi#applyTrans(int, boolean)`](../maapi/Maapi.md#applytrans-94f52f2648ce) and/or
 [`Maapi#finishTrans(int)`](../maapi/Maapi.md#finishtrans-0f920518d3c3) to commit and end the transaction.

 There are also a set of convenience methods in the NavuContext to handle
 the transaction like [`NavuContext#applyClearTrans()`](NavuContext.md#applycleartrans-3f1898cf9189) and
 [`NavuContext#finishClearTrans()`](NavuContext.md#finishcleartrans-0f9c689756ea) etc.

 Using [`NavuContext#startRunningTrans(int)`](NavuContext.md#startrunningtrans-f44b804de65a) is equivalent to using a
 context created with the [`NavuContext(Maapi, int)`](NavuContext.md#navucontext-08f21a9fb7b4) constructor which
 is kept for backward compatibility.

A typical scenario using the [`NavuContext(Maapi)`](NavuContext.md#navucontext-af99f9cc97c7) constructor
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

- [NavuContext\(Maapi\)](#navucontext-af99f9cc97c7)
- [NavuContext\(Maapi, int\)](#navucontext-08f21a9fb7b4)

**Fields**:

- [unsetCaseInChoice](NavuContextBase.md#unsetcaseinchoice-6309da590bfe) from NavuContextBase

**Methods**:

- [applyClearTrans\(\)](#applycleartrans-3f1898cf9189)
- [applyReplaceTrans\(\)](#applyreplacetrans-8ed9b5f50308)
- [attachRunningTrans\(int\)](#attachrunningtrans-7c31c137d0c7)
- [clearTrans\(\)](#cleartrans-bdef1d47dfdf)
- [detachRunningTrans\(\)](#detachrunningtrans-e735bed11543)
- [finishClearTrans\(\)](#finishcleartrans-0f9c689756ea)
- [getBackingStoreCdb\(\)](NavuContextBase.md#getbackingstorecdb-73329cf7d4e1) from NavuContextBase
- [getBackingStoreCdbSession\(\)](NavuContextBase.md#getbackingstorecdbsession-8b0ef17e8ea3) from NavuContextBase
- [getCdbSubscriber\(\)](NavuContextBase.md#getcdbsubscriber-f292c8c67d4d) from NavuContextBase
- [getMaapi\(\)](NavuContextBase.md#getmaapi-0ce8975d8ec6) from NavuContextBase
- [getMaapiHandle\(\)](NavuContextBase.md#getmaapihandle-ba447f5d4e3f) from NavuContextBase
- [getMountIdInterface\(\)](#getmountidinterface-2aa19a564366)
- [getNsList\(\)](NavuContextBase.md#getnslist-0345f486e876) from NavuContextBase
- [getReadConfSession\(\)](NavuContextBase.md#getreadconfsession-ece7e5773db9) from NavuContextBase
- [getReadOperSession\(\)](NavuContextBase.md#getreadopersession-7e103aba03ba) from NavuContextBase
- [getWriteOperSession\(\)](NavuContextBase.md#getwriteopersession-eb5d274da267) from NavuContextBase
- [hasCdbSubscriber\(\)](NavuContextBase.md#hascdbsubscriber-3650a7c55283) from NavuContextBase
- [isCdb\(\)](NavuContextBase.md#iscdb-20ec16d14862) from NavuContextBase
- [isCdbSession\(\)](NavuContextBase.md#iscdbsession-71fe8b2aab5d) from NavuContextBase
- [isMaapi\(\)](NavuContextBase.md#ismaapi-5c500ef256ce) from NavuContextBase
- [isOnline\(\)](NavuContextBase.md#isonline-90688b264b83) from NavuContextBase
- [removeCdbSessions\(\)](NavuContextBase.md#removecdbsessions-71502a05a702) from NavuContextBase
- [set\(NavuContext\)](#set-a96f2680982e)
- [set\(NavuContextBase\)](NavuContextBase.md#set-aa955bb80732) from NavuContextBase
- [setOption\(UnSetCaseInChoice\)](NavuContextBase.md#setoption-13f7d349ceea) from NavuContextBase
- [setReadConfLocks\(EnumSet\<CdbLockType\>\)](NavuContextBase.md#setreadconflocks-43f86af9b510) from NavuContextBase
- [setReadOperLocks\(EnumSet\<CdbLockType\>\)](NavuContextBase.md#setreadoperlocks-9c615c121ad2) from NavuContextBase
- [setWriteOperLocks\(EnumSet\<CdbLockType\>\)](NavuContextBase.md#setwriteoperlocks-d3a3d78b7d7d) from NavuContextBase
- [startOperationalTrans\(int\)](#startoperationaltrans-9d10bde402ce)
- [startOperationalTrans\(int, String, String, String, String\)](#startoperationaltrans-f0b7896eb7ea)
- [startPreCommitRunningTrans\(\)](#startprecommitrunningtrans-1608c1c0d9e6)
- [startPreCommitRunningTrans\(String, String, String, String\)](#startprecommitrunningtrans-a6bcef757ab6)
- [startRunningTrans\(int\)](#startrunningtrans-f44b804de65a)
- [startRunningTrans\(int, String, String, String, String\)](#startrunningtrans-0b37ed6a4aa8)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### NavuContext(Maapi) <a href="#navucontext-af99f9cc97c7" id="navucontext-af99f9cc97c7"></a>

```java
public NavuContext(com.tailf.maapi.Maapi m)
```

Types: [Maapi](../maapi/Maapi.md#maapi-67bcbe89c42e)

This constructor prepares a context to be used with a maapi transaction
 towards either [`Conf#DB_RUNNING`](../conf/Conf.md#db_running-c391f371da28) or [`Conf#DB_OPERATIONAL`](../conf/Conf.md#db_operational-0d12377eea71).
 This transactions has to be started with one of
 [`NavuContext#startRunningTrans(int)`](NavuContext.md#startrunningtrans-f44b804de65a) or
 [`NavuContext#startOperationalTrans(int)`](NavuContext.md#startoperationaltrans-9d10bde402ce) before the context can
 be used in NAVU.

**Parameters**

- `com.tailf.maapi.Maapi m` - the `Maapi` instance to be used

### NavuContext(Maapi, int) <a href="#navucontext-08f21a9fb7b4" id="navucontext-08f21a9fb7b4"></a>

```java
public NavuContext(com.tailf.maapi.Maapi m, int confTh)
```

Types: [Maapi](../maapi/Maapi.md#maapi-67bcbe89c42e)

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

### applyClearTrans() <a href="#applycleartrans-3f1898cf9189" id="applycleartrans-3f1898cf9189"></a>

```java
public synchronized void applyClearTrans() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

This method applies any changes in this transaction (Commit) using
 [`Maapi#applyTrans(int, boolean)`](../maapi/Maapi.md#applytrans-94f52f2648ce). Afterwards the transaction is
 finished using [`Maapi#finishTrans(int)`](../maapi/Maapi.md#finishtrans-0f920518d3c3) and cleared form this
 NavuContext.

 After apply and clear of the transaction using this method
 it is possible to start a new transaction using
 [`startRunningTrans(int)`](NavuContext.md#startrunningtrans-f44b804de65a) or [`startOperationalTrans(int)`](NavuContext.md#startoperationaltrans-9d10bde402ce).

 If no new transaction is started further navigation with this context
 will not be possible.

 finishes the transaction. The NavuConn

**Throws**

- `com.tailf.navu.NavuException`

### applyReplaceTrans() <a href="#applyreplacetrans-8ed9b5f50308" id="applyreplacetrans-8ed9b5f50308"></a>

```java
public synchronized void applyReplaceTrans() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

This method applies (commit) and finish the transaction using
 [`Maapi#applyTrans(int, boolean)`](../maapi/Maapi.md#applytrans-94f52f2648ce)
 and [`Maapi#finishTrans(int)`](../maapi/Maapi.md#finishtrans-0f920518d3c3).
 Afterwards an new transaction of same type (operational or running) and
 mode ([`Conf#MODE_READ`](../conf/Conf.md#mode_read-1e4ced2f015c) or [`Conf#MODE_READ_WRITE`](../conf/Conf.md#mode_read_write-0883a33af731)) is created
 and replaces the old applied transaction.

 Hence, navigation using this context can be resumed directly after
 this method call.
 Note, however that the depending of the committed transaction the
 Navu tree migth or migth not be up to date. There is no automatic sync
 or validation of the present Navu tree against the new transaction.

**Throws**

- `com.tailf.navu.NavuException`

### attachRunningTrans(int) <a href="#attachrunningtrans-7c31c137d0c7" id="attachrunningtrans-7c31c137d0c7"></a>

```java
public void attachRunningTrans(int th) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Attach an existing transaction towards the [`Conf#DB_RUNNING`](../conf/Conf.md#db_running-c391f371da28)
 database to be used in the context.

 Because the transaction is attached and not started by the NavuContext
 no finish or apply operations are allowed from the context.

 For example the [`finishClearTrans()`](NavuContext.md#finishcleartrans-0f9c689756ea) will throw an exception
 for this type of context.

**Parameters**

- `int th` - transaction id

**Throws**

- `com.tailf.navu.NavuException`

### clearTrans() <a href="#cleartrans-bdef1d47dfdf" id="cleartrans-bdef1d47dfdf"></a>

```java
public synchronized int clearTrans() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Clears the internal transaction defined by
 [`startRunningTrans(int)`](NavuContext.md#startrunningtrans-f44b804de65a) or [`startOperationalTrans(int)`](NavuContext.md#startoperationaltrans-9d10bde402ce)
 The previous transaction id if any is returned but left unattended.
 If the transaction needs to be committed or finished this has to be
 performed outside of Navu.

 After clearing the transaction it is possible to start a new
 transaction using
 [`startRunningTrans(int)`](NavuContext.md#startrunningtrans-f44b804de65a) or [`startOperationalTrans(int)`](NavuContext.md#startoperationaltrans-9d10bde402ce).

 If no new transaction is started further navigation with this context
 will not be possible.

**Returns:** the previous transaction id or -1 if no transaction was started

**Throws**

- `com.tailf.navu.NavuException`

### detachRunningTrans() <a href="#detachrunningtrans-e735bed11543" id="detachrunningtrans-e735bed11543"></a>

```java
public void detachRunningTrans() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

For an context with an attached transaction using
 [`attachRunningTrans(int)`](NavuContext.md#attachrunningtrans-7c31c137d0c7) this method will detach
 the transaction from the NavuContext maapi instance

**Throws**

- `com.tailf.navu.NavuException`

### finishClearTrans() <a href="#finishcleartrans-0f9c689756ea" id="finishcleartrans-0f9c689756ea"></a>

```java
public synchronized void finishClearTrans() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Finishes current trans using [`Maapi#finishTrans(int)`](../maapi/Maapi.md#finishtrans-0f920518d3c3) and
 clears the trans from this NavuContext.

 After finish and clear of the transaction using this method
 it is possible to start a new transaction using
 [`startRunningTrans(int)`](NavuContext.md#startrunningtrans-f44b804de65a) or [`startOperationalTrans(int)`](NavuContext.md#startoperationaltrans-9d10bde402ce).

 If no new transaction is started further navigation with this context
 will not be possible.

**Throws**

- `com.tailf.navu.NavuException`

### getMountIdInterface() <a href="#getmountidinterface-2aa19a564366" id="getmountidinterface-2aa19a564366"></a>

```java
public com.tailf.conf.MountIdInterface getMountIdInterface()
```

Types: [MountIdInterface](../conf/MountIdInterface.md#mountidinterface-113d1b54dae0)

### set(NavuContext) <a href="#set-a96f2680982e" id="set-a96f2680982e"></a>

```java
public synchronized void set(com.tailf.navu.NavuContext context)
```

Types: [NavuContext](NavuContext.md#navucontext-2974e9f92a9e)

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

### startOperationalTrans(int) <a href="#startoperationaltrans-9d10bde402ce" id="startoperationaltrans-9d10bde402ce"></a>

```java
public synchronized int startOperationalTrans(int mode) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

This method starts a transaction towards the [`Conf#DB_OPERATIONAL`](../conf/Conf.md#db_operational-0d12377eea71)
 database to be used in the context.

 This method or its counterpart [`startRunningTrans(int)`](NavuContext.md#startrunningtrans-f44b804de65a) is
 mandatory to call for a context created by the
 [`NavuContext(Maapi)`](NavuContext.md#navucontext-af99f9cc97c7) constructor before the context is
 being used in NAVU.

 Calling this method on contexts that already started an transaction will
 throw an NavuException.
 The user will need to manage the started transaction (apply/finish).

**Parameters**

- `int mode` - one of [`Conf#MODE_READ_WRITE`](../conf/Conf.md#mode_read_write-0883a33af731), [`Conf#MODE_READ`](../conf/Conf.md#mode_read-1e4ced2f015c)

**Returns:** transaction id for the started transaction

**Throws**

- `com.tailf.navu.NavuException`

### startOperationalTrans(int, String, String, String, String) <a href="#startoperationaltrans-f0b7896eb7ea" id="startoperationaltrans-f0b7896eb7ea"></a>

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

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `int mode`
- `String vendor`
- `String product`
- `String version`
- `String clientId`

### startPreCommitRunningTrans() <a href="#startprecommitrunningtrans-1608c1c0d9e6" id="startprecommitrunningtrans-1608c1c0d9e6"></a>

```java
public synchronized int startPreCommitRunningTrans() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

This method starts a transaction towards the PRE_COMMIT_RUNNING
 datastore. This datastore only exists between a
 [`CdbSubscription#read()`](../cdb/CdbSubscription.md#read-b28b830b98d6) and the following
 [`CdbSubscription#sync(
 com.tailf.cdb.CdbSubscriptionSyncType)`](../cdb/CdbSubscription.md#sync-e4ae9cc34a8a).

 The normal use for this transaction type is to be used in a
 diffIteration where the operation is
 [`DiffIterateOperFlag#MOP_DELETED`](../conf/DiffIterateOperFlag.md#mop_deleted-bfb313272589) and the deleted
 data values are of interest.

 This datastore can only be open in [`Conf#MODE_READ`](../conf/Conf.md#mode_read-1e4ced2f015c)
 Calling this method on contexts that already started an transaction will
 throw an NavuException.
 The user will need to manage the finish of this transaction.

**Returns:** transaction id for the started transaction

**Throws**

- `com.tailf.navu.NavuException`

### startPreCommitRunningTrans(String, String, String, String) <a href="#startprecommitrunningtrans-a6bcef757ab6" id="startprecommitrunningtrans-a6bcef757ab6"></a>

```java
public synchronized int startPreCommitRunningTrans(
    String vendor,
    String product,
    String version,
    String clientId
)
    throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `String vendor`
- `String product`
- `String version`
- `String clientId`

### startRunningTrans(int) <a href="#startrunningtrans-f44b804de65a" id="startrunningtrans-f44b804de65a"></a>

```java
public synchronized int startRunningTrans(int mode) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

This method starts a transaction towards the [`Conf#DB_RUNNING`](../conf/Conf.md#db_running-c391f371da28)
 database to be used in the context.

 This method or its counterpart [`startOperationalTrans(int)`](NavuContext.md#startoperationaltrans-9d10bde402ce) is
 mandatory to call for a context created by the
 [`NavuContext(Maapi)`](NavuContext.md#navucontext-af99f9cc97c7) constructor before the context is
 being used in NAVU.

 Calling this method on contexts that already started an transaction will
 throw an NavuException.
 The user will need to manage the started transaction (apply/finish).

**Parameters**

- `int mode` - one of [`Conf#MODE_READ_WRITE`](../conf/Conf.md#mode_read_write-0883a33af731), [`Conf#MODE_READ`](../conf/Conf.md#mode_read-1e4ced2f015c)

**Returns:** transaction id for the started transaction

**Throws**

- `com.tailf.navu.NavuException`

### startRunningTrans(int, String, String, String, String) <a href="#startrunningtrans-0b37ed6a4aa8" id="startrunningtrans-0b37ed6a4aa8"></a>

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

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `int mode`
- `String vendor`
- `String product`
- `String version`
- `String clientId`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
