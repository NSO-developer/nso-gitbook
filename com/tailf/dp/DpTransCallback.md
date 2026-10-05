<a id="s-DpTransCallback"></a>
# DpTransCallback

```java
public interface com.tailf.dp.DpTransCallback
```

This interface is used for the user transaction callbacks.

 In  order to orchestrate transactions with multiple sources of data,
 ConfD/NCS implements  a  two-phase  commit  protocol  towards  all  data
 sources that participate in a transaction.

 Each  NETCONF  operation  will  be  an individual transaction.
 These transactions are  typically  very  short  lived.  Transactions
 originating  from  the CLI or the Web UI have longer life. The
 transaction can be viewed as a conceptual state  machine  where  the
 different  phases  of  the  transaction are different states and the
 invocations of the callback functions  are  state  transitions.  The
 following ASCII art depicts the state machine.



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




 Example: Callback class MyTransCb



```
  * public class MyTransCb {

   TransCallback(callType=TransCBType.INIT)
     public void init(DpTrans trans) throws DpCallbackException {
       trace(init(): userinfo=  + trans.getUserInfo());
     }

   TransCallback(callType=TransCBType.FINISH)
     public void finish(DpTrans trans) throws DpCallbackException {
       trace(finish());
     }
  }
  // And so on ...
```

