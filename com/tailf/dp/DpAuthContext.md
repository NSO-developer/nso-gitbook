<a id="s-DpAuthContext"></a>
# DpAuthContext

```java
public class com.tailf.dp.DpAuthContext
```

Authentication context class. The DpAuthCallback.auth() callback method is
 invoked with an instance of this class that provides information about the
 result of the authentication so far.

## Members

**Constructors**:

- [DpAuthContext(DpUserInfo, String, boolean, int, String[], int, String, String)](#s-DpAuthContext-1)

**Methods**:

- [getErrorString()](#s-getErrorString)
- [getGroups()](#s-getGroups)
- [getLogNo()](#s-getLogNo)
- [getMethod()](#s-getMethod)
- [getNumGroups()](#s-getNumGroups)
- [getReason()](#s-getReason)
- [getUserInfo()](#s-getUserInfo)
- [isSuccess()](#s-isSuccess)
- [setError(String, Object[])](#s-setError)

## Constructors

<a id="s-DpAuthContext-1"></a>
### DpAuthContext(DpUserInfo, String, boolean, int, String[], int, String, String)

```java
public DpAuthContext(
    com.tailf.dp.DpUserInfo uinfo,
    String method,
    boolean success,
    int ngroups,
    String[] groups,
    int logno,
    String reason,
    String errstr
)
```

Types: [DpUserInfo](DpUserInfo.md#s-DpUserInfo)

**Parameters**

- `com.tailf.dp.DpUserInfo uinfo`
- `String method`
- `boolean success`
- `int ngroups`
- `String[] groups`
- `int logno`
- `String reason`
- `String errstr`


## Methods

<a id="s-getErrorString"></a>
### getErrorString()

```java
public String getErrorString()
```

errstr is an extended error information that can be set using method
 setError() and is used in the response if the auth() callback returns
 false;

**Returns:** String error string

<a id="s-getGroups"></a>
### getGroups()

```java
public String[] getGroups()
```

If success is true, the AAA authentication succeeded, and groups is an
 array of length ngroups that gives the groups that will be assigned to
 the user at login. If the callback returns true the complete
 authentication succeeds and the user is logged in. If it returns false
 (or an invalid return value), the authentication fails.

**Returns:** String[] groups

<a id="s-getLogNo"></a>
### getLogNo()

```java
public int getLogNo()
```

If success is false, the AAA authentication failed (with logno set
 to CONFD_AUTH_LOGIN_FAIL). This invocation is only for informational
 purposes - the callback return value has no effect on the
 authentication, and should normally be true.

**Returns:** int logno

<a id="s-getMethod"></a>
### getMethod()

```java
public String getMethod()
```

The method string gives the authentication method used, as follows:



```
  "password"
     Password authentication. This generic term is used if the
     authentication failed.

  "local", "pam", "external"
     Password authentication. On successful authentication, the specific
     method that succeeded is given. See the AAA chapter in the User
     Guide for an explanation of these methods.

  "publickey"
     Public key authentication via the internal SSH server.

  Other
     Authentication with an unknown or unsupported method with this name
     was attempted via the internal SSH server.
```

**Returns:** String method

<a id="s-getNumGroups"></a>
### getNumGroups()

```java
public int getNumGroups()
```

If success is true, the AAA authentication succeeded, ngroups is the
 number of groups that will be assigned to the user at login.

**Returns:** int number of groups

<a id="s-getReason"></a>
### getReason()

```java
public String getReason()
```

If success is false, the AAA authentication failed, reason is a
 explanatory string reason. This invocation is only for informational
 purposes - the callback return value has no effect on the authentication,
 and should normally be true.

**Returns:** String reason

<a id="s-getUserInfo"></a>
### getUserInfo()

```java
public com.tailf.dp.DpUserInfo getUserInfo()
```

Types: [DpUserInfo](DpUserInfo.md#s-DpUserInfo)

The uinfo contains an instance of DpUserInfo with details about the user
 logging in, specifically user name, password (if used), source IP
 address, context, and protocol. Note that the user session does not
 actually exist at this point, even if the AAA authentication was
 successful - it will only be created if the callback accepts the
 authentication, hence e.g. the usid element is always 0.

**Returns:** DpUserInfo userinfo

<a id="s-isSuccess"></a>
### isSuccess()

```java
public boolean isSuccess()
```

success is true if the user is accepted so far (before call of auth()
 callback)

 return boolean true if success

<a id="s-setError"></a>
### setError(String, Object[])

```java
public void setError(String fmt, Object[] arguments)
```

**Parameters**

- `String fmt`
- `Object[] arguments`
