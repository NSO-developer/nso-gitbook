# CdbCompactionInfo <a href="#cls-CdbCompactionInfo" id="cls-CdbCompactionInfo"></a>

```java
public class com.tailf.cdb.CdbCompactionInfo
```

Represents the compaction info for CDB files.

## Members

**Constructors**:

- [CdbCompactionInfo(long, long, long, long)](#m-CdbCompactionInfo-9ab1e9946878)

**Methods**:

- [getFsizeCurrent()](#m-getFsizeCurrent-b51a1455aac4)
- [getFsizePrevious()](#m-getFsizePrevious-9edb3359500d)
- [getLastTime()](#m-getLastTime-8db6c59d0e86)
- [getNTrans()](#m-getNTrans-2cd88cc47142)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### CdbCompactionInfo(long, long, long, long) <a href="#m-CdbCompactionInfo-9ab1e9946878" id="m-CdbCompactionInfo-9ab1e9946878"></a>

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

### getFsizeCurrent() <a href="#m-getFsizeCurrent-b51a1455aac4" id="m-getFsizeCurrent-b51a1455aac4"></a>

```java
public long getFsizeCurrent()
```

Current CDB file size.

### getFsizePrevious() <a href="#m-getFsizePrevious-9edb3359500d" id="m-getFsizePrevious-9edb3359500d"></a>

```java
public long getFsizePrevious()
```

CDB file size at last compaction.

### getLastTime() <a href="#m-getLastTime-8db6c59d0e86" id="m-getLastTime-8db6c59d0e86"></a>

```java
public long getLastTime()
```

Time at last compaction.

### getNTrans() <a href="#m-getNTrans-2cd88cc47142" id="m-getNTrans-2cd88cc47142"></a>

```java
public long getNTrans()
```

Number of transactions since last compaction.

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
