<a id="cls-SecureFileTransfer"></a>
# SecureFileTransfer

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

<a id="m-get-e86cd4d90bf3"></a>
### get(String)

```java
public abstract String get(String file) throws java.io.IOException
```

Get a file from a remote peer.

**Parameters**

- `String file` - - File name including path

**Returns:** A string with the file content

**Throws**

- `IOException`

<a id="m-put-5593beca1d56"></a>
### put(String, String)

```java
public default void put(String buffer, String file) throws java.io.IOException
```

Put a file with default permissions on a remote peer.

**Parameters**

- `String buffer` - - The content to put in the remote file
- `String file` - - The remote file name including path.

**Throws**

- `IOException`

<a id="m-put-cd56c61d877c"></a>
### put(String, String, int)

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
