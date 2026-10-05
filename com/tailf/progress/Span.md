<a id="s-Span"></a>
# Span

```java
public class com.tailf.progress.Span
```

Class for `Span` information.
 A Span object is created and returned
 by a [`ProgressTrace`](ProgressTrace.md#s-ProgressTrace)
 method, and is passed to
 [`ProgressTrace`](ProgressTrace.md#s-ProgressTrace)

**Related classes**

- [EmptySpan](EmptySpan.md#s-EmptySpan)

## Members

**Constructors**:

- [Span(String, String)](#s-Span-1)

**Methods**:

- [getSpanId()](#s-getSpanId)
- [getTraceId()](#s-getTraceId)

## Constructors

<a id="s-Span-1"></a>
### Span(String, String)

```java
public Span(String spanId, String traceId)
```

Create a new span object

**Parameters**

- `String spanId` - the span ID
- `String traceId` - the trace ID


## Methods

<a id="s-getSpanId"></a>
### getSpanId()

```java
public String getSpanId()
```

**Returns:** the span ID as `String`

<a id="s-getTraceId"></a>
### getTraceId()

```java
public String getTraceId()
```

**Returns:** the trace ID as `String`
