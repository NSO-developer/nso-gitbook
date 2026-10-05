# CallHomeInfoNotification <a href="#callhomeinfonotification-d29c7e74561c" id="callhomeinfonotification-d29c7e74561c"></a>

```java
public class com.tailf.notif.CallHomeInfoNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#notification-b2e7d82d4215)

Events generated for NETCONF Call Home connections.

## Members

**Constructors**:

- [CallHomeInfoNotification(int, String, InetAddress, ConfObject, int, String, String)](#callhomeinfonotification-b74c80a89340)

**Fields**:

- [CALL_HOME_DEVICE_CONNECTED](#call_home_device_connected-deac5719fac8)
- [CALL_HOME_DEVICE_DISCONNECTED](#call_home_device_disconnected-7a5953fa30bd)
- [CALL_HOME_UNKNOWN_DEVICE](#call_home_unknown_device-b75ce9edca85)
- [type](Notification.md#type-6ebb3673fbb6) from Notification

**Methods**:

- [getDevice()](#getdevice-4acac4557fc6)
- [getInfoType()](#getinfotype-b2cb4d4dc10b)
- [getIP()](#getip-c2f1d3db411f)
- [getIPValue()](#getipvalue-7154021b2d96)
- [getNotificationType()](Notification.md#getnotificationtype-f0e32b7b644f) from Notification
- [getPort()](#getport-a2225f868a2b)
- [getSSHHostKey()](#getsshhostkey-7e4df2de094c)
- [getSSHKeyAlg()](#getsshkeyalg-2bd530885260)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### CallHomeInfoNotification(int, String, InetAddress, ConfObject, int, String, String) <a href="#callhomeinfonotification-b74c80a89340" id="callhomeinfonotification-b74c80a89340"></a>

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

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2)

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

### CALL_HOME_DEVICE_CONNECTED <a href="#call_home_device_connected-deac5719fac8" id="call_home_device_connected-deac5719fac8"></a>

```java
public static final int CALL_HOME_DEVICE_CONNECTED = 1;
```

Device connected via NETCONF Call Home and recognized/configured.

### CALL_HOME_DEVICE_DISCONNECTED <a href="#call_home_device_disconnected-7a5953fa30bd" id="call_home_device_disconnected-7a5953fa30bd"></a>

```java
public static final int CALL_HOME_DEVICE_DISCONNECTED = 3;
```

Previously connected Call Home device disconnected.

### CALL_HOME_UNKNOWN_DEVICE <a href="#call_home_unknown_device-b75ce9edca85" id="call_home_unknown_device-b75ce9edca85"></a>

```java
public static final int CALL_HOME_UNKNOWN_DEVICE = 2;
```

Incoming Call Home connection from an unknown/unconfigured device.


## Methods

### getDevice() <a href="#getdevice-4acac4557fc6" id="getdevice-4acac4557fc6"></a>

```java
public String getDevice()
```

Returns the device name if known.

**Returns:** device name or null if unknown

### getInfoType() <a href="#getinfotype-b2cb4d4dc10b" id="getinfotype-b2cb4d4dc10b"></a>

```java
public int getInfoType()
```

Info type:


- [`CALL_HOME_DEVICE_CONNECTED`](CallHomeInfoNotification.md#call_home_device_connected-deac5719fac8)
   - [`CALL_HOME_UNKNOWN_DEVICE`](CallHomeInfoNotification.md#call_home_unknown_device-b75ce9edca85)
     - [`CALL_HOME_DEVICE_DISCONNECTED`](CallHomeInfoNotification.md#call_home_device_disconnected-7a5953fa30bd)

**Returns:** info type constant

### getIP() <a href="#getip-c2f1d3db411f" id="getip-c2f1d3db411f"></a>

```java
public java.net.InetAddress getIP()
```

Returns the remote IP address of the Call Home connection.

**Returns:** remote IP address or null if not applicable

### getIPValue() <a href="#getipvalue-7154021b2d96" id="getipvalue-7154021b2d96"></a>

```java
public com.tailf.conf.ConfObject getIPValue()
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2)

Returns the ConfObject form of the IP address

**Returns:** ConfObject for the IP address or null if not applicable

### getPort() <a href="#getport-a2225f868a2b" id="getport-a2225f868a2b"></a>

```java
public int getPort()
```

Returns the TCP port used by the remote endpoint.

**Returns:** remote port number or 0 if not set

### getSSHHostKey() <a href="#getsshhostkey-7e4df2de094c" id="getsshhostkey-7e4df2de094c"></a>

```java
public String getSSHHostKey()
```

Returns the SSH host key presented by the device.

**Returns:** SSH host key string or null if not available

### getSSHKeyAlg() <a href="#getsshkeyalg-2bd530885260" id="getsshkeyalg-2bd530885260"></a>

```java
public String getSSHKeyAlg()
```

Returns the SSH host key algorithm presented by the device during the
 Call Home connection.

**Returns:** the SSH key algorithm

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Builds a human readable representation of this notification.

**Returns:** string form including event type and relevant attributes
