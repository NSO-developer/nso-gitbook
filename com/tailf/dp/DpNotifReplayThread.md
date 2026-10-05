<a id="s-DpNotifReplayThread"></a>
# DpNotifReplayThread

```java
public class com.tailf.dp.DpNotifReplayThread
    extends Thread
```

This class implements the Notification streams thread. The purpose of this
 class to provide a mechanism for resending notifications.

**See also:** [`DpNotifStream`](DpNotifStream.md#s-DpNotifStream)

## Members

**Constructors**:

- [DpNotifReplayThread(DpNotifStream, ConfDatetime, ConfDatetime)](#s-DpNotifReplayThread-1)

**Methods**:

- [getNotifStream()](#s-getNotifStream)
- [getStart()](#s-getStart)
- [getStop()](#s-getStop)
- [run()](#s-run)

## Constructors

<a id="s-DpNotifReplayThread-1"></a>
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

Types: [DpNotifStream](DpNotifStream.md#s-DpNotifStream), [ConfDatetime](../conf/ConfDatetime.md#s-ConfDatetime), [ConfException](../conf/ConfException.md#s-ConfException)

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

<a id="s-getNotifStream"></a>
### getNotifStream()

```java
public com.tailf.dp.DpNotifStream getNotifStream()
```

Types: [DpNotifStream](DpNotifStream.md#s-DpNotifStream)

The Notification stream. Holds the context.

<a id="s-getStart"></a>
### getStart()

```java
public com.tailf.conf.ConfDatetime getStart()
```

Types: [ConfDatetime](../conf/ConfDatetime.md#s-ConfDatetime)

<a id="s-getStop"></a>
### getStop()

```java
public com.tailf.conf.ConfDatetime getStop()
```

Types: [ConfDatetime](../conf/ConfDatetime.md#s-ConfDatetime)

<a id="s-run"></a>
### run()

```java
public void run()
```

Run method derived from Thread
