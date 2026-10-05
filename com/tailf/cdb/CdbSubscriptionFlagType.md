<a id="s-CdbSubscriptionFlagType"></a>
# CdbSubscriptionFlagType

```java
public enum com.tailf.cdb.CdbSubscriptionFlagType
```

Types: [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#s-CdbSubscriptionFlagType)

Distinguish the different types of subscription notifications

**Related classes**

- [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#s-CdbSubscriptionFlagType)

## Members

**Enum Constants**:

- [CDB_SUB_FLAG_HA_IS_SECONDARY](#s-CDB_SUB_FLAG_HA_IS_SECONDARY)
- [CDB_SUB_FLAG_HA_SYNC](#s-CDB_SUB_FLAG_HA_SYNC)
- [CDB_SUB_FLAG_IS_LAST](#s-CDB_SUB_FLAG_IS_LAST)
- [CDB_SUB_FLAG_REVERT](#s-CDB_SUB_FLAG_REVERT)
- [CDB_SUB_FLAG_TRIGGER](#s-CDB_SUB_FLAG_TRIGGER)

**Methods**:

- [enumSetOf(int)](#s-enumSetOf)
- [getValue()](#s-getValue)
- [valueOf(int)](#s-valueOf)
- [valueOf(String)](#s-valueOf-1)
- [values()](#s-values)

## Enum Constants

<a id="s-CDB_SUB_FLAG_HA_IS_SECONDARY"></a>
### CDB_SUB_FLAG_HA_IS_SECONDARY

```java
public static final com.tailf.cdb.CdbSubscriptionFlagType CDB_SUB_FLAG_HA_IS_SECONDARY;
```

This bit is set when the system is in HA secondary mode.

<a id="s-CDB_SUB_FLAG_HA_SYNC"></a>
### CDB_SUB_FLAG_HA_SYNC

```java
public static final com.tailf.cdb.CdbSubscriptionFlagType CDB_SUB_FLAG_HA_SYNC;
```

This bit is set when the cause of the subscription notification is
 initial synchronization of a HA secondary from CDB on the primary.

<a id="s-CDB_SUB_FLAG_IS_LAST"></a>
### CDB_SUB_FLAG_IS_LAST

```java
public static final com.tailf.cdb.CdbSubscriptionFlagType CDB_SUB_FLAG_IS_LAST;
```

This bit is set when this notification is the last of
 its type  for this subscription socket.

<a id="s-CDB_SUB_FLAG_REVERT"></a>
### CDB_SUB_FLAG_REVERT

```java
public static final com.tailf.cdb.CdbSubscriptionFlagType CDB_SUB_FLAG_REVERT;
```

If a confirming commit is aborted it will look to the CDB
 subscribe as if a transaction happened that is the reverse of
 what the  original transaction was. This bit will be set when
 such a transaction is the cause of the notification. Note that for
 a two-phase subscriber both a prepare and a commit notification
 is delivered. However it is not possible to reply by calling
 [`CdbSubscription`](CdbSubscription.md#s-CdbSubscription) for
 the prepare notification in this case,
 instead the subscriber will have to take appropriate backup action
 if it needs to abort (for example: raise an alarm, restart,
 or even reboot the system).

<a id="s-CDB_SUB_FLAG_TRIGGER"></a>
### CDB_SUB_FLAG_TRIGGER

```java
public static final com.tailf.cdb.CdbSubscriptionFlagType CDB_SUB_FLAG_TRIGGER;
```

This bit is set when the cause of the subscription notification is
 that someone called [`Cdb`](Cdb.md#s-Cdb).


## Methods

<a id="s-enumSetOf"></a>
### enumSetOf(int)

```java
public static java.util.EnumSet<com.tailf.cdb.CdbSubscriptionFlagType> enumSetOf(int i)
```

Types: [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#s-CdbSubscriptionFlagType)

**Parameters**

- `int i`

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

<a id="s-valueOf"></a>
### valueOf(int)

```java
public static com.tailf.cdb.CdbSubscriptionFlagType valueOf(int i)
```

Types: [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#s-CdbSubscriptionFlagType)

**Parameters**

- `int i`

<a id="s-valueOf-1"></a>
### valueOf(String)

```java
public static com.tailf.cdb.CdbSubscriptionFlagType valueOf(String name)
```

Types: [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#s-CdbSubscriptionFlagType)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.cdb.CdbSubscriptionFlagType[] values()
```

Types: [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#s-CdbSubscriptionFlagType)
