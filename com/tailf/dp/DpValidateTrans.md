# DpValidateTrans <a href="#dpvalidatetrans-a10fccde2ed1" id="dpvalidatetrans-a10fccde2ed1"></a>

```java
public class com.tailf.dp.DpValidateTrans
    extends com.tailf.dp.DpTrans
```

Types: [DpTrans](DpTrans.md#dptrans-bf19458d92ec)

The validate transaction context. Each transaction is running in separate
 thread.

**See also:** [`DpValpointCallback`](DpValpointCallback.md#dpvalpointcallback-ee36356695e1), [`DpTransValidateCallback`](DpTransValidateCallback.md#dptransvalidatecallback-377cc1867a16), [`Dp#registerAnnotatedCallbacks(Object)`](Dp.md#registerannotatedcallbacks-ffaebadbfc42)

## Members

**Constructors**:

- [DpValidateTrans\(Dp, int, int, int, int, DpUserInfo\)](#dpvalidatetrans-3745a66aa93e)

**Fields**:

- [dp](DpTrans.md#dp-08e185dd74a1) from DpTrans
- [index](DpTrans.md#index-686aa5fc2ebe) from DpTrans
- [lastDid](DpTrans.md#lastdid-6917f8e438c1) from DpTrans
- [lastOp](DpTrans.md#lastop-060a1e1a3a08) from DpTrans
- [lastProtoOp](DpTrans.md#lastprotoop-7ea33fd79285) from DpTrans
- [lastQref](DpTrans.md#lastqref-3c8dd4583e23) from DpTrans
- [opaque](DpTrans.md#opaque-3dfa88ab46e3) from DpTrans
- [socket](DpTrans.md#socket-64a86aac790a) from DpTrans
- [stop](DpTrans.md#stop-4f9f43a7ef4c) from DpTrans
- [thandle](DpTrans.md#thandle-4150943e9d30) from DpTrans
- [uinfo](DpTrans.md#uinfo-ed78ce702727) from DpTrans

**Methods**:

- [accumulated\(\)](DpTrans.md#accumulated-2f58da3048dd) from DpTrans
- [dataSetTimeout\(int\)](DpTrans.md#datasettimeout-8ad3068e3a46) from DpTrans
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
- [getValidationUserOpaque\(\)](#getvalidationuseropaque-17a29486bf22)
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
- [setValidationUserOpaque\(Object\)](#setvalidationuseropaque-1b3063fe7f25)
- [transReplyOK\(\)](DpTrans.md#transreplyok-92425e2f5c67) from DpTrans

## Constructors

### DpValidateTrans(Dp, int, int, int, int, DpUserInfo) <a href="#dpvalidatetrans-3745a66aa93e" id="dpvalidatetrans-3745a66aa93e"></a>

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

Types: [Dp](Dp.md#dp-64c27347820e), [DpUserInfo](DpUserInfo.md#dpuserinfo-c59746285a6e)

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

### getValidationUserOpaque() <a href="#getvalidationuseropaque-17a29486bf22" id="getvalidationuseropaque-17a29486bf22"></a>

```java
public Object getValidationUserOpaque()
```

Get method for user owned opaque data.
 Intended to pass data between method calls in
 an validation callback

### run() <a href="#run-b6dbda048863" id="run-b6dbda048863"></a>

```java
public void run()
```

Runs the thread.

### setValidationUserOpaque(Object) <a href="#setvalidationuseropaque-1b3063fe7f25" id="setvalidationuseropaque-1b3063fe7f25"></a>

```java
public void setValidationUserOpaque(Object opaque)
```

Set method for user owned opaque data.
 Intended to pass data between method calls in
 an validation callback

**Parameters**

- `Object opaque`
