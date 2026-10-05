# CdbSubscriptionFlagType <a href="#cls-CdbSubscriptionFlagType" id="cls-CdbSubscriptionFlagType"></a>

```java
public enum com.tailf.cdb.CdbSubscriptionFlagType
```

Types: [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#cls-CdbSubscriptionFlagType)

Distinguish the different types of subscription notifications

## Members

**Enum Constants**:

- [CDB_SUB_FLAG_HA_IS_SECONDARY](#m-CDB_SUB_FLAG_HA_IS_SECONDARY)
- [CDB_SUB_FLAG_HA_SYNC](#m-CDB_SUB_FLAG_HA_SYNC)
- [CDB_SUB_FLAG_IS_LAST](#m-CDB_SUB_FLAG_IS_LAST)
- [CDB_SUB_FLAG_REVERT](#m-CDB_SUB_FLAG_REVERT)
- [CDB_SUB_FLAG_TRIGGER](#m-CDB_SUB_FLAG_TRIGGER)

**Methods**:

- [enumSetOf(int)](#m-enumSetOf-af9f1a9f53f8)
- [getValue()](#m-getValue-d93864668c40)
- [valueOf(int)](#m-valueOf-c0d46d25fc67)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### CDB_SUB_FLAG_HA_IS_SECONDARY <a href="#m-CDB_SUB_FLAG_HA_IS_SECONDARY" id="m-CDB_SUB_FLAG_HA_IS_SECONDARY"></a>

```java
public static final com.tailf.cdb.CdbSubscriptionFlagType CDB_SUB_FLAG_HA_IS_SECONDARY;
```

This bit is set when the system is in HA secondary mode.

### CDB_SUB_FLAG_HA_SYNC <a href="#m-CDB_SUB_FLAG_HA_SYNC" id="m-CDB_SUB_FLAG_HA_SYNC"></a>

```java
public static final com.tailf.cdb.CdbSubscriptionFlagType CDB_SUB_FLAG_HA_SYNC;
```

This bit is set when the cause of the subscription notification is
 initial synchronization of a HA secondary from CDB on the primary.

### CDB_SUB_FLAG_IS_LAST <a href="#m-CDB_SUB_FLAG_IS_LAST" id="m-CDB_SUB_FLAG_IS_LAST"></a>

```java
public static final com.tailf.cdb.CdbSubscriptionFlagType CDB_SUB_FLAG_IS_LAST;
```

This bit is set when this notification is the last of
 its type  for this subscription socket.

### CDB_SUB_FLAG_REVERT <a href="#m-CDB_SUB_FLAG_REVERT" id="m-CDB_SUB_FLAG_REVERT"></a>

```java
public static final com.tailf.cdb.CdbSubscriptionFlagType CDB_SUB_FLAG_REVERT;
```

If a confirming commit is aborted it will look to the CDB
 subscribe as if a transaction happened that is the reverse of
 what the  original transaction was. This bit will be set when
 such a transaction is the cause of the notification. Note that for
 a two-phase subscriber both a prepare and a commit notification
 is delivered. However it is not possible to reply by calling
 [`CdbSubscription#abortTransaction(CdbExtendedException)`](CdbSubscription.md#m-abortTransaction-c0694458d9be) for
 the prepare notification in this case,
 instead the subscriber will have to take appropriate backup action
 if it needs to abort (for example: raise an alarm, restart,
 or even reboot the system).

### CDB_SUB_FLAG_TRIGGER <a href="#m-CDB_SUB_FLAG_TRIGGER" id="m-CDB_SUB_FLAG_TRIGGER"></a>

```java
public static final com.tailf.cdb.CdbSubscriptionFlagType CDB_SUB_FLAG_TRIGGER;
```

This bit is set when the cause of the subscription notification is
 that someone called [`Cdb#triggerSubscriptions(int[])`](Cdb.md#m-triggerSubscriptions-b7a5ff565df7).


## Methods

### enumSetOf(int) <a href="#m-enumSetOf-af9f1a9f53f8" id="m-enumSetOf-af9f1a9f53f8"></a>

```java
public static java.util.EnumSet<com.tailf.cdb.CdbSubscriptionFlagType> enumSetOf(int i)
```

Types: [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#cls-CdbSubscriptionFlagType)

**Parameters**

- `int i`

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(int) <a href="#m-valueOf-c0d46d25fc67" id="m-valueOf-c0d46d25fc67"></a>

```java
public static com.tailf.cdb.CdbSubscriptionFlagType valueOf(int i)
```

Types: [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#cls-CdbSubscriptionFlagType)

**Parameters**

- `int i`

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.cdb.CdbSubscriptionFlagType valueOf(String name)
```

Types: [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#cls-CdbSubscriptionFlagType)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.cdb.CdbSubscriptionFlagType[] values()
```

Types: [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#cls-CdbSubscriptionFlagType)
