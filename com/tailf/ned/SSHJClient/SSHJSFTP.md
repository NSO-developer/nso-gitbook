# SSHJSFTP <a href="#sshjsftp-3a19134400ec" id="sshjsftp-3a19134400ec"></a>

```java
public class com.tailf.ned.SSHJClient.SSHJSFTP
    implements com.tailf.ned.SSHClient.SecureFileTransfer
```

Types: [SecureFileTransfer](../SSHClient/SecureFileTransfer.md#securefiletransfer-49298c7c6f54)

SFTP client implementation using the net.schmizz.sshj

**Authors:** jrendel

## Members

**Constructors**:

- [SSHJSFTP\(SFTPClient\)](#sshjsftp-e05f05dfb741)

**Methods**:

- [get\(String\)](#get-e86cd4d90bf3)
- [put\(String, String\)](../SSHClient/SecureFileTransfer.md#put-5593beca1d56) from SecureFileTransfer
- [put\(String, String, int\)](#put-cd56c61d877c)

## Constructors

### SSHJSFTP(SFTPClient) <a href="#sshjsftp-e05f05dfb741" id="sshjsftp-e05f05dfb741"></a>

**Package-private**

```java
SSHJSFTP(net.schmizz.sshj.sftp.SFTPClient sftp)
```

**Parameters**

- `net.schmizz.sshj.sftp.SFTPClient sftp`


## Methods

### get(String) <a href="#get-e86cd4d90bf3" id="get-e86cd4d90bf3"></a>

```java
public String get(String file) throws java.io.IOException
```

**Parameters**

- `String file`

### put(String, String, int) <a href="#put-cd56c61d877c" id="put-cd56c61d877c"></a>

```java
public void put(String buffer, String file, int mode) throws java.io.IOException
```

**Parameters**

- `String buffer`
- `String file`
- `int mode`
