<a id="s-CdbSubscriptionType"></a>
# CdbSubscriptionType

```java
public enum com.tailf.cdb.CdbSubscriptionType
```

Types: [CdbSubscriptionType](CdbSubscriptionType.md#s-CdbSubscriptionType)

Subscription type used in subscribe() method

**Related classes**

- [CdbSubscriptionType](CdbSubscriptionType.md#s-CdbSubscriptionType)

## Members

**Enum Constants**:

- [SUB_OPERATIONAL](#s-SUB_OPERATIONAL)
- [SUB_RUNNING](#s-SUB_RUNNING)
- [SUB_RUNNING_TWOPHASE](#s-SUB_RUNNING_TWOPHASE)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-SUB_OPERATIONAL"></a>
### SUB_OPERATIONAL

```java
public static final com.tailf.cdb.CdbSubscriptionType SUB_OPERATIONAL;
```

Setup subscription in the operational database

<a id="s-SUB_RUNNING"></a>
### SUB_RUNNING

```java
public static final com.tailf.cdb.CdbSubscriptionType SUB_RUNNING;
```

Setup subscription in the running database

<a id="s-SUB_RUNNING_TWOPHASE"></a>
### SUB_RUNNING_TWOPHASE

```java
public static final com.tailf.cdb.CdbSubscriptionType SUB_RUNNING_TWOPHASE;
```

Setup subscription for both prepare and commit states of transactions in
 the running database


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

<a id="s-valueOf"></a>
### valueOf(String)

```java
public static com.tailf.cdb.CdbSubscriptionType valueOf(String name)
```

Types: [CdbSubscriptionType](CdbSubscriptionType.md#s-CdbSubscriptionType)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.cdb.CdbSubscriptionType[] values()
```

Types: [CdbSubscriptionType](CdbSubscriptionType.md#s-CdbSubscriptionType)
