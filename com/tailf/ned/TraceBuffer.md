<a id="s-TraceBuffer"></a>
# TraceBuffer

```java
public class com.tailf.ned.TraceBuffer
```

## Members

**Constructors**:

- [TraceBuffer(int, String, String)](#s-TraceBuffer-1)

**Methods**:

- [append(NedTracer, String)](#s-append)
- [flush(NedTracer)](#s-flush)
- [setLength(int)](#s-setLength)

## Constructors

<a id="s-TraceBuffer-1"></a>
### TraceBuffer(int, String, String)

```java
public TraceBuffer(int autoCapacity, String direction, String deviceId)
```

**Parameters**

- `int autoCapacity`
- `String direction`
- `String deviceId`


## Methods

<a id="s-append"></a>
### append(NedTracer, String)

```java
public StringBuffer append(com.tailf.ned.NedTracer tracer, String line)
```

Types: [NedTracer](NedTracer.md#s-NedTracer)

**Parameters**

- `com.tailf.ned.NedTracer tracer`
- `String line`

<a id="s-flush"></a>
### flush(NedTracer)

```java
public void flush(com.tailf.ned.NedTracer tracer)
```

Types: [NedTracer](NedTracer.md#s-NedTracer)

**Parameters**

- `com.tailf.ned.NedTracer tracer`

<a id="s-setLength"></a>
### setLength(int)

```java
public void setLength(int newLength)
```

**Parameters**

- `int newLength`
