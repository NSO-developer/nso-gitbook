# TransCBType <a href="#transcbtype-23d0df519739" id="transcbtype-23d0df519739"></a>

```java
public enum com.tailf.dp.proto.TransCBType
```

Enumeration of Trans callback methods


 This enumeration defines the different callbacks that can be registered for a
 transaction. There may be multiple sources of data for the device
 configuration.

 In order to orchestrate transactions with multiple sources of data,

 that participate in a transaction.

 Each northbound NETCONF operation will be an individual transaction. These
 transactions are typically very short lived. Transactions originating from
 the CLI or the Web UI have longer life. The transaction can be viewed as a
 conceptual state machine where the different phases of the transaction are
 different states and the invocations of the callback functions are state
 transitions. The following ASCII art depicts the state machine.



```

                           +-------+
                           | START |
                           +-------+
                               | init()
                               |
                               v
                  read()   +------+          finish()
                  ------>  | READ | --------------------> START
                           +------+
                             ^  |
              trans_unlock() |  | trans_lock()
                             |  v
                  read()  +----------+       finish()
                  ------> | VALIDATE | -----------------> START
                          +----------+
                               | write_start()
                               |
                               v
                  write()  +-------+          finish()
                  -------> | WRITE | -------------------> START
                           +-------+
                               | prepare()
                               |
                               v
                          +----------+   commit()   +-----------+
                          | PREPARED | -----------> | COMMITTED |
                          +----------+              +-----------+
                               | abort()                  |
                               |                          | finish()
                               v                          |
                           +---------+                    v
                           | ABORTED |                  START
                           +---------+
                               | finish()
                               |
                               v
                             START
```




 kind of storages.

 Conf.DB_CANDIDATE If the system has been configured so that the external
 database owns the candidate data share, we will have to execute candidate
 transactions here. Usually the system owns the candidate and in that case the
 external database will never see any DB_CANDIDATE transactions.

 Conf.DB_RUNNING This is a transaction towards the actual running
 configuration of the device. All write operations in a DB_RUNNING transaction
 must be propagated to the individual subsystems that use this configuration
 data.

 Conf.DB_STARTUP If the system has ben configured to support the NETCONF
 startup capability, this is a transaction towards the startup database.

 Which type we have is indicated through the dbName field in the DpTrans
 object.

 A transaction, regardless of whether it originates from the NETCONF agent,
 the CLI or the Web UI, has several distinct phases:

**Since:** 3.2.0

## Members

**Enum Constants**:

- [ABORT](#abort-7ca9e5aa43c8)
- [COMMIT](#commit-14b001a1be17)
- [FINISH](#finish-d07f8d2510ea)
- [INIT](#init-5407b9c86a37)
- [PREPARE](#prepare-751688bc2f01)
- [TRANS\_LOCK](#trans_lock-ca813c8ef589)
- [TRANS\_UNLOCK](#trans_unlock-33c04d445eb8)
- [WRITE\_START](#write_start-c5f19ac27692)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### ABORT <a href="#abort-7ca9e5aa43c8" id="abort-7ca9e5aa43c8"></a>

```java
ABORT(DpProto.MASK_TR_ABORT);
```

Bit flag for the [`DpTransCallback#abort(DpTrans)`](../DpTransCallback.md#abort-be36f552f23c)
 method.

### COMMIT <a href="#commit-14b001a1be17" id="commit-14b001a1be17"></a>

```java
COMMIT(DpProto.MASK_TR_COMMIT);
```

Bit flag for the [`DpTransCallback#commit(DpTrans)`](../DpTransCallback.md#commit-5e7631b9a7e8)
 method.

### FINISH <a href="#finish-d07f8d2510ea" id="finish-d07f8d2510ea"></a>

```java
FINISH(DpProto.MASK_TR_FINISH);
```

Bit flag for the [`DpTransCallback#finish(DpTrans)`](../DpTransCallback.md#finish-1001d416be96)
 method.

### INIT <a href="#init-5407b9c86a37" id="init-5407b9c86a37"></a>

```java
INIT(DpProto.MASK_TR_INIT);
```

Bit flag for the [`DpTransCallback#init(DpTrans)`](../DpTransCallback.md#init-16fe8657859c)
 method.

### PREPARE <a href="#prepare-751688bc2f01" id="prepare-751688bc2f01"></a>

```java
PREPARE(DpProto.MASK_TR_PREPARE);
```

Bit flag for the [`DpTransCallback#prepare(DpTrans)`](../DpTransCallback.md#prepare-ab366f6ce7ea)
 method.

### TRANS_LOCK <a href="#trans_lock-ca813c8ef589" id="trans_lock-ca813c8ef589"></a>

```java
TRANS_LOCK(DpProto.MASK_TR_TRANS_LOCK);
```

Bit flag for the [`DpTransCallback#transLock(DpTrans)`](../DpTransCallback.md#translock-dc59c2c0e5f8)
 method.

### TRANS_UNLOCK <a href="#trans_unlock-33c04d445eb8" id="trans_unlock-33c04d445eb8"></a>

```java
TRANS_UNLOCK(DpProto.MASK_TR_TRANS_UNLOCK);
```

Bit flag for the
 [`DpTransCallback#transUnlock(DpTrans)`](../DpTransCallback.md#transunlock-d0b9be30b219) method.

### WRITE_START <a href="#write_start-c5f19ac27692" id="write_start-c5f19ac27692"></a>

```java
WRITE_START(DpProto.MASK_TR_WRITE_START);
```

Bit flag for the [`DpTransCallback#writeStart(DpTrans)`](../DpTransCallback.md#writestart-5fee67274be5)
 method.


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

get integer value for enum

**Returns:** int value

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.dp.proto.TransCBType valueOf(String name)
```

Types: [TransCBType](TransCBType.md#transcbtype-23d0df519739)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.dp.proto.TransCBType[] values()
```

Types: [TransCBType](TransCBType.md#transcbtype-23d0df519739)
