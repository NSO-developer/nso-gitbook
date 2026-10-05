# AuthorizationCallbackProxy <a href="#authorizationcallbackproxy-8824c10c8e1e" id="authorizationcallbackproxy-8824c10c8e1e"></a>

```java
public class com.tailf.dp.annotations.AuthorizationCallbackProxy
    implements com.tailf.dp.DpAuthorizationCallback
```

Types: [DpAuthorizationCallback](../DpAuthorizationCallback.md#dpauthorizationcallback-44fc33b19351)

Callback proxy for Authorization Callbacks.
 Implements the [`DpAuthorizationCallback`](../DpAuthorizationCallback.md#dpauthorizationcallback-44fc33b19351) interface and delegates calls
 to the registered callback POJO with annotated methods

## Members

**Constructors**:

- [AuthorizationCallbackProxy\(Object\)](#authorizationcallbackproxy-7ede8d1c2000)

**Fields**:

- [M\_CHECK\_CMD\_ACCESS](../DpAuthorizationCallback.md#m_check_cmd_access-e47eddd0f9b4) from DpAuthorizationCallback
- [M\_CHECK\_DATA\_ACCESS](../DpAuthorizationCallback.md#m_check_data_access-62fe3a480427) from DpAuthorizationCallback

**Methods**:

- [addActionCapability\(AuthorizationCBType\)](#addactioncapability-e39732677c1f)
- [addActionMethod\(String, Method\)](#addactionmethod-cf3e43a67fd9)
- [checkCommandAccess\(DpAuthorizationContext, String\[\], AuthorizationOperCheck\)](#checkcommandaccess-db6891a729e3)
- [checkDataAccess\(DpAuthorizationContext, ConfObject\[\], AuthorizationOperCheck, AuthorizationOperCheck\)](#checkdataaccess-e7c6a7d5a565)
- [commandFilter\(\)](#commandfilter-75902bf3c954)
- [dataFilter\(\)](#datafilter-5e19142fe25a)
- [getAuthorizationCallbackProxys\(Object\)](#getauthorizationcallbackproxys-e3cad5454283)
- [getBackupObject\(\)](#getbackupobject-a6fb23c24524)
- [mask\(\)](#mask-24c2fa29c6af)

## Constructors

### AuthorizationCallbackProxy(Object) <a href="#authorizationcallbackproxy-7ede8d1c2000" id="authorizationcallbackproxy-7ede8d1c2000"></a>

```java
public AuthorizationCallbackProxy(Object backupObject)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO


## Methods

### addActionCapability(AuthorizationCBType) <a href="#addactioncapability-e39732677c1f" id="addactioncapability-e39732677c1f"></a>

```java
public void addActionCapability(com.tailf.dp.proto.AuthorizationCBType authorizationCBType)
```

Types: [AuthorizationCBType](../proto/AuthorizationCBType.md#authorizationcbtype-53c148cac4cd)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.AuthorizationCBType authorizationCBType` - action type

### addActionMethod(String, Method) <a href="#addactionmethod-cf3e43a67fd9" id="addactionmethod-cf3e43a67fd9"></a>

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

### checkCommandAccess(DpAuthorizationContext, String[], AuthorizationOperCheck) <a href="#checkcommandaccess-db6891a729e3" id="checkcommandaccess-db6891a729e3"></a>

```java
public com.tailf.dp.AuthorizationResult checkCommandAccess(
    com.tailf.dp.DpAuthorizationContext context,
    String[] commandTokens,
    com.tailf.dp.AuthorizationOperCheck operation
)
    throws com.tailf.dp.DpCallbackException
```

Types: [AuthorizationResult](../AuthorizationResult.md#authorizationresult-118ce0a72969), [DpAuthorizationContext](../DpAuthorizationContext.md#dpauthorizationcontext-e368a48474b6), [AuthorizationOperCheck](../AuthorizationOperCheck.md#authorizationopercheck-7342d1a011a5), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpAuthorizationContext context`
- `String[] commandTokens`
- `com.tailf.dp.AuthorizationOperCheck operation`

### checkDataAccess(DpAuthorizationContext, ConfObject[], AuthorizationOperCheck, AuthorizationOperCheck) <a href="#checkdataaccess-e7c6a7d5a565" id="checkdataaccess-e7c6a7d5a565"></a>

```java
public com.tailf.dp.AuthorizationResult checkDataAccess(
    com.tailf.dp.DpAuthorizationContext context,
    com.tailf.conf.ConfObject[] kp,
    com.tailf.dp.AuthorizationOperCheck operation,
    com.tailf.dp.AuthorizationOperCheck how
)
    throws com.tailf.dp.DpCallbackException
```

Types: [AuthorizationResult](../AuthorizationResult.md#authorizationresult-118ce0a72969), [DpAuthorizationContext](../DpAuthorizationContext.md#dpauthorizationcontext-e368a48474b6), [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2), [AuthorizationOperCheck](../AuthorizationOperCheck.md#authorizationopercheck-7342d1a011a5), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.DpAuthorizationContext context`
- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.dp.AuthorizationOperCheck operation`
- `com.tailf.dp.AuthorizationOperCheck how`

### commandFilter() <a href="#commandfilter-75902bf3c954" id="commandfilter-75902bf3c954"></a>

```java
public java.util.EnumSet<com.tailf.dp.AuthorizationOperCheck> commandFilter()
```

Types: [AuthorizationOperCheck](../AuthorizationOperCheck.md#authorizationopercheck-7342d1a011a5)

### dataFilter() <a href="#datafilter-5e19142fe25a" id="datafilter-5e19142fe25a"></a>

```java
public java.util.EnumSet<com.tailf.dp.AuthorizationOperCheck> dataFilter()
```

Types: [AuthorizationOperCheck](../AuthorizationOperCheck.md#authorizationopercheck-7342d1a011a5)

### getAuthorizationCallbackProxys(Object) <a href="#getauthorizationcallbackproxys-e3cad5454283" id="getauthorizationcallbackproxys-e3cad5454283"></a>

```java
public static com.tailf.dp.annotations.AuthorizationCallbackProxy[] getAuthorizationCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [AuthorizationCallbackProxy](AuthorizationCallbackProxy.md#authorizationcallbackproxy-8824c10c8e1e), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of DBCallbackProxy

**Throws**

- `DpCallbackException`

### getBackupObject() <a href="#getbackupobject-a6fb23c24524" id="getbackupobject-a6fb23c24524"></a>

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

### mask() <a href="#mask-24c2fa29c6af" id="mask-24c2fa29c6af"></a>

```java
public int mask()
```
