# ValidateCallbackProxy <a href="#validatecallbackproxy-5b4cc6884dc1" id="validatecallbackproxy-5b4cc6884dc1"></a>

```java
public class com.tailf.dp.annotations.ValidateCallbackProxy
    implements com.tailf.dp.DpValpointCallback
```

Types: [DpValpointCallback](../DpValpointCallback.md#dpvalpointcallback-ee36356695e1)

Callback proxy for Validation Callbacks. Implements the
 [`DpValpointCallback`](../DpValpointCallback.md#dpvalpointcallback-ee36356695e1) interface and delegates calls to the registered
 callback POJO with annotated methods

**Since:** 3.2.0

## Members

**Constructors**:

- [ValidateCallbackProxy\(Object, String\)](#validatecallbackproxy-0ddbaa7c282d)

**Methods**:

- [addActionCapability\(ValidateCBType\)](#addactioncapability-2c606e9189d3)
- [addActionMethod\(String, Method\)](#addactionmethod-cf3e43a67fd9)
- [getBackupObject\(\)](#getbackupobject-a6fb23c24524)
- [getCallPoint\(\)](#getcallpoint-f816d0a44b26)
- [getValidateCallbackProxys\(Object\)](#getvalidatecallbackproxys-93663cbdace2)
- [validate\(DpTrans, ConfObject\[\], ConfValue\)](#validate-1a546d06dca5)
- [valpoint\(\)](#valpoint-a064c4954648)

## Constructors

### ValidateCallbackProxy(Object, String) <a href="#validatecallbackproxy-0ddbaa7c282d" id="validatecallbackproxy-0ddbaa7c282d"></a>

```java
public ValidateCallbackProxy(Object backupObject, String callPoint)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO
- `String callPoint` - string describing the callpoint for this callback


## Methods

### addActionCapability(ValidateCBType) <a href="#addactioncapability-2c606e9189d3" id="addactioncapability-2c606e9189d3"></a>

```java
public void addActionCapability(com.tailf.dp.proto.ValidateCBType valCBType)
```

Types: [ValidateCBType](../proto/ValidateCBType.md#validatecbtype-5b50c87e5fe9)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.ValidateCBType valCBType` - action type

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

### getCallPoint() <a href="#getcallpoint-f816d0a44b26" id="getcallpoint-f816d0a44b26"></a>

```java
public String getCallPoint()
```

Retrieve the callback callpoint

**Returns:** callpoint string

### getValidateCallbackProxys(Object) <a href="#getvalidatecallbackproxys-93663cbdace2" id="getvalidatecallbackproxys-93663cbdace2"></a>

```java
public static com.tailf.dp.annotations.ValidateCallbackProxy[] getValidateCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ValidateCallbackProxy](ValidateCallbackProxy.md#validatecallbackproxy-5b4cc6884dc1), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of ValidateCallbackProxy

**Throws**

- `DpCallbackException`

### validate(DpTrans, ConfObject[], ConfValue) <a href="#validate-1a546d06dca5" id="validate-1a546d06dca5"></a>

```java
public void validate(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfValue newval
)
    throws com.tailf.dp.DpCallbackException, com.tailf.dp.DpCallbackWarningException
```

Types: [DpTrans](../DpTrans.md#dptrans-bf19458d92ec), [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [ConfValue](../../conf/ConfValue.md#confvalue-769292781c7d), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb), [DpCallbackWarningException](../DpCallbackWarningException.md#dpcallbackwarningexception-82a350729169)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfValue newval`

### valpoint() <a href="#valpoint-a064c4954648" id="valpoint-a064c4954648"></a>

```java
public String valpoint()
```
