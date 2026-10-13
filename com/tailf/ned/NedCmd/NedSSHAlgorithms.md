# NedSSHAlgorithms <a href="#nedsshalgorithms-7bd74eef0d12" id="nedsshalgorithms-7bd74eef0d12"></a>

```java
public class com.tailf.ned.NedCmd.NedSSHAlgorithms
```

## Members

**Constructors**:

- [NedSSHAlgorithms\(List\<String\>, List\<String\>, List\<String\>, List\<String\>, List\<String\>, Long, Long, Long\)](#nedsshalgorithms-bd7d94821172)

**Methods**:

- [getCipher\(\)](#getcipher-d6df3bb3f677)
- [getCompression\(\)](#getcompression-37ea68461bdc)
- [getDhGexLimitMax\(\)](#getdhgexlimitmax-b4d0e88a3d9e)
- [getDhGexLimitMin\(\)](#getdhgexlimitmin-99dbb3a6e7c8)
- [getDhGexLimitPreferred\(\)](#getdhgexlimitpreferred-4e09d85b2065)
- [getKex\(\)](#getkex-0fc5b93870ec)
- [getMac\(\)](#getmac-9ae00b4c1217)
- [getPublicKey\(\)](#getpublickey-d5ee7d6bb561)

## Constructors

### NedSSHAlgorithms(List&lt;String&gt;, List&lt;String&gt;, List&lt;String&gt;, List&lt;String&gt;, List&lt;String&gt;, Long, Long, Long) <a href="#nedsshalgorithms-bd7d94821172" id="nedsshalgorithms-bd7d94821172"></a>

```java
protected NedSSHAlgorithms(
    java.util.List<String> publicKey,
    java.util.List<String> mac,
    java.util.List<String> cipher,
    java.util.List<String> kex,
    java.util.List<String> compression,
    Long dhGexLimitMin,
    Long dhGexLimitPreferred,
    Long dhGexLimitMax
)
```

**Parameters**

- `java.util.List<String> publicKey`
- `java.util.List<String> mac`
- `java.util.List<String> cipher`
- `java.util.List<String> kex`
- `java.util.List<String> compression`
- `Long dhGexLimitMin`
- `Long dhGexLimitPreferred`
- `Long dhGexLimitMax`


## Methods

### getCipher() <a href="#getcipher-d6df3bb3f677" id="getcipher-d6df3bb3f677"></a>

```java
public java.util.List<String> getCipher()
```

### getCompression() <a href="#getcompression-37ea68461bdc" id="getcompression-37ea68461bdc"></a>

```java
public java.util.List<String> getCompression()
```

### getDhGexLimitMax() <a href="#getdhgexlimitmax-b4d0e88a3d9e" id="getdhgexlimitmax-b4d0e88a3d9e"></a>

```java
public Long getDhGexLimitMax()
```

### getDhGexLimitMin() <a href="#getdhgexlimitmin-99dbb3a6e7c8" id="getdhgexlimitmin-99dbb3a6e7c8"></a>

```java
public Long getDhGexLimitMin()
```

### getDhGexLimitPreferred() <a href="#getdhgexlimitpreferred-4e09d85b2065" id="getdhgexlimitpreferred-4e09d85b2065"></a>

```java
public Long getDhGexLimitPreferred()
```

### getKex() <a href="#getkex-0fc5b93870ec" id="getkex-0fc5b93870ec"></a>

```java
public java.util.List<String> getKex()
```

### getMac() <a href="#getmac-9ae00b4c1217" id="getmac-9ae00b4c1217"></a>

```java
public java.util.List<String> getMac()
```

### getPublicKey() <a href="#getpublickey-d5ee7d6bb561" id="getpublickey-d5ee7d6bb561"></a>

```java
public java.util.List<String> getPublicKey()
```
