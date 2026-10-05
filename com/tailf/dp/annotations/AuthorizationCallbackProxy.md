<a id="s-AuthorizationCallbackProxy"></a>
# AuthorizationCallbackProxy

```java
public class com.tailf.dp.annotations.AuthorizationCallbackProxy
    implements com.tailf.dp.DpAuthorizationCallback
```

Types: [DpAuthorizationCallback](../DpAuthorizationCallback.md#s-DpAuthorizationCallback)

Callback proxy for Authorization Callbacks.
 Implements the [`DpAuthorizationCallback`](../DpAuthorizationCallback.md#s-DpAuthorizationCallback) interface and delegates calls
 to the registered callback POJO with annotated methods

## Members

**Constructors**:

- [AuthorizationCallbackProxy(Object)](#s-AuthorizationCallbackProxy-1)

**Fields**:

- [M_CHECK_CMD_ACCESS](../DpAuthorizationCallback.md#s-M_CHECK_CMD_ACCESS) from DpAuthorizationCallback
- [M_CHECK_DATA_ACCESS](../DpAuthorizationCallback.md#s-M_CHECK_DATA_ACCESS) from DpAuthorizationCallback

**Methods**:

- [addActionCapability(AuthorizationCBType)](#s-addActionCapability)
- [addActionMethod(String, Method)](#s-addActionMethod)
- [checkCommandAccess(DpAuthorizationContext, String[], AuthorizationOperCheck)](#s-checkCommandAccess)
- [checkDataAccess(DpAuthorizationContext, ConfObject[], AuthorizationOperCheck, AuthorizationOperCheck)](#s-checkDataAccess)
- [commandFilter()](#s-commandFilter)
- [dataFilter()](#s-dataFilter)
- [getAuthorizationCallbackProxys(Object)](#s-getAuthorizationCallbackProxys)
- [getBackupObject()](#s-getBackupObject)
- [mask()](#s-mask)

## Constructors

<a id="s-AuthorizationCallbackProxy-1"></a>
### AuthorizationCallbackProxy(Object)

```java
public AuthorizationCallbackProxy(Object backupObject)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO


## Methods

<a id="s-addActionCapability"></a>
### addActionCapability(AuthorizationCBType)

```java
public void addActionCapability(com.tailf.dp.proto.AuthorizationCBType authorizationCBType)
```

Types: [AuthorizationCBType](../proto/AuthorizationCBType.md#s-AuthorizationCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.AuthorizationCBType authorizationCBType` - action type

<a id="s-addActionMethod"></a>
### addActionMethod(String, Method)

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

<a id="s-checkCommandAccess"></a>
### checkCommandAccess(DpAuthorizationContext, String[], AuthorizationOperCheck)

```java
public com.tailf.dp.AuthorizationResult checkCommandAccess(
    com.tailf.dp.DpAuthorizationContext context,
    String[] commandTokens,
    com.tailf.dp.AuthorizationOperCheck operation
)
    throws com.tailf.dp.DpCallbackException
```

Types: [AuthorizationResult](../AuthorizationResult.md#s-AuthorizationResult), [DpAuthorizationContext](../DpAuthorizationContext.md#s-DpAuthorizationContext), [AuthorizationOperCheck](../AuthorizationOperCheck.md#s-AuthorizationOperCheck), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpAuthorizationContext context`
- `String[] commandTokens`
- `com.tailf.dp.AuthorizationOperCheck operation`

<a id="s-checkDataAccess"></a>
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

Types: [AuthorizationResult](../AuthorizationResult.md#s-AuthorizationResult), [DpAuthorizationContext](../DpAuthorizationContext.md#s-DpAuthorizationContext), [ConfObject](../../conf/ConfObject.md#s-ConfObject), [AuthorizationOperCheck](../AuthorizationOperCheck.md#s-AuthorizationOperCheck), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `com.tailf.dp.DpAuthorizationContext context`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.dp.AuthorizationOperCheck operation`
- `com.tailf.dp.AuthorizationOperCheck how`

<a id="s-commandFilter"></a>
### commandFilter()

```java
public java.util.EnumSet<com.tailf.dp.AuthorizationOperCheck> commandFilter()
```

Types: [AuthorizationOperCheck](../AuthorizationOperCheck.md#s-AuthorizationOperCheck)

<a id="s-dataFilter"></a>
### dataFilter()

```java
public java.util.EnumSet<com.tailf.dp.AuthorizationOperCheck> dataFilter()
```

Types: [AuthorizationOperCheck](../AuthorizationOperCheck.md#s-AuthorizationOperCheck)

<a id="s-getAuthorizationCallbackProxys"></a>
### getAuthorizationCallbackProxys(Object)

```java
public static com.tailf.dp.annotations.AuthorizationCallbackProxy[] getAuthorizationCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [AuthorizationCallbackProxy](AuthorizationCallbackProxy.md#s-AuthorizationCallbackProxy), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of DBCallbackProxy

**Throws**

- `DpCallbackException`

<a id="s-getBackupObject"></a>
### getBackupObject()

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

<a id="s-mask"></a>
### mask()

```java
public int mask()
```
