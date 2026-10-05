# CdbNotificationType <a href="#cls-CdbNotificationType" id="cls-CdbNotificationType"></a>

```java
public enum com.tailf.cdb.CdbNotificationType
```

Types: [CdbNotificationType](CdbNotificationType.md#cls-CdbNotificationType)

Subscription notification type retrieved from getLatestNotificationType()
 method

## Members

**Enum Constants**:

- [SUB_ABORT](#m-SUB_ABORT)
- [SUB_COMMIT](#m-SUB_COMMIT)
- [SUB_OPER](#m-SUB_OPER)
- [SUB_PREPARE](#m-SUB_PREPARE)

**Methods**:

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(int)](#m-valueOf-c0d46d25fc67)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### SUB_ABORT <a href="#m-SUB_ABORT" id="m-SUB_ABORT"></a>

```java
public static final com.tailf.cdb.CdbNotificationType SUB_ABORT;
```

Notification on aborted transaction

### SUB_COMMIT <a href="#m-SUB_COMMIT" id="m-SUB_COMMIT"></a>

```java
public static final com.tailf.cdb.CdbNotificationType SUB_COMMIT;
```

Notification on transaction in commit state

### SUB_OPER <a href="#m-SUB_OPER" id="m-SUB_OPER"></a>

```java
public static final com.tailf.cdb.CdbNotificationType SUB_OPER;
```

Notification

### SUB_PREPARE <a href="#m-SUB_PREPARE" id="m-SUB_PREPARE"></a>

```java
public static final com.tailf.cdb.CdbNotificationType SUB_PREPARE;
```

Notification on transaction in prepare state


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(int) <a href="#m-valueOf-c0d46d25fc67" id="m-valueOf-c0d46d25fc67"></a>

```java
public static com.tailf.cdb.CdbNotificationType valueOf(int i)
```

Types: [CdbNotificationType](CdbNotificationType.md#cls-CdbNotificationType)

**Parameters**

- `int i`

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.cdb.CdbNotificationType valueOf(String name)
```

Types: [CdbNotificationType](CdbNotificationType.md#cls-CdbNotificationType)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.cdb.CdbNotificationType[] values()
```

Types: [CdbNotificationType](CdbNotificationType.md#cls-CdbNotificationType)
