<a id="cls-NedSSHAlgorithms"></a>
# NedSSHAlgorithms

```java
public class com.tailf.ned.NedCmd.NedSSHAlgorithms
```

## Members

**Constructors**:

- [NedSSHAlgorithms(List<String>, List<String>, List<String>, List<String>, List<String>, Long, Long, Long)](#m-nedsshalgorithms-bd7d94821172)

**Methods**:

- [getCipher()](#m-getcipher-d6df3bb3f677)
- [getCompression()](#m-getcompression-37ea68461bdc)
- [getDhGexLimitMax()](#m-getdhgexlimitmax-b4d0e88a3d9e)
- [getDhGexLimitMin()](#m-getdhgexlimitmin-99dbb3a6e7c8)
- [getDhGexLimitPreferred()](#m-getdhgexlimitpreferred-4e09d85b2065)
- [getKex()](#m-getkex-0fc5b93870ec)
- [getMac()](#m-getmac-9ae00b4c1217)
- [getPublicKey()](#m-getpublickey-d5ee7d6bb561)

## Constructors

<a id="m-nedsshalgorithms-bd7d94821172"></a>
### NedSSHAlgorithms(List<String>, List<String>, List<String>, List<String>, List<String>, Long, Long, Long)

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

<a id="m-getcipher-d6df3bb3f677"></a>
### getCipher()

```java
public java.util.List<String> getCipher()
```

<a id="m-getcompression-37ea68461bdc"></a>
### getCompression()

```java
public java.util.List<String> getCompression()
```

<a id="m-getdhgexlimitmax-b4d0e88a3d9e"></a>
### getDhGexLimitMax()

```java
public Long getDhGexLimitMax()
```

<a id="m-getdhgexlimitmin-99dbb3a6e7c8"></a>
### getDhGexLimitMin()

```java
public Long getDhGexLimitMin()
```

<a id="m-getdhgexlimitpreferred-4e09d85b2065"></a>
### getDhGexLimitPreferred()

```java
public Long getDhGexLimitPreferred()
```

<a id="m-getkex-0fc5b93870ec"></a>
### getKex()

```java
public java.util.List<String> getKex()
```

<a id="m-getmac-9ae00b4c1217"></a>
### getMac()

```java
public java.util.List<String> getMac()
```

<a id="m-getpublickey-d5ee7d6bb561"></a>
### getPublicKey()

```java
public java.util.List<String> getPublicKey()
```
