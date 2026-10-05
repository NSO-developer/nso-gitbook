<a id="cls-SSHJSCP"></a>
# SSHJSCP

```java
public class com.tailf.ned.SSHJClient.SSHJSCP
    implements com.tailf.ned.SSHClient.SecureFileTransfer
```

Types: [SecureFileTransfer](../SSHClient/SecureFileTransfer.md#cls-SecureFileTransfer)

SCP client implementation using the net.schmizz.sshj

**Authors:** jrendel

## Members

**Constructors**:

- [SSHJSCP(SCPFileTransfer)](#m-sshjscp-9973136f9754)

**Fields**:

- [scp](#m-scp)

**Methods**:

- [get(String)](#m-get-e86cd4d90bf3)
- [put(String, String)](../SSHClient/SecureFileTransfer.md#m-put-5593beca1d56) from SecureFileTransfer
- [put(String, String, int)](#m-put-cd56c61d877c)

## Constructors

<a id="m-sshjscp-9973136f9754"></a>
### SSHJSCP(SCPFileTransfer)

**Package-private**

```java
SSHJSCP(net.schmizz.sshj.xfer.scp.SCPFileTransfer scp)
```

**Parameters**

- `net.schmizz.sshj.xfer.scp.SCPFileTransfer scp`


## Fields

<a id="m-scp"></a>
### scp

**Package-private**

```java
net.schmizz.sshj.xfer.scp.SCPFileTransfer scp = null;
```


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
