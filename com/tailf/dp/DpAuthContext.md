<a id="cls-DpAuthContext"></a>
# DpAuthContext

```java
public class com.tailf.dp.DpAuthContext
```

Authentication context class. The DpAuthCallback.auth() callback method is
 invoked with an instance of this class that provides information about the
 result of the authentication so far.

## Members

**Constructors**:

- [DpAuthContext(DpUserInfo, String, boolean, int, String[], int, String, String)](#m-dpauthcontext-fe04319e1322)

**Methods**:

- [getErrorString()](#m-geterrorstring-3b4eba00496b)
- [getGroups()](#m-getgroups-42a63746c815)
- [getLogNo()](#m-getlogno-0a53380cc549)
- [getMethod()](#m-getmethod-50f16c317ece)
- [getNumGroups()](#m-getnumgroups-08bbbf8f5900)
- [getReason()](#m-getreason-5eb89e7b2733)
- [getUserInfo()](#m-getuserinfo-3ecef1f24d3d)
- [isSuccess()](#m-issuccess-92b05032c7ec)
- [setError(String, Object[])](#m-seterror-3f96aececb3d)

## Constructors

<a id="m-dpauthcontext-fe04319e1322"></a>
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

Types: [DpUserInfo](DpUserInfo.md#cls-DpUserInfo)

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

<a id="m-geterrorstring-3b4eba00496b"></a>
### getErrorString()

```java
public String getErrorString()
```

errstr is an extended error information that can be set using method
 setError() and is used in the response if the auth() callback returns
 false;

**Returns:** String error string

<a id="m-getgroups-42a63746c815"></a>
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

<a id="m-getlogno-0a53380cc549"></a>
### getLogNo()

```java
public int getLogNo()
```

If success is false, the AAA authentication failed (with logno set
 to CONFD_AUTH_LOGIN_FAIL). This invocation is only for informational
 purposes - the callback return value has no effect on the
 authentication, and should normally be true.

**Returns:** int logno

<a id="m-getmethod-50f16c317ece"></a>
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

<a id="m-getnumgroups-08bbbf8f5900"></a>
### getNumGroups()

```java
public int getNumGroups()
```

If success is true, the AAA authentication succeeded, ngroups is the
 number of groups that will be assigned to the user at login.

**Returns:** int number of groups

<a id="m-getreason-5eb89e7b2733"></a>
### getReason()

```java
public String getReason()
```

If success is false, the AAA authentication failed, reason is a
 explanatory string reason. This invocation is only for informational
 purposes - the callback return value has no effect on the authentication,
 and should normally be true.

**Returns:** String reason

<a id="m-getuserinfo-3ecef1f24d3d"></a>
### getUserInfo()

```java
public com.tailf.dp.DpUserInfo getUserInfo()
```

Types: [DpUserInfo](DpUserInfo.md#cls-DpUserInfo)

The uinfo contains an instance of DpUserInfo with details about the user
 logging in, specifically user name, password (if used), source IP
 address, context, and protocol. Note that the user session does not
 actually exist at this point, even if the AAA authentication was
 successful - it will only be created if the callback accepts the
 authentication, hence e.g. the usid element is always 0.

**Returns:** DpUserInfo userinfo

<a id="m-issuccess-92b05032c7ec"></a>
### isSuccess()

```java
public boolean isSuccess()
```

success is true if the user is accepted so far (before call of auth()
 callback)

 return boolean true if success

<a id="m-seterror-3f96aececb3d"></a>
### setError(String, Object[])

```java
public void setError(String fmt, Object[] arguments)
```

**Parameters**

- `String fmt`
- `Object[] arguments`
