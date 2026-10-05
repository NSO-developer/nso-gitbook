<a id="cls-AlarmSinkCentral"></a>
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

- [AlarmSinkCentral(int, Maapi)](#m-alarmsinkcentral-5ca121e75734)
- [AlarmSinkCentral(int, Maapi, int, long)](#m-alarmsinkcentral-15fb13c004f7)

**Fields**:

- [legacyCdb](#m-legacyCdb)

**Methods**:

- [close()](#m-close-8107c6dc012b)
- [getQueue()](#m-getqueue-d349d0a1f2e7)
- [isAlive()](#m-isalive-264918864856)
- [requestStop()](#m-requeststop-7507d99bde08)
- [run()](#m-run-b6dbda048863)
- [start()](#m-start-79e12dafe9f8)
- [stop()](#m-stop-a62ecc446f97)

## Constructors

<a id="m-alarmsinkcentral-5ca121e75734"></a>
### AlarmSinkCentral(int, Maapi)

```java
public AlarmSinkCentral(int alarmQueueLen, com.tailf.maapi.Maapi maapi)
```

Types: [Maapi](../../../maapi/Maapi.md#cls-Maapi)

Creates an NCS alarm sink.

**Parameters**

- `int alarmQueueLen` - the maximum length of the queue.
- `com.tailf.maapi.Maapi maapi` - the Maapi instance used to write alarm info

<a id="m-alarmsinkcentral-15fb13c004f7"></a>
### AlarmSinkCentral(int, Maapi, int, long)

```java
public AlarmSinkCentral(
    int alarmQueueLen,
    com.tailf.maapi.Maapi maapi,
    int alarmBufSize,
    long alarmBufTimeout
)
```

Types: [Maapi](../../../maapi/Maapi.md#cls-Maapi)

Creates an NCS alarm sink.

**Parameters**

- `int alarmQueueLen` - the maximum length of the queue.
- `com.tailf.maapi.Maapi maapi` - the Maapi instance used to write alarm info
- `int alarmBufSize` - the size of the alarm buffer
- `long alarmBufTimeout` - timeout in seconds after which the buffer
                        will be submitted if there are no new alarms
                        in the queue


## Fields

<a id="m-legacyCdb"></a>
### legacyCdb

```java
protected com.tailf.cdb.Cdb legacyCdb = null;
```

Types: [Cdb](../../../cdb/Cdb.md#cls-Cdb)


## Methods

<a id="m-close-8107c6dc012b"></a>
### close()

```java
public void close()
```

Closes the alarm sink central by stopping the processing thread.

<a id="m-getqueue-d349d0a1f2e7"></a>
### getQueue()

```java
public java.util.concurrent.ArrayBlockingQueue<com.tailf.ncs.alarmman.common.Alarm> getQueue()
```

Types: [Alarm](../common/Alarm.md#cls-Alarm)

Returns the alarm queue.

**Returns:** the current alarm queue.

<a id="m-isalive-264918864856"></a>
### isAlive()

```java
public boolean isAlive()
```

Checks if the alarm sink central thread is currently alive and running.

**Returns:** true if the thread is alive, false otherwise

<a id="m-requeststop-7507d99bde08"></a>
### requestStop()

```java
public boolean requestStop()
```

Requests the alarm sink central to stop processing alarms.

**Returns:** true if the stop request was successful

<a id="m-run-b6dbda048863"></a>
### run()

```java
public void run()
```

Main thread execution method that processes alarms from the queue.

<a id="m-start-79e12dafe9f8"></a>
### start()

```java
public synchronized void start()
```

Starts the alarm sink central thread for processing alarms.
 Creates and starts a daemon thread if not already running.

<a id="m-stop-a62ecc446f97"></a>
### stop()

```java
public synchronized void stop()
```

Stops the alarm sink central thread and waits for it to terminate.
 Sends a termination signal to the queue and waits for the thread to join.
