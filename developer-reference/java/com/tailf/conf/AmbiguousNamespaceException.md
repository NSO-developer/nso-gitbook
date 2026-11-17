# AmbiguousNamespaceException <a href="#ambiguousnamespaceexception-2f0452c4518b" id="ambiguousnamespaceexception-2f0452c4518b"></a>

```java
public class com.tailf.conf.AmbiguousNamespaceException
    extends RuntimeException
```

Exception thrown when protocol data is malformed.

## Members

**Constructors**:

- [AmbiguousNamespaceException\(String\)](#ambiguousnamespaceexception-b6dffc54393a)
- [AmbiguousNamespaceException\(String, Throwable\)](#ambiguousnamespaceexception-4bae7267e4c3)

## Constructors

### AmbiguousNamespaceException(String) <a href="#ambiguousnamespaceexception-b6dffc54393a" id="ambiguousnamespaceexception-b6dffc54393a"></a>

```java
public AmbiguousNamespaceException(String msg)
```

Exception thrown when protocol data is malformed, message only.

**Parameters**

- `String msg` - The message describing the exception

### AmbiguousNamespaceException(String, Throwable) <a href="#ambiguousnamespaceexception-4bae7267e4c3" id="ambiguousnamespaceexception-4bae7267e4c3"></a>

```java
public AmbiguousNamespaceException(String msg, Throwable cause)
```

Exception thrown when protocol data is malformed, message and
 cause.

**Parameters**

- `String msg` - The message describing the exception
- `Throwable cause` - The cause of the exception
