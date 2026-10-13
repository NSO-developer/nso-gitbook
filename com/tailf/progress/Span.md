# Span <a href="#span-1e8b02bddf13" id="span-1e8b02bddf13"></a>

```java
public class com.tailf.progress.Span
```

Class for `Span` information.
 A Span object is created and returned
 by a `ProgressTrace#startSpan`
 method, and is passed to
 `ProgressTrace#endSpan`

**Related classes**

- [EmptySpan](EmptySpan.md#emptyspan-3567797150bb)

## Members

**Constructors**:

- [Span\(String, String\)](#span-6afbb0648a46)

**Methods**:

- [getSpanId\(\)](#getspanid-155306b8dcae)
- [getTraceId\(\)](#gettraceid-c3a30b94d9ce)

## Constructors

### Span(String, String) <a href="#span-6afbb0648a46" id="span-6afbb0648a46"></a>

```java
public Span(String spanId, String traceId)
```

Create a new span object

**Parameters**

- `String spanId` - the span ID
- `String traceId` - the trace ID


## Methods

### getSpanId() <a href="#getspanid-155306b8dcae" id="getspanid-155306b8dcae"></a>

```java
public String getSpanId()
```

**Returns:** the span ID as `String`

### getTraceId() <a href="#gettraceid-c3a30b94d9ce" id="gettraceid-c3a30b94d9ce"></a>

```java
public String getTraceId()
```

**Returns:** the trace ID as `String`
