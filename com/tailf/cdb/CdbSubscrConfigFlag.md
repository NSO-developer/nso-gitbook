# CdbSubscrConfigFlag <a href="#cls-CdbSubscrConfigFlag" id="cls-CdbSubscrConfigFlag"></a>

```java
public enum com.tailf.cdb.CdbSubscrConfigFlag
```

Types: [CdbSubscrConfigFlag](CdbSubscrConfigFlag.md#cls-CdbSubscrConfigFlag)

Distinguish the different types of subscription notifications

## Members

**Enum Constants**:

- [CDB_SUB_WANT_ABORT_ON_ABORT](#m-CDB_SUB_WANT_ABORT_ON_ABORT)

**Methods**:

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(int)](#m-valueOf-c0d46d25fc67)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### CDB_SUB_WANT_ABORT_ON_ABORT <a href="#m-CDB_SUB_WANT_ABORT_ON_ABORT" id="m-CDB_SUB_WANT_ABORT_ON_ABORT"></a>

```java
public static final com.tailf.cdb.CdbSubscrConfigFlag CDB_SUB_WANT_ABORT_ON_ABORT;
```

Normally if a subscriber is the one to abort a transaction it will not
 receive an abort notification.
 This flags means that this subscriber wants an abort notification even
 if it was the one that called
  [`CdbSubscription#abortTransaction(CdbExtendedException)`](CdbSubscription.md#m-abortTransaction-c0694458d9be)
 This flag is only valid when the subscription type is
  [`CdbSubscriptionType#SUB_RUNNING_TWOPHASE`](CdbSubscriptionType.md#m-SUB_RUNNING_TWOPHASE)


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(int) <a href="#m-valueOf-c0d46d25fc67" id="m-valueOf-c0d46d25fc67"></a>

```java
public static com.tailf.cdb.CdbSubscrConfigFlag valueOf(int i)
```

Types: [CdbSubscrConfigFlag](CdbSubscrConfigFlag.md#cls-CdbSubscrConfigFlag)

**Parameters**

- `int i`

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.cdb.CdbSubscrConfigFlag valueOf(String name)
```

Types: [CdbSubscrConfigFlag](CdbSubscrConfigFlag.md#cls-CdbSubscrConfigFlag)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.cdb.CdbSubscrConfigFlag[] values()
```

Types: [CdbSubscrConfigFlag](CdbSubscrConfigFlag.md#cls-CdbSubscrConfigFlag)