**See also:** [`Dp#registerAnnotatedCallbacks(Object)`](Dp.md#s-registerAnnotatedCallbacks)

## Members

**Fields**:

- [M_ABORT](#s-M_ABORT)
- [M_ALL](#s-M_ALL)
- [M_COMMIT](#s-M_COMMIT)
- [M_FINISH](#s-M_FINISH)
- [M_INIT](#s-M_INIT)
- [M_PREPARE](#s-M_PREPARE)
- [M_TRANS_LOCK](#s-M_TRANS_LOCK)
- [M_TRANS_UNLOCK](#s-M_TRANS_UNLOCK)
- [M_WRITE_START](#s-M_WRITE_START)

**Methods**:

- [abort(DpTrans)](#s-abort)
- [commit(DpTrans)](#s-commit)
- [finish(DpTrans)](#s-finish)
- [init(DpTrans)](#s-init)
- [mask()](#s-mask)
- [prepare(DpTrans)](#s-prepare)
- [transLock(DpTrans)](#s-transLock)
- [transUnlock(DpTrans)](#s-transUnlock)
- [writeStart(DpTrans)](#s-writeStart)

## Fields

<a id="s-M_ABORT"></a>
### M_ABORT

```java
public static final int M_ABORT = 32;
```

Bit flag for the [`DpTrans`](DpTrans.md#s-DpTrans) method.

<a id="s-M_ALL"></a>
### M_ALL

```java
public static final int M_ALL = 255;
```

<a id="s-M_COMMIT"></a>
### M_COMMIT

```java
public static final int M_COMMIT = 64;
```

Bit flag for the [`DpTrans`](DpTrans.md#s-DpTrans) method.

<a id="s-M_FINISH"></a>
### M_FINISH

```java
public static final int M_FINISH = 128;
```

Bit flag for the [`DpTrans`](DpTrans.md#s-DpTrans) method.

<a id="s-M_INIT"></a>
### M_INIT

```java
public static final int M_INIT = 1;
```

Bit flag for the [`DpTrans`](DpTrans.md#s-DpTrans) method.

<a id="s-M_PREPARE"></a>
### M_PREPARE

```java
public static final int M_PREPARE = 16;
```

Bit flag for the [`DpTrans`](DpTrans.md#s-DpTrans) method.

<a id="s-M_TRANS_LOCK"></a>
### M_TRANS_LOCK

```java
public static final int M_TRANS_LOCK = 2;
```

Bit flag for the [`DpTrans`](DpTrans.md#s-DpTrans) method.

<a id="s-M_TRANS_UNLOCK"></a>
### M_TRANS_UNLOCK

```java
public static final int M_TRANS_UNLOCK = 4;
```

Bit flag for the [`DpTrans`](DpTrans.md#s-DpTrans) method.

<a id="s-M_WRITE_START"></a>
### M_WRITE_START

```java
public static final int M_WRITE_START = 8;
```

Bit flag for the [`DpTrans`](DpTrans.md#s-DpTrans) method.


## Methods

<a id="s-abort"></a>
### abort(DpTrans)

```java
public abstract void abort(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#s-DpTrans), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

This  callback  is  responsible  for
 undoing  whatever  was  done in the prepare() phase.

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction

**Throws**

- `DpCallbackException` - Callback method failed.

<a id="s-commit"></a>
### commit(DpTrans)

```java
public abstract void commit(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#s-DpTrans), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

This  callback  is  responsible  for
 undoing  whatever  was  done in the prepare() phase.

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction

**Throws**

- `DpCallbackException` - Callback method failed.

<a id="s-finish"></a>
### finish(DpTrans)

```java
public abstract void finish(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#s-DpTrans), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

This  callback  is  responsible  for
 releasing  resources  allocated in the init() phase.

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction

**Throws**

- `DpCallbackException` - Callback method failed.

<a id="s-init"></a>
### init(DpTrans)

```java
public abstract void init(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#s-DpTrans), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

The  callback must indicate which WORKER_SOCKET
 should be used for future communications  in  this  transaction.
 This  is  the  mechanism which is used by Conf to distribute
 work among multiple worker threads in the database  application.

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction

**Throws**

- `DpCallbackException` - Callback method failed.

<a id="s-mask"></a>
### mask()

```java
public abstract int mask()
```

Mask of flags for each method that is supported by this callback:


- `#M_INIT`
   - `#M_TRANS_LOCK`
     - `#M_TRANS_UNLOCK`
       - `#M_WRITE_START`
         - `#M_PREPARE`
           - `#M_ABORT`
             - `#M_COMMIT`
               - `#M_FINISH`

<a id="s-prepare"></a>
### prepare(DpTrans)

```java
public abstract void prepare(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#s-DpTrans), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

If we have multiple sources of data  it  is  highly  recommended
 that the callback is implemented.  The callback is called at the
 end of the transaction, when all read and write  operations  for
 the  transaction  have been performed and the transaction should
 prepare to commit.

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction

**Throws**

- `DpCallbackException` - Callback method failed.

<a id="s-transLock"></a>
### transLock(DpTrans)

```java
public abstract void transLock(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#s-DpTrans), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

This callback is invoked when the validation phase of the transaction
 starts.  If the underlying database supports real transactions,
 it is usually appropriate to start such a native transaction here.


 The transaction enters VALIDATE state, where the system will  perform
 a series of read() operations.

 The trans lock is set until either transUnlock() or finish() is
 called. the system ensures that a  transLock  is  set  on  a  single
 transaction only.

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction

**Throws**

- `DpCallbackException` - Callback method failed.

<a id="s-transUnlock"></a>
### transUnlock(DpTrans)

```java
public abstract void transUnlock(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#s-DpTrans), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

This  callback  is called when the validation of the transaction
 failed, or the validation is triggered explicitly (i.e. not part
 of  a  user  can enter invalid data. Transactions that originate
 from NETCONF will never trigger this callback.  If the  underlying
 database supports real transactions and they are used, the
 transaction should be aborted here.

 The transaction re-enters READ state.

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction

**Throws**

- `DpCallbackException` - Callback method failed.

<a id="s-writeStart"></a>
### writeStart(DpTrans)

```java
public abstract void writeStart(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#s-DpTrans), [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

This callback is invoked when the validation succeeded  and  the
 write  phase of the transaction starts.  If the underlying database
 supports real transactions, it is  usually  appropriate  to
 start such a native transaction here.

 The  transaction  enters  the WRITE state. No more read() operations
 will be performed by the system.

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction

**Throws**

- `DpCallbackException` - Callback method failed.
