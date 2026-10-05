<a id="s-MaapiCryptoType"></a>
# MaapiCryptoType

```java
public enum com.tailf.maapi.MaapiCryptoType
```

Types: [MaapiCryptoType](MaapiCryptoType.md#s-MaapiCryptoType)

Data encryption and decryption helper class for each supported
 encryption algorithm. Should be used through [`MaapiCrypto`](MaapiCrypto.md#s-MaapiCrypto).

**Related classes**

- [MaapiCryptoType](MaapiCryptoType.md#s-MaapiCryptoType)

## Members

**Enum Constants**:

- [AES128](#s-AES128)
- [AES256](#s-AES256)

**Methods**:

- [decrypt(byte[], String)](#s-decrypt)
- [decrypt(byte[], String, byte[])](#s-decrypt-1)
- [encrypt(byte[], String)](#s-encrypt)
- [find(String)](#s-find)
- [fixedIV(String)](#s-fixedIV)
- [isEncrypted(String)](#s-isEncrypted)
- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-AES128"></a>
### AES128

```java
public static final com.tailf.maapi.MaapiCryptoType AES128;
```

<a id="s-AES256"></a>
### AES256

```java
public static final com.tailf.maapi.MaapiCryptoType AES256;
```


## Methods

<a id="s-decrypt"></a>
### decrypt(byte[], String)

```java
public String decrypt(byte[] key, String encrypted) throws com.tailf.maapi.MaapiException
```

Types: [MaapiException](MaapiException.md#s-MaapiException)

Same as calling `#decrypt(byte[], String, byte[])` with the iv
 parameter set to null.

**Parameters**

- `byte[] key`
- `String encrypted`

<a id="s-decrypt-1"></a>
### decrypt(byte[], String, byte[])

```java
public String decrypt(byte[] key, String encrypted, byte[] iv) throws com.tailf.maapi.MaapiException
```

Types: [MaapiException](MaapiException.md#s-MaapiException)

Decrypt an encrypted string using the given key and IV. The encrypted
 string is assumed to include the prefix of the encryption algorithm
 used. If the IV is included in the encrypted string the iv parameter
 should be set to null, otherwise ir should be the fixed IV user
 during encryption.

**Parameters**

- `byte[] key` - The key to use for decryption.
- `String encrypted` - The string to decrypt.
- `byte[] iv` - The fixed IV to use for decryption or null if the IV
           is included in the encrypted string.

**Returns:** The decrypted value as a string.

<a id="s-encrypt"></a>
### encrypt(byte[], String)

```java
public String encrypt(byte[] key, String plaintext) throws com.tailf.maapi.MaapiException
```

Types: [MaapiException](MaapiException.md#s-MaapiException)

Encrypt a plaintext string using a supplied key.

**Parameters**

- `byte[] key` - The key to use when encrypting the plaintext.
- `String plaintext` - The plaintext value to encrypt.

**Returns:** The encrypted and base64 encoded value as a string with
         a prefix detailing the encryption algoritm used.

<a id="s-find"></a>
### find(String)

```java
public static com.tailf.maapi.MaapiCryptoType find(String encrypted)
```

Types: [MaapiCryptoType](MaapiCryptoType.md#s-MaapiCryptoType)

Find the crypto type corresponding for an encrypted string. Will check
 the prefix of the string to find the algorith used to encrypt it and
 return the MaapiCryptoType enum corresponding to that algorithm.

**Parameters**

- `String encrypted` - The encrypted string to find the crypto type for.

**Returns:** A [`MaapiCryptoType`](MaapiCryptoType.md#s-MaapiCryptoType) object or null if the type could not
         be found from the encrypted string.

<a id="s-fixedIV"></a>
### fixedIV(String)

```java
public boolean fixedIV(String value)
```

Check if an encrypted string was encrypted using a random or a fixed IV.

**Parameters**

- `String value` - The encrypted string.

**Returns:** true if a fixed IV was used, false otherwise.

<a id="s-isEncrypted"></a>
### isEncrypted(String)

```java
public static boolean isEncrypted(String value)
```

Check if a string is encrypted or not based on the prefix of the string.

**Parameters**

- `String value` - The string to check if it is encrypted.

**Returns:** true of the value is encrypted, false otherwise.

<a id="s-valueOf"></a>
### valueOf(String)

```java
public static com.tailf.maapi.MaapiCryptoType valueOf(String name)
```

Types: [MaapiCryptoType](MaapiCryptoType.md#s-MaapiCryptoType)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.maapi.MaapiCryptoType[] values()
```

Types: [MaapiCryptoType](MaapiCryptoType.md#s-MaapiCryptoType)
