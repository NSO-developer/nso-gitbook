# ProgressNotification <a href="#progressnotification-97286de4fe31" id="progressnotification-97286de4fe31"></a>

```java
public class com.tailf.notif.ProgressNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#notification-b2e7d82d4215)

Data structure for progress notifications.

**Related classes**

- [CommitProgressNotification](CommitProgressNotification.md#commitprogressnotification-700cb70f0b31)

## Members

**Constructors**:

- [ProgressNotification(NotificationType, ProgressEventType, Long, Long, String, String, String, int, int, int, String, String, String, String, Map<String,ProgressAttributeValue>, List<ProgressLink>)](#progressnotification-c28e5ec8d49c)

**Fields**:

- [type](Notification.md#type-6ebb3673fbb6) from Notification

**Methods**:

- [getAnnotation()](#getannotation-f9c803b8d53c)
- [getAttributes()](#getattributes-34824a17bc02)
- [getAttributeValue(String)](#getattributevalue-74e7ac548f72)
- [getContext()](#getcontext-b18d576df5d9)
- [getDatastore()](#getdatastore-90019829a97f)
- [getDatastoreStr()](#getdatastorestr-c8f9783fbc77)
- [getDuration()](#getduration-aee615ea7fe2)
- [getLinks()](#getlinks-4e85332dc1df)
- [getMessage()](#getmessage-77b7dae8469e)
- [getNotificationType()](Notification.md#getnotificationtype-f0e32b7b644f) from Notification
- [getParentSpanId()](#getparentspanid-d345b2e6a97f)
- [getProgressEventType()](#getprogresseventtype-1fc5b96f8167)
- [getSessionId()](#getsessionid-aba33c116ed5)
- [getSpanId()](#getspanid-155306b8dcae)
- [getSubsystem()](#getsubsystem-04685ed88e54)
- [getTimestamp()](#gettimestamp-a9e0c6b457f8)
- [getTraceId()](#gettraceid-c3a30b94d9ce)
- [getTransactionId()](#gettransactionid-c986b15287a0)
- [toString()](#tostring-e9d48c5503ef)

**Nested Types**:

- [ProgressEventType](ProgressNotification/ProgressEventType.md#progresseventtype-502fa6a49262)

## Constructors

### ProgressNotification(NotificationType, ProgressEventType, Long, Long, String, String, String, int, int, int, String, String, String, String, Map&lt;String,ProgressAttributeValue&gt;, List&lt;ProgressLink&gt;) <a href="#progressnotification-c28e5ec8d49c" id="progressnotification-c28e5ec8d49c"></a>

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

Types: [NotificationType](NotificationType.md#notificationtype-1f10f57e184d), [ProgressEventType](ProgressNotification/ProgressEventType.md#progresseventtype-502fa6a49262), [ProgressAttributeValue](../maapi/ProgressAttributeValue.md#progressattributevalue-ec36459ec7af), [ProgressLink](../maapi/ProgressLink.md#progresslink-49caea742f77)

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

### getAnnotation() <a href="#getannotation-f9c803b8d53c" id="getannotation-f9c803b8d53c"></a>

```java
public String getAnnotation()
```

Metadata about the event, indicating error, explains latency or
 show result etc.

### getAttributes() <a href="#getattributes-34824a17bc02" id="getattributes-34824a17bc02"></a>

```java
public java.util.Map<String,com.tailf.maapi.ProgressAttributeValue> getAttributes()
```

Types: [ProgressAttributeValue](../maapi/ProgressAttributeValue.md#progressattributevalue-ec36459ec7af)

Attributes of the event. The values can be of type
 [`ProgressAttributeLiteral`](../maapi/ProgressAttributeLiteral.md#progressattributeliteral-a7e13d2dafd0) or
 [`ProgressAttributeNumber`](../maapi/ProgressAttributeNumber.md#progressattributenumber-6c4a8293ede8).

### getAttributeValue(String) <a href="#getattributevalue-74e7ac548f72" id="getattributevalue-74e7ac548f72"></a>

```java
public com.tailf.maapi.ProgressAttributeValue getAttributeValue(String name)
```

Types: [ProgressAttributeValue](../maapi/ProgressAttributeValue.md#progressattributevalue-ec36459ec7af)

Get a specific attribute of the event. The value can be of type
 [`ProgressAttributeLiteral`](../maapi/ProgressAttributeLiteral.md#progressattributeliteral-a7e13d2dafd0) or
 [`ProgressAttributeNumber`](../maapi/ProgressAttributeNumber.md#progressattributenumber-6c4a8293ede8).

**Parameters**

- `String name`

### getContext() <a href="#getcontext-b18d576df5d9" id="getcontext-b18d576df5d9"></a>

```java
public String getContext()
```

The context is either one of netconf, cli, webui, snmp,
 rest, system or it can be any other context string
 defined through the use of MAAPI.

### getDatastore() <a href="#getdatastore-90019829a97f" id="getdatastore-90019829a97f"></a>

```java
public int getDatastore()
```

Name of the datastore for which the transaction is started:


- [`Conf#DB_NONE`](../conf/Conf.md#db_none-5069c3fe4466)
   - [`Conf#DB_CANDIDATE`](../conf/Conf.md#db_candidate-8b43a337ac93)
     - [`Conf#DB_RUNNING`](../conf/Conf.md#db_running-c391f371da28)
       - [`Conf#DB_STARTUP`](../conf/Conf.md#db_startup-2ce085259486)
         - [`Conf#DB_OPERATIONAL`](../conf/Conf.md#db_operational-0d12377eea71)
           - [`Conf#DB_PRE_COMMIT_RUNNING`](../conf/Conf.md#db_pre_commit_running-0244b447e03f)
             - [`Conf#DB_INTENDED`](../conf/Conf.md#db_intended-3fa310253bdb)

### getDatastoreStr() <a href="#getdatastorestr-c8f9783fbc77" id="getdatastorestr-c8f9783fbc77"></a>

```java
public String getDatastoreStr()
```

Name, as string, of the datastore for which the transaction
 is started.

### getDuration() <a href="#getduration-aee615ea7fe2" id="getduration-aee615ea7fe2"></a>

```java
public Long getDuration()
```

Duration of the event in microseconds. Generated at the end of an event.

 The timestamp subtracted with the duration equals the start of the event.

### getLinks() <a href="#getlinks-4e85332dc1df" id="getlinks-4e85332dc1df"></a>

```java
public java.util.List<com.tailf.maapi.ProgressLink> getLinks()
```

Types: [ProgressLink](../maapi/ProgressLink.md#progresslink-49caea742f77)

Links to other events.

### getMessage() <a href="#getmessage-77b7dae8469e" id="getmessage-77b7dae8469e"></a>

```java
public String getMessage()
```

Progress event messeage.

### getParentSpanId() <a href="#getparentspanid-d345b2e6a97f" id="getparentspanid-d345b2e6a97f"></a>

```java
public String getParentSpanId()
```

This indicates the id of the parent span.

### getProgressEventType() <a href="#getprogresseventtype-1fc5b96f8167" id="getprogresseventtype-1fc5b96f8167"></a>

```java
public com.tailf.notif.ProgressNotification.ProgressEventType getProgressEventType()
```

Types: [ProgressEventType](ProgressNotification/ProgressEventType.md#progresseventtype-502fa6a49262)

Progress event type.

### getSessionId() <a href="#getsessionid-aba33c116ed5" id="getsessionid-aba33c116ed5"></a>

```java
public int getSessionId()
```

User session id.

### getSpanId() <a href="#getspanid-155306b8dcae" id="getspanid-155306b8dcae"></a>

```java
public String getSpanId()
```

Indicates the id of the span.

### getSubsystem() <a href="#getsubsystem-04685ed88e54" id="getsubsystem-04685ed88e54"></a>

```java
public String getSubsystem()
```

Subsystem name.

### getTimestamp() <a href="#gettimestamp-a9e0c6b457f8" id="gettimestamp-a9e0c6b457f8"></a>

```java
public Long getTimestamp()
```

Timestamp in microseconds since Epoch.

 Depending on the progress event type, this timestamp indicates the start
 of the event, the end of the event, or just when the event occured.

### getTraceId() <a href="#gettraceid-c3a30b94d9ce" id="gettraceid-c3a30b94d9ce"></a>

```java
public String getTraceId()
```

Per request unique trace id, included in headers and
       entries for relevant logs.

### getTransactionId() <a href="#gettransactionid-c986b15287a0" id="gettransactionid-c986b15287a0"></a>

```java
public int getTransactionId()
```

Transaction id.

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```


## Nested Types

- [ProgressEventType](ProgressNotification/ProgressEventType.md#progresseventtype-502fa6a49262)
