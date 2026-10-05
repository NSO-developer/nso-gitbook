# AuthorizationCallbackProxy <a href="#cls-AuthorizationCallbackProxy" id="cls-AuthorizationCallbackProxy"></a>

```java
public class com.tailf.dp.annotations.AuthorizationCallbackProxy
    implements com.tailf.dp.DpAuthorizationCallback
```

Types: [DpAuthorizationCallback](../DpAuthorizationCallback.md#cls-DpAuthorizationCallback)

Callback proxy for Authorization Callbacks.
 Implements the [`DpAuthorizationCallback`](../DpAuthorizationCallback.md#cls-DpAuthorizationCallback) interface and delegates calls
 to the registered callback POJO with annotated methods

## Members

**Constructors**:

- [AuthorizationCallbackProxy(Object)](#m-AuthorizationCallbackProxy-7ede8d1c2000)

**Fields**:

- [M_CHECK_CMD_ACCESS](../DpAuthorizationCallback.md#m-M_CHECK_CMD_ACCESS) from DpAuthorizationCallback
- [M_CHECK_DATA_ACCESS](../DpAuthorizationCallback.md#m-M_CHECK_DATA_ACCESS) from DpAuthorizationCallback

**Methods**:

- [addActionCapability(AuthorizationCBType)](#m-addActionCapability-e39732677c1f)
- [addActionMethod(String, Method)](#m-addActionMethod-cf3e43a67fd9)
- [checkCommandAccess(DpAuthorizationContext, String[], AuthorizationOperCheck)](#m-checkCommandAccess-db6891a729e3)
- [checkDataAccess(DpAuthorizationContext, ConfObject[], AuthorizationOperCheck, AuthorizationOperCheck)](#m-checkDataAccess-e7c6a7d5a565)
- [commandFilter()](#m-commandFilter-75902bf3c954)
- [dataFilter()](#m-dataFilter-5e19142fe25a)
- [getAuthorizationCallbackProxys(Object)](#m-getAuthorizationCallbackProxys-e3cad5454283)
- [getBackupObject()](#m-getBackupObject-a6fb23c24524)
- [mask()](#m-mask-24c2fa29c6af)

## Constructors

### AuthorizationCallbackProxy(Object) <a href="#m-AuthorizationCallbackProxy-7ede8d1c2000" id="m-AuthorizationCallbackProxy-7ede8d1c2000"></a>

```java
public AuthorizationCallbackProxy(Object backupObject)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO


## Methods

### addActionCapability(AuthorizationCBType) <a href="#m-addActionCapability-e39732677c1f" id="m-addActionCapability-e39732677c1f"></a>

```java
public void addActionCapability(com.tailf.dp.proto.AuthorizationCBType authorizationCBType)
```

Types: [AuthorizationCBType](../proto/AuthorizationCBType.md#cls-AuthorizationCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.AuthorizationCBType authorizationCBType` - action type

### addActionMethod(String, Method) <a href="#m-addActionMethod-cf3e43a67fd9" id="m-addActionMethod-cf3e43a67fd9"></a>

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

### checkCommandAccess(DpAuthorizationContext, String[], AuthorizationOperCheck) <a href="#m-checkCommandAccess-db6891a729e3" id="m-checkCommandAccess-db6891a729e3"></a>

```java
public com.tailf.dp.AuthorizationResult checkCommandAccess(
    com.tailf.dp.DpAuthorizationContext context,
    String[] commandTokens,
    com.tailf.dp.AuthorizationOperCheck operation
)
    throws com.tailf.dp.DpCallbackException
```

Types: [AuthorizationResult](../AuthorizationResult.md#cls-AuthorizationResult), [DpAuthorizationContext](../DpAuthorizationContext.md#cls-DpAuthorizationContext), [AuthorizationOperCheck](../AuthorizationOperCheck.md#cls-AuthorizationOperCheck), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpAuthorizationContext context`
- `String[] commandTokens`
- `com.tailf.dp.AuthorizationOperCheck operation`

### checkDataAccess(DpAuthorizationContext, ConfObject[], AuthorizationOperCheck, AuthorizationOperCheck) <a href="#m-checkDataAccess-e7c6a7d5a565" id="m-checkDataAccess-e7c6a7d5a565"></a>

```java
public com.tailf.dp.AuthorizationResult checkDataAccess(
    com.tailf.dp.DpAuthorizationContext context,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.dp.AuthorizationOperCheck operation,
    com.tailf.dp.AuthorizationOperCheck how
)
    throws com.tailf.dp.DpCallbackException
```

Types: [AuthorizationResult](../AuthorizationResult.md#cls-AuthorizationResult), [DpAuthorizationContext](../DpAuthorizationContext.md#cls-DpAuthorizationContext), [ConfObject](../../conf/ConfObject.md#cls-ConfObject), [AuthorizationOperCheck](../AuthorizationOperCheck.md#cls-AuthorizationOperCheck), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpAuthorizationContext context`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.dp.AuthorizationOperCheck operation`
- `com.tailf.dp.AuthorizationOperCheck how`

### commandFilter() <a href="#m-commandFilter-75902bf3c954" id="m-commandFilter-75902bf3c954"></a>

```java
public java.util.EnumSet<com.tailf.dp.AuthorizationOperCheck> commandFilter()
```

Types: [AuthorizationOperCheck](../AuthorizationOperCheck.md#cls-AuthorizationOperCheck)

### dataFilter() <a href="#m-dataFilter-5e19142fe25a" id="m-dataFilter-5e19142fe25a"></a>

```java
public java.util.EnumSet<com.tailf.dp.AuthorizationOperCheck> dataFilter()
```

Types: [AuthorizationOperCheck](../AuthorizationOperCheck.md#cls-AuthorizationOperCheck)

### getAuthorizationCallbackProxys(Object) <a href="#m-getAuthorizationCallbackProxys-e3cad5454283" id="m-getAuthorizationCallbackProxys-e3cad5454283"></a>

```java
public static com.tailf.dp.annotations.AuthorizationCallbackProxy[] getAuthorizationCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [AuthorizationCallbackProxy](AuthorizationCallbackProxy.md#cls-AuthorizationCallbackProxy), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of DBCallbackProxy

**Throws**

- `DpCallbackException`

### getBackupObject() <a href="#m-getBackupObject-a6fb23c24524" id="m-getBackupObject-a6fb23c24524"></a>

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

### mask() <a href="#m-mask-24c2fa29c6af" id="m-mask-24c2fa29c6af"></a>

```java
public int mask()
```
