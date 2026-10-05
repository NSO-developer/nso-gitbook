<a id="s-AlarmSourceCentral"></a>
# AlarmSourceCentral

```java
public class com.tailf.ncs.alarmman.consumer.AlarmSourceCentral
    implements Runnable
```

The consuming part of the *Alarm API*.

 This class acts as a proxy where incoming alarms are dispatched or
 forwarded to all registered [`AlarmSource`](AlarmSource.md#s-AlarmSource) attached to it.

  One `AlarmSourceCentral ` (and corresponding
 [`AlarmSinkCentral`](../producer/AlarmSinkCentral.md#s-AlarmSinkCentral)) is always present
 in the *NCS JVM* and it is started when *NCS JVM* is started.

 It is also possible to start `AlarmSourceCentral`
 outside the *NCS JVM*.

 Each client [`AlarmSource`](AlarmSource.md#s-AlarmSource) that is attached to
 a `AlarmSourceCentral` gets its own queue to
 check for incoming alarms.

 The `AlarmSourceCentral` maintains or handles
 the client queues, for each incoming alarm to *CDB*
 it creates a new instance of [`Alarm`](../common/Alarm.md#s-Alarm) and puts the
 new instance into all the client queues that are attached to this
 `AlarmSourceCentral`.

## Members

**Constructors**:

- [AlarmSourceCentral(int, Cdb)](#s-AlarmSourceCentral-1)

**Methods**:

- [getAlarmQueue()](#s-getAlarmQueue)
- [getAlarmSource(int, Cdb)](#s-getAlarmSource)
- [getQueue()](#s-getQueue)
- [isAlive()](#s-isAlive)
- [returnAlarmQueue(ArrayBlockingQueue<Alarm>)](#s-returnAlarmQueue)
- [returnQueue(ArrayBlockingQueue<Alarm>)](#s-returnQueue)
- [run()](#s-run)
- [start()](#s-start)
- [stop()](#s-stop)

**Nested Types**:

- [AlarmDispatcher](AlarmSourceCentral/AlarmDispatcher.md#s-AlarmDispatcher)

## Constructors

<a id="s-AlarmSourceCentral-1"></a>
### AlarmSourceCentral(int, Cdb)

```java
public AlarmSourceCentral(
    int alarmQueueLen,
    com.tailf.cdb.Cdb cdb
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Cdb](../../../cdb/Cdb.md#s-Cdb), [ConfException](../../../conf/ConfException.md#s-ConfException)

Creates a new AlarmSourceCentral object.

**Parameters**

- `int alarmQueueLen` - maximum length of the out queues to the
                      subscribes.
- `com.tailf.cdb.Cdb cdb` - the *CDB* socket to subscribe over.

**Throws**

- `IOException` - if the CDB connection fails.
- `ConfException` - if the CDB subscription fails.


## Methods

<a id="s-getAlarmQueue"></a>
### getAlarmQueue()

```java
public static java.util.concurrent.ArrayBlockingQueue<com.tailf.ncs.alarmman.common.Alarm> getAlarmQueue()
```

Types: [Alarm](../common/Alarm.md#s-Alarm)

Returns a new alarm queue.

**Returns:** `ArrayBlockingQueue<Alarm>`

**Deprecated:** Use `#getQueue()` instead.

<a id="s-getAlarmSource"></a>
### getAlarmSource(int, Cdb)

```java
public static synchronized com.tailf.ncs.alarmman.consumer.AlarmSourceCentral getAlarmSource(
    int alarmQueueLen,
    com.tailf.cdb.Cdb cdb
)
    throws java.io.IOException, com.tailf.navu.NavuException, com.tailf.conf.ConfException
```

Types: [AlarmSourceCentral](AlarmSourceCentral.md#s-AlarmSourceCentral), [Cdb](../../../cdb/Cdb.md#s-Cdb), [NavuException](../../../navu/NavuException.md#s-NavuException), [ConfException](../../../conf/ConfException.md#s-ConfException)

Retrieves the alarm source central object.

**Parameters**

- `int alarmQueueLen` - the maximum queue length.
- `com.tailf.cdb.Cdb cdb` - the CDB socket to subscribe over.

**Returns:** the alarm source

**Throws**

- `IOException` - if there is an I/O error
- `NavuException` - if there is a Navu error
- `ConfException` - if there is a protocol error

**Deprecated:** Use [`NcsMain`](../../NcsMain.md#s-NcsMain) instead.

<a id="s-getQueue"></a>
### getQueue()

```java
protected synchronized java.util.concurrent.ArrayBlockingQueue<com.tailf.ncs.alarmman.common.Alarm> getQueue()
```

Types: [Alarm](../common/Alarm.md#s-Alarm)

Creates a new queue and adds it to the AlarmSource.

**Returns:** ArrayBlockingQueue

<a id="s-isAlive"></a>
### isAlive()

```java
public boolean isAlive()
```

Returns true if the AlarmSourceCentral is running.

**Returns:** true if the AlarmSourceCentral is running, else false.

<a id="s-returnAlarmQueue"></a>
### returnAlarmQueue(ArrayBlockingQueue<Alarm>)

```java
public static void returnAlarmQueue(
    java.util.concurrent.ArrayBlockingQueue<com.tailf.ncs.alarmman.common.Alarm> queue
)
```

Types: [Alarm](../common/Alarm.md#s-Alarm)

Returns the queue.

**Parameters**

- `java.util.concurrent.ArrayBlockingQueue<com.tailf.ncs.alarmman.common.Alarm> queue` - the queue to return.

**Deprecated:** Use [`Alarm`](../common/Alarm.md#s-Alarm) instead.

<a id="s-returnQueue"></a>
### returnQueue(ArrayBlockingQueue<Alarm>)

```java
protected void returnQueue(
    java.util.concurrent.ArrayBlockingQueue<com.tailf.ncs.alarmman.common.Alarm> queue
)
```

Types: [Alarm](../common/Alarm.md#s-Alarm)

Removes the queue from the list of
 queues.

**Parameters**

- `java.util.concurrent.ArrayBlockingQueue<com.tailf.ncs.alarmman.common.Alarm> queue`

<a id="s-run"></a>
### run()

```java
public void run()
```

<a id="s-start"></a>
### start()

```java
public void start()
```

Start the AlarmSourceCentral which makes
 it possible for AlarmSource's to attach to this
 `AlarmSourceCentral ` and receive notifications.

<a id="s-stop"></a>
### stop()

```java
public synchronized void stop()
```

Stops the AlarmSourceCentral.


## Nested Types

- [AlarmDispatcher](AlarmSourceCentral/AlarmDispatcher.md)
