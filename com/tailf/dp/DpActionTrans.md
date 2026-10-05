# DpActionTrans <a href="#cls-DpActionTrans" id="cls-DpActionTrans"></a>

```java
public class com.tailf.dp.DpActionTrans
    extends com.tailf.dp.DpTrans
```

Types: [DpTrans](DpTrans.md#cls-DpTrans)

The action transaction context. Each action transaction is running in
 separate thread.

**See also:** [`DpActionCallback`](DpActionCallback.md#cls-DpActionCallback)

## Members

**Constructors**:

- [DpActionTrans(Dp, int, int, DpUserInfo, String, int, int)](#m-DpActionTrans-c00d5e1600e9)

**Fields**:

- [dp](DpTrans.md#m-dp) from DpTrans
- [index](DpTrans.md#m-index) from DpTrans
- [lastDid](DpTrans.md#m-lastDid) from DpTrans
- [lastOp](DpTrans.md#m-lastOp) from DpTrans
- [lastProtoOp](DpTrans.md#m-lastProtoOp) from DpTrans
- [lastQref](DpTrans.md#m-lastQref) from DpTrans
- [opaque](DpTrans.md#m-opaque) from DpTrans
- [socket](DpTrans.md#m-socket) from DpTrans
- [STATE_ABORTED](#m-STATE_ABORTED)
- [STATE_ACTION](#m-STATE_ACTION)
- [STATE_DELAYED](#m-STATE_DELAYED)
- [STATE_INIT](#m-STATE_INIT)
- [STATE_NONE](#m-STATE_NONE)
- [stop](DpTrans.md#m-stop) from DpTrans
- [thandle](DpTrans.md#m-thandle) from DpTrans
- [uinfo](DpTrans.md#m-uinfo) from DpTrans

**Methods**:

- [accumulated()](DpTrans.md#m-accumulated-2f58da3048dd) from DpTrans
- [actionSetTimeout(int)](#m-actionSetTimeout-46a0ed69fd5f)
- [changeActionState(int, int)](#m-changeActionState-efc056ab7ae2)
- [dataSetTimeout(int)](DpTrans.md#m-dataSetTimeout-8ad3068e3a46) from DpTrans
- [getActionPoint()](#m-getActionPoint-84988ea225fa)
- [getActionState()](#m-getActionState-f64b645d471e)
- [getAPIndex()](#m-getAPIndex-04b0b49038f1)
- [getDBName()](DpTrans.md#m-getDBName-65ff0bdb2339) from DpTrans
- [getDeviceType()](DpTrans.md#m-getDeviceType-c8eec3b01523) from DpTrans
- [getDevNo()](DpTrans.md#m-getDevNo-b1169ef876ed) from DpTrans
- [getDp()](DpTrans.md#m-getDp-b1462199cc2e) from DpTrans
- [getMode()](DpTrans.md#m-getMode-c3dc73476e30) from DpTrans
- [getNsList()](DpTrans.md#m-getNsList-0345f486e876) from DpTrans
- [getOpaque()](DpTrans.md#m-getOpaque-92e4945ec92d) from DpTrans
- [getSecondaryIndex()](DpTrans.md#m-getSecondaryIndex-8efa1ee57e9c) from DpTrans
- [getSocket()](DpTrans.md#m-getSocket-d7da2de81b81) from DpTrans
- [getTransaction()](DpTrans.md#m-getTransaction-4f1c72a828a1) from DpTrans
- [getTransactionUserOpaque()](DpTrans.md#m-getTransactionUserOpaque-87a9bf7a20e1) from DpTrans
- [getUserInfo()](DpTrans.md#m-getUserInfo-3ecef1f24d3d) from DpTrans
- [getWorkerSocket()](DpTrans.md#m-getWorkerSocket-ba1472e0f5a7) from DpTrans
- [honorFilter(boolean)](DpTrans.md#m-honorFilter-5ff04bbbf2d0) from DpTrans
- [isHideInactive()](DpTrans.md#m-isHideInactive-1d32c2838395) from DpTrans
- [protoReply(boolean)](DpTrans.md#m-protoReply-e8de0386a2d0) from DpTrans
- [protoReply(ConfEObject)](DpTrans.md#m-protoReply-47f22a8227a5) from DpTrans
- [protoReply(ConfObject)](DpTrans.md#m-protoReply-3ecaf76eaab8) from DpTrans
- [protoReply(ConfObject[])](DpTrans.md#m-protoReply-cee1bb25672e) from DpTrans
- [protoReplyXMLParam(ConfXMLParam[])](DpTrans.md#m-protoReplyXMLParam-9dcf8f14a8dc) from DpTrans
- [replyError(ConfEObject)](DpTrans.md#m-replyError-3184cd2ad634) from DpTrans
- [replyError(String)](DpTrans.md#m-replyError-48c78d28e991) from DpTrans
- [replyError(String, Throwable)](DpTrans.md#m-replyError-c4e21f52074d) from DpTrans
- [replyError(Throwable)](DpTrans.md#m-replyError-26f4ce830453) from DpTrans
- [replyExtendedError(String, DpCallbackExtendedException)](DpTrans.md#m-replyExtendedError-b54351b1555f) from DpTrans
- [replyOther(boolean, String, String)](DpTrans.md#m-replyOther-c2352ec6bb73) from DpTrans
- [run()](#m-run-b6dbda048863)
- [setSocket(Socket)](DpTrans.md#m-setSocket-183068848e4c) from DpTrans
- [setTransactionUserOpaque(Object)](DpTrans.md#m-setTransactionUserOpaque-ce392ad59d2e) from DpTrans
- [transReplyOK()](DpTrans.md#m-transReplyOK-92425e2f5c67) from DpTrans

## Constructors

### DpActionTrans(Dp, int, int, DpUserInfo, String, int, int) <a href="#m-DpActionTrans-c00d5e1600e9" id="m-DpActionTrans-c00d5e1600e9"></a>

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

Types: [Dp](Dp.md#cls-Dp), [DpUserInfo](DpUserInfo.md#cls-DpUserInfo)

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

### STATE_ABORTED <a href="#m-STATE_ABORTED" id="m-STATE_ABORTED"></a>

```java
public static final int STATE_ABORTED = 4;
```

### STATE_ACTION <a href="#m-STATE_ACTION" id="m-STATE_ACTION"></a>

```java
public static final int STATE_ACTION = 2;
```

### STATE_DELAYED <a href="#m-STATE_DELAYED" id="m-STATE_DELAYED"></a>

```java
public static final int STATE_DELAYED = 3;
```

### STATE_INIT <a href="#m-STATE_INIT" id="m-STATE_INIT"></a>

```java
public static final int STATE_INIT = 1;
```

### STATE_NONE <a href="#m-STATE_NONE" id="m-STATE_NONE"></a>

```java
public static final int STATE_NONE = 0;
```


## Methods

### actionSetTimeout(int) <a href="#m-actionSetTimeout-46a0ed69fd5f" id="m-actionSetTimeout-46a0ed69fd5f"></a>

```java
public void actionSetTimeout(
    int timeoutSeconds
)
    throws java.io.IOException, com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

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

### changeActionState(int, int) <a href="#m-changeActionState-efc056ab7ae2" id="m-changeActionState-efc056ab7ae2"></a>

```java
protected synchronized void changeActionState(int oldState, int newState)
```

**Parameters**

- `int oldState`
- `int newState`

### getActionPoint() <a href="#m-getActionPoint-84988ea225fa" id="m-getActionPoint-84988ea225fa"></a>

```java
public String getActionPoint()
```

### getActionState() <a href="#m-getActionState-f64b645d471e" id="m-getActionState-f64b645d471e"></a>

```java
public synchronized int getActionState()
```

Returns the current state of this action transaction.
 This can be one of:



- [`STATE_NONE`](DpActionTrans.md#m-STATE_NONE)
   - [`STATE_INIT`](DpActionTrans.md#m-STATE_INIT)
     - [`STATE_ACTION`](DpActionTrans.md#m-STATE_ACTION)
       - [`STATE_ABORTED`](DpActionTrans.md#m-STATE_ABORTED)

**Returns:** action state

### getAPIndex() <a href="#m-getAPIndex-04b0b49038f1" id="m-getAPIndex-04b0b49038f1"></a>

```java
public int getAPIndex()
```

### run() <a href="#m-run-b6dbda048863" id="m-run-b6dbda048863"></a>

```java
public void run()
```

Runs the thread.
