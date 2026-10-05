<a id="s-NedPublicKey"></a>
# NedPublicKey

```java
public class com.tailf.ned.NedCmd.NedPublicKey
    implements ch.ethz.ssh2.auth.AgentIdentity
```

## Members

**Constructors**:

- [NedPublicKey(String, byte[])](#s-NedPublicKey-1)
- [NedPublicKey(String, byte[], int)](#s-NedPublicKey-2)

**Methods**:

- [getAlgName()](#s-getAlgName)
- [getIdentity(NedWorker)](#s-getIdentity)
- [getPublicKeyBlob()](#s-getPublicKeyBlob)
- [sign(byte[])](#s-sign)

## Constructors

<a id="s-NedPublicKey-1"></a>
### NedPublicKey(String, byte[])

```java
protected NedPublicKey(String algorithm, byte[] blob)
```

**Parameters**

- `String algorithm`
- `byte[] blob`

<a id="s-NedPublicKey-2"></a>
### NedPublicKey(String, byte[], int)

```java
protected NedPublicKey(String algorithm, byte[] blob, int signIndex)
```

**Parameters**

- `String algorithm`
- `byte[] blob`
- `int signIndex`


## Methods

<a id="s-getAlgName"></a>
### getAlgName()

```java
public String getAlgName()
```

<a id="s-getIdentity"></a>
### getIdentity(NedWorker)

```java
protected ch.ethz.ssh2.auth.AgentIdentity getIdentity(com.tailf.ned.NedWorker worker)
```

Types: [NedWorker](../NedWorker.md#s-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

<a id="s-getPublicKeyBlob"></a>
### getPublicKeyBlob()

```java
public byte[] getPublicKeyBlob()
```

<a id="s-sign"></a>
### sign(byte[])

```java
public byte[] sign(byte[] data)
```

**Parameters**

- `byte[] data`
