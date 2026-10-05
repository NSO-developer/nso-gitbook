<a id="cls-DpSnmpNotifier"></a>
# DpSnmpNotifier

```java
public class com.tailf.dp.DpSnmpNotifier
    extends Thread
```

The application can send SNMP notifications and inform requests.

 This class implements SNMP notification. The purpose of this class to provide
 a mechanism for sending SNMP notifications.

 Example: 1 - Send SNMP V1 Notification.



```
  // int port = Conf.PORT; // ConfD TCP; NCS uses Conf.NCS_PATH (Unix socket)
  Socket s1 = new Socket(localhost, port);
  Dp dp1 = new Dp(snmp_MYNAME, s1);
  // Create notification notifier.
  // std_v1_trap must exist in notify_init.xml.
  DpSnmpNotifier notifier1 = dp1.createSnmpNotifier(std_v1_trap,
                                                    );

  // Sense a cold start notification.
  notifier1.send(coldStart, new SnmpVarbind[] {});
```



 Example 2: - Send SNMP Inform Request

 Using the following Snmp inform response callback:


```
  public class MySnmpInformResponseCallback {

      SnmpInformResponseCallback(callPoint = snmp_inform,
                              callType = { SnmpInformResponseCBType.TARGETS })
      public void targets(Integer ref, ConfETuple[] targets)
      throws DpCallbackException {
          // Add implementation here
      }

      SnmpInformResponseCallback(callPoint = snmp_inform,
                              callType = { SnmpInformResponseCBType.RESULT })
      public void result(Integer ref, ConfETuple target, Boolean gotResponse)
      throws DpCallbackException {
          // Add implementation here
      }
  }
```



 We can send an Snmp inform


```
  // int port = Conf.PORT; // ConfD TCP; NCS uses Conf.NCS_PATH (Unix socket)
  Socket s2 = new Socket(localhost, port);
  Dp dp2 = new Dp(snmp_MYNAME, s2);
  // Register callback handling targets and result.
  MySnmpInformResponseCallback myCb = new MySnmpInformResponseCallback();

  // Create notification notifier. std_v2_notification must exist in
  // notify_init.xml and support V2
  DpSnmpNotifier notifier2 =
      dp2.createSnmpNotifier(std_v2_notification,
                             , myCb);
  // Send SNMP inform request.
  // notif1 must exist in a MIB in the configuration.
  notifier2.send(notif,
                 new SnmpVarbind[] {
                 new SnmpVarbind(Integer32, new ConfInt32(32))},
                 10);
```

**Since:** 3.2.0

## Members

**Constructors**:

