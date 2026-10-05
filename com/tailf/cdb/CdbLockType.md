<a id="cls-CdbLockType"></a>
# CdbLockType

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

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-LOCK_PARTIAL"></a>
### LOCK_PARTIAL

```java
public static final com.tailf.cdb.CdbLockType LOCK_PARTIAL;
```

Controls if locks of type LOCK_REQUEST should be partial
 i.e. only lock subtree under the point of access

<a id="m-LOCK_REQUEST"></a>
### LOCK_REQUEST

```java
public static final com.tailf.cdb.CdbLockType LOCK_REQUEST;
```

Obtain read lock for each read request

<a id="m-LOCK_SESSION"></a>
### LOCK_SESSION

```java
public static final com.tailf.cdb.CdbLockType LOCK_SESSION;
```

Obtain read lock for the complete session

<a id="m-LOCK_WAIT"></a>
### LOCK_WAIT

```java
public static final com.tailf.cdb.CdbLockType LOCK_WAIT;
```

Controls in combination with one of LOCK_SESSION or LOCK_REQUEST if the
 call should wait instead of fail if lock is not obtained. Combined using
 EnumSet


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.cdb.CdbLockType valueOf(String name)
```

Types: [CdbLockType](CdbLockType.md#cls-CdbLockType)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.cdb.CdbLockType[] values()
```

Types: [CdbLockType](CdbLockType.md#cls-CdbLockType)
