# TransValidateCallbackProxy <a href="#transvalidatecallbackproxy-3da381c7456a" id="transvalidatecallbackproxy-3da381c7456a"></a>

```java
public class com.tailf.dp.annotations.TransValidateCallbackProxy
    implements com.tailf.dp.DpTransValidateCallback
```

Types: [DpTransValidateCallback](../DpTransValidateCallback.md#dptransvalidatecallback-377cc1867a16)

Callback proxy for TransValidate Callbacks. Implements the
 [`DpTransValidateCallback`](../DpTransValidateCallback.md#dptransvalidatecallback-377cc1867a16) interface and delegates calls to the
 registered callback POJO with annotated methods

## Members

**Constructors**:

- [TransValidateCallbackProxy\(Object\)](#transvalidatecallbackproxy-11ae52cb63d7)

**Methods**:

- [addActionCapability\(TransValidateCBType\)](#addactioncapability-0a83c7c765a3)
- [addActionMethod\(String, Method\)](#addactionmethod-cf3e43a67fd9)
- [getBackupObject\(\)](#getbackupobject-a6fb23c24524)
- [getTransValidateCallbackProxys\(Object\)](#gettransvalidatecallbackproxys-ea8c2c00799a)
- [init\(DpTrans\)](#init-16fe8657859c)
- [stop\(DpTrans\)](#stop-1dfe2eb96fb9)

## Constructors

### TransValidateCallbackProxy(Object) <a href="#transvalidatecallbackproxy-11ae52cb63d7" id="transvalidatecallbackproxy-11ae52cb63d7"></a>

```java
public TransValidateCallbackProxy(Object backupObject)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO


## Methods

### addActionCapability(TransValidateCBType) <a href="#addactioncapability-0a83c7c765a3" id="addactioncapability-0a83c7c765a3"></a>

```java
public void addActionCapability(com.tailf.dp.proto.TransValidateCBType transValidCBType)
```

Types: [TransValidateCBType](../proto/TransValidateCBType.md#transvalidatecbtype-351144dc4150)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.TransValidateCBType transValidCBType` - action type

### addActionMethod(String, Method) <a href="#addactionmethod-cf3e43a67fd9" id="addactionmethod-cf3e43a67fd9"></a>

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

### getBackupObject() <a href="#getbackupobject-a6fb23c24524" id="getbackupobject-a6fb23c24524"></a>

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

### getTransValidateCallbackProxys(Object) <a href="#gettransvalidatecallbackproxys-ea8c2c00799a" id="gettransvalidatecallbackproxys-ea8c2c00799a"></a>

```java
public static com.tailf.dp.annotations.TransValidateCallbackProxy[] getTransValidateCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [TransValidateCallbackProxy](TransValidateCallbackProxy.md#transvalidatecallbackproxy-3da381c7456a), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of TransValidateCallbackProxy

**Throws**

- `DpCallbackException`

### init(DpTrans) <a href="#init-16fe8657859c" id="init-16fe8657859c"></a>

```java
public void init(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`

### stop(DpTrans) <a href="#stop-1dfe2eb96fb9" id="stop-1dfe2eb96fb9"></a>

```java
public void stop(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpTrans trans`
