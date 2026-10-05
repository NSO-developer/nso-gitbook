<a id="cls-TraceBuffer"></a>
# TraceBuffer

```java
public class com.tailf.ned.TraceBuffer
```

## Members

**Constructors**:

- [TraceBuffer(int, String, String)](#m-tracebuffer-39991147aa5b)

**Methods**:

- [append(NedTracer, String)](#m-append-793a73e659d8)
- [flush(NedTracer)](#m-flush-a415364e52f6)
- [setLength(int)](#m-setlength-bb1c41009d62)

## Constructors

<a id="m-tracebuffer-39991147aa5b"></a>
### TraceBuffer(int, String, String)

```java
public TraceBuffer(int autoCapacity, String direction, String deviceId)
```

**Parameters**

- `int autoCapacity`
- `String direction`
- `String deviceId`


## Methods

<a id="m-append-793a73e659d8"></a>
### append(NedTracer, String)

```java
public StringBuffer append(com.tailf.ned.NedTracer tracer, String line)
```

Types: [NedTracer](NedTracer.md#cls-NedTracer)

**Parameters**

- `com.tailf.ned.NedTracer tracer`
- `String line`

<a id="m-flush-a415364e52f6"></a>
### flush(NedTracer)

```java
public void flush(com.tailf.ned.NedTracer tracer)
```

Types: [NedTracer](NedTracer.md#cls-NedTracer)

**Parameters**

- `com.tailf.ned.NedTracer tracer`

<a id="m-setlength-bb1c41009d62"></a>
### setLength(int)

```java
public void setLength(int newLength)
```

**Parameters**

- `int newLength`
