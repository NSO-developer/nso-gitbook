<a id="cls-DBCBType"></a>
# DBCBType

```java
public enum com.tailf.dp.proto.DBCBType
```

Types: [DBCBType](DBCBType.md#cls-DBCBType)

Enumeration of DB callback methods

**Since:** 3.2.0

## Members

**Enum Constants**:

- [ACTIVATE_CHECKPOINT_RUNNING](#m-ACTIVATE_CHECKPOINT_RUNNING)
- [ADD_CHECKPOINT_RUNNING](#m-ADD_CHECKPOINT_RUNNING)
- [CANDIDATE_CHK_NOT_MODIFIED](#m-CANDIDATE_CHK_NOT_MODIFIED)
- [CANDIDATE_COMMIT](#m-CANDIDATE_COMMIT)
- [CANDIDATE_CONFIRMING_COMMIT](#m-CANDIDATE_CONFIRMING_COMMIT)
- [CANDIDATE_RESET](#m-CANDIDATE_RESET)
- [CANDIDATE_ROLLBACK_RUNNING](#m-CANDIDATE_ROLLBACK_RUNNING)
- [CANDIDATE_VALIDATE](#m-CANDIDATE_VALIDATE)
- [COPY_RUNNING_TO_STARTUP](#m-COPY_RUNNING_TO_STARTUP)
- [DEL_CHECKPOINT_RUNNING](#m-DEL_CHECKPOINT_RUNNING)
- [DELETE_CONFIG](#m-DELETE_CONFIG)
- [LOCK](#m-LOCK)
- [LOCK_PARTIAL](#m-LOCK_PARTIAL)
- [RUNNING_CHK_NOT_MODIFIED](#m-RUNNING_CHK_NOT_MODIFIED)
- [UNLOCK](#m-UNLOCK)
- [UNLOCK_PARTIAL](#m-UNLOCK_PARTIAL)

**Methods**:

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-ACTIVATE_CHECKPOINT_RUNNING"></a>
### ACTIVATE_CHECKPOINT_RUNNING

```java
public static final com.tailf.dp.proto.DBCBType ACTIVATE_CHECKPOINT_RUNNING;
```

Bit flag for the
 [`DpDbCallback#activateCheckpointRunning(DpDbContext)`](../DpDbCallback.md#m-activatecheckpointrunning-6d290282dc64)
 method.

<a id="m-ADD_CHECKPOINT_RUNNING"></a>
### ADD_CHECKPOINT_RUNNING

```java
public static final com.tailf.dp.proto.DBCBType ADD_CHECKPOINT_RUNNING;
```

Bit flag for the
 [`DpDbCallback#addCheckpointRunning(DpDbContext)`](../DpDbCallback.md#m-addcheckpointrunning-e8ef0fad176a)
 method.

<a id="m-CANDIDATE_CHK_NOT_MODIFIED"></a>
### CANDIDATE_CHK_NOT_MODIFIED

```java
public static final com.tailf.dp.proto.DBCBType CANDIDATE_CHK_NOT_MODIFIED;
```

Bit flag for the
 [`DpDbCallback#candidateChkNotModified(DpDbContext)`](../DpDbCallback.md#m-candidatechknotmodified-73d415936fab)
 method.

<a id="m-CANDIDATE_COMMIT"></a>
### CANDIDATE_COMMIT

```java
public static final com.tailf.dp.proto.DBCBType CANDIDATE_COMMIT;
```

Bit flag for the
 [`DpDbCallback#candidateCommit(DpDbContext,int)`](../DpDbCallback.md#m-candidatecommit-c7c8900fd15e)
 method.

<a id="m-CANDIDATE_CONFIRMING_COMMIT"></a>
### CANDIDATE_CONFIRMING_COMMIT

```java
public static final com.tailf.dp.proto.DBCBType CANDIDATE_CONFIRMING_COMMIT;
```

Bit flag for the
 [`DpDbCallback#candidateConfirmingCommit(DpDbContext)`](../DpDbCallback.md#m-candidateconfirmingcommit-e1728f2c501d)
 method.

<a id="m-CANDIDATE_RESET"></a>
### CANDIDATE_RESET

```java
public static final com.tailf.dp.proto.DBCBType CANDIDATE_RESET;
```

Bit flag for the
 [`DpDbCallback#candidateReset(DpDbContext)`](../DpDbCallback.md#m-candidatereset-20893cda7340) method.

<a id="m-CANDIDATE_ROLLBACK_RUNNING"></a>
### CANDIDATE_ROLLBACK_RUNNING

```java
public static final com.tailf.dp.proto.DBCBType CANDIDATE_ROLLBACK_RUNNING;
```

Bit flag for the
 [`DpDbCallback#candidateRollbackRunning(DpDbContext)`](../DpDbCallback.md#m-candidaterollbackrunning-101fc2327941)
 method.

<a id="m-CANDIDATE_VALIDATE"></a>
### CANDIDATE_VALIDATE

```java
public static final com.tailf.dp.proto.DBCBType CANDIDATE_VALIDATE;
```

Bit flag for the
 [`DpDbCallback#candidateValidate(DpDbContext)`](../DpDbCallback.md#m-candidatevalidate-c71b01c4e9e6) method.

<a id="m-COPY_RUNNING_TO_STARTUP"></a>
### COPY_RUNNING_TO_STARTUP

```java
public static final com.tailf.dp.proto.DBCBType COPY_RUNNING_TO_STARTUP;
```

Bit flag for the
 [`DpDbCallback#copyRunningToStartup(DpDbContext)`](../DpDbCallback.md#m-copyrunningtostartup-963b6506a3d3)
 method.

<a id="m-DEL_CHECKPOINT_RUNNING"></a>
### DEL_CHECKPOINT_RUNNING

```java
public static final com.tailf.dp.proto.DBCBType DEL_CHECKPOINT_RUNNING;
```

Bit flag for the
 [`DpDbCallback#delCheckpointRunning(DpDbContext)`](../DpDbCallback.md#m-delcheckpointrunning-b03068abbaef)
 method.

<a id="m-DELETE_CONFIG"></a>
### DELETE_CONFIG

```java
public static final com.tailf.dp.proto.DBCBType DELETE_CONFIG;
```

Bit flag for the
 [`DpDbCallback#deleteConfig(DpDbContext,int)`](../DpDbCallback.md#m-deleteconfig-bac554ff2a00) method.

<a id="m-LOCK"></a>
### LOCK

```java
public static final com.tailf.dp.proto.DBCBType LOCK;
```

Bit flag for the
 [`DpDbCallback#lock(DpDbContext,int)`](../DpDbCallback.md#m-lock-ed56d39d3ff0) method.

<a id="m-LOCK_PARTIAL"></a>
### LOCK_PARTIAL

```java
public static final com.tailf.dp.proto.DBCBType LOCK_PARTIAL;
```

Bit flag for the
 [`DpDbCallback#lockPartial(
 DpDbContext,int,int,ConfObject[][])`](../DpDbCallback.md#m-lockpartial-cb09f4152af4) method.

<a id="m-RUNNING_CHK_NOT_MODIFIED"></a>
### RUNNING_CHK_NOT_MODIFIED

```java
public static final com.tailf.dp.proto.DBCBType RUNNING_CHK_NOT_MODIFIED;
```

Bit flag for the
 [`DpDbCallback#runningChkNotModified(DpDbContext)`](../DpDbCallback.md#m-runningchknotmodified-0cfa3cd55796)
 method.

<a id="m-UNLOCK"></a>
### UNLOCK

```java
public static final com.tailf.dp.proto.DBCBType UNLOCK;
```

Bit flag for the
 [`DpDbCallback#unlock(DpDbContext,int)`](../DpDbCallback.md#m-unlock-f30f2fcf978a) method.

<a id="m-UNLOCK_PARTIAL"></a>
### UNLOCK_PARTIAL

```java
public static final com.tailf.dp.proto.DBCBType UNLOCK_PARTIAL;
```

Bit flag for the
 [`DpDbCallback#unlockPartial(DpDbContext,int,int)`](../DpDbCallback.md#m-unlockpartial-3d1988a4cb5d)
 method.


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

get integer value for enum

**Returns:** int value

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.dp.proto.DBCBType valueOf(String name)
```

Types: [DBCBType](DBCBType.md#cls-DBCBType)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.dp.proto.DBCBType[] values()
```

Types: [DBCBType](DBCBType.md#cls-DBCBType)
