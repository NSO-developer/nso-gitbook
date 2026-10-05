# Span <a href="#cls-Span" id="cls-Span"></a>

```java
public class com.tailf.progress.Span
```

Class for `Span` information.
 A Span object is created and returned
 by a `ProgressTrace#startSpan`
 method, and is passed to
 `ProgressTrace#endSpan`

**Related classes**

- [EmptySpan](EmptySpan.md#cls-EmptySpan)

## Members

**Constructors**:

- [Span(String, String)](#m-Span-6afbb0648a46)

**Methods**:

- [getSpanId()](#m-getSpanId-155306b8dcae)
- [getTraceId()](#m-getTraceId-c3a30b94d9ce)

## Constructors

### Span(String, String) <a href="#m-Span-6afbb0648a46" id="m-Span-6afbb0648a46"></a>

```java
public Span(String spanId, String traceId)
```

Create a new span object

**Parameters**

- `String spanId` - the span ID
- `String traceId` - the trace ID


## Methods

### getSpanId() <a href="#m-getSpanId-155306b8dcae" id="m-getSpanId-155306b8dcae"></a>

```java
public String getSpanId()
```

**Returns:** the span ID as `String`

### getTraceId() <a href="#m-getTraceId-c3a30b94d9ce" id="m-getTraceId-c3a30b94d9ce"></a>

```java
public String getTraceId()
```

**Returns:** the trace ID as `String`
