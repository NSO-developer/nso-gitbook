<a id="cls-ValidateCallbackProxy"></a>
# ValidateCallbackProxy

```java
public class com.tailf.dp.annotations.ValidateCallbackProxy
    implements com.tailf.dp.DpValpointCallback
```

Types: [DpValpointCallback](../DpValpointCallback.md#cls-DpValpointCallback)

Callback proxy for Validation Callbacks. Implements the
 [`DpValpointCallback`](../DpValpointCallback.md#cls-DpValpointCallback) interface and delegates calls to the registered
 callback POJO with annotated methods

**Since:** 3.2.0

## Members

**Constructors**:

- [ValidateCallbackProxy(Object, String)](#m-validatecallbackproxy-0ddbaa7c282d)

**Methods**:

- [addActionCapability(ValidateCBType)](#m-addactioncapability-2c606e9189d3)
- [addActionMethod(String, Method)](#m-addactionmethod-cf3e43a67fd9)
- [getBackupObject()](#m-getbackupobject-a6fb23c24524)
- [getCallPoint()](#m-getcallpoint-f816d0a44b26)
- [getValidateCallbackProxys(Object)](#m-getvalidatecallbackproxys-93663cbdace2)
- [validate(DpTrans, ConfObject[], ConfValue)](#m-validate-1a546d06dca5)
- [valpoint()](#m-valpoint-a064c4954648)

## Constructors

<a id="m-validatecallbackproxy-0ddbaa7c282d"></a>
### ValidateCallbackProxy(Object, String)

```java
public ValidateCallbackProxy(Object backupObject, String callPoint)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO
- `String callPoint` - string describing the callpoint for this callback


## Methods

<a id="m-addactioncapability-2c606e9189d3"></a>
### addActionCapability(ValidateCBType)

```java
public void addActionCapability(com.tailf.dp.proto.ValidateCBType valCBType)
```

Types: [ValidateCBType](../proto/ValidateCBType.md#cls-ValidateCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.ValidateCBType valCBType` - action type

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

<a id="m-getcallpoint-f816d0a44b26"></a>
### getCallPoint()

```java
public String getCallPoint()
```

Retrieve the callback callpoint

**Returns:** callpoint string

<a id="m-getvalidatecallbackproxys-93663cbdace2"></a>
### getValidateCallbackProxys(Object)

```java
public static com.tailf.dp.annotations.ValidateCallbackProxy[] getValidateCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ValidateCallbackProxy](ValidateCallbackProxy.md#cls-ValidateCallbackProxy), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of ValidateCallbackProxy

**Throws**

- `DpCallbackException`

<a id="m-validate-1a546d06dca5"></a>
### validate(DpTrans, ConfObject[], ConfValue)

```java
public void validate(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfValue newval
)
    throws com.tailf.dp.DpCallbackException, com.tailf.dp.DpCallbackWarningException
```

Types: [DpTrans](../DpTrans.md#cls-DpTrans), [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [ConfValue](../../conf/ConfValue.md#cls-ConfValue), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException), [DpCallbackWarningException](../DpCallbackWarningException.md#cls-DpCallbackWarningException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfValue newval`

<a id="m-valpoint-a064c4954648"></a>
### valpoint()

```java
public String valpoint()
```
