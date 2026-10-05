<a id="cls-CdbSubscriptionType"></a>
# CdbSubscriptionType

```java
public enum com.tailf.cdb.CdbSubscriptionType
```

Types: [CdbSubscriptionType](CdbSubscriptionType.md#cls-CdbSubscriptionType)

Subscription type used in subscribe() method

## Members

**Enum Constants**:

- [SUB_OPERATIONAL](#m-SUB_OPERATIONAL)
- [SUB_RUNNING](#m-SUB_RUNNING)
- [SUB_RUNNING_TWOPHASE](#m-SUB_RUNNING_TWOPHASE)

**Methods**:

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-SUB_OPERATIONAL"></a>
### SUB_OPERATIONAL

```java
public static final com.tailf.cdb.CdbSubscriptionType SUB_OPERATIONAL;
```

Setup subscription in the operational database

<a id="m-SUB_RUNNING"></a>
### SUB_RUNNING

```java
public static final com.tailf.cdb.CdbSubscriptionType SUB_RUNNING;
```

Setup subscription in the running database

<a id="m-SUB_RUNNING_TWOPHASE"></a>
### SUB_RUNNING_TWOPHASE

```java
public static final com.tailf.cdb.CdbSubscriptionType SUB_RUNNING_TWOPHASE;
```

Setup subscription for both prepare and commit states of transactions in
 the running database


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.cdb.CdbSubscriptionType valueOf(String name)
```

Types: [CdbSubscriptionType](CdbSubscriptionType.md#cls-CdbSubscriptionType)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.cdb.CdbSubscriptionType[] values()
```

Types: [CdbSubscriptionType](CdbSubscriptionType.md#cls-CdbSubscriptionType)
