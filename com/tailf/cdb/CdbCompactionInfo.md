<a id="s-CdbCompactionInfo"></a>
# CdbCompactionInfo

```java
public class com.tailf.cdb.CdbCompactionInfo
```

Represents the compaction info for CDB files.

## Members

**Constructors**:

- [CdbCompactionInfo(long, long, long, long)](#s-CdbCompactionInfo-1)

**Methods**:

- [getFsizeCurrent()](#s-getFsizeCurrent)
- [getFsizePrevious()](#s-getFsizePrevious)
- [getLastTime()](#s-getLastTime)
- [getNTrans()](#s-getNTrans)
- [toString()](#s-toString)

## Constructors

<a id="s-CdbCompactionInfo-1"></a>
### CdbCompactionInfo(long, long, long, long)

**Package-private**

```java
CdbCompactionInfo(long fsizePrevious, long fsizeCurrent, long lastTime, long ntrans)
```

**Parameters**

- `long fsizePrevious`
- `long fsizeCurrent`
- `long lastTime`
- `long ntrans`


## Methods

<a id="s-getFsizeCurrent"></a>
### getFsizeCurrent()

```java
public long getFsizeCurrent()
```

Current CDB file size.

<a id="s-getFsizePrevious"></a>
### getFsizePrevious()

```java
public long getFsizePrevious()
```

CDB file size at last compaction.

<a id="s-getLastTime"></a>
### getLastTime()

```java
public long getLastTime()
```

Time at last compaction.

<a id="s-getNTrans"></a>
### getNTrans()

```java
public long getNTrans()
```

Number of transactions since last compaction.

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
