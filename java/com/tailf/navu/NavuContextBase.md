# NavuContextBase <a href="#navucontextbase-0061e2b12534" id="navucontextbase-0061e2b12534"></a>

```java
public abstract class com.tailf.navu.NavuContextBase
```

This class is the base class for [`NavuContext`](NavuContext.md#navucontext-2974e9f92a9e).
 It many contains methods for handling CDB type contexts i.e contexts created
 by the `NavuContextBase#NavuContextBase(Cdb)` or
 `NavuContextBase#NavuContextBase(CdbSession)` constructors.

 Note, that instead of using CDB type contexts it is possible to instead use
 the [`NavuContext#NavuContext(Maapi)`](NavuContext.md#navucontext-af99f9cc97c7) constructor followed by a call of
 [`NavuContext#startOperationalTrans(int)`](NavuContext.md#startoperationaltrans-9d10bde402ce)

**Related classes**

- [NavuContext](NavuContext.md#navucontext-2974e9f92a9e)

## Members

**Fields**:

- [unsetCaseInChoice](#unsetcaseinchoice-6309da590bfe)

**Methods**:

- [getBackingStoreCdb\(\)](#getbackingstorecdb-73329cf7d4e1)
- [getBackingStoreCdbSession\(\)](#getbackingstorecdbsession-8b0ef17e8ea3)
- [getCdbSubscriber\(\)](#getcdbsubscriber-f292c8c67d4d)
- [getMaapi\(\)](#getmaapi-0ce8975d8ec6)
- [getMaapiHandle\(\)](#getmaapihandle-ba447f5d4e3f)
- [getNsList\(\)](#getnslist-0345f486e876)
- [getReadConfSession\(\)](#getreadconfsession-ece7e5773db9)
- [getReadOperSession\(\)](#getreadopersession-7e103aba03ba)
- [getWriteOperSession\(\)](#getwriteopersession-eb5d274da267)
- [hasCdbSubscriber\(\)](#hascdbsubscriber-3650a7c55283)
- [isCdb\(\)](#iscdb-20ec16d14862)
- [isCdbSession\(\)](#iscdbsession-71fe8b2aab5d)
- [isMaapi\(\)](#ismaapi-5c500ef256ce)
- [isOnline\(\)](#isonline-90688b264b83)
- [removeCdbSessions\(\)](#removecdbsessions-71502a05a702)
- [set\(NavuContextBase\)](#set-aa955bb80732)
- [setOption\(UnSetCaseInChoice\)](#setoption-13f7d349ceea)
- [setReadConfLocks\(EnumSet\<CdbLockType\>\)](#setreadconflocks-43f86af9b510)
- [setReadOperLocks\(EnumSet\<CdbLockType\>\)](#setreadoperlocks-9c615c121ad2)
- [setWriteOperLocks\(EnumSet\<CdbLockType\>\)](#setwriteoperlocks-d3a3d78b7d7d)
- [toString\(\)](#tostring-e9d48c5503ef)

**Nested Types**:

- [UnSetCaseInChoice](NavuContextBase/UnSetCaseInChoice.md#unsetcaseinchoice-f6b21f3bb1fe)

## Fields

### unsetCaseInChoice <a href="#unsetcaseinchoice-6309da590bfe" id="unsetcaseinchoice-6309da590bfe"></a>

```java
public com.tailf.navu.NavuContextBase.UnSetCaseInChoice unsetCaseInChoice;
```

Types: [UnSetCaseInChoice](NavuContextBase/UnSetCaseInChoice.md#unsetcaseinchoice-f6b21f3bb1fe)

Default behavior for unset case in choice.
 print warn msg in the log.


## Methods

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

### getCdbSubscriber() <a href="#getcdbsubscriber-f292c8c67d4d" id="getcdbsubscriber-f292c8c67d4d"></a>

```java
public com.tailf.cdb.CdbSubscription getCdbSubscriber()
```

Types: [CdbSubscription](../cdb/CdbSubscription.md#cdbsubscription-f17c8fe4dc81)

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
 `NavuContextBase#NavuContextBase(CdbSession)`
 this session will be returned.
 Otherwise retrieves a CdbSession for reading CDB_RUNNING database with
 the default locks if not defined by [`setReadConfLocks(EnumSet)`](NavuContextBase.md#setreadconflocks-43f86af9b510)

**Returns:** CdbSession

### getReadOperSession() <a href="#getreadopersession-7e103aba03ba" id="getreadopersession-7e103aba03ba"></a>

```java
public com.tailf.cdb.CdbSession getReadOperSession()
```

Types: [CdbSession](../cdb/CdbSession.md#cdbsession-9ffa54666283)

Retrieves a CdbSession for reading CDB_OPERATIONAL database with the
 default locks if not defined by [`setReadOperLocks(EnumSet)`](NavuContextBase.md#setreadoperlocks-9c615c121ad2)

**Returns:** CdbSession

### getWriteOperSession() <a href="#getwriteopersession-eb5d274da267" id="getwriteopersession-eb5d274da267"></a>

```java
public com.tailf.cdb.CdbSession getWriteOperSession()
```

Types: [CdbSession](../cdb/CdbSession.md#cdbsession-9ffa54666283)

Retrieves a CdbSession for writing CDB_OPERATIONAL database with the
 default locks if not defined by [`setWriteOperLocks(EnumSet)`](NavuContextBase.md#setwriteoperlocks-d3a3d78b7d7d)

**Returns:** CdbSession

### hasCdbSubscriber() <a href="#hascdbsubscriber-3650a7c55283" id="hascdbsubscriber-3650a7c55283"></a>

```java
public boolean hasCdbSubscriber()
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

### removeCdbSessions() <a href="#removecdbsessions-71502a05a702" id="removecdbsessions-71502a05a702"></a>

```java
public void removeCdbSessions()
```

Clears all the CDB sessions associates with the mapping
 between the the supplied Cdb socket and the ( in CDB mode )

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
