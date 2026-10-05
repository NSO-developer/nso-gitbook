# ValidateCallbackProxy <a href="#cls-ValidateCallbackProxy" id="cls-ValidateCallbackProxy"></a>

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

- [ValidateCallbackProxy(Object, String)](#m-ValidateCallbackProxy-0ddbaa7c282d)

**Methods**:

- [addActionCapability(ValidateCBType)](#m-addActionCapability-2c606e9189d3)
- [addActionMethod(String, Method)](#m-addActionMethod-cf3e43a67fd9)
- [getBackupObject()](#m-getBackupObject-a6fb23c24524)
- [getCallPoint()](#m-getCallPoint-f816d0a44b26)
- [getValidateCallbackProxys(Object)](#m-getValidateCallbackProxys-93663cbdace2)
- [validate(DpTrans, ConfObject[], ConfValue)](#m-validate-1a546d06dca5)
- [valpoint()](#m-valpoint-a064c4954648)

## Constructors

### ValidateCallbackProxy(Object, String) <a href="#m-ValidateCallbackProxy-0ddbaa7c282d" id="m-ValidateCallbackProxy-0ddbaa7c282d"></a>

```java
public ValidateCallbackProxy(Object backupObject, String callPoint)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO
- `String callPoint` - string describing the callpoint for this callback


## Methods

### addActionCapability(ValidateCBType) <a href="#m-addActionCapability-2c606e9189d3" id="m-addActionCapability-2c606e9189d3"></a>

```java
public void addActionCapability(com.tailf.dp.proto.ValidateCBType valCBType)
```

Types: [ValidateCBType](../proto/ValidateCBType.md#cls-ValidateCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.ValidateCBType valCBType` - action type

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

### getCallPoint() <a href="#m-getCallPoint-f816d0a44b26" id="m-getCallPoint-f816d0a44b26"></a>

```java
public String getCallPoint()
```

Retrieve the callback callpoint

**Returns:** callpoint string

### getValidateCallbackProxys(Object) <a href="#m-getValidateCallbackProxys-93663cbdace2" id="m-getValidateCallbackProxys-93663cbdace2"></a>

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

### validate(DpTrans, ConfObject[], ConfValue) <a href="#m-validate-1a546d06dca5" id="m-validate-1a546d06dca5"></a>

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

### valpoint() <a href="#m-valpoint-a064c4954648" id="m-valpoint-a064c4954648"></a>

```java
public String valpoint()
```
