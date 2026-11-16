# TraceBuffer <a href="#tracebuffer-071afef693ad" id="tracebuffer-071afef693ad"></a>

```java
public class com.tailf.ned.TraceBuffer
```

## Members

**Constructors**:

- [TraceBuffer\(int, String, String\)](#tracebuffer-39991147aa5b)

**Methods**:

- [append\(NedTracer, String\)](#append-793a73e659d8)
- [flush\(NedTracer\)](#flush-a415364e52f6)
- [setLength\(int\)](#setlength-bb1c41009d62)

## Constructors

### TraceBuffer(int, String, String) <a href="#tracebuffer-39991147aa5b" id="tracebuffer-39991147aa5b"></a>

```java
public TraceBuffer(int autoCapacity, String direction, String deviceId)
```

**Parameters**

- `int autoCapacity`
- `String direction`
- `String deviceId`


## Methods

### append(NedTracer, String) <a href="#append-793a73e659d8" id="append-793a73e659d8"></a>

```java
public StringBuffer append(com.tailf.ned.NedTracer tracer, String line)
```

Types: [NedTracer](NedTracer.md#nedtracer-f8730263f5f2)

**Parameters**

- `com.tailf.ned.NedTracer tracer`
- `String line`

### flush(NedTracer) <a href="#flush-a415364e52f6" id="flush-a415364e52f6"></a>

```java
public void flush(com.tailf.ned.NedTracer tracer)
```

Types: [NedTracer](NedTracer.md#nedtracer-f8730263f5f2)

**Parameters**

- `com.tailf.ned.NedTracer tracer`

### setLength(int) <a href="#setlength-bb1c41009d62" id="setlength-bb1c41009d62"></a>

```java
public void setLength(int newLength)
```

**Parameters**

- `int newLength`
