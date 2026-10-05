# DBCBType <a href="#cls-DBCBType" id="cls-DBCBType"></a>

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

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### ACTIVATE_CHECKPOINT_RUNNING <a href="#m-ACTIVATE_CHECKPOINT_RUNNING" id="m-ACTIVATE_CHECKPOINT_RUNNING"></a>

```java
public static final com.tailf.dp.proto.DBCBType ACTIVATE_CHECKPOINT_RUNNING;
```

Bit flag for the
 [`DpDbCallback#activateCheckpointRunning(DpDbContext)`](../DpDbCallback.md#m-activateCheckpointRunning-6d290282dc64)
 method.

### ADD_CHECKPOINT_RUNNING <a href="#m-ADD_CHECKPOINT_RUNNING" id="m-ADD_CHECKPOINT_RUNNING"></a>

```java
public static final com.tailf.dp.proto.DBCBType ADD_CHECKPOINT_RUNNING;
```

Bit flag for the
 [`DpDbCallback#addCheckpointRunning(DpDbContext)`](../DpDbCallback.md#m-addCheckpointRunning-e8ef0fad176a)
 method.

### CANDIDATE_CHK_NOT_MODIFIED <a href="#m-CANDIDATE_CHK_NOT_MODIFIED" id="m-CANDIDATE_CHK_NOT_MODIFIED"></a>

```java
public static final com.tailf.dp.proto.DBCBType CANDIDATE_CHK_NOT_MODIFIED;
```

Bit flag for the
 [`DpDbCallback#candidateChkNotModified(DpDbContext)`](../DpDbCallback.md#m-candidateChkNotModified-73d415936fab)
 method.

### CANDIDATE_COMMIT <a href="#m-CANDIDATE_COMMIT" id="m-CANDIDATE_COMMIT"></a>

```java
public static final com.tailf.dp.proto.DBCBType CANDIDATE_COMMIT;
```

Bit flag for the
 [`DpDbCallback#candidateCommit(DpDbContext,int)`](../DpDbCallback.md#m-candidateCommit-c7c8900fd15e)
 method.

### CANDIDATE_CONFIRMING_COMMIT <a href="#m-CANDIDATE_CONFIRMING_COMMIT" id="m-CANDIDATE_CONFIRMING_COMMIT"></a>

```java
public static final com.tailf.dp.proto.DBCBType CANDIDATE_CONFIRMING_COMMIT;
```

Bit flag for the
 [`DpDbCallback#candidateConfirmingCommit(DpDbContext)`](../DpDbCallback.md#m-candidateConfirmingCommit-e1728f2c501d)
 method.

### CANDIDATE_RESET <a href="#m-CANDIDATE_RESET" id="m-CANDIDATE_RESET"></a>

```java
public static final com.tailf.dp.proto.DBCBType CANDIDATE_RESET;
```

Bit flag for the
 [`DpDbCallback#candidateReset(DpDbContext)`](../DpDbCallback.md#m-candidateReset-20893cda7340) method.

### CANDIDATE_ROLLBACK_RUNNING <a href="#m-CANDIDATE_ROLLBACK_RUNNING" id="m-CANDIDATE_ROLLBACK_RUNNING"></a>

```java
public static final com.tailf.dp.proto.DBCBType CANDIDATE_ROLLBACK_RUNNING;
```

Bit flag for the
 [`DpDbCallback#candidateRollbackRunning(DpDbContext)`](../DpDbCallback.md#m-candidateRollbackRunning-101fc2327941)
 method.

### CANDIDATE_VALIDATE <a href="#m-CANDIDATE_VALIDATE" id="m-CANDIDATE_VALIDATE"></a>

```java
public static final com.tailf.dp.proto.DBCBType CANDIDATE_VALIDATE;
```

Bit flag for the
 [`DpDbCallback#candidateValidate(DpDbContext)`](../DpDbCallback.md#m-candidateValidate-c71b01c4e9e6) method.

### COPY_RUNNING_TO_STARTUP <a href="#m-COPY_RUNNING_TO_STARTUP" id="m-COPY_RUNNING_TO_STARTUP"></a>

```java
public static final com.tailf.dp.proto.DBCBType COPY_RUNNING_TO_STARTUP;
```

Bit flag for the
 [`DpDbCallback#copyRunningToStartup(DpDbContext)`](../DpDbCallback.md#m-copyRunningToStartup-963b6506a3d3)
 method.

### DEL_CHECKPOINT_RUNNING <a href="#m-DEL_CHECKPOINT_RUNNING" id="m-DEL_CHECKPOINT_RUNNING"></a>

```java
public static final com.tailf.dp.proto.DBCBType DEL_CHECKPOINT_RUNNING;
```

Bit flag for the
 [`DpDbCallback#delCheckpointRunning(DpDbContext)`](../DpDbCallback.md#m-delCheckpointRunning-b03068abbaef)
 method.

### DELETE_CONFIG <a href="#m-DELETE_CONFIG" id="m-DELETE_CONFIG"></a>

```java
public static final com.tailf.dp.proto.DBCBType DELETE_CONFIG;
```

Bit flag for the
 [`DpDbCallback#deleteConfig(DpDbContext,int)`](../DpDbCallback.md#m-deleteConfig-bac554ff2a00) method.

### LOCK <a href="#m-LOCK" id="m-LOCK"></a>

```java
public static final com.tailf.dp.proto.DBCBType LOCK;
```

Bit flag for the
 [`DpDbCallback#lock(DpDbContext,int)`](../DpDbCallback.md#m-lock-ed56d39d3ff0) method.

### LOCK_PARTIAL <a href="#m-LOCK_PARTIAL" id="m-LOCK_PARTIAL"></a>

```java
public static final com.tailf.dp.proto.DBCBType LOCK_PARTIAL;
```

Bit flag for the
 [`DpDbCallback#lockPartial(
 DpDbContext,int,int,ConfObject[][])`](../DpDbCallback.md#m-lockPartial-cb09f4152af4) method.

### RUNNING_CHK_NOT_MODIFIED <a href="#m-RUNNING_CHK_NOT_MODIFIED" id="m-RUNNING_CHK_NOT_MODIFIED"></a>

```java
public static final com.tailf.dp.proto.DBCBType RUNNING_CHK_NOT_MODIFIED;
```

Bit flag for the
 [`DpDbCallback#runningChkNotModified(DpDbContext)`](../DpDbCallback.md#m-runningChkNotModified-0cfa3cd55796)
 method.

### UNLOCK <a href="#m-UNLOCK" id="m-UNLOCK"></a>

```java
public static final com.tailf.dp.proto.DBCBType UNLOCK;
```

Bit flag for the
 [`DpDbCallback#unlock(DpDbContext,int)`](../DpDbCallback.md#m-unlock-f30f2fcf978a) method.

### UNLOCK_PARTIAL <a href="#m-UNLOCK_PARTIAL" id="m-UNLOCK_PARTIAL"></a>

```java
public static final com.tailf.dp.proto.DBCBType UNLOCK_PARTIAL;
```

Bit flag for the
 [`DpDbCallback#unlockPartial(DpDbContext,int,int)`](../DpDbCallback.md#m-unlockPartial-3d1988a4cb5d)
 method.


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

get integer value for enum

**Returns:** int value

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.dp.proto.DBCBType valueOf(String name)
```

Types: [DBCBType](DBCBType.md#cls-DBCBType)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.dp.proto.DBCBType[] values()
```

Types: [DBCBType](DBCBType.md#cls-DBCBType)
