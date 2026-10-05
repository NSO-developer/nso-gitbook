<a id="s-ProgressTraceNed"></a>
# ProgressTraceNed

```java
public class com.tailf.progress.ProgressTraceNed
    extends com.tailf.progress.ProgressTrace
```

Types: [ProgressTrace](ProgressTrace.md#s-ProgressTrace)

The purpose of ` ProgressTraceNed ` class
 is to make it easy for a NED to interact with NSO's
 progress trace framework with the concept of spans.

 An new event or span requires a device id and a
 device phase. The device id is set in the class constructor
 [`ProgressTraceNed`](ProgressTraceNed.md#s-ProgressTraceNed),
 and the device phase is set using
 [`ProgressTraceNed`](ProgressTraceNed.md#s-ProgressTraceNed) method. For example:


```
 ProgressTraceNed progress = new ProgressTraceNed(maapi, "mydev");
 progress.setPhase("connect");
 progress.event("connect");
```

**See also:** [`ProgressTrace`](ProgressTrace.md#s-ProgressTrace)

## Members

**Constructors**:

- [ProgressTraceNed(Maapi, String)](#s-ProgressTraceNed-1)

**Methods**:

- [endSpan(Span)](ProgressTrace.md#s-endSpan) from ProgressTrace
- [endSpan(Span, String)](ProgressTrace.md#s-endSpan-1) from ProgressTrace
- [event(String)](#s-event)
- [event(Verbosity, String)](#s-event-1)
- [event(Verbosity, String, Attributes)](#s-event-2)
- [getCurrentSpan()](ProgressTrace.md#s-getCurrentSpan) from ProgressTrace
- [setDeviceId(String)](#s-setDeviceId)
- [setPhase(String)](#s-setPhase)
- [setServicePath(ConfPath)](ProgressTrace.md#s-setServicePath) from ProgressTrace
- [startSpan(String)](#s-startSpan)
- [startSpan(Verbosity, String)](#s-startSpan-1)
- [startSpan(Verbosity, String, Attributes, Span[])](#s-startSpan-2)

## Constructors

<a id="s-ProgressTraceNed-1"></a>
### ProgressTraceNed(Maapi, String)

```java
public ProgressTraceNed(
    com.tailf.maapi.Maapi maapi,
    String deviceId
)
    throws com.tailf.conf.ConfException
```

Types: [Maapi](../maapi/Maapi.md#s-Maapi), [ConfException](../conf/ConfException.md#s-ConfException)

Creates a new instance of `ProgressTraceNed`

**Parameters**

- `com.tailf.maapi.Maapi maapi` - a [MAAPI](../maapi/Maapi.md#s-Maapi) instance
- `String deviceId` - device ID

**Throws**

- `ConfException` - is thrown if device Id is either
            `null` or empty


## Methods

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
- `IOException`

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

- `ConfException` - is thrown if either
            device Id or device phase is not set.
- `IOException`

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

- `ConfException` - is thrown if either
            device Id or device phase is not set.
- `IOException`

<a id="s-setDeviceId"></a>
### setDeviceId(String)

```java
public void setDeviceId(String deviceId)
```

Set a device ID

**Parameters**

- `String deviceId` - the device ID

<a id="s-setPhase"></a>
### setPhase(String)

```java
public void setPhase(String phase)
```

Set a NED phase

**Parameters**

- `String phase` - the NED phase

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
         for `#endSpan`

**Throws**

- `ConfException` - is thrown if either
            device Id or device phase is not set.
- `IOException`

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
         in `#endSpan`

**Throws**

- `ConfException` - is thrown if either
            device Id or device phase is not set.
- `IOException`

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
         in `#endSpan`

**Throws**

- `ConfException` - is thrown if either
            device Id or device phase is not set.
- `IOException`
