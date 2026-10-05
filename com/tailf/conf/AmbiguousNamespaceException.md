<a id="s-AmbiguousNamespaceException"></a>
# AmbiguousNamespaceException

```java
public class com.tailf.conf.AmbiguousNamespaceException
    extends RuntimeException
```

Exception thrown when protocol data is malformed.

## Members

**Constructors**:

- [AmbiguousNamespaceException(String)](#s-AmbiguousNamespaceException-1)
- [AmbiguousNamespaceException(String, Throwable)](#s-AmbiguousNamespaceException-2)

## Constructors

<a id="s-AmbiguousNamespaceException-1"></a>
### AmbiguousNamespaceException(String)

```java
public AmbiguousNamespaceException(String msg)
```

Exception thrown when protocol data is malformed, message only.

**Parameters**

- `String msg` - The message describing the exception

<a id="s-AmbiguousNamespaceException-2"></a>
### AmbiguousNamespaceException(String, Throwable)

```java
public AmbiguousNamespaceException(String msg, Throwable cause)
```

Exception thrown when protocol data is malformed, message and
 cause.

**Parameters**

- `String msg` - The message describing the exception
- `Throwable cause` - The cause of the exception
