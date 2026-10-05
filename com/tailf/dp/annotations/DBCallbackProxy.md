<a id="s-DBCallbackProxy"></a>
# DBCallbackProxy

```java
public class com.tailf.dp.annotations.DBCallbackProxy
    implements com.tailf.dp.DpDbCallback
```

Types: [DpDbCallback](../DpDbCallback.md#s-DpDbCallback)

Callback proxy for DB Callbacks. Implements the [`DpDbCallback`](../DpDbCallback.md#s-DpDbCallback)
 interface and delegates calls to the registered callback POJO with annotated
 methods

**Since:** 3.2.0

## Members

**Constructors**:

- [DBCallbackProxy(Object)](#s-DBCallbackProxy-1)

**Fields**:

- [M_ACTIVATE_CHECKPOINT_RUNNING](../DpDbCallback.md#s-M_ACTIVATE_CHECKPOINT_RUNNING) from DpDbCallback
- [M_ADD_CHECKPOINT_RUNNING](../DpDbCallback.md#s-M_ADD_CHECKPOINT_RUNNING) from DpDbCallback
- [M_ALL](../DpDbCallback.md#s-M_ALL) from DpDbCallback
- [M_CANDIDATE_CHK_NOT_MODIFIED](../DpDbCallback.md#s-M_CANDIDATE_CHK_NOT_MODIFIED) from DpDbCallback
- [M_CANDIDATE_COMMIT](../DpDbCallback.md#s-M_CANDIDATE_COMMIT) from DpDbCallback
- [M_CANDIDATE_CONFIRMING_COMMIT](../DpDbCallback.md#s-M_CANDIDATE_CONFIRMING_COMMIT) from DpDbCallback
- [M_CANDIDATE_RESET](../DpDbCallback.md#s-M_CANDIDATE_RESET) from DpDbCallback
- [M_CANDIDATE_ROLLBACK_RUNNING](../DpDbCallback.md#s-M_CANDIDATE_ROLLBACK_RUNNING) from DpDbCallback
- [M_CANDIDATE_VALIDATE](../DpDbCallback.md#s-M_CANDIDATE_VALIDATE) from DpDbCallback
- [M_COPY_RUNNING_TO_STARTUP](../DpDbCallback.md#s-M_COPY_RUNNING_TO_STARTUP) from DpDbCallback
- [M_DEL_CHECKPOINT_RUNNING](../DpDbCallback.md#s-M_DEL_CHECKPOINT_RUNNING) from DpDbCallback
- [M_DELETE_CONFIG](../DpDbCallback.md#s-M_DELETE_CONFIG) from DpDbCallback
- [M_LOCK](../DpDbCallback.md#s-M_LOCK) from DpDbCallback
- [M_LOCK_PARTIAL](../DpDbCallback.md#s-M_LOCK_PARTIAL) from DpDbCallback
- [M_RUNNING_CHK_NOT_MODIFIED](../DpDbCallback.md#s-M_RUNNING_CHK_NOT_MODIFIED) from DpDbCallback
- [M_UNLOCK](../DpDbCallback.md#s-M_UNLOCK) from DpDbCallback
- [M_UNLOCK_PARTIAL](../DpDbCallback.md#s-M_UNLOCK_PARTIAL) from DpDbCallback

**Methods**:

- [activateCheckpointRunning(DpDbContext)](#s-activateCheckpointRunning)
- [addActionCapability(DBCBType)](#s-addActionCapability)
- [addActionMethod(String, Method)](#s-addActionMethod)
- [addCheckpointRunning(DpDbContext)](#s-addCheckpointRunning)
- [candidateChkNotModified(DpDbContext)](#s-candidateChkNotModified)
- [candidateCommit(DpDbContext, int)](#s-candidateCommit)
- [candidateConfirmingCommit(DpDbContext)](#s-candidateConfirmingCommit)
- [candidateReset(DpDbContext)](#s-candidateReset)
- [candidateRollbackRunning(DpDbContext)](#s-candidateRollbackRunning)
- [candidateValidate(DpDbContext)](#s-candidateValidate)
- [copyRunningToStartup(DpDbContext)](#s-copyRunningToStartup)
- [delCheckpointRunning(DpDbContext)](#s-delCheckpointRunning)
- [deleteConfig(DpDbContext, int)](#s-deleteConfig)
- [getBackupObject()](#s-getBackupObject)
- [getDBCallbackProxys(Object)](#s-getDBCallbackProxys)
- [lock(DpDbContext, int)](#s-lock)
- [lockPartial(DpDbContext, int, int, ConfObject[][])](#s-lockPartial)
- [mask()](#s-mask)
- [runningChkNotModified(DpDbContext)](#s-runningChkNotModified)
- [unlock(DpDbContext, int)](#s-unlock)
- [unlockPartial(DpDbContext, int, int)](#s-unlockPartial)

## Constructors

<a id="s-DBCallbackProxy-1"></a>
### DBCallbackProxy(Object)

```java
public DBCallbackProxy(Object backupObject)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO


## Methods

<a id="s-activateCheckpointRunning"></a>
### activateCheckpointRunning(DpDbContext)

```java
public void activateCheckpointRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#s-DpDbContext), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

<a id="s-addActionCapability"></a>
### addActionCapability(DBCBType)

```java
public void addActionCapability(com.tailf.dp.proto.DBCBType dbCBType)
```

Types: [DBCBType](../proto/DBCBType.md#s-DBCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.DBCBType dbCBType` - action type

<a id="s-addActionMethod"></a>
### addActionMethod(String, Method)

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

<a id="s-addCheckpointRunning"></a>
### addCheckpointRunning(DpDbContext)

```java
public void addCheckpointRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#s-DpDbContext), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

<a id="s-candidateChkNotModified"></a>
### candidateChkNotModified(DpDbContext)

```java
public void candidateChkNotModified(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#s-DpDbContext), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

<a id="s-candidateCommit"></a>
### candidateCommit(DpDbContext, int)

```java
public void candidateCommit(
    com.tailf.dp.DpDbContext dbx,
    int timeout
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#s-DpDbContext), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`
- `int timeout`

<a id="s-candidateConfirmingCommit"></a>
### candidateConfirmingCommit(DpDbContext)

```java
public void candidateConfirmingCommit(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#s-DpDbContext), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

<a id="s-candidateReset"></a>
### candidateReset(DpDbContext)

```java
public void candidateReset(com.tailf.dp.DpDbContext dbx) throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#s-DpDbContext), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

<a id="s-candidateRollbackRunning"></a>
### candidateRollbackRunning(DpDbContext)

```java
public void candidateRollbackRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#s-DpDbContext), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

<a id="s-candidateValidate"></a>
### candidateValidate(DpDbContext)

```java
public void candidateValidate(com.tailf.dp.DpDbContext dbx) throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#s-DpDbContext), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

<a id="s-copyRunningToStartup"></a>
### copyRunningToStartup(DpDbContext)

```java
public void copyRunningToStartup(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#s-DpDbContext), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

<a id="s-delCheckpointRunning"></a>
### delCheckpointRunning(DpDbContext)

```java
public void delCheckpointRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#s-DpDbContext), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

<a id="s-deleteConfig"></a>
### deleteConfig(DpDbContext, int)

```java
public void deleteConfig(
    com.tailf.dp.DpDbContext dbx,
    int dbname
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#s-DpDbContext), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`
- `int dbname`

<a id="s-getBackupObject"></a>
### getBackupObject()

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

<a id="s-getDBCallbackProxys"></a>
### getDBCallbackProxys(Object)

```java
public static com.tailf.dp.annotations.DBCallbackProxy[] getDBCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DBCallbackProxy](DBCallbackProxy.md#s-DBCallbackProxy), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of DBCallbackProxy

**Throws**

- `DpCallbackException`

<a id="s-lock"></a>
### lock(DpDbContext, int)

```java
public void lock(com.tailf.dp.DpDbContext dbx, int dbname) throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#s-DpDbContext), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`
- `int dbname`

<a id="s-lockPartial"></a>
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

Types: [DpDbContext](../DpDbContext.md#s-DpDbContext), [ConfObject](../../conf/ConfObject.md#s-ConfObject), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`
- `int dbname`
- `int lockid`
- `com.tailf.conf.ConfObject[][] paths`

<a id="s-mask"></a>
### mask()

```java
public int mask()
```

<a id="s-runningChkNotModified"></a>
### runningChkNotModified(DpDbContext)

```java
public void runningChkNotModified(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#s-DpDbContext), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

<a id="s-unlock"></a>
### unlock(DpDbContext, int)

```java
public void unlock(com.tailf.dp.DpDbContext dbx, int dbname) throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#s-DpDbContext), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`
- `int dbname`

<a id="s-unlockPartial"></a>
### unlockPartial(DpDbContext, int, int)

```java
public void unlockPartial(
    com.tailf.dp.DpDbContext dbx,
    int dbname,
    int lockid
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#s-DpDbContext), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`
- `int dbname`
- `int lockid`
