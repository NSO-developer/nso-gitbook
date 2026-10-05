# CdbSubscriptionType <a href="#cls-CdbSubscriptionType" id="cls-CdbSubscriptionType"></a>

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

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### SUB_OPERATIONAL <a href="#m-SUB_OPERATIONAL" id="m-SUB_OPERATIONAL"></a>

```java
public static final com.tailf.cdb.CdbSubscriptionType SUB_OPERATIONAL;
```

Setup subscription in the operational database

### SUB_RUNNING <a href="#m-SUB_RUNNING" id="m-SUB_RUNNING"></a>

```java
public static final com.tailf.cdb.CdbSubscriptionType SUB_RUNNING;
```

Setup subscription in the running database

### SUB_RUNNING_TWOPHASE <a href="#m-SUB_RUNNING_TWOPHASE" id="m-SUB_RUNNING_TWOPHASE"></a>

```java
public static final com.tailf.cdb.CdbSubscriptionType SUB_RUNNING_TWOPHASE;
```

Setup subscription for both prepare and commit states of transactions in
 the running database


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.cdb.CdbSubscriptionType valueOf(String name)
```

Types: [CdbSubscriptionType](CdbSubscriptionType.md#cls-CdbSubscriptionType)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.cdb.CdbSubscriptionType[] values()
```

Types: [CdbSubscriptionType](CdbSubscriptionType.md#cls-CdbSubscriptionType)
