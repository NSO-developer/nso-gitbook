# ProgressTraceNed <a href="#progresstracened-d25e14ef8766" id="progresstracened-d25e14ef8766"></a>

```java
public class com.tailf.progress.ProgressTraceNed
    extends com.tailf.progress.ProgressTrace
```

Types: [ProgressTrace](ProgressTrace.md#progresstrace-46ae962fa75d)

The purpose of ` ProgressTraceNed ` class
 is to make it easy for a NED to interact with NSO's
 progress trace framework with the concept of spans.

 An new event or span requires a device id and a
 device phase. The device id is set in the class constructor
 [`ProgressTraceNed#ProgressTraceNed(Maapi, String)`](ProgressTraceNed.md#progresstracened-035453e18770),
 and the device phase is set using
 [`ProgressTraceNed#setPhase(String)`](ProgressTraceNed.md#setphase-06ea7510d166) method. For example:


```
 ProgressTraceNed progress = new ProgressTraceNed(maapi, "mydev");
 progress.setPhase("connect");
 progress.event("connect");
```

**See also:** [`ProgressTrace`](ProgressTrace.md#progresstrace-46ae962fa75d)

## Members

**Constructors**:

- [ProgressTraceNed\(Maapi, String\)](#progresstracened-035453e18770)

**Methods**:

- [endSpan\(Span\)](ProgressTrace.md#endspan-832d21f903c3) from ProgressTrace
- [endSpan\(Span, String\)](ProgressTrace.md#endspan-1c44c700da19) from ProgressTrace
- [event\(String\)](#event-35c2a3878e07)
- [event\(Verbosity, String\)](#event-9f8a52e74d94)
- [event\(Verbosity, String, Attributes\)](#event-cdc8c9e968cd)
- [getCurrentSpan\(\)](ProgressTrace.md#getcurrentspan-95e59db0f66f) from ProgressTrace
- [setDeviceId\(String\)](#setdeviceid-d5a05ed041f8)
- [setPhase\(String\)](#setphase-06ea7510d166)
- [setServicePath\(ConfPath\)](ProgressTrace.md#setservicepath-95207665ae57) from ProgressTrace
- [startSpan\(String\)](#startspan-a255151f7145)
- [startSpan\(Verbosity, String\)](#startspan-b310d5a59dbf)
- [startSpan\(Verbosity, String, Attributes, Span\[\]\)](#startspan-ec78710be35e)

## Constructors

### ProgressTraceNed(Maapi, String) <a href="#progresstracened-035453e18770" id="progresstracened-035453e18770"></a>

```java
public ProgressTraceNed(
    com.tailf.maapi.Maapi maapi,
    String deviceId
)
    throws com.tailf.conf.ConfException
```

Types: [Maapi](../maapi/Maapi.md#maapi-67bcbe89c42e), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Creates a new instance of `ProgressTraceNed`

**Parameters**

- `com.tailf.maapi.Maapi maapi` - a [MAAPI](../maapi/Maapi.md#maapi-67bcbe89c42e) instance
- `String deviceId` - device ID

**Throws**

- `ConfException` - is thrown if device Id is either
            `null` or empty


## Methods

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
- `IOException`

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

- `ConfException` - is thrown if either
            device Id or device phase is not set.
- `IOException`

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

- `ConfException` - is thrown if either
            device Id or device phase is not set.
- `IOException`

### setDeviceId(String) <a href="#setdeviceid-d5a05ed041f8" id="setdeviceid-d5a05ed041f8"></a>

```java
public void setDeviceId(String deviceId)
```

Set a device ID

**Parameters**

- `String deviceId` - the device ID

### setPhase(String) <a href="#setphase-06ea7510d166" id="setphase-06ea7510d166"></a>

```java
public void setPhase(String phase)
```

Set a NED phase

**Parameters**

- `String phase` - the NED phase

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
         for `endSpan`

**Throws**

- `ConfException` - is thrown if either
            device Id or device phase is not set.
- `IOException`

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
         in `endSpan`

**Throws**

- `ConfException` - is thrown if either
            device Id or device phase is not set.
- `IOException`

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
         in `endSpan`

**Throws**

- `ConfException` - is thrown if either
            device Id or device phase is not set.
- `IOException`
