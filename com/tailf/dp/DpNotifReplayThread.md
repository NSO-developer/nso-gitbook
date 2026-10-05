<a id="cls-DpNotifReplayThread"></a>
# DpNotifReplayThread

```java
public class com.tailf.dp.DpNotifReplayThread
    extends Thread
```

This class implements the Notification streams thread. The purpose of this
 class to provide a mechanism for resending notifications.

**See also:** [`DpNotifStream`](DpNotifStream.md#cls-DpNotifStream)

## Members

**Constructors**:

- [DpNotifReplayThread(DpNotifStream, ConfDatetime, ConfDatetime)](#m-dpnotifreplaythread-ff8e548c1579)

**Methods**:

- [getNotifStream()](#m-getnotifstream-b60ff57383f1)
- [getStart()](#m-getstart-f15aa51eaab7)
- [getStop()](#m-getstop-509e70b17b96)
- [run()](#m-run-b6dbda048863)

## Constructors

<a id="m-dpnotifreplaythread-ff8e548c1579"></a>
### DpNotifReplayThread(DpNotifStream, ConfDatetime, ConfDatetime)

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

<a id="m-getnotifstream-b60ff57383f1"></a>
### getNotifStream()

```java
public com.tailf.dp.DpNotifStream getNotifStream()
```

Types: [DpNotifStream](DpNotifStream.md#cls-DpNotifStream)

The Notification stream. Holds the context.

<a id="m-getstart-f15aa51eaab7"></a>
### getStart()

```java
public com.tailf.conf.ConfDatetime getStart()
```

Types: [ConfDatetime](../conf/ConfDatetime.md#cls-ConfDatetime)

<a id="m-getstop-509e70b17b96"></a>
### getStop()

```java
public com.tailf.conf.ConfDatetime getStop()
```

Types: [ConfDatetime](../conf/ConfDatetime.md#cls-ConfDatetime)

<a id="m-run-b6dbda048863"></a>
### run()

```java
public void run()
```

Run method derived from Thread
