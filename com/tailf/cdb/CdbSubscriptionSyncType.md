<a id="s-CdbSubscriptionSyncType"></a>
# CdbSubscriptionSyncType

```java
public enum com.tailf.cdb.CdbSubscriptionSyncType
```

Types: [CdbSubscriptionSyncType](CdbSubscriptionSyncType.md#s-CdbSubscriptionSyncType)

Subscription Synchronization type used in sync() method

**Related classes**

- [CdbSubscriptionSyncType](CdbSubscriptionSyncType.md#s-CdbSubscriptionSyncType)

## Members

**Enum Constants**:

- [DONE_OPERATIONAL](#s-DONE_OPERATIONAL)
- [DONE_PRIORITY](#s-DONE_PRIORITY)
- [DONE_SOCKET](#s-DONE_SOCKET)
- [DONE_TRANSACTION](#s-DONE_TRANSACTION)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-DONE_OPERATIONAL"></a>
### DONE_OPERATIONAL

```java
public static final com.tailf.cdb.CdbSubscriptionSyncType DONE_OPERATIONAL;
```

This should be used when a subscription notification for
 operational data has been read. It is the only type that
  should be used in this case, since the operational data does not
  have transactions and the notifications do not have priorities.

<a id="s-DONE_PRIORITY"></a>
### DONE_PRIORITY

```java
public static final com.tailf.cdb.CdbSubscriptionSyncType DONE_PRIORITY;
```

This means that application has
 acted on the subscription notification and CDB
 can continue to deliver further notifications.

<a id="s-DONE_SOCKET"></a>
### DONE_SOCKET

```java
public static final com.tailf.cdb.CdbSubscriptionSyncType DONE_SOCKET;
```

This means that we are done. But regardless of priority,
 CDB shall not send any further notifications to us on our
 socket that are related to the currently executing transaction.

<a id="s-DONE_TRANSACTION"></a>
### DONE_TRANSACTION

```java
public static final com.tailf.cdb.CdbSubscriptionSyncType DONE_TRANSACTION;
```

This means that CDB should not send any further notifications
   to any subscribers - including ourselves -
   related to the currently executing transaction.
   Subscription sync type used in sync() method.


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

<a id="s-valueOf"></a>
### valueOf(String)

```java
public static com.tailf.cdb.CdbSubscriptionSyncType valueOf(String name)
```

Types: [CdbSubscriptionSyncType](CdbSubscriptionSyncType.md#s-CdbSubscriptionSyncType)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.cdb.CdbSubscriptionSyncType[] values()
```

Types: [CdbSubscriptionSyncType](CdbSubscriptionSyncType.md#s-CdbSubscriptionSyncType)
