# SnmpaNotification <a href="#snmpanotification-1dc17468977a" id="snmpanotification-1dc17468977a"></a>

```java
public class com.tailf.notif.SnmpaNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#notification-b2e7d82d4215)

Data structure SNMP agent notifications.

## Members

**Constructors**:

- [SnmpaNotification\(int, int, int, InetAddress, ConfObject, int, int, int, int, Varbind\[\], TrapInfo\)](#snmpanotification-d23ddb9474be)

**Fields**:

- [SNMPA\_PDU\_GET\_BULK\_REQUEST](#snmpa_pdu_get_bulk_request-c4cf740c8ebb)
- [SNMPA\_PDU\_GET\_NEXT\_REQUEST](#snmpa_pdu_get_next_request-991892c3d4b4)
- [SNMPA\_PDU\_GET\_REQUEST](#snmpa_pdu_get_request-4092ba28cdd3)
- [SNMPA\_PDU\_GET\_RESPONSE](#snmpa_pdu_get_response-7f84facbc1a5)
- [SNMPA\_PDU\_INFORM](#snmpa_pdu_inform-6a7d1835e8b5)
- [SNMPA\_PDU\_REPORT](#snmpa_pdu_report-ffa28e725fdc)
- [SNMPA\_PDU\_SET\_REQUEST](#snmpa_pdu_set_request-9fde39c7d2d1)
- [SNMPA\_PDU\_V1TRAP](#snmpa_pdu_v1trap-67541dba9349)
- [SNMPA\_PDU\_V2TRAP](#snmpa_pdu_v2trap-d06cbef2315b)
- [type](Notification.md#type-6ebb3673fbb6) from Notification

**Methods**:

- [getErrorIndex\(\)](#geterrorindex-aadca6a93413)
- [getErrorStatus\(\)](#geterrorstatus-ad62464925f5)
- [getIP\(\)](#getip-c2f1d3db411f)
- [getIPValue\(\)](#getipvalue-7154021b2d96)
- [getNotificationType\(\)](Notification.md#getnotificationtype-f0e32b7b644f) from Notification
- [getNumVariables\(\)](#getnumvariables-5b1d8e7ecf95)
- [getPDUType\(\)](#getpdutype-1f4c201e2247)
- [getPort\(\)](#getport-a2225f868a2b)
- [getRequestId\(\)](#getrequestid-7e5a443c4675)
- [getTransaction\(\)](#gettransaction-4f1c72a828a1)
- [getTrapInfo\(\)](#gettrapinfo-b50e18c963f5)
- [getVarBinds\(\)](#getvarbinds-af55445f0448)
- [toString\(\)](#tostring-e9d48c5503ef)

**Nested Types**:

- [SnmpVar](SnmpaNotification/SnmpVar.md#snmpvar-63e4e33a3a0a)
- [TrapInfo](SnmpaNotification/TrapInfo.md#trapinfo-b7d40e1a171a)
- [Varbind](SnmpaNotification/Varbind.md#varbind-54c1201bffe5)

## Constructors

### SnmpaNotification(int, int, int, InetAddress, ConfObject, int, int, int, int, Varbind[], TrapInfo) <a href="#snmpanotification-d23ddb9474be" id="snmpanotification-d23ddb9474be"></a>

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

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [Varbind](SnmpaNotification/Varbind.md#varbind-54c1201bffe5), [TrapInfo](SnmpaNotification/TrapInfo.md#trapinfo-b7d40e1a171a)

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

### SNMPA_PDU_GET_BULK_REQUEST <a href="#snmpa_pdu_get_bulk_request-c4cf740c8ebb" id="snmpa_pdu_get_bulk_request-c4cf740c8ebb"></a>

```java
public static final int SNMPA_PDU_GET_BULK_REQUEST = 8;
```

### SNMPA_PDU_GET_NEXT_REQUEST <a href="#snmpa_pdu_get_next_request-991892c3d4b4" id="snmpa_pdu_get_next_request-991892c3d4b4"></a>

```java
public static final int SNMPA_PDU_GET_NEXT_REQUEST = 6;
```

### SNMPA_PDU_GET_REQUEST <a href="#snmpa_pdu_get_request-4092ba28cdd3" id="snmpa_pdu_get_request-4092ba28cdd3"></a>

```java
public static final int SNMPA_PDU_GET_REQUEST = 5;
```

### SNMPA_PDU_GET_RESPONSE <a href="#snmpa_pdu_get_response-7f84facbc1a5" id="snmpa_pdu_get_response-7f84facbc1a5"></a>

```java
public static final int SNMPA_PDU_GET_RESPONSE = 4;
```

### SNMPA_PDU_INFORM <a href="#snmpa_pdu_inform-6a7d1835e8b5" id="snmpa_pdu_inform-6a7d1835e8b5"></a>

```java
public static final int SNMPA_PDU_INFORM = 3;
```

### SNMPA_PDU_REPORT <a href="#snmpa_pdu_report-ffa28e725fdc" id="snmpa_pdu_report-ffa28e725fdc"></a>

```java
public static final int SNMPA_PDU_REPORT = 7;
```

### SNMPA_PDU_SET_REQUEST <a href="#snmpa_pdu_set_request-9fde39c7d2d1" id="snmpa_pdu_set_request-9fde39c7d2d1"></a>

```java
public static final int SNMPA_PDU_SET_REQUEST = 9;
```

### SNMPA_PDU_V1TRAP <a href="#snmpa_pdu_v1trap-67541dba9349" id="snmpa_pdu_v1trap-67541dba9349"></a>

```java
public static final int SNMPA_PDU_V1TRAP = 1;
```

### SNMPA_PDU_V2TRAP <a href="#snmpa_pdu_v2trap-d06cbef2315b" id="snmpa_pdu_v2trap-d06cbef2315b"></a>

```java
public static final int SNMPA_PDU_V2TRAP = 2;
```


## Methods

### getErrorIndex() <a href="#geterrorindex-aadca6a93413" id="geterrorindex-aadca6a93413"></a>

```java
public int getErrorIndex()
```

### getErrorStatus() <a href="#geterrorstatus-ad62464925f5" id="geterrorstatus-ad62464925f5"></a>

```java
public int getErrorStatus()
```

### getIP() <a href="#getip-c2f1d3db411f" id="getip-c2f1d3db411f"></a>

```java
public java.net.InetAddress getIP()
```

### getIPValue() <a href="#getipvalue-7154021b2d96" id="getipvalue-7154021b2d96"></a>

```java
public com.tailf.conf.ConfObject getIPValue()
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2)

