# MaapiCryptoType <a href="#maapicryptotype-eed6b72aa0d2" id="maapicryptotype-eed6b72aa0d2"></a>

```java
public enum com.tailf.maapi.MaapiCryptoType
```

Types: [MaapiCryptoType](MaapiCryptoType.md#maapicryptotype-eed6b72aa0d2)

Data encryption and decryption helper class for each supported
 encryption algorithm. Should be used through [`MaapiCrypto`](MaapiCrypto.md#maapicrypto-2f94e265c842).

## Members

**Enum Constants**:

- [AES128](#aes128-b24f34692f5f)
- [AES256](#aes256-beb44eb342f0)

**Methods**:

- [decrypt\(byte\[\], String\)](#decrypt-f32031492937)
- [decrypt\(byte\[\], String, byte\[\]\)](#decrypt-b3bea7978720)
- [encrypt\(byte\[\], String\)](#encrypt-1b582cae7f14)
- [find\(String\)](#find-e05e0e781b51)
- [fixedIV\(String\)](#fixediv-d3170dc48d0b)
- [isEncrypted\(String\)](#isencrypted-1e29023d8a65)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### AES128 <a href="#aes128-b24f34692f5f" id="aes128-b24f34692f5f"></a>

```java
public static final com.tailf.maapi.MaapiCryptoType AES128;
```

### AES256 <a href="#aes256-beb44eb342f0" id="aes256-beb44eb342f0"></a>

```java
public static final com.tailf.maapi.MaapiCryptoType AES256;
```


## Methods

### decrypt(byte[], String) <a href="#decrypt-f32031492937" id="decrypt-f32031492937"></a>

```java
public String decrypt(byte[] key, String encrypted) throws com.tailf.maapi.MaapiException
```

Types: [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

Same as calling [`decrypt(byte[], String, byte[])`](MaapiCryptoType.md#decrypt-b3bea7978720) with the iv
 parameter set to null.

**Parameters**

- `byte[] key`
- `String encrypted`

### decrypt(byte[], String, byte[]) <a href="#decrypt-b3bea7978720" id="decrypt-b3bea7978720"></a>

```java
public String decrypt(byte[] key, String encrypted, byte[] iv) throws com.tailf.maapi.MaapiException
```

Types: [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

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

### encrypt(byte[], String) <a href="#encrypt-1b582cae7f14" id="encrypt-1b582cae7f14"></a>

```java
public String encrypt(byte[] key, String plaintext) throws com.tailf.maapi.MaapiException
```

Types: [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

Encrypt a plaintext string using a supplied key.

**Parameters**

- `byte[] key` - The key to use when encrypting the plaintext.
- `String plaintext` - The plaintext value to encrypt.

**Returns:** The encrypted and base64 encoded value as a string with
         a prefix detailing the encryption algoritm used.

### find(String) <a href="#find-e05e0e781b51" id="find-e05e0e781b51"></a>

```java
public static com.tailf.maapi.MaapiCryptoType find(String encrypted)
```

Types: [MaapiCryptoType](MaapiCryptoType.md#maapicryptotype-eed6b72aa0d2)

Find the crypto type corresponding for an encrypted string. Will check
 the prefix of the string to find the algorith used to encrypt it and
 return the MaapiCryptoType enum corresponding to that algorithm.

**Parameters**

- `String encrypted` - The encrypted string to find the crypto type for.

**Returns:** A [`MaapiCryptoType`](MaapiCryptoType.md#maapicryptotype-eed6b72aa0d2) object or null if the type could not
         be found from the encrypted string.

### fixedIV(String) <a href="#fixediv-d3170dc48d0b" id="fixediv-d3170dc48d0b"></a>

```java
public boolean fixedIV(String value)
```

Check if an encrypted string was encrypted using a random or a fixed IV.

**Parameters**

- `String value` - The encrypted string.

**Returns:** true if a fixed IV was used, false otherwise.

### isEncrypted(String) <a href="#isencrypted-1e29023d8a65" id="isencrypted-1e29023d8a65"></a>

```java
public static boolean isEncrypted(String value)
```

Check if a string is encrypted or not based on the prefix of the string.

**Parameters**

- `String value` - The string to check if it is encrypted.

**Returns:** true of the value is encrypted, false otherwise.

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.maapi.MaapiCryptoType valueOf(String name)
```

Types: [MaapiCryptoType](MaapiCryptoType.md#maapicryptotype-eed6b72aa0d2)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.maapi.MaapiCryptoType[] values()
```

Types: [MaapiCryptoType](MaapiCryptoType.md#maapicryptotype-eed6b72aa0d2)
