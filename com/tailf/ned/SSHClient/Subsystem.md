<a id="cls-Subsystem"></a>
# Subsystem

```java
public static interface com.tailf.ned.SSHClient.Subsystem
```

SSHCLient subsystem interface

**Authors:** jrendel

## Members

**Methods**:

- [close()](#m-close-8107c6dc012b)
- [getInputStream()](#m-getinputstream-cb1d1fa14d56)
- [getOutputStream()](#m-getoutputstream-b7e39f99be28)
- [isEof()](#m-iseof-8742248f0caf)
- [isOpen()](#m-isopen-9dae28e82104)

## Methods

<a id="m-close-8107c6dc012b"></a>
### close()

```java
public abstract void close() throws java.io.IOException
```

Close the subsystem

**Throws**

- `IOException`

<a id="m-getinputstream-cb1d1fa14d56"></a>
### getInputStream()

```java
public abstract java.io.InputStream getInputStream()
```

**Returns:** the input stream used for this subsystem.

<a id="m-getoutputstream-b7e39f99be28"></a>
### getOutputStream()

```java
public abstract java.io.OutputStream getOutputStream()
```

**Returns:** the output stream used for this subsystem.

<a id="m-iseof-8742248f0caf"></a>
### isEof()

```java
public abstract boolean isEof()
```

**Returns:** whether EOF has been received.

<a id="m-isopen-9dae28e82104"></a>
### isOpen()

```java
public abstract boolean isOpen()
```

**Returns:** whether the channel is open.
