<a id="s-SSHJSCP"></a>
# SSHJSCP

```java
public class com.tailf.ned.SSHJClient.SSHJSCP
    implements com.tailf.ned.SSHClient.SecureFileTransfer
```

Types: [SecureFileTransfer](../SSHClient/SecureFileTransfer.md#s-SecureFileTransfer)

SCP client implementation using the net.schmizz.sshj

**Authors:** jrendel

## Members

**Constructors**:

- [SSHJSCP(SCPFileTransfer)](#s-SSHJSCP-1)

**Fields**:

- [scp](#s-scp)

**Methods**:

- [get(String)](#s-get)
- [put(String, String)](../SSHClient/SecureFileTransfer.md#s-put) from SecureFileTransfer
- [put(String, String, int)](#s-put)

## Constructors

<a id="s-SSHJSCP-1"></a>
### SSHJSCP(SCPFileTransfer)

**Package-private**

```java
SSHJSCP(net.schmizz.sshj.xfer.scp.SCPFileTransfer scp)
```

**Parameters**

- `net.schmizz.sshj.xfer.scp.SCPFileTransfer scp`


## Fields

<a id="s-scp"></a>
### scp

**Package-private**

```java
net.schmizz.sshj.xfer.scp.SCPFileTransfer scp = null;
```


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
