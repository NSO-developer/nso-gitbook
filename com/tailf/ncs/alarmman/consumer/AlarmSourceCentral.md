# AlarmSourceCentral <a href="#cls-AlarmSourceCentral" id="cls-AlarmSourceCentral"></a>

```java
public class com.tailf.ncs.alarmman.consumer.AlarmSourceCentral
    implements Runnable
```

The consuming part of the *Alarm API*.

 This class acts as a proxy where incoming alarms are dispatched or
 forwarded to all registered [`AlarmSource`](AlarmSource.md#cls-AlarmSource) attached to it.

  One `AlarmSourceCentral ` (and corresponding
 [`AlarmSinkCentral`](../producer/AlarmSinkCentral.md#cls-AlarmSinkCentral)) is always present
 in the *NCS JVM* and it is started when *NCS JVM* is started.

 It is also possible to start `AlarmSourceCentral`
 outside the *NCS JVM*.

 Each client [`AlarmSource`](AlarmSource.md#cls-AlarmSource) that is attached to
 a `AlarmSourceCentral` gets its own queue to
 check for incoming alarms.

 The `AlarmSourceCentral` maintains or handles
 the client queues, for each incoming alarm to *CDB*
 it creates a new instance of [`Alarm`](../common/Alarm.md#cls-Alarm) and puts the
 new instance into all the client queues that are attached to this
 `AlarmSourceCentral`.

## Members

**Constructors**:

- [AlarmSourceCentral(int, Cdb)](#m-AlarmSourceCentral-d1b13ad77707)

**Methods**:

- [getAlarmQueue()](#m-getAlarmQueue-86ea427127cc)
- [getAlarmSource(int, Cdb)](#m-getAlarmSource-3dbc04cb0fba)
- [getQueue()](#m-getQueue-d349d0a1f2e7)
- [isAlive()](#m-isAlive-264918864856)
- [returnAlarmQueue(ArrayBlockingQueue<Alarm>)](#m-returnAlarmQueue-4561d0dee1d9)
- [returnQueue(ArrayBlockingQueue<Alarm>)](#m-returnQueue-87db70115c92)
- [run()](#m-run-b6dbda048863)
- [start()](#m-start-79e12dafe9f8)
- [stop()](#m-stop-a62ecc446f97)

**Nested Types**:

- [AlarmDispatcher](AlarmSourceCentral/AlarmDispatcher.md#cls-AlarmDispatcher)

## Constructors

### AlarmSourceCentral(int, Cdb) <a href="#m-AlarmSourceCentral-d1b13ad77707" id="m-AlarmSourceCentral-d1b13ad77707"></a>

```java
public AlarmSourceCentral(
    int alarmQueueLen,
    com.tailf.cdb.Cdb cdb
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Cdb](../../../cdb/Cdb.md#cls-Cdb), [ConfException](../../../conf/ConfException.md#cls-ConfException)

Creates a new AlarmSourceCentral object.

**Parameters**

- `int alarmQueueLen` - maximum length of the out queues to the
                      subscribes.
- `com.tailf.cdb.Cdb cdb` - the *CDB* socket to subscribe over.

**Throws**

- `IOException` - if the CDB connection fails.
- `ConfException` - if the CDB subscription fails.


## Methods

### getAlarmQueue() <a href="#m-getAlarmQueue-86ea427127cc" id="m-getAlarmQueue-86ea427127cc"></a>

```java
public static java.util.concurrent.ArrayBlockingQueue<com.tailf.ncs.alarmman.common.Alarm> getAlarmQueue()
```

Types: [Alarm](../common/Alarm.md#cls-Alarm)

Returns a new alarm queue.

**Returns:** `ArrayBlockingQueue<Alarm>`

**Deprecated:** Use [`getQueue()`](AlarmSourceCentral.md#m-getQueue-d349d0a1f2e7) instead.

### getAlarmSource(int, Cdb) <a href="#m-getAlarmSource-3dbc04cb0fba" id="m-getAlarmSource-3dbc04cb0fba"></a>

```java
public static synchronized com.tailf.ncs.alarmman.consumer.AlarmSourceCentral getAlarmSource(
    int alarmQueueLen,
    com.tailf.cdb.Cdb cdb
)
    throws java.io.IOException, com.tailf.navu.NavuException, com.tailf.conf.ConfException
```

Types: [AlarmSourceCentral](AlarmSourceCentral.md#cls-AlarmSourceCentral), [Cdb](../../../cdb/Cdb.md#cls-Cdb), [NavuException](../../../navu/NavuException.md#cls-NavuException), [ConfException](../../../conf/ConfException.md#cls-ConfException)

Retrieves the alarm source central object.

**Parameters**

- `int alarmQueueLen` - the maximum queue length.
- `com.tailf.cdb.Cdb cdb` - the CDB socket to subscribe over.

**Returns:** the alarm source

**Throws**

- `IOException` - if there is an I/O error
- `NavuException` - if there is a Navu error
- `ConfException` - if there is a protocol error

**Deprecated:** Use [`NcsMain#getSourceCentral()`](../../NcsMain.md#m-getSourceCentral-0714ef465cc3) instead.

### getQueue() <a href="#m-getQueue-d349d0a1f2e7" id="m-getQueue-d349d0a1f2e7"></a>

```java
protected synchronized java.util.concurrent.ArrayBlockingQueue<com.tailf.ncs.alarmman.common.Alarm> getQueue()
```

Types: [Alarm](../common/Alarm.md#cls-Alarm)

Creates a new queue and adds it to the AlarmSource.

**Returns:** ArrayBlockingQueue

### isAlive() <a href="#m-isAlive-264918864856" id="m-isAlive-264918864856"></a>

```java
public boolean isAlive()
```

Returns true if the AlarmSourceCentral is running.

**Returns:** true if the AlarmSourceCentral is running, else false.

### returnAlarmQueue(ArrayBlockingQueue<Alarm>) <a href="#m-returnAlarmQueue-4561d0dee1d9" id="m-returnAlarmQueue-4561d0dee1d9"></a>

```java
public static void returnAlarmQueue(
    java.util.concurrent.ArrayBlockingQueue<com.tailf.ncs.alarmman.common.Alarm> queue
)
```

Types: [Alarm](../common/Alarm.md#cls-Alarm)

Returns the queue.

**Parameters**

- `java.util.concurrent.ArrayBlockingQueue<com.tailf.ncs.alarmman.common.Alarm> queue` - the queue to return.

**Deprecated:** Use `returnQueue(ArrayBlockingQueue<Alarm>)` instead.

### returnQueue(ArrayBlockingQueue<Alarm>) <a href="#m-returnQueue-87db70115c92" id="m-returnQueue-87db70115c92"></a>

```java
protected void returnQueue(
    java.util.concurrent.ArrayBlockingQueue<com.tailf.ncs.alarmman.common.Alarm> queue
)
```

Types: [Alarm](../common/Alarm.md#cls-Alarm)

Removes the queue from the list of
 queues.

**Parameters**

- `java.util.concurrent.ArrayBlockingQueue<com.tailf.ncs.alarmman.common.Alarm> queue`

### run() <a href="#m-run-b6dbda048863" id="m-run-b6dbda048863"></a>

```java
public void run()
```

### start() <a href="#m-start-79e12dafe9f8" id="m-start-79e12dafe9f8"></a>

```java
public void start()
```

Start the AlarmSourceCentral which makes
 it possible for AlarmSource's to attach to this
 `AlarmSourceCentral ` and receive notifications.

### stop() <a href="#m-stop-a62ecc446f97" id="m-stop-a62ecc446f97"></a>

```java
public synchronized void stop()
```

Stops the AlarmSourceCentral.


## Nested Types

- [AlarmDispatcher](AlarmSourceCentral/AlarmDispatcher.md#cls-AlarmDispatcher)
