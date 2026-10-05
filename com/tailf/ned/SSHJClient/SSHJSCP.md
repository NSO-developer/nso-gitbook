# SSHJSCP <a href="#sshjscp-259e252cfc53" id="sshjscp-259e252cfc53"></a>

```java
public class com.tailf.ned.SSHJClient.SSHJSCP
    implements com.tailf.ned.SSHClient.SecureFileTransfer
```

Types: [SecureFileTransfer](../SSHClient/SecureFileTransfer.md#securefiletransfer-49298c7c6f54)

SCP client implementation using the net.schmizz.sshj

**Authors:** jrendel

## Members

**Constructors**:

- [SSHJSCP(SCPFileTransfer)](#sshjscp-9973136f9754)

**Fields**:

- [scp](#scp-b02efa3e1c6f)

**Methods**:

- [get(String)](#get-e86cd4d90bf3)
- [put(String, String)](../SSHClient/SecureFileTransfer.md#put-5593beca1d56) from SecureFileTransfer
- [put(String, String, int)](#put-cd56c61d877c)

## Constructors

### SSHJSCP(SCPFileTransfer) <a href="#sshjscp-9973136f9754" id="sshjscp-9973136f9754"></a>

**Package-private**

```java
SSHJSCP(net.schmizz.sshj.xfer.scp.SCPFileTransfer scp)
```

**Parameters**

- `net.schmizz.sshj.xfer.scp.SCPFileTransfer scp`


## Fields

### scp <a href="#scp-b02efa3e1c6f" id="scp-b02efa3e1c6f"></a>

**Package-private**

```java
net.schmizz.sshj.xfer.scp.SCPFileTransfer scp = null;
```


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
