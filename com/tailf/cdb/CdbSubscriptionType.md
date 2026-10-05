# CdbSubscriptionType <a href="#cdbsubscriptiontype-e11484b3379f" id="cdbsubscriptiontype-e11484b3379f"></a>

```java
public enum com.tailf.cdb.CdbSubscriptionType
```

Types: [CdbSubscriptionType](CdbSubscriptionType.md#cdbsubscriptiontype-e11484b3379f)

Subscription type used in subscribe() method

## Members

**Enum Constants**:

- [SUB\_OPERATIONAL](#sub_operational-108575580ffa)
- [SUB\_RUNNING](#sub_running-2fc9f97444d6)
- [SUB\_RUNNING\_TWOPHASE](#sub_running_twophase-ae7b9c659f06)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### SUB_OPERATIONAL <a href="#sub_operational-108575580ffa" id="sub_operational-108575580ffa"></a>

```java
public static final com.tailf.cdb.CdbSubscriptionType SUB_OPERATIONAL;
```

Setup subscription in the operational database

### SUB_RUNNING <a href="#sub_running-2fc9f97444d6" id="sub_running-2fc9f97444d6"></a>

```java
public static final com.tailf.cdb.CdbSubscriptionType SUB_RUNNING;
```

Setup subscription in the running database

### SUB_RUNNING_TWOPHASE <a href="#sub_running_twophase-ae7b9c659f06" id="sub_running_twophase-ae7b9c659f06"></a>

```java
public static final com.tailf.cdb.CdbSubscriptionType SUB_RUNNING_TWOPHASE;
```

Setup subscription for both prepare and commit states of transactions in
 the running database


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.cdb.CdbSubscriptionType valueOf(String name)
```

Types: [CdbSubscriptionType](CdbSubscriptionType.md#cdbsubscriptiontype-e11484b3379f)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.cdb.CdbSubscriptionType[] values()
```

Types: [CdbSubscriptionType](CdbSubscriptionType.md#cdbsubscriptiontype-e11484b3379f)
