<a id="cls-Span"></a>
# Span

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

- [Span(String, String)](#m-span-6afbb0648a46)

**Methods**:

- [getSpanId()](#m-getspanid-155306b8dcae)
- [getTraceId()](#m-gettraceid-c3a30b94d9ce)

## Constructors

<a id="m-span-6afbb0648a46"></a>
### Span(String, String)

```java
public Span(String spanId, String traceId)
```

Create a new span object

**Parameters**

- `String spanId` - the span ID
- `String traceId` - the trace ID


## Methods

<a id="m-getspanid-155306b8dcae"></a>
### getSpanId()

```java
public String getSpanId()
```

**Returns:** the span ID as `String`

<a id="m-gettraceid-c3a30b94d9ce"></a>
### getTraceId()

```java
public String getTraceId()
```

**Returns:** the trace ID as `String`
