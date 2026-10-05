# CompactionNotification <a href="#cls-CompactionNotification" id="cls-CompactionNotification"></a>

```java
public class com.tailf.notif.CompactionNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for compaction notifications.

## Members

**Constructors**:

- [CompactionNotification(int, int, long, long, long, long, long, int)](#m-CompactionNotification-0c17dc576da7)

**Fields**:

- [type](Notification.md#m-type) from Notification

**Methods**:

- [getCompactionFile()](#m-getCompactionFile-3eb01a1683fd)
- [getCompactionType()](#m-getCompactionType-3be15f6ef3fb)
- [getDuration()](#m-getDuration-aee615ea7fe2)
- [getFsizeEnd()](#m-getFsizeEnd-057a34fa16b7)
- [getFsizeLast()](#m-getFsizeLast-bf24c434e64a)
- [getFsizeStart()](#m-getFsizeStart-8f3bfb841399)
- [getNotificationType()](Notification.md#m-getNotificationType-f0e32b7b644f) from Notification
- [getNTrans()](#m-getNTrans-2cd88cc47142)
- [getTimeStart()](#m-getTimeStart-524baafff753)
- [toString()](#m-toString-e9d48c5503ef)

**Nested Types**:

- [CompactionFile](CompactionNotification/CompactionFile.md#cls-CompactionFile)
- [CompactionType](CompactionNotification/CompactionType.md#cls-CompactionType)

## Constructors

### CompactionNotification(int, int, long, long, long, long, long, int) <a href="#m-CompactionNotification-0c17dc576da7" id="m-CompactionNotification-0c17dc576da7"></a>

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

### getCompactionFile() <a href="#m-getCompactionFile-3eb01a1683fd" id="m-getCompactionFile-3eb01a1683fd"></a>

```java
public com.tailf.notif.CompactionNotification.CompactionFile getCompactionFile()
```

Types: [CompactionFile](CompactionNotification/CompactionFile.md#cls-CompactionFile)

Indicates which datastore was compacted.

### getCompactionType() <a href="#m-getCompactionType-3be15f6ef3fb" id="m-getCompactionType-3be15f6ef3fb"></a>

```java
public com.tailf.notif.CompactionNotification.CompactionType getCompactionType()
```

Types: [CompactionType](CompactionNotification/CompactionType.md#cls-CompactionType)

Indicates whether the compaction was triggered manually or automatically
 by the system.

### getDuration() <a href="#m-getDuration-aee615ea7fe2" id="m-getDuration-aee615ea7fe2"></a>

```java
public long getDuration()
```

Duration of compaction in microseconds.

### getFsizeEnd() <a href="#m-getFsizeEnd-057a34fa16b7" id="m-getFsizeEnd-057a34fa16b7"></a>

```java
public long getFsizeEnd()
```

The size (bytes) of the datastore at the end of the compaction.

### getFsizeLast() <a href="#m-getFsizeLast-bf24c434e64a" id="m-getFsizeLast-bf24c434e64a"></a>

```java
public long getFsizeLast()
```

The size (bytes) of the datastore at the end of the previous compaction.

### getFsizeStart() <a href="#m-getFsizeStart-8f3bfb841399" id="m-getFsizeStart-8f3bfb841399"></a>

```java
public long getFsizeStart()
```

The size (bytes) of the datastore at the beginning of the compaction.

### getNTrans() <a href="#m-getNTrans-2cd88cc47142" id="m-getNTrans-2cd88cc47142"></a>

```java
public int getNTrans()
```

Number of transactions since the previous compaction.

### getTimeStart() <a href="#m-getTimeStart-524baafff753" id="m-getTimeStart-524baafff753"></a>

```java
public long getTimeStart()
```

Epoch timestamp of when the transaction started, given in microseconds.

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```


## Nested Types

- [CompactionFile](CompactionNotification/CompactionFile.md#cls-CompactionFile)
- [CompactionType](CompactionNotification/CompactionType.md#cls-CompactionType)
