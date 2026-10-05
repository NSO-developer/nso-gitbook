<a id="cls-Encrypter"></a>
# Encrypter

```java
public abstract class com.tailf.util.Encrypter
```

Base class for encryption algorithm utility classes

**Related classes**

- [AesEncrypter](AesEncrypter.md#cls-AesEncrypter)

## Members

**Constructors**:

- [Encrypter()](#m-encrypter-3e84936d4906)

**Fields**:

- [dcipher](#m-dcipher)
- [ecipher](#m-ecipher)

**Methods**:

- [decrypt(byte[])](#m-decrypt-a219da65e4d1)
- [encrypt(String)](#m-encrypt-c3e82593a386)

## Constructors

<a id="m-encrypter-3e84936d4906"></a>
### Encrypter()

```java
public Encrypter()
```


## Fields

<a id="m-dcipher"></a>
### dcipher

```java
protected javax.crypto.Cipher dcipher = null;
```

<a id="m-ecipher"></a>
### ecipher

```java
protected javax.crypto.Cipher ecipher = null;
```


## Methods

<a id="m-decrypt-a219da65e4d1"></a>
### decrypt(byte[])

```java
public String decrypt(
    byte[] decodedString
)
    throws javax.crypto.BadPaddingException, javax.crypto.IllegalBlockSizeException, java.io.UnsupportedEncodingException, java.io.IOException
```

**Parameters**

- `byte[] decodedString`

<a id="m-encrypt-c3e82593a386"></a>
### encrypt(String)

```java
public byte[] encrypt(
    String str
)
    throws javax.crypto.BadPaddingException, javax.crypto.IllegalBlockSizeException, java.io.UnsupportedEncodingException, java.io.IOException
```

**Parameters**

- `String str`
