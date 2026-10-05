<a id="s-CommitProgressNotification"></a>
# CommitProgressNotification

```java
public class com.tailf.notif.CommitProgressNotification
    extends com.tailf.notif.ProgressNotification
```

Types: [ProgressNotification](ProgressNotification.md#s-ProgressNotification)

Data structure for commit progress notifications.

## Members

**Constructors**:

- [CommitProgressNotification(NotificationType, ProgressEventType, Long, Long, String, String, String, int, int, int, String, String, String, String, Map<String,ProgressAttributeValue>, List<ProgressLink>)](#s-CommitProgressNotification-1)

**Fields**:

- [type](Notification.md#s-type) from Notification

**Methods**:

- [getAnnotation()](ProgressNotification.md#s-getAnnotation) from ProgressNotification
- [getAttributes()](ProgressNotification.md#s-getAttributes) from ProgressNotification
- [getAttributeValue(String)](ProgressNotification.md#s-getAttributeValue) from ProgressNotification
- [getContext()](ProgressNotification.md#s-getContext) from ProgressNotification
- [getDatastore()](ProgressNotification.md#s-getDatastore) from ProgressNotification
- [getDatastoreStr()](ProgressNotification.md#s-getDatastoreStr) from ProgressNotification
- [getDuration()](ProgressNotification.md#s-getDuration) from ProgressNotification
- [getLinks()](ProgressNotification.md#s-getLinks) from ProgressNotification
- [getMessage()](ProgressNotification.md#s-getMessage) from ProgressNotification
- [getNotificationType()](Notification.md#s-getNotificationType) from Notification
- [getParentSpanId()](ProgressNotification.md#s-getParentSpanId) from ProgressNotification
- [getProgressEventType()](ProgressNotification.md#s-getProgressEventType) from ProgressNotification
- [getSessionId()](ProgressNotification.md#s-getSessionId) from ProgressNotification
- [getSpanId()](ProgressNotification.md#s-getSpanId) from ProgressNotification
- [getSubsystem()](ProgressNotification.md#s-getSubsystem) from ProgressNotification
- [getTimestamp()](ProgressNotification.md#s-getTimestamp) from ProgressNotification
- [getTraceId()](ProgressNotification.md#s-getTraceId) from ProgressNotification
- [getTransactionId()](ProgressNotification.md#s-getTransactionId) from ProgressNotification
- [toString()](ProgressNotification.md#s-toString) from ProgressNotification

## Constructors

<a id="s-CommitProgressNotification-1"></a>
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
