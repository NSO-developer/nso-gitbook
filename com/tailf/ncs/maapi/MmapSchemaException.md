<a id="s-MmapSchemaException"></a>
# MmapSchemaException

```java
public class com.tailf.ncs.maapi.MmapSchemaException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../../conf/ConfException.md#s-ConfException)

Exception thrown when there are issues with the file that is memory
 mapped for accessing schema data or issues with the content in the file.

## Members

**Constructors**:

- [MmapSchemaException(String)](#s-MmapSchemaException-1)
- [MmapSchemaException(String, Exception)](#s-MmapSchemaException-2)
- [MmapSchemaException(String, String)](#s-MmapSchemaException-3)
- [MmapSchemaException(String, String, Exception)](#s-MmapSchemaException-4)

**Methods**:

- [getErrorCode()](../../conf/ConfException.md#s-getErrorCode) from ConfException
- [getOpaque()](../../conf/ConfException.md#s-getOpaque) from ConfException
- [mk(ConfResponse)](../../conf/ConfException.md#s-mk) from ConfException
- [mk(ConfResponse, ConfPath)](../../conf/ConfException.md#s-mk-1) from ConfException

## Constructors

<a id="s-MmapSchemaException-1"></a>
### MmapSchemaException(String)

**Package-private**

```java
MmapSchemaException(String message)
```

**Parameters**

- `String message`

<a id="s-MmapSchemaException-2"></a>
### MmapSchemaException(String, Exception)

**Package-private**

```java
MmapSchemaException(String message, Exception ex)
```

**Parameters**

- `String message`
- `Exception ex`

<a id="s-MmapSchemaException-3"></a>
### MmapSchemaException(String, String)

**Package-private**

```java
MmapSchemaException(String path, String message)
```

**Parameters**

- `String path`
- `String message`

<a id="s-MmapSchemaException-4"></a>
### MmapSchemaException(String, String, Exception)

**Package-private**

```java
MmapSchemaException(String path, String message, Exception ex)
```

**Parameters**

- `String path`
- `String message`
- `Exception ex`
