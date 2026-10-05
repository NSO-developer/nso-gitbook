# CdbSubscriptionSyncType <a href="#cls-CdbSubscriptionSyncType" id="cls-CdbSubscriptionSyncType"></a>

```java
public enum com.tailf.cdb.CdbSubscriptionSyncType
```

Types: [CdbSubscriptionSyncType](CdbSubscriptionSyncType.md#cls-CdbSubscriptionSyncType)

Subscription Synchronization type used in sync() method

## Members

**Enum Constants**:

- [DONE_OPERATIONAL](#m-DONE_OPERATIONAL)
- [DONE_PRIORITY](#m-DONE_PRIORITY)
- [DONE_SOCKET](#m-DONE_SOCKET)
- [DONE_TRANSACTION](#m-DONE_TRANSACTION)

**Methods**:

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### DONE_OPERATIONAL <a href="#m-DONE_OPERATIONAL" id="m-DONE_OPERATIONAL"></a>

```java
public static final com.tailf.cdb.CdbSubscriptionSyncType DONE_OPERATIONAL;
```

This should be used when a subscription notification for
 operational data has been read. It is the only type that
  should be used in this case, since the operational data does not
  have transactions and the notifications do not have priorities.

### DONE_PRIORITY <a href="#m-DONE_PRIORITY" id="m-DONE_PRIORITY"></a>

```java
public static final com.tailf.cdb.CdbSubscriptionSyncType DONE_PRIORITY;
```

This means that application has
 acted on the subscription notification and CDB
 can continue to deliver further notifications.

### DONE_SOCKET <a href="#m-DONE_SOCKET" id="m-DONE_SOCKET"></a>

```java
public static final com.tailf.cdb.CdbSubscriptionSyncType DONE_SOCKET;
```

This means that we are done. But regardless of priority,
 CDB shall not send any further notifications to us on our
 socket that are related to the currently executing transaction.

### DONE_TRANSACTION <a href="#m-DONE_TRANSACTION" id="m-DONE_TRANSACTION"></a>

```java
public static final com.tailf.cdb.CdbSubscriptionSyncType DONE_TRANSACTION;
```

This means that CDB should not send any further notifications
   to any subscribers - including ourselves -
   related to the currently executing transaction.
   Subscription sync type used in sync() method.


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.cdb.CdbSubscriptionSyncType valueOf(String name)
```

Types: [CdbSubscriptionSyncType](CdbSubscriptionSyncType.md#cls-CdbSubscriptionSyncType)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.cdb.CdbSubscriptionSyncType[] values()
```

Types: [CdbSubscriptionSyncType](CdbSubscriptionSyncType.md#cls-CdbSubscriptionSyncType)
