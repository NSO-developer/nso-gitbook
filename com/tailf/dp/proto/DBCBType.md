<a id="s-DBCBType"></a>
# DBCBType

```java
public enum com.tailf.dp.proto.DBCBType
```

Types: [DBCBType](DBCBType.md#s-DBCBType)

Enumeration of DB callback methods

**Related classes**

- [DBCBType](DBCBType.md#s-DBCBType)

**Since:** 3.2.0

## Members

**Enum Constants**:

- [ACTIVATE_CHECKPOINT_RUNNING](#s-ACTIVATE_CHECKPOINT_RUNNING)
- [ADD_CHECKPOINT_RUNNING](#s-ADD_CHECKPOINT_RUNNING)
- [CANDIDATE_CHK_NOT_MODIFIED](#s-CANDIDATE_CHK_NOT_MODIFIED)
- [CANDIDATE_COMMIT](#s-CANDIDATE_COMMIT)
- [CANDIDATE_CONFIRMING_COMMIT](#s-CANDIDATE_CONFIRMING_COMMIT)
- [CANDIDATE_RESET](#s-CANDIDATE_RESET)
- [CANDIDATE_ROLLBACK_RUNNING](#s-CANDIDATE_ROLLBACK_RUNNING)
- [CANDIDATE_VALIDATE](#s-CANDIDATE_VALIDATE)
- [COPY_RUNNING_TO_STARTUP](#s-COPY_RUNNING_TO_STARTUP)
- [DEL_CHECKPOINT_RUNNING](#s-DEL_CHECKPOINT_RUNNING)
- [DELETE_CONFIG](#s-DELETE_CONFIG)
- [LOCK](#s-LOCK)
- [LOCK_PARTIAL](#s-LOCK_PARTIAL)
- [RUNNING_CHK_NOT_MODIFIED](#s-RUNNING_CHK_NOT_MODIFIED)
- [UNLOCK](#s-UNLOCK)
- [UNLOCK_PARTIAL](#s-UNLOCK_PARTIAL)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-ACTIVATE_CHECKPOINT_RUNNING"></a>
### ACTIVATE_CHECKPOINT_RUNNING

```java
public static final com.tailf.dp.proto.DBCBType ACTIVATE_CHECKPOINT_RUNNING;
```

Bit flag for the
 [`DpDbCallback`](../DpDbCallback.md#s-DpDbCallback)
 method.

<a id="s-ADD_CHECKPOINT_RUNNING"></a>
### ADD_CHECKPOINT_RUNNING

```java
public static final com.tailf.dp.proto.DBCBType ADD_CHECKPOINT_RUNNING;
```

Bit flag for the
 [`DpDbCallback`](../DpDbCallback.md#s-DpDbCallback)
 method.

<a id="s-CANDIDATE_CHK_NOT_MODIFIED"></a>
### CANDIDATE_CHK_NOT_MODIFIED

```java
public static final com.tailf.dp.proto.DBCBType CANDIDATE_CHK_NOT_MODIFIED;
```

Bit flag for the
 [`DpDbCallback`](../DpDbCallback.md#s-DpDbCallback)
 method.

<a id="s-CANDIDATE_COMMIT"></a>
### CANDIDATE_COMMIT

```java
public static final com.tailf.dp.proto.DBCBType CANDIDATE_COMMIT;
```

Bit flag for the
 [`DpDbCallback`](../DpDbCallback.md#s-DpDbCallback)
 method.

<a id="s-CANDIDATE_CONFIRMING_COMMIT"></a>
### CANDIDATE_CONFIRMING_COMMIT

```java
public static final com.tailf.dp.proto.DBCBType CANDIDATE_CONFIRMING_COMMIT;
```

Bit flag for the
 [`DpDbCallback`](../DpDbCallback.md#s-DpDbCallback)
 method.

<a id="s-CANDIDATE_RESET"></a>
### CANDIDATE_RESET

```java
public static final com.tailf.dp.proto.DBCBType CANDIDATE_RESET;
```

Bit flag for the
 [`DpDbCallback`](../DpDbCallback.md#s-DpDbCallback) method.

<a id="s-CANDIDATE_ROLLBACK_RUNNING"></a>
### CANDIDATE_ROLLBACK_RUNNING

```java
public static final com.tailf.dp.proto.DBCBType CANDIDATE_ROLLBACK_RUNNING;
```

Bit flag for the
 [`DpDbCallback`](../DpDbCallback.md#s-DpDbCallback)
 method.

<a id="s-CANDIDATE_VALIDATE"></a>
### CANDIDATE_VALIDATE

```java
public static final com.tailf.dp.proto.DBCBType CANDIDATE_VALIDATE;
```

Bit flag for the
 [`DpDbCallback`](../DpDbCallback.md#s-DpDbCallback) method.

<a id="s-COPY_RUNNING_TO_STARTUP"></a>
### COPY_RUNNING_TO_STARTUP

```java
public static final com.tailf.dp.proto.DBCBType COPY_RUNNING_TO_STARTUP;
```

Bit flag for the
 [`DpDbCallback`](../DpDbCallback.md#s-DpDbCallback)
 method.

<a id="s-DEL_CHECKPOINT_RUNNING"></a>
### DEL_CHECKPOINT_RUNNING

```java
public static final com.tailf.dp.proto.DBCBType DEL_CHECKPOINT_RUNNING;
```

Bit flag for the
 [`DpDbCallback`](../DpDbCallback.md#s-DpDbCallback)
 method.

<a id="s-DELETE_CONFIG"></a>
### DELETE_CONFIG

```java
public static final com.tailf.dp.proto.DBCBType DELETE_CONFIG;
```

Bit flag for the
 [`DpDbCallback`](../DpDbCallback.md#s-DpDbCallback) method.

<a id="s-LOCK"></a>
### LOCK

```java
public static final com.tailf.dp.proto.DBCBType LOCK;
```

Bit flag for the
 [`DpDbCallback`](../DpDbCallback.md#s-DpDbCallback) method.

<a id="s-LOCK_PARTIAL"></a>
### LOCK_PARTIAL

```java
public static final com.tailf.dp.proto.DBCBType LOCK_PARTIAL;
```

Bit flag for the
 [`DpDbCallback`](../DpDbCallback.md#s-DpDbCallback) method.

<a id="s-RUNNING_CHK_NOT_MODIFIED"></a>
### RUNNING_CHK_NOT_MODIFIED

```java
public static final com.tailf.dp.proto.DBCBType RUNNING_CHK_NOT_MODIFIED;
```

Bit flag for the
 [`DpDbCallback`](../DpDbCallback.md#s-DpDbCallback)
 method.

<a id="s-UNLOCK"></a>
### UNLOCK

```java
public static final com.tailf.dp.proto.DBCBType UNLOCK;
```

Bit flag for the
 [`DpDbCallback`](../DpDbCallback.md#s-DpDbCallback) method.

<a id="s-UNLOCK_PARTIAL"></a>
### UNLOCK_PARTIAL

```java
public static final com.tailf.dp.proto.DBCBType UNLOCK_PARTIAL;
```

Bit flag for the
 [`DpDbCallback`](../DpDbCallback.md#s-DpDbCallback)
 method.


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

get integer value for enum

**Returns:** int value

<a id="s-valueOf"></a>
### valueOf(String)

```java
public static com.tailf.dp.proto.DBCBType valueOf(String name)
```

Types: [DBCBType](DBCBType.md#s-DBCBType)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.dp.proto.DBCBType[] values()
```

Types: [DBCBType](DBCBType.md#s-DBCBType)
