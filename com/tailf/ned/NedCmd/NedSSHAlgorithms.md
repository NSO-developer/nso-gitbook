# NedSSHAlgorithms <a href="#cls-NedSSHAlgorithms" id="cls-NedSSHAlgorithms"></a>

```java
public class com.tailf.ned.NedCmd.NedSSHAlgorithms
```

## Members

**Constructors**:

- [NedSSHAlgorithms(List<String>, List<String>, List<String>, List<String>, List<String>, Long, Long, Long)](#m-NedSSHAlgorithms-bd7d94821172)

**Methods**:

- [getCipher()](#m-getCipher-d6df3bb3f677)
- [getCompression()](#m-getCompression-37ea68461bdc)
- [getDhGexLimitMax()](#m-getDhGexLimitMax-b4d0e88a3d9e)
- [getDhGexLimitMin()](#m-getDhGexLimitMin-99dbb3a6e7c8)
- [getDhGexLimitPreferred()](#m-getDhGexLimitPreferred-4e09d85b2065)
- [getKex()](#m-getKex-0fc5b93870ec)
- [getMac()](#m-getMac-9ae00b4c1217)
- [getPublicKey()](#m-getPublicKey-d5ee7d6bb561)

## Constructors

### NedSSHAlgorithms(List<String>, List<String>, List<String>, List<String>, List<String>, Long, Long, Long) <a href="#m-NedSSHAlgorithms-bd7d94821172" id="m-NedSSHAlgorithms-bd7d94821172"></a>

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

### getCipher() <a href="#m-getCipher-d6df3bb3f677" id="m-getCipher-d6df3bb3f677"></a>

```java
public java.util.List<String> getCipher()
```

### getCompression() <a href="#m-getCompression-37ea68461bdc" id="m-getCompression-37ea68461bdc"></a>

```java
public java.util.List<String> getCompression()
```

### getDhGexLimitMax() <a href="#m-getDhGexLimitMax-b4d0e88a3d9e" id="m-getDhGexLimitMax-b4d0e88a3d9e"></a>

```java
public Long getDhGexLimitMax()
```

### getDhGexLimitMin() <a href="#m-getDhGexLimitMin-99dbb3a6e7c8" id="m-getDhGexLimitMin-99dbb3a6e7c8"></a>

```java
public Long getDhGexLimitMin()
```

### getDhGexLimitPreferred() <a href="#m-getDhGexLimitPreferred-4e09d85b2065" id="m-getDhGexLimitPreferred-4e09d85b2065"></a>

```java
public Long getDhGexLimitPreferred()
```

### getKex() <a href="#m-getKex-0fc5b93870ec" id="m-getKex-0fc5b93870ec"></a>

```java
public java.util.List<String> getKex()
```

### getMac() <a href="#m-getMac-9ae00b4c1217" id="m-getMac-9ae00b4c1217"></a>

```java
public java.util.List<String> getMac()
```

### getPublicKey() <a href="#m-getPublicKey-d5ee7d6bb561" id="m-getPublicKey-d5ee7d6bb561"></a>

```java
public java.util.List<String> getPublicKey()
```
