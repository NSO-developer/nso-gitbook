# CdbSubscriptionSyncType <a href="#cdbsubscriptionsynctype-adacba3ff512" id="cdbsubscriptionsynctype-adacba3ff512"></a>

```java
public enum com.tailf.cdb.CdbSubscriptionSyncType
```

Subscription Synchronization type used in sync() method

## Members

**Enum Constants**:

- [DONE\_OPERATIONAL](#done_operational-a27840e105d3)
- [DONE\_PRIORITY](#done_priority-b870590aba34)
- [DONE\_SOCKET](#done_socket-acfefb01e422)
- [DONE\_TRANSACTION](#done_transaction-49dca47f96cf)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### DONE_OPERATIONAL <a href="#done_operational-a27840e105d3" id="done_operational-a27840e105d3"></a>

```java
DONE_OPERATIONAL(4);
```

This should be used when a subscription notification for
 operational data has been read. It is the only type that
  should be used in this case, since the operational data does not
  have transactions and the notifications do not have priorities.

### DONE_PRIORITY <a href="#done_priority-b870590aba34" id="done_priority-b870590aba34"></a>

```java
DONE_PRIORITY(1);
```

This means that application has
 acted on the subscription notification and CDB
 can continue to deliver further notifications.

### DONE_SOCKET <a href="#done_socket-acfefb01e422" id="done_socket-acfefb01e422"></a>

```java
DONE_SOCKET(2);
```

This means that we are done. But regardless of priority,
 CDB shall not send any further notifications to us on our
 socket that are related to the currently executing transaction.

### DONE_TRANSACTION <a href="#done_transaction-49dca47f96cf" id="done_transaction-49dca47f96cf"></a>

```java
DONE_TRANSACTION(3);
```

This means that CDB should not send any further notifications
   to any subscribers - including ourselves -
   related to the currently executing transaction.
   Subscription sync type used in sync() method.


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.cdb.CdbSubscriptionSyncType valueOf(String name)
```

Types: [CdbSubscriptionSyncType](CdbSubscriptionSyncType.md#cdbsubscriptionsynctype-adacba3ff512)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.cdb.CdbSubscriptionSyncType[] values()
```

Types: [CdbSubscriptionSyncType](CdbSubscriptionSyncType.md#cdbsubscriptionsynctype-adacba3ff512)
