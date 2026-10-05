<a id="cls-AuthCallbackProxy"></a>
# AuthCallbackProxy

```java
public class com.tailf.dp.annotations.AuthCallbackProxy
    implements com.tailf.dp.DpAuthCallback
```

Types: [DpAuthCallback](../DpAuthCallback.md#cls-DpAuthCallback)

Callback proxy for Authorization Callbacks.
 Implements the [`DpAuthCallback`](../DpAuthCallback.md#cls-DpAuthCallback) interface and delegates calls to the
 registered callback POJO with annotated methods

## Members

**Constructors**:

- [AuthCallbackProxy(Object)](#m-authcallbackproxy-45ee0efcea28)

**Methods**:

- [addActionCapability(AuthCBType)](#m-addactioncapability-833edf722d4a)
- [addActionMethod(String, Method)](#m-addactionmethod-cf3e43a67fd9)
- [auth(DpAuthContext)](#m-auth-34bd42ec3143)
- [getAuthCallbackProxys(Object)](#m-getauthcallbackproxys-4fdb572f55a0)
- [getBackupObject()](#m-getbackupobject-a6fb23c24524)

## Constructors

<a id="m-authcallbackproxy-45ee0efcea28"></a>
### AuthCallbackProxy(Object)

```java
public AuthCallbackProxy(Object backupObject)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - the registered callback POJO


## Methods

<a id="m-addactioncapability-833edf722d4a"></a>
### addActionCapability(AuthCBType)

```java
public void addActionCapability(com.tailf.dp.proto.AuthCBType authCBType)
```

Types: [AuthCBType](../proto/AuthCBType.md#cls-AuthCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.AuthCBType authCBType` - the authentication callback type to add

<a id="m-addactionmethod-cf3e43a67fd9"></a>
### addActionMethod(String, Method)

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - the canonical method name
- `java.lang.reflect.Method method` - the callback method to register

<a id="m-auth-34bd42ec3143"></a>
### auth(DpAuthContext)

```java
public boolean auth(com.tailf.dp.DpAuthContext atx) throws com.tailf.dp.DpCallbackException
```

Types: [DpAuthContext](../DpAuthContext.md#cls-DpAuthContext), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

Delegates authentication callback to the registered POJO method.

**Parameters**

- `com.tailf.dp.DpAuthContext atx` - the authentication context

**Returns:** true if authentication should succeed, false otherwise

**Throws**

- `DpCallbackException` - if the callback fails or is not implemented

<a id="m-getauthcallbackproxys-4fdb572f55a0"></a>
### getAuthCallbackProxys(Object)

```java
public static com.tailf.dp.annotations.AuthCallbackProxy[] getAuthCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [AuthCallbackProxy](AuthCallbackProxy.md#cls-AuthCallbackProxy), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

Get array of proxy objects from registered POJO callback.
 Used internally at callback registration

**Parameters**

- `Object obj` - the registered callback POJO

**Returns:** array of authentication callback proxies

**Throws**

- `DpCallbackException` - if method signatures don't match or
                             annotation is invalid

<a id="m-getbackupobject-a6fb23c24524"></a>
### getBackupObject()

```java
public Object getBackupObject()
```

Retrieve the callback POJO.

**Returns:** the registered callback object
