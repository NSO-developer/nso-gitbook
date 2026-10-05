# DpAuthCallback <a href="#dpauthcallback-207995250502" id="dpauthcallback-207995250502"></a>

```java
public interface com.tailf.dp.DpAuthCallback
```

With this interface we can register a callback with ConfDs AAA subsystem, to
 be invoked whenever AAA has completed processing of an authentication
 attempt. In the case where the authentication was otherwise successful, the
 callback can still cause it to be rejected. This can be used to implement
 specific access policies, as an alternative to using PAM or "External"
 authentication for this purpose. The callback will only be invoked if it is
 registered using Dp.registerAnnotatedCallbacks() and enabled
 via /confdConfig/aaa/authenticationCallback/enabled in confd.conf
 or /ncs-config/aaa/authentication-callback/enabled in ncs.conf respectively .

 Note, If the callback is enabled in confd.thonf but not registered, or
 invocation keeps failing for some reason, all authentication attempts will
 fail.

**See also:** [`Dp#registerAnnotatedCallbacks(Object)`](Dp.md#registerannotatedcallbacks-ffaebadbfc42)

## Members

**Methods**:

- [auth\(DpAuthContext\)](#auth-34bd42ec3143)

## Methods

### auth(DpAuthContext) <a href="#auth-34bd42ec3143" id="auth-34bd42ec3143"></a>

```java
public abstract boolean auth(com.tailf.dp.DpAuthContext atx) throws com.tailf.dp.DpCallbackException
```

Types: [DpAuthContext](DpAuthContext.md#dpauthcontext-74214c38995b), [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

The auth() callback is invoked with an instance to an authentication
 context that provides information about the result of the authentication
 so far. The callback must return true or false depending on the user
 being accepted or rejected.

**Parameters**

- `com.tailf.dp.DpAuthContext atx` - the authentication context

**Returns:** true if authentication should succeed, false if it should fail

**Throws**

- `DpCallbackException` - if an error occurs during processing
