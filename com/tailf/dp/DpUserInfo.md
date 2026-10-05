# DpUserInfo <a href="#cls-DpUserInfo" id="cls-DpUserInfo"></a>

```java
public class com.tailf.dp.DpUserInfo
```

The user information.

## Members

**Constructors**:

- [DpUserInfo(ConfETuple)](#m-DpUserInfo-b042388b04f5)

**Methods**:

- [addRunningActionTrans(DpActionTrans)](#m-addRunningActionTrans-d75b58ec9312)
- [getContext()](#m-getContext-b18d576df5d9)
- [getIPAddress()](#m-getIPAddress-ff0e3ce26ce7)
- [getProtocol()](#m-getProtocol-7199008875a5)
- [getRunningActionTrans()](#m-getRunningActionTrans-3b0c0768ffd9)
- [getUserId()](#m-getUserId-46c2e98d8db7)
- [getUserName()](#m-getUserName-d985b9b35273)
- [removeRunningActionTrans(DpActionTrans)](#m-removeRunningActionTrans-c41179725077)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### DpUserInfo(ConfETuple) <a href="#m-DpUserInfo-b042388b04f5" id="m-DpUserInfo-b042388b04f5"></a>

```java
public DpUserInfo(com.tailf.proto.ConfETuple usess) throws com.tailf.conf.ConfException
```

Types: [ConfETuple](../proto/ConfETuple.md#cls-ConfETuple), [ConfException](../conf/ConfException.md#cls-ConfException)

Internally used Constructor.

**Parameters**

- `com.tailf.proto.ConfETuple usess`


## Methods

### addRunningActionTrans(DpActionTrans) <a href="#m-addRunningActionTrans-d75b58ec9312" id="m-addRunningActionTrans-d75b58ec9312"></a>

```java
protected void addRunningActionTrans(com.tailf.dp.DpActionTrans actionTrans)
```

Types: [DpActionTrans](DpActionTrans.md#cls-DpActionTrans)

**Parameters**

- `com.tailf.dp.DpActionTrans actionTrans`

### getContext() <a href="#m-getContext-b18d576df5d9" id="m-getContext-b18d576df5d9"></a>

```java
public String getContext()
```

Get User session context, one of
 "cli" | "webui" | "netconf" | "noaaa" | any MAAPI string

**Returns:** context as string

### getIPAddress() <a href="#m-getIPAddress-ff0e3ce26ce7" id="m-getIPAddress-ff0e3ce26ce7"></a>

```java
public com.tailf.conf.ConfObject getIPAddress()
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)

Get User session IP address as ConfIPv4 or ConfIPv6 respectively

**Returns:** IP address as ConfIPv4 or ConfIPv6

### getProtocol() <a href="#m-getProtocol-7199008875a5" id="m-getProtocol-7199008875a5"></a>

```java
public int getProtocol()
```

Get User session protocol type

**Returns:** int representing the protocol type

### getRunningActionTrans() <a href="#m-getRunningActionTrans-3b0c0768ffd9" id="m-getRunningActionTrans-3b0c0768ffd9"></a>

```java
protected com.tailf.dp.DpActionTrans[] getRunningActionTrans()
```

Types: [DpActionTrans](DpActionTrans.md#cls-DpActionTrans)

### getUserId() <a href="#m-getUserId-46c2e98d8db7" id="m-getUserId-46c2e98d8db7"></a>

```java
public int getUserId()
```

Get user session id

**Returns:** usid as int

### getUserName() <a href="#m-getUserName-d985b9b35273" id="m-getUserName-d985b9b35273"></a>

```java
public String getUserName()
```

Get user name

**Returns:** user name as string

### removeRunningActionTrans(DpActionTrans) <a href="#m-removeRunningActionTrans-c41179725077" id="m-removeRunningActionTrans-c41179725077"></a>

```java
protected void removeRunningActionTrans(com.tailf.dp.DpActionTrans actionTrans)
```

Types: [DpActionTrans](DpActionTrans.md#cls-DpActionTrans)

**Parameters**

- `com.tailf.dp.DpActionTrans actionTrans`

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Formats the User information
