<a id="s-CdbSubscrConfigFlag"></a>
# CdbSubscrConfigFlag

```java
public enum com.tailf.cdb.CdbSubscrConfigFlag
```

Types: [CdbSubscrConfigFlag](CdbSubscrConfigFlag.md#s-CdbSubscrConfigFlag)

Distinguish the different types of subscription notifications

**Related classes**

- [CdbSubscrConfigFlag](CdbSubscrConfigFlag.md#s-CdbSubscrConfigFlag)

## Members

**Enum Constants**:

- [CDB_SUB_WANT_ABORT_ON_ABORT](#s-CDB_SUB_WANT_ABORT_ON_ABORT)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(int)](#s-valueOf)
- [valueOf(String)](#s-valueOf-1)
- [values()](#s-values)

## Enum Constants

<a id="s-CDB_SUB_WANT_ABORT_ON_ABORT"></a>
### CDB_SUB_WANT_ABORT_ON_ABORT

```java
public static final com.tailf.cdb.CdbSubscrConfigFlag CDB_SUB_WANT_ABORT_ON_ABORT;
```

Normally if a subscriber is the one to abort a transaction it will not
 receive an abort notification.
 This flags means that this subscriber wants an abort notification even
 if it was the one that called
  [`CdbSubscription`](CdbSubscription.md#s-CdbSubscription)
 This flag is only valid when the subscription type is
  [`CdbSubscriptionType`](CdbSubscriptionType.md#s-CdbSubscriptionType)


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

<a id="s-valueOf"></a>
### valueOf(int)

```java
public static com.tailf.cdb.CdbSubscrConfigFlag valueOf(int i)
```

Types: [CdbSubscrConfigFlag](CdbSubscrConfigFlag.md#s-CdbSubscrConfigFlag)

**Parameters**

- `int i`

<a id="s-valueOf-1"></a>
### valueOf(String)

```java
public static com.tailf.cdb.CdbSubscrConfigFlag valueOf(String name)
```

Types: [CdbSubscrConfigFlag](CdbSubscrConfigFlag.md#s-CdbSubscrConfigFlag)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.cdb.CdbSubscrConfigFlag[] values()
```

Types: [CdbSubscrConfigFlag](CdbSubscrConfigFlag.md#s-CdbSubscrConfigFlag)
