<a id="cls-CdbSubscriptionFlagType"></a>
# CdbSubscriptionFlagType

```java
public enum com.tailf.cdb.CdbSubscriptionFlagType
```

Types: [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#cls-CdbSubscriptionFlagType)

Distinguish the different types of subscription notifications

## Members

**Enum Constants**:

- [CDB_SUB_FLAG_HA_IS_SECONDARY](#m-CDB_SUB_FLAG_HA_IS_SECONDARY)
- [CDB_SUB_FLAG_HA_SYNC](#m-CDB_SUB_FLAG_HA_SYNC)
- [CDB_SUB_FLAG_IS_LAST](#m-CDB_SUB_FLAG_IS_LAST)
- [CDB_SUB_FLAG_REVERT](#m-CDB_SUB_FLAG_REVERT)
- [CDB_SUB_FLAG_TRIGGER](#m-CDB_SUB_FLAG_TRIGGER)

**Methods**:

- [enumSetOf(int)](#m-enumsetof-af9f1a9f53f8)
- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(int)](#m-valueof-c0d46d25fc67)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-CDB_SUB_FLAG_HA_IS_SECONDARY"></a>
### CDB_SUB_FLAG_HA_IS_SECONDARY

```java
public static final com.tailf.cdb.CdbSubscriptionFlagType CDB_SUB_FLAG_HA_IS_SECONDARY;
```

This bit is set when the system is in HA secondary mode.

<a id="m-CDB_SUB_FLAG_HA_SYNC"></a>
### CDB_SUB_FLAG_HA_SYNC

```java
public static final com.tailf.cdb.CdbSubscriptionFlagType CDB_SUB_FLAG_HA_SYNC;
```

This bit is set when the cause of the subscription notification is
 initial synchronization of a HA secondary from CDB on the primary.

<a id="m-CDB_SUB_FLAG_IS_LAST"></a>
### CDB_SUB_FLAG_IS_LAST

```java
public static final com.tailf.cdb.CdbSubscriptionFlagType CDB_SUB_FLAG_IS_LAST;
```

This bit is set when this notification is the last of
 its type  for this subscription socket.

<a id="m-CDB_SUB_FLAG_REVERT"></a>
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
 [`CdbSubscription#abortTransaction(CdbExtendedException)`](CdbSubscription.md#m-aborttransaction-c0694458d9be) for
 the prepare notification in this case,
 instead the subscriber will have to take appropriate backup action
 if it needs to abort (for example: raise an alarm, restart,
 or even reboot the system).

<a id="m-CDB_SUB_FLAG_TRIGGER"></a>
### CDB_SUB_FLAG_TRIGGER

```java
public static final com.tailf.cdb.CdbSubscriptionFlagType CDB_SUB_FLAG_TRIGGER;
```

This bit is set when the cause of the subscription notification is
 that someone called [`Cdb#triggerSubscriptions(int[])`](Cdb.md#m-triggersubscriptions-b7a5ff565df7).


## Methods

<a id="m-enumsetof-af9f1a9f53f8"></a>
### enumSetOf(int)

```java
public static java.util.EnumSet<com.tailf.cdb.CdbSubscriptionFlagType> enumSetOf(int i)
```

Types: [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#cls-CdbSubscriptionFlagType)

**Parameters**

- `int i`

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

<a id="m-valueof-c0d46d25fc67"></a>
### valueOf(int)

```java
public static com.tailf.cdb.CdbSubscriptionFlagType valueOf(int i)
```

Types: [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#cls-CdbSubscriptionFlagType)

**Parameters**

- `int i`

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.cdb.CdbSubscriptionFlagType valueOf(String name)
```

Types: [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#cls-CdbSubscriptionFlagType)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.cdb.CdbSubscriptionFlagType[] values()
```

Types: [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#cls-CdbSubscriptionFlagType)
