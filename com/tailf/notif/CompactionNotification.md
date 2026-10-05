# CompactionNotification <a href="#compactionnotification-401ddf1907af" id="compactionnotification-401ddf1907af"></a>

```java
public class com.tailf.notif.CompactionNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#notification-b2e7d82d4215)

Data structure for compaction notifications.

## Members

**Constructors**:

- [CompactionNotification(int, int, long, long, long, long, long, int)](#compactionnotification-0c17dc576da7)

**Fields**:

- [type](Notification.md#type-6ebb3673fbb6) from Notification

**Methods**:

- [getCompactionFile()](#getcompactionfile-3eb01a1683fd)
- [getCompactionType()](#getcompactiontype-3be15f6ef3fb)
- [getDuration()](#getduration-aee615ea7fe2)
- [getFsizeEnd()](#getfsizeend-057a34fa16b7)
- [getFsizeLast()](#getfsizelast-bf24c434e64a)
- [getFsizeStart()](#getfsizestart-8f3bfb841399)
- [getNotificationType()](Notification.md#getnotificationtype-f0e32b7b644f) from Notification
- [getNTrans()](#getntrans-2cd88cc47142)
- [getTimeStart()](#gettimestart-524baafff753)
- [toString()](#tostring-e9d48c5503ef)

**Nested Types**:

- [CompactionFile](CompactionNotification/CompactionFile.md#compactionfile-19e286d90f5f)
- [CompactionType](CompactionNotification/CompactionType.md#compactiontype-0d05e41610fa)

## Constructors

### CompactionNotification(int, int, long, long, long, long, long, int) <a href="#compactionnotification-0c17dc576da7" id="compactionnotification-0c17dc576da7"></a>

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

### getCompactionFile() <a href="#getcompactionfile-3eb01a1683fd" id="getcompactionfile-3eb01a1683fd"></a>

```java
public com.tailf.notif.CompactionNotification.CompactionFile getCompactionFile()
```

Types: [CompactionFile](CompactionNotification/CompactionFile.md#compactionfile-19e286d90f5f)

Indicates which datastore was compacted.

### getCompactionType() <a href="#getcompactiontype-3be15f6ef3fb" id="getcompactiontype-3be15f6ef3fb"></a>

```java
public com.tailf.notif.CompactionNotification.CompactionType getCompactionType()
```

Types: [CompactionType](CompactionNotification/CompactionType.md#compactiontype-0d05e41610fa)

Indicates whether the compaction was triggered manually or automatically
 by the system.

### getDuration() <a href="#getduration-aee615ea7fe2" id="getduration-aee615ea7fe2"></a>

```java
public long getDuration()
```

Duration of compaction in microseconds.

### getFsizeEnd() <a href="#getfsizeend-057a34fa16b7" id="getfsizeend-057a34fa16b7"></a>

```java
public long getFsizeEnd()
```

The size (bytes) of the datastore at the end of the compaction.

### getFsizeLast() <a href="#getfsizelast-bf24c434e64a" id="getfsizelast-bf24c434e64a"></a>

```java
public long getFsizeLast()
```

The size (bytes) of the datastore at the end of the previous compaction.

### getFsizeStart() <a href="#getfsizestart-8f3bfb841399" id="getfsizestart-8f3bfb841399"></a>

```java
public long getFsizeStart()
```

The size (bytes) of the datastore at the beginning of the compaction.

### getNTrans() <a href="#getntrans-2cd88cc47142" id="getntrans-2cd88cc47142"></a>

```java
public int getNTrans()
```

Number of transactions since the previous compaction.

### getTimeStart() <a href="#gettimestart-524baafff753" id="gettimestart-524baafff753"></a>

```java
public long getTimeStart()
```

Epoch timestamp of when the transaction started, given in microseconds.

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```


## Nested Types

- [CompactionFile](CompactionNotification/CompactionFile.md#compactionfile-19e286d90f5f)
- [CompactionType](CompactionNotification/CompactionType.md#compactiontype-0d05e41610fa)
