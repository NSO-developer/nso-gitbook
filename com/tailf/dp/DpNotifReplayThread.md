# DpNotifReplayThread <a href="#dpnotifreplaythread-229bc31cb039" id="dpnotifreplaythread-229bc31cb039"></a>

```java
public class com.tailf.dp.DpNotifReplayThread
    extends Thread
```

This class implements the Notification streams thread. The purpose of this
 class to provide a mechanism for resending notifications.

**See also:** [`DpNotifStream`](DpNotifStream.md#dpnotifstream-35a75c06ae81)

## Members

**Constructors**:

- [DpNotifReplayThread(DpNotifStream, ConfDatetime, ConfDatetime)](#dpnotifreplaythread-ff8e548c1579)

**Methods**:

- [getNotifStream()](#getnotifstream-b60ff57383f1)
- [getStart()](#getstart-f15aa51eaab7)
- [getStop()](#getstop-509e70b17b96)
- [run()](#run-b6dbda048863)

## Constructors

### DpNotifReplayThread(DpNotifStream, ConfDatetime, ConfDatetime) <a href="#dpnotifreplaythread-ff8e548c1579" id="dpnotifreplaythread-ff8e548c1579"></a>

**Package-private**

```java
DpNotifReplayThread(
    com.tailf.dp.DpNotifStream stream,
    com.tailf.conf.ConfDatetime start,
    com.tailf.conf.ConfDatetime stop
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [DpNotifStream](DpNotifStream.md#dpnotifstream-35a75c06ae81), [ConfDatetime](../conf/ConfDatetime.md#confdatetime-8f67d7ff6ae8), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

The constructor will initialize the thread.

**Parameters**

- `com.tailf.dp.DpNotifStream stream` - The notification stream
- `com.tailf.conf.ConfDatetime start`
- `com.tailf.conf.ConfDatetime stop`

**Throws**

- `DpException` - Failed to initialize connection.
- `IOException` - Failed to read from control socket.
- `ConfException` - Failed to decode or other internal failure.

**See also:** `Dp#createNotifStream`


## Methods

### getNotifStream() <a href="#getnotifstream-b60ff57383f1" id="getnotifstream-b60ff57383f1"></a>

```java
public com.tailf.dp.DpNotifStream getNotifStream()
```

Types: [DpNotifStream](DpNotifStream.md#dpnotifstream-35a75c06ae81)

The Notification stream. Holds the context.

### getStart() <a href="#getstart-f15aa51eaab7" id="getstart-f15aa51eaab7"></a>

```java
public com.tailf.conf.ConfDatetime getStart()
```

Types: [ConfDatetime](../conf/ConfDatetime.md#confdatetime-8f67d7ff6ae8)

### getStop() <a href="#getstop-509e70b17b96" id="getstop-509e70b17b96"></a>

```java
public com.tailf.conf.ConfDatetime getStop()
```

Types: [ConfDatetime](../conf/ConfDatetime.md#confdatetime-8f67d7ff6ae8)

### run() <a href="#run-b6dbda048863" id="run-b6dbda048863"></a>

```java
public void run()
```

Run method derived from Thread
