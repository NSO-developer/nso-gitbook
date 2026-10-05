<a id="cls-DBCallbackProxy"></a>
# DBCallbackProxy

```java
public class com.tailf.dp.annotations.DBCallbackProxy
    implements com.tailf.dp.DpDbCallback
```

Types: [DpDbCallback](../DpDbCallback.md#cls-DpDbCallback)

Callback proxy for DB Callbacks. Implements the [`DpDbCallback`](../DpDbCallback.md#cls-DpDbCallback)
 interface and delegates calls to the registered callback POJO with annotated
 methods

**Since:** 3.2.0

## Members

**Constructors**:

- [DBCallbackProxy(Object)](#m-dbcallbackproxy-2ee018145cda)

**Fields**:

- [M_ACTIVATE_CHECKPOINT_RUNNING](../DpDbCallback.md#m-M_ACTIVATE_CHECKPOINT_RUNNING) from DpDbCallback
- [M_ADD_CHECKPOINT_RUNNING](../DpDbCallback.md#m-M_ADD_CHECKPOINT_RUNNING) from DpDbCallback
- [M_ALL](../DpDbCallback.md#m-M_ALL) from DpDbCallback
- [M_CANDIDATE_CHK_NOT_MODIFIED](../DpDbCallback.md#m-M_CANDIDATE_CHK_NOT_MODIFIED) from DpDbCallback
- [M_CANDIDATE_COMMIT](../DpDbCallback.md#m-M_CANDIDATE_COMMIT) from DpDbCallback
- [M_CANDIDATE_CONFIRMING_COMMIT](../DpDbCallback.md#m-M_CANDIDATE_CONFIRMING_COMMIT) from DpDbCallback
- [M_CANDIDATE_RESET](../DpDbCallback.md#m-M_CANDIDATE_RESET) from DpDbCallback
- [M_CANDIDATE_ROLLBACK_RUNNING](../DpDbCallback.md#m-M_CANDIDATE_ROLLBACK_RUNNING) from DpDbCallback
- [M_CANDIDATE_VALIDATE](../DpDbCallback.md#m-M_CANDIDATE_VALIDATE) from DpDbCallback
- [M_COPY_RUNNING_TO_STARTUP](../DpDbCallback.md#m-M_COPY_RUNNING_TO_STARTUP) from DpDbCallback
- [M_DEL_CHECKPOINT_RUNNING](../DpDbCallback.md#m-M_DEL_CHECKPOINT_RUNNING) from DpDbCallback
- [M_DELETE_CONFIG](../DpDbCallback.md#m-M_DELETE_CONFIG) from DpDbCallback
- [M_LOCK](../DpDbCallback.md#m-M_LOCK) from DpDbCallback
- [M_LOCK_PARTIAL](../DpDbCallback.md#m-M_LOCK_PARTIAL) from DpDbCallback
- [M_RUNNING_CHK_NOT_MODIFIED](../DpDbCallback.md#m-M_RUNNING_CHK_NOT_MODIFIED) from DpDbCallback
- [M_UNLOCK](../DpDbCallback.md#m-M_UNLOCK) from DpDbCallback
- [M_UNLOCK_PARTIAL](../DpDbCallback.md#m-M_UNLOCK_PARTIAL) from DpDbCallback

**Methods**:

- [activateCheckpointRunning(DpDbContext)](#m-activatecheckpointrunning-6d290282dc64)
- [addActionCapability(DBCBType)](#m-addactioncapability-3e432bb771dc)
- [addActionMethod(String, Method)](#m-addactionmethod-cf3e43a67fd9)
- [addCheckpointRunning(DpDbContext)](#m-addcheckpointrunning-e8ef0fad176a)
- [candidateChkNotModified(DpDbContext)](#m-candidatechknotmodified-73d415936fab)
- [candidateCommit(DpDbContext, int)](#m-candidatecommit-c7c8900fd15e)
- [candidateConfirmingCommit(DpDbContext)](#m-candidateconfirmingcommit-e1728f2c501d)
- [candidateReset(DpDbContext)](#m-candidatereset-20893cda7340)
- [candidateRollbackRunning(DpDbContext)](#m-candidaterollbackrunning-101fc2327941)
- [candidateValidate(DpDbContext)](#m-candidatevalidate-c71b01c4e9e6)
- [copyRunningToStartup(DpDbContext)](#m-copyrunningtostartup-963b6506a3d3)
- [delCheckpointRunning(DpDbContext)](#m-delcheckpointrunning-b03068abbaef)
- [deleteConfig(DpDbContext, int)](#m-deleteconfig-bac554ff2a00)
- [getBackupObject()](#m-getbackupobject-a6fb23c24524)
- [getDBCallbackProxys(Object)](#m-getdbcallbackproxys-f00028fe21f3)
- [lock(DpDbContext, int)](#m-lock-ed56d39d3ff0)
- [lockPartial(DpDbContext, int, int, ConfObject[][])](#m-lockpartial-cb09f4152af4)
- [mask()](#m-mask-24c2fa29c6af)
- [runningChkNotModified(DpDbContext)](#m-runningchknotmodified-0cfa3cd55796)
- [unlock(DpDbContext, int)](#m-unlock-f30f2fcf978a)
- [unlockPartial(DpDbContext, int, int)](#m-unlockpartial-3d1988a4cb5d)

## Constructors

<a id="m-dbcallbackproxy-2ee018145cda"></a>
### DBCallbackProxy(Object)

```java
public DBCallbackProxy(Object backupObject)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO


## Methods

<a id="m-activatecheckpointrunning-6d290282dc64"></a>
### activateCheckpointRunning(DpDbContext)

```java
public void activateCheckpointRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

<a id="m-addactioncapability-3e432bb771dc"></a>
### addActionCapability(DBCBType)

```java
public void addActionCapability(com.tailf.dp.proto.DBCBType dbCBType)
```

Types: [DBCBType](../proto/DBCBType.md#cls-DBCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.DBCBType dbCBType` - action type

<a id="m-addactionmethod-cf3e43a67fd9"></a>
### addActionMethod(String, Method)

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

<a id="m-addcheckpointrunning-e8ef0fad176a"></a>
### addCheckpointRunning(DpDbContext)

```java
public void addCheckpointRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

<a id="m-candidatechknotmodified-73d415936fab"></a>
### candidateChkNotModified(DpDbContext)

```java
public void candidateChkNotModified(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

<a id="m-candidatecommit-c7c8900fd15e"></a>
### candidateCommit(DpDbContext, int)

```java
public void candidateCommit(
    com.tailf.dp.DpDbContext dbx,
    int timeout
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`
- `int timeout`

<a id="m-candidateconfirmingcommit-e1728f2c501d"></a>
### candidateConfirmingCommit(DpDbContext)

```java
public void candidateConfirmingCommit(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

<a id="m-candidatereset-20893cda7340"></a>
### candidateReset(DpDbContext)

```java
public void candidateReset(com.tailf.dp.DpDbContext dbx) throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

<a id="m-candidaterollbackrunning-101fc2327941"></a>
### candidateRollbackRunning(DpDbContext)

```java
public void candidateRollbackRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

<a id="m-candidatevalidate-c71b01c4e9e6"></a>
### candidateValidate(DpDbContext)

```java
public void candidateValidate(com.tailf.dp.DpDbContext dbx) throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

<a id="m-copyrunningtostartup-963b6506a3d3"></a>
### copyRunningToStartup(DpDbContext)

```java
public void copyRunningToStartup(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

<a id="m-delcheckpointrunning-b03068abbaef"></a>
### delCheckpointRunning(DpDbContext)

```java
public void delCheckpointRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

<a id="m-deleteconfig-bac554ff2a00"></a>
### deleteConfig(DpDbContext, int)

```java
public void deleteConfig(
    com.tailf.dp.DpDbContext dbx,
    int dbname
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`
- `int dbname`

<a id="m-getbackupobject-a6fb23c24524"></a>
### getBackupObject()

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

<a id="m-getdbcallbackproxys-f00028fe21f3"></a>
### getDBCallbackProxys(Object)

```java
public static com.tailf.dp.annotations.DBCallbackProxy[] getDBCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DBCallbackProxy](DBCallbackProxy.md#cls-DBCallbackProxy), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of DBCallbackProxy

**Throws**

- `DpCallbackException`

<a id="m-lock-ed56d39d3ff0"></a>
### lock(DpDbContext, int)

```java
public void lock(com.tailf.dp.DpDbContext dbx, int dbname) throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`
- `int dbname`

<a id="m-lockpartial-cb09f4152af4"></a>
### lockPartial(DpDbContext, int, int, ConfObject[][])

```java
public void lockPartial(
    com.tailf.dp.DpDbContext dbx,
    int dbname,
    int lockid,
    com.tailf.conf.ConfObject[][] paths
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`
- `int dbname`
- `int lockid`
- `com.tailf.conf.ConfObject[][] paths`

<a id="m-mask-24c2fa29c6af"></a>
### mask()

```java
public int mask()
```

<a id="m-runningchknotmodified-0cfa3cd55796"></a>
### runningChkNotModified(DpDbContext)

```java
public void runningChkNotModified(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

<a id="m-unlock-f30f2fcf978a"></a>
### unlock(DpDbContext, int)

```java
public void unlock(com.tailf.dp.DpDbContext dbx, int dbname) throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`
- `int dbname`

<a id="m-unlockpartial-3d1988a4cb5d"></a>
### unlockPartial(DpDbContext, int, int)

```java
public void unlockPartial(
    com.tailf.dp.DpDbContext dbx,
    int dbname,
    int lockid
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`
- `int dbname`
- `int lockid`
