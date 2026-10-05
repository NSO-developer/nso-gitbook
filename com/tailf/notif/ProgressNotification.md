<a id="s-ProgressNotification"></a>
# ProgressNotification

```java
public class com.tailf.notif.ProgressNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#s-Notification)

Data structure for progress notifications.

**Related classes**

- [CommitProgressNotification](CommitProgressNotification.md#s-CommitProgressNotification)

## Members

**Constructors**:

- [ProgressNotification(NotificationType, ProgressEventType, Long, Long, String, String, String, int, int, int, String, String, String, String, Map<String,ProgressAttributeValue>, List<ProgressLink>)](#s-ProgressNotification-1)

**Fields**:

- [type](Notification.md#s-type) from Notification

**Methods**:

- [getAnnotation()](#s-getAnnotation)
- [getAttributes()](#s-getAttributes)
- [getAttributeValue(String)](#s-getAttributeValue)
- [getContext()](#s-getContext)
- [getDatastore()](#s-getDatastore)
- [getDatastoreStr()](#s-getDatastoreStr)
- [getDuration()](#s-getDuration)
- [getLinks()](#s-getLinks)
- [getMessage()](#s-getMessage)
- [getNotificationType()](Notification.md#s-getNotificationType) from Notification
- [getParentSpanId()](#s-getParentSpanId)
- [getProgressEventType()](#s-getProgressEventType)
- [getSessionId()](#s-getSessionId)
- [getSpanId()](#s-getSpanId)
- [getSubsystem()](#s-getSubsystem)
- [getTimestamp()](#s-getTimestamp)
- [getTraceId()](#s-getTraceId)
- [getTransactionId()](#s-getTransactionId)
- [toString()](#s-toString)

**Nested Types**:

- [ProgressEventType](ProgressNotification/ProgressEventType.md#s-ProgressEventType)

## Constructors

<a id="s-ProgressNotification-1"></a>
### ProgressNotification(NotificationType, ProgressEventType, Long, Long, String, String, String, int, int, int, String, String, String, String, Map<String,ProgressAttributeValue>, List<ProgressLink>)

```java
public ProgressNotification(
    com.tailf.notif.NotificationType type,
    com.tailf.notif.ProgressNotification.ProgressEventType progressEventType,
    Long timestamp,
    Long duration,
    String traceId,
    String spanId,
    String parentSpanId,
    int usid,
    int tid,
    int datastore,
    String context,
    String subsystem,
    String message,
    String annotation,
    java.util.Map<String,com.tailf.maapi.ProgressAttributeValue> attributes,
    java.util.List<com.tailf.maapi.ProgressLink> links
)
```

Types: [NotificationType](NotificationType.md#s-NotificationType), [ProgressEventType](ProgressNotification/ProgressEventType.md#s-ProgressEventType), [ProgressAttributeValue](../maapi/ProgressAttributeValue.md#s-ProgressAttributeValue), [ProgressLink](../maapi/ProgressLink.md#s-ProgressLink)

**Parameters**

- `com.tailf.notif.NotificationType type`
- `com.tailf.notif.ProgressNotification.ProgressEventType progressEventType`
- `Long timestamp`
- `Long duration`
- `String traceId`
- `String spanId`
- `String parentSpanId`
- `int usid`
- `int tid`
- `int datastore`
- `String context`
- `String subsystem`
- `String message`
- `String annotation`
- `java.util.Map<String,com.tailf.maapi.ProgressAttributeValue> attributes`
- `java.util.List<com.tailf.maapi.ProgressLink> links`


## Methods

<a id="s-getAnnotation"></a>
### getAnnotation()

```java
public String getAnnotation()
```

Metadata about the event, indicating error, explains latency or
 show result etc.

<a id="s-getAttributes"></a>
### getAttributes()

```java
public java.util.Map<String,com.tailf.maapi.ProgressAttributeValue> getAttributes()
```

Types: [ProgressAttributeValue](../maapi/ProgressAttributeValue.md#s-ProgressAttributeValue)

Attributes of the event. The values can be of type
 [`ProgressAttributeLiteral`](../maapi/ProgressAttributeLiteral.md#s-ProgressAttributeLiteral) or
 [`ProgressAttributeNumber`](../maapi/ProgressAttributeNumber.md#s-ProgressAttributeNumber).

<a id="s-getAttributeValue"></a>
### getAttributeValue(String)

```java
public com.tailf.maapi.ProgressAttributeValue getAttributeValue(String name)
```

Types: [ProgressAttributeValue](../maapi/ProgressAttributeValue.md#s-ProgressAttributeValue)

Get a specific attribute of the event. The value can be of type
 [`ProgressAttributeLiteral`](../maapi/ProgressAttributeLiteral.md#s-ProgressAttributeLiteral) or
 [`ProgressAttributeNumber`](../maapi/ProgressAttributeNumber.md#s-ProgressAttributeNumber).

**Parameters**

- `String name`

<a id="s-getContext"></a>
### getContext()

```java
public String getContext()
```

The context is either one of netconf, cli, webui, snmp,
 rest, system or it can be any other context string
 defined through the use of MAAPI.

<a id="s-getDatastore"></a>
### getDatastore()

```java
public int getDatastore()
```

Name of the datastore for which the transaction is started:


- [`Conf`](../conf/Conf.md#s-Conf)
   - [`Conf`](../conf/Conf.md#s-Conf)
     - [`Conf`](../conf/Conf.md#s-Conf)
       - [`Conf`](../conf/Conf.md#s-Conf)
         - [`Conf`](../conf/Conf.md#s-Conf)
           - [`Conf`](../conf/Conf.md#s-Conf)
             - [`Conf`](../conf/Conf.md#s-Conf)

<a id="s-getDatastoreStr"></a>
### getDatastoreStr()

```java
public String getDatastoreStr()
```

Name, as string, of the datastore for which the transaction
 is started.

<a id="s-getDuration"></a>
### getDuration()

```java
public Long getDuration()
```

Duration of the event in microseconds. Generated at the end of an event.

 The timestamp subtracted with the duration equals the start of the event.

<a id="s-getLinks"></a>
### getLinks()

```java
public java.util.List<com.tailf.maapi.ProgressLink> getLinks()
```

Types: [ProgressLink](../maapi/ProgressLink.md#s-ProgressLink)

Links to other events.

<a id="s-getMessage"></a>
### getMessage()

```java
public String getMessage()
```

Progress event messeage.

<a id="s-getParentSpanId"></a>
### getParentSpanId()

```java
public String getParentSpanId()
```

This indicates the id of the parent span.

<a id="s-getProgressEventType"></a>
### getProgressEventType()

```java
public com.tailf.notif.ProgressNotification.ProgressEventType getProgressEventType()
```

Types: [ProgressEventType](ProgressNotification/ProgressEventType.md#s-ProgressEventType)

Progress event type.

<a id="s-getSessionId"></a>
### getSessionId()

```java
public int getSessionId()
```

User session id.

<a id="s-getSpanId"></a>
### getSpanId()

```java
public String getSpanId()
```

Indicates the id of the span.

<a id="s-getSubsystem"></a>
### getSubsystem()

```java
public String getSubsystem()
```

Subsystem name.

<a id="s-getTimestamp"></a>
### getTimestamp()

```java
public Long getTimestamp()
```

Timestamp in microseconds since Epoch.

 Depending on the progress event type, this timestamp indicates the start
 of the event, the end of the event, or just when the event occured.

<a id="s-getTraceId"></a>
### getTraceId()

```java
public String getTraceId()
```

Per request unique trace id, included in headers and
       entries for relevant logs.

<a id="s-getTransactionId"></a>
### getTransactionId()

```java
public int getTransactionId()
```

Transaction id.

<a id="s-toString"></a>
### toString()

```java
public String toString()
```


## Nested Types

- [ProgressEventType](ProgressNotification/ProgressEventType.md)
