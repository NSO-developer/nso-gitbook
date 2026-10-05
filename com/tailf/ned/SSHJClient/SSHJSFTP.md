<a id="cls-SSHJSFTP"></a>
# SSHJSFTP

```java
public class com.tailf.ned.SSHJClient.SSHJSFTP
    implements com.tailf.ned.SSHClient.SecureFileTransfer
```

Types: [SecureFileTransfer](../SSHClient/SecureFileTransfer.md#cls-SecureFileTransfer)

SFTP client implementation using the net.schmizz.sshj

**Authors:** jrendel

## Members

**Constructors**:

- [SSHJSFTP(SFTPClient)](#m-sshjsftp-e05f05dfb741)

**Methods**:

- [get(String)](#m-get-e86cd4d90bf3)
- [put(String, String)](../SSHClient/SecureFileTransfer.md#m-put-5593beca1d56) from SecureFileTransfer
- [put(String, String, int)](#m-put-cd56c61d877c)

## Constructors

<a id="m-sshjsftp-e05f05dfb741"></a>
### SSHJSFTP(SFTPClient)

**Package-private**

```java
SSHJSFTP(net.schmizz.sshj.sftp.SFTPClient sftp)
```

**Parameters**

- `net.schmizz.sshj.sftp.SFTPClient sftp`


## Methods

<a id="m-get-e86cd4d90bf3"></a>
### get(String)

```java
public String get(String file) throws java.io.IOException
```

**Parameters**

- `String file`

<a id="m-put-cd56c61d877c"></a>
### put(String, String, int)

```java
public void put(String buffer, String file, int mode) throws java.io.IOException
```

**Parameters**

- `String buffer`
- `String file`
- `int mode`
