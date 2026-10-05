<a id="cls-CallHomeInfoNotification"></a>
# CallHomeInfoNotification

```java
public class com.tailf.notif.CallHomeInfoNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Events generated for NETCONF Call Home connections.

## Members

**Constructors**:

- [CallHomeInfoNotification(int, String, InetAddress, ConfObject, int, String, String)](#m-callhomeinfonotification-b74c80a89340)

**Fields**:

- [CALL_HOME_DEVICE_CONNECTED](#m-CALL_HOME_DEVICE_CONNECTED)
- [CALL_HOME_DEVICE_DISCONNECTED](#m-CALL_HOME_DEVICE_DISCONNECTED)
- [CALL_HOME_UNKNOWN_DEVICE](#m-CALL_HOME_UNKNOWN_DEVICE)
- [type](Notification.md#m-type) from Notification

**Methods**:

- [getDevice()](#m-getdevice-4acac4557fc6)
- [getInfoType()](#m-getinfotype-b2cb4d4dc10b)
- [getIP()](#m-getip-c2f1d3db411f)
- [getIPValue()](#m-getipvalue-7154021b2d96)
- [getNotificationType()](Notification.md#m-getnotificationtype-f0e32b7b644f) from Notification
- [getPort()](#m-getport-a2225f868a2b)
- [getSSHHostKey()](#m-getsshhostkey-7e4df2de094c)
- [getSSHKeyAlg()](#m-getsshkeyalg-2bd530885260)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-callhomeinfonotification-b74c80a89340"></a>
### CallHomeInfoNotification(int, String, InetAddress, ConfObject, int, String, String)

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

<a id="m-CALL_HOME_DEVICE_CONNECTED"></a>
### CALL_HOME_DEVICE_CONNECTED

```java
public static final int CALL_HOME_DEVICE_CONNECTED = 1;
```

Device connected via NETCONF Call Home and recognized/configured.

<a id="m-CALL_HOME_DEVICE_DISCONNECTED"></a>
### CALL_HOME_DEVICE_DISCONNECTED

```java
public static final int CALL_HOME_DEVICE_DISCONNECTED = 3;
```

Previously connected Call Home device disconnected.

<a id="m-CALL_HOME_UNKNOWN_DEVICE"></a>
### CALL_HOME_UNKNOWN_DEVICE

```java
public static final int CALL_HOME_UNKNOWN_DEVICE = 2;
```

Incoming Call Home connection from an unknown/unconfigured device.


## Methods

<a id="m-getdevice-4acac4557fc6"></a>
### getDevice()

```java
public String getDevice()
```

Returns the device name if known.

**Returns:** device name or null if unknown

<a id="m-getinfotype-b2cb4d4dc10b"></a>
### getInfoType()

```java
public int getInfoType()
```

Info type:


- `#CALL_HOME_DEVICE_CONNECTED`
   - `#CALL_HOME_UNKNOWN_DEVICE`
     - `#CALL_HOME_DEVICE_DISCONNECTED`

**Returns:** info type constant

<a id="m-getip-c2f1d3db411f"></a>
### getIP()

```java
public java.net.InetAddress getIP()
```

Returns the remote IP address of the Call Home connection.

**Returns:** remote IP address or null if not applicable

<a id="m-getipvalue-7154021b2d96"></a>
### getIPValue()

```java
public com.tailf.conf.ConfObject getIPValue()
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)

Returns the ConfObject form of the IP address

**Returns:** ConfObject for the IP address or null if not applicable

<a id="m-getport-a2225f868a2b"></a>
### getPort()

```java
public int getPort()
```

Returns the TCP port used by the remote endpoint.

**Returns:** remote port number or 0 if not set

<a id="m-getsshhostkey-7e4df2de094c"></a>
### getSSHHostKey()

```java
public String getSSHHostKey()
```

Returns the SSH host key presented by the device.

**Returns:** SSH host key string or null if not available

<a id="m-getsshkeyalg-2bd530885260"></a>
### getSSHKeyAlg()

```java
public String getSSHKeyAlg()
```

Returns the SSH host key algorithm presented by the device during the
 Call Home connection.

**Returns:** the SSH key algorithm

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Builds a human readable representation of this notification.

**Returns:** string form including event type and relevant attributes
