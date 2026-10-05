<a id="cls-CdbCompactionInfo"></a>
# CdbCompactionInfo

```java
public class com.tailf.cdb.CdbCompactionInfo
```

Represents the compaction info for CDB files.

## Members

**Constructors**:

- [CdbCompactionInfo(long, long, long, long)](#m-cdbcompactioninfo-9ab1e9946878)

**Methods**:

- [getFsizeCurrent()](#m-getfsizecurrent-b51a1455aac4)
- [getFsizePrevious()](#m-getfsizeprevious-9edb3359500d)
- [getLastTime()](#m-getlasttime-8db6c59d0e86)
- [getNTrans()](#m-getntrans-2cd88cc47142)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-cdbcompactioninfo-9ab1e9946878"></a>
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

<a id="m-getfsizecurrent-b51a1455aac4"></a>
### getFsizeCurrent()

```java
public long getFsizeCurrent()
```

Current CDB file size.

<a id="m-getfsizeprevious-9edb3359500d"></a>
### getFsizePrevious()

```java
public long getFsizePrevious()
```

CDB file size at last compaction.

<a id="m-getlasttime-8db6c59d0e86"></a>
### getLastTime()

```java
public long getLastTime()
```

Time at last compaction.

<a id="m-getntrans-2cd88cc47142"></a>
### getNTrans()

```java
public long getNTrans()
```

Number of transactions since last compaction.

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
