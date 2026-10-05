<a id="s-AesEncrypter"></a>
# AesEncrypter

```java
public class com.tailf.util.AesEncrypter
    extends com.tailf.util.Encrypter
```

Types: [Encrypter](Encrypter.md#s-Encrypter)

AES algorithm encryption/decryption utility class

## Members

**Constructors**:

- [AesEncrypter(byte[], byte[])](#s-AesEncrypter-1)

**Fields**:

- [dcipher](Encrypter.md#s-dcipher) from Encrypter
- [ecipher](Encrypter.md#s-ecipher) from Encrypter

**Methods**:

- [decrypt(byte[])](Encrypter.md#s-decrypt) from Encrypter
- [encrypt(String)](Encrypter.md#s-encrypt) from Encrypter

## Constructors

<a id="s-AesEncrypter-1"></a>
### AesEncrypter(byte[], byte[])

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
