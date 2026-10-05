<a id="cls-ProgressTraceNed"></a>
# ProgressTraceNed

```java
public class com.tailf.progress.ProgressTraceNed
    extends com.tailf.progress.ProgressTrace
```

Types: [ProgressTrace](ProgressTrace.md#cls-ProgressTrace)

The purpose of ` ProgressTraceNed ` class
 is to make it easy for a NED to interact with NSO's
 progress trace framework with the concept of spans.

 An new event or span requires a device id and a
 device phase. The device id is set in the class constructor
 [`ProgressTraceNed#ProgressTraceNed(Maapi, String)`](ProgressTraceNed.md#m-progresstracened-035453e18770),
 and the device phase is set using
 [`ProgressTraceNed#setPhase(String)`](ProgressTraceNed.md#m-setphase-06ea7510d166) method. For example:


```
 ProgressTraceNed progress = new ProgressTraceNed(maapi, "mydev");
 progress.setPhase("connect");
 progress.event("connect");
```

**See also:** [`ProgressTrace`](ProgressTrace.md#cls-ProgressTrace)

## Members

**Constructors**:

- [ProgressTraceNed(Maapi, String)](#m-progresstracened-035453e18770)

**Methods**:

- [endSpan(Span)](ProgressTrace.md#m-endspan-832d21f903c3) from ProgressTrace
- [endSpan(Span, String)](ProgressTrace.md#m-endspan-1c44c700da19) from ProgressTrace
- [event(String)](#m-event-35c2a3878e07)
- [event(Verbosity, String)](#m-event-9f8a52e74d94)
- [event(Verbosity, String, Attributes)](#m-event-cdc8c9e968cd)
- [getCurrentSpan()](ProgressTrace.md#m-getcurrentspan-95e59db0f66f) from ProgressTrace
- [setDeviceId(String)](#m-setdeviceid-d5a05ed041f8)
- [setPhase(String)](#m-setphase-06ea7510d166)
- [setServicePath(ConfPath)](ProgressTrace.md#m-setservicepath-95207665ae57) from ProgressTrace
- [startSpan(String)](#m-startspan-a255151f7145)
- [startSpan(Verbosity, String)](#m-startspan-b310d5a59dbf)
- [startSpan(Verbosity, String, Attributes, Span[])](#m-startspan-ec78710be35e)

## Constructors

<a id="m-progresstracened-035453e18770"></a>
### ProgressTraceNed(Maapi, String)

```java
public ProgressTraceNed(
    com.tailf.maapi.Maapi maapi,
    String deviceId
)
    throws com.tailf.conf.ConfException
```

Types: [Maapi](../maapi/Maapi.md#cls-Maapi), [ConfException](../conf/ConfException.md#cls-ConfException)

Creates a new instance of `ProgressTraceNed`

**Parameters**

- `com.tailf.maapi.Maapi maapi` - a [MAAPI](../maapi/Maapi.md#cls-Maapi) instance
- `String deviceId` - device ID

**Throws**

- `ConfException` - is thrown if device Id is either
            `null` or empty


## Methods

<a id="m-event-35c2a3878e07"></a>
### event(String)

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
- `IOException`

<a id="m-event-9f8a52e74d94"></a>
### event(Verbosity, String)

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

- `ConfException` - is thrown if either
            device Id or device phase is not set.
- `IOException`

<a id="m-event-cdc8c9e968cd"></a>
### event(Verbosity, String, Attributes)

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

- `ConfException` - is thrown if either
            device Id or device phase is not set.
- `IOException`

<a id="m-setdeviceid-d5a05ed041f8"></a>
### setDeviceId(String)

```java
public void setDeviceId(String deviceId)
```

Set a device ID

**Parameters**

- `String deviceId` - the device ID

<a id="m-setphase-06ea7510d166"></a>
### setPhase(String)

```java
public void setPhase(String phase)
```

Set a NED phase

**Parameters**

- `String phase` - the NED phase

<a id="m-startspan-a255151f7145"></a>
### startSpan(String)

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
         for `#endSpan`

**Throws**

- `ConfException` - is thrown if either
            device Id or device phase is not set.
- `IOException`

<a id="m-startspan-b310d5a59dbf"></a>
### startSpan(Verbosity, String)

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
         in `#endSpan`

**Throws**

- `ConfException` - is thrown if either
            device Id or device phase is not set.
- `IOException`

<a id="m-startspan-ec78710be35e"></a>
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
         in `#endSpan`

**Throws**

- `ConfException` - is thrown if either
            device Id or device phase is not set.
- `IOException`
