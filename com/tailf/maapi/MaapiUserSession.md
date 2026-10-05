<a id="s-MaapiUserSession"></a>
# MaapiUserSession

```java
public class com.tailf.maapi.MaapiUserSession
```

User session descriptor class. Objects of this class is returned by the
 [`Maapi`](Maapi.md#s-Maapi) method.

## Members

**Constructors**:

- [MaapiUserSession(ConfETuple)](#s-MaapiUserSession-1)
- [MaapiUserSession(int, ConfETuple)](#s-MaapiUserSession-2)

**Methods**:

- [getContext()](#s-getContext)
- [getIPAddress()](#s-getIPAddress)
- [getLoginTime()](#s-getLoginTime)
- [getSessionFlags()](#s-getSessionFlags)
- [getSnmpV3Context()](#s-getSnmpV3Context)
- [getUser()](#s-getUser)
- [getUserId()](#s-getUserId)
- [toString()](#s-toString)

## Constructors

<a id="s-MaapiUserSession-1"></a>
### MaapiUserSession(ConfETuple)

```java
public MaapiUserSession(com.tailf.proto.ConfETuple usess) throws com.tailf.maapi.MaapiException
```

Types: [ConfETuple](../proto/ConfETuple.md#s-ConfETuple), [MaapiException](MaapiException.md#s-MaapiException)

Internally used constructor

**Parameters**

- `com.tailf.proto.ConfETuple usess`

**Throws**

- `MaapiException`

<a id="s-MaapiUserSession-2"></a>
### MaapiUserSession(int, ConfETuple)

```java
public MaapiUserSession(
    int lmode,
    com.tailf.proto.ConfETuple usess
)
    throws com.tailf.maapi.MaapiException
```

Types: [ConfETuple](../proto/ConfETuple.md#s-ConfETuple), [MaapiException](MaapiException.md#s-MaapiException)

Internally used constructor

**Parameters**

- `int lmode`
- `com.tailf.proto.ConfETuple usess`

**Throws**

- `MaapiException`


## Methods

<a id="s-getContext"></a>
### getContext()

```java
public String getContext()
```

Get User session context, one of
 "cli" | "webui" | "netconf" | "noaaa" | any MAAPI string

**Returns:** context as string

<a id="s-getIPAddress"></a>
### getIPAddress()

```java
public java.net.InetAddress getIPAddress()
```

Get user session ip address as java InetAddress instance

**Returns:** ip as InetAddress

<a id="s-getLoginTime"></a>
### getLoginTime()

```java
public java.util.Date getLoginTime()
```

Get user session login time

**Returns:** login time as Date

<a id="s-getSessionFlags"></a>
### getSessionFlags()

```java
public com.tailf.maapi.MaapiUserSessionFlag getSessionFlags()
```

Types: [MaapiUserSessionFlag](MaapiUserSessionFlag.md#s-MaapiUserSessionFlag)

Get User session protocol

**Returns:** flag as MaapiUserSessionFlag

<a id="s-getSnmpV3Context"></a>
### getSnmpV3Context()

```java
public String getSnmpV3Context()
```

Get snmpv3 context if available

**Returns:** snmpv3 context as string

<a id="s-getUser"></a>
### getUser()

```java
public String getUser()
```

Get user name

**Returns:** user name as string

<a id="s-getUserId"></a>
### getUserId()

```java
public int getUserId()
```

Get user session id

**Returns:** usid as int

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