- [DpSnmpNotifier(String, String, DpSnmpInformResponseCallback, Socket)](#m-dpsnmpnotifier-d883475eb7e7)

**Methods**:

- [getContextName()](#m-getcontextname-cf9cc7a52502)
- [getFD()](#m-getfd-e27232a35a70)
- [getInformCb()](#m-getinformcb-40ebe64ec412)
- [getNotifyName()](#m-getnotifyname-1cb2918a2d12)
- [getSocket()](#m-getsocket-d7da2de81b81)
- [send(String, SnmpVarbind[])](#m-send-4c2d30df8160)
- [send(String, SnmpVarbind[], Integer)](#m-send-616c3e8b0825)
- [setFD(int)](#m-setfd-501c97b6d464)
- [setSocket(Socket)](#m-setsocket-183068848e4c)
- [setSourceAddress(ConfIP)](#m-setsourceaddress-a903bc69b65e)

## Constructors

<a id="m-dpsnmpnotifier-d883475eb7e7"></a>
### DpSnmpNotifier(String, String, DpSnmpInformResponseCallback, Socket)

**Package-private**

```java
DpSnmpNotifier(
    String notifyName,
    String contextName,
    com.tailf.dp.DpSnmpInformResponseCallback informCb,
    java.net.Socket socket
)
```

Types: [DpSnmpInformResponseCallback](DpSnmpInformResponseCallback.md#cls-DpSnmpInformResponseCallback)

This constructor will initialize the DpSnmpNotifier class.

**Parameters**

- `String notifyName` - the notify_init.xml notify name.
- `String contextName` - SNMP-NOTIFICATION-MIB context.
- `com.tailf.dp.DpSnmpInformResponseCallback informCb` - the inform callback to be used. null if no callback is
            provided.
- `java.net.Socket socket`

**Since:** 3.2.0


## Methods

<a id="m-getcontextname-cf9cc7a52502"></a>
### getContextName()

```java
public String getContextName()
```

<a id="m-getfd-e27232a35a70"></a>
### getFD()

```java
public int getFD()
```

file descriptor

<a id="m-getinformcb-40ebe64ec412"></a>
### getInformCb()

```java
public com.tailf.dp.DpSnmpInformResponseCallback getInformCb()
```

Types: [DpSnmpInformResponseCallback](DpSnmpInformResponseCallback.md#cls-DpSnmpInformResponseCallback)

The inform callback. null means no callback.

<a id="m-getnotifyname-1cb2918a2d12"></a>
### getNotifyName()

```java
public String getNotifyName()
```

The notify_init.xml notify name.

<a id="m-getsocket-d7da2de81b81"></a>
### getSocket()

```java
public java.net.Socket getSocket()
```

The worker socket which is connected to ConfD/NCS. This socket will be
 used for sending SNMP notifications to ConfD/NCS. Set when allocated by
 Dp through
 [`Dp#createSnmpNotifier(String, String, Object)`](Dp.md#m-createsnmpnotifier-89f0d186fc8f)
 .

<a id="m-send-4c2d30df8160"></a>
### send(String, SnmpVarbind[])

```java
public void send(
    String notification,
    com.tailf.conf.SnmpVarbind[] varbinds
)
    throws com.tailf.conf.ConfException
```

Types: [SnmpVarbind](../conf/SnmpVarbind.md#cls-SnmpVarbind), [ConfException](../conf/ConfException.md#cls-ConfException)

Send SNMP notification. Sends a notification to the management targets
 defined for 'notifyTarget' in the snmpNotifyTable in
 SNMP-NOTIFICATION-MIB from the specified context. If no NotifyName is
 specified (or if it is ""), the notification is sent to all management
 targets. If the empty string is used as notification name, the
 notification to send is constructed from the varbinds array alone, which
 must then contain a value for the snmpTrapOID variable.

**Parameters**

- `String notification` - is the notification name. For example "coldStart" or
            "warmStart". This symbolic name of a notification must be
            defined in a MIB that is loaded into the agent.
- `com.tailf.conf.SnmpVarbind[] varbinds` - An array of variable bindings

**Since:** 3.2.0

<a id="m-send-616c3e8b0825"></a>
### send(String, SnmpVarbind[], Integer)

```java
public void send(
    String notification,
    com.tailf.conf.SnmpVarbind[] varbinds,
    Integer ref
)
    throws com.tailf.conf.ConfException
```

Types: [SnmpVarbind](../conf/SnmpVarbind.md#cls-SnmpVarbind), [ConfException](../conf/ConfException.md#cls-ConfException)

Send SNMP notification with the option to receive an Inform Response.
 Sends a notification to the management targets defined for 'notifyTarget'
 in the snmpNotifyTable in SNMP-NOTIFICATION-MIB from the specified
 context. If no NotifyName is specified (or if it is ""), the notification
 is sent to all management targets. If the empty string is used as
 notification name, the notification to send is constructed from the
 varbinds array alone, which must then contain a value for the snmpTrapOID
 variable.

**Parameters**

- `String notification` - is the notification name. For example "coldStart" or
            "warmStart". This symbolic name of a notification must be
            defined in a MIB that is loaded into the agent.
- `com.tailf.conf.SnmpVarbind[] varbinds` - an array of variable bindings
- `Integer ref` - a reference provided by the caller. This reference is provided
            provided in the callback methods on
            [`DpSnmpInformResponseCallback`](DpSnmpInformResponseCallback.md#cls-DpSnmpInformResponseCallback)

**Since:** 3.2.0

<a id="m-setfd-501c97b6d464"></a>
### setFD(int)

```java
public void setFD(int fd)
```

**Parameters**

- `int fd`

<a id="m-setsocket-183068848e4c"></a>
### setSocket(Socket)

```java
public void setSocket(java.net.Socket socket)
```

**Parameters**

- `java.net.Socket socket`

<a id="m-setsourceaddress-a903bc69b65e"></a>
### setSourceAddress(ConfIP)

```java
public void setSourceAddress(com.tailf.conf.ConfIP sourceIP)
```

Types: [ConfIP](../conf/ConfIP.md#cls-ConfIP)

Set the source IP address to be bound when sending notifications using
 the send() method.
 If the sourceIP is null the source address is chosen by the IP stack of
 the OS.

**Parameters**

- `com.tailf.conf.ConfIP sourceIP` - ConfIPv4 or ConfIPv6 address
