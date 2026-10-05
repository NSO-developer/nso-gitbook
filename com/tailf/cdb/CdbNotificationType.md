<a id="cls-CdbNotificationType"></a>
# CdbNotificationType

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

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(int)](#m-valueof-c0d46d25fc67)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-SUB_ABORT"></a>
### SUB_ABORT

```java
public static final com.tailf.cdb.CdbNotificationType SUB_ABORT;
```

Notification on aborted transaction

<a id="m-SUB_COMMIT"></a>
### SUB_COMMIT

```java
public static final com.tailf.cdb.CdbNotificationType SUB_COMMIT;
```

Notification on transaction in commit state

<a id="m-SUB_OPER"></a>
### SUB_OPER

```java
public static final com.tailf.cdb.CdbNotificationType SUB_OPER;
```

Notification

<a id="m-SUB_PREPARE"></a>
### SUB_PREPARE

```java
public static final com.tailf.cdb.CdbNotificationType SUB_PREPARE;
```

Notification on transaction in prepare state


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

<a id="m-valueof-c0d46d25fc67"></a>
### valueOf(int)

```java
public static com.tailf.cdb.CdbNotificationType valueOf(int i)
```

Types: [CdbNotificationType](CdbNotificationType.md#cls-CdbNotificationType)

**Parameters**

- `int i`

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.cdb.CdbNotificationType valueOf(String name)
```

Types: [CdbNotificationType](CdbNotificationType.md#cls-CdbNotificationType)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.cdb.CdbNotificationType[] values()
```

Types: [CdbNotificationType](CdbNotificationType.md#cls-CdbNotificationType)
