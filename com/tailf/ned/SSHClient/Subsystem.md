<a id="s-Subsystem"></a>
# Subsystem

```java
public static interface com.tailf.ned.SSHClient.Subsystem
```

SSHCLient subsystem interface

**Authors:** jrendel

## Members

**Methods**:

- [close()](#s-close)
- [getInputStream()](#s-getInputStream)
- [getOutputStream()](#s-getOutputStream)
- [isEof()](#s-isEof)
- [isOpen()](#s-isOpen)

## Methods

<a id="s-close"></a>
### close()

```java
public abstract void close() throws java.io.IOException
```

Close the subsystem

**Throws**

- `IOException`

<a id="s-getInputStream"></a>
### getInputStream()

```java
public abstract java.io.InputStream getInputStream()
```

**Returns:** the input stream used for this subsystem.

<a id="s-getOutputStream"></a>
### getOutputStream()

```java
public abstract java.io.OutputStream getOutputStream()
```

**Returns:** the output stream used for this subsystem.

<a id="s-isEof"></a>
### isEof()

```java
public abstract boolean isEof()
```

**Returns:** whether EOF has been received.

<a id="s-isOpen"></a>
### isOpen()

```java
public abstract boolean isOpen()
```

**Returns:** whether the channel is open.
