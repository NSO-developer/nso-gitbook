<a id="s-DpValidateTrans"></a>
# DpValidateTrans

```java
public class com.tailf.dp.DpValidateTrans
    extends com.tailf.dp.DpTrans
```

Types: [DpTrans](DpTrans.md#s-DpTrans)

The validate transaction context. Each transaction is running in separate
 thread.

**See also:** [`DpValpointCallback`](DpValpointCallback.md#s-DpValpointCallback), [`DpTransValidateCallback`](DpTransValidateCallback.md#s-DpTransValidateCallback), [`Dp#registerAnnotatedCallbacks(Object)`](Dp.md#s-registerAnnotatedCallbacks)

## Members

**Constructors**:

- [DpValidateTrans(Dp, int, int, int, int, DpUserInfo)](#s-DpValidateTrans-1)

**Fields**:

- [dp](DpTrans.md#s-dp) from DpTrans
- [index](DpTrans.md#s-index) from DpTrans
- [lastDid](DpTrans.md#s-lastDid) from DpTrans
- [lastOp](DpTrans.md#s-lastOp) from DpTrans
- [lastProtoOp](DpTrans.md#s-lastProtoOp) from DpTrans
- [lastQref](DpTrans.md#s-lastQref) from DpTrans
- [opaque](DpTrans.md#s-opaque) from DpTrans
- [socket](DpTrans.md#s-socket) from DpTrans
- [stop](DpTrans.md#s-stop) from DpTrans
- [thandle](DpTrans.md#s-thandle) from DpTrans
- [uinfo](DpTrans.md#s-uinfo) from DpTrans

**Methods**:

- [accumulated()](DpTrans.md#s-accumulated) from DpTrans
- [dataSetTimeout(int)](DpTrans.md#s-dataSetTimeout) from DpTrans
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
- [getValidationUserOpaque()](#s-getValidationUserOpaque)
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
- [setValidationUserOpaque(Object)](#s-setValidationUserOpaque)
- [transReplyOK()](DpTrans.md#s-transReplyOK) from DpTrans

## Constructors

<a id="s-DpValidateTrans-1"></a>
### DpValidateTrans(Dp, int, int, int, int, DpUserInfo)

**Package-private**

```java
DpValidateTrans(
    com.tailf.dp.Dp dp,
    int thandle,
    int qref,
    int dbname,
    int op,
    com.tailf.dp.DpUserInfo uinfo
)
```

Types: [Dp](Dp.md#s-Dp), [DpUserInfo](DpUserInfo.md#s-DpUserInfo)

Lots of parameters here. But since only Dp should be allowed to create
 the transaction there is no need to do anything about it.

**Parameters**

- `com.tailf.dp.Dp dp`
- `int thandle`
- `int qref`
- `int dbname`
- `int op`
- `com.tailf.dp.DpUserInfo uinfo`


## Methods

<a id="s-getValidationUserOpaque"></a>
### getValidationUserOpaque()

```java
public Object getValidationUserOpaque()
```

Get method for user owned opaque data.
 Intended to pass data between method calls in
 an validation callback

<a id="s-run"></a>
### run()

```java
public void run()
```

Runs the thread.

<a id="s-setValidationUserOpaque"></a>
### setValidationUserOpaque(Object)

```java
public void setValidationUserOpaque(Object opaque)
```

Set method for user owned opaque data.
 Intended to pass data between method calls in
 an validation callback

**Parameters**

- `Object opaque`
