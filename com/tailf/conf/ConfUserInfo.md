<a id="cls-ConfUserInfo"></a>
# ConfUserInfo

```java
public class com.tailf.conf.ConfUserInfo
```

User session information container.

## Members

**Constructors**:

- [ConfUserInfo(ConfETuple)](#m-confuserinfo-9235b8253643)

**Methods**:

- [getClearpass()](#m-getclearpass-998661a349d6)
- [getContext()](#m-getcontext-b18d576df5d9)
- [getFlags()](#m-getflags-3c1ca90fd29c)
- [getIp()](#m-getip-ad5596a8911e)
- [getIpValue()](#m-getipvalue-dff73fbc4d3c)
- [getLmode()](#m-getlmode-4aa007381568)
- [getLogintime()](#m-getlogintime-845d8cf81901)
- [getPort()](#m-getport-a2225f868a2b)
- [getProto()](#m-getproto-ae1443b1672f)
- [getSnmp_v3_ctx()](#m-getsnmp_v3_ctx-032f3fc605fb)
- [getUsername()](#m-getusername-5638d729c382)
- [getUsid()](#m-getusid-62d0ecfd68fd)
- [setClearpass(String)](#m-setclearpass-662e00669ed9)
- [setContext(String)](#m-setcontext-753d3fbe936b)
- [setFlags(int)](#m-setflags-ce4598e4465c)
- [setIp(InetAddress)](#m-setip-49bec735527d)
- [setIpValue(ConfObject)](#m-setipvalue-cf28767e1148)
- [setLmode(int)](#m-setlmode-d167e77014bd)
- [setLogintime(Date)](#m-setlogintime-52b3f9806851)
- [setPort(int)](#m-setport-d98551ef44a0)
- [setProto(int)](#m-setproto-d5a7c90ea3b3)
- [setSnmp_v3_ctx(String)](#m-setsnmp_v3_ctx-f43f32ccecbd)
- [setUsername(String)](#m-setusername-2c18926653ff)
- [setUsid(int)](#m-setusid-f5dcd6d3ac5f)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-confuserinfo-9235b8253643"></a>
### ConfUserInfo(ConfETuple)

```java
public ConfUserInfo(com.tailf.proto.ConfETuple usess) throws com.tailf.conf.ConfException
```

Types: [ConfETuple](../proto/ConfETuple.md#cls-ConfETuple), [ConfException](ConfException.md#cls-ConfException)

Internally used constructor to create a UserInfo record

**Parameters**

- `com.tailf.proto.ConfETuple usess`

**Throws**

- `ConfException`


## Methods

<a id="m-getclearpass-998661a349d6"></a>
### getClearpass()

```java
public String getClearpass()
```

Get User session clear text password if available otherwise ""

**Returns:** password as string

<a id="m-getcontext-b18d576df5d9"></a>
### getContext()

```java
public String getContext()
```

Get User session context, one of
 "cli" | "webui" | "netconf" | "noaaa" | any MAAPI string

**Returns:** context as string

<a id="m-getflags-3c1ca90fd29c"></a>
### getFlags()

```java
public int getFlags()
```

Get User session flags

**Returns:** flags as int

<a id="m-getip-ad5596a8911e"></a>
### getIp()

```java
public java.net.InetAddress getIp()
```

Get User Session IP address as an Java InetAddress instance

**Returns:** Ip address

<a id="m-getipvalue-dff73fbc4d3c"></a>
### getIpValue()

```java
public com.tailf.conf.ConfObject getIpValue()
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

Get User session IP address as ConfIPv4 or ConfIPv6 respectively

**Returns:** IP address as ConfIPv4 or ConfIPv6

<a id="m-getlmode-4aa007381568"></a>
### getLmode()

```java
public int getLmode()
```

Get User session locks

**Returns:** lock mode as int

<a id="m-getlogintime-845d8cf81901"></a>
### getLogintime()

```java
public java.util.Date getLogintime()
```

Get user session login time

**Returns:** login time as date

<a id="m-getport-a2225f868a2b"></a>
### getPort()

```java
public int getPort()
```

Get user session port

**Returns:** port as int

<a id="m-getproto-ae1443b1672f"></a>
### getProto()

```java
public int getProto()
```

Get User session protocol type

**Returns:** int representing the protocol type

<a id="m-getsnmp_v3_ctx-032f3fc605fb"></a>
### getSnmp_v3_ctx()

```java
public String getSnmp_v3_ctx()
```

Get snmp v3 context

**Returns:** snmpv3 context as string

<a id="m-getusername-5638d729c382"></a>
### getUsername()

```java
public String getUsername()
```

Get user name

**Returns:** username as string

<a id="m-getusid-62d0ecfd68fd"></a>
### getUsid()

```java
public int getUsid()
```

Get user session id

**Returns:** user session id as int

<a id="m-setclearpass-662e00669ed9"></a>
### setClearpass(String)

```java
public void setClearpass(String clearpass)
```

Internally used method

**Parameters**

- `String clearpass`

<a id="m-setcontext-753d3fbe936b"></a>
### setContext(String)

```java
public void setContext(String context)
```

Internally used method

**Parameters**

- `String context`

<a id="m-setflags-ce4598e4465c"></a>
### setFlags(int)

```java
public void setFlags(int flags)
```

Internally used method

**Parameters**

- `int flags`

<a id="m-setip-49bec735527d"></a>
### setIp(InetAddress)

```java
public void setIp(java.net.InetAddress ip)
```

Internally used method

**Parameters**

- `java.net.InetAddress ip`

<a id="m-setipvalue-cf28767e1148"></a>
### setIpValue(ConfObject)

```java
public void setIpValue(com.tailf.conf.ConfObject ipValue)
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

Internally used set method

**Parameters**

- `com.tailf.conf.ConfObject ipValue`

<a id="m-setlmode-d167e77014bd"></a>
### setLmode(int)

```java
public void setLmode(int lmode)
```

Internally used method

**Parameters**

- `int lmode`

<a id="m-setlogintime-52b3f9806851"></a>
### setLogintime(Date)

```java
public void setLogintime(java.util.Date logintime)
```

Internally used method

**Parameters**

- `java.util.Date logintime`

<a id="m-setport-d98551ef44a0"></a>
### setPort(int)

```java
public void setPort(int port)
```

Internally used method

**Parameters**

- `int port`

<a id="m-setproto-d5a7c90ea3b3"></a>
### setProto(int)

```java
public void setProto(int proto)
```

Internally used method

**Parameters**

- `int proto`

<a id="m-setsnmp_v3_ctx-f43f32ccecbd"></a>
### setSnmp_v3_ctx(String)

```java
public void setSnmp_v3_ctx(String snmpV3Ctx)
```

Internally used method

**Parameters**

- `String snmpV3Ctx`

<a id="m-setusername-2c18926653ff"></a>
### setUsername(String)

```java
public void setUsername(String username)
```

Internally used method

**Parameters**

- `String username`

<a id="m-setusid-f5dcd6d3ac5f"></a>
### setUsid(int)

```java
public void setUsid(int usid)
```

Internally used method

**Parameters**

- `int usid`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
