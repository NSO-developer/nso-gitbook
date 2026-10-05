# CdbLockType <a href="#cdblocktype-1d165621c0a3" id="cdblocktype-1d165621c0a3"></a>

```java
public enum com.tailf.cdb.CdbLockType
```

Types: [CdbLockType](CdbLockType.md#cdblocktype-1d165621c0a3)

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

- [LOCK\_PARTIAL](#lock_partial-018e4e600871)
- [LOCK\_REQUEST](#lock_request-7644a883c14e)
- [LOCK\_SESSION](#lock_session-306b0dde39ea)
- [LOCK\_WAIT](#lock_wait-1b85e04cb86b)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### LOCK_PARTIAL <a href="#lock_partial-018e4e600871" id="lock_partial-018e4e600871"></a>

```java
public static final com.tailf.cdb.CdbLockType LOCK_PARTIAL;
```

Controls if locks of type LOCK_REQUEST should be partial
 i.e. only lock subtree under the point of access

### LOCK_REQUEST <a href="#lock_request-7644a883c14e" id="lock_request-7644a883c14e"></a>

```java
public static final com.tailf.cdb.CdbLockType LOCK_REQUEST;
```

Obtain read lock for each read request

### LOCK_SESSION <a href="#lock_session-306b0dde39ea" id="lock_session-306b0dde39ea"></a>

```java
public static final com.tailf.cdb.CdbLockType LOCK_SESSION;
```

Obtain read lock for the complete session

### LOCK_WAIT <a href="#lock_wait-1b85e04cb86b" id="lock_wait-1b85e04cb86b"></a>

```java
public static final com.tailf.cdb.CdbLockType LOCK_WAIT;
```

Controls in combination with one of LOCK_SESSION or LOCK_REQUEST if the
 call should wait instead of fail if lock is not obtained. Combined using
 EnumSet


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.cdb.CdbLockType valueOf(String name)
```

Types: [CdbLockType](CdbLockType.md#cdblocktype-1d165621c0a3)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.cdb.CdbLockType[] values()
```

Types: [CdbLockType](CdbLockType.md#cdblocktype-1d165621c0a3)
