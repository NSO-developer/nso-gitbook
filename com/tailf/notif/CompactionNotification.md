<a id="s-CompactionNotification"></a>
# CompactionNotification

```java
public class com.tailf.notif.CompactionNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#s-Notification)

Data structure for compaction notifications.

## Members

**Constructors**:

- [CompactionNotification(int, int, long, long, long, long, long, int)](#s-CompactionNotification-1)

**Fields**:

- [type](Notification.md#s-type) from Notification

**Methods**:

- [getCompactionFile()](#s-getCompactionFile)
- [getCompactionType()](#s-getCompactionType)
- [getDuration()](#s-getDuration)
- [getFsizeEnd()](#s-getFsizeEnd)
- [getFsizeLast()](#s-getFsizeLast)
- [getFsizeStart()](#s-getFsizeStart)
- [getNotificationType()](Notification.md#s-getNotificationType) from Notification
- [getNTrans()](#s-getNTrans)
- [getTimeStart()](#s-getTimeStart)
- [toString()](#s-toString)

**Nested Types**:

- [CompactionFile](CompactionNotification/CompactionFile.md#s-CompactionFile)
- [CompactionType](CompactionNotification/CompactionType.md#s-CompactionType)

## Constructors

<a id="s-CompactionNotification-1"></a>
### CompactionNotification(int, int, long, long, long, long, long, int)

```java
public CompactionNotification(
    int dbFile,
    int compactionType,
    long fsizeStart,
    long fsizeEnd,
    long fsizeLast,
    long timeStart,
    long duration,
    int nTrans
)
```

**Parameters**

- `int dbFile`
- `int compactionType`
- `long fsizeStart`
- `long fsizeEnd`
- `long fsizeLast`
- `long timeStart`
- `long duration`
- `int nTrans`


## Methods

<a id="s-getCompactionFile"></a>
### getCompactionFile()

```java
public com.tailf.notif.CompactionNotification.CompactionFile getCompactionFile()
```

Types: [CompactionFile](CompactionNotification/CompactionFile.md#s-CompactionFile)

Indicates which datastore was compacted.

<a id="s-getCompactionType"></a>
### getCompactionType()

```java
public com.tailf.notif.CompactionNotification.CompactionType getCompactionType()
```

Types: [CompactionType](CompactionNotification/CompactionType.md#s-CompactionType)

Indicates whether the compaction was triggered manually or automatically
 by the system.

<a id="s-getDuration"></a>
### getDuration()

```java
public long getDuration()
```

Duration of compaction in microseconds.

<a id="s-getFsizeEnd"></a>
### getFsizeEnd()

```java
public long getFsizeEnd()
```

The size (bytes) of the datastore at the end of the compaction.

<a id="s-getFsizeLast"></a>
### getFsizeLast()

```java
public long getFsizeLast()
```

The size (bytes) of the datastore at the end of the previous compaction.

<a id="s-getFsizeStart"></a>
### getFsizeStart()

```java
public long getFsizeStart()
```

The size (bytes) of the datastore at the beginning of the compaction.

<a id="s-getNTrans"></a>
### getNTrans()

```java
public int getNTrans()
```

Number of transactions since the previous compaction.

<a id="s-getTimeStart"></a>
### getTimeStart()

```java
public long getTimeStart()
```

Epoch timestamp of when the transaction started, given in microseconds.

<a id="s-toString"></a>
### toString()

```java
public String toString()
```


## Nested Types

- [CompactionFile](CompactionNotification/CompactionFile.md)
- [CompactionType](CompactionNotification/CompactionType.md)
