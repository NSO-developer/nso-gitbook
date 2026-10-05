# AesEncrypter <a href="#aesencrypter-f89e8185b3eb" id="aesencrypter-f89e8185b3eb"></a>

```java
public class com.tailf.util.AesEncrypter
    extends com.tailf.util.Encrypter
```

Types: [Encrypter](Encrypter.md#encrypter-bd2ad218de94)

AES algorithm encryption/decryption utility class

## Members

**Constructors**:

- [AesEncrypter(byte[], byte[])](#aesencrypter-067df4aa23b0)

**Fields**:

- [dcipher](Encrypter.md#dcipher-32e73ef98111) from Encrypter
- [ecipher](Encrypter.md#ecipher-7b70b741edb8) from Encrypter

**Methods**:

- [decrypt(byte[])](Encrypter.md#decrypt-a219da65e4d1) from Encrypter
- [encrypt(String)](Encrypter.md#encrypt-c3e82593a386) from Encrypter

## Constructors

### AesEncrypter(byte[], byte[]) <a href="#aesencrypter-067df4aa23b0" id="aesencrypter-067df4aa23b0"></a>

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
