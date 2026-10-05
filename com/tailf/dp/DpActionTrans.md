<a id="cls-DpActionTrans"></a>
# DpActionTrans

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

- [DpActionTrans(Dp, int, int, DpUserInfo, String, int, int)](#m-dpactiontrans-c00d5e1600e9)

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
- [actionSetTimeout(int)](#m-actionsettimeout-46a0ed69fd5f)
- [changeActionState(int, int)](#m-changeactionstate-efc056ab7ae2)
- [dataSetTimeout(int)](DpTrans.md#m-datasettimeout-8ad3068e3a46) from DpTrans
- [getActionPoint()](#m-getactionpoint-84988ea225fa)
- [getActionState()](#m-getactionstate-f64b645d471e)
- [getAPIndex()](#m-getapindex-04b0b49038f1)
- [getDBName()](DpTrans.md#m-getdbname-65ff0bdb2339) from DpTrans
- [getDeviceType()](DpTrans.md#m-getdevicetype-c8eec3b01523) from DpTrans
- [getDevNo()](DpTrans.md#m-getdevno-b1169ef876ed) from DpTrans
- [getDp()](DpTrans.md#m-getdp-b1462199cc2e) from DpTrans
- [getMode()](DpTrans.md#m-getmode-c3dc73476e30) from DpTrans
- [getNsList()](DpTrans.md#m-getnslist-0345f486e876) from DpTrans
- [getOpaque()](DpTrans.md#m-getopaque-92e4945ec92d) from DpTrans
- [getSecondaryIndex()](DpTrans.md#m-getsecondaryindex-8efa1ee57e9c) from DpTrans
- [getSocket()](DpTrans.md#m-getsocket-d7da2de81b81) from DpTrans
- [getTransaction()](DpTrans.md#m-gettransaction-4f1c72a828a1) from DpTrans
- [getTransactionUserOpaque()](DpTrans.md#m-gettransactionuseropaque-87a9bf7a20e1) from DpTrans
- [getUserInfo()](DpTrans.md#m-getuserinfo-3ecef1f24d3d) from DpTrans
- [getWorkerSocket()](DpTrans.md#m-getworkersocket-ba1472e0f5a7) from DpTrans
- [honorFilter(boolean)](DpTrans.md#m-honorfilter-5ff04bbbf2d0) from DpTrans
- [isHideInactive()](DpTrans.md#m-ishideinactive-1d32c2838395) from DpTrans
- [protoReply(boolean)](DpTrans.md#m-protoreply-e8de0386a2d0) from DpTrans
- [protoReply(ConfEObject)](DpTrans.md#m-protoreply-47f22a8227a5) from DpTrans
- [protoReply(ConfObject)](DpTrans.md#m-protoreply-3ecaf76eaab8) from DpTrans
- [protoReply(ConfObject[])](DpTrans.md#m-protoreply-cee1bb25672e) from DpTrans
- [protoReplyXMLParam(ConfXMLParam[])](DpTrans.md#m-protoreplyxmlparam-9dcf8f14a8dc) from DpTrans
- [replyError(ConfEObject)](DpTrans.md#m-replyerror-3184cd2ad634) from DpTrans
- [replyError(String)](DpTrans.md#m-replyerror-48c78d28e991) from DpTrans
- [replyError(String, Throwable)](DpTrans.md#m-replyerror-c4e21f52074d) from DpTrans
- [replyError(Throwable)](DpTrans.md#m-replyerror-26f4ce830453) from DpTrans
- [replyExtendedError(String, DpCallbackExtendedException)](DpTrans.md#m-replyextendederror-b54351b1555f) from DpTrans
- [replyOther(boolean, String, String)](DpTrans.md#m-replyother-c2352ec6bb73) from DpTrans
- [run()](#m-run-b6dbda048863)
- [setSocket(Socket)](DpTrans.md#m-setsocket-183068848e4c) from DpTrans
- [setTransactionUserOpaque(Object)](DpTrans.md#m-settransactionuseropaque-ce392ad59d2e) from DpTrans
- [transReplyOK()](DpTrans.md#m-transreplyok-92425e2f5c67) from DpTrans

## Constructors

<a id="m-dpactiontrans-c00d5e1600e9"></a>
### DpActionTrans(Dp, int, int, DpUserInfo, String, int, int)

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

<a id="m-STATE_ABORTED"></a>
### STATE_ABORTED

```java
public static final int STATE_ABORTED = 4;
```

<a id="m-STATE_ACTION"></a>
### STATE_ACTION

```java
public static final int STATE_ACTION = 2;
```

<a id="m-STATE_DELAYED"></a>
### STATE_DELAYED

```java
public static final int STATE_DELAYED = 3;
```

<a id="m-STATE_INIT"></a>
### STATE_INIT

```java
public static final int STATE_INIT = 1;
```

<a id="m-STATE_NONE"></a>
### STATE_NONE

```java
public static final int STATE_NONE = 0;
```


## Methods

<a id="m-actionsettimeout-46a0ed69fd5f"></a>
### actionSetTimeout(int)

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

<a id="m-changeactionstate-efc056ab7ae2"></a>
### changeActionState(int, int)

```java
protected synchronized void changeActionState(int oldState, int newState)
```

**Parameters**

- `int oldState`
- `int newState`

<a id="m-getactionpoint-84988ea225fa"></a>
### getActionPoint()

```java
public String getActionPoint()
```

<a id="m-getactionstate-f64b645d471e"></a>
### getActionState()

```java
public synchronized int getActionState()
```

Returns the current state of this action transaction.
 This can be one of:



- `#STATE_NONE`
   - `#STATE_INIT`
     - `#STATE_ACTION`
       - `#STATE_ABORTED`

**Returns:** action state

<a id="m-getapindex-04b0b49038f1"></a>
### getAPIndex()

```java
public int getAPIndex()
```

<a id="m-run-b6dbda048863"></a>
### run()

```java
public void run()
```

Runs the thread.
