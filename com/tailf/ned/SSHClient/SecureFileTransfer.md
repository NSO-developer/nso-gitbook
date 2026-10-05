<a id="s-SecureFileTransfer"></a>
# SecureFileTransfer

```java
public static interface com.tailf.ned.SSHClient.SecureFileTransfer
```

SSHCLient file transfer interface

**Authors:** jrendel

## Members

**Methods**:

- [get(String)](#s-get)
- [put(String, String)](#s-put)
- [put(String, String, int)](#s-put-1)

## Methods

<a id="s-get"></a>
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

<a id="s-put"></a>
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

<a id="s-put-1"></a>
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
