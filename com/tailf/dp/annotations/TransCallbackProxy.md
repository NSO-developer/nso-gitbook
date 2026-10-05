<a id="cls-TransCallbackProxy"></a>
# TransCallbackProxy

```java
public class com.tailf.dp.annotations.TransCallbackProxy
    implements com.tailf.dp.DpTransCallback
```

Types: [DpTransCallback](../DpTransCallback.md#cls-DpTransCallback)

Callback proxy for Trans Callbacks. Implements the [`DpTransCallback`](../DpTransCallback.md#cls-DpTransCallback)
 interface and delegates calls to the registered callback POJO with annotated
 methods

**Since:** 3.2.0

## Members

**Constructors**:

- [TransCallbackProxy(Object)](#m-transcallbackproxy-4c24784116c5)

**Fields**:

- [M_ABORT](../DpTransCallback.md#m-M_ABORT) from DpTransCallback
- [M_ALL](../DpTransCallback.md#m-M_ALL) from DpTransCallback
- [M_COMMIT](../DpTransCallback.md#m-M_COMMIT) from DpTransCallback
- [M_FINISH](../DpTransCallback.md#m-M_FINISH) from DpTransCallback
- [M_INIT](../DpTransCallback.md#m-M_INIT) from DpTransCallback
- [M_PREPARE](../DpTransCallback.md#m-M_PREPARE) from DpTransCallback
- [M_TRANS_LOCK](../DpTransCallback.md#m-M_TRANS_LOCK) from DpTransCallback
- [M_TRANS_UNLOCK](../DpTransCallback.md#m-M_TRANS_UNLOCK) from DpTransCallback
- [M_WRITE_START](../DpTransCallback.md#m-M_WRITE_START) from DpTransCallback

**Methods**:

- [abort(DpTrans)](#m-abort-be36f552f23c)
- [addActionCapability(TransCBType)](#m-addactioncapability-2e8b6a8286db)
- [addActionMethod(String, Method)](#m-addactionmethod-cf3e43a67fd9)
- [commit(DpTrans)](#m-commit-5e7631b9a7e8)
- [finish(DpTrans)](#m-finish-1001d416be96)
- [getBackupObject()](#m-getbackupobject-a6fb23c24524)
- [getTransCallbackProxys(Object)](#m-gettranscallbackproxys-87b043856a25)
- [init(DpTrans)](#m-init-16fe8657859c)
- [mask()](#m-mask-24c2fa29c6af)
- [prepare(DpTrans)](#m-prepare-ab366f6ce7ea)
- [transLock(DpTrans)](#m-translock-dc59c2c0e5f8)
- [transUnlock(DpTrans)](#m-transunlock-d0b9be30b219)
- [writeStart(DpTrans)](#m-writestart-5fee67274be5)

## Constructors

<a id="m-transcallbackproxy-4c24784116c5"></a>
### TransCallbackProxy(Object)

```java
public TransCallbackProxy(Object backupObject)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO


## Methods

<a id="m-abort-be36f552f23c"></a>
### abort(DpTrans)

```java
public void abort(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`

<a id="m-addactioncapability-2e8b6a8286db"></a>
### addActionCapability(TransCBType)

```java
public void addActionCapability(com.tailf.dp.proto.TransCBType transCBType)
```

Types: [TransCBType](../proto/TransCBType.md#cls-TransCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.TransCBType transCBType` - action type

<a id="m-addactionmethod-cf3e43a67fd9"></a>
### addActionMethod(String, Method)

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

<a id="m-commit-5e7631b9a7e8"></a>
### commit(DpTrans)

```java
public void commit(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`

<a id="m-finish-1001d416be96"></a>
### finish(DpTrans)

```java
public void finish(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`

<a id="m-getbackupobject-a6fb23c24524"></a>
### getBackupObject()

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

<a id="m-gettranscallbackproxys-87b043856a25"></a>
### getTransCallbackProxys(Object)

```java
public static com.tailf.dp.annotations.TransCallbackProxy[] getTransCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [TransCallbackProxy](TransCallbackProxy.md#cls-TransCallbackProxy), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of TransCallbackProxy

**Throws**

- `DpCallbackException`

<a id="m-init-16fe8657859c"></a>
### init(DpTrans)

```java
public void init(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`

<a id="m-mask-24c2fa29c6af"></a>
### mask()

```java
public int mask()
```

<a id="m-prepare-ab366f6ce7ea"></a>
### prepare(DpTrans)

```java
public void prepare(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`

<a id="m-translock-dc59c2c0e5f8"></a>
### transLock(DpTrans)

```java
public void transLock(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`

<a id="m-transunlock-d0b9be30b219"></a>
### transUnlock(DpTrans)

```java
public void transUnlock(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`

<a id="m-writestart-5fee67274be5"></a>
### writeStart(DpTrans)

```java
public void writeStart(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
