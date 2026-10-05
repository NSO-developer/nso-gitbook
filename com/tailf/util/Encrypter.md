# Encrypter <a href="#encrypter-bd2ad218de94" id="encrypter-bd2ad218de94"></a>

```java
public abstract class com.tailf.util.Encrypter
```

Base class for encryption algorithm utility classes

**Related classes**

- [AesEncrypter](AesEncrypter.md#aesencrypter-f89e8185b3eb)

## Members

**Constructors**:

- [Encrypter()](#encrypter-3e84936d4906)

**Fields**:

- [dcipher](#dcipher-32e73ef98111)
- [ecipher](#ecipher-7b70b741edb8)

**Methods**:

- [decrypt(byte[])](#decrypt-a219da65e4d1)
- [encrypt(String)](#encrypt-c3e82593a386)

## Constructors

### Encrypter() <a href="#encrypter-3e84936d4906" id="encrypter-3e84936d4906"></a>

```java
public Encrypter()
```


## Fields

### dcipher <a href="#dcipher-32e73ef98111" id="dcipher-32e73ef98111"></a>

```java
protected javax.crypto.Cipher dcipher = null;
```

### ecipher <a href="#ecipher-7b70b741edb8" id="ecipher-7b70b741edb8"></a>

```java
protected javax.crypto.Cipher ecipher = null;
```


## Methods

### decrypt(byte[]) <a href="#decrypt-a219da65e4d1" id="decrypt-a219da65e4d1"></a>

```java
public String decrypt(
    byte[] decodedString
)
    throws javax.crypto.BadPaddingException, javax.crypto.IllegalBlockSizeException, java.io.UnsupportedEncodingException, java.io.IOException
```

**Parameters**

- `byte[] decodedString`

### encrypt(String) <a href="#encrypt-c3e82593a386" id="encrypt-c3e82593a386"></a>

```java
public byte[] encrypt(
    String str
)
    throws javax.crypto.BadPaddingException, javax.crypto.IllegalBlockSizeException, java.io.UnsupportedEncodingException, java.io.IOException
```

**Parameters**

- `String str`
