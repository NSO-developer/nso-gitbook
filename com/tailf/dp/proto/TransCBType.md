<a id="s-TransCBType"></a>
# TransCBType

```java
public enum com.tailf.dp.proto.TransCBType
```

Types: [TransCBType](TransCBType.md#s-TransCBType)

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

**Related classes**

- [TransCBType](TransCBType.md#s-TransCBType)

**Since:** 3.2.0

## Members

**Enum Constants**:

- [ABORT](#s-ABORT)
- [COMMIT](#s-COMMIT)
- [FINISH](#s-FINISH)
- [INIT](#s-INIT)
- [PREPARE](#s-PREPARE)
- [TRANS_LOCK](#s-TRANS_LOCK)
- [TRANS_UNLOCK](#s-TRANS_UNLOCK)
- [WRITE_START](#s-WRITE_START)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-ABORT"></a>
### ABORT

```java
public static final com.tailf.dp.proto.TransCBType ABORT;
```

Bit flag for the [`DpTransCallback`](../DpTransCallback.md#s-DpTransCallback)
 method.

<a id="s-COMMIT"></a>
### COMMIT

```java
public static final com.tailf.dp.proto.TransCBType COMMIT;
```

Bit flag for the [`DpTransCallback`](../DpTransCallback.md#s-DpTransCallback)
 method.

<a id="s-FINISH"></a>
### FINISH

```java
public static final com.tailf.dp.proto.TransCBType FINISH;
```

Bit flag for the [`DpTransCallback`](../DpTransCallback.md#s-DpTransCallback)
 method.

<a id="s-INIT"></a>
### INIT

```java
public static final com.tailf.dp.proto.TransCBType INIT;
```

Bit flag for the [`DpTransCallback`](../DpTransCallback.md#s-DpTransCallback)
 method.

<a id="s-PREPARE"></a>
### PREPARE

```java
public static final com.tailf.dp.proto.TransCBType PREPARE;
```

Bit flag for the [`DpTransCallback`](../DpTransCallback.md#s-DpTransCallback)
 method.

<a id="s-TRANS_LOCK"></a>
### TRANS_LOCK

```java
public static final com.tailf.dp.proto.TransCBType TRANS_LOCK;
```

Bit flag for the [`DpTransCallback`](../DpTransCallback.md#s-DpTransCallback)
 method.

<a id="s-TRANS_UNLOCK"></a>
### TRANS_UNLOCK

```java
public static final com.tailf.dp.proto.TransCBType TRANS_UNLOCK;
```

Bit flag for the
 [`DpTransCallback`](../DpTransCallback.md#s-DpTransCallback) method.

<a id="s-WRITE_START"></a>
### WRITE_START

```java
public static final com.tailf.dp.proto.TransCBType WRITE_START;
```

Bit flag for the [`DpTransCallback`](../DpTransCallback.md#s-DpTransCallback)
 method.


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

get integer value for enum

**Returns:** int value

<a id="s-valueOf"></a>
### valueOf(String)

```java
public static com.tailf.dp.proto.TransCBType valueOf(String name)
```

Types: [TransCBType](TransCBType.md#s-TransCBType)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.dp.proto.TransCBType[] values()
```

Types: [TransCBType](TransCBType.md#s-TransCBType)
