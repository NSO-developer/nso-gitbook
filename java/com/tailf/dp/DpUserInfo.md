# DpUserInfo <a href="#dpuserinfo-c59746285a6e" id="dpuserinfo-c59746285a6e"></a>

```java
public class com.tailf.dp.DpUserInfo
```

The user information.

## Members

**Constructors**:

- [DpUserInfo\(ConfETuple\)](#dpuserinfo-b042388b04f5)

**Methods**:

- [addRunningActionTrans\(DpActionTrans\)](#addrunningactiontrans-d75b58ec9312)
- [getContext\(\)](#getcontext-b18d576df5d9)
- [getIPAddress\(\)](#getipaddress-ff0e3ce26ce7)
- [getProtocol\(\)](#getprotocol-7199008875a5)
- [getRunningActionTrans\(\)](#getrunningactiontrans-3b0c0768ffd9)
- [getUserId\(\)](#getuserid-46c2e98d8db7)
- [getUserName\(\)](#getusername-d985b9b35273)
- [removeRunningActionTrans\(DpActionTrans\)](#removerunningactiontrans-c41179725077)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### DpUserInfo(ConfETuple) <a href="#dpuserinfo-b042388b04f5" id="dpuserinfo-b042388b04f5"></a>

```java
public DpUserInfo(com.tailf.proto.ConfETuple usess) throws com.tailf.conf.ConfException
```

Types: [ConfETuple](../proto/ConfETuple.md#confetuple-b1f9702a82a1), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Internally used Constructor.

**Parameters**

- `com.tailf.proto.ConfETuple usess`


## Methods

### addRunningActionTrans(DpActionTrans) <a href="#addrunningactiontrans-d75b58ec9312" id="addrunningactiontrans-d75b58ec9312"></a>

```java
protected void addRunningActionTrans(com.tailf.dp.DpActionTrans actionTrans)
```

Types: [DpActionTrans](DpActionTrans.md#dpactiontrans-b975ce2c2d93)

**Parameters**

- `com.tailf.dp.DpActionTrans actionTrans`

### getContext() <a href="#getcontext-b18d576df5d9" id="getcontext-b18d576df5d9"></a>

```java
public String getContext()
```

Get User session context, one of
 "cli" | "webui" | "netconf" | "noaaa" | any MAAPI string

**Returns:** context as string

### getIPAddress() <a href="#getipaddress-ff0e3ce26ce7" id="getipaddress-ff0e3ce26ce7"></a>

```java
public com.tailf.conf.ConfObject getIPAddress()
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2)

Get User session IP address as ConfIPv4 or ConfIPv6 respectively

**Returns:** IP address as ConfIPv4 or ConfIPv6

### getProtocol() <a href="#getprotocol-7199008875a5" id="getprotocol-7199008875a5"></a>

```java
public int getProtocol()
```

Get User session protocol type

**Returns:** int representing the protocol type

### getRunningActionTrans() <a href="#getrunningactiontrans-3b0c0768ffd9" id="getrunningactiontrans-3b0c0768ffd9"></a>

```java
protected com.tailf.dp.DpActionTrans[] getRunningActionTrans()
```

Types: [DpActionTrans](DpActionTrans.md#dpactiontrans-b975ce2c2d93)

### getUserId() <a href="#getuserid-46c2e98d8db7" id="getuserid-46c2e98d8db7"></a>

```java
public int getUserId()
```

Get user session id

**Returns:** usid as int

### getUserName() <a href="#getusername-d985b9b35273" id="getusername-d985b9b35273"></a>

```java
public String getUserName()
```

Get user name

**Returns:** user name as string

### removeRunningActionTrans(DpActionTrans) <a href="#removerunningactiontrans-c41179725077" id="removerunningactiontrans-c41179725077"></a>

```java
protected void removeRunningActionTrans(com.tailf.dp.DpActionTrans actionTrans)
```

Types: [DpActionTrans](DpActionTrans.md#dpactiontrans-b975ce2c2d93)

**Parameters**

- `com.tailf.dp.DpActionTrans actionTrans`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Formats the User information
