# CallHomeInfoNotification <a href="#cls-CallHomeInfoNotification" id="cls-CallHomeInfoNotification"></a>

```java
public class com.tailf.notif.CallHomeInfoNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Events generated for NETCONF Call Home connections.

## Members

**Constructors**:

- [CallHomeInfoNotification(int, String, InetAddress, ConfObject, int, String, String)](#m-CallHomeInfoNotification-b74c80a89340)

**Fields**:

- [CALL_HOME_DEVICE_CONNECTED](#m-CALL_HOME_DEVICE_CONNECTED)
- [CALL_HOME_DEVICE_DISCONNECTED](#m-CALL_HOME_DEVICE_DISCONNECTED)
- [CALL_HOME_UNKNOWN_DEVICE](#m-CALL_HOME_UNKNOWN_DEVICE)
- [type](Notification.md#m-type) from Notification

**Methods**:

- [getDevice()](#m-getDevice-4acac4557fc6)
- [getInfoType()](#m-getInfoType-b2cb4d4dc10b)
- [getIP()](#m-getIP-c2f1d3db411f)
- [getIPValue()](#m-getIPValue-7154021b2d96)
- [getNotificationType()](Notification.md#m-getNotificationType-f0e32b7b644f) from Notification
- [getPort()](#m-getPort-a2225f868a2b)
- [getSSHHostKey()](#m-getSSHHostKey-7e4df2de094c)
- [getSSHKeyAlg()](#m-getSSHKeyAlg-2bd530885260)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### CallHomeInfoNotification(int, String, InetAddress, ConfObject, int, String, String) <a href="#m-CallHomeInfoNotification-b74c80a89340" id="m-CallHomeInfoNotification-b74c80a89340"></a>

```java
public CallHomeInfoNotification(
    int infoType,
    String device,
    java.net.InetAddress ip,
    com.tailf.conf.ConfObject ipValue,
    int port,
    String key,
    String alg
)
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)

Creates a notification describing a Call Home event.

**Parameters**

- `int infoType` - one of the CALL_HOME_* constants indicating the event
        type
- `String device` - device name (present for connected/disconnected events)
- `java.net.InetAddress ip` - remote IP address of the connection
- `com.tailf.conf.ConfObject ipValue` - ConfObject representing the IP (supports both v4/v6)
- `int port` - remote TCP port
- `String key` - SSH host key (fingerprint or textual representation)
- `String alg` - SSH host key algorithm


## Fields

### CALL_HOME_DEVICE_CONNECTED <a href="#m-CALL_HOME_DEVICE_CONNECTED" id="m-CALL_HOME_DEVICE_CONNECTED"></a>

```java
public static final int CALL_HOME_DEVICE_CONNECTED = 1;
```

Device connected via NETCONF Call Home and recognized/configured.

### CALL_HOME_DEVICE_DISCONNECTED <a href="#m-CALL_HOME_DEVICE_DISCONNECTED" id="m-CALL_HOME_DEVICE_DISCONNECTED"></a>

```java
public static final int CALL_HOME_DEVICE_DISCONNECTED = 3;
```

Previously connected Call Home device disconnected.

### CALL_HOME_UNKNOWN_DEVICE <a href="#m-CALL_HOME_UNKNOWN_DEVICE" id="m-CALL_HOME_UNKNOWN_DEVICE"></a>

```java
public static final int CALL_HOME_UNKNOWN_DEVICE = 2;
```

Incoming Call Home connection from an unknown/unconfigured device.


## Methods

### getDevice() <a href="#m-getDevice-4acac4557fc6" id="m-getDevice-4acac4557fc6"></a>

```java
public String getDevice()
```

Returns the device name if known.

**Returns:** device name or null if unknown

### getInfoType() <a href="#m-getInfoType-b2cb4d4dc10b" id="m-getInfoType-b2cb4d4dc10b"></a>

```java
public int getInfoType()
```

Info type:


- [`CALL_HOME_DEVICE_CONNECTED`](CallHomeInfoNotification.md#m-CALL_HOME_DEVICE_CONNECTED)
   - [`CALL_HOME_UNKNOWN_DEVICE`](CallHomeInfoNotification.md#m-CALL_HOME_UNKNOWN_DEVICE)
     - [`CALL_HOME_DEVICE_DISCONNECTED`](CallHomeInfoNotification.md#m-CALL_HOME_DEVICE_DISCONNECTED)

**Returns:** info type constant

### getIP() <a href="#m-getIP-c2f1d3db411f" id="m-getIP-c2f1d3db411f"></a>

```java
public java.net.InetAddress getIP()
```

Returns the remote IP address of the Call Home connection.

**Returns:** remote IP address or null if not applicable

### getIPValue() <a href="#m-getIPValue-7154021b2d96" id="m-getIPValue-7154021b2d96"></a>

```java
public com.tailf.conf.ConfObject getIPValue()
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)

Returns the ConfObject form of the IP address

**Returns:** ConfObject for the IP address or null if not applicable

### getPort() <a href="#m-getPort-a2225f868a2b" id="m-getPort-a2225f868a2b"></a>

```java
public int getPort()
```

Returns the TCP port used by the remote endpoint.

**Returns:** remote port number or 0 if not set

### getSSHHostKey() <a href="#m-getSSHHostKey-7e4df2de094c" id="m-getSSHHostKey-7e4df2de094c"></a>

```java
public String getSSHHostKey()
```

Returns the SSH host key presented by the device.

**Returns:** SSH host key string or null if not available

### getSSHKeyAlg() <a href="#m-getSSHKeyAlg-2bd530885260" id="m-getSSHKeyAlg-2bd530885260"></a>

```java
public String getSSHKeyAlg()
```

Returns the SSH host key algorithm presented by the device during the
 Call Home connection.

**Returns:** the SSH key algorithm

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Builds a human readable representation of this notification.

**Returns:** string form including event type and relevant attributes
