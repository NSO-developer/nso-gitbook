<a id="cls-DpUserInfo"></a>
# DpUserInfo

```java
public class com.tailf.dp.DpUserInfo
```

The user information.

## Members

**Constructors**:

- [DpUserInfo(ConfETuple)](#m-dpuserinfo-b042388b04f5)

**Methods**:

- [addRunningActionTrans(DpActionTrans)](#m-addrunningactiontrans-d75b58ec9312)
- [getContext()](#m-getcontext-b18d576df5d9)
- [getIPAddress()](#m-getipaddress-ff0e3ce26ce7)
- [getProtocol()](#m-getprotocol-7199008875a5)
- [getRunningActionTrans()](#m-getrunningactiontrans-3b0c0768ffd9)
- [getUserId()](#m-getuserid-46c2e98d8db7)
- [getUserName()](#m-getusername-d985b9b35273)
- [removeRunningActionTrans(DpActionTrans)](#m-removerunningactiontrans-c41179725077)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-dpuserinfo-b042388b04f5"></a>
### DpUserInfo(ConfETuple)

```java
public DpUserInfo(com.tailf.proto.ConfETuple usess) throws com.tailf.conf.ConfException
```

Types: [ConfETuple](../proto/ConfETuple.md#cls-ConfETuple), [ConfException](../conf/ConfException.md#cls-ConfException)

Internally used Constructor.

**Parameters**

- `com.tailf.proto.ConfETuple usess`


## Methods

<a id="m-addrunningactiontrans-d75b58ec9312"></a>
### addRunningActionTrans(DpActionTrans)

```java
protected void addRunningActionTrans(com.tailf.dp.DpActionTrans actionTrans)
```

Types: [DpActionTrans](DpActionTrans.md#cls-DpActionTrans)

**Parameters**

- `com.tailf.dp.DpActionTrans actionTrans`

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
public com.tailf.conf.ConfObject getIPAddress()
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)

Get User session IP address as ConfIPv4 or ConfIPv6 respectively

**Returns:** IP address as ConfIPv4 or ConfIPv6

<a id="m-getprotocol-7199008875a5"></a>
### getProtocol()

```java
public int getProtocol()
```

Get User session protocol type

**Returns:** int representing the protocol type

<a id="m-getrunningactiontrans-3b0c0768ffd9"></a>
### getRunningActionTrans()

```java
protected com.tailf.dp.DpActionTrans[] getRunningActionTrans()
```

Types: [DpActionTrans](DpActionTrans.md#cls-DpActionTrans)

<a id="m-getuserid-46c2e98d8db7"></a>
### getUserId()

```java
public int getUserId()
```

Get user session id

**Returns:** usid as int

<a id="m-getusername-d985b9b35273"></a>
### getUserName()

```java
public String getUserName()
```

Get user name

**Returns:** user name as string

<a id="m-removerunningactiontrans-c41179725077"></a>
### removeRunningActionTrans(DpActionTrans)

```java
protected void removeRunningActionTrans(com.tailf.dp.DpActionTrans actionTrans)
```

Types: [DpActionTrans](DpActionTrans.md#cls-DpActionTrans)

**Parameters**

- `com.tailf.dp.DpActionTrans actionTrans`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Formats the User information
