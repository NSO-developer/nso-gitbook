# Subsystem <a href="#cls-Subsystem" id="cls-Subsystem"></a>

```java
public static interface com.tailf.ned.SSHClient.Subsystem
```

SSHCLient subsystem interface

**Authors:** jrendel

## Members

**Methods**:

- [close()](#m-close-8107c6dc012b)
- [getInputStream()](#m-getInputStream-cb1d1fa14d56)
- [getOutputStream()](#m-getOutputStream-b7e39f99be28)
- [isEof()](#m-isEof-8742248f0caf)
- [isOpen()](#m-isOpen-9dae28e82104)

## Methods

### close() <a href="#m-close-8107c6dc012b" id="m-close-8107c6dc012b"></a>

```java
public abstract void close() throws java.io.IOException
```

Close the subsystem

**Throws**

- `IOException`

### getInputStream() <a href="#m-getInputStream-cb1d1fa14d56" id="m-getInputStream-cb1d1fa14d56"></a>

```java
public abstract java.io.InputStream getInputStream()
```

**Returns:** the input stream used for this subsystem.

### getOutputStream() <a href="#m-getOutputStream-b7e39f99be28" id="m-getOutputStream-b7e39f99be28"></a>

```java
public abstract java.io.OutputStream getOutputStream()
```

**Returns:** the output stream used for this subsystem.

### isEof() <a href="#m-isEof-8742248f0caf" id="m-isEof-8742248f0caf"></a>

```java
public abstract boolean isEof()
```

**Returns:** whether EOF has been received.

### isOpen() <a href="#m-isOpen-9dae28e82104" id="m-isOpen-9dae28e82104"></a>

```java
public abstract boolean isOpen()
```

**Returns:** whether the channel is open.
