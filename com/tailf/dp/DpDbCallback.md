# DpDbCallback <a href="#dpdbcallback-7fcc01bd0281" id="dpdbcallback-7fcc01bd0281"></a>

```java
public interface com.tailf.dp.DpDbCallback
```

This interface is used for the user database callbacks. It only applies to
 ConfD, not NCS

 We may also optionally have a set of callback methods which span over several
 transactions.

 If the system is configured in such a way so that the external database owns
 the candidate data store we must implement callback methods to do this. If
 ConfD owns the candidate the candidate callbacks can be skipped.
 Additionally, the lock() callback should be implemented (see more below).

 If ConfD owns the candidate, and ConfD has been configured to support
 confirmed-commit, then three checkpointing methods must be implemented. When
 confirmed-commit is enabled, the user can commit the candidate with a
 timeout. Unless a confirming commit is given by the user before the timer
 expires, the system must rollback to the previous running configuration. This
 mechanism is controlled by the checkpoint callbacks. See further below.

 An external database may also (optionally) support the lock/unlock and
 lockPartial/unlockPartial operations. This is only interesting if there
 exists additional locking mechanisms towards the database - such as an
 external CLI which can lock the database, or if the external database owns
 the candidate.

 Finally, the external database may optionally validate a configuration.
 Configuration validation is preferably done through ConfD - however if a
 system already has implemented extensive configuration validation - the
 validate() callback can be used.

