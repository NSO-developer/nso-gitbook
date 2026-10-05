# AlarmSource <a href="#alarmsource-f5bcbf5bed9e" id="alarmsource-f5bcbf5bed9e"></a>

```java
public class com.tailf.ncs.alarmman.consumer.AlarmSource
    implements AutoCloseable
```

This class establishes a listener queue for emitted alarms. It requires the
 [`AlarmSourceCentral`](AlarmSourceCentral.md#alarmsourcecentral-bdfee4422149) to be started, which will submit the alarms to
 the queue

## Members

**Constructors**:

- [AlarmSource()](#alarmsource-d590063b7bb5)
- [AlarmSource(AlarmSourceCentral)](#alarmsource-cd47470fa7a3)

**Methods**:

- [close()](#close-8107c6dc012b)
- [isListening()](#islistening-ad0deb68ad68)
- [pollAlarm(int, TimeUnit)](#pollalarm-d491d8607d37)
- [startListening()](#startlistening-a174d71f92d6)
- [stopListening()](#stoplistening-74b0b8ef5ac2)
- [takeAlarm()](#takealarm-58b71d3346fe)

## Constructors

### AlarmSource() <a href="#alarmsource-d590063b7bb5" id="alarmsource-d590063b7bb5"></a>

```java
public AlarmSource()
```

Use the AlarmSourceCentral from the thread local NcsMain
 object.

### AlarmSource(AlarmSourceCentral) <a href="#alarmsource-cd47470fa7a3" id="alarmsource-cd47470fa7a3"></a>

```java
public AlarmSource(com.tailf.ncs.alarmman.consumer.AlarmSourceCentral sourceCentral)
```

Types: [AlarmSourceCentral](AlarmSourceCentral.md#alarmsourcecentral-bdfee4422149)

Use a specific AlarmSourceCentral.

**Parameters**

- `com.tailf.ncs.alarmman.consumer.AlarmSourceCentral sourceCentral` - the alarm source central


## Methods

### close() <a href="#close-8107c6dc012b" id="close-8107c6dc012b"></a>

```java
public void close()
```

Closes this alarm source by stopping the listening process.

### isListening() <a href="#islistening-ad0deb68ad68" id="islistening-ad0deb68ad68"></a>

```java
public boolean isListening()
```

Checks if this alarm source is currently listening for alarms.

**Returns:** true if listening, false otherwise

### pollAlarm(int, TimeUnit) <a href="#pollalarm-d491d8607d37" id="pollalarm-d491d8607d37"></a>

```java
public com.tailf.ncs.alarmman.common.Alarm pollAlarm(
    int time,
    java.util.concurrent.TimeUnit unit
)
    throws InterruptedException
```

Types: [Alarm](../common/Alarm.md#alarm-e07586c3430f)

Retrieves an alarm, waiting if necessary until one becomes available
 within the specified timeout period.

**Parameters**

- `int time` - the maximum time to wait
- `java.util.concurrent.TimeUnit unit` - the time unit of the timeout parameter

**Returns:** an alarm, or null if the timeout elapsed or not listening

**Throws**

- `InterruptedException` - if interrupted while waiting

### startListening() <a href="#startlistening-a174d71f92d6" id="startlistening-a174d71f92d6"></a>

```java
public void startListening()
```

Starts listening for alarms by initializing the queue if not already
 active.

### stopListening() <a href="#stoplistening-74b0b8ef5ac2" id="stoplistening-74b0b8ef5ac2"></a>

```java
public void stopListening()
```

Stops listening for alarms

### takeAlarm() <a href="#takealarm-58b71d3346fe" id="takealarm-58b71d3346fe"></a>

```java
public com.tailf.ncs.alarmman.common.Alarm takeAlarm() throws InterruptedException
```

Types: [Alarm](../common/Alarm.md#alarm-e07586c3430f)

Retrieves or waiting if necessary until an Alarm becomes
 available.


 Blocks the current thread indefinitely
 until the operation can succeed.

**Returns:** Alarm the next available alarm

**Throws**

- `InterruptedException` - if interrupted while waiting
