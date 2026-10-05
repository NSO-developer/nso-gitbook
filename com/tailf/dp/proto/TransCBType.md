# TransCBType <a href="#cls-TransCBType" id="cls-TransCBType"></a>

```java
public enum com.tailf.dp.proto.TransCBType
```

Types: [TransCBType](TransCBType.md#cls-TransCBType)

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

- [ABORT](#m-ABORT)
- [COMMIT](#m-COMMIT)
- [FINISH](#m-FINISH)
- [INIT](#m-INIT)
- [PREPARE](#m-PREPARE)
- [TRANS_LOCK](#m-TRANS_LOCK)
- [TRANS_UNLOCK](#m-TRANS_UNLOCK)
- [WRITE_START](#m-WRITE_START)

**Methods**:

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### ABORT <a href="#m-ABORT" id="m-ABORT"></a>

```java
public static final com.tailf.dp.proto.TransCBType ABORT;
```

Bit flag for the [`DpTransCallback#abort(DpTrans)`](../DpTransCallback.md#m-abort-be36f552f23c)
 method.

### COMMIT <a href="#m-COMMIT" id="m-COMMIT"></a>

```java
public static final com.tailf.dp.proto.TransCBType COMMIT;
```

Bit flag for the [`DpTransCallback#commit(DpTrans)`](../DpTransCallback.md#m-commit-5e7631b9a7e8)
 method.

### FINISH <a href="#m-FINISH" id="m-FINISH"></a>

```java
public static final com.tailf.dp.proto.TransCBType FINISH;
```

Bit flag for the [`DpTransCallback#finish(DpTrans)`](../DpTransCallback.md#m-finish-1001d416be96)
 method.

### INIT <a href="#m-INIT" id="m-INIT"></a>

```java
public static final com.tailf.dp.proto.TransCBType INIT;
```

Bit flag for the [`DpTransCallback#init(DpTrans)`](../DpTransCallback.md#m-init-16fe8657859c)
 method.

### PREPARE <a href="#m-PREPARE" id="m-PREPARE"></a>

```java
public static final com.tailf.dp.proto.TransCBType PREPARE;
```

Bit flag for the [`DpTransCallback#prepare(DpTrans)`](../DpTransCallback.md#m-prepare-ab366f6ce7ea)
 method.

### TRANS_LOCK <a href="#m-TRANS_LOCK" id="m-TRANS_LOCK"></a>

```java
public static final com.tailf.dp.proto.TransCBType TRANS_LOCK;
```

Bit flag for the [`DpTransCallback#transLock(DpTrans)`](../DpTransCallback.md#m-transLock-dc59c2c0e5f8)
 method.

### TRANS_UNLOCK <a href="#m-TRANS_UNLOCK" id="m-TRANS_UNLOCK"></a>

```java
public static final com.tailf.dp.proto.TransCBType TRANS_UNLOCK;
```

Bit flag for the
 [`DpTransCallback#transUnlock(DpTrans)`](../DpTransCallback.md#m-transUnlock-d0b9be30b219) method.

### WRITE_START <a href="#m-WRITE_START" id="m-WRITE_START"></a>

```java
public static final com.tailf.dp.proto.TransCBType WRITE_START;
```

Bit flag for the [`DpTransCallback#writeStart(DpTrans)`](../DpTransCallback.md#m-writeStart-5fee67274be5)
 method.


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

get integer value for enum

**Returns:** int value

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.dp.proto.TransCBType valueOf(String name)
```

Types: [TransCBType](TransCBType.md#cls-TransCBType)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.dp.proto.TransCBType[] values()
```

Types: [TransCBType](TransCBType.md#cls-TransCBType)
