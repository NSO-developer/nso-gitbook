<a id="cls-TransCBType"></a>
# TransCBType

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

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-ABORT"></a>
### ABORT

```java
public static final com.tailf.dp.proto.TransCBType ABORT;
```

Bit flag for the [`DpTransCallback#abort(DpTrans)`](../DpTransCallback.md#m-abort-be36f552f23c)
 method.

<a id="m-COMMIT"></a>
### COMMIT

```java
public static final com.tailf.dp.proto.TransCBType COMMIT;
```

Bit flag for the [`DpTransCallback#commit(DpTrans)`](../DpTransCallback.md#m-commit-5e7631b9a7e8)
 method.

<a id="m-FINISH"></a>
### FINISH

```java
public static final com.tailf.dp.proto.TransCBType FINISH;
```

Bit flag for the [`DpTransCallback#finish(DpTrans)`](../DpTransCallback.md#m-finish-1001d416be96)
 method.

<a id="m-INIT"></a>
### INIT

```java
public static final com.tailf.dp.proto.TransCBType INIT;
```

Bit flag for the [`DpTransCallback#init(DpTrans)`](../DpTransCallback.md#m-init-16fe8657859c)
 method.

<a id="m-PREPARE"></a>
### PREPARE

```java
public static final com.tailf.dp.proto.TransCBType PREPARE;
```

Bit flag for the [`DpTransCallback#prepare(DpTrans)`](../DpTransCallback.md#m-prepare-ab366f6ce7ea)
 method.

<a id="m-TRANS_LOCK"></a>
### TRANS_LOCK

```java
public static final com.tailf.dp.proto.TransCBType TRANS_LOCK;
```

Bit flag for the [`DpTransCallback#transLock(DpTrans)`](../DpTransCallback.md#m-translock-dc59c2c0e5f8)
 method.

<a id="m-TRANS_UNLOCK"></a>
### TRANS_UNLOCK

```java
public static final com.tailf.dp.proto.TransCBType TRANS_UNLOCK;
```

Bit flag for the
 [`DpTransCallback#transUnlock(DpTrans)`](../DpTransCallback.md#m-transunlock-d0b9be30b219) method.

<a id="m-WRITE_START"></a>
### WRITE_START

```java
public static final com.tailf.dp.proto.TransCBType WRITE_START;
```

Bit flag for the [`DpTransCallback#writeStart(DpTrans)`](../DpTransCallback.md#m-writestart-5fee67274be5)
 method.


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

get integer value for enum

**Returns:** int value

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.dp.proto.TransCBType valueOf(String name)
```

Types: [TransCBType](TransCBType.md#cls-TransCBType)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.dp.proto.TransCBType[] values()
```

Types: [TransCBType](TransCBType.md#cls-TransCBType)
