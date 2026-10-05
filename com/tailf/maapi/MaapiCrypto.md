# MaapiCrypto <a href="#cls-MaapiCrypto" id="cls-MaapiCrypto"></a>

```java
public class com.tailf.maapi.MaapiCrypto
```

Data encryption and decryption utility class.

 This class is instantiated using an existing [`Maapi`](Maapi.md#cls-Maapi) object.

 Encrypted strings can then be decrypted via the
 [`decrypt(String)`](MaapiCrypto.md#m-decrypt-fd5519daae0f) method and encrypted via the
 `encrypt(MaapiCryptoType, String)` method.

## Members

**Constructors**:

- [MaapiCrypto(Maapi)](#m-MaapiCrypto-6616b37056ed)

**Fields**:

- [UNENCRYPTED_PREFIX](#m-UNENCRYPTED_PREFIX)

**Methods**:

- [decrypt(String)](#m-decrypt-fd5519daae0f)
- [encrypt(MaapiCryptoType, String)](#m-encrypt-6816a2fdb1cd)
- [getAes256Key()](#m-getAes256Key-babe38ca13d3)
- [getAesIV()](#m-getAesIV-ff91605b3c80)
- [getAesKey()](#m-getAesKey-022277997637)
- [getDes3IV()](#m-getDes3IV-d27942e875ec)
- [getDes3Key()](#m-getDes3Key-5e1f0d13ea47)

## Constructors

### MaapiCrypto(Maapi) <a href="#m-MaapiCrypto-6616b37056ed" id="m-MaapiCrypto-6616b37056ed"></a>

```java
public MaapiCrypto(com.tailf.maapi.Maapi maapi) throws com.tailf.maapi.MaapiException
```

Types: [Maapi](Maapi.md#cls-Maapi), [MaapiException](MaapiException.md#cls-MaapiException)

**Parameters**

- `com.tailf.maapi.Maapi maapi`


## Fields

### UNENCRYPTED_PREFIX <a href="#m-UNENCRYPTED_PREFIX" id="m-UNENCRYPTED_PREFIX"></a>

```java
public static final String UNENCRYPTED_PREFIX = "$0$";
```


## Methods

### decrypt(String) <a href="#m-decrypt-fd5519daae0f" id="m-decrypt-fd5519daae0f"></a>

```java
public String decrypt(String encrypted) throws com.tailf.maapi.MaapiException
```

Types: [MaapiException](MaapiException.md#cls-MaapiException)

Decrypt an encrypted string.

**Parameters**

- `String encrypted` - The encrypted string to decrypt.

**Returns:** The plaintext value after decrypting the encrypted string.

**Throws**

- `MaapiException` - On errors decrypting the encrypted string.

### encrypt(MaapiCryptoType, String) <a href="#m-encrypt-6816a2fdb1cd" id="m-encrypt-6816a2fdb1cd"></a>

```java
public String encrypt(
    com.tailf.maapi.MaapiCryptoType type,
    String plaintext
)
    throws com.tailf.maapi.MaapiException
```

Types: [MaapiCryptoType](MaapiCryptoType.md#cls-MaapiCryptoType), [MaapiException](MaapiException.md#cls-MaapiException)

Encrypt a plaintext string.

**Parameters**

- `com.tailf.maapi.MaapiCryptoType type`
- `String plaintext` - The plaintext to encrypt.

**Returns:** The encrypted value after encrypting the plaintext.

**Throws**

- `MaapiException` - On errors encrypting the plaintext.

### getAes256Key() <a href="#m-getAes256Key-babe38ca13d3" id="m-getAes256Key-babe38ca13d3"></a>

```java
public byte[] getAes256Key()
```

### getAesIV() <a href="#m-getAesIV-ff91605b3c80" id="m-getAesIV-ff91605b3c80"></a>

```java
public byte[] getAesIV()
```

### getAesKey() <a href="#m-getAesKey-022277997637" id="m-getAesKey-022277997637"></a>

```java
public byte[] getAesKey()
```

### getDes3IV() <a href="#m-getDes3IV-d27942e875ec" id="m-getDes3IV-d27942e875ec"></a>

```java
public byte[] getDes3IV()
```

### getDes3Key() <a href="#m-getDes3Key-5e1f0d13ea47" id="m-getDes3Key-5e1f0d13ea47"></a>

```java
public byte[] getDes3Key()
```
