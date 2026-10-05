# AlarmSource <a href="#cls-AlarmSource" id="cls-AlarmSource"></a>

```java
public class com.tailf.ncs.alarmman.consumer.AlarmSource
    implements AutoCloseable
```

This class establishes a listener queue for emitted alarms. It requires the
 [`AlarmSourceCentral`](AlarmSourceCentral.md#cls-AlarmSourceCentral) to be started, which will submit the alarms to
 the queue

## Members

**Constructors**:

- [AlarmSource()](#m-AlarmSource-d590063b7bb5)
- [AlarmSource(AlarmSourceCentral)](#m-AlarmSource-cd47470fa7a3)

**Methods**:

- [close()](#m-close-8107c6dc012b)
- [isListening()](#m-isListening-ad0deb68ad68)
- [pollAlarm(int, TimeUnit)](#m-pollAlarm-d491d8607d37)
- [startListening()](#m-startListening-a174d71f92d6)
- [stopListening()](#m-stopListening-74b0b8ef5ac2)
- [takeAlarm()](#m-takeAlarm-58b71d3346fe)

## Constructors

### AlarmSource() <a href="#m-AlarmSource-d590063b7bb5" id="m-AlarmSource-d590063b7bb5"></a>

```java
public AlarmSource()
```

Use the AlarmSourceCentral from the thread local NcsMain
 object.

### AlarmSource(AlarmSourceCentral) <a href="#m-AlarmSource-cd47470fa7a3" id="m-AlarmSource-cd47470fa7a3"></a>

```java
public AlarmSource(com.tailf.ncs.alarmman.consumer.AlarmSourceCentral sourceCentral)
```

Types: [AlarmSourceCentral](AlarmSourceCentral.md#cls-AlarmSourceCentral)

Use a specific AlarmSourceCentral.

**Parameters**

- `com.tailf.ncs.alarmman.consumer.AlarmSourceCentral sourceCentral` - the alarm source central


## Methods

### close() <a href="#m-close-8107c6dc012b" id="m-close-8107c6dc012b"></a>

```java
public void close()
```

Closes this alarm source by stopping the listening process.

### isListening() <a href="#m-isListening-ad0deb68ad68" id="m-isListening-ad0deb68ad68"></a>

```java
public boolean isListening()
```

Checks if this alarm source is currently listening for alarms.

**Returns:** true if listening, false otherwise

### pollAlarm(int, TimeUnit) <a href="#m-pollAlarm-d491d8607d37" id="m-pollAlarm-d491d8607d37"></a>

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

### startListening() <a href="#m-startListening-a174d71f92d6" id="m-startListening-a174d71f92d6"></a>

```java
public void startListening()
```

Starts listening for alarms by initializing the queue if not already
 active.

### stopListening() <a href="#m-stopListening-74b0b8ef5ac2" id="m-stopListening-74b0b8ef5ac2"></a>

```java
public void stopListening()
```

Stops listening for alarms

### takeAlarm() <a href="#m-takeAlarm-58b71d3346fe" id="m-takeAlarm-58b71d3346fe"></a>

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
