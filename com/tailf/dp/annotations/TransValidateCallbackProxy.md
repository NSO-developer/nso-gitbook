<a id="s-TransValidateCallbackProxy"></a>
# TransValidateCallbackProxy

```java
public class com.tailf.dp.annotations.TransValidateCallbackProxy
    implements com.tailf.dp.DpTransValidateCallback
```

Types: [DpTransValidateCallback](../DpTransValidateCallback.md#s-DpTransValidateCallback)

Callback proxy for TransValidate Callbacks. Implements the
 [`DpTransValidateCallback`](../DpTransValidateCallback.md#s-DpTransValidateCallback) interface and delegates calls to the
 registered callback POJO with annotated methods

## Members

**Constructors**:

- [TransValidateCallbackProxy(Object)](#s-TransValidateCallbackProxy-1)

**Methods**:

- [addActionCapability(TransValidateCBType)](#s-addActionCapability)
- [addActionMethod(String, Method)](#s-addActionMethod)
- [getBackupObject()](#s-getBackupObject)
- [getTransValidateCallbackProxys(Object)](#s-getTransValidateCallbackProxys)
- [init(DpTrans)](#s-init)
- [stop(DpTrans)](#s-stop)

## Constructors

<a id="s-TransValidateCallbackProxy-1"></a>
### TransValidateCallbackProxy(Object)

```java
public TransValidateCallbackProxy(Object backupObject)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO


## Methods

<a id="s-addActionCapability"></a>
### addActionCapability(TransValidateCBType)

```java
public void addActionCapability(com.tailf.dp.proto.TransValidateCBType transValidCBType)
```

Types: [TransValidateCBType](../proto/TransValidateCBType.md#s-TransValidateCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.TransValidateCBType transValidCBType` - action type

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

<a id="s-getTransValidateCallbackProxys"></a>
### getTransValidateCallbackProxys(Object)

```java
public static com.tailf.dp.annotations.TransValidateCallbackProxy[] getTransValidateCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [TransValidateCallbackProxy](TransValidateCallbackProxy.md#s-TransValidateCallbackProxy), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of TransValidateCallbackProxy

**Throws**

- `DpCallbackException`

<a id="s-init"></a>
### init(DpTrans)

```java
public void init(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`

<a id="s-stop"></a>
### stop(DpTrans)

```java
public void stop(com.tailf.dp.DpTrans trans) throws com.tailf.dp.DpCallbackException
```

Types: [DpTrans](../DpTrans.md#s-DpTrans), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpTrans trans`
