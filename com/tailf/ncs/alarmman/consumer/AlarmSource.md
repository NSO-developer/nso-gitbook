<a id="cls-AlarmSource"></a>
# AlarmSource

```java
public class com.tailf.ncs.alarmman.consumer.AlarmSource
    implements AutoCloseable
```

This class establishes a listener queue for emitted alarms. It requires the
 [`AlarmSourceCentral`](AlarmSourceCentral.md#cls-AlarmSourceCentral) to be started, which will submit the alarms to
 the queue

## Members

**Constructors**:

- [AlarmSource()](#m-alarmsource-d590063b7bb5)
- [AlarmSource(AlarmSourceCentral)](#m-alarmsource-cd47470fa7a3)

**Methods**:

- [close()](#m-close-8107c6dc012b)
- [isListening()](#m-islistening-ad0deb68ad68)
- [pollAlarm(int, TimeUnit)](#m-pollalarm-d491d8607d37)
- [startListening()](#m-startlistening-a174d71f92d6)
- [stopListening()](#m-stoplistening-74b0b8ef5ac2)
- [takeAlarm()](#m-takealarm-58b71d3346fe)

## Constructors

<a id="m-alarmsource-d590063b7bb5"></a>
### AlarmSource()

```java
public AlarmSource()
```

Use the AlarmSourceCentral from the thread local NcsMain
 object.

<a id="m-alarmsource-cd47470fa7a3"></a>
### AlarmSource(AlarmSourceCentral)

```java
public AlarmSource(com.tailf.ncs.alarmman.consumer.AlarmSourceCentral sourceCentral)
```

Types: [AlarmSourceCentral](AlarmSourceCentral.md#cls-AlarmSourceCentral)

Use a specific AlarmSourceCentral.

**Parameters**

- `com.tailf.ncs.alarmman.consumer.AlarmSourceCentral sourceCentral` - the alarm source central


## Methods

<a id="m-close-8107c6dc012b"></a>
### close()

```java
public void close()
```

Closes this alarm source by stopping the listening process.

<a id="m-islistening-ad0deb68ad68"></a>
### isListening()

```java
public boolean isListening()
```

Checks if this alarm source is currently listening for alarms.

**Returns:** true if listening, false otherwise

<a id="m-pollalarm-d491d8607d37"></a>
### pollAlarm(int, TimeUnit)

```java
public com.tailf.ncs.alarmman.common.Alarm pollAlarm(
    int time,
    java.util.concurrent.TimeUnit unit
)
    throws InterruptedException
```

Types: [Alarm](../common/Alarm.md#cls-Alarm)

Retrieves an alarm, waiting if necessary until one becomes available
 within the specified timeout period.

**Parameters**

- `int time` - the maximum time to wait
- `java.util.concurrent.TimeUnit unit` - the time unit of the timeout parameter

**Returns:** an alarm, or null if the timeout elapsed or not listening

**Throws**

- `InterruptedException` - if interrupted while waiting

<a id="m-startlistening-a174d71f92d6"></a>
### startListening()

```java
public void startListening()
```

Starts listening for alarms by initializing the queue if not already
 active.

<a id="m-stoplistening-74b0b8ef5ac2"></a>
### stopListening()

```java
public void stopListening()
```

Stops listening for alarms

<a id="m-takealarm-58b71d3346fe"></a>
### takeAlarm()

```java
public com.tailf.ncs.alarmman.common.Alarm takeAlarm() throws InterruptedException
```

Types: [Alarm](../common/Alarm.md#cls-Alarm)

Retrieves or waiting if necessary until an Alarm becomes
 available.


 Blocks the current thread indefinitely
 until the operation can succeed.

**Returns:** Alarm the next available alarm

**Throws**

- `InterruptedException` - if interrupted while waiting
