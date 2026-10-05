<a id="s-AlarmSource"></a>
# AlarmSource

```java
public class com.tailf.ncs.alarmman.consumer.AlarmSource
    implements AutoCloseable
```

This class establishes a listener queue for emitted alarms. It requires the
 [`AlarmSourceCentral`](AlarmSourceCentral.md#s-AlarmSourceCentral) to be started, which will submit the alarms to
 the queue

## Members

**Constructors**:

- [AlarmSource()](#s-AlarmSource-1)
- [AlarmSource(AlarmSourceCentral)](#s-AlarmSource-2)

**Methods**:

- [close()](#s-close)
- [isListening()](#s-isListening)
- [pollAlarm(int, TimeUnit)](#s-pollAlarm)
- [startListening()](#s-startListening)
- [stopListening()](#s-stopListening)
- [takeAlarm()](#s-takeAlarm)

## Constructors

<a id="s-AlarmSource-1"></a>
### AlarmSource()

```java
public AlarmSource()
```

Use the AlarmSourceCentral from the thread local NcsMain
 object.

<a id="s-AlarmSource-2"></a>
### AlarmSource(AlarmSourceCentral)

```java
public AlarmSource(com.tailf.ncs.alarmman.consumer.AlarmSourceCentral sourceCentral)
```

Types: [AlarmSourceCentral](AlarmSourceCentral.md#s-AlarmSourceCentral)

Use a specific AlarmSourceCentral.

**Parameters**

- `com.tailf.ncs.alarmman.consumer.AlarmSourceCentral sourceCentral` - the alarm source central


## Methods

<a id="s-close"></a>
### close()

```java
public void close()
```

Closes this alarm source by stopping the listening process.

<a id="s-isListening"></a>
### isListening()

```java
public boolean isListening()
```

Checks if this alarm source is currently listening for alarms.

**Returns:** true if listening, false otherwise

<a id="s-pollAlarm"></a>
### pollAlarm(int, TimeUnit)

```java
public com.tailf.ncs.alarmman.common.Alarm pollAlarm(
    int time,
    java.util.concurrent.TimeUnit unit
)
    throws InterruptedException
```

Types: [Alarm](../common/Alarm.md#s-Alarm)

Retrieves an alarm, waiting if necessary until one becomes available
 within the specified timeout period.

**Parameters**

- `int time` - the maximum time to wait
- `java.util.concurrent.TimeUnit unit` - the time unit of the timeout parameter

**Returns:** an alarm, or null if the timeout elapsed or not listening

**Throws**

- `InterruptedException` - if interrupted while waiting

<a id="s-startListening"></a>
### startListening()

```java
public void startListening()
```

Starts listening for alarms by initializing the queue if not already
 active.

<a id="s-stopListening"></a>
### stopListening()

```java
public void stopListening()
```

Stops listening for alarms

<a id="s-takeAlarm"></a>
### takeAlarm()

```java
public com.tailf.ncs.alarmman.common.Alarm takeAlarm() throws InterruptedException
```

Types: [Alarm](../common/Alarm.md#s-Alarm)

Retrieves or waiting if necessary until an Alarm becomes
 available.


 Blocks the current thread indefinitely
 until the operation can succeed.

**Returns:** Alarm the next available alarm

**Throws**

- `InterruptedException` - if interrupted while waiting
