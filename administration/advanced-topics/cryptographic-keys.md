---
description: >-
  Store strings in NSO that are encrypted and decrypted using cryptographic
  keys.
---

# Cryptographic Keys

By using the NSO built-in encrypted YANG extension types `tailf:des3-cbc-encrypted-string`, `tailf:aes-cfb-128-encrypted-string`, or `tailf:aes-256-cfb-128-encrypted-string`, it is possible to store encrypted string values in NSO. See the [tailf\_yang\_extensions(5)](../../man/section5.md#yang-types-2) man page for more details on the encrypted string YANG extension types.

## Providing Keys

NSO supports defining one or more sets of cryptographic keys directly in `ncs.conf` and in an external key file read by an external command. Three methods can be used to configure the keys in `ncs.conf`:

* External keys under `/ncs-config/encrypted-strings/external-keys`.
* Key rotation under `/ncs-config/encrypted-strings/key-rotation`.
* Legacy (single generation) format: `/ncs-config/encrypted-strings/DES3CBC`, `/ncs-config/encrypted-strings/AESCFB128`, and `/ncs-config/encrypted-strings/AES256CFB128` .

### NSO Installer Provided Cryptography Keys

*   **Local installation**: Dummy keys are provided in legacy format in `ncs.conf` for development purposes. For deployment, the keys must be changed to random values. Example local installation `ncs.conf` (do not reuse):

    ```xml
    <ncs-config xmlns="http://tail-f.com/yang/tailf-ncs-config">
      <encrypted-strings>
        <DES3CBC>
          <key1>0123456789abcdeg</key1>
          <key2>0123456789abcdeg</key2>
          <key3>0123456789abcdeg</key3>
        </DES3CBC>
        <AESCFB128>
          <key>0123456789abcdef0123456789abcdeg</key>
        </AESCFB128>
        <AES256CFB128>
          <key>0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdeg</key>
        </AES256CFB128>
      </encrypted-strings>
    </ncs-config>
    ```
*   **System installation**: Random keys are generated in the legacy format stored in `${NCS_CONFIG_DIR}/ncs.crypto_keys`, and read using the `${NCS_DIR}/bin/ncs_crypto_keys` external command as configured in `${NCS_CONFIG_DIR}/ncs.conf`. Example system installation `ncs.conf:`

    ```xml
    <ncs-config xmlns="http://tail-f.com/yang/tailf-ncs-config">
      <encrypted-strings>
        <external-keys>
          <command>${NCS_DIR}/bin/ncs_crypto_keys</command>
          <command-argument>${NCS_CONFIG_DIR}/ncs.crypto_keys</command-argument>
        </external-keys>
      </encrypted-strings>
    </ncs-config>
    ```

    Example system installation`ncs.crypto_keys` file  (do not reuse):

    ```
    DES3CBC_KEY1=2a83724b14e2b35g
    DES3CBC_KEY2=7f63764c64a63e7g
    DES3CBC_KEY3=bd2a479a2a40d04g
    AESCFB128_KEY=40f7c3b5222c1458be3411cdc0899fg
    AES256CFB128_KEY=5a08b6d78b1ce768c67e13e76f88d8af7f3d925ce5bfedf7e3169de6270bb6eg
    ```

    For details on using a custom external command to read the encryption keys, see [Encrypted Strings](../../development/connected-topics/encryption-keys.md).

### Providing Keys for Key Rotation

To provide keys that can be rotated in `ncs.conf`, each generation of cryptographic keys must be encapsulated in a `/ncs-config/encrypted-strings/key-rotation` list, and a `/ncs-config/encrypted-strings/key-rotation/generation` list key starting from `0` must be included and incremented for each set of cryptographic keys. Example (do not reuse):

```xml
<ncs-config xmlns="http://tail-f.com/yang/tailf-ncs-config">
  <encrypted-strings>
    <key-rotation>
      <generation>0</generation>
      <DES3CBC>
        <key1>0123456789abcdeg</key1>
        <key2>0123456789abcdeg</key2>
        <key3>0123456789abcdeg</key3>
      </DES3CBC>
      <AESCFB128>
        <key>0123456789abcdef0123456789abcdeg</key>
      </AESCFB128>
      <AES256CFB128>
        <key>3c687d564e250ad987198d179537af563341357493ed2242ef3b16a881dd608g</key>
      </AES256CFB128>
    </key-rotation>
    <key-rotation>
      <generation>1</generation>
      <DES3CBC>
        <key1>0123456789abcdeh</key1>
        <key2>0123456789abcdeh</key2>
        <key3>0123456789abcdeh</key3>
      </DES3CBC>
      <AESCFB128>
        <key>0123456789abcdef0123456789abcdeh</key>
      </AESCFB128>
      <AES256CFB128>
        <key>3c687d564e250ad987198d179537af563341357493ed2242ef3b16a881dd608h</key>
      </AES256CFB128>
    </key-rotation>
  </encrypted-strings>
</ncs-config>
```

External keys that can be rotated must be provided with the initial line `EXTERNAL_KEY_FORMAT=2` and the `generation` within square brackets. Example (do not reuse):

```
EXTERNAL_KEY_FORMAT=2
DES3CBC_KEY1[0]=0123456789abcdeg
DES3CBC_KEY2[0]=0123456789abcdeg
DES3CBC_KEY3[0]=0123456789abcdeg
AESCFB128_KEY[0]=0123456789abcdef0123456789abcdeg
AES256CFB128_KEY[0]=3c687d564e250ad987198d179537af563341357493ed2242ef3b16a881dd608g
DES3CBC_KEY1[1]=0123456789abcdeh
DES3CBC_KEY2[1]=0123456789abcdeh
DES3CBC_KEY3[1]=0123456789abcdeh
AESCFB128_KEY[1]=0123456789abcdef0123456789abcdeh
AES256CFB128_KEY[1]=3c687d564e250ad987198d179537af563341357493ed2242ef3b16a881dd608h
```

There is always an active generation:

* Active generation is the generation in the set of keys currently used to encrypt and decrypt all leafs with an encrypted string type.
* The active generation is persisted.
* If using the legacy method of providing keys in `ncs.conf` or when providing keys using the `/ncs-config/encrypted-strings/key-rotation` method without providing the initial line `EXTERNAL_KEY_FORMAT=2` in the application, the active generation will be `-1`.
* If starting NSO without any previous keys using the `/ncs-config/encrypted-strings/key-rotation` method or the `external-keys` method with the initial line `EXTERNAL_KEY_FORMAT=2`, the highest provided generation will be selected as the active generation.

For `ncs.conf` details, see the [ncs.conf(5) man page](../../man/section5.md#ncs.conf) under `/ncs-config/encrypted-strings`.

## Key Rotation

Rotating cryptographic keys means replacing an old cryptographic key with a new one while maintaining the functionality of the encryption and decryption of encrypted string values in NSO. It is a standard practice in cryptography and key management to enhance security and mitigate risks associated with key exposure or compromise.\
Key rotation helps ensure that sensitive data remains secure over time. It reduces the impact of potential key compromise and adheres to best practices for cryptographic hygiene. Key benefits:

* If a cryptographic key is compromised, rotating it reduces the amount of data exposed to the attacker since previously encrypted values can be re-encrypted with a new key.
* Regular rotation minimizes the time a single key is in use, thereby reducing the potential damage an attacker could do if they gain access to it.
* Reusing the same key for a prolonged period increases the risk of data correlation attacks (e.g., frequency analysis). Rotation ensures unique keys are used for encrypting strings, reducing this risk.
* Regularly rotating keys helps organizations maintain and test their key management processes. This ensures the system is prepared to handle key management tasks effectively in an emergency.

To rotate to a new generation of keys and re-encrypt the data:

1. Always [take a backup](../management/system-management/#backup-and-restore) using [ncs-backup](../../man/section1.md#ncs-backup).
2. Check the currently active generation using the `/key-rotation/get-active-generation` action.
3. Re-encrypt all encrypted values with a new set of keys using the `/key-rotation/apply-new-key` action with the `new-key-generation` to rotate to as input.\
   The commit queue must be empty before running the action, or the action will fail, as the snapshot database is re-initialized. To wait for the commit queue to become empty, use the `wait-commit-queue` argument with the number of seconds to wait before failing.

CLI example:

```
$ ${NCS_DIR}/bin/ncs-backup
$ ncs_cli -Cu admin
# key-rotation get-active-generation 
active-generation -1
# key-rotation apply-new-keys new-key-generation 0 wait-commit-queue 10
result true
new-active-key-generation 0
```

The data in CDB that is subject to re-encryption when executing the `/key-rotation/apply-new-key` action:

* Encrypted types.
* Unions of encrypted types.
* Service metadata (original attribute, reverse and forward diff set).
* NED secrets.
* Rollback files.
* History log.

Under the hood, the`/key-rotation/apply-new-keys` action, when executed, performs the following steps:

1. Starts an upgrade transaction that will be used when re-encrypting the datastore.
2. Load the new active cryptographic keys into CDB and persist them.
3. Sync HA.
4. Re-encrypt data.
5. Drops the CDB snapshot database.
6. Commits data.
7. Restart NSO VMs.
8. End upgrade.

## Reloading After Changes to the Cryptographic Keys

1. Before changing the cryptographic keys, always [take a backup](../management/system-management/#backup-and-restore) using [ncs-backup](../../man/section1.md#ncs-backup). Also, backup the external key file, default `${NCS_CONFIG_DIR}/ncs.crypto_keys`, or the `${NCS_CONFIG_DIR}/ncs.conf` file, depending on where the keys are stored.
2. Suppose you have previously provided keys in the legacy format and wish to switch to `/ncs-config/encrypted-strings/key-rotation` or `external-keys` with the initial line `EXTERNAL_KEY_FORMAT=2`. In that case, you must provide the currently used keys as generation `-1`. The new keys can have any non-negative generation number.
3. Replace the external key file or `ncs.conf` file depending on where the keys are stored.
4. Issue `ncs --reload` to reload the cryptographic keys.
5. Ensure commit queues are empty or wait for them to become empty.
6. Execute`/key-rotation/apply-new-keys` action to change the active generation, for example, from `-1` to `new-key-generation 0` as shown in the CLI example above.

{% hint style="info" %}
In a high-availability setting, keys must be identical on all nodes before attempting key rotation. Otherwise, the action will abort. The node executing the action will initiate the key reload for all nodes.
{% endhint %}
