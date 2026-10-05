<a id="cls-NedPublicKey"></a>
# NedPublicKey

```java
public class com.tailf.ned.NedCmd.NedPublicKey
    implements ch.ethz.ssh2.auth.AgentIdentity
```

## Members

**Constructors**:

- [NedPublicKey(String, byte[])](#m-nedpublickey-dd44fd2a5eb2)
- [NedPublicKey(String, byte[], int)](#m-nedpublickey-80765b3cc40a)

**Methods**:

- [getAlgName()](#m-getalgname-d8714870a2c4)
- [getIdentity(NedWorker)](#m-getidentity-807a09f805c8)
- [getPublicKeyBlob()](#m-getpublickeyblob-7fccff30ba83)
- [sign(byte[])](#m-sign-24112ece4f25)

## Constructors

<a id="m-nedpublickey-dd44fd2a5eb2"></a>
### NedPublicKey(String, byte[])

```java
protected NedPublicKey(String algorithm, byte[] blob)
```

**Parameters**

- `String algorithm`
- `byte[] blob`

<a id="m-nedpublickey-80765b3cc40a"></a>
### NedPublicKey(String, byte[], int)

```java
protected NedPublicKey(String algorithm, byte[] blob, int signIndex)
```

**Parameters**

- `String algorithm`
- `byte[] blob`
- `int signIndex`


## Methods

<a id="m-getalgname-d8714870a2c4"></a>
### getAlgName()

```java
public String getAlgName()
```

<a id="m-getidentity-807a09f805c8"></a>
### getIdentity(NedWorker)

```java
protected ch.ethz.ssh2.auth.AgentIdentity getIdentity(com.tailf.ned.NedWorker worker)
```

Types: [NedWorker](../NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

<a id="m-getpublickeyblob-7fccff30ba83"></a>
### getPublicKeyBlob()

```java
public byte[] getPublicKeyBlob()
```

<a id="m-sign-24112ece4f25"></a>
### sign(byte[])

```java
public byte[] sign(byte[] data)
```

**Parameters**

- `byte[] data`
