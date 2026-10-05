<a id="cls-CdbSubscriptionSyncType"></a>
# CdbSubscriptionSyncType

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

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-DONE_OPERATIONAL"></a>
### DONE_OPERATIONAL

```java
public static final com.tailf.cdb.CdbSubscriptionSyncType DONE_OPERATIONAL;
```

This should be used when a subscription notification for
 operational data has been read. It is the only type that
  should be used in this case, since the operational data does not
  have transactions and the notifications do not have priorities.

<a id="m-DONE_PRIORITY"></a>
### DONE_PRIORITY

```java
public static final com.tailf.cdb.CdbSubscriptionSyncType DONE_PRIORITY;
```

This means that application has
 acted on the subscription notification and CDB
 can continue to deliver further notifications.

<a id="m-DONE_SOCKET"></a>
### DONE_SOCKET

```java
public static final com.tailf.cdb.CdbSubscriptionSyncType DONE_SOCKET;
```

This means that we are done. But regardless of priority,
 CDB shall not send any further notifications to us on our
 socket that are related to the currently executing transaction.

<a id="m-DONE_TRANSACTION"></a>
### DONE_TRANSACTION

```java
public static final com.tailf.cdb.CdbSubscriptionSyncType DONE_TRANSACTION;
```

This means that CDB should not send any further notifications
   to any subscribers - including ourselves -
   related to the currently executing transaction.
   Subscription sync type used in sync() method.


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.cdb.CdbSubscriptionSyncType valueOf(String name)
```

Types: [CdbSubscriptionSyncType](CdbSubscriptionSyncType.md#cls-CdbSubscriptionSyncType)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.cdb.CdbSubscriptionSyncType[] values()
```

Types: [CdbSubscriptionSyncType](CdbSubscriptionSyncType.md#cls-CdbSubscriptionSyncType)
