# DpNotifStream <a href="#cls-DpNotifStream" id="cls-DpNotifStream"></a>

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

- [DpNotifStream(Dp, String, DpNotifReplayCallback, Socket)](#m-DpNotifStream-f41aba723331)
- [DpNotifStream(DpNotifStream)](#m-DpNotifStream-ed76b956ec92)

**Methods**:

- [flush()](#m-flush-a4d76f158943)
- [getDp()](#m-getDp-b1462199cc2e)
- [getFD()](#m-getFD-e27232a35a70)
- [getQRef()](#m-getQRef-ee1c8f107982)
- [getReplayCb()](#m-getReplayCb-026e257d6bdd)
- [getSocket()](#m-getSocket-d7da2de81b81)
- [getStreamName()](#m-getStreamName-7146bcdbf461)
- [getSubId()](#m-getSubId-eca339b724c5)
- [replay(ConfDatetime, ConfDatetime)](#m-replay-594e7925e57b)
- [send(ConfDatetime, ConfXMLParam)](#m-send-4e9bbfeb1622)
- [send(ConfDatetime, ConfXMLParam[])](#m-send-a45ffafb2f21)
- [send(ConfDatetime, ConfXMLParam[], ConfPath)](#m-send-86adc894c9f5)
- [send(ConfDatetime, ConfXMLParam[], String, Object[])](#m-send-3fd8e4b13d7a)
- [sendReplayComplete()](#m-sendReplayComplete-4f926d53aa64)
- [sendReplayFailed(String)](#m-sendReplayFailed-145017a72637)
- [setFD(int)](#m-setFD-501c97b6d464)
- [setQRef(int)](#m-setQRef-dd8de0c4f29b)
- [setSocket(Socket)](#m-setSocket-183068848e4c)
- [setSubId(int)](#m-setSubId-b0f01749d8c5)

## Constructors

### DpNotifStream(Dp, String, DpNotifReplayCallback, Socket) <a href="#m-DpNotifStream-f41aba723331" id="m-DpNotifStream-f41aba723331"></a>

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

Types: [Dp](Dp.md#cls-Dp), [DpNotifReplayCallback](DpNotifReplayCallback.md#cls-DpNotifReplayCallback), [ConfException](../conf/ConfException.md#cls-ConfException)

This constructor will initialize the DNotifStream class.

**Parameters**

- `com.tailf.dp.Dp dp` - Current Dp instance
- `String name` - identity of this notifstream
- `com.tailf.dp.DpNotifReplayCallback replayCb` - DpNotifReplayCallback instance
- `java.net.Socket socket` - Notification Socket

**Throws**

- `IOException`
- `ConfException`

### DpNotifStream(DpNotifStream) <a href="#m-DpNotifStream-ed76b956ec92" id="m-DpNotifStream-ed76b956ec92"></a>

**Package-private**

```java
DpNotifStream(com.tailf.dp.DpNotifStream stream)
```

Types: [DpNotifStream](DpNotifStream.md#cls-DpNotifStream)

This method will clone another streams context (same socket should be
 used for streams)

**Parameters**

- `com.tailf.dp.DpNotifStream stream` - source notifstream


## Methods

### flush() <a href="#m-flush-a4d76f158943" id="m-flush-a4d76f158943"></a>

```java
public synchronized void flush() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

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

### getDp() <a href="#m-getDp-b1462199cc2e" id="m-getDp-b1462199cc2e"></a>

```java
public com.tailf.dp.Dp getDp()
```

Types: [Dp](Dp.md#cls-Dp)

The Data Provider main class. provided when registering with a Dp.

### getFD() <a href="#m-getFD-e27232a35a70" id="m-getFD-e27232a35a70"></a>

```java
public int getFD()
```

file descriptor

### getQRef() <a href="#m-getQRef-ee1c8f107982" id="m-getQRef-ee1c8f107982"></a>

```java
public int getQRef()
```

last qref

### getReplayCb() <a href="#m-getReplayCb-026e257d6bdd" id="m-getReplayCb-026e257d6bdd"></a>

```java
public com.tailf.dp.DpNotifReplayCallback getReplayCb()
```

Types: [DpNotifReplayCallback](DpNotifReplayCallback.md#cls-DpNotifReplayCallback)

The replay callback

### getSocket() <a href="#m-getSocket-d7da2de81b81" id="m-getSocket-d7da2de81b81"></a>

```java
public java.net.Socket getSocket()
```

The worker socket which is connected to ConfD/NCS. This socket will be
 used for sending notifications to ConfD/NCS. Set when allocated by Dp.

### getStreamName() <a href="#m-getStreamName-7146bcdbf461" id="m-getStreamName-7146bcdbf461"></a>

```java
public String getStreamName()
```

### getSubId() <a href="#m-getSubId-eca339b724c5" id="m-getSubId-eca339b724c5"></a>

```java
public int getSubId()
```

last subid. subid0 is a replay

### replay(ConfDatetime, ConfDatetime) <a href="#m-replay-594e7925e57b" id="m-replay-594e7925e57b"></a>

**Package-private**

```java
synchronized void replay(
    com.tailf.conf.ConfDatetime start,
    com.tailf.conf.ConfDatetime stop
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfDatetime](../conf/ConfDatetime.md#cls-ConfDatetime), [ConfException](../conf/ConfException.md#cls-ConfException)

Replay is invoked from ConfD/NCS. This will start a new
 DpNotifReplayThread, where replays can be sent without disturbing the
 control socket.

**Parameters**

- `com.tailf.conf.ConfDatetime start` - ConfDatetime start of replay interval
- `com.tailf.conf.ConfDatetime stop` - ConfDatetime end of replay interval

**Throws**

- `IOException`
- `ConfException`

### send(ConfDatetime, ConfXMLParam) <a href="#m-send-4e9bbfeb1622" id="m-send-4e9bbfeb1622"></a>

```java
public synchronized void send(
    com.tailf.conf.ConfDatetime time,
    com.tailf.conf.ConfXMLParam params
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfDatetime](../conf/ConfDatetime.md#cls-ConfDatetime), [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [ConfException](../conf/ConfException.md#cls-ConfException)

Send a notification defined at the top level of a YANG module
 on this notification stream to ConfD/NCS.

**Parameters**

- `com.tailf.conf.ConfDatetime time` - ConfDatetime event time for the notification
- `com.tailf.conf.ConfXMLParam params` - ConfXMLParam structure of data

**Throws**

- `IOException`
- `ConfException`

### send(ConfDatetime, ConfXMLParam[]) <a href="#m-send-a45ffafb2f21" id="m-send-a45ffafb2f21"></a>

```java
public synchronized void send(
    com.tailf.conf.ConfDatetime time,
    com.tailf.conf.ConfXMLParam[] params
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfDatetime](../conf/ConfDatetime.md#cls-ConfDatetime), [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [ConfException](../conf/ConfException.md#cls-ConfException)

Send a notification defined at the top level of a YANG module
 on this notification stream to ConfD/NCS.

**Parameters**

- `com.tailf.conf.ConfDatetime time` - ConfDatetime event time for the notification
- `com.tailf.conf.ConfXMLParam[] params` - ConfXMLParam structure of data

**Throws**

- `IOException`
- `ConfException`

### send(ConfDatetime, ConfXMLParam[], ConfPath) <a href="#m-send-86adc894c9f5" id="m-send-86adc894c9f5"></a>

```java
public synchronized void send(
    com.tailf.conf.ConfDatetime time,
    com.tailf.conf.ConfXMLParam[] params,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfDatetime](../conf/ConfDatetime.md#cls-ConfDatetime), [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

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

### send(ConfDatetime, ConfXMLParam[], String, Object[]) <a href="#m-send-3fd8e4b13d7a" id="m-send-3fd8e4b13d7a"></a>

```java
public synchronized void send(
    com.tailf.conf.ConfDatetime time,
    com.tailf.conf.ConfXMLParam[] params,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfDatetime](../conf/ConfDatetime.md#cls-ConfDatetime), [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [ConfException](../conf/ConfException.md#cls-ConfException)

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

### sendReplayComplete() <a href="#m-sendReplayComplete-4f926d53aa64" id="m-sendReplayComplete-4f926d53aa64"></a>

**Package-private**

```java
synchronized void sendReplayComplete() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

send a replay complete

### sendReplayFailed(String) <a href="#m-sendReplayFailed-145017a72637" id="m-sendReplayFailed-145017a72637"></a>

**Package-private**

```java
synchronized void sendReplayFailed(
    String msg
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

send a replay failed

**Parameters**

- `String msg` - message string

**Throws**

- `IOException`
- `ConfException`

### setFD(int) <a href="#m-setFD-501c97b6d464" id="m-setFD-501c97b6d464"></a>

```java
public void setFD(int fd)
```

file descriptor

**Parameters**

- `int fd`

### setQRef(int) <a href="#m-setQRef-dd8de0c4f29b" id="m-setQRef-dd8de0c4f29b"></a>

```java
public void setQRef(int qref)
```

last qref

**Parameters**

- `int qref`

### setSocket(Socket) <a href="#m-setSocket-183068848e4c" id="m-setSocket-183068848e4c"></a>

```java
public void setSocket(java.net.Socket socket)
```

**Parameters**

- `java.net.Socket socket`

### setSubId(int) <a href="#m-setSubId-b0f01749d8c5" id="m-setSubId-b0f01749d8c5"></a>

```java
public void setSubId(int subid)
```

last subid. subid0 is a replay

**Parameters**

- `int subid`
