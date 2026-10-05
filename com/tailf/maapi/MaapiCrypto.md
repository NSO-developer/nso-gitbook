<a id="s-MaapiCrypto"></a>
# MaapiCrypto

```java
public class com.tailf.maapi.MaapiCrypto
```

Data encryption and decryption utility class.

 This class is instantiated using an existing [`Maapi`](Maapi.md#s-Maapi) object.

 Encrypted strings can then be decrypted via the
 `#decrypt(String)` method and encrypted via the
 [`MaapiCryptoType`](MaapiCryptoType.md#s-MaapiCryptoType) method.

## Members

**Constructors**:

- [MaapiCrypto(Maapi)](#s-MaapiCrypto-1)

**Fields**:

- [UNENCRYPTED_PREFIX](#s-UNENCRYPTED_PREFIX)

**Methods**:

- [decrypt(String)](#s-decrypt)
- [encrypt(MaapiCryptoType, String)](#s-encrypt)
- [getAes256Key()](#s-getAes256Key)
- [getAesIV()](#s-getAesIV)
- [getAesKey()](#s-getAesKey)
- [getDes3IV()](#s-getDes3IV)
- [getDes3Key()](#s-getDes3Key)

## Constructors

<a id="s-MaapiCrypto-1"></a>
### MaapiCrypto(Maapi)

```java
public MaapiCrypto(com.tailf.maapi.Maapi maapi) throws com.tailf.maapi.MaapiException
```

Types: [Maapi](Maapi.md#s-Maapi), [MaapiException](MaapiException.md#s-MaapiException)

**Parameters**

- `com.tailf.maapi.Maapi maapi`


## Fields

<a id="s-UNENCRYPTED_PREFIX"></a>
### UNENCRYPTED_PREFIX

```java
public static final String UNENCRYPTED_PREFIX = "$0$";
```


## Methods

<a id="s-decrypt"></a>
### decrypt(String)

```java
public String decrypt(String encrypted) throws com.tailf.maapi.MaapiException
```

Types: [MaapiException](MaapiException.md#s-MaapiException)

Decrypt an encrypted string.

**Parameters**

- `String encrypted` - The encrypted string to decrypt.

**Returns:** The plaintext value after decrypting the encrypted string.

**Throws**

- `MaapiException` - On errors decrypting the encrypted string.

<a id="s-encrypt"></a>
### encrypt(MaapiCryptoType, String)

```java
public String encrypt(
    com.tailf.maapi.MaapiCryptoType type,
    String plaintext
)
    throws com.tailf.maapi.MaapiException
```

Types: [MaapiCryptoType](MaapiCryptoType.md#s-MaapiCryptoType), [MaapiException](MaapiException.md#s-MaapiException)

Encrypt a plaintext string.

**Parameters**

- `com.tailf.maapi.MaapiCryptoType type`
- `String plaintext` - The plaintext to encrypt.

**Returns:** The encrypted value after encrypting the plaintext.

**Throws**

- `MaapiException` - On errors encrypting the plaintext.

<a id="s-getAes256Key"></a>
### getAes256Key()

```java
public byte[] getAes256Key()
```

<a id="s-getAesIV"></a>
### getAesIV()

```java
public byte[] getAesIV()
```

<a id="s-getAesKey"></a>
### getAesKey()

```java
public byte[] getAesKey()
```

<a id="s-getDes3IV"></a>
### getDes3IV()

```java
public byte[] getDes3IV()
```

<a id="s-getDes3Key"></a>
### getDes3Key()

```java
public byte[] getDes3Key()
```
