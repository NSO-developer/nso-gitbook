<a id="s-ConfUserInfo"></a>
# ConfUserInfo

```java
public class com.tailf.conf.ConfUserInfo
```

User session information container.

## Members

**Constructors**:

- [ConfUserInfo(ConfETuple)](#s-ConfUserInfo-1)

**Methods**:

- [getClearpass()](#s-getClearpass)
- [getContext()](#s-getContext)
- [getFlags()](#s-getFlags)
- [getIp()](#s-getIp)
- [getIpValue()](#s-getIpValue)
- [getLmode()](#s-getLmode)
- [getLogintime()](#s-getLogintime)
- [getPort()](#s-getPort)
- [getProto()](#s-getProto)
- [getSnmp_v3_ctx()](#s-getSnmp_v3_ctx)
- [getUsername()](#s-getUsername)
- [getUsid()](#s-getUsid)
- [setClearpass(String)](#s-setClearpass)
- [setContext(String)](#s-setContext)
- [setFlags(int)](#s-setFlags)
- [setIp(InetAddress)](#s-setIp)
- [setIpValue(ConfObject)](#s-setIpValue)
- [setLmode(int)](#s-setLmode)
- [setLogintime(Date)](#s-setLogintime)
- [setPort(int)](#s-setPort)
- [setProto(int)](#s-setProto)
- [setSnmp_v3_ctx(String)](#s-setSnmp_v3_ctx)
- [setUsername(String)](#s-setUsername)
- [setUsid(int)](#s-setUsid)
- [toString()](#s-toString)

## Constructors

<a id="s-ConfUserInfo-1"></a>
### ConfUserInfo(ConfETuple)

```java
public ConfUserInfo(com.tailf.proto.ConfETuple usess) throws com.tailf.conf.ConfException
```

Types: [ConfETuple](../proto/ConfETuple.md#s-ConfETuple), [ConfException](ConfException.md#s-ConfException)

Internally used constructor to create a UserInfo record

**Parameters**

- `com.tailf.proto.ConfETuple usess`

**Throws**

- `ConfException`


## Methods

<a id="s-getClearpass"></a>
### getClearpass()

```java
public String getClearpass()
```

Get User session clear text password if available otherwise ""

**Returns:** password as string

<a id="s-getContext"></a>
### getContext()

```java
public String getContext()
```

Get User session context, one of
 "cli" | "webui" | "netconf" | "noaaa" | any MAAPI string

**Returns:** context as string

<a id="s-getFlags"></a>
### getFlags()

```java
public int getFlags()
```

Get User session flags

**Returns:** flags as int

<a id="s-getIp"></a>
### getIp()

```java
public java.net.InetAddress getIp()
```

Get User Session IP address as an Java InetAddress instance

**Returns:** Ip address

<a id="s-getIpValue"></a>
### getIpValue()

```java
public com.tailf.conf.ConfObject getIpValue()
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

Get User session IP address as ConfIPv4 or ConfIPv6 respectively

**Returns:** IP address as ConfIPv4 or ConfIPv6

<a id="s-getLmode"></a>
### getLmode()

```java
public int getLmode()
```

Get User session locks

**Returns:** lock mode as int

<a id="s-getLogintime"></a>
### getLogintime()

```java
public java.util.Date getLogintime()
```

Get user session login time

**Returns:** login time as date

<a id="s-getPort"></a>
### getPort()

```java
public int getPort()
```

Get user session port

**Returns:** port as int

<a id="s-getProto"></a>
### getProto()

```java
public int getProto()
```

Get User session protocol type

**Returns:** int representing the protocol type

<a id="s-getSnmp_v3_ctx"></a>
### getSnmp_v3_ctx()

```java
public String getSnmp_v3_ctx()
```

Get snmp v3 context

**Returns:** snmpv3 context as string

<a id="s-getUsername"></a>
### getUsername()

```java
public String getUsername()
```

Get user name

**Returns:** username as string

<a id="s-getUsid"></a>
### getUsid()

```java
public int getUsid()
```

Get user session id

**Returns:** user session id as int

<a id="s-setClearpass"></a>
### setClearpass(String)

```java
public void setClearpass(String clearpass)
```

Internally used method

**Parameters**

- `String clearpass`

<a id="s-setContext"></a>
### setContext(String)

```java
public void setContext(String context)
```

Internally used method

**Parameters**

- `String context`

<a id="s-setFlags"></a>
### setFlags(int)

```java
public void setFlags(int flags)
```

Internally used method

**Parameters**

- `int flags`

<a id="s-setIp"></a>
### setIp(InetAddress)

```java
public void setIp(java.net.InetAddress ip)
```

Internally used method

**Parameters**

- `java.net.InetAddress ip`

<a id="s-setIpValue"></a>
### setIpValue(ConfObject)

```java
public void setIpValue(com.tailf.conf.ConfObject ipValue)
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

Internally used set method

**Parameters**

- `com.tailf.conf.ConfObject ipValue`

<a id="s-setLmode"></a>
### setLmode(int)

```java
public void setLmode(int lmode)
```

Internally used method

**Parameters**

- `int lmode`

<a id="s-setLogintime"></a>
### setLogintime(Date)

```java
public void setLogintime(java.util.Date logintime)
```

Internally used method

**Parameters**

- `java.util.Date logintime`

<a id="s-setPort"></a>
### setPort(int)

```java
public void setPort(int port)
```

Internally used method

**Parameters**

- `int port`

<a id="s-setProto"></a>
### setProto(int)

```java
public void setProto(int proto)
```

Internally used method

**Parameters**

- `int proto`

<a id="s-setSnmp_v3_ctx"></a>
### setSnmp_v3_ctx(String)

```java
public void setSnmp_v3_ctx(String snmpV3Ctx)
```

Internally used method

**Parameters**

- `String snmpV3Ctx`

<a id="s-setUsername"></a>
### setUsername(String)

```java
public void setUsername(String username)
```

Internally used method

**Parameters**

- `String username`

<a id="s-setUsid"></a>
### setUsid(int)

```java
public void setUsid(int usid)
```

Internally used method

**Parameters**

- `int usid`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
