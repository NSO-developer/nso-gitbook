# DBCallbackProxy <a href="#dbcallbackproxy-f1a20c8a904b" id="dbcallbackproxy-f1a20c8a904b"></a>

```java
public class com.tailf.dp.annotations.DBCallbackProxy
    implements com.tailf.dp.DpDbCallback
```

Types: [DpDbCallback](../DpDbCallback.md#dpdbcallback-7fcc01bd0281)

Callback proxy for DB Callbacks. Implements the [`DpDbCallback`](../DpDbCallback.md#dpdbcallback-7fcc01bd0281)
 interface and delegates calls to the registered callback POJO with annotated
 methods

**Since:** 3.2.0

## Members

**Constructors**:

- [DBCallbackProxy(Object)](#dbcallbackproxy-2ee018145cda)

**Fields**:

- [M_ACTIVATE_CHECKPOINT_RUNNING](../DpDbCallback.md#m_activate_checkpoint_running-0ebd33a643c3) from DpDbCallback
- [M_ADD_CHECKPOINT_RUNNING](../DpDbCallback.md#m_add_checkpoint_running-43b65718bdd6) from DpDbCallback
- [M_ALL](../DpDbCallback.md#m_all-e3844e41e8ee) from DpDbCallback
- [M_CANDIDATE_CHK_NOT_MODIFIED](../DpDbCallback.md#m_candidate_chk_not_modified-f172de5cec21) from DpDbCallback
- [M_CANDIDATE_COMMIT](../DpDbCallback.md#m_candidate_commit-484bd03f581b) from DpDbCallback
- [M_CANDIDATE_CONFIRMING_COMMIT](../DpDbCallback.md#m_candidate_confirming_commit-6299d1509720) from DpDbCallback
- [M_CANDIDATE_RESET](../DpDbCallback.md#m_candidate_reset-f3acd855e47f) from DpDbCallback
- [M_CANDIDATE_ROLLBACK_RUNNING](../DpDbCallback.md#m_candidate_rollback_running-a7202b20d951) from DpDbCallback
- [M_CANDIDATE_VALIDATE](../DpDbCallback.md#m_candidate_validate-87728731434d) from DpDbCallback
- [M_COPY_RUNNING_TO_STARTUP](../DpDbCallback.md#m_copy_running_to_startup-02d63903fcec) from DpDbCallback
- [M_DEL_CHECKPOINT_RUNNING](../DpDbCallback.md#m_del_checkpoint_running-3c2efd2f93fb) from DpDbCallback
- [M_DELETE_CONFIG](../DpDbCallback.md#m_delete_config-61b73fae3b26) from DpDbCallback
- [M_LOCK](../DpDbCallback.md#m_lock-f8a733783845) from DpDbCallback
- [M_LOCK_PARTIAL](../DpDbCallback.md#m_lock_partial-aa26abd80f7d) from DpDbCallback
- [M_RUNNING_CHK_NOT_MODIFIED](../DpDbCallback.md#m_running_chk_not_modified-fea5508dd165) from DpDbCallback
- [M_UNLOCK](../DpDbCallback.md#m_unlock-58690e51e70c) from DpDbCallback
- [M_UNLOCK_PARTIAL](../DpDbCallback.md#m_unlock_partial-a67ada980c0d) from DpDbCallback

**Methods**:

- [activateCheckpointRunning(DpDbContext)](#activatecheckpointrunning-6d290282dc64)
- [addActionCapability(DBCBType)](#addactioncapability-3e432bb771dc)
- [addActionMethod(String, Method)](#addactionmethod-cf3e43a67fd9)
- [addCheckpointRunning(DpDbContext)](#addcheckpointrunning-e8ef0fad176a)
- [candidateChkNotModified(DpDbContext)](#candidatechknotmodified-73d415936fab)
- [candidateCommit(DpDbContext, int)](#candidatecommit-c7c8900fd15e)
- [candidateConfirmingCommit(DpDbContext)](#candidateconfirmingcommit-e1728f2c501d)
- [candidateReset(DpDbContext)](#candidatereset-20893cda7340)
- [candidateRollbackRunning(DpDbContext)](#candidaterollbackrunning-101fc2327941)
- [candidateValidate(DpDbContext)](#candidatevalidate-c71b01c4e9e6)
- [copyRunningToStartup(DpDbContext)](#copyrunningtostartup-963b6506a3d3)
- [delCheckpointRunning(DpDbContext)](#delcheckpointrunning-b03068abbaef)
- [deleteConfig(DpDbContext, int)](#deleteconfig-bac554ff2a00)
- [getBackupObject()](#getbackupobject-a6fb23c24524)
- [getDBCallbackProxys(Object)](#getdbcallbackproxys-f00028fe21f3)
- [lock(DpDbContext, int)](#lock-ed56d39d3ff0)
- [lockPartial(DpDbContext, int, int, ConfObject[][])](#lockpartial-cb09f4152af4)
- [mask()](#mask-24c2fa29c6af)
- [runningChkNotModified(DpDbContext)](#runningchknotmodified-0cfa3cd55796)
- [unlock(DpDbContext, int)](#unlock-f30f2fcf978a)
- [unlockPartial(DpDbContext, int, int)](#unlockpartial-3d1988a4cb5d)

## Constructors

### DBCallbackProxy(Object) <a href="#dbcallbackproxy-2ee018145cda" id="dbcallbackproxy-2ee018145cda"></a>

```java
public DBCallbackProxy(Object backupObject)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO


## Methods

### activateCheckpointRunning(DpDbContext) <a href="#activatecheckpointrunning-6d290282dc64" id="activatecheckpointrunning-6d290282dc64"></a>

```java
public void activateCheckpointRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

### addActionCapability(DBCBType) <a href="#addactioncapability-3e432bb771dc" id="addactioncapability-3e432bb771dc"></a>

```java
public void addActionCapability(com.tailf.dp.proto.DBCBType dbCBType)
```

Types: [DBCBType](../proto/DBCBType.md#dbcbtype-b9ff294018bf)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.DBCBType dbCBType` - action type

### addActionMethod(String, Method) <a href="#addactionmethod-cf3e43a67fd9" id="addactionmethod-cf3e43a67fd9"></a>

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

### addCheckpointRunning(DpDbContext) <a href="#addcheckpointrunning-e8ef0fad176a" id="addcheckpointrunning-e8ef0fad176a"></a>

```java
public void addCheckpointRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

### candidateChkNotModified(DpDbContext) <a href="#candidatechknotmodified-73d415936fab" id="candidatechknotmodified-73d415936fab"></a>

```java
public void candidateChkNotModified(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

### candidateCommit(DpDbContext, int) <a href="#candidatecommit-c7c8900fd15e" id="candidatecommit-c7c8900fd15e"></a>

```java
public void candidateCommit(
    com.tailf.dp.DpDbContext dbx,
    int timeout
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`
- `int timeout`

### candidateConfirmingCommit(DpDbContext) <a href="#candidateconfirmingcommit-e1728f2c501d" id="candidateconfirmingcommit-e1728f2c501d"></a>

```java
public void candidateConfirmingCommit(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

### candidateReset(DpDbContext) <a href="#candidatereset-20893cda7340" id="candidatereset-20893cda7340"></a>

```java
public void candidateReset(com.tailf.dp.DpDbContext dbx) throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

### candidateRollbackRunning(DpDbContext) <a href="#candidaterollbackrunning-101fc2327941" id="candidaterollbackrunning-101fc2327941"></a>

```java
public void candidateRollbackRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

### candidateValidate(DpDbContext) <a href="#candidatevalidate-c71b01c4e9e6" id="candidatevalidate-c71b01c4e9e6"></a>

```java
public void candidateValidate(com.tailf.dp.DpDbContext dbx) throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

### copyRunningToStartup(DpDbContext) <a href="#copyrunningtostartup-963b6506a3d3" id="copyrunningtostartup-963b6506a3d3"></a>

```java
public void copyRunningToStartup(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

### delCheckpointRunning(DpDbContext) <a href="#delcheckpointrunning-b03068abbaef" id="delcheckpointrunning-b03068abbaef"></a>

```java
public void delCheckpointRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

### deleteConfig(DpDbContext, int) <a href="#deleteconfig-bac554ff2a00" id="deleteconfig-bac554ff2a00"></a>

```java
public void deleteConfig(
    com.tailf.dp.DpDbContext dbx,
    int dbname
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`
- `int dbname`

### getBackupObject() <a href="#getbackupobject-a6fb23c24524" id="getbackupobject-a6fb23c24524"></a>

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

### getDBCallbackProxys(Object) <a href="#getdbcallbackproxys-f00028fe21f3" id="getdbcallbackproxys-f00028fe21f3"></a>

```java
public static com.tailf.dp.annotations.DBCallbackProxy[] getDBCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DBCallbackProxy](DBCallbackProxy.md#dbcallbackproxy-f1a20c8a904b), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of DBCallbackProxy

**Throws**

- `DpCallbackException`

### lock(DpDbContext, int) <a href="#lock-ed56d39d3ff0" id="lock-ed56d39d3ff0"></a>

```java
public void lock(com.tailf.dp.DpDbContext dbx, int dbname) throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`
- `int dbname`

### lockPartial(DpDbContext, int, int, ConfObject[][]) <a href="#lockpartial-cb09f4152af4" id="lockpartial-cb09f4152af4"></a>

```java
public void lockPartial(
    com.tailf.dp.DpDbContext dbx,
    int dbname,
    int lockid,
    com.tailf.conf.ConfObject[][] paths
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`
- `int dbname`
- `int lockid`
- `com.tailf.conf.ConfObject[][] paths`

### mask() <a href="#mask-24c2fa29c6af" id="mask-24c2fa29c6af"></a>

```java
public int mask()
```

### runningChkNotModified(DpDbContext) <a href="#runningchknotmodified-0cfa3cd55796" id="runningchknotmodified-0cfa3cd55796"></a>

```java
public void runningChkNotModified(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`

### unlock(DpDbContext, int) <a href="#unlock-f30f2fcf978a" id="unlock-f30f2fcf978a"></a>

```java
public void unlock(com.tailf.dp.DpDbContext dbx, int dbname) throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`
- `int dbname`

### unlockPartial(DpDbContext, int, int) <a href="#unlockpartial-3d1988a4cb5d" id="unlockpartial-3d1988a4cb5d"></a>

```java
public void unlockPartial(
    com.tailf.dp.DpDbContext dbx,
    int dbname,
    int lockid
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpDbContext dbx`
- `int dbname`
- `int lockid`
