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

- [DBCallbackProxy\(Object\)](#dbcallbackproxy-2ee018145cda)

**Fields**:

- [M\_ACTIVATE\_CHECKPOINT\_RUNNING](../DpDbCallback.md#m_activate_checkpoint_running-0ebd33a643c3) from DpDbCallback
- [M\_ADD\_CHECKPOINT\_RUNNING](../DpDbCallback.md#m_add_checkpoint_running-43b65718bdd6) from DpDbCallback
- [M\_ALL](../DpDbCallback.md#m_all-e3844e41e8ee) from DpDbCallback
- [M\_CANDIDATE\_CHK\_NOT\_MODIFIED](../DpDbCallback.md#m_candidate_chk_not_modified-f172de5cec21) from DpDbCallback
- [M\_CANDIDATE\_COMMIT](../DpDbCallback.md#m_candidate_commit-484bd03f581b) from DpDbCallback
- [M\_CANDIDATE\_CONFIRMING\_COMMIT](../DpDbCallback.md#m_candidate_confirming_commit-6299d1509720) from DpDbCallback
- [M\_CANDIDATE\_RESET](../DpDbCallback.md#m_candidate_reset-f3acd855e47f) from DpDbCallback
- [M\_CANDIDATE\_ROLLBACK\_RUNNING](../DpDbCallback.md#m_candidate_rollback_running-a7202b20d951) from DpDbCallback
- [M\_CANDIDATE\_VALIDATE](../DpDbCallback.md#m_candidate_validate-87728731434d) from DpDbCallback
- [M\_COPY\_RUNNING\_TO\_STARTUP](../DpDbCallback.md#m_copy_running_to_startup-02d63903fcec) from DpDbCallback
- [M\_DEL\_CHECKPOINT\_RUNNING](../DpDbCallback.md#m_del_checkpoint_running-3c2efd2f93fb) from DpDbCallback
- [M\_DELETE\_CONFIG](../DpDbCallback.md#m_delete_config-61b73fae3b26) from DpDbCallback
- [M\_LOCK](../DpDbCallback.md#m_lock-f8a733783845) from DpDbCallback
- [M\_LOCK\_PARTIAL](../DpDbCallback.md#m_lock_partial-aa26abd80f7d) from DpDbCallback
- [M\_RUNNING\_CHK\_NOT\_MODIFIED](../DpDbCallback.md#m_running_chk_not_modified-fea5508dd165) from DpDbCallback
- [M\_UNLOCK](../DpDbCallback.md#m_unlock-58690e51e70c) from DpDbCallback
- [M\_UNLOCK\_PARTIAL](../DpDbCallback.md#m_unlock_partial-a67ada980c0d) from DpDbCallback

**Methods**:

- [activateCheckpointRunning\(DpDbContext\)](#activatecheckpointrunning-6d290282dc64)
- [addActionCapability\(DBCBType\)](#addactioncapability-3e432bb771dc)
- [addActionMethod\(String, Method\)](#addactionmethod-cf3e43a67fd9)
- [addCheckpointRunning\(DpDbContext\)](#addcheckpointrunning-e8ef0fad176a)
- [candidateChkNotModified\(DpDbContext\)](#candidatechknotmodified-73d415936fab)
- [candidateCommit\(DpDbContext, int\)](#candidatecommit-c7c8900fd15e)
- [candidateConfirmingCommit\(DpDbContext\)](#candidateconfirmingcommit-e1728f2c501d)
- [candidateReset\(DpDbContext\)](#candidatereset-20893cda7340)
- [candidateRollbackRunning\(DpDbContext\)](#candidaterollbackrunning-101fc2327941)
- [candidateValidate\(DpDbContext\)](#candidatevalidate-c71b01c4e9e6)
- [copyRunningToStartup\(DpDbContext\)](#copyrunningtostartup-963b6506a3d3)
- [delCheckpointRunning\(DpDbContext\)](#delcheckpointrunning-b03068abbaef)
- [deleteConfig\(DpDbContext, int\)](#deleteconfig-bac554ff2a00)
- [getBackupObject\(\)](#getbackupobject-a6fb23c24524)
- [getDBCallbackProxys\(Object\)](#getdbcallbackproxys-f00028fe21f3)
- [lock\(DpDbContext, int\)](#lock-ed56d39d3ff0)
- [lockPartial\(DpDbContext, int, int, ConfObject\[\]\[\]\)](#lockpartial-cb09f4152af4)
- [mask\(\)](#mask-24c2fa29c6af)
- [runningChkNotModified\(DpDbContext\)](#runningchknotmodified-0cfa3cd55796)
- [unlock\(DpDbContext, int\)](#unlock-f30f2fcf978a)
- [unlockPartial\(DpDbContext, int, int\)](#unlockpartial-3d1988a4cb5d)

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

*Description from* [`DpDbCallback.activateCheckpointRunning(com.tailf.dp.DpDbContext)`](../DpDbCallback.md#activatecheckpointrunning-6d290282dc64)

This method should rollback running to the checkpoint created by
 addCheckpointRunning(). It is called by ConfD when the timer expires or
 if the user session expires.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `com.tailf.dp.DpCallbackException` - Callback method failed.

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

*Description from* [`DpDbCallback.addCheckpointRunning(com.tailf.dp.DpDbContext)`](../DpDbCallback.md#addcheckpointrunning-e8ef0fad176a)

This method should be implemented only when ConfD owns the candidate, and
 confirmed-commit is enabled.

It is responsible for creating a checkpoint of the current running
 configuration and storing the checkpoint in non-volatile memory. When the
 system restarts this method should check if there is a checkpoint
 available, and use the checkpoint instead of running.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `com.tailf.dp.DpCallbackException` - Callback method failed.

### candidateChkNotModified(DpDbContext) <a href="#candidatechknotmodified-73d415936fab" id="candidatechknotmodified-73d415936fab"></a>

```java
public void candidateChkNotModified(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

*Description from* [`DpDbCallback.candidateChkNotModified(com.tailf.dp.DpDbContext)`](../DpDbCallback.md#candidatechknotmodified-73d415936fab)

This method should check to see if the candidate has been modified or
 not. Returns if no modifications has been done since the last commit or
 reset, and throws a `DpCallbackException` (error) if any
 uncommitted modifications exist.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `com.tailf.dp.DpCallbackException` - Callback method failed.

### candidateCommit(DpDbContext, int) <a href="#candidatecommit-c7c8900fd15e" id="candidatecommit-c7c8900fd15e"></a>

```java
public void candidateCommit(
    com.tailf.dp.DpDbContext dbx,
    int timeout
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

*Description from* [`DpDbCallback.candidateCommit(com.tailf.dp.DpDbContext, int)`](../DpDbCallback.md#candidatecommit-c7c8900fd15e)

This method should copy the candidate DB into the running DB. If timeout
 != 0, we should be prepared to do a rollback or act on a
 candidateConfirmingCommit(). The timeout parameter can not be used to set
 a timer for when to rollback; this timer is handled by the ConfD daemon.
 If we terminate without having acted on the candidateConfirmingCommit(),
 we MUST restart with a rollback. Thus we must remember that we are
 waiting for a candidateConfirmingCommit() and we must do so on persistent
 storage. Must only be implemented when the external database owns the
 candidate.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context
- `int timeout` - Timeout value

**Throws**

- `com.tailf.dp.DpCallbackException` - Callback method failed.

### candidateConfirmingCommit(DpDbContext) <a href="#candidateconfirmingcommit-e1728f2c501d" id="candidateconfirmingcommit-e1728f2c501d"></a>

```java
public void candidateConfirmingCommit(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

*Description from* [`DpDbCallback.candidateConfirmingCommit(com.tailf.dp.DpDbContext)`](../DpDbCallback.md#candidateconfirmingcommit-e1728f2c501d)

If the timeout in the candidate_commit() method is != 0, we will be
 either invoked here or in the candidateRollbackRunning() method within
 timeout seconds. candidateConfirmingCommit() should make the commit
 persistent, whereas a call to candidateRollbackRunning() would copy back
 the previous running configuration to running.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `com.tailf.dp.DpCallbackException` - Callback method failed.

### candidateReset(DpDbContext) <a href="#candidatereset-20893cda7340" id="candidatereset-20893cda7340"></a>

```java
public void candidateReset(com.tailf.dp.DpDbContext dbx) throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

*Description from* [`DpDbCallback.candidateReset(com.tailf.dp.DpDbContext)`](../DpDbCallback.md#candidatereset-20893cda7340)

This method is intended to copy the current running configuration into
 the candidate. It is invoked whenever the NETCONF operation
 \<discard-changes\> is executed or when a lock is released without
 committing.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `com.tailf.dp.DpCallbackException` - Callback method failed.

### candidateRollbackRunning(DpDbContext) <a href="#candidaterollbackrunning-101fc2327941" id="candidaterollbackrunning-101fc2327941"></a>

```java
public void candidateRollbackRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

*Description from* [`DpDbCallback.candidateRollbackRunning(com.tailf.dp.DpDbContext)`](../DpDbCallback.md#candidaterollbackrunning-101fc2327941)

If for some reason, apart from a timeout, something goes wrong, we get
 invoked in the candidateRollbackRunning() method. The method should copy
 back the previous running configuration to running.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `com.tailf.dp.DpCallbackException` - Callback method failed.

### candidateValidate(DpDbContext) <a href="#candidatevalidate-c71b01c4e9e6" id="candidatevalidate-c71b01c4e9e6"></a>

```java
public void candidateValidate(com.tailf.dp.DpDbContext dbx) throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

*Description from* [`DpDbCallback.candidateValidate(com.tailf.dp.DpDbContext)`](../DpDbCallback.md#candidatevalidate-c71b01c4e9e6)

This callback is optional. If implemented, the task of the callback is to
 validate the candidate configuration. Note that the running database can
 be validated by the database in the prepare() callback.
 candidateValidate() is only meaningful when an explicit validate
 operation is received, e.g. through NETCONF.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `com.tailf.dp.DpCallbackException` - Callback method failed.

### copyRunningToStartup(DpDbContext) <a href="#copyrunningtostartup-963b6506a3d3" id="copyrunningtostartup-963b6506a3d3"></a>

```java
public void copyRunningToStartup(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

*Description from* [`DpDbCallback.copyRunningToStartup(com.tailf.dp.DpDbContext)`](../DpDbCallback.md#copyrunningtostartup-963b6506a3d3)

Copies the 'running' database to 'startup'.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `com.tailf.dp.DpCallbackException` - Callback method failed.

### delCheckpointRunning(DpDbContext) <a href="#delcheckpointrunning-b03068abbaef" id="delcheckpointrunning-b03068abbaef"></a>

```java
public void delCheckpointRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

*Description from* [`DpDbCallback.delCheckpointRunning(com.tailf.dp.DpDbContext)`](../DpDbCallback.md#delcheckpointrunning-b03068abbaef)

This method should delete a checkpoint created by addCheckPointRunning().
 It is called by ConfD when a confirming commit is received.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `com.tailf.dp.DpCallbackException` - Callback method failed.

### deleteConfig(DpDbContext, int) <a href="#deleteconfig-bac554ff2a00" id="deleteconfig-bac554ff2a00"></a>

```java
public void deleteConfig(
    com.tailf.dp.DpDbContext dbx,
    int dbname
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

*Description from* [`DpDbCallback.deleteConfig(com.tailf.dp.DpDbContext, int)`](../DpDbCallback.md#deleteconfig-bac554ff2a00)

Will be called for 'startup' or 'candidate' only. The database is
 supposed to be set to erased. The dbname constants:

- [`Conf#DB_NONE`](../../conf/Conf.md#db_none-5069c3fe4466)
- [`Conf#DB_CANDIDATE`](../../conf/Conf.md#db_candidate-8b43a337ac93)
- [`Conf#DB_RUNNING`](../../conf/Conf.md#db_running-c391f371da28)
- [`Conf#DB_STARTUP`](../../conf/Conf.md#db_startup-2ce085259486)

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context
- `int dbname` - The database type

**Throws**

- `com.tailf.dp.DpCallbackException` - Callback method failed.

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

- `com.tailf.dp.DpCallbackException`

### lock(DpDbContext, int) <a href="#lock-ed56d39d3ff0" id="lock-ed56d39d3ff0"></a>

```java
public void lock(com.tailf.dp.DpDbContext dbx, int dbname) throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

*Description from* [`DpDbCallback.lock(com.tailf.dp.DpDbContext, int)`](../DpDbCallback.md#lock-ed56d39d3ff0)

This should only be implemented if our database supports locking from
 other sources than through ConfD. If a lock is set through e.g. NETCONF,
 ConfD will first make sure that no other ConfD transaction has locked the
 database. Then it will call lock() to make sure that the database is not
 locked by some other source (such as a CLI). Throws a
 `DpCallbackException` (error) if the lock was already held by
 an external entity.

The dbname constants:

- [`Conf#DB_NONE`](../../conf/Conf.md#db_none-5069c3fe4466)
- [`Conf#DB_CANDIDATE`](../../conf/Conf.md#db_candidate-8b43a337ac93)
- [`Conf#DB_RUNNING`](../../conf/Conf.md#db_running-c391f371da28)
- [`Conf#DB_STARTUP`](../../conf/Conf.md#db_startup-2ce085259486)

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context
- `int dbname` - The database type

**Throws**

- `com.tailf.dp.DpCallbackException` - Callback method failed.

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

*Description from* [`DpDbCallback.lockPartial(com.tailf.dp.DpDbContext, int, int, com.tailf.conf.ConfObject[][])`](../DpDbCallback.md#lockpartial-cb09f4152af4)

This should only be implemented if our database supports locking from
 other sources than through ConfD, see [`lock(DpDbContext,int)`](../DpDbCallback.md#lock-ed56d39d3ff0)
 above. This callback is invoked if a northbound agent requests a partial
 lock. The paths\[\] argument is an array of keypaths that identify the
 leafs and/or subtrees that are to be locked. The lockid is a reference
 that will be used on a subsequent corresponding unlockPartial()
 invocation. Throws a `DpCallbackException` (error) if the lock
 was already held by an external entity.

The dbname constants:

- [`Conf#DB_NONE`](../../conf/Conf.md#db_none-5069c3fe4466)
- [`Conf#DB_CANDIDATE`](../../conf/Conf.md#db_candidate-8b43a337ac93)
- [`Conf#DB_RUNNING`](../../conf/Conf.md#db_running-c391f371da28)
- [`Conf#DB_STARTUP`](../../conf/Conf.md#db_startup-2ce085259486)

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context
- `int dbname` - the database
- `int lockid` - The lock reference
- `com.tailf.conf.ConfObject[][] paths` - Paths to lock

**Throws**

- `com.tailf.dp.DpCallbackException` - Callback method failed

### mask() <a href="#mask-24c2fa29c6af" id="mask-24c2fa29c6af"></a>

```java
public int mask()
```

*Description from* [`DpDbCallback.mask()`](../DpDbCallback.md#mask-24c2fa29c6af)

Mask of flags for methods that are supported by this callback:

- [`M_CANDIDATE_COMMIT`](../DpDbCallback.md#m_candidate_commit-484bd03f581b)
- [`M_CANDIDATE_CONFIRMING_COMMIT`](../DpDbCallback.md#m_candidate_confirming_commit-6299d1509720)
- [`M_CANDIDATE_RESET`](../DpDbCallback.md#m_candidate_reset-f3acd855e47f)
- [`M_CANDIDATE_CHK_NOT_MODIFIED`](../DpDbCallback.md#m_candidate_chk_not_modified-f172de5cec21)
- [`M_CANDIDATE_ROLLBACK_RUNNING`](../DpDbCallback.md#m_candidate_rollback_running-a7202b20d951)
- [`M_CANDIDATE_VALIDATE`](../DpDbCallback.md#m_candidate_validate-87728731434d)
- [`M_ADD_CHECKPOINT_RUNNING`](../DpDbCallback.md#m_add_checkpoint_running-43b65718bdd6)
- [`M_DEL_CHECKPOINT_RUNNING`](../DpDbCallback.md#m_del_checkpoint_running-3c2efd2f93fb)
- [`M_ACTIVATE_CHECKPOINT_RUNNING`](../DpDbCallback.md#m_activate_checkpoint_running-0ebd33a643c3)
- [`M_COPY_RUNNING_TO_STARTUP`](../DpDbCallback.md#m_copy_running_to_startup-02d63903fcec)
- [`M_LOCK`](../DpDbCallback.md#m_lock-f8a733783845)
- [`M_UNLOCK`](../DpDbCallback.md#m_unlock-58690e51e70c)
- [`M_DELETE_CONFIG`](../DpDbCallback.md#m_delete_config-61b73fae3b26)
- [`M_LOCK_PARTIAL`](../DpDbCallback.md#m_lock_partial-aa26abd80f7d)
- [`M_UNLOCK_PARTIAL`](../DpDbCallback.md#m_unlock_partial-a67ada980c0d)
- [`M_RUNNING_CHK_NOT_MODIFIED`](../DpDbCallback.md#m_running_chk_not_modified-fea5508dd165)

### runningChkNotModified(DpDbContext) <a href="#runningchknotmodified-0cfa3cd55796" id="runningchknotmodified-0cfa3cd55796"></a>

```java
public void runningChkNotModified(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

*Description from* [`DpDbCallback.runningChkNotModified(com.tailf.dp.DpDbContext)`](../DpDbCallback.md#runningchknotmodified-0cfa3cd55796)

This function should check to see if running has been modified or not. It
 only needs to be implemented if the startup data store is enabled. Return
 silently if no modifications have been done since the last copy of
 running to startup, and should throw an DpCallbackException if any
 modifications exist.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `com.tailf.dp.DpCallbackException` - Callback method failed

### unlock(DpDbContext, int) <a href="#unlock-f30f2fcf978a" id="unlock-f30f2fcf978a"></a>

```java
public void unlock(com.tailf.dp.DpDbContext dbx, int dbname) throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](../DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

*Description from* [`DpDbCallback.unlock(com.tailf.dp.DpDbContext, int)`](../DpDbCallback.md#unlock-f30f2fcf978a)

Unlocks the database. The dbname constants:

- [`Conf#DB_NONE`](../../conf/Conf.md#db_none-5069c3fe4466)
- [`Conf#DB_CANDIDATE`](../../conf/Conf.md#db_candidate-8b43a337ac93)
- [`Conf#DB_RUNNING`](../../conf/Conf.md#db_running-c391f371da28)
- [`Conf#DB_STARTUP`](../../conf/Conf.md#db_startup-2ce085259486)

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context
- `int dbname` - The database type

**Throws**

- `com.tailf.dp.DpCallbackException` - Callback method failed.

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

*Description from* [`DpDbCallback.unlockPartial(com.tailf.dp.DpDbContext, int, int)`](../DpDbCallback.md#unlockpartial-3d1988a4cb5d)

Unlocks the partial locks that where previously locked with
 [`lockPartial(DpDbContext,int,int,ConfObject[][])`](../DpDbCallback.md#lockpartial-cb09f4152af4). The dbname
 constants:

- [`Conf#DB_NONE`](../../conf/Conf.md#db_none-5069c3fe4466)
- [`Conf#DB_CANDIDATE`](../../conf/Conf.md#db_candidate-8b43a337ac93)
- [`Conf#DB_RUNNING`](../../conf/Conf.md#db_running-c391f371da28)
- [`Conf#DB_STARTUP`](../../conf/Conf.md#db_startup-2ce085259486)

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context
- `int dbname` - The database type
- `int lockid` - The lock reference

**Throws**

- `com.tailf.dp.DpCallbackException` - Callback method failed.
