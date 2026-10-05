# ProgressNotification <a href="#cls-ProgressNotification" id="cls-ProgressNotification"></a>

```java
public class com.tailf.notif.ProgressNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for progress notifications.

**Related classes**

- [CommitProgressNotification](CommitProgressNotification.md#cls-CommitProgressNotification)

## Members

**Constructors**:

- [ProgressNotification(NotificationType, ProgressEventType, Long, Long, String, String, String, int, int, int, String, String, String, String, Map<String,ProgressAttributeValue>, List<ProgressLink>)](#m-ProgressNotification-c28e5ec8d49c)

**Fields**:

- [type](Notification.md#m-type) from Notification

**Methods**:

- [getAnnotation()](#m-getAnnotation-f9c803b8d53c)
- [getAttributes()](#m-getAttributes-34824a17bc02)
- [getAttributeValue(String)](#m-getAttributeValue-74e7ac548f72)
- [getContext()](#m-getContext-b18d576df5d9)
- [getDatastore()](#m-getDatastore-90019829a97f)
- [getDatastoreStr()](#m-getDatastoreStr-c8f9783fbc77)
- [getDuration()](#m-getDuration-aee615ea7fe2)
- [getLinks()](#m-getLinks-4e85332dc1df)
- [getMessage()](#m-getMessage-77b7dae8469e)
- [getNotificationType()](Notification.md#m-getNotificationType-f0e32b7b644f) from Notification
- [getParentSpanId()](#m-getParentSpanId-d345b2e6a97f)
- [getProgressEventType()](#m-getProgressEventType-1fc5b96f8167)
- [getSessionId()](#m-getSessionId-aba33c116ed5)
- [getSpanId()](#m-getSpanId-155306b8dcae)
- [getSubsystem()](#m-getSubsystem-04685ed88e54)
- [getTimestamp()](#m-getTimestamp-a9e0c6b457f8)
- [getTraceId()](#m-getTraceId-c3a30b94d9ce)
- [getTransactionId()](#m-getTransactionId-c986b15287a0)
- [toString()](#m-toString-e9d48c5503ef)

**Nested Types**:

- [ProgressEventType](ProgressNotification/ProgressEventType.md#cls-ProgressEventType)

## Constructors

### ProgressNotification(NotificationType, ProgressEventType, Long, Long, String, String, String, int, int, int, String, String, String, String, Map<String,ProgressAttributeValue>, List<ProgressLink>) <a href="#m-ProgressNotification-c28e5ec8d49c" id="m-ProgressNotification-c28e5ec8d49c"></a>

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

Types: [NotificationType](NotificationType.md#cls-NotificationType), [ProgressEventType](ProgressNotification/ProgressEventType.md#cls-ProgressEventType), [ProgressAttributeValue](../maapi/ProgressAttributeValue.md#cls-ProgressAttributeValue), [ProgressLink](../maapi/ProgressLink.md#cls-ProgressLink)

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

### getAnnotation() <a href="#m-getAnnotation-f9c803b8d53c" id="m-getAnnotation-f9c803b8d53c"></a>

```java
public String getAnnotation()
```

Metadata about the event, indicating error, explains latency or
 show result etc.

### getAttributes() <a href="#m-getAttributes-34824a17bc02" id="m-getAttributes-34824a17bc02"></a>

```java
public java.util.Map<String,com.tailf.maapi.ProgressAttributeValue> getAttributes()
```

Types: [ProgressAttributeValue](../maapi/ProgressAttributeValue.md#cls-ProgressAttributeValue)

Attributes of the event. The values can be of type
 [`ProgressAttributeLiteral`](../maapi/ProgressAttributeLiteral.md#cls-ProgressAttributeLiteral) or
 [`ProgressAttributeNumber`](../maapi/ProgressAttributeNumber.md#cls-ProgressAttributeNumber).

### getAttributeValue(String) <a href="#m-getAttributeValue-74e7ac548f72" id="m-getAttributeValue-74e7ac548f72"></a>

```java
public com.tailf.maapi.ProgressAttributeValue getAttributeValue(String name)
```

Types: [ProgressAttributeValue](../maapi/ProgressAttributeValue.md#cls-ProgressAttributeValue)

Get a specific attribute of the event. The value can be of type
 [`ProgressAttributeLiteral`](../maapi/ProgressAttributeLiteral.md#cls-ProgressAttributeLiteral) or
 [`ProgressAttributeNumber`](../maapi/ProgressAttributeNumber.md#cls-ProgressAttributeNumber).

**Parameters**

- `String name`

### getContext() <a href="#m-getContext-b18d576df5d9" id="m-getContext-b18d576df5d9"></a>

```java
public String getContext()
```

The context is either one of netconf, cli, webui, snmp,
 rest, system or it can be any other context string
 defined through the use of MAAPI.

### getDatastore() <a href="#m-getDatastore-90019829a97f" id="m-getDatastore-90019829a97f"></a>

```java
public int getDatastore()
```

Name of the datastore for which the transaction is started:


- [`Conf#DB_NONE`](../conf/Conf.md#m-DB_NONE)
   - [`Conf#DB_CANDIDATE`](../conf/Conf.md#m-DB_CANDIDATE)
     - [`Conf#DB_RUNNING`](../conf/Conf.md#m-DB_RUNNING)
       - [`Conf#DB_STARTUP`](../conf/Conf.md#m-DB_STARTUP)
         - [`Conf#DB_OPERATIONAL`](../conf/Conf.md#m-DB_OPERATIONAL)
           - [`Conf#DB_PRE_COMMIT_RUNNING`](../conf/Conf.md#m-DB_PRE_COMMIT_RUNNING)
             - [`Conf#DB_INTENDED`](../conf/Conf.md#m-DB_INTENDED)

### getDatastoreStr() <a href="#m-getDatastoreStr-c8f9783fbc77" id="m-getDatastoreStr-c8f9783fbc77"></a>

```java
public String getDatastoreStr()
```

Name, as string, of the datastore for which the transaction
 is started.

### getDuration() <a href="#m-getDuration-aee615ea7fe2" id="m-getDuration-aee615ea7fe2"></a>

```java
public Long getDuration()
```

Duration of the event in microseconds. Generated at the end of an event.

 The timestamp subtracted with the duration equals the start of the event.

### getLinks() <a href="#m-getLinks-4e85332dc1df" id="m-getLinks-4e85332dc1df"></a>

```java
public java.util.List<com.tailf.maapi.ProgressLink> getLinks()
```

Types: [ProgressLink](../maapi/ProgressLink.md#cls-ProgressLink)

Links to other events.

### getMessage() <a href="#m-getMessage-77b7dae8469e" id="m-getMessage-77b7dae8469e"></a>

```java
public String getMessage()
```

Progress event messeage.

### getParentSpanId() <a href="#m-getParentSpanId-d345b2e6a97f" id="m-getParentSpanId-d345b2e6a97f"></a>

```java
public String getParentSpanId()
```

This indicates the id of the parent span.

### getProgressEventType() <a href="#m-getProgressEventType-1fc5b96f8167" id="m-getProgressEventType-1fc5b96f8167"></a>

```java
public com.tailf.notif.ProgressNotification.ProgressEventType getProgressEventType()
```

Types: [ProgressEventType](ProgressNotification/ProgressEventType.md#cls-ProgressEventType)

Progress event type.

### getSessionId() <a href="#m-getSessionId-aba33c116ed5" id="m-getSessionId-aba33c116ed5"></a>

```java
public int getSessionId()
```

User session id.

### getSpanId() <a href="#m-getSpanId-155306b8dcae" id="m-getSpanId-155306b8dcae"></a>

```java
public String getSpanId()
```

Indicates the id of the span.

### getSubsystem() <a href="#m-getSubsystem-04685ed88e54" id="m-getSubsystem-04685ed88e54"></a>

```java
public String getSubsystem()
```

Subsystem name.

### getTimestamp() <a href="#m-getTimestamp-a9e0c6b457f8" id="m-getTimestamp-a9e0c6b457f8"></a>

```java
public Long getTimestamp()
```

Timestamp in microseconds since Epoch.

 Depending on the progress event type, this timestamp indicates the start
 of the event, the end of the event, or just when the event occured.

### getTraceId() <a href="#m-getTraceId-c3a30b94d9ce" id="m-getTraceId-c3a30b94d9ce"></a>

```java
public String getTraceId()
```

Per request unique trace id, included in headers and
       entries for relevant logs.

### getTransactionId() <a href="#m-getTransactionId-c986b15287a0" id="m-getTransactionId-c986b15287a0"></a>

```java
public int getTransactionId()
```

Transaction id.

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```


## Nested Types

- [ProgressEventType](ProgressNotification/ProgressEventType.md#cls-ProgressEventType)
