# ProgressTrace <a href="#progresstrace-46ae962fa75d" id="progresstrace-46ae962fa75d"></a>

```java
public class com.tailf.progress.ProgressTrace
```

`ProgressTrace` class interacts with ConfD/NCS's
 progress trace framework over underlying
 [MAAPI](../maapi/Maapi.md#maapi-67bcbe89c42e). See the Progress Trace chapter
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

- [ProgressTraceNed](ProgressTraceNed.md#progresstracened-d25e14ef8766)

## Members

**Constructors**:

- [ProgressTrace\(Maapi, int\)](#progresstrace-79427d590b52)
- [ProgressTrace\(Maapi, int, ConfPath\)](#progresstrace-95f990b53e34)

**Methods**:

- [endSpan\(Span\)](#endspan-832d21f903c3)
- [endSpan\(Span, String\)](#endspan-1c44c700da19)
- [event\(String\)](#event-35c2a3878e07)
- [event\(Verbosity, String\)](#event-9f8a52e74d94)
- [event\(Verbosity, String, Attributes\)](#event-cdc8c9e968cd)
- [getCurrentSpan\(\)](#getcurrentspan-95e59db0f66f)
- [setServicePath\(ConfPath\)](#setservicepath-95207665ae57)
- [startSpan\(String\)](#startspan-a255151f7145)
- [startSpan\(Verbosity, String\)](#startspan-b310d5a59dbf)
- [startSpan\(Verbosity, String, Attributes, Span\[\]\)](#startspan-ec78710be35e)

## Constructors

### ProgressTrace(Maapi, int) <a href="#progresstrace-79427d590b52" id="progresstrace-79427d590b52"></a>

```java
public ProgressTrace(com.tailf.maapi.Maapi maapi, int tid) throws com.tailf.conf.ConfException
```

Types: [Maapi](../maapi/Maapi.md#maapi-67bcbe89c42e), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Creates a new instance of `ProgressTrace`

**Parameters**

- `com.tailf.maapi.Maapi maapi` - a [MAAPI](../maapi/Maapi.md#maapi-67bcbe89c42e)
              instance
- `int tid` - transaction ID

**Throws**

- `ConfException`

### ProgressTrace(Maapi, int, ConfPath) <a href="#progresstrace-95f990b53e34" id="progresstrace-95f990b53e34"></a>

```java
public ProgressTrace(com.tailf.maapi.Maapi maapi, int tid, com.tailf.conf.ConfPath servicePath)
```

Types: [Maapi](../maapi/Maapi.md#maapi-67bcbe89c42e), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d)

Creates a new instance of `ProgressTrace`.
 It is used for NSO service.

**Parameters**

- `com.tailf.maapi.Maapi maapi` - a [MAAPI](../maapi/Maapi.md#maapi-67bcbe89c42e)
        instance
- `int tid` - transaction ID
- `com.tailf.conf.ConfPath servicePath` - path of an NSO service instance


## Methods

### endSpan(Span) <a href="#endspan-832d21f903c3" id="endspan-832d21f903c3"></a>

```java
public void endSpan(
    com.tailf.progress.Span span
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Span](Span.md#span-1e8b02bddf13), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

End a span

**Parameters**

- `com.tailf.progress.Span span` - the span which was previously started

### endSpan(Span, String) <a href="#endspan-1c44c700da19" id="endspan-1c44c700da19"></a>

```java
public void endSpan(
    com.tailf.progress.Span span,
    String annotation
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Span](Span.md#span-1e8b02bddf13), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

End a span with annotation

**Parameters**

- `com.tailf.progress.Span span` - the span which was previously started
- `String annotation` - an annotation for this ending span
        This can be `null`

**Throws**

- `IOException`
- `ConfException`

### event(String) <a href="#event-35c2a3878e07" id="event-35c2a3878e07"></a>

```java
public void event(String message) throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Report an event

**Parameters**

- `String message` - message to report

**Throws**

- `IOException`
- `ConfException`

### event(Verbosity, String) <a href="#event-9f8a52e74d94" id="event-9f8a52e74d94"></a>

```java
public void event(
    com.tailf.maapi.Maapi.Verbosity verbosity,
    String message
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Verbosity](../maapi/Maapi/Verbosity.md#verbosity-a9c618ec424f), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Report an event

**Parameters**

- `com.tailf.maapi.Maapi.Verbosity verbosity` - at which verbosity level the
         message should be reported
- `String message` - message to report

**Throws**

- `IOException`
- `ConfException`

### event(Verbosity, String, Attributes) <a href="#event-cdc8c9e968cd" id="event-cdc8c9e968cd"></a>

```java
public void event(
    com.tailf.maapi.Maapi.Verbosity verbosity,
    String message,
    com.tailf.progress.Attributes attributes
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Verbosity](../maapi/Maapi/Verbosity.md#verbosity-a9c618ec424f), [Attributes](Attributes.md#attributes-ca725b6502c4), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

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

### getCurrentSpan() <a href="#getcurrentspan-95e59db0f66f" id="getcurrentspan-95e59db0f66f"></a>

```java
public com.tailf.progress.Span getCurrentSpan()
```

Types: [Span](Span.md#span-1e8b02bddf13)

Get the current span that is created by this API.
 The current span is updated to a new span or previous
 span depending on when
 a `ProgressTrace#startSpan` or a
 `ProgressTrace#endSpan` is called.

**Returns:** a [`Span`](Span.md#span-1e8b02bddf13) object or [`EmptySpan`](EmptySpan.md#emptyspan-3567797150bb)
 object if the span is not created by the API.

### setServicePath(ConfPath) <a href="#setservicepath-95207665ae57" id="setservicepath-95207665ae57"></a>

```java
public void setServicePath(com.tailf.conf.ConfPath servicePath)
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d)

Set NSO's service path

**Parameters**

- `com.tailf.conf.ConfPath servicePath` - the service path

### startSpan(String) <a href="#startspan-a255151f7145" id="startspan-a255151f7145"></a>

```java
public com.tailf.progress.Span startSpan(
    String message
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Span](Span.md#span-1e8b02bddf13), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Start a new span

**Parameters**

- `String message` - message of the span

**Returns:** a [`Span`](Span.md#span-1e8b02bddf13) object that is used
 for `ProgressTrace#endSpan`

**Throws**

- `IOException`
- `ConfException`

### startSpan(Verbosity, String) <a href="#startspan-b310d5a59dbf" id="startspan-b310d5a59dbf"></a>

```java
public com.tailf.progress.Span startSpan(
    com.tailf.maapi.Maapi.Verbosity verbosity,
    String message
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Span](Span.md#span-1e8b02bddf13), [Verbosity](../maapi/Maapi/Verbosity.md#verbosity-a9c618ec424f), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Start a new span

**Parameters**

- `com.tailf.maapi.Maapi.Verbosity verbosity` - at which verbosity level the
         message should be reported
- `String message` - message of the span

**Returns:** a [`Span`](Span.md#span-1e8b02bddf13) object that can used
 in `ProgressTrace#endSpan`

**Throws**

- `IOException`
- `ConfException`

### startSpan(Verbosity, String, Attributes, Span[]) <a href="#startspan-ec78710be35e" id="startspan-ec78710be35e"></a>

```java
public com.tailf.progress.Span startSpan(
    com.tailf.maapi.Maapi.Verbosity verbosity,
    String message,
    com.tailf.progress.Attributes attributes,
    com.tailf.progress.Span[] links
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Span](Span.md#span-1e8b02bddf13), [Verbosity](../maapi/Maapi/Verbosity.md#verbosity-a9c618ec424f), [Attributes](Attributes.md#attributes-ca725b6502c4), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Start a new span

**Parameters**

- `com.tailf.maapi.Maapi.Verbosity verbosity` - at which verbosity level the
         message should be reported
- `String message` - message of the span
- `com.tailf.progress.Attributes attributes` - attributes of the span
        This can be `null`.
- `com.tailf.progress.Span[] links` - list of linked spans
        This can be `null`.

**Returns:** a [`Span`](Span.md#span-1e8b02bddf13) object that can used
 in `ProgressTrace#endSpan`

**Throws**

- `IOException`
- `ConfException`
