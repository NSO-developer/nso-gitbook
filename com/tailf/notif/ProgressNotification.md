<a id="cls-ProgressNotification"></a>
# ProgressNotification

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

- [ProgressNotification(NotificationType, ProgressEventType, Long, Long, String, String, String, int, int, int, String, String, String, String, Map<String,ProgressAttributeValue>, List<ProgressLink>)](#m-progressnotification-c28e5ec8d49c)

**Fields**:

- [type](Notification.md#m-type) from Notification

**Methods**:

- [getAnnotation()](#m-getannotation-f9c803b8d53c)
- [getAttributes()](#m-getattributes-34824a17bc02)
- [getAttributeValue(String)](#m-getattributevalue-74e7ac548f72)
- [getContext()](#m-getcontext-b18d576df5d9)
- [getDatastore()](#m-getdatastore-90019829a97f)
- [getDatastoreStr()](#m-getdatastorestr-c8f9783fbc77)
- [getDuration()](#m-getduration-aee615ea7fe2)
- [getLinks()](#m-getlinks-4e85332dc1df)
- [getMessage()](#m-getmessage-77b7dae8469e)
- [getNotificationType()](Notification.md#m-getnotificationtype-f0e32b7b644f) from Notification
- [getParentSpanId()](#m-getparentspanid-d345b2e6a97f)
- [getProgressEventType()](#m-getprogresseventtype-1fc5b96f8167)
- [getSessionId()](#m-getsessionid-aba33c116ed5)
- [getSpanId()](#m-getspanid-155306b8dcae)
- [getSubsystem()](#m-getsubsystem-04685ed88e54)
- [getTimestamp()](#m-gettimestamp-a9e0c6b457f8)
- [getTraceId()](#m-gettraceid-c3a30b94d9ce)
- [getTransactionId()](#m-gettransactionid-c986b15287a0)
- [toString()](#m-tostring-e9d48c5503ef)

**Nested Types**:

- [ProgressEventType](ProgressNotification/ProgressEventType.md#cls-ProgressEventType)

## Constructors

<a id="m-progressnotification-c28e5ec8d49c"></a>
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

<a id="m-getannotation-f9c803b8d53c"></a>
### getAnnotation()

```java
public String getAnnotation()
```

Metadata about the event, indicating error, explains latency or
 show result etc.

<a id="m-getattributes-34824a17bc02"></a>
### getAttributes()

```java
public java.util.Map<String,com.tailf.maapi.ProgressAttributeValue> getAttributes()
```

Types: [ProgressAttributeValue](../maapi/ProgressAttributeValue.md#cls-ProgressAttributeValue)

Attributes of the event. The values can be of type
 [`ProgressAttributeLiteral`](../maapi/ProgressAttributeLiteral.md#cls-ProgressAttributeLiteral) or
 [`ProgressAttributeNumber`](../maapi/ProgressAttributeNumber.md#cls-ProgressAttributeNumber).

<a id="m-getattributevalue-74e7ac548f72"></a>
### getAttributeValue(String)

```java
public com.tailf.maapi.ProgressAttributeValue getAttributeValue(String name)
```

Types: [ProgressAttributeValue](../maapi/ProgressAttributeValue.md#cls-ProgressAttributeValue)

Get a specific attribute of the event. The value can be of type
 [`ProgressAttributeLiteral`](../maapi/ProgressAttributeLiteral.md#cls-ProgressAttributeLiteral) or
 [`ProgressAttributeNumber`](../maapi/ProgressAttributeNumber.md#cls-ProgressAttributeNumber).

**Parameters**

- `String name`

<a id="m-getcontext-b18d576df5d9"></a>
### getContext()

```java
public String getContext()
```

The context is either one of netconf, cli, webui, snmp,
 rest, system or it can be any other context string
 defined through the use of MAAPI.

<a id="m-getdatastore-90019829a97f"></a>
### getDatastore()

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

<a id="m-getdatastorestr-c8f9783fbc77"></a>
### getDatastoreStr()

```java
public String getDatastoreStr()
```

Name, as string, of the datastore for which the transaction
 is started.

<a id="m-getduration-aee615ea7fe2"></a>
### getDuration()

```java
public Long getDuration()
```

Duration of the event in microseconds. Generated at the end of an event.

 The timestamp subtracted with the duration equals the start of the event.

<a id="m-getlinks-4e85332dc1df"></a>
### getLinks()

```java
public java.util.List<com.tailf.maapi.ProgressLink> getLinks()
```

Types: [ProgressLink](../maapi/ProgressLink.md#cls-ProgressLink)

Links to other events.

<a id="m-getmessage-77b7dae8469e"></a>
### getMessage()

```java
public String getMessage()
```

Progress event messeage.

<a id="m-getparentspanid-d345b2e6a97f"></a>
### getParentSpanId()

```java
public String getParentSpanId()
```

This indicates the id of the parent span.

<a id="m-getprogresseventtype-1fc5b96f8167"></a>
### getProgressEventType()

```java
public com.tailf.notif.ProgressNotification.ProgressEventType getProgressEventType()
```

Types: [ProgressEventType](ProgressNotification/ProgressEventType.md#cls-ProgressEventType)

Progress event type.

<a id="m-getsessionid-aba33c116ed5"></a>
### getSessionId()

```java
public int getSessionId()
```

User session id.

<a id="m-getspanid-155306b8dcae"></a>
### getSpanId()

```java
public String getSpanId()
```

Indicates the id of the span.

<a id="m-getsubsystem-04685ed88e54"></a>
### getSubsystem()

```java
public String getSubsystem()
```

Subsystem name.

<a id="m-gettimestamp-a9e0c6b457f8"></a>
### getTimestamp()

```java
public Long getTimestamp()
```

Timestamp in microseconds since Epoch.

 Depending on the progress event type, this timestamp indicates the start
 of the event, the end of the event, or just when the event occured.

<a id="m-gettraceid-c3a30b94d9ce"></a>
### getTraceId()

```java
public String getTraceId()
```

Per request unique trace id, included in headers and
       entries for relevant logs.

<a id="m-gettransactionid-c986b15287a0"></a>
### getTransactionId()

```java
public int getTransactionId()
```

Transaction id.

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```


## Nested Types

- [ProgressEventType](ProgressNotification/ProgressEventType.md#cls-ProgressEventType)
