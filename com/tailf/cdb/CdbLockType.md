# CdbLockType <a href="#cls-CdbLockType" id="cls-CdbLockType"></a>

```java
public enum com.tailf.cdb.CdbLockType
```

Types: [CdbLockType](CdbLockType.md#cls-CdbLockType)

DB lock type flag for *Cdb Sessions* which controls locking of
 sessions.


 `LOCK_SESSION` or `LOCK REQUESTS`
 are mutually exclusive and  controls if the lock should be held for the
 complete session or for each request respectively.



 `LOCK_WAIT` can be combined with either
 `LOCK_SESSION` or `LOCK_REQUEST `
 to control if lock requests should block and wait for lock. Default
 behavior is to fail if lock cannot be obtained.



 `LOCK_PARTIAL` can be combined
 with `LOCK_REQUEST` to control the lock to hold only for
 the subtree from the point of access for the request.
 Default behavior is that the complete CDB database is locked.



 Locks are combined using EnumSet
 for example as


```
  EnumSet<CdbLockType> eSet = EnumSet.of(CdbLockType.LOCK_REQUEST,
                                         CdbLockType.LOCK_PARTIAL,
                                         CdbLockType.LOCK_WAIT);
```

## Members

**Enum Constants**:

- [LOCK_PARTIAL](#m-LOCK_PARTIAL)
- [LOCK_REQUEST](#m-LOCK_REQUEST)
- [LOCK_SESSION](#m-LOCK_SESSION)
- [LOCK_WAIT](#m-LOCK_WAIT)

**Methods**:

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### LOCK_PARTIAL <a href="#m-LOCK_PARTIAL" id="m-LOCK_PARTIAL"></a>

```java
public static final com.tailf.cdb.CdbLockType LOCK_PARTIAL;
```

Controls if locks of type LOCK_REQUEST should be partial
 i.e. only lock subtree under the point of access

### LOCK_REQUEST <a href="#m-LOCK_REQUEST" id="m-LOCK_REQUEST"></a>

```java
public static final com.tailf.cdb.CdbLockType LOCK_REQUEST;
```

Obtain read lock for each read request

### LOCK_SESSION <a href="#m-LOCK_SESSION" id="m-LOCK_SESSION"></a>

```java
public static final com.tailf.cdb.CdbLockType LOCK_SESSION;
```

Obtain read lock for the complete session

### LOCK_WAIT <a href="#m-LOCK_WAIT" id="m-LOCK_WAIT"></a>

```java
public static final com.tailf.cdb.CdbLockType LOCK_WAIT;
```

Controls in combination with one of LOCK_SESSION or LOCK_REQUEST if the
 call should wait instead of fail if lock is not obtained. Combined using
 EnumSet


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.cdb.CdbLockType valueOf(String name)
```

Types: [CdbLockType](CdbLockType.md#cls-CdbLockType)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.cdb.CdbLockType[] values()
```

Types: [CdbLockType](CdbLockType.md#cls-CdbLockType)
