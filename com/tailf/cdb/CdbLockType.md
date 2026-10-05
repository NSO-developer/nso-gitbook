<a id="s-CdbLockType"></a>
# CdbLockType

```java
public enum com.tailf.cdb.CdbLockType
```

Types: [CdbLockType](CdbLockType.md#s-CdbLockType)

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

**Related classes**

- [CdbLockType](CdbLockType.md#s-CdbLockType)

## Members

**Enum Constants**:

- [LOCK_PARTIAL](#s-LOCK_PARTIAL)
- [LOCK_REQUEST](#s-LOCK_REQUEST)
- [LOCK_SESSION](#s-LOCK_SESSION)
- [LOCK_WAIT](#s-LOCK_WAIT)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-LOCK_PARTIAL"></a>
### LOCK_PARTIAL

```java
public static final com.tailf.cdb.CdbLockType LOCK_PARTIAL;
```

Controls if locks of type LOCK_REQUEST should be partial
 i.e. only lock subtree under the point of access

<a id="s-LOCK_REQUEST"></a>
### LOCK_REQUEST

```java
public static final com.tailf.cdb.CdbLockType LOCK_REQUEST;
```

Obtain read lock for each read request

<a id="s-LOCK_SESSION"></a>
### LOCK_SESSION

```java
public static final com.tailf.cdb.CdbLockType LOCK_SESSION;
```

Obtain read lock for the complete session

<a id="s-LOCK_WAIT"></a>
### LOCK_WAIT

```java
public static final com.tailf.cdb.CdbLockType LOCK_WAIT;
```

Controls in combination with one of LOCK_SESSION or LOCK_REQUEST if the
 call should wait instead of fail if lock is not obtained. Combined using
 EnumSet


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

<a id="s-valueOf"></a>
### valueOf(String)

```java
public static com.tailf.cdb.CdbLockType valueOf(String name)
```

Types: [CdbLockType](CdbLockType.md#s-CdbLockType)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.cdb.CdbLockType[] values()
```

Types: [CdbLockType](CdbLockType.md#s-CdbLockType)
