# ProgressTrace <a href="#cls-ProgressTrace" id="cls-ProgressTrace"></a>

```java
public class com.tailf.progress.ProgressTrace
```

`ProgressTrace` class interacts with ConfD/NCS's
 progress trace framework over underlying
 [MAAPI](../maapi/Maapi.md#cls-Maapi). See the Progress Trace chapter
 in the NSO Development Guide or in the ConfD User Guide for more
 information. The class is implemented based on the concept of
 spans. For example:


```
 ProgressTrace progress = new ProgressTrace(maapi, tid);
 Attributes attributes = new Attributes();
 attributes.set("name", "value");
 Span span1 = progress.startSpan(Maapi.Verbosity.VERY_VERBOSE,
                                 "span1",
                                 attributes,
                                 null);
 Span span2 = progress.startSpan("span2");
 progress.endSpan(span2);
 progress.endSpan(span1);
```

**Related classes**

- [ProgressTraceNed](ProgressTraceNed.md#cls-ProgressTraceNed)

## Members

**Constructors**:

- [ProgressTrace(Maapi, int)](#m-ProgressTrace-79427d590b52)
- [ProgressTrace(Maapi, int, ConfPath)](#m-ProgressTrace-95f990b53e34)

**Methods**:

- [endSpan(Span)](#m-endSpan-832d21f903c3)
- [endSpan(Span, String)](#m-endSpan-1c44c700da19)
- [event(String)](#m-event-35c2a3878e07)
- [event(Verbosity, String)](#m-event-9f8a52e74d94)
- [event(Verbosity, String, Attributes)](#m-event-cdc8c9e968cd)
- [getCurrentSpan()](#m-getCurrentSpan-95e59db0f66f)
- [setServicePath(ConfPath)](#m-setServicePath-95207665ae57)
- [startSpan(String)](#m-startSpan-a255151f7145)
- [startSpan(Verbosity, String)](#m-startSpan-b310d5a59dbf)
- [startSpan(Verbosity, String, Attributes, Span[])](#m-startSpan-ec78710be35e)

## Constructors

### ProgressTrace(Maapi, int) <a href="#m-ProgressTrace-79427d590b52" id="m-ProgressTrace-79427d590b52"></a>

```java
public ProgressTrace(com.tailf.maapi.Maapi maapi, int tid) throws com.tailf.conf.ConfException
```

Types: [Maapi](../maapi/Maapi.md#cls-Maapi), [ConfException](../conf/ConfException.md#cls-ConfException)

Creates a new instance of `ProgressTrace`

**Parameters**

- `com.tailf.maapi.Maapi maapi` - a [MAAPI](../maapi/Maapi.md#cls-Maapi)
              instance
- `int tid` - transaction ID

**Throws**

- `ConfException`

### ProgressTrace(Maapi, int, ConfPath) <a href="#m-ProgressTrace-95f990b53e34" id="m-ProgressTrace-95f990b53e34"></a>

```java
public ProgressTrace(com.tailf.maapi.Maapi maapi, int tid, com.tailf.conf.ConfPath servicePath)
```

Types: [Maapi](../maapi/Maapi.md#cls-Maapi), [ConfPath](../conf/ConfPath.md#cls-ConfPath)

Creates a new instance of `ProgressTrace`.
 It is used for NSO service.

**Parameters**

- `com.tailf.maapi.Maapi maapi` - a [MAAPI](../maapi/Maapi.md#cls-Maapi)
        instance
- `int tid` - transaction ID
- `com.tailf.conf.ConfPath servicePath` - path of an NSO service instance


## Methods

### endSpan(Span) <a href="#m-endSpan-832d21f903c3" id="m-endSpan-832d21f903c3"></a>

```java
public void endSpan(
    com.tailf.progress.Span span
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Span](Span.md#cls-Span), [ConfException](../conf/ConfException.md#cls-ConfException)

End a span

**Parameters**

- `com.tailf.progress.Span span` - the span which was previously started

### endSpan(Span, String) <a href="#m-endSpan-1c44c700da19" id="m-endSpan-1c44c700da19"></a>

```java
public void endSpan(
    com.tailf.progress.Span span,
    String annotation
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Span](Span.md#cls-Span), [ConfException](../conf/ConfException.md#cls-ConfException)

End a span with annotation

**Parameters**

- `com.tailf.progress.Span span` - the span which was previously started
- `String annotation` - an annotation for this ending span
        This can be `null`

**Throws**

- `IOException`
- `ConfException`

### event(String) <a href="#m-event-35c2a3878e07" id="m-event-35c2a3878e07"></a>

```java
public void event(String message) throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Report an event

**Parameters**

- `String message` - message to report

**Throws**

- `IOException`
- `ConfException`

### event(Verbosity, String) <a href="#m-event-9f8a52e74d94" id="m-event-9f8a52e74d94"></a>

```java
public void event(
    com.tailf.maapi.Maapi.Verbosity verbosity,
    String message
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Verbosity](../maapi/Maapi/Verbosity.md#cls-Verbosity), [ConfException](../conf/ConfException.md#cls-ConfException)

Report an event

**Parameters**

- `com.tailf.maapi.Maapi.Verbosity verbosity` - at which verbosity level the
         message should be reported
- `String message` - message to report

**Throws**

- `IOException`
- `ConfException`

### event(Verbosity, String, Attributes) <a href="#m-event-cdc8c9e968cd" id="m-event-cdc8c9e968cd"></a>

```java
public void event(
    com.tailf.maapi.Maapi.Verbosity verbosity,
    String message,
    com.tailf.progress.Attributes attributes
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Verbosity](../maapi/Maapi/Verbosity.md#cls-Verbosity), [Attributes](Attributes.md#cls-Attributes), [ConfException](../conf/ConfException.md#cls-ConfException)

Report an event

**Parameters**

- `com.tailf.maapi.Maapi.Verbosity verbosity` - at which verbosity level the
         message should be reported
- `String message` - message to report
- `com.tailf.progress.Attributes attributes` - attributes of the events.
        This can be `null`.

**Throws**

- `IOException`
- `ConfException`

### getCurrentSpan() <a href="#m-getCurrentSpan-95e59db0f66f" id="m-getCurrentSpan-95e59db0f66f"></a>

```java
public com.tailf.progress.Span getCurrentSpan()
```

Types: [Span](Span.md#cls-Span)

Get the current span that is created by this API.
 The current span is updated to a new span or previous
 span depending on when
 a `ProgressTrace#startSpan` or a
 `ProgressTrace#endSpan` is called.

**Returns:** a [`Span`](Span.md#cls-Span) object or [`EmptySpan`](EmptySpan.md#cls-EmptySpan)
 object if the span is not created by the API.

### setServicePath(ConfPath) <a href="#m-setServicePath-95207665ae57" id="m-setServicePath-95207665ae57"></a>

```java
public void setServicePath(com.tailf.conf.ConfPath servicePath)
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath)

Set NSO's service path

**Parameters**

- `com.tailf.conf.ConfPath servicePath` - the service path

### startSpan(String) <a href="#m-startSpan-a255151f7145" id="m-startSpan-a255151f7145"></a>

```java
public com.tailf.progress.Span startSpan(
    String message
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Span](Span.md#cls-Span), [ConfException](../conf/ConfException.md#cls-ConfException)

Start a new span

**Parameters**

- `String message` - message of the span

**Returns:** a [`Span`](Span.md#cls-Span) object that is used
 for `ProgressTrace#endSpan`

**Throws**

- `IOException`
- `ConfException`

### startSpan(Verbosity, String) <a href="#m-startSpan-b310d5a59dbf" id="m-startSpan-b310d5a59dbf"></a>

```java
public com.tailf.progress.Span startSpan(
    com.tailf.maapi.Maapi.Verbosity verbosity,
    String message
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Span](Span.md#cls-Span), [Verbosity](../maapi/Maapi/Verbosity.md#cls-Verbosity), [ConfException](../conf/ConfException.md#cls-ConfException)

Start a new span

**Parameters**

- `com.tailf.maapi.Maapi.Verbosity verbosity` - at which verbosity level the
         message should be reported
- `String message` - message of the span

**Returns:** a [`Span`](Span.md#cls-Span) object that can used
 in `ProgressTrace#endSpan`

**Throws**

- `IOException`
- `ConfException`

### startSpan(Verbosity, String, Attributes, Span[]) <a href="#m-startSpan-ec78710be35e" id="m-startSpan-ec78710be35e"></a>

```java
public com.tailf.progress.Span startSpan(
    com.tailf.maapi.Maapi.Verbosity verbosity,
    String message,
    com.tailf.progress.Attributes attributes,
    com.tailf.progress.Span[] links
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Span](Span.md#cls-Span), [Verbosity](../maapi/Maapi/Verbosity.md#cls-Verbosity), [Attributes](Attributes.md#cls-Attributes), [ConfException](../conf/ConfException.md#cls-ConfException)

Start a new span

**Parameters**

- `com.tailf.maapi.Maapi.Verbosity verbosity` - at which verbosity level the
         message should be reported
- `String message` - message of the span
- `com.tailf.progress.Attributes attributes` - attributes of the span
        This can be `null`.
- `com.tailf.progress.Span[] links` - list of linked spans
        This can be `null`.

**Returns:** a [`Span`](Span.md#cls-Span) object that can used
 in `ProgressTrace#endSpan`

**Throws**

- `IOException`
- `ConfException`
