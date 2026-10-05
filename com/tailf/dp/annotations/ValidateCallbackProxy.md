<a id="s-ValidateCallbackProxy"></a>
# ValidateCallbackProxy

```java
public class com.tailf.dp.annotations.ValidateCallbackProxy
    implements com.tailf.dp.DpValpointCallback
```

Types: [DpValpointCallback](../DpValpointCallback.md#s-DpValpointCallback)

Callback proxy for Validation Callbacks. Implements the
 [`DpValpointCallback`](../DpValpointCallback.md#s-DpValpointCallback) interface and delegates calls to the registered
 callback POJO with annotated methods

**Since:** 3.2.0

## Members

**Constructors**:

- [ValidateCallbackProxy(Object, String)](#s-ValidateCallbackProxy-1)

**Methods**:

- [addActionCapability(ValidateCBType)](#s-addActionCapability)
- [addActionMethod(String, Method)](#s-addActionMethod)
- [getBackupObject()](#s-getBackupObject)
- [getCallPoint()](#s-getCallPoint)
- [getValidateCallbackProxys(Object)](#s-getValidateCallbackProxys)
- [validate(DpTrans, ConfObject[], ConfValue)](#s-validate)
- [valpoint()](#s-valpoint)

## Constructors

<a id="s-ValidateCallbackProxy-1"></a>
### ValidateCallbackProxy(Object, String)

```java
public ValidateCallbackProxy(Object backupObject, String callPoint)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO
- `String callPoint` - string describing the callpoint for this callback


## Methods

<a id="s-addActionCapability"></a>
### addActionCapability(ValidateCBType)

```java
public void addActionCapability(com.tailf.dp.proto.ValidateCBType valCBType)
```

Types: [ValidateCBType](../proto/ValidateCBType.md#s-ValidateCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.ValidateCBType valCBType` - action type

<a id="s-addActionMethod"></a>
### addActionMethod(String, Method)

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

<a id="s-getBackupObject"></a>
### getBackupObject()

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

<a id="s-getCallPoint"></a>
### getCallPoint()

```java
public String getCallPoint()
```

Retrieve the callback callpoint

**Returns:** callpoint string

<a id="s-getValidateCallbackProxys"></a>
### getValidateCallbackProxys(Object)

```java
public static com.tailf.dp.annotations.ValidateCallbackProxy[] getValidateCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ValidateCallbackProxy](ValidateCallbackProxy.md#s-ValidateCallbackProxy), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of ValidateCallbackProxy

**Throws**

- `DpCallbackException`

<a id="s-validate"></a>
### validate(DpTrans, ConfObject[], ConfValue)

```java
public void validate(
    com.tailf.dp.DpTrans trans,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfValue newval
)
    throws com.tailf.dp.DpCallbackException, com.tailf.dp.DpCallbackWarningException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [ConfObject](../../conf/ConfObject.md#s-ConfObject), [ConfValue](../../conf/ConfValue.md#s-ConfValue), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException), [DpCallbackWarningException](../DpCallbackWarningException.md#s-DpCallbackWarningException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfValue newval`

<a id="s-valpoint"></a>
### valpoint()

```java
public String valpoint()
```
