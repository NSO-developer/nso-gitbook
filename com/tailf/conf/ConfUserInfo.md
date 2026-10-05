# ConfUserInfo <a href="#cls-ConfUserInfo" id="cls-ConfUserInfo"></a>

```java
public class com.tailf.conf.ConfUserInfo
```

User session information container.

## Members

**Constructors**:

- [ConfUserInfo(ConfETuple)](#m-ConfUserInfo-9235b8253643)

**Methods**:

- [getClearpass()](#m-getClearpass-998661a349d6)
- [getContext()](#m-getContext-b18d576df5d9)
- [getFlags()](#m-getFlags-3c1ca90fd29c)
- [getIp()](#m-getIp-ad5596a8911e)
- [getIpValue()](#m-getIpValue-dff73fbc4d3c)
- [getLmode()](#m-getLmode-4aa007381568)
- [getLogintime()](#m-getLogintime-845d8cf81901)
- [getPort()](#m-getPort-a2225f868a2b)
- [getProto()](#m-getProto-ae1443b1672f)
- [getSnmp_v3_ctx()](#m-getSnmp_v3_ctx-032f3fc605fb)
- [getUsername()](#m-getUsername-5638d729c382)
- [getUsid()](#m-getUsid-62d0ecfd68fd)
- [setClearpass(String)](#m-setClearpass-662e00669ed9)
- [setContext(String)](#m-setContext-753d3fbe936b)
- [setFlags(int)](#m-setFlags-ce4598e4465c)
- [setIp(InetAddress)](#m-setIp-49bec735527d)
- [setIpValue(ConfObject)](#m-setIpValue-cf28767e1148)
- [setLmode(int)](#m-setLmode-d167e77014bd)
- [setLogintime(Date)](#m-setLogintime-52b3f9806851)
- [setPort(int)](#m-setPort-d98551ef44a0)
- [setProto(int)](#m-setProto-d5a7c90ea3b3)
- [setSnmp_v3_ctx(String)](#m-setSnmp_v3_ctx-f43f32ccecbd)
- [setUsername(String)](#m-setUsername-2c18926653ff)
- [setUsid(int)](#m-setUsid-f5dcd6d3ac5f)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### ConfUserInfo(ConfETuple) <a href="#m-ConfUserInfo-9235b8253643" id="m-ConfUserInfo-9235b8253643"></a>

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

### getClearpass() <a href="#m-getClearpass-998661a349d6" id="m-getClearpass-998661a349d6"></a>

```java
public String getClearpass()
```

Get User session clear text password if available otherwise ""

**Returns:** password as string

### getContext() <a href="#m-getContext-b18d576df5d9" id="m-getContext-b18d576df5d9"></a>

```java
public String getContext()
```

Get User session context, one of
 "cli" | "webui" | "netconf" | "noaaa" | any MAAPI string

**Returns:** context as string

### getFlags() <a href="#m-getFlags-3c1ca90fd29c" id="m-getFlags-3c1ca90fd29c"></a>

```java
public int getFlags()
```

Get User session flags

**Returns:** flags as int

### getIp() <a href="#m-getIp-ad5596a8911e" id="m-getIp-ad5596a8911e"></a>

```java
public java.net.InetAddress getIp()
```

Get User Session IP address as an Java InetAddress instance

**Returns:** Ip address

### getIpValue() <a href="#m-getIpValue-dff73fbc4d3c" id="m-getIpValue-dff73fbc4d3c"></a>

```java
public com.tailf.conf.ConfObject getIpValue()
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

Get User session IP address as ConfIPv4 or ConfIPv6 respectively

**Returns:** IP address as ConfIPv4 or ConfIPv6

### getLmode() <a href="#m-getLmode-4aa007381568" id="m-getLmode-4aa007381568"></a>

```java
public int getLmode()
```

Get User session locks

**Returns:** lock mode as int

### getLogintime() <a href="#m-getLogintime-845d8cf81901" id="m-getLogintime-845d8cf81901"></a>

```java
public java.util.Date getLogintime()
```

Get user session login time

**Returns:** login time as date

### getPort() <a href="#m-getPort-a2225f868a2b" id="m-getPort-a2225f868a2b"></a>

```java
public int getPort()
```

Get user session port

**Returns:** port as int

### getProto() <a href="#m-getProto-ae1443b1672f" id="m-getProto-ae1443b1672f"></a>

```java
public int getProto()
```

Get User session protocol type

**Returns:** int representing the protocol type

### getSnmp_v3_ctx() <a href="#m-getSnmp_v3_ctx-032f3fc605fb" id="m-getSnmp_v3_ctx-032f3fc605fb"></a>

```java
public String getSnmp_v3_ctx()
```

Get snmp v3 context

**Returns:** snmpv3 context as string

### getUsername() <a href="#m-getUsername-5638d729c382" id="m-getUsername-5638d729c382"></a>

```java
public String getUsername()
```

Get user name

**Returns:** username as string

### getUsid() <a href="#m-getUsid-62d0ecfd68fd" id="m-getUsid-62d0ecfd68fd"></a>

```java
public int getUsid()
```

Get user session id

**Returns:** user session id as int

### setClearpass(String) <a href="#m-setClearpass-662e00669ed9" id="m-setClearpass-662e00669ed9"></a>

```java
public void setClearpass(String clearpass)
```

Internally used method

**Parameters**

- `String clearpass`

### setContext(String) <a href="#m-setContext-753d3fbe936b" id="m-setContext-753d3fbe936b"></a>

```java
public void setContext(String context)
```

Internally used method

**Parameters**

- `String context`

### setFlags(int) <a href="#m-setFlags-ce4598e4465c" id="m-setFlags-ce4598e4465c"></a>

```java
public void setFlags(int flags)
```

Internally used method

**Parameters**

- `int flags`

### setIp(InetAddress) <a href="#m-setIp-49bec735527d" id="m-setIp-49bec735527d"></a>

```java
public void setIp(java.net.InetAddress ip)
```

Internally used method

**Parameters**

- `java.net.InetAddress ip`

### setIpValue(ConfObject) <a href="#m-setIpValue-cf28767e1148" id="m-setIpValue-cf28767e1148"></a>

```java
public void setIpValue(com.tailf.conf.ConfObject ipValue)
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

Internally used set method

**Parameters**

- `com.tailf.conf.ConfObject ipValue`

### setLmode(int) <a href="#m-setLmode-d167e77014bd" id="m-setLmode-d167e77014bd"></a>

```java
public void setLmode(int lmode)
```

Internally used method

**Parameters**

- `int lmode`

### setLogintime(Date) <a href="#m-setLogintime-52b3f9806851" id="m-setLogintime-52b3f9806851"></a>

```java
public void setLogintime(java.util.Date logintime)
```

Internally used method

**Parameters**

- `java.util.Date logintime`

### setPort(int) <a href="#m-setPort-d98551ef44a0" id="m-setPort-d98551ef44a0"></a>

```java
public void setPort(int port)
```

Internally used method

**Parameters**

- `int port`

### setProto(int) <a href="#m-setProto-d5a7c90ea3b3" id="m-setProto-d5a7c90ea3b3"></a>

```java
public void setProto(int proto)
```

Internally used method

**Parameters**

- `int proto`

### setSnmp_v3_ctx(String) <a href="#m-setSnmp_v3_ctx-f43f32ccecbd" id="m-setSnmp_v3_ctx-f43f32ccecbd"></a>

```java
public void setSnmp_v3_ctx(String snmpV3Ctx)
```

Internally used method

**Parameters**

- `String snmpV3Ctx`

### setUsername(String) <a href="#m-setUsername-2c18926653ff" id="m-setUsername-2c18926653ff"></a>

```java
public void setUsername(String username)
```

Internally used method

**Parameters**

- `String username`

### setUsid(int) <a href="#m-setUsid-f5dcd6d3ac5f" id="m-setUsid-f5dcd6d3ac5f"></a>

```java
public void setUsid(int usid)
```

Internally used method

**Parameters**

- `int usid`

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
