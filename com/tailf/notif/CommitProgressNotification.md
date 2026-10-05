<a id="cls-CommitProgressNotification"></a>
# CommitProgressNotification

```java
public class com.tailf.notif.CommitProgressNotification
    extends com.tailf.notif.ProgressNotification
```

Types: [ProgressNotification](ProgressNotification.md#cls-ProgressNotification)

Data structure for commit progress notifications.

## Members

**Constructors**:

- [CommitProgressNotification(NotificationType, ProgressEventType, Long, Long, String, String, String, int, int, int, String, String, String, String, Map<String,ProgressAttributeValue>, List<ProgressLink>)](#m-commitprogressnotification-b3de8dc0afc0)

**Fields**:

- [type](Notification.md#m-type) from Notification

**Methods**:

- [getAnnotation()](ProgressNotification.md#m-getannotation-f9c803b8d53c) from ProgressNotification
- [getAttributes()](ProgressNotification.md#m-getattributes-34824a17bc02) from ProgressNotification
- [getAttributeValue(String)](ProgressNotification.md#m-getattributevalue-74e7ac548f72) from ProgressNotification
- [getContext()](ProgressNotification.md#m-getcontext-b18d576df5d9) from ProgressNotification
- [getDatastore()](ProgressNotification.md#m-getdatastore-90019829a97f) from ProgressNotification
- [getDatastoreStr()](ProgressNotification.md#m-getdatastorestr-c8f9783fbc77) from ProgressNotification
- [getDuration()](ProgressNotification.md#m-getduration-aee615ea7fe2) from ProgressNotification
- [getLinks()](ProgressNotification.md#m-getlinks-4e85332dc1df) from ProgressNotification
- [getMessage()](ProgressNotification.md#m-getmessage-77b7dae8469e) from ProgressNotification
- [getNotificationType()](Notification.md#m-getnotificationtype-f0e32b7b644f) from Notification
- [getParentSpanId()](ProgressNotification.md#m-getparentspanid-d345b2e6a97f) from ProgressNotification
- [getProgressEventType()](ProgressNotification.md#m-getprogresseventtype-1fc5b96f8167) from ProgressNotification
- [getSessionId()](ProgressNotification.md#m-getsessionid-aba33c116ed5) from ProgressNotification
- [getSpanId()](ProgressNotification.md#m-getspanid-155306b8dcae) from ProgressNotification
- [getSubsystem()](ProgressNotification.md#m-getsubsystem-04685ed88e54) from ProgressNotification
- [getTimestamp()](ProgressNotification.md#m-gettimestamp-a9e0c6b457f8) from ProgressNotification
- [getTraceId()](ProgressNotification.md#m-gettraceid-c3a30b94d9ce) from ProgressNotification
- [getTransactionId()](ProgressNotification.md#m-gettransactionid-c986b15287a0) from ProgressNotification
- [toString()](ProgressNotification.md#m-tostring-e9d48c5503ef) from ProgressNotification

## Constructors

<a id="m-commitprogressnotification-b3de8dc0afc0"></a>
### CommitProgressNotification(NotificationType, ProgressEventType, Long, Long, String, String, String, int, int, int, String, String, String, String, Map<String,ProgressAttributeValue>, List<ProgressLink>)

```java
public CommitProgressNotification(
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
