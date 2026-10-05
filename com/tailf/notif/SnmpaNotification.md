<a id="cls-SnmpaNotification"></a>
# SnmpaNotification

```java
public class com.tailf.notif.SnmpaNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure SNMP agent notifications.

## Members

**Constructors**:

- [SnmpaNotification(int, int, int, InetAddress, ConfObject, int, int, int, int, Varbind[], TrapInfo)](#m-snmpanotification-d23ddb9474be)

**Fields**:

- [SNMPA_PDU_GET_BULK_REQUEST](#m-SNMPA_PDU_GET_BULK_REQUEST)
- [SNMPA_PDU_GET_NEXT_REQUEST](#m-SNMPA_PDU_GET_NEXT_REQUEST)
- [SNMPA_PDU_GET_REQUEST](#m-SNMPA_PDU_GET_REQUEST)
- [SNMPA_PDU_GET_RESPONSE](#m-SNMPA_PDU_GET_RESPONSE)
- [SNMPA_PDU_INFORM](#m-SNMPA_PDU_INFORM)
- [SNMPA_PDU_REPORT](#m-SNMPA_PDU_REPORT)
- [SNMPA_PDU_SET_REQUEST](#m-SNMPA_PDU_SET_REQUEST)
- [SNMPA_PDU_V1TRAP](#m-SNMPA_PDU_V1TRAP)
- [SNMPA_PDU_V2TRAP](#m-SNMPA_PDU_V2TRAP)
- [type](Notification.md#m-type) from Notification

**Methods**:

- [getErrorIndex()](#m-geterrorindex-aadca6a93413)
- [getErrorStatus()](#m-geterrorstatus-ad62464925f5)
- [getIP()](#m-getip-c2f1d3db411f)
- [getIPValue()](#m-getipvalue-7154021b2d96)
- [getNotificationType()](Notification.md#m-getnotificationtype-f0e32b7b644f) from Notification
- [getNumVariables()](#m-getnumvariables-5b1d8e7ecf95)
- [getPDUType()](#m-getpdutype-1f4c201e2247)
- [getPort()](#m-getport-a2225f868a2b)
- [getRequestId()](#m-getrequestid-7e5a443c4675)
- [getTransaction()](#m-gettransaction-4f1c72a828a1)
- [getTrapInfo()](#m-gettrapinfo-b50e18c963f5)
- [getVarBinds()](#m-getvarbinds-af55445f0448)
- [toString()](#m-tostring-e9d48c5503ef)

**Nested Types**:

- [SnmpVar](SnmpaNotification/SnmpVar.md#cls-SnmpVar)
- [TrapInfo](SnmpaNotification/TrapInfo.md#cls-TrapInfo)
- [Varbind](SnmpaNotification/Varbind.md#cls-Varbind)

## Constructors

<a id="m-snmpanotification-d23ddb9474be"></a>
### SnmpaNotification(int, int, int, InetAddress, ConfObject, int, int, int, int, Varbind[], TrapInfo)

```java
public SnmpaNotification(
    int pduType,
    int requestId,
    int thandle,
    java.net.InetAddress ip,
    com.tailf.conf.ConfObject ipValue,
    int port,
    int errorStatus,
    int errorIndex,
    int numVariables,
    com.tailf.notif.SnmpaNotification.Varbind[] varbinds,
    com.tailf.notif.SnmpaNotification.TrapInfo v1Trap
)
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject), [Varbind](SnmpaNotification/Varbind.md#cls-Varbind), [TrapInfo](SnmpaNotification/TrapInfo.md#cls-TrapInfo)

**Parameters**

- `int pduType`
- `int requestId`
- `int thandle`
- `java.net.InetAddress ip`
- `com.tailf.conf.ConfObject ipValue`
- `int port`
- `int errorStatus`
- `int errorIndex`
- `int numVariables`
- `com.tailf.notif.SnmpaNotification.Varbind[] varbinds`
- `com.tailf.notif.SnmpaNotification.TrapInfo v1Trap`


## Fields

<a id="m-SNMPA_PDU_GET_BULK_REQUEST"></a>
### SNMPA_PDU_GET_BULK_REQUEST

```java
public static final int SNMPA_PDU_GET_BULK_REQUEST = 8;
```

<a id="m-SNMPA_PDU_GET_NEXT_REQUEST"></a>
### SNMPA_PDU_GET_NEXT_REQUEST

```java
public static final int SNMPA_PDU_GET_NEXT_REQUEST = 6;
```

<a id="m-SNMPA_PDU_GET_REQUEST"></a>
### SNMPA_PDU_GET_REQUEST

```java
public static final int SNMPA_PDU_GET_REQUEST = 5;
```

<a id="m-SNMPA_PDU_GET_RESPONSE"></a>
### SNMPA_PDU_GET_RESPONSE

```java
public static final int SNMPA_PDU_GET_RESPONSE = 4;
```

<a id="m-SNMPA_PDU_INFORM"></a>
### SNMPA_PDU_INFORM

```java
public static final int SNMPA_PDU_INFORM = 3;
```

<a id="m-SNMPA_PDU_REPORT"></a>
### SNMPA_PDU_REPORT

```java
public static final int SNMPA_PDU_REPORT = 7;
```

<a id="m-SNMPA_PDU_SET_REQUEST"></a>
### SNMPA_PDU_SET_REQUEST

```java
public static final int SNMPA_PDU_SET_REQUEST = 9;
```

<a id="m-SNMPA_PDU_V1TRAP"></a>
### SNMPA_PDU_V1TRAP

```java
public static final int SNMPA_PDU_V1TRAP = 1;
```

<a id="m-SNMPA_PDU_V2TRAP"></a>
### SNMPA_PDU_V2TRAP

```java
public static final int SNMPA_PDU_V2TRAP = 2;
```


## Methods

<a id="m-geterrorindex-aadca6a93413"></a>
### getErrorIndex()

```java
public int getErrorIndex()
```

<a id="m-geterrorstatus-ad62464925f5"></a>
### getErrorStatus()

```java
public int getErrorStatus()
```

<a id="m-getip-c2f1d3db411f"></a>
### getIP()

```java
public java.net.InetAddress getIP()
```

<a id="m-getipvalue-7154021b2d96"></a>
### getIPValue()

```java
public com.tailf.conf.ConfObject getIPValue()
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)

<a id="m-getnumvariables-5b1d8e7ecf95"></a>
### getNumVariables()

```java
public int getNumVariables()
```

size of vbinds

<a id="m-getpdutype-1f4c201e2247"></a>
### getPDUType()

```java
public int getPDUType()
```

<a id="m-getport-a2225f868a2b"></a>
### getPort()

```java
public int getPort()
```

<a id="m-getrequestid-7e5a443c4675"></a>
### getRequestId()

```java
public int getRequestId()
```

<a id="m-gettransaction-4f1c72a828a1"></a>
### getTransaction()

```java
public int getTransaction()
```

<a id="m-gettrapinfo-b50e18c963f5"></a>
### getTrapInfo()

```java
public com.tailf.notif.SnmpaNotification.TrapInfo getTrapInfo()
```

Types: [TrapInfo](SnmpaNotification/TrapInfo.md#cls-TrapInfo)

<a id="m-getvarbinds-af55445f0448"></a>
### getVarBinds()

```java
public com.tailf.notif.SnmpaNotification.Varbind[] getVarBinds()
```

Types: [Varbind](SnmpaNotification/Varbind.md#cls-Varbind)

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```


## Nested Types

- [SnmpVar](SnmpaNotification/SnmpVar.md#cls-SnmpVar)
- [TrapInfo](SnmpaNotification/TrapInfo.md#cls-TrapInfo)
- [Varbind](SnmpaNotification/Varbind.md#cls-Varbind)
