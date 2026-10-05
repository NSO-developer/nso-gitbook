<a id="cls-AlarmSourceCentral"></a>
# AlarmSourceCentral

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

- [AlarmSourceCentral(int, Cdb)](#m-alarmsourcecentral-d1b13ad77707)

**Methods**:

- [getAlarmQueue()](#m-getalarmqueue-86ea427127cc)
- [getAlarmSource(int, Cdb)](#m-getalarmsource-3dbc04cb0fba)
- [getQueue()](#m-getqueue-d349d0a1f2e7)
- [isAlive()](#m-isalive-264918864856)
- [returnAlarmQueue(ArrayBlockingQueue<Alarm>)](#m-returnalarmqueue-4561d0dee1d9)
- [returnQueue(ArrayBlockingQueue<Alarm>)](#m-returnqueue-87db70115c92)
- [run()](#m-run-b6dbda048863)
- [start()](#m-start-79e12dafe9f8)
- [stop()](#m-stop-a62ecc446f97)

**Nested Types**:

- [AlarmDispatcher](AlarmSourceCentral/AlarmDispatcher.md#cls-AlarmDispatcher)

## Constructors

<a id="m-alarmsourcecentral-d1b13ad77707"></a>
### AlarmSourceCentral(int, Cdb)

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

<a id="m-getalarmqueue-86ea427127cc"></a>
### getAlarmQueue()

```java
public static java.util.concurrent.ArrayBlockingQueue<com.tailf.ncs.alarmman.common.Alarm> getAlarmQueue()
```

Types: [Alarm](../common/Alarm.md#cls-Alarm)

Returns a new alarm queue.

**Returns:** `ArrayBlockingQueue<Alarm>`

**Deprecated:** Use `#getQueue()` instead.

<a id="m-getalarmsource-3dbc04cb0fba"></a>
### getAlarmSource(int, Cdb)

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

**Deprecated:** Use [`NcsMain#getSourceCentral()`](../../NcsMain.md#m-getsourcecentral-0714ef465cc3) instead.

<a id="m-getqueue-d349d0a1f2e7"></a>
### getQueue()

```java
protected synchronized java.util.concurrent.ArrayBlockingQueue<com.tailf.ncs.alarmman.common.Alarm> getQueue()
```

Types: [Alarm](../common/Alarm.md#cls-Alarm)

Creates a new queue and adds it to the AlarmSource.

**Returns:** ArrayBlockingQueue

<a id="m-isalive-264918864856"></a>
### isAlive()

```java
public boolean isAlive()
```

Returns true if the AlarmSourceCentral is running.

**Returns:** true if the AlarmSourceCentral is running, else false.

<a id="m-returnalarmqueue-4561d0dee1d9"></a>
### returnAlarmQueue(ArrayBlockingQueue<Alarm>)

```java
public static void returnAlarmQueue(
    java.util.concurrent.ArrayBlockingQueue<com.tailf.ncs.alarmman.common.Alarm> queue
)
```

Types: [Alarm](../common/Alarm.md#cls-Alarm)

Returns the queue.

**Parameters**

- `java.util.concurrent.ArrayBlockingQueue<com.tailf.ncs.alarmman.common.Alarm> queue` - the queue to return.

**Deprecated:** Use `Alarm#returnQueue(ArrayBlockingQueue<Alarm>)` instead.

<a id="m-returnqueue-87db70115c92"></a>
### returnQueue(ArrayBlockingQueue<Alarm>)

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

<a id="m-run-b6dbda048863"></a>
### run()

```java
public void run()
```

<a id="m-start-79e12dafe9f8"></a>
### start()

```java
public void start()
```

Start the AlarmSourceCentral which makes
 it possible for AlarmSource's to attach to this
 `AlarmSourceCentral ` and receive notifications.

<a id="m-stop-a62ecc446f97"></a>
### stop()

```java
public synchronized void stop()
```

Stops the AlarmSourceCentral.


## Nested Types

- [AlarmDispatcher](AlarmSourceCentral/AlarmDispatcher.md#cls-AlarmDispatcher)
