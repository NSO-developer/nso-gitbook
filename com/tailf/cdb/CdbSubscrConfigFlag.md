# CdbSubscrConfigFlag <a href="#cdbsubscrconfigflag-881f5a524821" id="cdbsubscrconfigflag-881f5a524821"></a>

```java
public enum com.tailf.cdb.CdbSubscrConfigFlag
```

Types: [CdbSubscrConfigFlag](CdbSubscrConfigFlag.md#cdbsubscrconfigflag-881f5a524821)

Distinguish the different types of subscription notifications

## Members

**Enum Constants**:

- [CDB\_SUB\_WANT\_ABORT\_ON\_ABORT](#cdb_sub_want_abort_on_abort-47411eed1a75)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(int\)](#valueof-c0d46d25fc67)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### CDB_SUB_WANT_ABORT_ON_ABORT <a href="#cdb_sub_want_abort_on_abort-47411eed1a75" id="cdb_sub_want_abort_on_abort-47411eed1a75"></a>

```java
public static final com.tailf.cdb.CdbSubscrConfigFlag CDB_SUB_WANT_ABORT_ON_ABORT;
```

Normally if a subscriber is the one to abort a transaction it will not
 receive an abort notification.
 This flags means that this subscriber wants an abort notification even
 if it was the one that called
  [`CdbSubscription#abortTransaction(CdbExtendedException)`](CdbSubscription.md#aborttransaction-c0694458d9be)
 This flag is only valid when the subscription type is
  [`CdbSubscriptionType#SUB_RUNNING_TWOPHASE`](CdbSubscriptionType.md#sub_running_twophase-ae7b9c659f06)


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(int) <a href="#valueof-c0d46d25fc67" id="valueof-c0d46d25fc67"></a>

```java
public static com.tailf.cdb.CdbSubscrConfigFlag valueOf(int i)
```

Types: [CdbSubscrConfigFlag](CdbSubscrConfigFlag.md#cdbsubscrconfigflag-881f5a524821)

**Parameters**

- `int i`

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.cdb.CdbSubscrConfigFlag valueOf(String name)
```

Types: [CdbSubscrConfigFlag](CdbSubscrConfigFlag.md#cdbsubscrconfigflag-881f5a524821)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.cdb.CdbSubscrConfigFlag[] values()
```

Types: [CdbSubscrConfigFlag](CdbSubscrConfigFlag.md#cdbsubscrconfigflag-881f5a524821)
