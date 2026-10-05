<a id="cls-AmbiguousNamespaceException"></a>
# AmbiguousNamespaceException

```java
public class com.tailf.conf.AmbiguousNamespaceException
    extends RuntimeException
```

Exception thrown when protocol data is malformed.

## Members

**Constructors**:

- [AmbiguousNamespaceException(String)](#m-ambiguousnamespaceexception-b6dffc54393a)
- [AmbiguousNamespaceException(String, Throwable)](#m-ambiguousnamespaceexception-4bae7267e4c3)

## Constructors

<a id="m-ambiguousnamespaceexception-b6dffc54393a"></a>
### AmbiguousNamespaceException(String)

```java
public AmbiguousNamespaceException(String msg)
```

Exception thrown when protocol data is malformed, message only.

**Parameters**

- `String msg` - The message describing the exception

<a id="m-ambiguousnamespaceexception-4bae7267e4c3"></a>
### AmbiguousNamespaceException(String, Throwable)

```java
public AmbiguousNamespaceException(String msg, Throwable cause)
```

Exception thrown when protocol data is malformed, message and
 cause.

**Parameters**

- `String msg` - The message describing the exception
- `Throwable cause` - The cause of the exception
