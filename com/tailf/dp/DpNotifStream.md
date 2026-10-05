# DpNotifStream <a href="#dpnotifstream-35a75c06ae81" id="dpnotifstream-35a75c06ae81"></a>

```java
public class com.tailf.dp.DpNotifStream
    extends Thread
```

The application can generate notifications that are sent via the northbound
 protocols. Currently NETCONF notification streams are supported. The
 application generates the content for each notification and sends it via a
 socket to ConfD/NCS, which in turn manages the stream subscriptions and
 distributes the notifications accordingly.

 A stream always has a "live feed", which is the sequence of new
 notifications, sent in real time as they are generated. Subscribers may also
 request "replay" of older, logged notifications if the stream supports this,
 perhaps transition to the live feed when the end of the log is reached.
 There may be one or more replays active simultaneously with the live feed.
 ConfD/NCS forwards replay requests from subscribers to the application via
 callbacks if the stream supports replay.

 Each notification has an associated time stamp, the "event time". This is the
 time when the event that generated the notification occurred, rather than the
 time the notification is logged or sent, in case these times differ. The
 application must pass the event time to ConfD/NCS when sending a
 notification, and it is also needed when replaying logged events.

 This class implements the Notification streams. The purpose of this class to
 provide a mechanism for sending notifications.

 Example:

 Consider the following yang model of a notification:


```
  module mynotif {
    namespace "http://tail-f.com/test/mynotif/1.0";
    prefix myn;

    import ietf-yang-types {
      prefix yang;
    }

    notification my_notif {
      leaf arg1 {
        type string;
      }
      leaf arg2 {
        type int64;
      }
    }
  }
```



 For a netconf notification stream to be valid it must be defined in the
 ConfD/NCS config file. For NCS this example needs the following definitions
 in the config (there are small differences in the tagnames for ConfD)



```
   notifications
     event-streams
       stream
         namemystream/name
         descriptionmy test stream/description
         replay-supportfalse/replay-support
       /stream
     /event-streams
   /notifications
```



 If we want to sent a NETCONF notification based on the above model
 we can do the following:


```
  // int port = Conf.PORT; // ConfD TCP; NCS uses Conf.NCS_PATH (Unix socket)
  // create new control socket
  Socket ctrlSocket = new Socket(127.0.0.1, port);
  // This is the main Data Provider instance. dp
  Dp dp = new Dp(hosts_daemon, ctrlSocket);
  mynotif myn = new mynotif();
  // create Dp Notification stream (you may create many)
  DpNotifStream stream = dp.createNotifStream(mystream);
  // send a notification
  ConfXMLParam[] vals =
      new ConfXMLParam[] {
          new ConfXMLParamStart(myn.hash(), mynotif.myn_my_notif),
          new ConfXMLParamValue(myn.hash(), mynotif.myn_arg1,
                                new ConfBuf(Hello)),
          new ConfXMLParamValue(myn.hash(), mynotif.myn_arg2,
                                new ConfInt64(32)),
          new ConfXMLParamStop(myn.hash(), mynotif.myn_my_notif)
      };
  stream.send(ConfDatetime.getConfDatetime(), vals);
```

## Members

**Constructors**:

