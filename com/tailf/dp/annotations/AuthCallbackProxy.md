<a id="s-AuthCallbackProxy"></a>
# AuthCallbackProxy

```java
public class com.tailf.dp.annotations.AuthCallbackProxy
    implements com.tailf.dp.DpAuthCallback
```

Types: [DpAuthCallback](../DpAuthCallback.md#s-DpAuthCallback)

Callback proxy for Authorization Callbacks.
 Implements the [`DpAuthCallback`](../DpAuthCallback.md#s-DpAuthCallback) interface and delegates calls to the
 registered callback POJO with annotated methods

## Members

**Constructors**:

- [AuthCallbackProxy(Object)](#s-AuthCallbackProxy-1)

**Methods**:

- [addActionCapability(AuthCBType)](#s-addActionCapability)
- [addActionMethod(String, Method)](#s-addActionMethod)
- [auth(DpAuthContext)](#s-auth)
- [getAuthCallbackProxys(Object)](#s-getAuthCallbackProxys)
- [getBackupObject()](#s-getBackupObject)

## Constructors

<a id="s-AuthCallbackProxy-1"></a>
### AuthCallbackProxy(Object)

```java
public AuthCallbackProxy(Object backupObject)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - the registered callback POJO


## Methods

<a id="s-addActionCapability"></a>
### addActionCapability(AuthCBType)

```java
public void addActionCapability(com.tailf.dp.proto.AuthCBType authCBType)
```

Types: [AuthCBType](../proto/AuthCBType.md#s-AuthCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.AuthCBType authCBType` - the authentication callback type to add

<a id="s-addActionMethod"></a>
### addActionMethod(String, Method)

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - the canonical method name
- `java.lang.reflect.Method method` - the callback method to register

<a id="s-auth"></a>
### auth(DpAuthContext)

```java
public boolean auth(com.tailf.dp.DpAuthContext atx) throws com.tailf.dp.DpCallbackException
```

Types: [DpAuthContext](../DpAuthContext.md#s-DpAuthContext), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

Delegates authentication callback to the registered POJO method.

**Parameters**

- `com.tailf.dp.DpAuthContext atx` - the authentication context

**Returns:** true if authentication should succeed, false otherwise

**Throws**

- `DpCallbackException` - if the callback fails or is not implemented

<a id="s-getAuthCallbackProxys"></a>
### getAuthCallbackProxys(Object)

```java
public static com.tailf.dp.annotations.AuthCallbackProxy[] getAuthCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [AuthCallbackProxy](AuthCallbackProxy.md#s-AuthCallbackProxy), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

Get array of proxy objects from registered POJO callback.
 Used internally at callback registration

**Parameters**

- `Object obj` - the registered callback POJO

**Returns:** array of authentication callback proxies

**Throws**

- `DpCallbackException` - if method signatures don't match or
                             annotation is invalid

<a id="s-getBackupObject"></a>
### getBackupObject()

```java
public Object getBackupObject()
```

Retrieve the callback POJO.

**Returns:** the registered callback object
