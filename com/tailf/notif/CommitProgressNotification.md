# CommitProgressNotification <a href="#commitprogressnotification-700cb70f0b31" id="commitprogressnotification-700cb70f0b31"></a>

```java
public class com.tailf.notif.CommitProgressNotification
    extends com.tailf.notif.ProgressNotification
```

Types: [ProgressNotification](ProgressNotification.md#progressnotification-97286de4fe31)

Data structure for commit progress notifications.

## Members

**Constructors**:

- [CommitProgressNotification\(NotificationType, ProgressEventType, Long, Long, String, String, String, int, int, int, String, String, String, String, Map\<String,ProgressAttributeValue\>, List\<ProgressLink\>\)](#commitprogressnotification-b3de8dc0afc0)

**Fields**:

- [type](Notification.md#type-6ebb3673fbb6) from Notification

**Methods**:

- [getAnnotation\(\)](ProgressNotification.md#getannotation-f9c803b8d53c) from ProgressNotification
- [getAttributes\(\)](ProgressNotification.md#getattributes-34824a17bc02) from ProgressNotification
- [getAttributeValue\(String\)](ProgressNotification.md#getattributevalue-74e7ac548f72) from ProgressNotification
- [getContext\(\)](ProgressNotification.md#getcontext-b18d576df5d9) from ProgressNotification
- [getDatastore\(\)](ProgressNotification.md#getdatastore-90019829a97f) from ProgressNotification
- [getDatastoreStr\(\)](ProgressNotification.md#getdatastorestr-c8f9783fbc77) from ProgressNotification
- [getDuration\(\)](ProgressNotification.md#getduration-aee615ea7fe2) from ProgressNotification
- [getLinks\(\)](ProgressNotification.md#getlinks-4e85332dc1df) from ProgressNotification
- [getMessage\(\)](ProgressNotification.md#getmessage-77b7dae8469e) from ProgressNotification
- [getNotificationType\(\)](Notification.md#getnotificationtype-f0e32b7b644f) from Notification
- [getParentSpanId\(\)](ProgressNotification.md#getparentspanid-d345b2e6a97f) from ProgressNotification
- [getProgressEventType\(\)](ProgressNotification.md#getprogresseventtype-1fc5b96f8167) from ProgressNotification
- [getSessionId\(\)](ProgressNotification.md#getsessionid-aba33c116ed5) from ProgressNotification
- [getSpanId\(\)](ProgressNotification.md#getspanid-155306b8dcae) from ProgressNotification
- [getSubsystem\(\)](ProgressNotification.md#getsubsystem-04685ed88e54) from ProgressNotification
- [getTimestamp\(\)](ProgressNotification.md#gettimestamp-a9e0c6b457f8) from ProgressNotification
- [getTraceId\(\)](ProgressNotification.md#gettraceid-c3a30b94d9ce) from ProgressNotification
- [getTransactionId\(\)](ProgressNotification.md#gettransactionid-c986b15287a0) from ProgressNotification
- [toString\(\)](ProgressNotification.md#tostring-e9d48c5503ef) from ProgressNotification

## Constructors

### CommitProgressNotification(NotificationType, ProgressEventType, Long, Long, String, String, String, int, int, int, String, String, String, String, Map&lt;String,ProgressAttributeValue&gt;, List&lt;ProgressLink&gt;) <a href="#commitprogressnotification-b3de8dc0afc0" id="commitprogressnotification-b3de8dc0afc0"></a>

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
