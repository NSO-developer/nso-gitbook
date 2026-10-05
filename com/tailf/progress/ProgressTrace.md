<a id="s-ProgressTrace"></a>
# ProgressTrace

```java
public class com.tailf.progress.ProgressTrace
```

`ProgressTrace` class interacts with ConfD/NCS's
 progress trace framework over underlying
 [MAAPI](../maapi/Maapi.md#s-Maapi). See the Progress Trace chapter
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

- [ProgressTraceNed](ProgressTraceNed.md#s-ProgressTraceNed)

## Members

**Constructors**:

- [ProgressTrace(Maapi, int)](#s-ProgressTrace-1)
- [ProgressTrace(Maapi, int, ConfPath)](#s-ProgressTrace-2)

**Methods**:

- [endSpan(Span)](#s-endSpan)
- [endSpan(Span, String)](#s-endSpan-1)
- [event(String)](#s-event)
- [event(Verbosity, String)](#s-event-1)
- [event(Verbosity, String, Attributes)](#s-event-2)
- [getCurrentSpan()](#s-getCurrentSpan)
- [setServicePath(ConfPath)](#s-setServicePath)
- [startSpan(String)](#s-startSpan)
- [startSpan(Verbosity, String)](#s-startSpan-1)
- [startSpan(Verbosity, String, Attributes, Span[])](#s-startSpan-2)

## Constructors

<a id="s-ProgressTrace-1"></a>
### ProgressTrace(Maapi, int)

```java
public ProgressTrace(com.tailf.maapi.Maapi maapi, int tid) throws com.tailf.conf.ConfException
```

Types: [Maapi](../maapi/Maapi.md#s-Maapi), [ConfException](../conf/ConfException.md#s-ConfException)

Creates a new instance of `ProgressTrace`

**Parameters**

- `com.tailf.maapi.Maapi maapi` - a [MAAPI](../maapi/Maapi.md#s-Maapi)
              instance
- `int tid` - transaction ID

**Throws**

- `ConfException`

<a id="s-ProgressTrace-2"></a>
### ProgressTrace(Maapi, int, ConfPath)

```java
public ProgressTrace(com.tailf.maapi.Maapi maapi, int tid, com.tailf.conf.ConfPath servicePath)
```

Types: [Maapi](../maapi/Maapi.md#s-Maapi), [ConfPath](../conf/ConfPath.md#s-ConfPath)

Creates a new instance of `ProgressTrace`.
 It is used for NSO service.

**Parameters**

- `com.tailf.maapi.Maapi maapi` - a [MAAPI](../maapi/Maapi.md#s-Maapi)
        instance
- `int tid` - transaction ID
- `com.tailf.conf.ConfPath servicePath` - path of an NSO service instance


## Methods

<a id="s-endSpan"></a>
### endSpan(Span)

```java
public void endSpan(
    com.tailf.progress.Span span
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Span](Span.md#s-Span), [ConfException](../conf/ConfException.md#s-ConfException)

End a span

**Parameters**

- `com.tailf.progress.Span span` - the span which was previously started

<a id="s-endSpan-1"></a>
### endSpan(Span, String)

```java
public void endSpan(
    com.tailf.progress.Span span,
    String annotation
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Span](Span.md#s-Span), [ConfException](../conf/ConfException.md#s-ConfException)

End a span with annotation

**Parameters**

- `com.tailf.progress.Span span` - the span which was previously started
- `String annotation` - an annotation for this ending span
        This can be `null`

**Throws**

- `IOException`
- `ConfException`

<a id="s-event"></a>
### event(String)

```java
public void event(String message) throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Report an event

**Parameters**

- `String message` - message to report

**Throws**

- `IOException`
- `ConfException`

<a id="s-event-1"></a>
### event(Verbosity, String)

```java
public void event(
    com.tailf.maapi.Maapi.Verbosity verbosity,
    String message
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Verbosity](../maapi/Maapi/Verbosity.md#s-Verbosity), [ConfException](../conf/ConfException.md#s-ConfException)

Report an event

**Parameters**

- `com.tailf.maapi.Maapi.Verbosity verbosity` - at which verbosity level the
         message should be reported
- `String message` - message to report

**Throws**

- `IOException`
- `ConfException`

<a id="s-event-2"></a>
### event(Verbosity, String, Attributes)

```java
public void event(
    com.tailf.maapi.Maapi.Verbosity verbosity,
    String message,
    com.tailf.progress.Attributes attributes
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Verbosity](../maapi/Maapi/Verbosity.md#s-Verbosity), [Attributes](Attributes.md#s-Attributes), [ConfException](../conf/ConfException.md#s-ConfException)

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

<a id="s-getCurrentSpan"></a>
### getCurrentSpan()

```java
public com.tailf.progress.Span getCurrentSpan()
```

Types: [Span](Span.md#s-Span)

Get the current span that is created by this API.
 The current span is updated to a new span or previous
 span depending on when
 a [`ProgressTrace`](ProgressTrace.md#s-ProgressTrace) or a
 [`ProgressTrace`](ProgressTrace.md#s-ProgressTrace) is called.

**Returns:** a [`Span`](Span.md#s-Span) object or [`EmptySpan`](EmptySpan.md#s-EmptySpan)
 object if the span is not created by the API.

<a id="s-setServicePath"></a>
### setServicePath(ConfPath)

```java
public void setServicePath(com.tailf.conf.ConfPath servicePath)
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath)

Set NSO's service path

**Parameters**

- `com.tailf.conf.ConfPath servicePath` - the service path

<a id="s-startSpan"></a>
### startSpan(String)

```java
public com.tailf.progress.Span startSpan(
    String message
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Span](Span.md#s-Span), [ConfException](../conf/ConfException.md#s-ConfException)

Start a new span

**Parameters**

- `String message` - message of the span

**Returns:** a [`Span`](Span.md#s-Span) object that is used
 for [`ProgressTrace`](ProgressTrace.md#s-ProgressTrace)

**Throws**

- `IOException`
- `ConfException`

<a id="s-startSpan-1"></a>
### startSpan(Verbosity, String)

```java
public com.tailf.progress.Span startSpan(
    com.tailf.maapi.Maapi.Verbosity verbosity,
    String message
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Span](Span.md#s-Span), [Verbosity](../maapi/Maapi/Verbosity.md#s-Verbosity), [ConfException](../conf/ConfException.md#s-ConfException)

Start a new span

**Parameters**

- `com.tailf.maapi.Maapi.Verbosity verbosity` - at which verbosity level the
         message should be reported
- `String message` - message of the span

**Returns:** a [`Span`](Span.md#s-Span) object that can used
 in [`ProgressTrace`](ProgressTrace.md#s-ProgressTrace)

**Throws**

- `IOException`
- `ConfException`

<a id="s-startSpan-2"></a>
### startSpan(Verbosity, String, Attributes, Span[])

```java
public com.tailf.progress.Span startSpan(
    com.tailf.maapi.Maapi.Verbosity verbosity,
    String message,
    com.tailf.progress.Attributes attributes,
    com.tailf.progress.Span[] links
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Span](Span.md#s-Span), [Verbosity](../maapi/Maapi/Verbosity.md#s-Verbosity), [Attributes](Attributes.md#s-Attributes), [ConfException](../conf/ConfException.md#s-ConfException)

Start a new span

**Parameters**

- `com.tailf.maapi.Maapi.Verbosity verbosity` - at which verbosity level the
         message should be reported
- `String message` - message of the span
- `com.tailf.progress.Attributes attributes` - attributes of the span
        This can be `null`.
- `com.tailf.progress.Span[] links` - list of linked spans
        This can be `null`.

**Returns:** a [`Span`](Span.md#s-Span) object that can used
 in [`ProgressTrace`](ProgressTrace.md#s-ProgressTrace)

**Throws**

- `IOException`
- `ConfException`
