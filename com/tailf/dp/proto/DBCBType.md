# DBCBType <a href="#dbcbtype-b9ff294018bf" id="dbcbtype-b9ff294018bf"></a>

```java
public enum com.tailf.dp.proto.DBCBType
```

Types: [DBCBType](DBCBType.md#dbcbtype-b9ff294018bf)

Enumeration of DB callback methods

**Since:** 3.2.0

## Members

**Enum Constants**:

- [ACTIVATE\_CHECKPOINT\_RUNNING](#activate_checkpoint_running-a6100ae5a340)
- [ADD\_CHECKPOINT\_RUNNING](#add_checkpoint_running-768e54bdcf2c)
- [CANDIDATE\_CHK\_NOT\_MODIFIED](#candidate_chk_not_modified-6012c50d33a1)
- [CANDIDATE\_COMMIT](#candidate_commit-971d6b42a25a)
- [CANDIDATE\_CONFIRMING\_COMMIT](#candidate_confirming_commit-a4e2d978d491)
- [CANDIDATE\_RESET](#candidate_reset-4c8beeb0d732)
- [CANDIDATE\_ROLLBACK\_RUNNING](#candidate_rollback_running-ce29d62e7fa0)
- [CANDIDATE\_VALIDATE](#candidate_validate-88fec4af40ae)
- [COPY\_RUNNING\_TO\_STARTUP](#copy_running_to_startup-7f29c12e742c)
- [DEL\_CHECKPOINT\_RUNNING](#del_checkpoint_running-df7c40981810)
- [DELETE\_CONFIG](#delete_config-bbbb8d87fc7e)
- [LOCK](#lock-019de6a65aa2)
- [LOCK\_PARTIAL](#lock_partial-018e4e600871)
- [RUNNING\_CHK\_NOT\_MODIFIED](#running_chk_not_modified-4e227ccf520e)
- [UNLOCK](#unlock-9bc91c84c792)
- [UNLOCK\_PARTIAL](#unlock_partial-7523966be288)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### ACTIVATE_CHECKPOINT_RUNNING <a href="#activate_checkpoint_running-a6100ae5a340" id="activate_checkpoint_running-a6100ae5a340"></a>

```java
public static final com.tailf.dp.proto.DBCBType ACTIVATE_CHECKPOINT_RUNNING;
```

Bit flag for the
 [`DpDbCallback#activateCheckpointRunning(DpDbContext)`](../DpDbCallback.md#activatecheckpointrunning-6d290282dc64)
 method.

### ADD_CHECKPOINT_RUNNING <a href="#add_checkpoint_running-768e54bdcf2c" id="add_checkpoint_running-768e54bdcf2c"></a>

```java
public static final com.tailf.dp.proto.DBCBType ADD_CHECKPOINT_RUNNING;
```

Bit flag for the
 [`DpDbCallback#addCheckpointRunning(DpDbContext)`](../DpDbCallback.md#addcheckpointrunning-e8ef0fad176a)
 method.

### CANDIDATE_CHK_NOT_MODIFIED <a href="#candidate_chk_not_modified-6012c50d33a1" id="candidate_chk_not_modified-6012c50d33a1"></a>

```java
public static final com.tailf.dp.proto.DBCBType CANDIDATE_CHK_NOT_MODIFIED;
```

Bit flag for the
 [`DpDbCallback#candidateChkNotModified(DpDbContext)`](../DpDbCallback.md#candidatechknotmodified-73d415936fab)
 method.

### CANDIDATE_COMMIT <a href="#candidate_commit-971d6b42a25a" id="candidate_commit-971d6b42a25a"></a>

```java
public static final com.tailf.dp.proto.DBCBType CANDIDATE_COMMIT;
```

Bit flag for the
 [`DpDbCallback#candidateCommit(DpDbContext,int)`](../DpDbCallback.md#candidatecommit-c7c8900fd15e)
 method.

### CANDIDATE_CONFIRMING_COMMIT <a href="#candidate_confirming_commit-a4e2d978d491" id="candidate_confirming_commit-a4e2d978d491"></a>

```java
public static final com.tailf.dp.proto.DBCBType CANDIDATE_CONFIRMING_COMMIT;
```

Bit flag for the
 [`DpDbCallback#candidateConfirmingCommit(DpDbContext)`](../DpDbCallback.md#candidateconfirmingcommit-e1728f2c501d)
 method.

### CANDIDATE_RESET <a href="#candidate_reset-4c8beeb0d732" id="candidate_reset-4c8beeb0d732"></a>

```java
public static final com.tailf.dp.proto.DBCBType CANDIDATE_RESET;
```

Bit flag for the
 [`DpDbCallback#candidateReset(DpDbContext)`](../DpDbCallback.md#candidatereset-20893cda7340) method.

### CANDIDATE_ROLLBACK_RUNNING <a href="#candidate_rollback_running-ce29d62e7fa0" id="candidate_rollback_running-ce29d62e7fa0"></a>

```java
public static final com.tailf.dp.proto.DBCBType CANDIDATE_ROLLBACK_RUNNING;
```

Bit flag for the
 [`DpDbCallback#candidateRollbackRunning(DpDbContext)`](../DpDbCallback.md#candidaterollbackrunning-101fc2327941)
 method.

### CANDIDATE_VALIDATE <a href="#candidate_validate-88fec4af40ae" id="candidate_validate-88fec4af40ae"></a>

```java
public static final com.tailf.dp.proto.DBCBType CANDIDATE_VALIDATE;
```

Bit flag for the
 [`DpDbCallback#candidateValidate(DpDbContext)`](../DpDbCallback.md#candidatevalidate-c71b01c4e9e6) method.

### COPY_RUNNING_TO_STARTUP <a href="#copy_running_to_startup-7f29c12e742c" id="copy_running_to_startup-7f29c12e742c"></a>

```java
public static final com.tailf.dp.proto.DBCBType COPY_RUNNING_TO_STARTUP;
```

Bit flag for the
 [`DpDbCallback#copyRunningToStartup(DpDbContext)`](../DpDbCallback.md#copyrunningtostartup-963b6506a3d3)
 method.

### DEL_CHECKPOINT_RUNNING <a href="#del_checkpoint_running-df7c40981810" id="del_checkpoint_running-df7c40981810"></a>

```java
public static final com.tailf.dp.proto.DBCBType DEL_CHECKPOINT_RUNNING;
```

Bit flag for the
 [`DpDbCallback#delCheckpointRunning(DpDbContext)`](../DpDbCallback.md#delcheckpointrunning-b03068abbaef)
 method.

### DELETE_CONFIG <a href="#delete_config-bbbb8d87fc7e" id="delete_config-bbbb8d87fc7e"></a>

```java
public static final com.tailf.dp.proto.DBCBType DELETE_CONFIG;
```

Bit flag for the
 [`DpDbCallback#deleteConfig(DpDbContext,int)`](../DpDbCallback.md#deleteconfig-bac554ff2a00) method.

### LOCK <a href="#lock-019de6a65aa2" id="lock-019de6a65aa2"></a>

```java
public static final com.tailf.dp.proto.DBCBType LOCK;
```

Bit flag for the
 [`DpDbCallback#lock(DpDbContext,int)`](../DpDbCallback.md#lock-ed56d39d3ff0) method.

### LOCK_PARTIAL <a href="#lock_partial-018e4e600871" id="lock_partial-018e4e600871"></a>

```java
public static final com.tailf.dp.proto.DBCBType LOCK_PARTIAL;
```

Bit flag for the
 [`DpDbCallback#lockPartial(
 DpDbContext,int,int,ConfObject[][])`](../DpDbCallback.md#lockpartial-cb09f4152af4) method.

### RUNNING_CHK_NOT_MODIFIED <a href="#running_chk_not_modified-4e227ccf520e" id="running_chk_not_modified-4e227ccf520e"></a>

```java
public static final com.tailf.dp.proto.DBCBType RUNNING_CHK_NOT_MODIFIED;
```

Bit flag for the
 [`DpDbCallback#runningChkNotModified(DpDbContext)`](../DpDbCallback.md#runningchknotmodified-0cfa3cd55796)
 method.

### UNLOCK <a href="#unlock-9bc91c84c792" id="unlock-9bc91c84c792"></a>

```java
public static final com.tailf.dp.proto.DBCBType UNLOCK;
```

Bit flag for the
 [`DpDbCallback#unlock(DpDbContext,int)`](../DpDbCallback.md#unlock-f30f2fcf978a) method.

### UNLOCK_PARTIAL <a href="#unlock_partial-7523966be288" id="unlock_partial-7523966be288"></a>

```java
public static final com.tailf.dp.proto.DBCBType UNLOCK_PARTIAL;
```

Bit flag for the
 [`DpDbCallback#unlockPartial(DpDbContext,int,int)`](../DpDbCallback.md#unlockpartial-3d1988a4cb5d)
 method.


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

get integer value for enum

**Returns:** int value

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.dp.proto.DBCBType valueOf(String name)
```

Types: [DBCBType](DBCBType.md#dbcbtype-b9ff294018bf)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.dp.proto.DBCBType[] values()
```

Types: [DBCBType](DBCBType.md#dbcbtype-b9ff294018bf)
