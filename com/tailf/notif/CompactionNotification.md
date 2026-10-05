<a id="cls-CompactionNotification"></a>
# CompactionNotification

```java
public class com.tailf.notif.CompactionNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for compaction notifications.

## Members

**Constructors**:

- [CompactionNotification(int, int, long, long, long, long, long, int)](#m-compactionnotification-0c17dc576da7)

**Fields**:

- [type](Notification.md#m-type) from Notification

**Methods**:

- [getCompactionFile()](#m-getcompactionfile-3eb01a1683fd)
- [getCompactionType()](#m-getcompactiontype-3be15f6ef3fb)
- [getDuration()](#m-getduration-aee615ea7fe2)
- [getFsizeEnd()](#m-getfsizeend-057a34fa16b7)
- [getFsizeLast()](#m-getfsizelast-bf24c434e64a)
- [getFsizeStart()](#m-getfsizestart-8f3bfb841399)
- [getNotificationType()](Notification.md#m-getnotificationtype-f0e32b7b644f) from Notification
- [getNTrans()](#m-getntrans-2cd88cc47142)
- [getTimeStart()](#m-gettimestart-524baafff753)
- [toString()](#m-tostring-e9d48c5503ef)

**Nested Types**:

- [CompactionFile](CompactionNotification/CompactionFile.md#cls-CompactionFile)
- [CompactionType](CompactionNotification/CompactionType.md#cls-CompactionType)

## Constructors

<a id="m-compactionnotification-0c17dc576da7"></a>
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

<a id="m-getcompactionfile-3eb01a1683fd"></a>
### getCompactionFile()

```java
public com.tailf.notif.CompactionNotification.CompactionFile getCompactionFile()
```

Types: [CompactionFile](CompactionNotification/CompactionFile.md#cls-CompactionFile)

Indicates which datastore was compacted.

<a id="m-getcompactiontype-3be15f6ef3fb"></a>
### getCompactionType()

```java
public com.tailf.notif.CompactionNotification.CompactionType getCompactionType()
```

Types: [CompactionType](CompactionNotification/CompactionType.md#cls-CompactionType)

Indicates whether the compaction was triggered manually or automatically
 by the system.

<a id="m-getduration-aee615ea7fe2"></a>
### getDuration()

```java
public long getDuration()
```

Duration of compaction in microseconds.

<a id="m-getfsizeend-057a34fa16b7"></a>
### getFsizeEnd()

```java
public long getFsizeEnd()
```

The size (bytes) of the datastore at the end of the compaction.

<a id="m-getfsizelast-bf24c434e64a"></a>
### getFsizeLast()

```java
public long getFsizeLast()
```

The size (bytes) of the datastore at the end of the previous compaction.

<a id="m-getfsizestart-8f3bfb841399"></a>
### getFsizeStart()

```java
public long getFsizeStart()
```

The size (bytes) of the datastore at the beginning of the compaction.

<a id="m-getntrans-2cd88cc47142"></a>
### getNTrans()

```java
public int getNTrans()
```

Number of transactions since the previous compaction.

<a id="m-gettimestart-524baafff753"></a>
### getTimeStart()

```java
public long getTimeStart()
```

Epoch timestamp of when the transaction started, given in microseconds.

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```


## Nested Types

- [CompactionFile](CompactionNotification/CompactionFile.md#cls-CompactionFile)
- [CompactionType](CompactionNotification/CompactionType.md#cls-CompactionType)
