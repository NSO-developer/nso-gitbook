<a id="cls-MaapiUserSession"></a>
# MaapiUserSession

```java
public class com.tailf.maapi.MaapiUserSession
```

User session descriptor class. Objects of this class is returned by the
 [`Maapi#getUserSession(int)`](Maapi.md#m-getusersession-ce8473a1e046) method.

## Members

**Constructors**:

- [MaapiUserSession(ConfETuple)](#m-maapiusersession-a9d867da0651)
- [MaapiUserSession(int, ConfETuple)](#m-maapiusersession-ad5f41178198)

**Methods**:

- [getContext()](#m-getcontext-b18d576df5d9)
- [getIPAddress()](#m-getipaddress-ff0e3ce26ce7)
- [getLoginTime()](#m-getlogintime-624e37ca38f1)
- [getSessionFlags()](#m-getsessionflags-c6e0fef9018b)
- [getSnmpV3Context()](#m-getsnmpv3context-8f8121e9764c)
- [getUser()](#m-getuser-fbcccdd28c7c)
- [getUserId()](#m-getuserid-46c2e98d8db7)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-maapiusersession-a9d867da0651"></a>
### MaapiUserSession(ConfETuple)

```java
public MaapiUserSession(com.tailf.proto.ConfETuple usess) throws com.tailf.maapi.MaapiException
```

Types: [ConfETuple](../proto/ConfETuple.md#cls-ConfETuple), [MaapiException](MaapiException.md#cls-MaapiException)

Internally used constructor

**Parameters**

- `com.tailf.proto.ConfETuple usess`

**Throws**

- `MaapiException`

<a id="m-maapiusersession-ad5f41178198"></a>
### MaapiUserSession(int, ConfETuple)

```java
public MaapiUserSession(
    int lmode,
    com.tailf.proto.ConfETuple usess
)
    throws com.tailf.maapi.MaapiException
```

Types: [ConfETuple](../proto/ConfETuple.md#cls-ConfETuple), [MaapiException](MaapiException.md#cls-MaapiException)

Internally used constructor

**Parameters**

- `int lmode`
- `com.tailf.proto.ConfETuple usess`

**Throws**

- `MaapiException`


## Methods

<a id="m-getcontext-b18d576df5d9"></a>
### getContext()

```java
public String getContext()
```

Get User session context, one of
 "cli" | "webui" | "netconf" | "noaaa" | any MAAPI string

**Returns:** context as string

<a id="m-getipaddress-ff0e3ce26ce7"></a>
### getIPAddress()

```java
public java.net.InetAddress getIPAddress()
```

Get user session ip address as java InetAddress instance

**Returns:** ip as InetAddress

<a id="m-getlogintime-624e37ca38f1"></a>
### getLoginTime()

```java
public java.util.Date getLoginTime()
```

Get user session login time

**Returns:** login time as Date

<a id="m-getsessionflags-c6e0fef9018b"></a>
### getSessionFlags()

```java
public com.tailf.maapi.MaapiUserSessionFlag getSessionFlags()
```

Types: [MaapiUserSessionFlag](MaapiUserSessionFlag.md#cls-MaapiUserSessionFlag)

Get User session protocol

**Returns:** flag as MaapiUserSessionFlag

<a id="m-getsnmpv3context-8f8121e9764c"></a>
### getSnmpV3Context()

```java
public String getSnmpV3Context()
```

Get snmpv3 context if available

**Returns:** snmpv3 context as string

<a id="m-getuser-fbcccdd28c7c"></a>
### getUser()

```java
public String getUser()
```

Get user name

**Returns:** user name as string

<a id="m-getuserid-46c2e98d8db7"></a>
### getUserId()

```java
public int getUserId()
```

Get user session id

**Returns:** usid as int

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
