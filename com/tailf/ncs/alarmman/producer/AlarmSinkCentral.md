<a id="s-AlarmSinkCentral"></a>
# AlarmSinkCentral

```java
public class com.tailf.ncs.alarmman.producer.AlarmSinkCentral
    implements Runnable, AutoCloseable
```

An `AlarmSinkCentral` represent a central "proxy"
 for created `AlarmSink`'s.

 When `AlarmSink`'s is created ( with the default
 constructor ), they are attched to the `AlarmSinkCentral`
 singleton instance which writes alarms directly into the
 alarm list on behalf of the attached `AlarmSink` instances.

 The benefit of using the `AlarmSinkCentral` is:


- User do not need to create Cdb objects when creating
 `AlarmSink`
- Possible to buffer alarms for faster throughput.



 **NOTE:** A `AlarmSinkCentral` is available
 in NCS JVM.

 When specifying the queue size the amount alarm will be queued before
 it is written to Cdb.

 Alarms are written to a blocking queue within the
 same JVM as the NCS. The NCS writes the alarms
 down into the CDB.

## Members

**Constructors**:

- [AlarmSinkCentral(int, Maapi)](#s-AlarmSinkCentral-1)
- [AlarmSinkCentral(int, Maapi, int, long)](#s-AlarmSinkCentral-2)

**Fields**:

- [legacyCdb](#s-legacyCdb)

**Methods**:

- [close()](#s-close)
- [getQueue()](#s-getQueue)
- [isAlive()](#s-isAlive)
- [requestStop()](#s-requestStop)
- [run()](#s-run)
- [start()](#s-start)
- [stop()](#s-stop)

## Constructors

<a id="s-AlarmSinkCentral-1"></a>
### AlarmSinkCentral(int, Maapi)

```java
public AlarmSinkCentral(int alarmQueueLen, com.tailf.maapi.Maapi maapi)
```

Types: [Maapi](../../../maapi/Maapi.md#s-Maapi)

Creates an NCS alarm sink.

**Parameters**

- `int alarmQueueLen` - the maximum length of the queue.
- `com.tailf.maapi.Maapi maapi` - the Maapi instance used to write alarm info

<a id="s-AlarmSinkCentral-2"></a>
### AlarmSinkCentral(int, Maapi, int, long)

```java
public AlarmSinkCentral(
    int alarmQueueLen,
    com.tailf.maapi.Maapi maapi,
    int alarmBufSize,
    long alarmBufTimeout
)
```

Types: [Maapi](../../../maapi/Maapi.md#s-Maapi)

Creates an NCS alarm sink.

**Parameters**

- `int alarmQueueLen` - the maximum length of the queue.
- `com.tailf.maapi.Maapi maapi` - the Maapi instance used to write alarm info
- `int alarmBufSize` - the size of the alarm buffer
- `long alarmBufTimeout` - timeout in seconds after which the buffer
                        will be submitted if there are no new alarms
                        in the queue


## Fields

<a id="s-legacyCdb"></a>
### legacyCdb

```java
protected com.tailf.cdb.Cdb legacyCdb = null;
```

Types: [Cdb](../../../cdb/Cdb.md#s-Cdb)


## Methods

<a id="s-close"></a>
### close()

```java
public void close()
```

Closes the alarm sink central by stopping the processing thread.

<a id="s-getQueue"></a>
### getQueue()

```java
public java.util.concurrent.ArrayBlockingQueue<com.tailf.ncs.alarmman.common.Alarm> getQueue()
```

Types: [Alarm](../common/Alarm.md#s-Alarm)

Returns the alarm queue.

**Returns:** the current alarm queue.

<a id="s-isAlive"></a>
### isAlive()

```java
public boolean isAlive()
```

Checks if the alarm sink central thread is currently alive and running.

**Returns:** true if the thread is alive, false otherwise

<a id="s-requestStop"></a>
### requestStop()

```java
public boolean requestStop()
```

Requests the alarm sink central to stop processing alarms.

**Returns:** true if the stop request was successful

<a id="s-run"></a>
### run()

```java
public void run()
```

Main thread execution method that processes alarms from the queue.

<a id="s-start"></a>
### start()

```java
public synchronized void start()
```

Starts the alarm sink central thread for processing alarms.
 Creates and starts a daemon thread if not already running.

<a id="s-stop"></a>
### stop()

```java
public synchronized void stop()
```

Stops the alarm sink central thread and waits for it to terminate.
 Sends a termination signal to the queue and waits for the thread to join.
