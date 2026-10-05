# DpAuthorizationContext <a href="#dpauthorizationcontext-e368a48474b6" id="dpauthorizationcontext-e368a48474b6"></a>

```java
public class com.tailf.dp.DpAuthorizationContext
```

Authorization context class. The DpAuthorizationCallback callback methods
 are invoked with an instance of this class that provides information about
 the authorization.

## Members

**Constructors**:

- [DpAuthorizationContext(DpUserInfo, String[], int, int, Dp)](#dpauthorizationcontext-06f65fd62f1d)

**Methods**:

- [getGroups()](#getgroups-42a63746c815)
- [getUserInfo()](#getuserinfo-3ecef1f24d3d)
- [setAuthorizationTimeout(int)](#setauthorizationtimeout-b4c17837fa6f)

## Constructors

### DpAuthorizationContext(DpUserInfo, String[], int, int, Dp) <a href="#dpauthorizationcontext-06f65fd62f1d" id="dpauthorizationcontext-06f65fd62f1d"></a>

```java
public DpAuthorizationContext(
    com.tailf.dp.DpUserInfo uinfo,
    String[] groups,
    int qref,
    int did,
    com.tailf.dp.Dp dp
)
```

Types: [DpUserInfo](DpUserInfo.md#dpuserinfo-c59746285a6e), [Dp](Dp.md#dp-64c27347820e)

**Parameters**

- `com.tailf.dp.DpUserInfo uinfo`
- `String[] groups`
- `int qref`
- `int did`
- `com.tailf.dp.Dp dp`


## Methods

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

### setAuthorizationTimeout(int) <a href="#setauthorizationtimeout-b4c17837fa6f" id="setauthorizationtimeout-b4c17837fa6f"></a>

```java
public void setAuthorizationTimeout(int timeoutSecs) throws java.io.IOException
```

The authorization callbacks are expected to complete quickly,
 However in case they send requests to a remote server, and such a
 request needs to be retried, this function can be used to extend the
 timeout for the current callback invocation.
 The timeout is given in seconds from the point in time when the
 function is called.

**Parameters**

- `int timeoutSecs`

**Throws**

- `IOException`