### getNumVariables() <a href="#getnumvariables-5b1d8e7ecf95" id="getnumvariables-5b1d8e7ecf95"></a>

```java
public int getNumVariables()
```

size of vbinds

### getPDUType() <a href="#getpdutype-1f4c201e2247" id="getpdutype-1f4c201e2247"></a>

```java
public int getPDUType()
```

### getPort() <a href="#getport-a2225f868a2b" id="getport-a2225f868a2b"></a>

```java
public int getPort()
```

### getRequestId() <a href="#getrequestid-7e5a443c4675" id="getrequestid-7e5a443c4675"></a>

```java
public int getRequestId()
```

### getTransaction() <a href="#gettransaction-4f1c72a828a1" id="gettransaction-4f1c72a828a1"></a>

```java
public int getTransaction()
```

### getTrapInfo() <a href="#gettrapinfo-b50e18c963f5" id="gettrapinfo-b50e18c963f5"></a>

```java
public com.tailf.notif.SnmpaNotification.TrapInfo getTrapInfo()
```

Types: [TrapInfo](SnmpaNotification/TrapInfo.md#trapinfo-b7d40e1a171a)

### getVarBinds() <a href="#getvarbinds-af55445f0448" id="getvarbinds-af55445f0448"></a>

```java
public com.tailf.notif.SnmpaNotification.Varbind[] getVarBinds()
```

Types: [Varbind](SnmpaNotification/Varbind.md#varbind-54c1201bffe5)

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```


## Nested Types

- [SnmpVar](SnmpaNotification/SnmpVar.md#snmpvar-63e4e33a3a0a)
- [TrapInfo](SnmpaNotification/TrapInfo.md#trapinfo-b7d40e1a171a)
- [Varbind](SnmpaNotification/Varbind.md#varbind-54c1201bffe5)
