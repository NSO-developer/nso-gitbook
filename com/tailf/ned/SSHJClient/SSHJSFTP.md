<a id="s-SSHJSFTP"></a>
# SSHJSFTP

```java
public class com.tailf.ned.SSHJClient.SSHJSFTP
    implements com.tailf.ned.SSHClient.SecureFileTransfer
```

Types: [SecureFileTransfer](../SSHClient/SecureFileTransfer.md#s-SecureFileTransfer)

SFTP client implementation using the net.schmizz.sshj

**Authors:** jrendel

## Members

**Constructors**:

- [SSHJSFTP(SFTPClient)](#s-SSHJSFTP-1)

**Methods**:

- [get(String)](#s-get)
- [put(String, String)](../SSHClient/SecureFileTransfer.md#s-put) from SecureFileTransfer
- [put(String, String, int)](#s-put)

## Constructors

<a id="s-SSHJSFTP-1"></a>
### SSHJSFTP(SFTPClient)

**Package-private**

```java
SSHJSFTP(net.schmizz.sshj.sftp.SFTPClient sftp)
```

**Parameters**

- `net.schmizz.sshj.sftp.SFTPClient sftp`


## Methods

<a id="s-get"></a>
### get(String)

```java
public String get(String file) throws java.io.IOException
```

**Parameters**

- `String file`

<a id="s-put"></a>
### put(String, String, int)

```java
public void put(String buffer, String file, int mode) throws java.io.IOException
```

**Parameters**

- `String buffer`
- `String file`
- `int mode`
