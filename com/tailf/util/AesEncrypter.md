# AesEncrypter <a href="#cls-AesEncrypter" id="cls-AesEncrypter"></a>

```java
public class com.tailf.util.AesEncrypter
    extends com.tailf.util.Encrypter
```

Types: [Encrypter](Encrypter.md#cls-Encrypter)

AES algorithm encryption/decryption utility class

## Members

**Constructors**:

- [AesEncrypter(byte[], byte[])](#m-AesEncrypter-067df4aa23b0)

**Fields**:

- [dcipher](Encrypter.md#m-dcipher) from Encrypter
- [ecipher](Encrypter.md#m-ecipher) from Encrypter

**Methods**:

- [decrypt(byte[])](Encrypter.md#m-decrypt-a219da65e4d1) from Encrypter
- [encrypt(String)](Encrypter.md#m-encrypt-c3e82593a386) from Encrypter

## Constructors

### AesEncrypter(byte[], byte[]) <a href="#m-AesEncrypter-067df4aa23b0" id="m-AesEncrypter-067df4aa23b0"></a>

```java
public AesEncrypter(
    byte[] keybytes,
    byte[] ivBytes
)
    throws javax.crypto.NoSuchPaddingException, java.security.NoSuchAlgorithmException, java.security.InvalidKeyException
```

**Parameters**

- `byte[] keybytes`
- `byte[] ivBytes`
