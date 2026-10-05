<a id="cls-DpNotifReplayCallback"></a>
# DpNotifReplayCallback

```java
public interface com.tailf.dp.DpNotifReplayCallback
```

This interface is used for the notifications replay callback.

 The `DpNotifStream#getLogStartTime(DpNotifStream)` and
 `DpNotifStream#getLogAgedTime(DpNotifStream)` callbacks is called by ConfD/NCS to
 find out

 a) the creation time of the current log and

 b) the event time of the last notification aged out of the log, if any.

 The replay() callback is called by ConfD/NCS to request replay. The stream
 argument must be used by the application when sending the replay
 notifications.

 The times given by "start" and "stop" specify the extent of the replay. The
 start time will always be given and specify a time in the past, however the
 stop time may be either in the past or in the future or even omitted, i.e.
 the stop argument is 'null'. This means that the subscriber has requested
 that the subscription continues indefinitely with the live feed when the
 logged notifications have been sent.

 If the stop time is given:

 The application sends all logged notifications that have an event time later
 than the start time but not later than the stop time. Note that if the stop
 time is in the future when the replay request arrives, this includes
 notifications logged while the replay is in progress (if any), as long as
 their event time is not later than the stop time.

 If the stop time is not given:

 The application sends all logged notifications that have an event time later
 than the start time. Note that this includes notifications logged after the
 request was received (if any).

 ConfD/NCS will if needed switch the subscriber over to the live feed and then
 end the subscription when the stop time is reached. The callback may analyze
 the start and stop arguments to determine start and stop positions in the
 log.

**See also:** [`DpNotifStream`](DpNotifStream.md#cls-DpNotifStream)

## Members

**Methods**:

- [getLogAgedTime(DpNotifStream)](#m-getlogagedtime-52a6ca6114ae)
- [getLogStartTime(DpNotifStream)](#m-getlogstarttime-19cd5e71b8f6)
- [replay(DpNotifStream, ConfDatetime, ConfDatetime)](#m-replay-9189095b66c6)

## Methods

<a id="m-getlogagedtime-52a6ca6114ae"></a>
### getLogAgedTime(DpNotifStream)

```java
public abstract com.tailf.conf.ConfDatetime getLogAgedTime(
    com.tailf.dp.DpNotifStream stream
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfDatetime](../conf/ConfDatetime.md#cls-ConfDatetime), [DpNotifStream](DpNotifStream.md#cls-DpNotifStream), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

The callback is called by ConfD/NCS to find out the event time of the
 last notification aged out of the log, if any.

**Parameters**

- `com.tailf.dp.DpNotifStream stream`

**Returns:** Event time of the last notification aged out of the log.

**Throws**

- `DpCallbackException` - Callback method failed.

<a id="m-getlogstarttime-19cd5e71b8f6"></a>
### getLogStartTime(DpNotifStream)

```java
public abstract com.tailf.conf.ConfDatetime getLogStartTime(
    com.tailf.dp.DpNotifStream stream
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfDatetime](../conf/ConfDatetime.md#cls-ConfDatetime), [DpNotifStream](DpNotifStream.md#cls-DpNotifStream), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

The callback is called by ConfD/NCS to find out the log's current start
 time, relevant for replay requests.

**Parameters**

- `com.tailf.dp.DpNotifStream stream`

**Returns:** The start time of the log.

**Throws**

- `DpCallbackException` - Callback method failed.

<a id="m-replay-9189095b66c6"></a>
### replay(DpNotifStream, ConfDatetime, ConfDatetime)

```java
public abstract void replay(
    com.tailf.dp.DpNotifStream stream,
    com.tailf.conf.ConfDatetime start,
    com.tailf.conf.ConfDatetime stop
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpNotifStream](DpNotifStream.md#cls-DpNotifStream), [ConfDatetime](../conf/ConfDatetime.md#cls-ConfDatetime), [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

The replay() callback is called by ConfD/NCS to request replay. The
 stream argument must be saved by the application and used when sending
 the replay notifications via stream.sendNotification(), as well the
 callback should return without waiting for the replay to complete.

**Parameters**

- `com.tailf.dp.DpNotifStream stream`
- `com.tailf.conf.ConfDatetime start`
- `com.tailf.conf.ConfDatetime stop`
