<a id="s-SnmpaNotification"></a>
# SnmpaNotification

```java
public class com.tailf.notif.SnmpaNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#s-Notification)

Data structure SNMP agent notifications.

## Members

**Constructors**:

- [SnmpaNotification(int, int, int, InetAddress, ConfObject, int, int, int, int, Varbind[], TrapInfo)](#s-SnmpaNotification-1)

**Fields**:

- [SNMPA_PDU_GET_BULK_REQUEST](#s-SNMPA_PDU_GET_BULK_REQUEST)
- [SNMPA_PDU_GET_NEXT_REQUEST](#s-SNMPA_PDU_GET_NEXT_REQUEST)
- [SNMPA_PDU_GET_REQUEST](#s-SNMPA_PDU_GET_REQUEST)
- [SNMPA_PDU_GET_RESPONSE](#s-SNMPA_PDU_GET_RESPONSE)
- [SNMPA_PDU_INFORM](#s-SNMPA_PDU_INFORM)
- [SNMPA_PDU_REPORT](#s-SNMPA_PDU_REPORT)
- [SNMPA_PDU_SET_REQUEST](#s-SNMPA_PDU_SET_REQUEST)
- [SNMPA_PDU_V1TRAP](#s-SNMPA_PDU_V1TRAP)
- [SNMPA_PDU_V2TRAP](#s-SNMPA_PDU_V2TRAP)
- [type](Notification.md#s-type) from Notification

**Methods**:

- [getErrorIndex()](#s-getErrorIndex)
- [getErrorStatus()](#s-getErrorStatus)
- [getIP()](#s-getIP)
- [getIPValue()](#s-getIPValue)
- [getNotificationType()](Notification.md#s-getNotificationType) from Notification
- [getNumVariables()](#s-getNumVariables)
- [getPDUType()](#s-getPDUType)
- [getPort()](#s-getPort)
- [getRequestId()](#s-getRequestId)
- [getTransaction()](#s-getTransaction)
- [getTrapInfo()](#s-getTrapInfo)
- [getVarBinds()](#s-getVarBinds)
- [toString()](#s-toString)

**Nested Types**:

- [SnmpVar](SnmpaNotification/SnmpVar.md#s-SnmpVar)
- [TrapInfo](SnmpaNotification/TrapInfo.md#s-TrapInfo)
- [Varbind](SnmpaNotification/Varbind.md#s-Varbind)

## Constructors

<a id="s-SnmpaNotification-1"></a>
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

Types: [ConfObject](../conf/ConfObject.md#s-ConfObject), [Varbind](SnmpaNotification/Varbind.md#s-Varbind), [TrapInfo](SnmpaNotification/TrapInfo.md#s-TrapInfo)

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

<a id="s-SNMPA_PDU_GET_BULK_REQUEST"></a>
### SNMPA_PDU_GET_BULK_REQUEST

```java
public static final int SNMPA_PDU_GET_BULK_REQUEST = 8;
```

<a id="s-SNMPA_PDU_GET_NEXT_REQUEST"></a>
### SNMPA_PDU_GET_NEXT_REQUEST

```java
public static final int SNMPA_PDU_GET_NEXT_REQUEST = 6;
```

<a id="s-SNMPA_PDU_GET_REQUEST"></a>
### SNMPA_PDU_GET_REQUEST

```java
public static final int SNMPA_PDU_GET_REQUEST = 5;
```

<a id="s-SNMPA_PDU_GET_RESPONSE"></a>
### SNMPA_PDU_GET_RESPONSE

```java
public static final int SNMPA_PDU_GET_RESPONSE = 4;
```

<a id="s-SNMPA_PDU_INFORM"></a>
### SNMPA_PDU_INFORM

```java
public static final int SNMPA_PDU_INFORM = 3;
```

<a id="s-SNMPA_PDU_REPORT"></a>
### SNMPA_PDU_REPORT

```java
public static final int SNMPA_PDU_REPORT = 7;
```

<a id="s-SNMPA_PDU_SET_REQUEST"></a>
### SNMPA_PDU_SET_REQUEST

```java
public static final int SNMPA_PDU_SET_REQUEST = 9;
```

<a id="s-SNMPA_PDU_V1TRAP"></a>
### SNMPA_PDU_V1TRAP

```java
public static final int SNMPA_PDU_V1TRAP = 1;
```

<a id="s-SNMPA_PDU_V2TRAP"></a>
### SNMPA_PDU_V2TRAP

```java
public static final int SNMPA_PDU_V2TRAP = 2;
```


## Methods

<a id="s-getErrorIndex"></a>
### getErrorIndex()

```java
public int getErrorIndex()
```

<a id="s-getErrorStatus"></a>
### getErrorStatus()

```java
public int getErrorStatus()
```

<a id="s-getIP"></a>
### getIP()

```java
public java.net.InetAddress getIP()
```

<a id="s-getIPValue"></a>
### getIPValue()

```java
public com.tailf.conf.ConfObject getIPValue()
```

Types: [ConfObject](../conf/ConfObject.md#s-ConfObject)

<a id="s-getNumVariables"></a>
### getNumVariables()

```java
public int getNumVariables()
```

size of vbinds

<a id="s-getPDUType"></a>
### getPDUType()

```java
public int getPDUType()
```

<a id="s-getPort"></a>
### getPort()

```java
public int getPort()
```

<a id="s-getRequestId"></a>
### getRequestId()

```java
public int getRequestId()
```

<a id="s-getTransaction"></a>
### getTransaction()

```java
public int getTransaction()
```

<a id="s-getTrapInfo"></a>
### getTrapInfo()

```java
public com.tailf.notif.SnmpaNotification.TrapInfo getTrapInfo()
```

Types: [TrapInfo](SnmpaNotification/TrapInfo.md#s-TrapInfo)

<a id="s-getVarBinds"></a>
### getVarBinds()

```java
public com.tailf.notif.SnmpaNotification.Varbind[] getVarBinds()
```

Types: [Varbind](SnmpaNotification/Varbind.md#s-Varbind)

<a id="s-toString"></a>
### toString()

```java
public String toString()
```


## Nested Types

- [SnmpVar](SnmpaNotification/SnmpVar.md)
- [TrapInfo](SnmpaNotification/TrapInfo.md)
- [Varbind](SnmpaNotification/Varbind.md)
