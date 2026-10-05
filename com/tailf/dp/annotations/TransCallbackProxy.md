# TransCallbackProxy <a href="#transcallbackproxy-d708cf110c01" id="transcallbackproxy-d708cf110c01"></a>

```java
public class com.tailf.dp.annotations.TransCallbackProxy
    implements com.tailf.dp.DpTransCallback
```

Types: [DpTransCallback](../DpTransCallback.md#dptranscallback-20e03cd7123b)

Callback proxy for Trans Callbacks. Implements the [`DpTransCallback`](../DpTransCallback.md#dptranscallback-20e03cd7123b)
 interface and delegates calls to the registered callback POJO with annotated
 methods

**Since:** 3.2.0

## Members

**Constructors**:

- [TransCallbackProxy(Object)](#transcallbackproxy-4c24784116c5)

**Fields**:

- [M_ABORT](../DpTransCallback.md#m_abort-7b4607723e90) from DpTransCallback
- [M_ALL](../DpTransCallback.md#m_all-e3844e41e8ee) from DpTransCallback
- [M_COMMIT](../DpTransCallback.md#m_commit-a638c60fa850) from DpTransCallback
- [M_FINISH](../DpTransCallback.md#m_finish-f4213d20ec3b) from DpTransCallback
- [M_INIT](../DpTransCallback.md#m_init-13cacf7e79fd) from DpTransCallback
- [M_PREPARE](../DpTransCallback.md#m_prepare-151ace1a1f08) from DpTransCallback
- [M_TRANS_LOCK](../DpTransCallback.md#m_trans_lock-d3e5dbe7a854) from DpTransCallback
- [M_TRANS_UNLOCK](../DpTransCallback.md#m_trans_unlock-3304819d44bd) from DpTransCallback
- [M_WRITE_START](../DpTransCallback.md#m_write_start-dde742bd8183) from DpTransCallback

**Methods**:

- [abort(DpTrans)](#abort-be36f552f23c)
- [addActionCapability(TransCBType)](#addactioncapability-2e8b6a8286db)
- [addActionMethod(String, Method)](#addactionmethod-cf3e43a67fd9)
- [commit(DpTrans)](#commit-5e7631b9a7e8)
- [finish(DpTrans)](#finish-1001d416be96)
- [getBackupObject()](#getbackupobject-a6fb23c24524)
- [getTransCallbackProxys(Object)](#gettranscallbackproxys-87b043856a25)
- [init(DpTrans)](#init-16fe8657859c)
- [mask()](#mask-24c2fa29c6af)
- [prepare(DpTrans)](#prepare-ab366f6ce7ea)
- [transLock(DpTrans)](#translock-dc59c2c0e5f8)
- [transUnlock(DpTrans)](#transunlock-d0b9be30b219)
- [writeStart(DpTrans)](#writestart-5fee67274be5)

## Constructors

### TransCallbackProxy(Object) <a href="#transcallbackproxy-4c24784116c5" id="transcallbackproxy-4c24784116c5"></a>

```java
public TransCallbackProxy(Object backupObject)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO


## Methods

### abort(DpTrans) <a href="#abort-be36f552f23c" id="abort-be36f552f23c"></a>

```java
public void abort(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`

### addActionCapability(TransCBType) <a href="#addactioncapability-2e8b6a8286db" id="addactioncapability-2e8b6a8286db"></a>

```java
public void addActionCapability(com.tailf.dp.proto.TransCBType transCBType)
```

Types: [TransCBType](../proto/TransCBType.md#transcbtype-23d0df519739)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.TransCBType transCBType` - action type

### addActionMethod(String, Method) <a href="#addactionmethod-cf3e43a67fd9" id="addactionmethod-cf3e43a67fd9"></a>

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

### commit(DpTrans) <a href="#commit-5e7631b9a7e8" id="commit-5e7631b9a7e8"></a>

```java
public void commit(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`

### finish(DpTrans) <a href="#finish-1001d416be96" id="finish-1001d416be96"></a>

```java
public void finish(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`

### getBackupObject() <a href="#getbackupobject-a6fb23c24524" id="getbackupobject-a6fb23c24524"></a>

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

### getTransCallbackProxys(Object) <a href="#gettranscallbackproxys-87b043856a25" id="gettranscallbackproxys-87b043856a25"></a>

```java
public static com.tailf.dp.annotations.TransCallbackProxy[] getTransCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [TransCallbackProxy](TransCallbackProxy.md#transcallbackproxy-d708cf110c01), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of TransCallbackProxy

**Throws**

- `DpCallbackException`

### init(DpTrans) <a href="#init-16fe8657859c" id="init-16fe8657859c"></a>

```java
public void init(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`

### mask() <a href="#mask-24c2fa29c6af" id="mask-24c2fa29c6af"></a>

```java
public int mask()
```

### prepare(DpTrans) <a href="#prepare-ab366f6ce7ea" id="prepare-ab366f6ce7ea"></a>

```java
public void prepare(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`

### transLock(DpTrans) <a href="#translock-dc59c2c0e5f8" id="translock-dc59c2c0e5f8"></a>

```java
public void transLock(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`

### transUnlock(DpTrans) <a href="#transunlock-d0b9be30b219" id="transunlock-d0b9be30b219"></a>

```java
public void transUnlock(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`

### writeStart(DpTrans) <a href="#writestart-5fee67274be5" id="writestart-5fee67274be5"></a>

```java
public void writeStart(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`
