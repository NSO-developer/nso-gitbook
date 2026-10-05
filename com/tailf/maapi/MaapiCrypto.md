<a id="cls-MaapiCrypto"></a>
# MaapiCrypto

```java
public class com.tailf.maapi.MaapiCrypto
```

Data encryption and decryption utility class.

 This class is instantiated using an existing [`Maapi`](Maapi.md#cls-Maapi) object.

 Encrypted strings can then be decrypted via the
 `#decrypt(String)` method and encrypted via the
 `MaapiCryptoType#encrypt(MaapiCryptoType, String)` method.

## Members

**Constructors**:

- [MaapiCrypto(Maapi)](#m-maapicrypto-6616b37056ed)

**Fields**:

- [UNENCRYPTED_PREFIX](#m-UNENCRYPTED_PREFIX)

**Methods**:

- [decrypt(String)](#m-decrypt-fd5519daae0f)
- [encrypt(MaapiCryptoType, String)](#m-encrypt-6816a2fdb1cd)
- [getAes256Key()](#m-getaes256key-babe38ca13d3)
- [getAesIV()](#m-getaesiv-ff91605b3c80)
- [getAesKey()](#m-getaeskey-022277997637)
- [getDes3IV()](#m-getdes3iv-d27942e875ec)
- [getDes3Key()](#m-getdes3key-5e1f0d13ea47)

## Constructors

<a id="m-maapicrypto-6616b37056ed"></a>
### MaapiCrypto(Maapi)

```java
public MaapiCrypto(com.tailf.maapi.Maapi maapi) throws com.tailf.maapi.MaapiException
```

Types: [Maapi](Maapi.md#cls-Maapi), [MaapiException](MaapiException.md#cls-MaapiException)

**Parameters**

- `com.tailf.maapi.Maapi maapi`


## Fields

<a id="m-UNENCRYPTED_PREFIX"></a>
### UNENCRYPTED_PREFIX

```java
public static final String UNENCRYPTED_PREFIX = "$0$";
```


## Methods

<a id="m-decrypt-fd5519daae0f"></a>
### decrypt(String)

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

<a id="m-encrypt-6816a2fdb1cd"></a>
### encrypt(MaapiCryptoType, String)

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

<a id="m-getaes256key-babe38ca13d3"></a>
### getAes256Key()

```java
public byte[] getAes256Key()
```

<a id="m-getaesiv-ff91605b3c80"></a>
### getAesIV()

```java
public byte[] getAesIV()
```

<a id="m-getaeskey-022277997637"></a>
### getAesKey()

```java
public byte[] getAesKey()
```

<a id="m-getdes3iv-d27942e875ec"></a>
### getDes3IV()

```java
public byte[] getDes3IV()
```

<a id="m-getdes3key-5e1f0d13ea47"></a>
### getDes3Key()

```java
public byte[] getDes3Key()
```
