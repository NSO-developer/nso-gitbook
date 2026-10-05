# CdbNotificationType <a href="#cdbnotificationtype-ed004a968992" id="cdbnotificationtype-ed004a968992"></a>

```java
public enum com.tailf.cdb.CdbNotificationType
```

Subscription notification type retrieved from getLatestNotificationType()
 method

## Members

**Enum Constants**:

- [SUB\_ABORT](#sub_abort-ac91cee66b28)
- [SUB\_COMMIT](#sub_commit-633bd95c1d87)
- [SUB\_OPER](#sub_oper-f2b8e63685f1)
- [SUB\_PREPARE](#sub_prepare-1762334ebd19)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(int\)](#valueof-c0d46d25fc67)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### SUB_ABORT <a href="#sub_abort-ac91cee66b28" id="sub_abort-ac91cee66b28"></a>

```java
public static final com.tailf.cdb.CdbNotificationType SUB_ABORT;
```

Notification on aborted transaction

### SUB_COMMIT <a href="#sub_commit-633bd95c1d87" id="sub_commit-633bd95c1d87"></a>

```java
public static final com.tailf.cdb.CdbNotificationType SUB_COMMIT;
```

Notification on transaction in commit state

### SUB_OPER <a href="#sub_oper-f2b8e63685f1" id="sub_oper-f2b8e63685f1"></a>

```java
public static final com.tailf.cdb.CdbNotificationType SUB_OPER;
```

Notification

### SUB_PREPARE <a href="#sub_prepare-1762334ebd19" id="sub_prepare-1762334ebd19"></a>

```java
public static final com.tailf.cdb.CdbNotificationType SUB_PREPARE;
```

Notification on transaction in prepare state


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(int) <a href="#valueof-c0d46d25fc67" id="valueof-c0d46d25fc67"></a>

```java
public static com.tailf.cdb.CdbNotificationType valueOf(int i)
```

Types: [CdbNotificationType](CdbNotificationType.md#cdbnotificationtype-ed004a968992)

**Parameters**

- `int i`

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.cdb.CdbNotificationType valueOf(String name)
```

Types: [CdbNotificationType](CdbNotificationType.md#cdbnotificationtype-ed004a968992)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.cdb.CdbNotificationType[] values()
```

Types: [CdbNotificationType](CdbNotificationType.md#cdbnotificationtype-ed004a968992)
