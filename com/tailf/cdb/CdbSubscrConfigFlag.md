<a id="cls-CdbSubscrConfigFlag"></a>
# CdbSubscrConfigFlag

```java
public enum com.tailf.cdb.CdbSubscrConfigFlag
```

Types: [CdbSubscrConfigFlag](CdbSubscrConfigFlag.md#cls-CdbSubscrConfigFlag)

Distinguish the different types of subscription notifications

## Members

**Enum Constants**:

- [CDB_SUB_WANT_ABORT_ON_ABORT](#m-CDB_SUB_WANT_ABORT_ON_ABORT)

**Methods**:

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(int)](#m-valueof-c0d46d25fc67)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-CDB_SUB_WANT_ABORT_ON_ABORT"></a>
### CDB_SUB_WANT_ABORT_ON_ABORT

```java
public static final com.tailf.cdb.CdbSubscrConfigFlag CDB_SUB_WANT_ABORT_ON_ABORT;
```

Normally if a subscriber is the one to abort a transaction it will not
 receive an abort notification.
 This flags means that this subscriber wants an abort notification even
 if it was the one that called
  [`CdbSubscription#abortTransaction(CdbExtendedException)`](CdbSubscription.md#m-aborttransaction-c0694458d9be)
 This flag is only valid when the subscription type is
  [`CdbSubscriptionType#SUB_RUNNING_TWOPHASE`](CdbSubscriptionType.md#m-SUB_RUNNING_TWOPHASE)


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

<a id="m-valueof-c0d46d25fc67"></a>
### valueOf(int)

```java
public static com.tailf.cdb.CdbSubscrConfigFlag valueOf(int i)
```

Types: [CdbSubscrConfigFlag](CdbSubscrConfigFlag.md#cls-CdbSubscrConfigFlag)

**Parameters**

- `int i`

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.cdb.CdbSubscrConfigFlag valueOf(String name)
```

Types: [CdbSubscrConfigFlag](CdbSubscrConfigFlag.md#cls-CdbSubscrConfigFlag)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.cdb.CdbSubscrConfigFlag[] values()
```

Types: [CdbSubscrConfigFlag](CdbSubscrConfigFlag.md#cls-CdbSubscrConfigFlag)
