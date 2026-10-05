<a id="s-CdbNotificationType"></a>
# CdbNotificationType

```java
public enum com.tailf.cdb.CdbNotificationType
```

Types: [CdbNotificationType](CdbNotificationType.md#s-CdbNotificationType)

Subscription notification type retrieved from getLatestNotificationType()
 method

**Related classes**

- [CdbNotificationType](CdbNotificationType.md#s-CdbNotificationType)

## Members

**Enum Constants**:

- [SUB_ABORT](#s-SUB_ABORT)
- [SUB_COMMIT](#s-SUB_COMMIT)
- [SUB_OPER](#s-SUB_OPER)
- [SUB_PREPARE](#s-SUB_PREPARE)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(int)](#s-valueOf)
- [valueOf(String)](#s-valueOf-1)
- [values()](#s-values)

## Enum Constants

<a id="s-SUB_ABORT"></a>
### SUB_ABORT

```java
public static final com.tailf.cdb.CdbNotificationType SUB_ABORT;
```

Notification on aborted transaction

<a id="s-SUB_COMMIT"></a>
### SUB_COMMIT

```java
public static final com.tailf.cdb.CdbNotificationType SUB_COMMIT;
```

Notification on transaction in commit state

<a id="s-SUB_OPER"></a>
### SUB_OPER

```java
public static final com.tailf.cdb.CdbNotificationType SUB_OPER;
```

Notification

<a id="s-SUB_PREPARE"></a>
### SUB_PREPARE

```java
public static final com.tailf.cdb.CdbNotificationType SUB_PREPARE;
```

Notification on transaction in prepare state


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

<a id="s-valueOf"></a>
### valueOf(int)

```java
public static com.tailf.cdb.CdbNotificationType valueOf(int i)
```

Types: [CdbNotificationType](CdbNotificationType.md#s-CdbNotificationType)

**Parameters**

- `int i`

<a id="s-valueOf-1"></a>
### valueOf(String)

```java
public static com.tailf.cdb.CdbNotificationType valueOf(String name)
```

Types: [CdbNotificationType](CdbNotificationType.md#s-CdbNotificationType)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.cdb.CdbNotificationType[] values()
```

Types: [CdbNotificationType](CdbNotificationType.md#s-CdbNotificationType)
