# CdbSubscriptionFlagType <a href="#cdbsubscriptionflagtype-34d1a6785826" id="cdbsubscriptionflagtype-34d1a6785826"></a>

```java
public enum com.tailf.cdb.CdbSubscriptionFlagType
```

Types: [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#cdbsubscriptionflagtype-34d1a6785826)

Distinguish the different types of subscription notifications

## Members

**Enum Constants**:

- [CDB_SUB_FLAG_HA_IS_SECONDARY](#cdb_sub_flag_ha_is_secondary-b33a98c07944)
- [CDB_SUB_FLAG_HA_SYNC](#cdb_sub_flag_ha_sync-316e067b9757)
- [CDB_SUB_FLAG_IS_LAST](#cdb_sub_flag_is_last-2455f6196fbe)
- [CDB_SUB_FLAG_REVERT](#cdb_sub_flag_revert-a60d9caf0742)
- [CDB_SUB_FLAG_TRIGGER](#cdb_sub_flag_trigger-758be0880da5)

**Methods**:

- [enumSetOf(int)](#enumsetof-af9f1a9f53f8)
- [getValue()](#getvalue-d93864668c40)
- [valueOf(int)](#valueof-c0d46d25fc67)
- [valueOf(String)](#valueof-ac61b3547613)
- [values()](#values-406dfe3ca270)

## Enum Constants

### CDB_SUB_FLAG_HA_IS_SECONDARY <a href="#cdb_sub_flag_ha_is_secondary-b33a98c07944" id="cdb_sub_flag_ha_is_secondary-b33a98c07944"></a>

```java
public static final com.tailf.cdb.CdbSubscriptionFlagType CDB_SUB_FLAG_HA_IS_SECONDARY;
```

This bit is set when the system is in HA secondary mode.

### CDB_SUB_FLAG_HA_SYNC <a href="#cdb_sub_flag_ha_sync-316e067b9757" id="cdb_sub_flag_ha_sync-316e067b9757"></a>

```java
public static final com.tailf.cdb.CdbSubscriptionFlagType CDB_SUB_FLAG_HA_SYNC;
```

This bit is set when the cause of the subscription notification is
 initial synchronization of a HA secondary from CDB on the primary.

### CDB_SUB_FLAG_IS_LAST <a href="#cdb_sub_flag_is_last-2455f6196fbe" id="cdb_sub_flag_is_last-2455f6196fbe"></a>

```java
public static final com.tailf.cdb.CdbSubscriptionFlagType CDB_SUB_FLAG_IS_LAST;
```

This bit is set when this notification is the last of
 its type  for this subscription socket.

### CDB_SUB_FLAG_REVERT <a href="#cdb_sub_flag_revert-a60d9caf0742" id="cdb_sub_flag_revert-a60d9caf0742"></a>

```java
public static final com.tailf.cdb.CdbSubscriptionFlagType CDB_SUB_FLAG_REVERT;
```

If a confirming commit is aborted it will look to the CDB
 subscribe as if a transaction happened that is the reverse of
 what the  original transaction was. This bit will be set when
 such a transaction is the cause of the notification. Note that for
 a two-phase subscriber both a prepare and a commit notification
 is delivered. However it is not possible to reply by calling
 [`CdbSubscription#abortTransaction(CdbExtendedException)`](CdbSubscription.md#aborttransaction-c0694458d9be) for
 the prepare notification in this case,
 instead the subscriber will have to take appropriate backup action
 if it needs to abort (for example: raise an alarm, restart,
 or even reboot the system).

### CDB_SUB_FLAG_TRIGGER <a href="#cdb_sub_flag_trigger-758be0880da5" id="cdb_sub_flag_trigger-758be0880da5"></a>

```java
public static final com.tailf.cdb.CdbSubscriptionFlagType CDB_SUB_FLAG_TRIGGER;
```

This bit is set when the cause of the subscription notification is
 that someone called [`Cdb#triggerSubscriptions(int[])`](Cdb.md#triggersubscriptions-b7a5ff565df7).


## Methods

### enumSetOf(int) <a href="#enumsetof-af9f1a9f53f8" id="enumsetof-af9f1a9f53f8"></a>

```java
public static java.util.EnumSet<com.tailf.cdb.CdbSubscriptionFlagType> enumSetOf(int i)
```

Types: [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#cdbsubscriptionflagtype-34d1a6785826)

**Parameters**

- `int i`

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(int) <a href="#valueof-c0d46d25fc67" id="valueof-c0d46d25fc67"></a>

```java
public static com.tailf.cdb.CdbSubscriptionFlagType valueOf(int i)
```

Types: [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#cdbsubscriptionflagtype-34d1a6785826)

**Parameters**

- `int i`

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.cdb.CdbSubscriptionFlagType valueOf(String name)
```

Types: [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#cdbsubscriptionflagtype-34d1a6785826)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.cdb.CdbSubscriptionFlagType[] values()
```

Types: [CdbSubscriptionFlagType](CdbSubscriptionFlagType.md#cdbsubscriptionflagtype-34d1a6785826)
