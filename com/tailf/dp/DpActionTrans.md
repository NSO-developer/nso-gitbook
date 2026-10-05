<a id="s-DpActionTrans"></a>
# DpActionTrans

```java
public class com.tailf.dp.DpActionTrans
    extends com.tailf.dp.DpTrans
```

Types: [DpTrans](DpTrans.md#s-DpTrans)

The action transaction context. Each action transaction is running in
 separate thread.

**See also:** [`DpActionCallback`](DpActionCallback.md#s-DpActionCallback)

## Members

**Constructors**:

- [DpActionTrans(Dp, int, int, DpUserInfo, String, int, int)](#s-DpActionTrans-1)

**Fields**:

- [dp](DpTrans.md#s-dp) from DpTrans
- [index](DpTrans.md#s-index) from DpTrans
- [lastDid](DpTrans.md#s-lastDid) from DpTrans
- [lastOp](DpTrans.md#s-lastOp) from DpTrans
- [lastProtoOp](DpTrans.md#s-lastProtoOp) from DpTrans
- [lastQref](DpTrans.md#s-lastQref) from DpTrans
- [opaque](DpTrans.md#s-opaque) from DpTrans
- [socket](DpTrans.md#s-socket) from DpTrans
- [STATE_ABORTED](#s-STATE_ABORTED)
- [STATE_ACTION](#s-STATE_ACTION)
- [STATE_DELAYED](#s-STATE_DELAYED)
- [STATE_INIT](#s-STATE_INIT)
- [STATE_NONE](#s-STATE_NONE)
- [stop](DpTrans.md#s-stop) from DpTrans
- [thandle](DpTrans.md#s-thandle) from DpTrans
- [uinfo](DpTrans.md#s-uinfo) from DpTrans

**Methods**:

- [accumulated()](DpTrans.md#s-accumulated) from DpTrans
- [actionSetTimeout(int)](#s-actionSetTimeout)
- [changeActionState(int, int)](#s-changeActionState)
- [dataSetTimeout(int)](DpTrans.md#s-dataSetTimeout) from DpTrans
- [getActionPoint()](#s-getActionPoint)
- [getActionState()](#s-getActionState)
- [getAPIndex()](#s-getAPIndex)
- [getDBName()](DpTrans.md#s-getDBName) from DpTrans
- [getDeviceType()](DpTrans.md#s-getDeviceType) from DpTrans
- [getDevNo()](DpTrans.md#s-getDevNo) from DpTrans
- [getDp()](DpTrans.md#s-getDp) from DpTrans
- [getMode()](DpTrans.md#s-getMode) from DpTrans
- [getNsList()](DpTrans.md#s-getNsList) from DpTrans
- [getOpaque()](DpTrans.md#s-getOpaque) from DpTrans
- [getSecondaryIndex()](DpTrans.md#s-getSecondaryIndex) from DpTrans
- [getSocket()](DpTrans.md#s-getSocket) from DpTrans
- [getTransaction()](DpTrans.md#s-getTransaction) from DpTrans
- [getTransactionUserOpaque()](DpTrans.md#s-getTransactionUserOpaque) from DpTrans
- [getUserInfo()](DpTrans.md#s-getUserInfo) from DpTrans
- [getWorkerSocket()](DpTrans.md#s-getWorkerSocket) from DpTrans
- [honorFilter(boolean)](DpTrans.md#s-honorFilter) from DpTrans
- [isHideInactive()](DpTrans.md#s-isHideInactive) from DpTrans
- [protoReply(boolean)](DpTrans.md#s-protoReply) from DpTrans
- [protoReply(ConfEObject)](DpTrans.md#s-protoReply-1) from DpTrans
- [protoReply(ConfObject)](DpTrans.md#s-protoReply-2) from DpTrans
- [protoReply(ConfObject[])](DpTrans.md#s-protoReply-3) from DpTrans
- [protoReplyXMLParam(ConfXMLParam[])](DpTrans.md#s-protoReplyXMLParam) from DpTrans
- [replyError(ConfEObject)](DpTrans.md#s-replyError) from DpTrans
- [replyError(String)](DpTrans.md#s-replyError-1) from DpTrans
- [replyError(String, Throwable)](DpTrans.md#s-replyError-2) from DpTrans
- [replyError(Throwable)](DpTrans.md#s-replyError-3) from DpTrans
- [replyExtendedError(String, DpCallbackExtendedException)](DpTrans.md#s-replyExtendedError) from DpTrans
- [replyOther(boolean, String, String)](DpTrans.md#s-replyOther) from DpTrans
- [run()](#s-run)
- [setSocket(Socket)](DpTrans.md#s-setSocket) from DpTrans
- [setTransactionUserOpaque(Object)](DpTrans.md#s-setTransactionUserOpaque) from DpTrans
- [transReplyOK()](DpTrans.md#s-transReplyOK) from DpTrans

## Constructors

<a id="s-DpActionTrans-1"></a>
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

Types: [Dp](Dp.md#s-Dp), [DpUserInfo](DpUserInfo.md#s-DpUserInfo)

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

<a id="s-STATE_ABORTED"></a>
### STATE_ABORTED

```java
public static final int STATE_ABORTED = 4;
```

<a id="s-STATE_ACTION"></a>
### STATE_ACTION

```java
public static final int STATE_ACTION = 2;
```

<a id="s-STATE_DELAYED"></a>
### STATE_DELAYED

```java
public static final int STATE_DELAYED = 3;
```

<a id="s-STATE_INIT"></a>
### STATE_INIT

```java
public static final int STATE_INIT = 1;
```

<a id="s-STATE_NONE"></a>
### STATE_NONE

```java
public static final int STATE_NONE = 0;
```


## Methods

<a id="s-actionSetTimeout"></a>
### actionSetTimeout(int)

```java
public void actionSetTimeout(
    int timeoutSeconds
)
    throws java.io.IOException, com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

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

<a id="s-changeActionState"></a>
### changeActionState(int, int)

```java
protected synchronized void changeActionState(int oldState, int newState)
```

**Parameters**

- `int oldState`
- `int newState`

<a id="s-getActionPoint"></a>
### getActionPoint()

```java
public String getActionPoint()
```

<a id="s-getActionState"></a>
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

<a id="s-getAPIndex"></a>
### getAPIndex()

```java
public int getAPIndex()
```

<a id="s-run"></a>
### run()

```java
public void run()
```

Runs the thread.
