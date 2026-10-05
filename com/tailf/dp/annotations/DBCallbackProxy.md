# DBCallbackProxy <a href="#cls-DBCallbackProxy" id="cls-DBCallbackProxy"></a>

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

- [DBCallbackProxy(Object)](#m-DBCallbackProxy-2ee018145cda)

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

- [activateCheckpointRunning(DpDbContext)](#m-activateCheckpointRunning-6d290282dc64)
- [addActionCapability(DBCBType)](#m-addActionCapability-3e432bb771dc)
- [addActionMethod(String, Method)](#m-addActionMethod-cf3e43a67fd9)
- [addCheckpointRunning(DpDbContext)](#m-addCheckpointRunning-e8ef0fad176a)
- [candidateChkNotModified(DpDbContext)](#m-candidateChkNotModified-73d415936fab)
- [candidateCommit(DpDbContext, int)](#m-candidateCommit-c7c8900fd15e)
- [candidateConfirmingCommit(DpDbContext)](#m-candidateConfirmingCommit-e1728f2c501d)
- [candidateReset(DpDbContext)](#m-candidateReset-20893cda7340)
- [candidateRollbackRunning(DpDbContext)](#m-candidateRollbackRunning-101fc2327941)
- [candidateValidate(DpDbContext)](#m-candidateValidate-c71b01c4e9e6)
- [copyRunningToStartup(DpDbContext)](#m-copyRunningToStartup-963b6506a3d3)
- [delCheckpointRunning(DpDbContext)](#m-delCheckpointRunning-b03068abbaef)
- [deleteConfig(DpDbContext, int)](#m-deleteConfig-bac554ff2a00)
- [getBackupObject()](#m-getBackupObject-a6fb23c24524)
- [getDBCallbackProxys(Object)](#m-getDBCallbackProxys-f00028fe21f3)
- [lock(DpDbContext, int)](#m-lock-ed56d39d3ff0)
- [lockPartial(DpDbContext, int, int, ConfObject[][])](#m-lockPartial-cb09f4152af4)
- [mask()](#m-mask-24c2fa29c6af)
- [runningChkNotModified(DpDbContext)](#m-runningChkNotModified-0cfa3cd55796)
- [unlock(DpDbContext, int)](#m-unlock-f30f2fcf978a)
- [unlockPartial(DpDbContext, int, int)](#m-unlockPartial-3d1988a4cb5d)

## Constructors

### DBCallbackProxy(Object) <a href="#m-DBCallbackProxy-2ee018145cda" id="m-DBCallbackProxy-2ee018145cda"></a>

```java
public DBCallbackProxy(Object backupObject)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO


## Methods

### activateCheckpointRunning(DpDbContext) <a href="#m-activateCheckpointRunning-6d290282dc64" id="m-activateCheckpointRunning-6d290282dc64"></a>

```java
public void activateCheckpointRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

### addActionCapability(DBCBType) <a href="#m-addActionCapability-3e432bb771dc" id="m-addActionCapability-3e432bb771dc"></a>

```java
public void addActionCapability(com.tailf.dp.proto.DBCBType dbCBType)
```

Types: [DBCBType](../proto/DBCBType.md#cls-DBCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.DBCBType dbCBType` - action type

### addActionMethod(String, Method) <a href="#m-addActionMethod-cf3e43a67fd9" id="m-addActionMethod-cf3e43a67fd9"></a>

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

### addCheckpointRunning(DpDbContext) <a href="#m-addCheckpointRunning-e8ef0fad176a" id="m-addCheckpointRunning-e8ef0fad176a"></a>

```java
public void addCheckpointRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

### candidateChkNotModified(DpDbContext) <a href="#m-candidateChkNotModified-73d415936fab" id="m-candidateChkNotModified-73d415936fab"></a>

```java
public void candidateChkNotModified(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

### candidateCommit(DpDbContext, int) <a href="#m-candidateCommit-c7c8900fd15e" id="m-candidateCommit-c7c8900fd15e"></a>

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

### candidateConfirmingCommit(DpDbContext) <a href="#m-candidateConfirmingCommit-e1728f2c501d" id="m-candidateConfirmingCommit-e1728f2c501d"></a>

```java
public void candidateConfirmingCommit(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

### candidateReset(DpDbContext) <a href="#m-candidateReset-20893cda7340" id="m-candidateReset-20893cda7340"></a>

```java
public void candidateReset(com.tailf.dp.DpDbContext dbx) throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

### candidateRollbackRunning(DpDbContext) <a href="#m-candidateRollbackRunning-101fc2327941" id="m-candidateRollbackRunning-101fc2327941"></a>

```java
public void candidateRollbackRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

### candidateValidate(DpDbContext) <a href="#m-candidateValidate-c71b01c4e9e6" id="m-candidateValidate-c71b01c4e9e6"></a>

```java
public void candidateValidate(com.tailf.dp.DpDbContext dbx) throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

### copyRunningToStartup(DpDbContext) <a href="#m-copyRunningToStartup-963b6506a3d3" id="m-copyRunningToStartup-963b6506a3d3"></a>

```java
public void copyRunningToStartup(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

### delCheckpointRunning(DpDbContext) <a href="#m-delCheckpointRunning-b03068abbaef" id="m-delCheckpointRunning-b03068abbaef"></a>

```java
public void delCheckpointRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

### deleteConfig(DpDbContext, int) <a href="#m-deleteConfig-bac554ff2a00" id="m-deleteConfig-bac554ff2a00"></a>

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

### getBackupObject() <a href="#m-getBackupObject-a6fb23c24524" id="m-getBackupObject-a6fb23c24524"></a>

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

### getDBCallbackProxys(Object) <a href="#m-getDBCallbackProxys-f00028fe21f3" id="m-getDBCallbackProxys-f00028fe21f3"></a>

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

### lock(DpDbContext, int) <a href="#m-lock-ed56d39d3ff0" id="m-lock-ed56d39d3ff0"></a>

```java
public void lock(com.tailf.dp.DpDbContext dbx, int dbname) throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`
- `int dbname`

### lockPartial(DpDbContext, int, int, ConfObject[][]) <a href="#m-lockPartial-cb09f4152af4" id="m-lockPartial-cb09f4152af4"></a>

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

### mask() <a href="#m-mask-24c2fa29c6af" id="m-mask-24c2fa29c6af"></a>

```java
public int mask()
```

### runningChkNotModified(DpDbContext) <a href="#m-runningChkNotModified-0cfa3cd55796" id="m-runningChkNotModified-0cfa3cd55796"></a>

```java
public void runningChkNotModified(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

### unlock(DpDbContext, int) <a href="#m-unlock-f30f2fcf978a" id="m-unlock-f30f2fcf978a"></a>

```java
public void unlock(com.tailf.dp.DpDbContext dbx, int dbname) throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#cls-DpDbContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`
- `int dbname`

### unlockPartial(DpDbContext, int, int) <a href="#m-unlockPartial-3d1988a4cb5d" id="m-unlockPartial-3d1988a4cb5d"></a>

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
