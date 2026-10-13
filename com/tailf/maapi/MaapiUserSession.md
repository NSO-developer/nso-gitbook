# MaapiUserSession <a href="#maapiusersession-2d8a37dd2abf" id="maapiusersession-2d8a37dd2abf"></a>

```java
public class com.tailf.maapi.MaapiUserSession
```

User session descriptor class. Objects of this class is returned by the
 [`Maapi#getUserSession(int)`](Maapi.md#getusersession-ce8473a1e046) method.

## Members

**Constructors**:

- [MaapiUserSession\(ConfETuple\)](#maapiusersession-a9d867da0651)
- [MaapiUserSession\(int, ConfETuple\)](#maapiusersession-ad5f41178198)

**Methods**:

- [getContext\(\)](#getcontext-b18d576df5d9)
- [getIPAddress\(\)](#getipaddress-ff0e3ce26ce7)
- [getLoginTime\(\)](#getlogintime-624e37ca38f1)
- [getSessionFlags\(\)](#getsessionflags-c6e0fef9018b)
- [getSnmpV3Context\(\)](#getsnmpv3context-8f8121e9764c)
- [getUser\(\)](#getuser-fbcccdd28c7c)
- [getUserId\(\)](#getuserid-46c2e98d8db7)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### MaapiUserSession(ConfETuple) <a href="#maapiusersession-a9d867da0651" id="maapiusersession-a9d867da0651"></a>

```java
public MaapiUserSession(com.tailf.proto.ConfETuple usess) throws com.tailf.maapi.MaapiException
```

Types: [ConfETuple](../proto/ConfETuple.md#confetuple-b1f9702a82a1), [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

Internally used constructor

**Parameters**

- `com.tailf.proto.ConfETuple usess`

**Throws**

- `MaapiException`

### MaapiUserSession(int, ConfETuple) <a href="#maapiusersession-ad5f41178198" id="maapiusersession-ad5f41178198"></a>

```java
public MaapiUserSession(
    int lmode,
    com.tailf.proto.ConfETuple usess
)
    throws com.tailf.maapi.MaapiException
```

Types: [ConfETuple](../proto/ConfETuple.md#confetuple-b1f9702a82a1), [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

Internally used constructor

**Parameters**

- `int lmode`
- `com.tailf.proto.ConfETuple usess`

**Throws**

- `MaapiException`


## Methods

### getContext() <a href="#getcontext-b18d576df5d9" id="getcontext-b18d576df5d9"></a>

```java
public String getContext()
```

Get User session context, one of
 "cli" | "webui" | "netconf" | "noaaa" | any MAAPI string

**Returns:** context as string

### getIPAddress() <a href="#getipaddress-ff0e3ce26ce7" id="getipaddress-ff0e3ce26ce7"></a>

```java
public java.net.InetAddress getIPAddress()
```

Get user session ip address as java InetAddress instance

**Returns:** ip as InetAddress

### getLoginTime() <a href="#getlogintime-624e37ca38f1" id="getlogintime-624e37ca38f1"></a>

```java
public java.util.Date getLoginTime()
```

Get user session login time

**Returns:** login time as Date

### getSessionFlags() <a href="#getsessionflags-c6e0fef9018b" id="getsessionflags-c6e0fef9018b"></a>

```java
public com.tailf.maapi.MaapiUserSessionFlag getSessionFlags()
```

Types: [MaapiUserSessionFlag](MaapiUserSessionFlag.md#maapiusersessionflag-ee298af54ca4)

Get User session protocol

**Returns:** flag as MaapiUserSessionFlag

### getSnmpV3Context() <a href="#getsnmpv3context-8f8121e9764c" id="getsnmpv3context-8f8121e9764c"></a>

```java
public String getSnmpV3Context()
```

Get snmpv3 context if available

**Returns:** snmpv3 context as string

### getUser() <a href="#getuser-fbcccdd28c7c" id="getuser-fbcccdd28c7c"></a>

```java
public String getUser()
```

Get user name

**Returns:** user name as string

### getUserId() <a href="#getuserid-46c2e98d8db7" id="getuserid-46c2e98d8db7"></a>

```java
public int getUserId()
```

Get user session id

**Returns:** usid as int

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
