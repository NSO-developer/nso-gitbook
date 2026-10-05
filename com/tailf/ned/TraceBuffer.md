# TraceBuffer <a href="#cls-TraceBuffer" id="cls-TraceBuffer"></a>

```java
public class com.tailf.ned.TraceBuffer
```

## Members

**Constructors**:

- [TraceBuffer(int, String, String)](#m-TraceBuffer-39991147aa5b)

**Methods**:

- [append(NedTracer, String)](#m-append-793a73e659d8)
- [flush(NedTracer)](#m-flush-a415364e52f6)
- [setLength(int)](#m-setLength-bb1c41009d62)

## Constructors

### TraceBuffer(int, String, String) <a href="#m-TraceBuffer-39991147aa5b" id="m-TraceBuffer-39991147aa5b"></a>

```java
public TraceBuffer(int autoCapacity, String direction, String deviceId)
```

**Parameters**

- `int autoCapacity`
- `String direction`
- `String deviceId`


## Methods

### append(NedTracer, String) <a href="#m-append-793a73e659d8" id="m-append-793a73e659d8"></a>

```java
public StringBuffer append(com.tailf.ned.NedTracer tracer, String line)
```

Types: [NedTracer](NedTracer.md#cls-NedTracer)

**Parameters**

- `com.tailf.ned.NedTracer tracer`
- `String line`

### flush(NedTracer) <a href="#m-flush-a415364e52f6" id="m-flush-a415364e52f6"></a>

```java
public void flush(com.tailf.ned.NedTracer tracer)
```

Types: [NedTracer](NedTracer.md#cls-NedTracer)

**Parameters**

- `com.tailf.ned.NedTracer tracer`

### setLength(int) <a href="#m-setLength-bb1c41009d62" id="m-setLength-bb1c41009d62"></a>

```java
public void setLength(int newLength)
```

**Parameters**

- `int newLength`
