<a id="cls-DpValidateTrans"></a>
# DpValidateTrans

```java
public class com.tailf.dp.DpValidateTrans
    extends com.tailf.dp.DpTrans
```

Types: [DpTrans](DpTrans.md#cls-DpTrans)

The validate transaction context. Each transaction is running in separate
 thread.

**See also:** [`DpValpointCallback`](DpValpointCallback.md#cls-DpValpointCallback), [`DpTransValidateCallback`](DpTransValidateCallback.md#cls-DpTransValidateCallback), [`Dp#registerAnnotatedCallbacks(Object)`](Dp.md#m-registerannotatedcallbacks-ffaebadbfc42)

## Members

**Constructors**:

- [DpValidateTrans(Dp, int, int, int, int, DpUserInfo)](#m-dpvalidatetrans-3745a66aa93e)

**Fields**:

- [dp](DpTrans.md#m-dp) from DpTrans
- [index](DpTrans.md#m-index) from DpTrans
- [lastDid](DpTrans.md#m-lastDid) from DpTrans
- [lastOp](DpTrans.md#m-lastOp) from DpTrans
- [lastProtoOp](DpTrans.md#m-lastProtoOp) from DpTrans
- [lastQref](DpTrans.md#m-lastQref) from DpTrans
- [opaque](DpTrans.md#m-opaque) from DpTrans
- [socket](DpTrans.md#m-socket) from DpTrans
- [stop](DpTrans.md#m-stop) from DpTrans
- [thandle](DpTrans.md#m-thandle) from DpTrans
- [uinfo](DpTrans.md#m-uinfo) from DpTrans

**Methods**:

- [accumulated()](DpTrans.md#m-accumulated-2f58da3048dd) from DpTrans
- [dataSetTimeout(int)](DpTrans.md#m-datasettimeout-8ad3068e3a46) from DpTrans
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
- [getValidationUserOpaque()](#m-getvalidationuseropaque-17a29486bf22)
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
- [setValidationUserOpaque(Object)](#m-setvalidationuseropaque-1b3063fe7f25)
- [transReplyOK()](DpTrans.md#m-transreplyok-92425e2f5c67) from DpTrans

## Constructors

<a id="m-dpvalidatetrans-3745a66aa93e"></a>
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

Types: [Dp](Dp.md#cls-Dp), [DpUserInfo](DpUserInfo.md#cls-DpUserInfo)

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

<a id="m-getvalidationuseropaque-17a29486bf22"></a>
### getValidationUserOpaque()

```java
public Object getValidationUserOpaque()
```

Get method for user owned opaque data.
 Intended to pass data between method calls in
 an validation callback

<a id="m-run-b6dbda048863"></a>
### run()

```java
public void run()
```

Runs the thread.

<a id="m-setvalidationuseropaque-1b3063fe7f25"></a>
### setValidationUserOpaque(Object)

```java
public void setValidationUserOpaque(Object opaque)
```

Set method for user owned opaque data.
 Intended to pass data between method calls in
 an validation callback

**Parameters**

- `Object opaque`
