# SnmpaNotification <a href="#cls-SnmpaNotification" id="cls-SnmpaNotification"></a>

```java
public class com.tailf.notif.SnmpaNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure SNMP agent notifications.

## Members

**Constructors**:

- [SnmpaNotification(int, int, int, InetAddress, ConfObject, int, int, int, int, Varbind[], TrapInfo)](#m-SnmpaNotification-d23ddb9474be)

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

- [getErrorIndex()](#m-getErrorIndex-aadca6a93413)
- [getErrorStatus()](#m-getErrorStatus-ad62464925f5)
- [getIP()](#m-getIP-c2f1d3db411f)
- [getIPValue()](#m-getIPValue-7154021b2d96)
- [getNotificationType()](Notification.md#m-getNotificationType-f0e32b7b644f) from Notification
- [getNumVariables()](#m-getNumVariables-5b1d8e7ecf95)
- [getPDUType()](#m-getPDUType-1f4c201e2247)
- [getPort()](#m-getPort-a2225f868a2b)
- [getRequestId()](#m-getRequestId-7e5a443c4675)
- [getTransaction()](#m-getTransaction-4f1c72a828a1)
- [getTrapInfo()](#m-getTrapInfo-b50e18c963f5)
- [getVarBinds()](#m-getVarBinds-af55445f0448)
- [toString()](#m-toString-e9d48c5503ef)

**Nested Types**:

- [SnmpVar](SnmpaNotification/SnmpVar.md#cls-SnmpVar)
- [TrapInfo](SnmpaNotification/TrapInfo.md#cls-TrapInfo)
- [Varbind](SnmpaNotification/Varbind.md#cls-Varbind)

## Constructors

### SnmpaNotification(int, int, int, InetAddress, ConfObject, int, int, int, int, Varbind[], TrapInfo) <a href="#m-SnmpaNotification-d23ddb9474be" id="m-SnmpaNotification-d23ddb9474be"></a>

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

### SNMPA_PDU_GET_BULK_REQUEST <a href="#m-SNMPA_PDU_GET_BULK_REQUEST" id="m-SNMPA_PDU_GET_BULK_REQUEST"></a>

```java
public static final int SNMPA_PDU_GET_BULK_REQUEST = 8;
```

### SNMPA_PDU_GET_NEXT_REQUEST <a href="#m-SNMPA_PDU_GET_NEXT_REQUEST" id="m-SNMPA_PDU_GET_NEXT_REQUEST"></a>

```java
public static final int SNMPA_PDU_GET_NEXT_REQUEST = 6;
```

### SNMPA_PDU_GET_REQUEST <a href="#m-SNMPA_PDU_GET_REQUEST" id="m-SNMPA_PDU_GET_REQUEST"></a>

```java
public static final int SNMPA_PDU_GET_REQUEST = 5;
```

### SNMPA_PDU_GET_RESPONSE <a href="#m-SNMPA_PDU_GET_RESPONSE" id="m-SNMPA_PDU_GET_RESPONSE"></a>

```java
public static final int SNMPA_PDU_GET_RESPONSE = 4;
```

### SNMPA_PDU_INFORM <a href="#m-SNMPA_PDU_INFORM" id="m-SNMPA_PDU_INFORM"></a>

```java
public static final int SNMPA_PDU_INFORM = 3;
```

### SNMPA_PDU_REPORT <a href="#m-SNMPA_PDU_REPORT" id="m-SNMPA_PDU_REPORT"></a>

```java
public static final int SNMPA_PDU_REPORT = 7;
```

### SNMPA_PDU_SET_REQUEST <a href="#m-SNMPA_PDU_SET_REQUEST" id="m-SNMPA_PDU_SET_REQUEST"></a>

```java
public static final int SNMPA_PDU_SET_REQUEST = 9;
```

### SNMPA_PDU_V1TRAP <a href="#m-SNMPA_PDU_V1TRAP" id="m-SNMPA_PDU_V1TRAP"></a>

```java
public static final int SNMPA_PDU_V1TRAP = 1;
```

### SNMPA_PDU_V2TRAP <a href="#m-SNMPA_PDU_V2TRAP" id="m-SNMPA_PDU_V2TRAP"></a>

```java
public static final int SNMPA_PDU_V2TRAP = 2;
```


## Methods

### getErrorIndex() <a href="#m-getErrorIndex-aadca6a93413" id="m-getErrorIndex-aadca6a93413"></a>

```java
public int getErrorIndex()
```

### getErrorStatus() <a href="#m-getErrorStatus-ad62464925f5" id="m-getErrorStatus-ad62464925f5"></a>

```java
public int getErrorStatus()
```

### getIP() <a href="#m-getIP-c2f1d3db411f" id="m-getIP-c2f1d3db411f"></a>

```java
public java.net.InetAddress getIP()
```

### getIPValue() <a href="#m-getIPValue-7154021b2d96" id="m-getIPValue-7154021b2d96"></a>

```java
public com.tailf.conf.ConfObject getIPValue()
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)

### getNumVariables() <a href="#m-getNumVariables-5b1d8e7ecf95" id="m-getNumVariables-5b1d8e7ecf95"></a>

```java
public int getNumVariables()
```

size of vbinds

### getPDUType() <a href="#m-getPDUType-1f4c201e2247" id="m-getPDUType-1f4c201e2247"></a>

```java
public int getPDUType()
```

### getPort() <a href="#m-getPort-a2225f868a2b" id="m-getPort-a2225f868a2b"></a>

```java
public int getPort()
```

### getRequestId() <a href="#m-getRequestId-7e5a443c4675" id="m-getRequestId-7e5a443c4675"></a>

```java
public int getRequestId()
```

### getTransaction() <a href="#m-getTransaction-4f1c72a828a1" id="m-getTransaction-4f1c72a828a1"></a>

```java
public int getTransaction()
```

### getTrapInfo() <a href="#m-getTrapInfo-b50e18c963f5" id="m-getTrapInfo-b50e18c963f5"></a>

```java
public com.tailf.notif.SnmpaNotification.TrapInfo getTrapInfo()
```

Types: [TrapInfo](SnmpaNotification/TrapInfo.md#cls-TrapInfo)

### getVarBinds() <a href="#m-getVarBinds-af55445f0448" id="m-getVarBinds-af55445f0448"></a>

```java
public com.tailf.notif.SnmpaNotification.Varbind[] getVarBinds()
```

Types: [Varbind](SnmpaNotification/Varbind.md#cls-Varbind)

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```


## Nested Types

- [SnmpVar](SnmpaNotification/SnmpVar.md#cls-SnmpVar)
- [TrapInfo](SnmpaNotification/TrapInfo.md#cls-TrapInfo)
- [Varbind](SnmpaNotification/Varbind.md#cls-Varbind)
