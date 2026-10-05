# NedPublicKey <a href="#nedpublickey-99f8875cf44d" id="nedpublickey-99f8875cf44d"></a>

```java
public class com.tailf.ned.NedCmd.NedPublicKey
    implements ch.ethz.ssh2.auth.AgentIdentity
```

## Members

**Constructors**:

- [NedPublicKey\(String, byte\[\]\)](#nedpublickey-dd44fd2a5eb2)
- [NedPublicKey\(String, byte\[\], int\)](#nedpublickey-80765b3cc40a)

**Methods**:

- [getAlgName\(\)](#getalgname-d8714870a2c4)
- [getIdentity\(NedWorker\)](#getidentity-807a09f805c8)
- [getPublicKeyBlob\(\)](#getpublickeyblob-7fccff30ba83)
- [sign\(byte\[\]\)](#sign-24112ece4f25)

## Constructors

### NedPublicKey(String, byte[]) <a href="#nedpublickey-dd44fd2a5eb2" id="nedpublickey-dd44fd2a5eb2"></a>

```java
protected NedPublicKey(String algorithm, byte[] blob)
```

**Parameters**

- `String algorithm`
- `byte[] blob`

### NedPublicKey(String, byte[], int) <a href="#nedpublickey-80765b3cc40a" id="nedpublickey-80765b3cc40a"></a>

```java
protected NedPublicKey(String algorithm, byte[] blob, int signIndex)
```

**Parameters**

- `String algorithm`
- `byte[] blob`
- `int signIndex`


## Methods

### getAlgName() <a href="#getalgname-d8714870a2c4" id="getalgname-d8714870a2c4"></a>

```java
public String getAlgName()
```

### getIdentity(NedWorker) <a href="#getidentity-807a09f805c8" id="getidentity-807a09f805c8"></a>

```java
protected ch.ethz.ssh2.auth.AgentIdentity getIdentity(com.tailf.ned.NedWorker worker)
```

Types: [NedWorker](../NedWorker.md#nedworker-b063de7c0998)

**Parameters**

- `com.tailf.ned.NedWorker worker`

### getPublicKeyBlob() <a href="#getpublickeyblob-7fccff30ba83" id="getpublickeyblob-7fccff30ba83"></a>

```java
public byte[] getPublicKeyBlob()
```

### sign(byte[]) <a href="#sign-24112ece4f25" id="sign-24112ece4f25"></a>

```java
public byte[] sign(byte[] data)
```

**Parameters**

- `byte[] data`
