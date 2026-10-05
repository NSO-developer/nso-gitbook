<a id="cls-AuthorizationCallbackProxy"></a>
# AuthorizationCallbackProxy

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

- [AuthorizationCallbackProxy(Object)](#m-authorizationcallbackproxy-7ede8d1c2000)

**Fields**:

- [M_CHECK_CMD_ACCESS](../DpAuthorizationCallback.md#m-M_CHECK_CMD_ACCESS) from DpAuthorizationCallback
- [M_CHECK_DATA_ACCESS](../DpAuthorizationCallback.md#m-M_CHECK_DATA_ACCESS) from DpAuthorizationCallback

**Methods**:

- [addActionCapability(AuthorizationCBType)](#m-addactioncapability-e39732677c1f)
- [addActionMethod(String, Method)](#m-addactionmethod-cf3e43a67fd9)
- [checkCommandAccess(DpAuthorizationContext, String[], AuthorizationOperCheck)](#m-checkcommandaccess-db6891a729e3)
- [checkDataAccess(DpAuthorizationContext, ConfObject[], AuthorizationOperCheck, AuthorizationOperCheck)](#m-checkdataaccess-e7c6a7d5a565)
- [commandFilter()](#m-commandfilter-75902bf3c954)
- [dataFilter()](#m-datafilter-5e19142fe25a)
- [getAuthorizationCallbackProxys(Object)](#m-getauthorizationcallbackproxys-e3cad5454283)
- [getBackupObject()](#m-getbackupobject-a6fb23c24524)
- [mask()](#m-mask-24c2fa29c6af)

## Constructors

<a id="m-authorizationcallbackproxy-7ede8d1c2000"></a>
### AuthorizationCallbackProxy(Object)

```java
public AuthorizationCallbackProxy(Object backupObject)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO


## Methods

<a id="m-addactioncapability-e39732677c1f"></a>
### addActionCapability(AuthorizationCBType)

```java
public void addActionCapability(com.tailf.dp.proto.AuthorizationCBType authorizationCBType)
```

Types: [AuthorizationCBType](../proto/AuthorizationCBType.md#cls-AuthorizationCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.AuthorizationCBType authorizationCBType` - action type

<a id="m-addactionmethod-cf3e43a67fd9"></a>
### addActionMethod(String, Method)

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

<a id="m-checkcommandaccess-db6891a729e3"></a>
### checkCommandAccess(DpAuthorizationContext, String[], AuthorizationOperCheck)

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

<a id="m-checkdataaccess-e7c6a7d5a565"></a>
### checkDataAccess(DpAuthorizationContext, ConfObject[], AuthorizationOperCheck, AuthorizationOperCheck)

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

<a id="m-commandfilter-75902bf3c954"></a>
### commandFilter()

```java
public java.util.EnumSet<com.tailf.dp.AuthorizationOperCheck> commandFilter()
```

Types: [AuthorizationOperCheck](../AuthorizationOperCheck.md#cls-AuthorizationOperCheck)

<a id="m-datafilter-5e19142fe25a"></a>
### dataFilter()

```java
public java.util.EnumSet<com.tailf.dp.AuthorizationOperCheck> dataFilter()
```

Types: [AuthorizationOperCheck](../AuthorizationOperCheck.md#cls-AuthorizationOperCheck)

<a id="m-getauthorizationcallbackproxys-e3cad5454283"></a>
### getAuthorizationCallbackProxys(Object)

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

<a id="m-getbackupobject-a6fb23c24524"></a>
### getBackupObject()

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

<a id="m-mask-24c2fa29c6af"></a>
### mask()

```java
public int mask()
```
