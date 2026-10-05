# DpActionTrans <a href="#dpactiontrans-b975ce2c2d93" id="dpactiontrans-b975ce2c2d93"></a>

```java
public class com.tailf.dp.DpActionTrans
    extends com.tailf.dp.DpTrans
```

Types: [DpTrans](DpTrans.md#dptrans-bf19458d92ec)

The action transaction context. Each action transaction is running in
 separate thread.

**See also:** [`DpActionCallback`](DpActionCallback.md#dpactioncallback-62c4973947ec)

## Members

**Constructors**:

- [DpActionTrans\(Dp, int, int, DpUserInfo, String, int, int\)](#dpactiontrans-c00d5e1600e9)

**Fields**:

- [dp](DpTrans.md#dp-08e185dd74a1) from DpTrans
- [index](DpTrans.md#index-686aa5fc2ebe) from DpTrans
- [lastDid](DpTrans.md#lastdid-6917f8e438c1) from DpTrans
- [lastOp](DpTrans.md#lastop-060a1e1a3a08) from DpTrans
- [lastProtoOp](DpTrans.md#lastprotoop-7ea33fd79285) from DpTrans
- [lastQref](DpTrans.md#lastqref-3c8dd4583e23) from DpTrans
- [opaque](DpTrans.md#opaque-3dfa88ab46e3) from DpTrans
- [socket](DpTrans.md#socket-64a86aac790a) from DpTrans
- [STATE\_ABORTED](#state_aborted-f267bf6c0021)
- [STATE\_ACTION](#state_action-60c550dd5e00)
- [STATE\_DELAYED](#state_delayed-0905aefbe34e)
- [STATE\_INIT](#state_init-6096426df4ec)
- [STATE\_NONE](#state_none-e3766e74c7f3)
- [stop](DpTrans.md#stop-4f9f43a7ef4c) from DpTrans
- [thandle](DpTrans.md#thandle-4150943e9d30) from DpTrans
- [uinfo](DpTrans.md#uinfo-ed78ce702727) from DpTrans

**Methods**:

- [accumulated\(\)](DpTrans.md#accumulated-2f58da3048dd) from DpTrans
- [actionSetTimeout\(int\)](#actionsettimeout-46a0ed69fd5f)
- [changeActionState\(int, int\)](#changeactionstate-efc056ab7ae2)
- [dataSetTimeout\(int\)](DpTrans.md#datasettimeout-8ad3068e3a46) from DpTrans
- [getActionPoint\(\)](#getactionpoint-84988ea225fa)
- [getActionState\(\)](#getactionstate-f64b645d471e)
- [getAPIndex\(\)](#getapindex-04b0b49038f1)
- [getDBName\(\)](DpTrans.md#getdbname-65ff0bdb2339) from DpTrans
- [getDeviceType\(\)](DpTrans.md#getdevicetype-c8eec3b01523) from DpTrans
- [getDevNo\(\)](DpTrans.md#getdevno-b1169ef876ed) from DpTrans
- [getDp\(\)](DpTrans.md#getdp-b1462199cc2e) from DpTrans
- [getMode\(\)](DpTrans.md#getmode-c3dc73476e30) from DpTrans
- [getNsList\(\)](DpTrans.md#getnslist-0345f486e876) from DpTrans
- [getOpaque\(\)](DpTrans.md#getopaque-92e4945ec92d) from DpTrans
- [getSecondaryIndex\(\)](DpTrans.md#getsecondaryindex-8efa1ee57e9c) from DpTrans
- [getSocket\(\)](DpTrans.md#getsocket-d7da2de81b81) from DpTrans
- [getTransaction\(\)](DpTrans.md#gettransaction-4f1c72a828a1) from DpTrans
- [getTransactionUserOpaque\(\)](DpTrans.md#gettransactionuseropaque-87a9bf7a20e1) from DpTrans
- [getUserInfo\(\)](DpTrans.md#getuserinfo-3ecef1f24d3d) from DpTrans
- [getWorkerSocket\(\)](DpTrans.md#getworkersocket-ba1472e0f5a7) from DpTrans
- [honorFilter\(boolean\)](DpTrans.md#honorfilter-5ff04bbbf2d0) from DpTrans
- [isHideInactive\(\)](DpTrans.md#ishideinactive-1d32c2838395) from DpTrans
- [protoReply\(boolean\)](DpTrans.md#protoreply-e8de0386a2d0) from DpTrans
- [protoReply\(ConfEObject\)](DpTrans.md#protoreply-47f22a8227a5) from DpTrans
- [protoReply\(ConfObject\)](DpTrans.md#protoreply-3ecaf76eaab8) from DpTrans
- [protoReply\(ConfObject\[\]\)](DpTrans.md#protoreply-cee1bb25672e) from DpTrans
- [protoReplyXMLParam\(ConfXMLParam\[\]\)](DpTrans.md#protoreplyxmlparam-9dcf8f14a8dc) from DpTrans
- [replyError\(ConfEObject\)](DpTrans.md#replyerror-3184cd2ad634) from DpTrans
- [replyError\(String\)](DpTrans.md#replyerror-48c78d28e991) from DpTrans
- [replyError\(String, Throwable\)](DpTrans.md#replyerror-c4e21f52074d) from DpTrans
- [replyError\(Throwable\)](DpTrans.md#replyerror-26f4ce830453) from DpTrans
- [replyExtendedError\(String, DpCallbackExtendedException\)](DpTrans.md#replyextendederror-b54351b1555f) from DpTrans
- [replyOther\(boolean, String, String\)](DpTrans.md#replyother-c2352ec6bb73) from DpTrans
- [run\(\)](#run-b6dbda048863)
- [setSocket\(Socket\)](DpTrans.md#setsocket-183068848e4c) from DpTrans
- [setTransactionUserOpaque\(Object\)](DpTrans.md#settransactionuseropaque-ce392ad59d2e) from DpTrans
- [transReplyOK\(\)](DpTrans.md#transreplyok-92425e2f5c67) from DpTrans

## Constructors

### DpActionTrans(Dp, int, int, DpUserInfo, String, int, int) <a href="#dpactiontrans-c00d5e1600e9" id="dpactiontrans-c00d5e1600e9"></a>

**Package-private**

```java
DpActionTrans(
    com.tailf.dp.Dp dp,
    int qref,
    int op,
    com.tailf.dp.DpUserInfo uinfo,
    String point,
    int apIndex,
    int thandle
)
```

Types: [Dp](Dp.md#dp-64c27347820e), [DpUserInfo](DpUserInfo.md#dpuserinfo-c59746285a6e)

Lots of parameters here. But since only Dp should be allowed to create
 the transaction there is no need to do anything about it.

**Parameters**

- `com.tailf.dp.Dp dp`
- `int qref`
- `int op`
- `com.tailf.dp.DpUserInfo uinfo`
- `String point`
- `int apIndex`
- `int thandle`


## Fields

### STATE_ABORTED <a href="#state_aborted-f267bf6c0021" id="state_aborted-f267bf6c0021"></a>

```java
public static final int STATE_ABORTED = 4;
```

### STATE_ACTION <a href="#state_action-60c550dd5e00" id="state_action-60c550dd5e00"></a>

```java
public static final int STATE_ACTION = 2;
```

### STATE_DELAYED <a href="#state_delayed-0905aefbe34e" id="state_delayed-0905aefbe34e"></a>

```java
public static final int STATE_DELAYED = 3;
```

### STATE_INIT <a href="#state_init-6096426df4ec" id="state_init-6096426df4ec"></a>

```java
public static final int STATE_INIT = 1;
```

### STATE_NONE <a href="#state_none-e3766e74c7f3" id="state_none-e3766e74c7f3"></a>

```java
public static final int STATE_NONE = 0;
```


## Methods

### actionSetTimeout(int) <a href="#actionsettimeout-46a0ed69fd5f" id="actionsettimeout-46a0ed69fd5f"></a>

```java
public void actionSetTimeout(
    int timeoutSeconds
)
    throws java.io.IOException, com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

Some action callbacks may require a significantly longer execution time
 than others, and this time may not even be possible to determine
 statically (e.g. a file download). In such cases the
 /ncs-config/api/action-timeout setting in ncs.conf may be insufficient,
 and this function can be used to extend (or shorten) the timeout for the
 current callback invocation. The timeout is given in seconds from the
 point in time when the function is called.

**Parameters**

- `int timeoutSeconds`

**Throws**

- `IOException`
- `DpCallbackException`

### changeActionState(int, int) <a href="#changeactionstate-efc056ab7ae2" id="changeactionstate-efc056ab7ae2"></a>

```java
protected synchronized void changeActionState(int oldState, int newState)
```

**Parameters**

- `int oldState`
- `int newState`

### getActionPoint() <a href="#getactionpoint-84988ea225fa" id="getactionpoint-84988ea225fa"></a>

```java
public String getActionPoint()
```

### getActionState() <a href="#getactionstate-f64b645d471e" id="getactionstate-f64b645d471e"></a>

```java
public synchronized int getActionState()
```

Returns the current state of this action transaction.
 This can be one of:



- [`STATE_NONE`](DpActionTrans.md#state_none-e3766e74c7f3)
   - [`STATE_INIT`](DpActionTrans.md#state_init-6096426df4ec)
     - [`STATE_ACTION`](DpActionTrans.md#state_action-60c550dd5e00)
       - [`STATE_ABORTED`](DpActionTrans.md#state_aborted-f267bf6c0021)

**Returns:** action state

### getAPIndex() <a href="#getapindex-04b0b49038f1" id="getapindex-04b0b49038f1"></a>

```java
public int getAPIndex()
```

### run() <a href="#run-b6dbda048863" id="run-b6dbda048863"></a>

```java
public void run()
```

Runs the thread.
