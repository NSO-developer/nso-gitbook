# SSHJSCP <a href="#cls-SSHJSCP" id="cls-SSHJSCP"></a>

```java
public class com.tailf.ned.SSHJClient.SSHJSCP
    implements com.tailf.ned.SSHClient.SecureFileTransfer
```

Types: [SecureFileTransfer](../SSHClient/SecureFileTransfer.md#cls-SecureFileTransfer)

SCP client implementation using the net.schmizz.sshj

**Authors:** jrendel

## Members

**Constructors**:

- [SSHJSCP(SCPFileTransfer)](#m-SSHJSCP-9973136f9754)

**Fields**:

- [scp](#m-scp)

**Methods**:

- [get(String)](#m-get-e86cd4d90bf3)
- [put(String, String)](../SSHClient/SecureFileTransfer.md#m-put-5593beca1d56) from SecureFileTransfer
- [put(String, String, int)](#m-put-cd56c61d877c)

## Constructors

### SSHJSCP(SCPFileTransfer) <a href="#m-SSHJSCP-9973136f9754" id="m-SSHJSCP-9973136f9754"></a>

**Package-private**

```java
SSHJSCP(net.schmizz.sshj.xfer.scp.SCPFileTransfer scp)
```

**Parameters**

- `net.schmizz.sshj.xfer.scp.SCPFileTransfer scp`


## Fields

### scp <a href="#m-scp" id="m-scp"></a>

**Package-private**

```java
net.schmizz.sshj.xfer.scp.SCPFileTransfer scp = null;
```


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
