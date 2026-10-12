# DpNotifReplayThread <a href="#dpnotifreplaythread-229bc31cb039" id="dpnotifreplaythread-229bc31cb039"></a>

```java
public class com.tailf.dp.DpNotifReplayThread
    extends Thread
```

This class implements the Notification streams thread. The purpose of this
 class to provide a mechanism for resending notifications.

**See also:** [`DpNotifStream`](DpNotifStream.md#dpnotifstream-35a75c06ae81)

## Members

**Methods**:

- [getNotifStream\(\)](#getnotifstream-b60ff57383f1)
- [getStart\(\)](#getstart-f15aa51eaab7)
- [getStop\(\)](#getstop-509e70b17b96)
- [run\(\)](#run-b6dbda048863)

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
