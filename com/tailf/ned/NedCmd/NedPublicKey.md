# NedPublicKey <a href="#cls-NedPublicKey" id="cls-NedPublicKey"></a>

```java
public class com.tailf.ned.NedCmd.NedPublicKey
    implements ch.ethz.ssh2.auth.AgentIdentity
```

## Members

**Constructors**:

- [NedPublicKey(String, byte[])](#m-NedPublicKey-dd44fd2a5eb2)
- [NedPublicKey(String, byte[], int)](#m-NedPublicKey-80765b3cc40a)

**Methods**:

- [getAlgName()](#m-getAlgName-d8714870a2c4)
- [getIdentity(NedWorker)](#m-getIdentity-807a09f805c8)
- [getPublicKeyBlob()](#m-getPublicKeyBlob-7fccff30ba83)
- [sign(byte[])](#m-sign-24112ece4f25)

## Constructors

### NedPublicKey(String, byte[]) <a href="#m-NedPublicKey-dd44fd2a5eb2" id="m-NedPublicKey-dd44fd2a5eb2"></a>

```java
protected NedPublicKey(String algorithm, byte[] blob)
```

**Parameters**

- `String algorithm`
- `byte[] blob`

### NedPublicKey(String, byte[], int) <a href="#m-NedPublicKey-80765b3cc40a" id="m-NedPublicKey-80765b3cc40a"></a>

```java
protected NedPublicKey(String algorithm, byte[] blob, int signIndex)
```

**Parameters**

- `String algorithm`
- `byte[] blob`
- `int signIndex`


## Methods

### getAlgName() <a href="#m-getAlgName-d8714870a2c4" id="m-getAlgName-d8714870a2c4"></a>

```java
public String getAlgName()
```

### getIdentity(NedWorker) <a href="#m-getIdentity-807a09f805c8" id="m-getIdentity-807a09f805c8"></a>

```java
protected ch.ethz.ssh2.auth.AgentIdentity getIdentity(com.tailf.ned.NedWorker worker)
```

Types: [NedWorker](../NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

### getPublicKeyBlob() <a href="#m-getPublicKeyBlob-7fccff30ba83" id="m-getPublicKeyBlob-7fccff30ba83"></a>

```java
public byte[] getPublicKeyBlob()
```

### sign(byte[]) <a href="#m-sign-24112ece4f25" id="m-sign-24112ece4f25"></a>

```java
public byte[] sign(byte[] data)
```

**Parameters**

- `byte[] data`
