# SSHJSFTP <a href="#cls-SSHJSFTP" id="cls-SSHJSFTP"></a>

```java
public class com.tailf.ned.SSHJClient.SSHJSFTP
    implements com.tailf.ned.SSHClient.SecureFileTransfer
```

Types: [SecureFileTransfer](../SSHClient/SecureFileTransfer.md#cls-SecureFileTransfer)

SFTP client implementation using the net.schmizz.sshj

**Authors:** jrendel

## Members

**Constructors**:

- [SSHJSFTP(SFTPClient)](#m-SSHJSFTP-e05f05dfb741)

**Methods**:

- [get(String)](#m-get-e86cd4d90bf3)
- [put(String, String)](../SSHClient/SecureFileTransfer.md#m-put-5593beca1d56) from SecureFileTransfer
- [put(String, String, int)](#m-put-cd56c61d877c)

## Constructors

### SSHJSFTP(SFTPClient) <a href="#m-SSHJSFTP-e05f05dfb741" id="m-SSHJSFTP-e05f05dfb741"></a>

**Package-private**

```java
SSHJSFTP(net.schmizz.sshj.sftp.SFTPClient sftp)
```

**Parameters**

- `net.schmizz.sshj.sftp.SFTPClient sftp`


## Methods

### get(String) <a href="#m-get-e86cd4d90bf3" id="m-get-e86cd4d90bf3"></a>

```java
public String get(String file) throws java.io.IOException
```

**Parameters**

- `String file`

### put(String, String, int) <a href="#m-put-cd56c61d877c" id="m-put-cd56c61d877c"></a>

```java
public void put(String buffer, String file, int mode) throws java.io.IOException
```

**Parameters**

- `String buffer`
- `String file`
- `int mode`
