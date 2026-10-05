<a id="s-Encrypter"></a>
# Encrypter

```java
public abstract class com.tailf.util.Encrypter
```

Base class for encryption algorithm utility classes

**Related classes**

- [AesEncrypter](AesEncrypter.md#s-AesEncrypter)

## Members

**Constructors**:

- [Encrypter()](#s-Encrypter-1)

**Fields**:

- [dcipher](#s-dcipher)
- [ecipher](#s-ecipher)

**Methods**:

- [decrypt(byte[])](#s-decrypt)
- [encrypt(String)](#s-encrypt)

## Constructors

<a id="s-Encrypter-1"></a>
### Encrypter()

```java
public Encrypter()
```


## Fields

<a id="s-dcipher"></a>
### dcipher

```java
protected javax.crypto.Cipher dcipher = null;
```

<a id="s-ecipher"></a>
### ecipher

```java
protected javax.crypto.Cipher ecipher = null;
```


## Methods

<a id="s-decrypt"></a>
### decrypt(byte[])

```java
public String decrypt(
    byte[] decodedString
)
    throws javax.crypto.BadPaddingException, javax.crypto.IllegalBlockSizeException, java.io.UnsupportedEncodingException, java.io.IOException
```

**Parameters**

- `byte[] decodedString`

<a id="s-encrypt"></a>
### encrypt(String)

```java
public byte[] encrypt(
    String str
)
    throws javax.crypto.BadPaddingException, javax.crypto.IllegalBlockSizeException, java.io.UnsupportedEncodingException, java.io.IOException
```

**Parameters**

- `String str`
