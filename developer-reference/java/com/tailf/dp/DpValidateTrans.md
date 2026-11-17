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
- [run\(\)](#run-b6dbda048863)
- [setSocket\(Socket\)](DpTrans.md#setsocket-183068848e4c) from DpTrans
- [setTransactionUserOpaque\(Object\)](DpTrans.md#settransactionuseropaque-ce392ad59d2e) from DpTrans
- [setValidationUserOpaque\(Object\)](#setvalidationuseropaque-1b3063fe7f25)

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
