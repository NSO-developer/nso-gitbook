# DpAuthContext <a href="#cls-DpAuthContext" id="cls-DpAuthContext"></a>

```java
public class com.tailf.dp.DpAuthContext
```

Authentication context class. The DpAuthCallback.auth() callback method is
 invoked with an instance of this class that provides information about the
 result of the authentication so far.

## Members

**Constructors**:

- [DpAuthContext(DpUserInfo, String, boolean, int, String[], int, String, String)](#m-DpAuthContext-fe04319e1322)

**Methods**:

- [getErrorString()](#m-getErrorString-3b4eba00496b)
- [getGroups()](#m-getGroups-42a63746c815)
- [getLogNo()](#m-getLogNo-0a53380cc549)
- [getMethod()](#m-getMethod-50f16c317ece)
- [getNumGroups()](#m-getNumGroups-08bbbf8f5900)
- [getReason()](#m-getReason-5eb89e7b2733)
- [getUserInfo()](#m-getUserInfo-3ecef1f24d3d)
- [isSuccess()](#m-isSuccess-92b05032c7ec)
- [setError(String, Object[])](#m-setError-3f96aececb3d)

## Constructors

### DpAuthContext(DpUserInfo, String, boolean, int, String[], int, String, String) <a href="#m-DpAuthContext-fe04319e1322" id="m-DpAuthContext-fe04319e1322"></a>

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

### getErrorString() <a href="#m-getErrorString-3b4eba00496b" id="m-getErrorString-3b4eba00496b"></a>

```java
public String getErrorString()
```

errstr is an extended error information that can be set using method
 setError() and is used in the response if the auth() callback returns
 false;

**Returns:** String error string

### getGroups() <a href="#m-getGroups-42a63746c815" id="m-getGroups-42a63746c815"></a>

```java
public String[] getGroups()
```

If success is true, the AAA authentication succeeded, and groups is an
 array of length ngroups that gives the groups that will be assigned to
 the user at login. If the callback returns true the complete
 authentication succeeds and the user is logged in. If it returns false
 (or an invalid return value), the authentication fails.

**Returns:** String[] groups

### getLogNo() <a href="#m-getLogNo-0a53380cc549" id="m-getLogNo-0a53380cc549"></a>

```java
public int getLogNo()
```

If success is false, the AAA authentication failed (with logno set
 to CONFD_AUTH_LOGIN_FAIL). This invocation is only for informational
 purposes - the callback return value has no effect on the
 authentication, and should normally be true.

**Returns:** int logno

### getMethod() <a href="#m-getMethod-50f16c317ece" id="m-getMethod-50f16c317ece"></a>

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

### getNumGroups() <a href="#m-getNumGroups-08bbbf8f5900" id="m-getNumGroups-08bbbf8f5900"></a>

```java
public int getNumGroups()
```

If success is true, the AAA authentication succeeded, ngroups is the
 number of groups that will be assigned to the user at login.

**Returns:** int number of groups

### getReason() <a href="#m-getReason-5eb89e7b2733" id="m-getReason-5eb89e7b2733"></a>

```java
public String getReason()
```

If success is false, the AAA authentication failed, reason is a
 explanatory string reason. This invocation is only for informational
 purposes - the callback return value has no effect on the authentication,
 and should normally be true.

**Returns:** String reason

### getUserInfo() <a href="#m-getUserInfo-3ecef1f24d3d" id="m-getUserInfo-3ecef1f24d3d"></a>

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

### isSuccess() <a href="#m-isSuccess-92b05032c7ec" id="m-isSuccess-92b05032c7ec"></a>

```java
public boolean isSuccess()
```

success is true if the user is accepted so far (before call of auth()
 callback)

 return boolean true if success

### setError(String, Object[]) <a href="#m-setError-3f96aececb3d" id="m-setError-3f96aececb3d"></a>

```java
public void setError(String fmt, Object[] arguments)
```

**Parameters**

- `String fmt`
- `Object[] arguments`
