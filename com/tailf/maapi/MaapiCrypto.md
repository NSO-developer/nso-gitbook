# MaapiCrypto <a href="#maapicrypto-2f94e265c842" id="maapicrypto-2f94e265c842"></a>

```java
public class com.tailf.maapi.MaapiCrypto
```

Data encryption and decryption utility class.

 This class is instantiated using an existing [`Maapi`](Maapi.md#maapi-67bcbe89c42e) object.

 Encrypted strings can then be decrypted via the
 [`decrypt(String)`](MaapiCrypto.md#decrypt-fd5519daae0f) method and encrypted via the
 `encrypt(MaapiCryptoType, String)` method.

## Members

**Constructors**:

- [MaapiCrypto\(Maapi\)](#maapicrypto-6616b37056ed)

**Fields**:

- [UNENCRYPTED\_PREFIX](#unencrypted_prefix-2442270a4956)

**Methods**:

- [decrypt\(String\)](#decrypt-fd5519daae0f)
- [encrypt\(MaapiCryptoType, String\)](#encrypt-6816a2fdb1cd)
- [getAes256Key\(\)](#getaes256key-babe38ca13d3)
- [getAesIV\(\)](#getaesiv-ff91605b3c80)
- [getAesKey\(\)](#getaeskey-022277997637)
- [getDes3IV\(\)](#getdes3iv-d27942e875ec)
- [getDes3Key\(\)](#getdes3key-5e1f0d13ea47)

## Constructors

### MaapiCrypto(Maapi) <a href="#maapicrypto-6616b37056ed" id="maapicrypto-6616b37056ed"></a>

```java
public MaapiCrypto(com.tailf.maapi.Maapi maapi) throws com.tailf.maapi.MaapiException
```

Types: [Maapi](Maapi.md#maapi-67bcbe89c42e), [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

**Parameters**

- `com.tailf.maapi.Maapi maapi`


## Fields

### UNENCRYPTED_PREFIX <a href="#unencrypted_prefix-2442270a4956" id="unencrypted_prefix-2442270a4956"></a>

```java
public static final String UNENCRYPTED_PREFIX = "$0$";
```


## Methods

### decrypt(String) <a href="#decrypt-fd5519daae0f" id="decrypt-fd5519daae0f"></a>

```java
public String decrypt(String encrypted) throws com.tailf.maapi.MaapiException
```

Types: [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

Decrypt an encrypted string.

**Parameters**

- `String encrypted` - The encrypted string to decrypt.

**Returns:** The plaintext value after decrypting the encrypted string.

**Throws**

- `MaapiException` - On errors decrypting the encrypted string.

### encrypt(MaapiCryptoType, String) <a href="#encrypt-6816a2fdb1cd" id="encrypt-6816a2fdb1cd"></a>

```java
public String encrypt(
    com.tailf.maapi.MaapiCryptoType type,
    String plaintext
)
    throws com.tailf.maapi.MaapiException
```

Types: [MaapiCryptoType](MaapiCryptoType.md#maapicryptotype-eed6b72aa0d2), [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

Encrypt a plaintext string.

**Parameters**

- `com.tailf.maapi.MaapiCryptoType type`
- `String plaintext` - The plaintext to encrypt.

**Returns:** The encrypted value after encrypting the plaintext.

**Throws**

- `MaapiException` - On errors encrypting the plaintext.

### getAes256Key() <a href="#getaes256key-babe38ca13d3" id="getaes256key-babe38ca13d3"></a>

```java
public byte[] getAes256Key()
```

### getAesIV() <a href="#getaesiv-ff91605b3c80" id="getaesiv-ff91605b3c80"></a>

```java
public byte[] getAesIV()
```

### getAesKey() <a href="#getaeskey-022277997637" id="getaeskey-022277997637"></a>

```java
public byte[] getAesKey()
```

### getDes3IV() <a href="#getdes3iv-d27942e875ec" id="getdes3iv-d27942e875ec"></a>

```java
public byte[] getDes3IV()
```

### getDes3Key() <a href="#getdes3key-5e1f0d13ea47" id="getdes3key-5e1f0d13ea47"></a>

```java
public byte[] getDes3Key()
```
