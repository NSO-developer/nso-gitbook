# NedPublicKey <a href="#nedpublickey-99f8875cf44d" id="nedpublickey-99f8875cf44d"></a>

```java
public class com.tailf.ned.NedCmd.NedPublicKey
    implements ch.ethz.ssh2.auth.AgentIdentity
```

## Members

**Methods**:

- [getAlgName\(\)](#getalgname-d8714870a2c4)
- [getPublicKeyBlob\(\)](#getpublickeyblob-7fccff30ba83)
- [sign\(byte\[\]\)](#sign-24112ece4f25)

## Methods

### getAlgName() <a href="#getalgname-d8714870a2c4" id="getalgname-d8714870a2c4"></a>

```java
public String getAlgName()
```

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
