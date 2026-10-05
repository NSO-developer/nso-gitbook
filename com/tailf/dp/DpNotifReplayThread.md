# DpNotifReplayThread <a href="#cls-DpNotifReplayThread" id="cls-DpNotifReplayThread"></a>

```java
public class com.tailf.dp.DpNotifReplayThread
    extends Thread
```

This class implements the Notification streams thread. The purpose of this
 class to provide a mechanism for resending notifications.

**See also:** [`DpNotifStream`](DpNotifStream.md#cls-DpNotifStream)

## Members

**Constructors**:

- [DpNotifReplayThread(DpNotifStream, ConfDatetime, ConfDatetime)](#m-DpNotifReplayThread-ff8e548c1579)

**Methods**:

- [getNotifStream()](#m-getNotifStream-b60ff57383f1)
- [getStart()](#m-getStart-f15aa51eaab7)
- [getStop()](#m-getStop-509e70b17b96)
- [run()](#m-run-b6dbda048863)

## Constructors

### DpNotifReplayThread(DpNotifStream, ConfDatetime, ConfDatetime) <a href="#m-DpNotifReplayThread-ff8e548c1579" id="m-DpNotifReplayThread-ff8e548c1579"></a>

**Package-private**

```java
DpNotifReplayThread(
    com.tailf.dp.DpNotifStream stream,
    com.tailf.conf.ConfDatetime start,
    com.tailf.conf.ConfDatetime stop
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [DpNotifStream](DpNotifStream.md#cls-DpNotifStream), [ConfDatetime](../conf/ConfDatetime.md#cls-ConfDatetime), [ConfException](../conf/ConfException.md#cls-ConfException)

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

### getNotifStream() <a href="#m-getNotifStream-b60ff57383f1" id="m-getNotifStream-b60ff57383f1"></a>

```java
public com.tailf.dp.DpNotifStream getNotifStream()
```

Types: [DpNotifStream](DpNotifStream.md#cls-DpNotifStream)

The Notification stream. Holds the context.

### getStart() <a href="#m-getStart-f15aa51eaab7" id="m-getStart-f15aa51eaab7"></a>

```java
public com.tailf.conf.ConfDatetime getStart()
```

Types: [ConfDatetime](../conf/ConfDatetime.md#cls-ConfDatetime)

### getStop() <a href="#m-getStop-509e70b17b96" id="m-getStop-509e70b17b96"></a>

```java
public com.tailf.conf.ConfDatetime getStop()
```

Types: [ConfDatetime](../conf/ConfDatetime.md#cls-ConfDatetime)

### run() <a href="#m-run-b6dbda048863" id="m-run-b6dbda048863"></a>

```java
public void run()
```

Run method derived from Thread
