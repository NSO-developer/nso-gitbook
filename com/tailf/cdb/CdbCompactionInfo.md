# CdbCompactionInfo <a href="#cdbcompactioninfo-5ec90640fdd8" id="cdbcompactioninfo-5ec90640fdd8"></a>

```java
public class com.tailf.cdb.CdbCompactionInfo
```

Represents the compaction info for CDB files.

## Members

**Constructors**:

- [CdbCompactionInfo\(long, long, long, long\)](#cdbcompactioninfo-9ab1e9946878)

**Methods**:

- [getFsizeCurrent\(\)](#getfsizecurrent-b51a1455aac4)
- [getFsizePrevious\(\)](#getfsizeprevious-9edb3359500d)
- [getLastTime\(\)](#getlasttime-8db6c59d0e86)
- [getNTrans\(\)](#getntrans-2cd88cc47142)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### CdbCompactionInfo(long, long, long, long) <a href="#cdbcompactioninfo-9ab1e9946878" id="cdbcompactioninfo-9ab1e9946878"></a>

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

### getFsizeCurrent() <a href="#getfsizecurrent-b51a1455aac4" id="getfsizecurrent-b51a1455aac4"></a>

```java
public long getFsizeCurrent()
```

Current CDB file size.

### getFsizePrevious() <a href="#getfsizeprevious-9edb3359500d" id="getfsizeprevious-9edb3359500d"></a>

```java
public long getFsizePrevious()
```

CDB file size at last compaction.

### getLastTime() <a href="#getlasttime-8db6c59d0e86" id="getlasttime-8db6c59d0e86"></a>

```java
public long getLastTime()
```

Time at last compaction.

### getNTrans() <a href="#getntrans-2cd88cc47142" id="getntrans-2cd88cc47142"></a>

```java
public long getNTrans()
```

Number of transactions since last compaction.

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
