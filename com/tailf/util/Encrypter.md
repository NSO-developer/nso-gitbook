# Encrypter <a href="#cls-Encrypter" id="cls-Encrypter"></a>

```java
public abstract class com.tailf.util.Encrypter
```

Base class for encryption algorithm utility classes

**Related classes**

- [AesEncrypter](AesEncrypter.md#cls-AesEncrypter)

## Members

**Constructors**:

- [Encrypter()](#m-Encrypter-3e84936d4906)

**Fields**:

- [dcipher](#m-dcipher)
- [ecipher](#m-ecipher)

**Methods**:

- [decrypt(byte[])](#m-decrypt-a219da65e4d1)
- [encrypt(String)](#m-encrypt-c3e82593a386)

## Constructors

### Encrypter() <a href="#m-Encrypter-3e84936d4906" id="m-Encrypter-3e84936d4906"></a>

```java
public Encrypter()
```


## Fields

### dcipher <a href="#m-dcipher" id="m-dcipher"></a>

```java
protected javax.crypto.Cipher dcipher = null;
```

### ecipher <a href="#m-ecipher" id="m-ecipher"></a>

```java
protected javax.crypto.Cipher ecipher = null;
```


## Methods

### decrypt(byte[]) <a href="#m-decrypt-a219da65e4d1" id="m-decrypt-a219da65e4d1"></a>

```java
public String decrypt(
    byte[] decodedString
)
    throws javax.crypto.BadPaddingException, javax.crypto.IllegalBlockSizeException, java.io.UnsupportedEncodingException, java.io.IOException
```

**Parameters**

- `byte[] decodedString`

### encrypt(String) <a href="#m-encrypt-c3e82593a386" id="m-encrypt-c3e82593a386"></a>

```java
public byte[] encrypt(
    String str
)
    throws javax.crypto.BadPaddingException, javax.crypto.IllegalBlockSizeException, java.io.UnsupportedEncodingException, java.io.IOException
```

**Parameters**

- `String str`
