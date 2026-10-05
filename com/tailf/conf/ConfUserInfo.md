# ConfUserInfo <a href="#confuserinfo-e4beb1511ed2" id="confuserinfo-e4beb1511ed2"></a>

```java
public class com.tailf.conf.ConfUserInfo
```

User session information container.

## Members

**Constructors**:

- [ConfUserInfo(ConfETuple)](#confuserinfo-9235b8253643)

**Methods**:

- [getClearpass()](#getclearpass-998661a349d6)
- [getContext()](#getcontext-b18d576df5d9)
- [getFlags()](#getflags-3c1ca90fd29c)
- [getIp()](#getip-ad5596a8911e)
- [getIpValue()](#getipvalue-dff73fbc4d3c)
- [getLmode()](#getlmode-4aa007381568)
- [getLogintime()](#getlogintime-845d8cf81901)
- [getPort()](#getport-a2225f868a2b)
- [getProto()](#getproto-ae1443b1672f)
- [getSnmp_v3_ctx()](#getsnmp_v3_ctx-032f3fc605fb)
- [getUsername()](#getusername-5638d729c382)
- [getUsid()](#getusid-62d0ecfd68fd)
- [setClearpass(String)](#setclearpass-662e00669ed9)
- [setContext(String)](#setcontext-753d3fbe936b)
- [setFlags(int)](#setflags-ce4598e4465c)
- [setIp(InetAddress)](#setip-49bec735527d)
- [setIpValue(ConfObject)](#setipvalue-cf28767e1148)
- [setLmode(int)](#setlmode-d167e77014bd)
- [setLogintime(Date)](#setlogintime-52b3f9806851)
- [setPort(int)](#setport-d98551ef44a0)
- [setProto(int)](#setproto-d5a7c90ea3b3)
- [setSnmp_v3_ctx(String)](#setsnmp_v3_ctx-f43f32ccecbd)
- [setUsername(String)](#setusername-2c18926653ff)
- [setUsid(int)](#setusid-f5dcd6d3ac5f)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### ConfUserInfo(ConfETuple) <a href="#confuserinfo-9235b8253643" id="confuserinfo-9235b8253643"></a>

```java
public ConfUserInfo(com.tailf.proto.ConfETuple usess) throws com.tailf.conf.ConfException
```

Types: [ConfETuple](../proto/ConfETuple.md#confetuple-b1f9702a82a1), [ConfException](ConfException.md#confexception-baeaab99f7f9)

Internally used constructor to create a UserInfo record

**Parameters**

- `com.tailf.proto.ConfETuple usess`

**Throws**

- `ConfException`


## Methods

### getClearpass() <a href="#getclearpass-998661a349d6" id="getclearpass-998661a349d6"></a>

```java
public String getClearpass()
```

Get User session clear text password if available otherwise ""

**Returns:** password as string

### getContext() <a href="#getcontext-b18d576df5d9" id="getcontext-b18d576df5d9"></a>

```java
public String getContext()
```

Get User session context, one of
 "cli" | "webui" | "netconf" | "noaaa" | any MAAPI string

**Returns:** context as string

### getFlags() <a href="#getflags-3c1ca90fd29c" id="getflags-3c1ca90fd29c"></a>

```java
public int getFlags()
```

Get User session flags

**Returns:** flags as int

### getIp() <a href="#getip-ad5596a8911e" id="getip-ad5596a8911e"></a>

```java
public java.net.InetAddress getIp()
```

Get User Session IP address as an Java InetAddress instance

**Returns:** Ip address

### getIpValue() <a href="#getipvalue-dff73fbc4d3c" id="getipvalue-dff73fbc4d3c"></a>

```java
public com.tailf.conf.ConfObject getIpValue()
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2)

Get User session IP address as ConfIPv4 or ConfIPv6 respectively

**Returns:** IP address as ConfIPv4 or ConfIPv6

### getLmode() <a href="#getlmode-4aa007381568" id="getlmode-4aa007381568"></a>

```java
public int getLmode()
```

Get User session locks

**Returns:** lock mode as int

### getLogintime() <a href="#getlogintime-845d8cf81901" id="getlogintime-845d8cf81901"></a>

```java
public java.util.Date getLogintime()
```

Get user session login time

**Returns:** login time as date

### getPort() <a href="#getport-a2225f868a2b" id="getport-a2225f868a2b"></a>

```java
public int getPort()
```

Get user session port

**Returns:** port as int

### getProto() <a href="#getproto-ae1443b1672f" id="getproto-ae1443b1672f"></a>

```java
public int getProto()
```

Get User session protocol type

**Returns:** int representing the protocol type

### getSnmp_v3_ctx() <a href="#getsnmp_v3_ctx-032f3fc605fb" id="getsnmp_v3_ctx-032f3fc605fb"></a>

```java
public String getSnmp_v3_ctx()
```

Get snmp v3 context

**Returns:** snmpv3 context as string

### getUsername() <a href="#getusername-5638d729c382" id="getusername-5638d729c382"></a>

```java
public String getUsername()
```

Get user name

**Returns:** username as string

### getUsid() <a href="#getusid-62d0ecfd68fd" id="getusid-62d0ecfd68fd"></a>

```java
public int getUsid()
```

Get user session id

**Returns:** user session id as int

### setClearpass(String) <a href="#setclearpass-662e00669ed9" id="setclearpass-662e00669ed9"></a>

```java
public void setClearpass(String clearpass)
```

Internally used method

**Parameters**

- `String clearpass`

### setContext(String) <a href="#setcontext-753d3fbe936b" id="setcontext-753d3fbe936b"></a>

```java
public void setContext(String context)
```

Internally used method

**Parameters**

- `String context`

### setFlags(int) <a href="#setflags-ce4598e4465c" id="setflags-ce4598e4465c"></a>

```java
public void setFlags(int flags)
```

Internally used method

**Parameters**

- `int flags`

### setIp(InetAddress) <a href="#setip-49bec735527d" id="setip-49bec735527d"></a>

```java
public void setIp(java.net.InetAddress ip)
```

Internally used method

**Parameters**

- `java.net.InetAddress ip`

### setIpValue(ConfObject) <a href="#setipvalue-cf28767e1148" id="setipvalue-cf28767e1148"></a>

```java
public void setIpValue(com.tailf.conf.ConfObject ipValue)
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2)

Internally used set method

**Parameters**

- `com.tailf.conf.ConfObject ipValue`

### setLmode(int) <a href="#setlmode-d167e77014bd" id="setlmode-d167e77014bd"></a>

```java
public void setLmode(int lmode)
```

Internally used method

**Parameters**

- `int lmode`

### setLogintime(Date) <a href="#setlogintime-52b3f9806851" id="setlogintime-52b3f9806851"></a>

```java
public void setLogintime(java.util.Date logintime)
```

Internally used method

**Parameters**

- `java.util.Date logintime`

### setPort(int) <a href="#setport-d98551ef44a0" id="setport-d98551ef44a0"></a>

```java
public void setPort(int port)
```

Internally used method

**Parameters**

- `int port`

### setProto(int) <a href="#setproto-d5a7c90ea3b3" id="setproto-d5a7c90ea3b3"></a>

```java
public void setProto(int proto)
```

Internally used method

**Parameters**

- `int proto`

### setSnmp_v3_ctx(String) <a href="#setsnmp_v3_ctx-f43f32ccecbd" id="setsnmp_v3_ctx-f43f32ccecbd"></a>

```java
public void setSnmp_v3_ctx(String snmpV3Ctx)
```

Internally used method

**Parameters**

- `String snmpV3Ctx`

### setUsername(String) <a href="#setusername-2c18926653ff" id="setusername-2c18926653ff"></a>

```java
public void setUsername(String username)
```

Internally used method

**Parameters**

- `String username`

### setUsid(int) <a href="#setusid-f5dcd6d3ac5f" id="setusid-f5dcd6d3ac5f"></a>

```java
public void setUsid(int usid)
```

Internally used method

**Parameters**

- `int usid`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
