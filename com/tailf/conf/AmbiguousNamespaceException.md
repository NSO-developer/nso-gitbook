# AmbiguousNamespaceException <a href="#cls-AmbiguousNamespaceException" id="cls-AmbiguousNamespaceException"></a>

```java
public class com.tailf.conf.AmbiguousNamespaceException
    extends RuntimeException
```

Exception thrown when protocol data is malformed.

## Members

**Constructors**:

- [AmbiguousNamespaceException(String)](#m-AmbiguousNamespaceException-b6dffc54393a)
- [AmbiguousNamespaceException(String, Throwable)](#m-AmbiguousNamespaceException-4bae7267e4c3)

## Constructors

### AmbiguousNamespaceException(String) <a href="#m-AmbiguousNamespaceException-b6dffc54393a" id="m-AmbiguousNamespaceException-b6dffc54393a"></a>

```java
public AmbiguousNamespaceException(String msg)
```

Exception thrown when protocol data is malformed, message only.

**Parameters**

- `String msg` - The message describing the exception

### AmbiguousNamespaceException(String, Throwable) <a href="#m-AmbiguousNamespaceException-4bae7267e4c3" id="m-AmbiguousNamespaceException-4bae7267e4c3"></a>

```java
public AmbiguousNamespaceException(String msg, Throwable cause)
```

Exception thrown when protocol data is malformed, message and
 cause.

**Parameters**

- `String msg` - The message describing the exception
- `Throwable cause` - The cause of the exception
