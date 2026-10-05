# Subsystem <a href="#subsystem-513eac57ded0" id="subsystem-513eac57ded0"></a>

```java
public static interface com.tailf.ned.SSHClient.Subsystem
```

SSHCLient subsystem interface

**Authors:** jrendel

## Members

**Methods**:

- [close\(\)](#close-8107c6dc012b)
- [getInputStream\(\)](#getinputstream-cb1d1fa14d56)
- [getOutputStream\(\)](#getoutputstream-b7e39f99be28)
- [isEof\(\)](#iseof-8742248f0caf)
- [isOpen\(\)](#isopen-9dae28e82104)

## Methods

### close() <a href="#close-8107c6dc012b" id="close-8107c6dc012b"></a>

```java
public abstract void close() throws java.io.IOException
```

Close the subsystem

**Throws**

- `IOException`

### getInputStream() <a href="#getinputstream-cb1d1fa14d56" id="getinputstream-cb1d1fa14d56"></a>

```java
public abstract java.io.InputStream getInputStream()
```

**Returns:** the input stream used for this subsystem.

### getOutputStream() <a href="#getoutputstream-b7e39f99be28" id="getoutputstream-b7e39f99be28"></a>

```java
public abstract java.io.OutputStream getOutputStream()
```

**Returns:** the output stream used for this subsystem.

### isEof() <a href="#iseof-8742248f0caf" id="iseof-8742248f0caf"></a>

```java
public abstract boolean isEof()
```

**Returns:** whether EOF has been received.

### isOpen() <a href="#isopen-9dae28e82104" id="isopen-9dae28e82104"></a>

```java
public abstract boolean isOpen()
```

**Returns:** whether the channel is open.
