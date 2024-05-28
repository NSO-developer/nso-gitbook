---
description: Manage and work with NSO encryption keys.
---

# Encryption Keys

By using the `tailf:des3-cbc-encrypted-string`, `tailf:aes-cfb-128-encrypted-string` or the `tailf:aes-256-cfb-128-encrypted-string` built-in types, it is possible to store encrypted values in NSO. The keys used to encrypt these values are configured in `ncs.conf` and default stored in `ncs.crypto_keys`.

## Reading Encryption Keys using an External Command <a href="#d5e10497" id="d5e10497"></a>

NSO supports reading encryption keys using an external command instead of storing them in `ncs.conf` to allow for use with external key management systems. To use this feature, set `/ncs-config/encrypted-strings/external-keys/command` to an executable command that will output the keys following the rules described in the following sections. The command will be executed on startup and when NSO reloads the configuration.

If the external command fails during startup, the startup will abort. If the command fails during a reload, the error will be logged and the previously loaded keys will be kept in the system.

The process of providing encryption keys to NSO can be described by the following three steps:

1. Read the configuration from the environment.
2. Read encryption keys.
3. Write encryption keys or the error on standard output.

The value of `/ncs-config/encrypted-strings/external-keys/command-argument` is available in the command as the environment variable `NCS_EXTERNAL_KEYS_ARGUMENT`. The value of this configuration is only used by the configured command.

The external command should return the encryption keys on standard output using the names as shown in the table below. The encryption key values are in hexadecimal format, just as in `ncs.conf`. See the example below for details.

The following table shows the mapping from the name to the path in the configuration.

<table><thead><tr><th width="227">Name</th><th>Configuration path</th></tr></thead><tbody><tr><td><code>DES3CBC_KEY1</code></td><td><code>/ncs-config/encrypted-strings/DES3CBC/key1</code></td></tr><tr><td><code>DES3CBC_KEY2</code></td><td><code>/ncs-config/encrypted-strings/DES3CBC/key2</code></td></tr><tr><td><code>DES3CBC_KEY3</code></td><td><code>/ncs-config/encrypted-strings/DES3CBC/key3</code></td></tr><tr><td><code>DES3CBC_IV</code></td><td><code>/ncs-config/encrypted-strings/DES3CBC/initVector</code></td></tr><tr><td><code>AESCFB128_KEY</code></td><td><code>/ncs-config/encrypted-strings/AESCFB128/key</code></td></tr><tr><td><code>AESCFB128_IV</code></td><td><code>/ncs-config/encrypted-strings/AESCFB128/initVector</code></td></tr><tr><td><code>AES256CFB128_KEY</code></td><td><code>/ncs-config/encrypted-strings/AES256CFB128/key</code></td></tr></tbody></table>

To signal an error, including `ERROR=message` is preferred. A non-zero exit code or unsupported line content will also trigger an error. Any form of error will be logged to the development log and no encryption keys will be available in the system.

Example output providing all supported encryption key configuration settings:

```
DES3CBC_KEY1=12785c357764a327
DES3CBC_KEY2=30661368c90bc26d
DES3CBC_KEY3=10604b6b63e09310
DES3CBC_IV=f04ab44ed14c3d76
AESCFB128_KEY=2b57c219e47582481b733c1adb84fc26
AESCFB128_IV=549a40ed57629bf6ea64b568f221b515
AES256CFB128_KEY=3c687d564e250ad987198d179537af563341357493ed2242ef3b16a881dd608c
```

Example error output:

```
ERROR=error message
```

Below is a complete example of an application written in Python providing encryption keys from a plain text file. The application is included in the example `crypto/external_keys`:

```
#!/usr/bin/env python3

import os
import sys


def main():
    key_file = os.getenv('NCS_EXTERNAL_KEYS_ARGUMENT', None)
    if key_file is None:
        error('NCS_EXTERNAL_KEYS_ARGUMENT environment not set')
    if len(key_file) == 0:
        error('NCS_EXTERNAL_KEYS_ARGUMENT is empty')

    try:
        with open(key_file, 'r') as f_obj:
            keys = f_obj.read()
            sys.stdout.write(keys)
    except Exception as ex:
        error('unable to open/read {}: {}'.format(key_file, ex))


def error(msg):
    print('ERROR={}'.format(msg))
    sys.exit(1)


if __name__ == '__main__':
    main()
```
