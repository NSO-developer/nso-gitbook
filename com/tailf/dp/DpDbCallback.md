<a id="s-DpDbCallback"></a>
# DpDbCallback

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

**See also:** [`Dp#registerAnnotatedCallbacks(Object)`](Dp.md#s-registerAnnotatedCallbacks)

## Members

**Fields**:

- [M_ACTIVATE_CHECKPOINT_RUNNING](#s-M_ACTIVATE_CHECKPOINT_RUNNING)
- [M_ADD_CHECKPOINT_RUNNING](#s-M_ADD_CHECKPOINT_RUNNING)
- [M_ALL](#s-M_ALL)
- [M_CANDIDATE_CHK_NOT_MODIFIED](#s-M_CANDIDATE_CHK_NOT_MODIFIED)
- [M_CANDIDATE_COMMIT](#s-M_CANDIDATE_COMMIT)
- [M_CANDIDATE_CONFIRMING_COMMIT](#s-M_CANDIDATE_CONFIRMING_COMMIT)
- [M_CANDIDATE_RESET](#s-M_CANDIDATE_RESET)
- [M_CANDIDATE_ROLLBACK_RUNNING](#s-M_CANDIDATE_ROLLBACK_RUNNING)
- [M_CANDIDATE_VALIDATE](#s-M_CANDIDATE_VALIDATE)
- [M_COPY_RUNNING_TO_STARTUP](#s-M_COPY_RUNNING_TO_STARTUP)
- [M_DEL_CHECKPOINT_RUNNING](#s-M_DEL_CHECKPOINT_RUNNING)
- [M_DELETE_CONFIG](#s-M_DELETE_CONFIG)
- [M_LOCK](#s-M_LOCK)
- [M_LOCK_PARTIAL](#s-M_LOCK_PARTIAL)
- [M_RUNNING_CHK_NOT_MODIFIED](#s-M_RUNNING_CHK_NOT_MODIFIED)
- [M_UNLOCK](#s-M_UNLOCK)
- [M_UNLOCK_PARTIAL](#s-M_UNLOCK_PARTIAL)

**Methods**:

- [activateCheckpointRunning(DpDbContext)](#s-activateCheckpointRunning)
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
- [lock(DpDbContext, int)](#s-lock)
- [lockPartial(DpDbContext, int, int, ConfObject[][])](#s-lockPartial)
- [mask()](#s-mask)
- [runningChkNotModified(DpDbContext)](#s-runningChkNotModified)
- [unlock(DpDbContext, int)](#s-unlock)
- [unlockPartial(DpDbContext, int, int)](#s-unlockPartial)

## Fields

<a id="s-M_ACTIVATE_CHECKPOINT_RUNNING"></a>
### M_ACTIVATE_CHECKPOINT_RUNNING

```java
public static final int M_ACTIVATE_CHECKPOINT_RUNNING = 256;
```

Bit flag for the [`DpDbContext`](DpDbContext.md#s-DpDbContext)
 method.

<a id="s-M_ADD_CHECKPOINT_RUNNING"></a>
### M_ADD_CHECKPOINT_RUNNING

```java
public static final int M_ADD_CHECKPOINT_RUNNING = 64;
```

Bit flag for the [`DpDbContext`](DpDbContext.md#s-DpDbContext) method.

<a id="s-M_ALL"></a>
### M_ALL

```java
public static final int M_ALL = 65535;
```

<a id="s-M_CANDIDATE_CHK_NOT_MODIFIED"></a>
### M_CANDIDATE_CHK_NOT_MODIFIED

```java
public static final int M_CANDIDATE_CHK_NOT_MODIFIED = 8;
```

Bit flag for the [`DpDbContext`](DpDbContext.md#s-DpDbContext)
 method.

<a id="s-M_CANDIDATE_COMMIT"></a>
### M_CANDIDATE_COMMIT

```java
public static final int M_CANDIDATE_COMMIT = 1;
```

Bit flag for the [`DpDbContext`](DpDbContext.md#s-DpDbContext) method.

<a id="s-M_CANDIDATE_CONFIRMING_COMMIT"></a>
### M_CANDIDATE_CONFIRMING_COMMIT

```java
public static final int M_CANDIDATE_CONFIRMING_COMMIT = 2;
```

Bit flag for the [`DpDbContext`](DpDbContext.md#s-DpDbContext)
  method.

<a id="s-M_CANDIDATE_RESET"></a>
### M_CANDIDATE_RESET

```java
public static final int M_CANDIDATE_RESET = 4;
```

Bit flag for the [`DpDbContext`](DpDbContext.md#s-DpDbContext) method.

<a id="s-M_CANDIDATE_ROLLBACK_RUNNING"></a>
### M_CANDIDATE_ROLLBACK_RUNNING

```java
public static final int M_CANDIDATE_ROLLBACK_RUNNING = 16;
```

Bit flag for the [`DpDbContext`](DpDbContext.md#s-DpDbContext)
 method.

<a id="s-M_CANDIDATE_VALIDATE"></a>
### M_CANDIDATE_VALIDATE

```java
public static final int M_CANDIDATE_VALIDATE = 32;
```

Bit flag for the [`DpDbContext`](DpDbContext.md#s-DpDbContext) method.

<a id="s-M_COPY_RUNNING_TO_STARTUP"></a>
### M_COPY_RUNNING_TO_STARTUP

```java
public static final int M_COPY_RUNNING_TO_STARTUP = 512;
```

Bit flag for the [`DpDbContext`](DpDbContext.md#s-DpDbContext) method.

<a id="s-M_DEL_CHECKPOINT_RUNNING"></a>
### M_DEL_CHECKPOINT_RUNNING

```java
public static final int M_DEL_CHECKPOINT_RUNNING = 128;
```

Bit flag for the [`DpDbContext`](DpDbContext.md#s-DpDbContext) method.

<a id="s-M_DELETE_CONFIG"></a>
### M_DELETE_CONFIG

```java
public static final int M_DELETE_CONFIG = 4096;
```

Bit flag for the [`DpDbContext`](DpDbContext.md#s-DpDbContext) method.

<a id="s-M_LOCK"></a>
### M_LOCK

```java
public static final int M_LOCK = 1024;
```

Bit flag for the [`DpDbContext`](DpDbContext.md#s-DpDbContext) method.

<a id="s-M_LOCK_PARTIAL"></a>
### M_LOCK_PARTIAL

```java
public static final int M_LOCK_PARTIAL = 8192;
```

Bit flag for the [`DpDbContext`](DpDbContext.md#s-DpDbContext)
 method.

<a id="s-M_RUNNING_CHK_NOT_MODIFIED"></a>
### M_RUNNING_CHK_NOT_MODIFIED

```java
public static final int M_RUNNING_CHK_NOT_MODIFIED = 32768;
```

Bit flag for the [`DpDbContext`](DpDbContext.md#s-DpDbContext) method.

<a id="s-M_UNLOCK"></a>
### M_UNLOCK

```java
public static final int M_UNLOCK = 2048;
```

Bit flag for the [`DpDbContext`](DpDbContext.md#s-DpDbContext) method.

<a id="s-M_UNLOCK_PARTIAL"></a>
### M_UNLOCK_PARTIAL

```java
public static final int M_UNLOCK_PARTIAL = 16384;
```

Bit flag for the [`DpDbContext`](DpDbContext.md#s-DpDbContext) method.


## Methods

<a id="s-activateCheckpointRunning"></a>
### activateCheckpointRunning(DpDbContext)

```java
public abstract void activateCheckpointRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#s-DpDbContext), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

This method should rollback running to the checkpoint created by
 addCheckpointRunning(). It is called by ConfD when the timer expires or
 if the user session expires.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `DpCallbackException` - Callback method failed.

<a id="s-addCheckpointRunning"></a>
### addCheckpointRunning(DpDbContext)

```java
public abstract void addCheckpointRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#s-DpDbContext), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

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

<a id="s-candidateChkNotModified"></a>
### candidateChkNotModified(DpDbContext)

```java
public abstract void candidateChkNotModified(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#s-DpDbContext), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

This method should check to see if the candidate has been modified or
 not. Returns if no modifications has been done since the last commit or
 reset, and throws a `DpCallbackException` (error) if any
 uncommitted modifications exist.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `DpCallbackException` - Callback method failed.

<a id="s-candidateCommit"></a>
### candidateCommit(DpDbContext, int)

```java
public abstract void candidateCommit(
    com.tailf.dp.DpDbContext dbx,
    int timeout
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#s-DpDbContext), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

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

<a id="s-candidateConfirmingCommit"></a>
### candidateConfirmingCommit(DpDbContext)

```java
public abstract void candidateConfirmingCommit(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#s-DpDbContext), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

If the timeout in the candidate_commit() method is != 0, we will be
 either invoked here or in the candidateRollbackRunning() method within
 timeout seconds. candidateConfirmingCommit() should make the commit
 persistent, whereas a call to candidateRollbackRunning() would copy back
 the previous running configuration to running.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `DpCallbackException` - Callback method failed.

<a id="s-candidateReset"></a>
### candidateReset(DpDbContext)

```java
public abstract void candidateReset(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#s-DpDbContext), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

This method is intended to copy the current running configuration into
 the candidate. It is invoked whenever the NETCONF operation
 discard-changes is executed or when a lock is released without
 committing.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `DpCallbackException` - Callback method failed.

<a id="s-candidateRollbackRunning"></a>
### candidateRollbackRunning(DpDbContext)

```java
public abstract void candidateRollbackRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#s-DpDbContext), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

If for some reason, apart from a timeout, something goes wrong, we get
 invoked in the candidateRollbackRunning() method. The method should copy
 back the previous running configuration to running.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `DpCallbackException` - Callback method failed.

<a id="s-candidateValidate"></a>
### candidateValidate(DpDbContext)

```java
public abstract void candidateValidate(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#s-DpDbContext), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

This callback is optional. If implemented, the task of the callback is to
 validate the candidate configuration. Note that the running database can
 be validated by the database in the prepare() callback.
 candidateValidate() is only meaningful when an explicit validate
 operation is received, e.g. through NETCONF.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `DpCallbackException` - Callback method failed.

<a id="s-copyRunningToStartup"></a>
### copyRunningToStartup(DpDbContext)

```java
public abstract void copyRunningToStartup(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#s-DpDbContext), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

Copies the 'running' database to 'startup'.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `DpCallbackException` - Callback method failed.

<a id="s-delCheckpointRunning"></a>
### delCheckpointRunning(DpDbContext)

```java
public abstract void delCheckpointRunning(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#s-DpDbContext), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

This method should delete a checkpoint created by addCheckPointRunning().
 It is called by ConfD when a confirming commit is received.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `DpCallbackException` - Callback method failed.

<a id="s-deleteConfig"></a>
### deleteConfig(DpDbContext, int)

```java
public abstract void deleteConfig(
    com.tailf.dp.DpDbContext dbx,
    int dbname
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#s-DpDbContext), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

Will be called for 'startup' or 'candidate' only. The database is
 supposed to be set to erased. The dbname constants:


- [`Conf`](../conf/Conf.md#s-Conf)
   - [`Conf`](../conf/Conf.md#s-Conf)
     - [`Conf`](../conf/Conf.md#s-Conf)
       - [`Conf`](../conf/Conf.md#s-Conf)

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context
- `int dbname` - The database type

**Throws**

- `DpCallbackException` - Callback method failed.

<a id="s-lock"></a>
### lock(DpDbContext, int)

```java
public abstract void lock(
    com.tailf.dp.DpDbContext dbx,
    int dbname
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#s-DpDbContext), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

This should only be implemented if our database supports locking from
 other sources than through ConfD. If a lock is set through e.g. NETCONF,
 ConfD will first make sure that no other ConfD transaction has locked the
 database. Then it will call lock() to make sure that the database is not
 locked by some other source (such as a CLI). Throws a
 `DpCallbackException` (error) if the lock was already held by
 an external entity.

 The dbname constants:


- [`Conf`](../conf/Conf.md#s-Conf)
   - [`Conf`](../conf/Conf.md#s-Conf)
     - [`Conf`](../conf/Conf.md#s-Conf)
       - [`Conf`](../conf/Conf.md#s-Conf)

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context
- `int dbname` - The database type

**Throws**

- `DpCallbackException` - Callback method failed.

<a id="s-lockPartial"></a>
### lockPartial(DpDbContext, int, int, ConfObject[][])

```java
public abstract void lockPartial(
    com.tailf.dp.DpDbContext dbx,
    int dbname,
    int lockid,
    com.tailf.conf.ConfObject[][] paths
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#s-DpDbContext), [ConfObject](../conf/ConfObject.md#s-ConfObject), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

This should only be implemented if our database supports locking from
 other sources than through ConfD, see [`DpDbContext`](DpDbContext.md#s-DpDbContext)
 above. This callback is invoked if a northbound agent requests a partial
 lock. The paths[] argument is an array of keypaths that identify the
 leafs and/or subtrees that are to be locked. The lockid is a reference
 that will be used on a subsequent corresponding unlockPartial()
 invocation. Throws a `DpCallbackException` (error) if the lock
 was already held by an external entity.

 The dbname constants:


- [`Conf`](../conf/Conf.md#s-Conf)
   - [`Conf`](../conf/Conf.md#s-Conf)
     - [`Conf`](../conf/Conf.md#s-Conf)
       - [`Conf`](../conf/Conf.md#s-Conf)

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context
- `int dbname` - the database
- `int lockid` - The lock reference
- `com.tailf.conf.ConfObject[][] paths` - Paths to lock

**Throws**

- `DpCallbackException` - Callback method failed

<a id="s-mask"></a>
### mask()

```java
public abstract int mask()
```

Mask of flags for methods that are supported by this callback:


- `#M_CANDIDATE_COMMIT`
   - `#M_CANDIDATE_CONFIRMING_COMMIT`
     - `#M_CANDIDATE_RESET`
       - `#M_CANDIDATE_CHK_NOT_MODIFIED`
         - `#M_CANDIDATE_ROLLBACK_RUNNING`
           - `#M_CANDIDATE_VALIDATE`
             - `#M_ADD_CHECKPOINT_RUNNING`
               - `#M_DEL_CHECKPOINT_RUNNING`
                 - `#M_ACTIVATE_CHECKPOINT_RUNNING`
                   - `#M_COPY_RUNNING_TO_STARTUP`
                     - `#M_LOCK`
                       - `#M_UNLOCK`
                         - `#M_DELETE_CONFIG`
                           - `#M_LOCK_PARTIAL`
                             - `#M_UNLOCK_PARTIAL`
                               - `#M_RUNNING_CHK_NOT_MODIFIED`

<a id="s-runningChkNotModified"></a>
### runningChkNotModified(DpDbContext)

```java
public abstract void runningChkNotModified(
    com.tailf.dp.DpDbContext dbx
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#s-DpDbContext), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

This function should check to see if running has been modified or not. It
 only needs to be implemented if the startup data store is enabled. Return
 silently if no modifications have been done since the last copy of
 running to startup, and should throw an DpCallbackException if any
 modifications exist.

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context

**Throws**

- `DpCallbackException` - Callback method failed

<a id="s-unlock"></a>
### unlock(DpDbContext, int)

```java
public abstract void unlock(
    com.tailf.dp.DpDbContext dbx,
    int dbname
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#s-DpDbContext), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

Unlocks the database. The dbname constants:


- [`Conf`](../conf/Conf.md#s-Conf)
   - [`Conf`](../conf/Conf.md#s-Conf)
     - [`Conf`](../conf/Conf.md#s-Conf)
       - [`Conf`](../conf/Conf.md#s-Conf)

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context
- `int dbname` - The database type

**Throws**

- `DpCallbackException` - Callback method failed.

<a id="s-unlockPartial"></a>
### unlockPartial(DpDbContext, int, int)

```java
public abstract void unlockPartial(
    com.tailf.dp.DpDbContext dbx,
    int dbname,
    int lockid
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpDbContext](DpDbContext.md#s-DpDbContext), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

Unlocks the partial locks that where previously locked with
 [`DpDbContext`](DpDbContext.md#s-DpDbContext). The dbname
 constants:


- [`Conf`](../conf/Conf.md#s-Conf)
   - [`Conf`](../conf/Conf.md#s-Conf)
     - [`Conf`](../conf/Conf.md#s-Conf)
       - [`Conf`](../conf/Conf.md#s-Conf)

**Parameters**

- `com.tailf.dp.DpDbContext dbx` - The database context
- `int dbname` - The database type
- `int lockid` - The lock reference

**Throws**

- `DpCallbackException` - Callback method failed.
