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

*Description from* [`DpAuthorizationCallback.checkCommandAccess(com.tailf.dp.DpAuthorizationContext, String[], com.tailf.dp.AuthorizationOperCheck)`](../DpAuthorizationCallback.md#checkcommandaccess-db6891a729e3)

This callback is invoked for command authorization, i.e. it
 corresponds to the rules under /nacm/rule-list in the
 NACM data model. commandTokens is an String array of tokens
 representing the command to be checked, corresponding to
 the command leaf in the cmdrule list. If
 The operation parameter gives the operation, corresponding to
 the ops leaf in the cmdrule list.

**Parameters**

- `com.tailf.dp.DpAuthorizationContext context` - the authorization context
- `String[] commandTokens` - command represented as a string of tokens
- `com.tailf.dp.AuthorizationOperCheck operation` - AuthorizationOperCheck describing the operatopn type

**Returns:** AuthorizationResult the command access result

**Throws**

- `com.tailf.dp.DpCallbackException` - if an error occurs during the callback

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

*Description from* [`DpAuthorizationCallback.checkDataAccess(com.tailf.dp.DpAuthorizationContext, com.tailf.conf.ConfObject[], com.tailf.dp.AuthorizationOperCheck, com.tailf.dp.AuthorizationOperCheck)`](../DpAuthorizationCallback.md#checkdataaccess-e7c6a7d5a565)

This callback is invoked for data authorization, i.e. it
 corresponds to the rules under /nacm/rule-list in the
 NACM data model. The keypath parameter gives the data element path
 corresponding to the keypath leaf in the datarule list, and the
 operation parameter gives the operation type. The how parameter
 indicates whether the check is an intermediate or final check.

**Parameters**

- `com.tailf.dp.DpAuthorizationContext context` - the authorization context
- `com.tailf.conf.ConfObject[] kp` - the data element represented by an array of ConfObject
- `com.tailf.dp.AuthorizationOperCheck operation` - AuthorizationOperCheck describing the operation type
- `com.tailf.dp.AuthorizationOperCheck how` - checking state INTERMEDIATE or FINAL

**Returns:** AuthorizationResult the data access result

**Throws**

- `com.tailf.dp.DpCallbackException` - if an error occurs during the callback

### commandFilter() <a href="#commandfilter-75902bf3c954" id="commandfilter-75902bf3c954"></a>

```java
public java.util.EnumSet<com.tailf.dp.AuthorizationOperCheck> commandFilter()
```

Types: [AuthorizationOperCheck](../AuthorizationOperCheck.md#authorizationopercheck-7342d1a011a5)

*Description from* [`DpAuthorizationCallback.commandFilter()`](../DpAuthorizationCallback.md#commandfilter-75902bf3c954)

Thus method can be used to prevent access checks from causing invocation
 of a checkCommandAccess callback even though it is registered.
 If we do not want any filtering this method should not be registered or
 return null. For checkCommandAccess callback values INTERMEDIATE and
 FINAL does not contain any meaning.

**Returns:** EnumSet of AuthorizationOperCheck values

### dataFilter() <a href="#datafilter-5e19142fe25a" id="datafilter-5e19142fe25a"></a>

```java
public java.util.EnumSet<com.tailf.dp.AuthorizationOperCheck> dataFilter()
```

Types: [AuthorizationOperCheck](../AuthorizationOperCheck.md#authorizationopercheck-7342d1a011a5)

*Description from* [`DpAuthorizationCallback.dataFilter()`](../DpAuthorizationCallback.md#datafilter-5e19142fe25a)

Thus method can be used to prevent access checks from causing invocation
 of a checkDataAccess callback even though it is registered.
 If we do not want any filtering this method should not be registered or
 return null.

**Returns:** EnumSet of AuthorizationOperCheck values

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

- `com.tailf.dp.DpCallbackException`

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

*Description from* [`DpAuthorizationCallback.mask()`](../DpAuthorizationCallback.md#mask-24c2fa29c6af)

Mask of flags for each method that is supported by this callback:

- [`M_CHECK_CMD_ACCESS`](../DpAuthorizationCallback.md#m_check_cmd_access-e47eddd0f9b4)
- [`M_CHECK_DATA_ACCESS`](../DpAuthorizationCallback.md#m_check_data_access-62fe3a480427)

**Returns:** bitmask indicating which callback methods are supported
