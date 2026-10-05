# TransValidateCallbackProxy <a href="#cls-TransValidateCallbackProxy" id="cls-TransValidateCallbackProxy"></a>

```java
public class com.tailf.dp.annotations.TransValidateCallbackProxy
    implements com.tailf.dp.DpTransValidateCallback
```

Types: [DpTransValidateCallback](../DpTransValidateCallback.md#cls-DpTransValidateCallback)

Callback proxy for TransValidate Callbacks. Implements the
 [`DpTransValidateCallback`](../DpTransValidateCallback.md#cls-DpTransValidateCallback) interface and delegates calls to the
 registered callback POJO with annotated methods

## Members

**Constructors**:

- [TransValidateCallbackProxy(Object)](#m-TransValidateCallbackProxy-11ae52cb63d7)

**Methods**:

- [addActionCapability(TransValidateCBType)](#m-addActionCapability-0a83c7c765a3)
- [addActionMethod(String, Method)](#m-addActionMethod-cf3e43a67fd9)
- [getBackupObject()](#m-getBackupObject-a6fb23c24524)
- [getTransValidateCallbackProxys(Object)](#m-getTransValidateCallbackProxys-ea8c2c00799a)
- [init(DpTrans)](#m-init-16fe8657859c)
- [stop(DpTrans)](#m-stop-1dfe2eb96fb9)

## Constructors

### TransValidateCallbackProxy(Object) <a href="#m-TransValidateCallbackProxy-11ae52cb63d7" id="m-TransValidateCallbackProxy-11ae52cb63d7"></a>

```java
public TransValidateCallbackProxy(Object backupObject)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO


## Methods

### addActionCapability(TransValidateCBType) <a href="#m-addActionCapability-0a83c7c765a3" id="m-addActionCapability-0a83c7c765a3"></a>

```java
public void addActionCapability(com.tailf.dp.proto.TransValidateCBType transValidCBType)
```

Types: [TransValidateCBType](../proto/TransValidateCBType.md#cls-TransValidateCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.TransValidateCBType transValidCBType` - action type

### addActionMethod(String, Method) <a href="#m-addActionMethod-cf3e43a67fd9" id="m-addActionMethod-cf3e43a67fd9"></a>

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

### getBackupObject() <a href="#m-getBackupObject-a6fb23c24524" id="m-getBackupObject-a6fb23c24524"></a>

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

### getTransValidateCallbackProxys(Object) <a href="#m-getTransValidateCallbackProxys-ea8c2c00799a" id="m-getTransValidateCallbackProxys-ea8c2c00799a"></a>

```java
public static com.tailf.dp.annotations.TransValidateCallbackProxy[] getTransValidateCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [TransValidateCallbackProxy](TransValidateCallbackProxy.md#cls-TransValidateCallbackProxy), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of TransValidateCallbackProxy

**Throws**

- `DpCallbackException`

### init(DpTrans) <a href="#m-init-16fe8657859c" id="m-init-16fe8657859c"></a>

```java
public void init(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`

### stop(DpTrans) <a href="#m-stop-1dfe2eb96fb9" id="m-stop-1dfe2eb96fb9"></a>

```java
public void stop(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
