# SecureFileTransfer <a href="#cls-SecureFileTransfer" id="cls-SecureFileTransfer"></a>

```java
public static interface com.tailf.ned.SSHClient.SecureFileTransfer
```

SSHCLient file transfer interface

**Authors:** jrendel

## Members

**Methods**:

- [get(String)](#m-get-e86cd4d90bf3)
- [put(String, String)](#m-put-5593beca1d56)
- [put(String, String, int)](#m-put-cd56c61d877c)

## Methods

### get(String) <a href="#m-get-e86cd4d90bf3" id="m-get-e86cd4d90bf3"></a>

```java
public abstract String get(String file) throws java.io.IOException
```

Get a file from a remote peer.

**Parameters**

- `String file` - - File name including path

**Returns:** A string with the file content

**Throws**

- `IOException`

### put(String, String) <a href="#m-put-5593beca1d56" id="m-put-5593beca1d56"></a>

```java
public default void put(String buffer, String file) throws java.io.IOException
```

Put a file with default permissions on a remote peer.

**Parameters**

- `String buffer` - - The content to put in the remote file
- `String file` - - The remote file name including path.

**Throws**

- `IOException`

### put(String, String, int) <a href="#m-put-cd56c61d877c" id="m-put-cd56c61d877c"></a>

```java
public abstract void put(String buffer, String file, int mode) throws java.io.IOException
```

Put a file on a remote peer.

**Parameters**

- `String buffer` - - The content to put in the remote file
- `String file` - - The remote file name including path.
- `int mode` - - File permissions

**Throws**

- `IOException`