**See also:** [`Dp#registerAnnotatedCallbacks(Object)`](Dp.md#registerannotatedcallbacks-ffaebadbfc42)

## Members

**Fields**:

- [M_ACTIVATE_CHECKPOINT_RUNNING](#m_activate_checkpoint_running-0ebd33a643c3)
- [M_ADD_CHECKPOINT_RUNNING](#m_add_checkpoint_running-43b65718bdd6)
- [M_ALL](#m_all-e3844e41e8ee)
- [M_CANDIDATE_CHK_NOT_MODIFIED](#m_candidate_chk_not_modified-f172de5cec21)
- [M_CANDIDATE_COMMIT](#m_candidate_commit-484bd03f581b)
- [M_CANDIDATE_CONFIRMING_COMMIT](#m_candidate_confirming_commit-6299d1509720)
- [M_CANDIDATE_RESET](#m_candidate_reset-f3acd855e47f)
- [M_CANDIDATE_ROLLBACK_RUNNING](#m_candidate_rollback_running-a7202b20d951)
- [M_CANDIDATE_VALIDATE](#m_candidate_validate-87728731434d)
- [M_COPY_RUNNING_TO_STARTUP](#m_copy_running_to_startup-02d63903fcec)
- [M_DEL_CHECKPOINT_RUNNING](#m_del_checkpoint_running-3c2efd2f93fb)
- [M_DELETE_CONFIG](#m_delete_config-61b73fae3b26)
- [M_LOCK](#m_lock-f8a733783845)
- [M_LOCK_PARTIAL](#m_lock_partial-aa26abd80f7d)
- [M_RUNNING_CHK_NOT_MODIFIED](#m_running_chk_not_modified-fea5508dd165)
- [M_UNLOCK](#m_unlock-58690e51e70c)
- [M_UNLOCK_PARTIAL](#m_unlock_partial-a67ada980c0d)

**Methods**:

- [activateCheckpointRunning(DpDbContext)](#activatecheckpointrunning-6d290282dc64)
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
- [lock(DpDbContext, int)](#lock-ed56d39d3ff0)
- [lockPartial(DpDbContext, int, int, ConfObject[][])](#lockpartial-cb09f4152af4)
- [mask()](#mask-24c2fa29c6af)
- [runningChkNotModified(DpDbContext)](#runningchknotmodified-0cfa3cd55796)
- [unlock(DpDbContext, int)](#unlock-f30f2fcf978a)
- [unlockPartial(DpDbContext, int, int)](#unlockpartial-3d1988a4cb5d)

## Fields

### M_ACTIVATE_CHECKPOINT_RUNNING <a href="#m_activate_checkpoint_running-0ebd33a643c3" id="m_activate_checkpoint_running-0ebd33a643c3"></a>

```java
public static final int M_ACTIVATE_CHECKPOINT_RUNNING = 256;
```

Bit flag for the `activateCheckpointRunning(DpDbContext)`
 method.

### M_ADD_CHECKPOINT_RUNNING <a href="#m_add_checkpoint_running-43b65718bdd6" id="m_add_checkpoint_running-43b65718bdd6"></a>

```java
public static final int M_ADD_CHECKPOINT_RUNNING = 64;
```

Bit flag for the `addCheckpointRunning(DpDbContext)` method.

### M_ALL <a href="#m_all-e3844e41e8ee" id="m_all-e3844e41e8ee"></a>

```java
public static final int M_ALL = 65535;
```

### M_CANDIDATE_CHK_NOT_MODIFIED <a href="#m_candidate_chk_not_modified-f172de5cec21" id="m_candidate_chk_not_modified-f172de5cec21"></a>

```java
public static final int M_CANDIDATE_CHK_NOT_MODIFIED = 8;
```

Bit flag for the `candidateChkNotModified(DpDbContext)`
 method.

### M_CANDIDATE_COMMIT <a href="#m_candidate_commit-484bd03f581b" id="m_candidate_commit-484bd03f581b"></a>

```java
public static final int M_CANDIDATE_COMMIT = 1;
```

Bit flag for the `candidateCommit(DpDbContext,int)` method.

### M_CANDIDATE_CONFIRMING_COMMIT <a href="#m_candidate_confirming_commit-6299d1509720" id="m_candidate_confirming_commit-6299d1509720"></a>

```java
public static final int M_CANDIDATE_CONFIRMING_COMMIT = 2;
```

Bit flag for the `candidateConfirmingCommit(DpDbContext)`
  method.

### M_CANDIDATE_RESET <a href="#m_candidate_reset-f3acd855e47f" id="m_candidate_reset-f3acd855e47f"></a>

```java
public static final int M_CANDIDATE_RESET = 4;
```

Bit flag for the `candidateReset(DpDbContext)` method.

### M_CANDIDATE_ROLLBACK_RUNNING <a href="#m_candidate_rollback_running-a7202b20d951" id="m_candidate_rollback_running-a7202b20d951"></a>

```java
public static final int M_CANDIDATE_ROLLBACK_RUNNING = 16;
```

Bit flag for the `candidateRollbackRunning(DpDbContext)`
 method.

### M_CANDIDATE_VALIDATE <a href="#m_candidate_validate-87728731434d" id="m_candidate_validate-87728731434d"></a>

```java
public static final int M_CANDIDATE_VALIDATE = 32;
```

Bit flag for the `candidateValidate(DpDbContext)` method.

### M_COPY_RUNNING_TO_STARTUP <a href="#m_copy_running_to_startup-02d63903fcec" id="m_copy_running_to_startup-02d63903fcec"></a>

```java
public static final int M_COPY_RUNNING_TO_STARTUP = 512;
```

Bit flag for the `copyRunningToStartup(DpDbContext)` method.

### M_DEL_CHECKPOINT_RUNNING <a href="#m_del_checkpoint_running-3c2efd2f93fb" id="m_del_checkpoint_running-3c2efd2f93fb"></a>

```java
public static final int M_DEL_CHECKPOINT_RUNNING = 128;
```

Bit flag for the `delCheckpointRunning(DpDbContext)` method.

### M_DELETE_CONFIG <a href="#m_delete_config-61b73fae3b26" id="m_delete_config-61b73fae3b26"></a>

```java
public static final int M_DELETE_CONFIG = 4096;
```

Bit flag for the `deleteConfig(DpDbContext,int)` method.

### M_LOCK <a href="#m_lock-f8a733783845" id="m_lock-f8a733783845"></a>

```java
public static final int M_LOCK = 1024;
```

Bit flag for the `lock(DpDbContext,int)` method.

### M_LOCK_PARTIAL <a href="#m_lock_partial-aa26abd80f7d" id="m_lock_partial-aa26abd80f7d"></a>

```java
public static final int M_LOCK_PARTIAL = 8192;
```

Bit flag for the `lockPartial(DpDbContext,int,int,ConfObject[][])`
 method.

### M_RUNNING_CHK_NOT_MODIFIED <a href="#m_running_chk_not_modified-fea5508dd165" id="m_running_chk_not_modified-fea5508dd165"></a>

```java
public static final int M_RUNNING_CHK_NOT_MODIFIED = 32768;
```

Bit flag for the `runningChkNotModified(DpDbContext)` method.

### M_UNLOCK <a href="#m_unlock-58690e51e70c" id="m_unlock-58690e51e70c"></a>

```java
public static final int M_UNLOCK = 2048;
```

Bit flag for the `unlock(DpDbContext,int)` method.

### M_UNLOCK_PARTIAL <a href="#m_unlock_partial-a67ada980c0d" id="m_unlock_partial-a67ada980c0d"></a>

```java
public static final int M_UNLOCK_PARTIAL = 16384;
```

Bit flag for the `unlockPartial(DpDbContext,int,int)` method.


## Methods

### activateCheckpointRunning(DpDbContext) <a href="#activatecheckpointrunning-6d290282dc64" id="activatecheckpointrunning-6d290282dc64"></a>

```java
public abstract void activateCheckpointRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

This method should rollback running to the checkpoint created by
 addCheckpointRunning(). It is called by ConfD when the timer expires or
 if the user session expires.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `DpCallbackException` - Callback method failed.

### addCheckpointRunning(DpDbContext) <a href="#addcheckpointrunning-e8ef0fad176a" id="addcheckpointrunning-e8ef0fad176a"></a>

```java
public abstract void addCheckpointRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

This method should be implemented only when ConfD owns the candidate, and
 confirmed-commit is enabled.

 It is responsible for creating a checkpoint of the current running
 configuration and storing the checkpoint in non-volatile memory. When the
 system restarts this method should check if there is a checkpoint
 available, and use the checkpoint instead of running.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `DpCallbackException` - Callback method failed.

### candidateChkNotModified(DpDbContext) <a href="#candidatechknotmodified-73d415936fab" id="candidatechknotmodified-73d415936fab"></a>

```java
public abstract void candidateChkNotModified(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

This method should check to see if the candidate has been modified or
 not. Returns if no modifications has been done since the last commit or
 reset, and throws a `DpCallbackException` (error) if any
 uncommitted modifications exist.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `DpCallbackException` - Callback method failed.

### candidateCommit(DpDbContext, int) <a href="#candidatecommit-c7c8900fd15e" id="candidatecommit-c7c8900fd15e"></a>

```java
public abstract void candidateCommit(
    com.tailf.dp.DpDbContext dbx,
    int timeout
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

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

- `DpCallbackException` - Callback method failed.

### candidateConfirmingCommit(DpDbContext) <a href="#candidateconfirmingcommit-e1728f2c501d" id="candidateconfirmingcommit-e1728f2c501d"></a>

```java
public abstract void candidateConfirmingCommit(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

If the timeout in the candidate_commit() method is != 0, we will be
 either invoked here or in the candidateRollbackRunning() method within
 timeout seconds. candidateConfirmingCommit() should make the commit
 persistent, whereas a call to candidateRollbackRunning() would copy back
 the previous running configuration to running.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `DpCallbackException` - Callback method failed.

### candidateReset(DpDbContext) <a href="#candidatereset-20893cda7340" id="candidatereset-20893cda7340"></a>

```java
public abstract void candidateReset(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

This method is intended to copy the current running configuration into
 the candidate. It is invoked whenever the NETCONF operation
 discard-changes is executed or when a lock is released without
 committing.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `DpCallbackException` - Callback method failed.

### candidateRollbackRunning(DpDbContext) <a href="#candidaterollbackrunning-101fc2327941" id="candidaterollbackrunning-101fc2327941"></a>

```java
public abstract void candidateRollbackRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

If for some reason, apart from a timeout, something goes wrong, we get
 invoked in the candidateRollbackRunning() method. The method should copy
 back the previous running configuration to running.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `DpCallbackException` - Callback method failed.

### candidateValidate(DpDbContext) <a href="#candidatevalidate-c71b01c4e9e6" id="candidatevalidate-c71b01c4e9e6"></a>

```java
public abstract void candidateValidate(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

This callback is optional. If implemented, the task of the callback is to
 validate the candidate configuration. Note that the running database can
 be validated by the database in the prepare() callback.
 candidateValidate() is only meaningful when an explicit validate
 operation is received, e.g. through NETCONF.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `DpCallbackException` - Callback method failed.

### copyRunningToStartup(DpDbContext) <a href="#copyrunningtostartup-963b6506a3d3" id="copyrunningtostartup-963b6506a3d3"></a>

```java
public abstract void copyRunningToStartup(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

Copies the 'running' database to 'startup'.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `DpCallbackException` - Callback method failed.

### delCheckpointRunning(DpDbContext) <a href="#delcheckpointrunning-b03068abbaef" id="delcheckpointrunning-b03068abbaef"></a>

```java
public abstract void delCheckpointRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

This method should delete a checkpoint created by addCheckPointRunning().
 It is called by ConfD when a confirming commit is received.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `DpCallbackException` - Callback method failed.

### deleteConfig(DpDbContext, int) <a href="#deleteconfig-bac554ff2a00" id="deleteconfig-bac554ff2a00"></a>

```java
public abstract void deleteConfig(
    com.tailf.dp.DpDbContext dbx,
    int dbname
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

Will be called for 'startup' or 'candidate' only. The database is
 supposed to be set to erased. The dbname constants:


- [`Conf#DB_NONE`](../conf/Conf.md#db_none-5069c3fe4466)
   - [`Conf#DB_CANDIDATE`](../conf/Conf.md#db_candidate-8b43a337ac93)
     - [`Conf#DB_RUNNING`](../conf/Conf.md#db_running-c391f371da28)
       - [`Conf#DB_STARTUP`](../conf/Conf.md#db_startup-2ce085259486)

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context
- `int dbname` - The database type

**Throws**

- `DpCallbackException` - Callback method failed.

### lock(DpDbContext, int) <a href="#lock-ed56d39d3ff0" id="lock-ed56d39d3ff0"></a>

```java
public abstract void lock(
    com.tailf.dp.DpDbContext dbx,
    int dbname
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

This should only be implemented if our database supports locking from
 other sources than through ConfD. If a lock is set through e.g. NETCONF,
 ConfD will first make sure that no other ConfD transaction has locked the
 database. Then it will call lock() to make sure that the database is not
 locked by some other source (such as a CLI). Throws a
 `DpCallbackException` (error) if the lock was already held by
 an external entity.

 The dbname constants:


- [`Conf#DB_NONE`](../conf/Conf.md#db_none-5069c3fe4466)
   - [`Conf#DB_CANDIDATE`](../conf/Conf.md#db_candidate-8b43a337ac93)
     - [`Conf#DB_RUNNING`](../conf/Conf.md#db_running-c391f371da28)
       - [`Conf#DB_STARTUP`](../conf/Conf.md#db_startup-2ce085259486)

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context
- `int dbname` - The database type

**Throws**

- `DpCallbackException` - Callback method failed.

### lockPartial(DpDbContext, int, int, ConfObject[][]) <a href="#lockpartial-cb09f4152af4" id="lockpartial-cb09f4152af4"></a>

```java
public abstract void lockPartial(
    com.tailf.dp.DpDbContext dbx,
    int dbname,
    int lockid,
    com.tailf.conf.ConfObject[][] paths
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#dpdbcontext-37347e4f266f), [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

This should only be implemented if our database supports locking from
 other sources than through ConfD, see `lock(DpDbContext,int)`
 above. This callback is invoked if a northbound agent requests a partial
 lock. The paths[] argument is an array of keypaths that identify the
 leafs and/or subtrees that are to be locked. The lockid is a reference
 that will be used on a subsequent corresponding unlockPartial()
 invocation. Throws a `DpCallbackException` (error) if the lock
 was already held by an external entity.

 The dbname constants:


- [`Conf#DB_NONE`](../conf/Conf.md#db_none-5069c3fe4466)
   - [`Conf#DB_CANDIDATE`](../conf/Conf.md#db_candidate-8b43a337ac93)
     - [`Conf#DB_RUNNING`](../conf/Conf.md#db_running-c391f371da28)
       - [`Conf#DB_STARTUP`](../conf/Conf.md#db_startup-2ce085259486)

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context
- `int dbname` - the database
- `int lockid` - The lock reference
- `com.tailf.conf.ConfObject[][] paths` - Paths to lock

**Throws**

- `DpCallbackException` - Callback method failed

### mask() <a href="#mask-24c2fa29c6af" id="mask-24c2fa29c6af"></a>

```java
public abstract int mask()
```

Mask of flags for methods that are supported by this callback:


- [`M_CANDIDATE_COMMIT`](DpDbCallback.md#m_candidate_commit-484bd03f581b)
   - [`M_CANDIDATE_CONFIRMING_COMMIT`](DpDbCallback.md#m_candidate_confirming_commit-6299d1509720)
     - [`M_CANDIDATE_RESET`](DpDbCallback.md#m_candidate_reset-f3acd855e47f)
       - [`M_CANDIDATE_CHK_NOT_MODIFIED`](DpDbCallback.md#m_candidate_chk_not_modified-f172de5cec21)
         - [`M_CANDIDATE_ROLLBACK_RUNNING`](DpDbCallback.md#m_candidate_rollback_running-a7202b20d951)
           - [`M_CANDIDATE_VALIDATE`](DpDbCallback.md#m_candidate_validate-87728731434d)
             - [`M_ADD_CHECKPOINT_RUNNING`](DpDbCallback.md#m_add_checkpoint_running-43b65718bdd6)
               - [`M_DEL_CHECKPOINT_RUNNING`](DpDbCallback.md#m_del_checkpoint_running-3c2efd2f93fb)
                 - [`M_ACTIVATE_CHECKPOINT_RUNNING`](DpDbCallback.md#m_activate_checkpoint_running-0ebd33a643c3)
                   - [`M_COPY_RUNNING_TO_STARTUP`](DpDbCallback.md#m_copy_running_to_startup-02d63903fcec)
                     - [`M_LOCK`](DpDbCallback.md#m_lock-f8a733783845)
                       - [`M_UNLOCK`](DpDbCallback.md#m_unlock-58690e51e70c)
                         - [`M_DELETE_CONFIG`](DpDbCallback.md#m_delete_config-61b73fae3b26)
                           - [`M_LOCK_PARTIAL`](DpDbCallback.md#m_lock_partial-aa26abd80f7d)
                             - [`M_UNLOCK_PARTIAL`](DpDbCallback.md#m_unlock_partial-a67ada980c0d)
                               - [`M_RUNNING_CHK_NOT_MODIFIED`](DpDbCallback.md#m_running_chk_not_modified-fea5508dd165)

### runningChkNotModified(DpDbContext) <a href="#runningchknotmodified-0cfa3cd55796" id="runningchknotmodified-0cfa3cd55796"></a>

```java
public abstract void runningChkNotModified(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

This function should check to see if running has been modified or not. It
 only needs to be implemented if the startup data store is enabled. Return
 silently if no modifications have been done since the last copy of
 running to startup, and should throw an DpCallbackException if any
 modifications exist.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `DpCallbackException` - Callback method failed

### unlock(DpDbContext, int) <a href="#unlock-f30f2fcf978a" id="unlock-f30f2fcf978a"></a>

```java
public abstract void unlock(
    com.tailf.dp.DpDbContext dbx,
    int dbname
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

Unlocks the database. The dbname constants:


- [`Conf#DB_NONE`](../conf/Conf.md#db_none-5069c3fe4466)
   - [`Conf#DB_CANDIDATE`](../conf/Conf.md#db_candidate-8b43a337ac93)
     - [`Conf#DB_RUNNING`](../conf/Conf.md#db_running-c391f371da28)
       - [`Conf#DB_STARTUP`](../conf/Conf.md#db_startup-2ce085259486)

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context
- `int dbname` - The database type

**Throws**

- `DpCallbackException` - Callback method failed.

### unlockPartial(DpDbContext, int, int) <a href="#unlockpartial-3d1988a4cb5d" id="unlockpartial-3d1988a4cb5d"></a>

```java
public abstract void unlockPartial(
    com.tailf.dp.DpDbContext dbx,
    int dbname,
    int lockid
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#dpdbcontext-37347e4f266f), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

Unlocks the partial locks that where previously locked with
 `lockPartial(DpDbContext,int,int,ConfObject[][])`. The dbname
 constants:


- [`Conf#DB_NONE`](../conf/Conf.md#db_none-5069c3fe4466)
   - [`Conf#DB_CANDIDATE`](../conf/Conf.md#db_candidate-8b43a337ac93)
     - [`Conf#DB_RUNNING`](../conf/Conf.md#db_running-c391f371da28)
       - [`Conf#DB_STARTUP`](../conf/Conf.md#db_startup-2ce085259486)

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context
- `int dbname` - The database type
- `int lockid` - The lock reference

**Throws**

- `DpCallbackException` - Callback method failed.
