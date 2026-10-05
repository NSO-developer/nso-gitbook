<a id="cls-TransValidateCallbackProxy"></a>
# TransValidateCallbackProxy

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

- [TransValidateCallbackProxy(Object)](#m-transvalidatecallbackproxy-11ae52cb63d7)

**Methods**:

- [addActionCapability(TransValidateCBType)](#m-addactioncapability-0a83c7c765a3)
- [addActionMethod(String, Method)](#m-addactionmethod-cf3e43a67fd9)
- [getBackupObject()](#m-getbackupobject-a6fb23c24524)
- [getTransValidateCallbackProxys(Object)](#m-gettransvalidatecallbackproxys-ea8c2c00799a)
- [init(DpTrans)](#m-init-16fe8657859c)
- [stop(DpTrans)](#m-stop-1dfe2eb96fb9)

## Constructors

<a id="m-transvalidatecallbackproxy-11ae52cb63d7"></a>
### TransValidateCallbackProxy(Object)

```java
public TransValidateCallbackProxy(Object backupObject)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO


## Methods

<a id="m-addactioncapability-0a83c7c765a3"></a>
### addActionCapability(TransValidateCBType)

```java
public void addActionCapability(com.tailf.dp.proto.TransValidateCBType transValidCBType)
```

Types: [TransValidateCBType](../proto/TransValidateCBType.md#cls-TransValidateCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.TransValidateCBType transValidCBType` - action type

<a id="m-addactionmethod-cf3e43a67fd9"></a>
### addActionMethod(String, Method)

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

<a id="m-getbackupobject-a6fb23c24524"></a>
### getBackupObject()

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

<a id="m-gettransvalidatecallbackproxys-ea8c2c00799a"></a>
### getTransValidateCallbackProxys(Object)

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

<a id="m-init-16fe8657859c"></a>
### init(DpTrans)

```java
public void init(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`

<a id="m-stop-1dfe2eb96fb9"></a>
### stop(DpTrans)

```java
public void stop(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
