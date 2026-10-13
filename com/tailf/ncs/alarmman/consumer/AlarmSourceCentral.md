# AlarmSourceCentral <a href="#alarmsourcecentral-bdfee4422149" id="alarmsourcecentral-bdfee4422149"></a>

```java
public class com.tailf.ncs.alarmman.consumer.AlarmSourceCentral
    implements Runnable
```

The consuming part of the *Alarm API*.

 This class acts as a proxy where incoming alarms are dispatched or
 forwarded to all registered [`AlarmSource`](AlarmSource.md#alarmsource-f5bcbf5bed9e) attached to it.

  One `AlarmSourceCentral ` (and corresponding
 [`AlarmSinkCentral`](../producer/AlarmSinkCentral.md#alarmsinkcentral-a7b03cb7fde1)) is always present
 in the *NCS JVM* and it is started when *NCS JVM* is started.

 It is also possible to start `AlarmSourceCentral`
 outside the *NCS JVM*.

 Each client [`AlarmSource`](AlarmSource.md#alarmsource-f5bcbf5bed9e) that is attached to
 a `AlarmSourceCentral` gets its own queue to
 check for incoming alarms.

 The `AlarmSourceCentral` maintains or handles
 the client queues, for each incoming alarm to *CDB*
 it creates a new instance of [`Alarm`](../common/Alarm.md#alarm-e07586c3430f) and puts the
 new instance into all the client queues that are attached to this
 `AlarmSourceCentral`.

## Members

**Constructors**:

- [AlarmSourceCentral\(int, Cdb\)](#alarmsourcecentral-d1b13ad77707)

**Methods**:

- [getAlarmQueue\(\)](#getalarmqueue-86ea427127cc)
- [getAlarmSource\(int, Cdb\)](#getalarmsource-3dbc04cb0fba)
- [getQueue\(\)](#getqueue-d349d0a1f2e7)
- [isAlive\(\)](#isalive-264918864856)
- [returnAlarmQueue\(ArrayBlockingQueue\<Alarm\>\)](#returnalarmqueue-4561d0dee1d9)
- [returnQueue\(ArrayBlockingQueue\<Alarm\>\)](#returnqueue-87db70115c92)
- [run\(\)](#run-b6dbda048863)
- [start\(\)](#start-79e12dafe9f8)
- [stop\(\)](#stop-a62ecc446f97)

**Nested Types**:

- [AlarmDispatcher](AlarmSourceCentral/AlarmDispatcher.md#alarmdispatcher-46e75216df0e)

## Constructors

### AlarmSourceCentral(int, Cdb) <a href="#alarmsourcecentral-d1b13ad77707" id="alarmsourcecentral-d1b13ad77707"></a>

```java
public AlarmSourceCentral(
    int alarmQueueLen,
    com.tailf.cdb.Cdb cdb
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Cdb](../../../cdb/Cdb.md#cdb-cb7fc41768c9), [ConfException](../../../conf/ConfException.md#confexception-baeaab99f7f9)

Creates a new AlarmSourceCentral object.

**Parameters**

- `int alarmQueueLen` - maximum length of the out queues to the
                      subscribes.
- `com.tailf.cdb.Cdb cdb` - the *CDB* socket to subscribe over.

**Throws**

- `IOException` - if the CDB connection fails.
- `ConfException` - if the CDB subscription fails.


## Methods

### getAlarmQueue() <a href="#getalarmqueue-86ea427127cc" id="getalarmqueue-86ea427127cc"></a>

```java
public static java.util.concurrent.ArrayBlockingQueue<com.tailf.ncs.alarmman.common.Alarm> getAlarmQueue()
```

Types: [Alarm](../common/Alarm.md#alarm-e07586c3430f)

Returns a new alarm queue.

**Returns:** `ArrayBlockingQueue<Alarm>`

**Deprecated:** Use [`getQueue()`](AlarmSourceCentral.md#getqueue-d349d0a1f2e7) instead.

### getAlarmSource(int, Cdb) <a href="#getalarmsource-3dbc04cb0fba" id="getalarmsource-3dbc04cb0fba"></a>

```java
public static synchronized com.tailf.ncs.alarmman.consumer.AlarmSourceCentral getAlarmSource(
    int alarmQueueLen,
    com.tailf.cdb.Cdb cdb
)
    throws java.io.IOException, com.tailf.navu.NavuException, com.tailf.conf.ConfException
```

Types: [AlarmSourceCentral](AlarmSourceCentral.md#alarmsourcecentral-bdfee4422149), [Cdb](../../../cdb/Cdb.md#cdb-cb7fc41768c9), [NavuException](../../../navu/NavuException.md#navuexception-d80fa0cb4f3f), [ConfException](../../../conf/ConfException.md#confexception-baeaab99f7f9)

Retrieves the alarm source central object.

**Parameters**

- `int alarmQueueLen` - the maximum queue length.
- `com.tailf.cdb.Cdb cdb` - the CDB socket to subscribe over.

**Returns:** the alarm source

**Throws**

- `IOException` - if there is an I/O error
- `NavuException` - if there is a Navu error
- `ConfException` - if there is a protocol error

**Deprecated:** Use [`NcsMain#getSourceCentral()`](../../NcsMain.md#getsourcecentral-0714ef465cc3) instead.

### getQueue() <a href="#getqueue-d349d0a1f2e7" id="getqueue-d349d0a1f2e7"></a>

```java
protected synchronized java.util.concurrent.ArrayBlockingQueue<com.tailf.ncs.alarmman.common.Alarm> getQueue()
```

Types: [Alarm](../common/Alarm.md#alarm-e07586c3430f)

Creates a new queue and adds it to the AlarmSource.

**Returns:** ArrayBlockingQueue

### isAlive() <a href="#isalive-264918864856" id="isalive-264918864856"></a>

```java
public boolean isAlive()
```

Returns true if the AlarmSourceCentral is running.

**Returns:** true if the AlarmSourceCentral is running, else false.

### returnAlarmQueue(ArrayBlockingQueue&lt;Alarm&gt;) <a href="#returnalarmqueue-4561d0dee1d9" id="returnalarmqueue-4561d0dee1d9"></a>

```java
public static void returnAlarmQueue(
    java.util.concurrent.ArrayBlockingQueue<com.tailf.ncs.alarmman.common.Alarm> queue
)
```

Types: [Alarm](../common/Alarm.md#alarm-e07586c3430f)

Returns the queue.

**Parameters**

- `java.util.concurrent.ArrayBlockingQueue<com.tailf.ncs.alarmman.common.Alarm> queue` - the queue to return.

**Deprecated:** Use `returnQueue(ArrayBlockingQueue<Alarm>)` instead.

### returnQueue(ArrayBlockingQueue&lt;Alarm&gt;) <a href="#returnqueue-87db70115c92" id="returnqueue-87db70115c92"></a>

```java
protected void returnQueue(
    java.util.concurrent.ArrayBlockingQueue<com.tailf.ncs.alarmman.common.Alarm> queue
)
```

Types: [Alarm](../common/Alarm.md#alarm-e07586c3430f)

Removes the queue from the list of
 queues.

**Parameters**

- `java.util.concurrent.ArrayBlockingQueue<com.tailf.ncs.alarmman.common.Alarm> queue`

### run() <a href="#run-b6dbda048863" id="run-b6dbda048863"></a>

```java
public void run()
```

### start() <a href="#start-79e12dafe9f8" id="start-79e12dafe9f8"></a>

```java
public void start()
```

Start the AlarmSourceCentral which makes
 it possible for AlarmSource's to attach to this
 `AlarmSourceCentral ` and receive notifications.

### stop() <a href="#stop-a62ecc446f97" id="stop-a62ecc446f97"></a>

```java
public synchronized void stop()
```

Stops the AlarmSourceCentral.


## Nested Types

- [AlarmDispatcher](AlarmSourceCentral/AlarmDispatcher.md#alarmdispatcher-46e75216df0e)
