# DpTransCallback <a href="#dptranscallback-20e03cd7123b" id="dptranscallback-20e03cd7123b"></a>

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

**See also:** [`Dp#registerAnnotatedCallbacks(Object)`](Dp.md#registerannotatedcallbacks-ffaebadbfc42)

## Members

**Fields**:

- [M_ABORT](#m_abort-7b4607723e90)
- [M_ALL](#m_all-e3844e41e8ee)
- [M_COMMIT](#m_commit-a638c60fa850)
- [M_FINISH](#m_finish-f4213d20ec3b)
- [M_INIT](#m_init-13cacf7e79fd)
- [M_PREPARE](#m_prepare-151ace1a1f08)
- [M_TRANS_LOCK](#m_trans_lock-d3e5dbe7a854)
- [M_TRANS_UNLOCK](#m_trans_unlock-3304819d44bd)
- [M_WRITE_START](#m_write_start-dde742bd8183)

**Methods**:

- [abort(DpTrans)](#abort-be36f552f23c)
- [commit(DpTrans)](#commit-5e7631b9a7e8)
- [finish(DpTrans)](#finish-1001d416be96)
- [init(DpTrans)](#init-16fe8657859c)
- [mask()](#mask-24c2fa29c6af)
- [prepare(DpTrans)](#prepare-ab366f6ce7ea)
- [transLock(DpTrans)](#translock-dc59c2c0e5f8)
- [transUnlock(DpTrans)](#transunlock-d0b9be30b219)
- [writeStart(DpTrans)](#writestart-5fee67274be5)

## Fields

### M_ABORT <a href="#m_abort-7b4607723e90" id="m_abort-7b4607723e90"></a>

```java
public static final int M_ABORT = 32;
```

Bit flag for the `abort(DpTrans)` method.

### M_ALL <a href="#m_all-e3844e41e8ee" id="m_all-e3844e41e8ee"></a>

```java
public static final int M_ALL = 255;
```

### M_COMMIT <a href="#m_commit-a638c60fa850" id="m_commit-a638c60fa850"></a>

```java
public static final int M_COMMIT = 64;
```

Bit flag for the `commit(DpTrans)` method.

### M_FINISH <a href="#m_finish-f4213d20ec3b" id="m_finish-f4213d20ec3b"></a>

```java
public static final int M_FINISH = 128;
```

Bit flag for the `finish(DpTrans)` method.

### M_INIT <a href="#m_init-13cacf7e79fd" id="m_init-13cacf7e79fd"></a>

```java
public static final int M_INIT = 1;
```

Bit flag for the `init(DpTrans)` method.

### M_PREPARE <a href="#m_prepare-151ace1a1f08" id="m_prepare-151ace1a1f08"></a>

```java
public static final int M_PREPARE = 16;
```

Bit flag for the `prepare(DpTrans)` method.

### M_TRANS_LOCK <a href="#m_trans_lock-d3e5dbe7a854" id="m_trans_lock-d3e5dbe7a854"></a>

```java
public static final int M_TRANS_LOCK = 2;
```

Bit flag for the `transLock(DpTrans)` method.

### M_TRANS_UNLOCK <a href="#m_trans_unlock-3304819d44bd" id="m_trans_unlock-3304819d44bd"></a>

```java
public static final int M_TRANS_UNLOCK = 4;
```

Bit flag for the `transUnlock(DpTrans)` method.

### M_WRITE_START <a href="#m_write_start-dde742bd8183" id="m_write_start-dde742bd8183"></a>

```java
public static final int M_WRITE_START = 8;
```

Bit flag for the `writeStart(DpTrans)` method.


## Methods

### abort(DpTrans) <a href="#abort-be36f552f23c" id="abort-be36f552f23c"></a>

```java
public abstract void abort(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#dptrans-bf19458d92ec), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

This  callback  is  responsible  for
 undoing  whatever  was  done in the prepare() phase.

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction

**Throws**

- `DpCallbackException` - Callback method failed.

### commit(DpTrans) <a href="#commit-5e7631b9a7e8" id="commit-5e7631b9a7e8"></a>

```java
public abstract void commit(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#dptrans-bf19458d92ec), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

This  callback  is  responsible  for
 undoing  whatever  was  done in the prepare() phase.

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction

**Throws**

- `DpCallbackException` - Callback method failed.

### finish(DpTrans) <a href="#finish-1001d416be96" id="finish-1001d416be96"></a>

```java
public abstract void finish(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#dptrans-bf19458d92ec), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

This  callback  is  responsible  for
 releasing  resources  allocated in the init() phase.

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction

**Throws**

- `DpCallbackException` - Callback method failed.

### init(DpTrans) <a href="#init-16fe8657859c" id="init-16fe8657859c"></a>

```java
public abstract void init(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#dptrans-bf19458d92ec), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

The  callback must indicate which WORKER_SOCKET
 should be used for future communications  in  this  transaction.
 This  is  the  mechanism which is used by Conf to distribute
 work among multiple worker threads in the database  application.

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction

**Throws**

- `DpCallbackException` - Callback method failed.

### mask() <a href="#mask-24c2fa29c6af" id="mask-24c2fa29c6af"></a>

```java
public abstract int mask()
```

Mask of flags for each method that is supported by this callback:


- [`M_INIT`](DpTransCallback.md#m_init-13cacf7e79fd)
   - [`M_TRANS_LOCK`](DpTransCallback.md#m_trans_lock-d3e5dbe7a854)
     - [`M_TRANS_UNLOCK`](DpTransCallback.md#m_trans_unlock-3304819d44bd)
       - [`M_WRITE_START`](DpTransCallback.md#m_write_start-dde742bd8183)
         - [`M_PREPARE`](DpTransCallback.md#m_prepare-151ace1a1f08)
           - [`M_ABORT`](DpTransCallback.md#m_abort-7b4607723e90)
             - [`M_COMMIT`](DpTransCallback.md#m_commit-a638c60fa850)
               - [`M_FINISH`](DpTransCallback.md#m_finish-f4213d20ec3b)

### prepare(DpTrans) <a href="#prepare-ab366f6ce7ea" id="prepare-ab366f6ce7ea"></a>

```java
public abstract void prepare(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#dptrans-bf19458d92ec), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

If we have multiple sources of data  it  is  highly  recommended
 that the callback is implemented.  The callback is called at the
 end of the transaction, when all read and write  operations  for
 the  transaction  have been performed and the transaction should
 prepare to commit.

**Parameters**

- `com.tailf.dp.DpTrans trans` - Transaction

**Throws**

- `DpCallbackException` - Callback method failed.

### transLock(DpTrans) <a href="#translock-dc59c2c0e5f8" id="translock-dc59c2c0e5f8"></a>

```java
public abstract void transLock(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#dptrans-bf19458d92ec), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

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

### transUnlock(DpTrans) <a href="#transunlock-d0b9be30b219" id="transunlock-d0b9be30b219"></a>

```java
public abstract void transUnlock(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#dptrans-bf19458d92ec), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

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

### writeStart(DpTrans) <a href="#writestart-5fee67274be5" id="writestart-5fee67274be5"></a>

```java
public abstract void writeStart(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](DpTrans.md#dptrans-bf19458d92ec), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

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