- [DpNotifStream(Dp, String, DpNotifReplayCallback, Socket)](#dpnotifstream-f41aba723331)
- [DpNotifStream(DpNotifStream)](#dpnotifstream-ed76b956ec92)

**Methods**:

- [flush()](#flush-a4d76f158943)
- [getDp()](#getdp-b1462199cc2e)
- [getFD()](#getfd-e27232a35a70)
- [getQRef()](#getqref-ee1c8f107982)
- [getReplayCb()](#getreplaycb-026e257d6bdd)
- [getSocket()](#getsocket-d7da2de81b81)
- [getStreamName()](#getstreamname-7146bcdbf461)
- [getSubId()](#getsubid-eca339b724c5)
- [replay(ConfDatetime, ConfDatetime)](#replay-594e7925e57b)
- [send(ConfDatetime, ConfXMLParam)](#send-4e9bbfeb1622)
- [send(ConfDatetime, ConfXMLParam[])](#send-a45ffafb2f21)
- [send(ConfDatetime, ConfXMLParam[], ConfPath)](#send-86adc894c9f5)
- [send(ConfDatetime, ConfXMLParam[], String, Object[])](#send-3fd8e4b13d7a)
- [sendReplayComplete()](#sendreplaycomplete-4f926d53aa64)
- [sendReplayFailed(String)](#sendreplayfailed-145017a72637)
- [setFD(int)](#setfd-501c97b6d464)
- [setQRef(int)](#setqref-dd8de0c4f29b)
- [setSocket(Socket)](#setsocket-183068848e4c)
- [setSubId(int)](#setsubid-b0f01749d8c5)

## Constructors

### DpNotifStream(Dp, String, DpNotifReplayCallback, Socket) <a href="#dpnotifstream-f41aba723331" id="dpnotifstream-f41aba723331"></a>

**Package-private**

```java
DpNotifStream(
    com.tailf.dp.Dp dp,
    String name,
    com.tailf.dp.DpNotifReplayCallback replayCb,
    java.net.Socket socket
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Dp](Dp.md#dp-64c27347820e), [DpNotifReplayCallback](DpNotifReplayCallback.md#dpnotifreplaycallback-8fa565df0e52), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This constructor will initialize the DNotifStream class.

**Parameters**

- `com.tailf.dp.Dp dp` - Current Dp instance
- `String name` - identity of this notifstream
- `com.tailf.dp.DpNotifReplayCallback replayCb` - DpNotifReplayCallback instance
- `java.net.Socket socket` - Notification Socket

**Throws**

- `IOException`
- `ConfException`

### DpNotifStream(DpNotifStream) <a href="#dpnotifstream-ed76b956ec92" id="dpnotifstream-ed76b956ec92"></a>

**Package-private**

```java
DpNotifStream(com.tailf.dp.DpNotifStream stream)
```

Types: [DpNotifStream](DpNotifStream.md#dpnotifstream-35a75c06ae81)

This method will clone another streams context (same socket should be
 used for streams)

**Parameters**

- `com.tailf.dp.DpNotifStream stream` - source notifstream


## Methods

### flush() <a href="#flush-a4d76f158943" id="flush-a4d76f158943"></a>

```java
public synchronized void flush() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Notifications are sent asynchronously, i.e. normally without blocking the
 caller of the send functions described above. This means that in some
 cases, the servers sending of the notifications on the northbound
 interfaces may lag behind the send calls. If we want to make sure that
 the notifications have actually been sent out, e.g. in some shutdown
 procedure, we can call DpNotifStream.flush(). This function will block
 until all notifications sent using the given notification stream have
 been fully processed by the server. It can be used both for notification
 streams and for SNMP notifications (however it will not wait for replies
 to SNMP inform-requests to arrive).

**Throws**

- `IOException`
- `ConfException`

### getDp() <a href="#getdp-b1462199cc2e" id="getdp-b1462199cc2e"></a>

```java
public com.tailf.dp.Dp getDp()
```

Types: [Dp](Dp.md#dp-64c27347820e)

The Data Provider main class. provided when registering with a Dp.

### getFD() <a href="#getfd-e27232a35a70" id="getfd-e27232a35a70"></a>

```java
public int getFD()
```

file descriptor

### getQRef() <a href="#getqref-ee1c8f107982" id="getqref-ee1c8f107982"></a>

```java
public int getQRef()
```

last qref

### getReplayCb() <a href="#getreplaycb-026e257d6bdd" id="getreplaycb-026e257d6bdd"></a>

```java
public com.tailf.dp.DpNotifReplayCallback getReplayCb()
```

Types: [DpNotifReplayCallback](DpNotifReplayCallback.md#dpnotifreplaycallback-8fa565df0e52)

The replay callback

### getSocket() <a href="#getsocket-d7da2de81b81" id="getsocket-d7da2de81b81"></a>

```java
public java.net.Socket getSocket()
```

The worker socket which is connected to ConfD/NCS. This socket will be
 used for sending notifications to ConfD/NCS. Set when allocated by Dp.

### getStreamName() <a href="#getstreamname-7146bcdbf461" id="getstreamname-7146bcdbf461"></a>

```java
public String getStreamName()
```

### getSubId() <a href="#getsubid-eca339b724c5" id="getsubid-eca339b724c5"></a>

```java
public int getSubId()
```

last subid. subid0 is a replay

### replay(ConfDatetime, ConfDatetime) <a href="#replay-594e7925e57b" id="replay-594e7925e57b"></a>

**Package-private**

```java
synchronized void replay(
    com.tailf.conf.ConfDatetime start,
    com.tailf.conf.ConfDatetime stop
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfDatetime](../conf/ConfDatetime.md#confdatetime-8f67d7ff6ae8), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Replay is invoked from ConfD/NCS. This will start a new
 DpNotifReplayThread, where replays can be sent without disturbing the
 control socket.

**Parameters**

- `com.tailf.conf.ConfDatetime start` - ConfDatetime start of replay interval
- `com.tailf.conf.ConfDatetime stop` - ConfDatetime end of replay interval

**Throws**

- `IOException`
- `ConfException`

### send(ConfDatetime, ConfXMLParam) <a href="#send-4e9bbfeb1622" id="send-4e9bbfeb1622"></a>

```java
public synchronized void send(
    com.tailf.conf.ConfDatetime time,
    com.tailf.conf.ConfXMLParam params
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfDatetime](../conf/ConfDatetime.md#confdatetime-8f67d7ff6ae8), [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Send a notification defined at the top level of a YANG module
 on this notification stream to ConfD/NCS.

**Parameters**

- `com.tailf.conf.ConfDatetime time` - ConfDatetime event time for the notification
- `com.tailf.conf.ConfXMLParam params` - ConfXMLParam structure of data

**Throws**

- `IOException`
- `ConfException`

### send(ConfDatetime, ConfXMLParam[]) <a href="#send-a45ffafb2f21" id="send-a45ffafb2f21"></a>

```java
public synchronized void send(
    com.tailf.conf.ConfDatetime time,
    com.tailf.conf.ConfXMLParam[] params
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfDatetime](../conf/ConfDatetime.md#confdatetime-8f67d7ff6ae8), [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Send a notification defined at the top level of a YANG module
 on this notification stream to ConfD/NCS.

**Parameters**

- `com.tailf.conf.ConfDatetime time` - ConfDatetime event time for the notification
- `com.tailf.conf.ConfXMLParam[] params` - ConfXMLParam structure of data

**Throws**

- `IOException`
- `ConfException`

### send(ConfDatetime, ConfXMLParam[], ConfPath) <a href="#send-86adc894c9f5" id="send-86adc894c9f5"></a>

```java
public synchronized void send(
    com.tailf.conf.ConfDatetime time,
    com.tailf.conf.ConfXMLParam[] params,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfDatetime](../conf/ConfDatetime.md#confdatetime-8f67d7ff6ae8), [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Send a notification defined as a child of a container or list
 in a YANG 1.1 module on this notification stream to ConfD/NCS.

**Parameters**

- `com.tailf.conf.ConfDatetime time` - ConfDatetime event time for the notification
- `com.tailf.conf.ConfXMLParam[] params` - ConfXMLParam structure of data
- `com.tailf.conf.ConfPath path` - ConfPath the fully instantiated path for the container or
    list entry that is the parent of the notification in the data tree

**Throws**

- `IOException`
- `ConfException`

### send(ConfDatetime, ConfXMLParam[], String, Object[]) <a href="#send-3fd8e4b13d7a" id="send-3fd8e4b13d7a"></a>

```java
public synchronized void send(
    com.tailf.conf.ConfDatetime time,
    com.tailf.conf.ConfXMLParam[] params,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfDatetime](../conf/ConfDatetime.md#confdatetime-8f67d7ff6ae8), [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Send a notification defined as a child of a container or list
 in a YANG 1.1 module on this notification stream to ConfD/NCS.

**Parameters**

- `com.tailf.conf.ConfDatetime time` - ConfDatetime event time for the notification
- `com.tailf.conf.ConfXMLParam[] params` - ConfXMLParam structure of data
- `String fmt` - path string the fully instantiated path for the container or
    list entry that is the parent of the notification in the data tree
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `IOException`
- `ConfException`

### sendReplayComplete() <a href="#sendreplaycomplete-4f926d53aa64" id="sendreplaycomplete-4f926d53aa64"></a>

**Package-private**

```java
synchronized void sendReplayComplete() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

send a replay complete

### sendReplayFailed(String) <a href="#sendreplayfailed-145017a72637" id="sendreplayfailed-145017a72637"></a>

**Package-private**

```java
synchronized void sendReplayFailed(
    String msg
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

send a replay failed

**Parameters**

- `String msg` - message string

**Throws**

- `IOException`
- `ConfException`

### setFD(int) <a href="#setfd-501c97b6d464" id="setfd-501c97b6d464"></a>

```java
public void setFD(int fd)
```

file descriptor

**Parameters**

- `int fd`

### setQRef(int) <a href="#setqref-dd8de0c4f29b" id="setqref-dd8de0c4f29b"></a>

```java
public void setQRef(int qref)
```

last qref

**Parameters**

- `int qref`

### setSocket(Socket) <a href="#setsocket-183068848e4c" id="setsocket-183068848e4c"></a>

```java
public void setSocket(java.net.Socket socket)
```

**Parameters**

- `java.net.Socket socket`

### setSubId(int) <a href="#setsubid-b0f01749d8c5" id="setsubid-b0f01749d8c5"></a>

```java
public void setSubId(int subid)
```

last subid. subid0 is a replay

**Parameters**

- `int subid`
