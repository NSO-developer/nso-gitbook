<a id="s-NedSSHAlgorithms"></a>
# NedSSHAlgorithms

```java
public class com.tailf.ned.NedCmd.NedSSHAlgorithms
```

## Members

**Constructors**:

- [NedSSHAlgorithms(List<String>, List<String>, List<String>, List<String>, List<String>, Long, Long, Long)](#s-NedSSHAlgorithms-1)

**Methods**:

- [getCipher()](#s-getCipher)
- [getCompression()](#s-getCompression)
- [getDhGexLimitMax()](#s-getDhGexLimitMax)
- [getDhGexLimitMin()](#s-getDhGexLimitMin)
- [getDhGexLimitPreferred()](#s-getDhGexLimitPreferred)
- [getKex()](#s-getKex)
- [getMac()](#s-getMac)
- [getPublicKey()](#s-getPublicKey)

## Constructors

<a id="s-NedSSHAlgorithms-1"></a>
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

<a id="s-getCipher"></a>
### getCipher()

```java
public java.util.List<String> getCipher()
```

<a id="s-getCompression"></a>
### getCompression()

```java
public java.util.List<String> getCompression()
```

<a id="s-getDhGexLimitMax"></a>
### getDhGexLimitMax()

```java
public Long getDhGexLimitMax()
```

<a id="s-getDhGexLimitMin"></a>
### getDhGexLimitMin()

```java
public Long getDhGexLimitMin()
```

<a id="s-getDhGexLimitPreferred"></a>
### getDhGexLimitPreferred()

```java
public Long getDhGexLimitPreferred()
```

<a id="s-getKex"></a>
### getKex()

```java
public java.util.List<String> getKex()
```

<a id="s-getMac"></a>
### getMac()

```java
public java.util.List<String> getMac()
```

<a id="s-getPublicKey"></a>
### getPublicKey()

```java
public java.util.List<String> getPublicKey()
```
