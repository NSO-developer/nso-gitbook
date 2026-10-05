# DpAuthContext <a href="#dpauthcontext-74214c38995b" id="dpauthcontext-74214c38995b"></a>

```java
public class com.tailf.dp.DpAuthContext
```

Authentication context class. The DpAuthCallback.auth() callback method is
 invoked with an instance of this class that provides information about the
 result of the authentication so far.

## Members

**Constructors**:

- [DpAuthContext\(DpUserInfo, String, boolean, int, String\[\], int, String, String\)](#dpauthcontext-fe04319e1322)

**Methods**:

- [getErrorString\(\)](#geterrorstring-3b4eba00496b)
- [getGroups\(\)](#getgroups-42a63746c815)
- [getLogNo\(\)](#getlogno-0a53380cc549)
- [getMethod\(\)](#getmethod-50f16c317ece)
- [getNumGroups\(\)](#getnumgroups-08bbbf8f5900)
- [getReason\(\)](#getreason-5eb89e7b2733)
- [getUserInfo\(\)](#getuserinfo-3ecef1f24d3d)
- [isSuccess\(\)](#issuccess-92b05032c7ec)
- [setError\(String, Object\[\]\)](#seterror-3f96aececb3d)

## Constructors

### DpAuthContext(DpUserInfo, String, boolean, int, String[], int, String, String) <a href="#dpauthcontext-fe04319e1322" id="dpauthcontext-fe04319e1322"></a>

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

Types: [DpUserInfo](DpUserInfo.md#dpuserinfo-c59746285a6e)

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

### getErrorString() <a href="#geterrorstring-3b4eba00496b" id="geterrorstring-3b4eba00496b"></a>

```java
public String getErrorString()
```

errstr is an extended error information that can be set using method
 setError() and is used in the response if the auth() callback returns
 false;

**Returns:** String error string

### getGroups() <a href="#getgroups-42a63746c815" id="getgroups-42a63746c815"></a>

```java
public String[] getGroups()
```

If success is true, the AAA authentication succeeded, and groups is an
 array of length ngroups that gives the groups that will be assigned to
 the user at login. If the callback returns true the complete
 authentication succeeds and the user is logged in. If it returns false
 (or an invalid return value), the authentication fails.

**Returns:** String[] groups

### getLogNo() <a href="#getlogno-0a53380cc549" id="getlogno-0a53380cc549"></a>

```java
public int getLogNo()
```

If success is false, the AAA authentication failed (with logno set
 to CONFD_AUTH_LOGIN_FAIL). This invocation is only for informational
 purposes - the callback return value has no effect on the
 authentication, and should normally be true.

**Returns:** int logno

### getMethod() <a href="#getmethod-50f16c317ece" id="getmethod-50f16c317ece"></a>

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

### getNumGroups() <a href="#getnumgroups-08bbbf8f5900" id="getnumgroups-08bbbf8f5900"></a>

```java
public int getNumGroups()
```

If success is true, the AAA authentication succeeded, ngroups is the
 number of groups that will be assigned to the user at login.

**Returns:** int number of groups

### getReason() <a href="#getreason-5eb89e7b2733" id="getreason-5eb89e7b2733"></a>

```java
public String getReason()
```

If success is false, the AAA authentication failed, reason is a
 explanatory string reason. This invocation is only for informational
 purposes - the callback return value has no effect on the authentication,
 and should normally be true.

**Returns:** String reason

### getUserInfo() <a href="#getuserinfo-3ecef1f24d3d" id="getuserinfo-3ecef1f24d3d"></a>

```java
public com.tailf.dp.DpUserInfo getUserInfo()
```

Types: [DpUserInfo](DpUserInfo.md#dpuserinfo-c59746285a6e)

The uinfo contains an instance of DpUserInfo with details about the user
 logging in, specifically user name, password (if used), source IP
 address, context, and protocol. Note that the user session does not
 actually exist at this point, even if the AAA authentication was
 successful - it will only be created if the callback accepts the
 authentication, hence e.g. the usid element is always 0.

**Returns:** DpUserInfo userinfo

### isSuccess() <a href="#issuccess-92b05032c7ec" id="issuccess-92b05032c7ec"></a>

```java
public boolean isSuccess()
```

success is true if the user is accepted so far (before call of auth()
 callback)

 return boolean true if success

### setError(String, Object[]) <a href="#seterror-3f96aececb3d" id="seterror-3f96aececb3d"></a>

```java
public void setError(String fmt, Object[] arguments)
```

**Parameters**

- `String fmt`
- `Object[] arguments`
