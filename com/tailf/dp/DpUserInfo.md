<a id="s-DpUserInfo"></a>
# DpUserInfo

```java
public class com.tailf.dp.DpUserInfo
```

The user information.

## Members

**Constructors**:

- [DpUserInfo(ConfETuple)](#s-DpUserInfo-1)

**Methods**:

- [addRunningActionTrans(DpActionTrans)](#s-addRunningActionTrans)
- [getContext()](#s-getContext)
- [getIPAddress()](#s-getIPAddress)
- [getProtocol()](#s-getProtocol)
- [getRunningActionTrans()](#s-getRunningActionTrans)
- [getUserId()](#s-getUserId)
- [getUserName()](#s-getUserName)
- [removeRunningActionTrans(DpActionTrans)](#s-removeRunningActionTrans)
- [toString()](#s-toString)

## Constructors

<a id="s-DpUserInfo-1"></a>
### DpUserInfo(ConfETuple)

```java
public DpUserInfo(com.tailf.proto.ConfETuple usess) throws com.tailf.conf.ConfException
```

Types: [ConfETuple](../proto/ConfETuple.md#s-ConfETuple), [ConfException](../conf/ConfException.md#s-ConfException)

Internally used Constructor.

**Parameters**

- `com.tailf.proto.ConfETuple usess`


## Methods

<a id="s-addRunningActionTrans"></a>
### addRunningActionTrans(DpActionTrans)

```java
protected void addRunningActionTrans(com.tailf.dp.DpActionTrans actionTrans)
```

Types: [DpActionTrans](DpActionTrans.md#s-DpActionTrans)

**Parameters**

- `com.tailf.dp.DpActionTrans actionTrans`

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
public com.tailf.conf.ConfObject getIPAddress()
```

Types: [ConfObject](../conf/ConfObject.md#s-ConfObject)

Get User session IP address as ConfIPv4 or ConfIPv6 respectively

**Returns:** IP address as ConfIPv4 or ConfIPv6

<a id="s-getProtocol"></a>
### getProtocol()

```java
public int getProtocol()
```

Get User session protocol type

**Returns:** int representing the protocol type

<a id="s-getRunningActionTrans"></a>
### getRunningActionTrans()

```java
protected com.tailf.dp.DpActionTrans[] getRunningActionTrans()
```

Types: [DpActionTrans](DpActionTrans.md#s-DpActionTrans)

<a id="s-getUserId"></a>
### getUserId()

```java
public int getUserId()
```

Get user session id

**Returns:** usid as int

<a id="s-getUserName"></a>
### getUserName()

```java
public String getUserName()
```

Get user name

**Returns:** user name as string

<a id="s-removeRunningActionTrans"></a>
### removeRunningActionTrans(DpActionTrans)

```java
protected void removeRunningActionTrans(com.tailf.dp.DpActionTrans actionTrans)
```

Types: [DpActionTrans](DpActionTrans.md#s-DpActionTrans)

**Parameters**

- `com.tailf.dp.DpActionTrans actionTrans`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Formats the User information
