# AuthCallbackProxy <a href="#authcallbackproxy-476912f068a7" id="authcallbackproxy-476912f068a7"></a>

```java
public class com.tailf.dp.annotations.AuthCallbackProxy
    implements com.tailf.dp.DpAuthCallback
```

Types: [DpAuthCallback](../DpAuthCallback.md#dpauthcallback-207995250502)

Callback proxy for Authorization Callbacks.
 Implements the [`DpAuthCallback`](../DpAuthCallback.md#dpauthcallback-207995250502) interface and delegates calls to the
 registered callback POJO with annotated methods

## Members

**Constructors**:

- [AuthCallbackProxy(Object)](#authcallbackproxy-45ee0efcea28)

**Methods**:

- [addActionCapability(AuthCBType)](#addactioncapability-833edf722d4a)
- [addActionMethod(String, Method)](#addactionmethod-cf3e43a67fd9)
- [auth(DpAuthContext)](#auth-34bd42ec3143)
- [getAuthCallbackProxys(Object)](#getauthcallbackproxys-4fdb572f55a0)
- [getBackupObject()](#getbackupobject-a6fb23c24524)

## Constructors

### AuthCallbackProxy(Object) <a href="#authcallbackproxy-45ee0efcea28" id="authcallbackproxy-45ee0efcea28"></a>

```java
public AuthCallbackProxy(Object backupObject)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - the registered callback POJO


## Methods

### addActionCapability(AuthCBType) <a href="#addactioncapability-833edf722d4a" id="addactioncapability-833edf722d4a"></a>

```java
public void addActionCapability(com.tailf.dp.proto.AuthCBType authCBType)
```

Types: [AuthCBType](../proto/AuthCBType.md#authcbtype-5bd4ee208ec6)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.AuthCBType authCBType` - the authentication callback type to add

### addActionMethod(String, Method) <a href="#addactionmethod-cf3e43a67fd9" id="addactionmethod-cf3e43a67fd9"></a>

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - the canonical method name
- `java.lang.reflect.Method method` - the callback method to register

### auth(DpAuthContext) <a href="#auth-34bd42ec3143" id="auth-34bd42ec3143"></a>

```java
public boolean auth(com.tailf.dp.DpAuthContext atx) throws com.tailf.dp.DpCallbackException
```

Types: [DpAuthContext](../DpAuthContext.md#dpauthcontext-74214c38995b), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

Delegates authentication callback to the registered POJO method.

**Parameters**

- `com.tailf.dp.DpAuthContext atx` - the authentication context

**Returns:** true if authentication should succeed, false otherwise

**Throws**

- `DpCallbackException` - if the callback fails or is not implemented

### getAuthCallbackProxys(Object) <a href="#getauthcallbackproxys-4fdb572f55a0" id="getauthcallbackproxys-4fdb572f55a0"></a>

```java
public static com.tailf.dp.annotations.AuthCallbackProxy[] getAuthCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [AuthCallbackProxy](AuthCallbackProxy.md#authcallbackproxy-476912f068a7), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

Get array of proxy objects from registered POJO callback.
 Used internally at callback registration

**Parameters**

- `Object obj` - the registered callback POJO

**Returns:** array of authentication callback proxies

**Throws**

- `DpCallbackException` - if method signatures don't match or
                             annotation is invalid

### getBackupObject() <a href="#getbackupobject-a6fb23c24524" id="getbackupobject-a6fb23c24524"></a>

```java
public Object getBackupObject()
```

Retrieve the callback POJO.

**Returns:** the registered callback object
