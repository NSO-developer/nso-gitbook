<a id="cls-MmapSchemaException"></a>
# MmapSchemaException

```java
public class com.tailf.ncs.maapi.MmapSchemaException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../../conf/ConfException.md#cls-ConfException)

Exception thrown when there are issues with the file that is memory
 mapped for accessing schema data or issues with the content in the file.

## Members

**Constructors**:

- [MmapSchemaException(String)](#m-mmapschemaexception-5b836f8a9bea)
- [MmapSchemaException(String, Exception)](#m-mmapschemaexception-7bc027194a0d)
- [MmapSchemaException(String, String)](#m-mmapschemaexception-075013e40234)
- [MmapSchemaException(String, String, Exception)](#m-mmapschemaexception-9e6c1063e9ef)

**Methods**:

- [getErrorCode()](../../conf/ConfException.md#m-geterrorcode-812152fc083a) from ConfException
- [getOpaque()](../../conf/ConfException.md#m-getopaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](../../conf/ConfException.md#m-mk-de1cedfc6ea8) from ConfException
- [mk(ConfResponse, ConfPath)](../../conf/ConfException.md#m-mk-79e69ffbc022) from ConfException

## Constructors

<a id="m-mmapschemaexception-5b836f8a9bea"></a>
### MmapSchemaException(String)

**Package-private**

```java
MmapSchemaException(String message)
```

**Parameters**

- `String message`

<a id="m-mmapschemaexception-7bc027194a0d"></a>
### MmapSchemaException(String, Exception)

**Package-private**

```java
MmapSchemaException(String message, Exception ex)
```

**Parameters**

- `String message`
- `Exception ex`

<a id="m-mmapschemaexception-075013e40234"></a>
### MmapSchemaException(String, String)

**Package-private**

```java
MmapSchemaException(String path, String message)
```

**Parameters**

- `String path`
- `String message`

<a id="m-mmapschemaexception-9e6c1063e9ef"></a>
### MmapSchemaException(String, String, Exception)

**Package-private**

```java
MmapSchemaException(String path, String message, Exception ex)
```

**Parameters**

- `String path`
- `String message`
- `Exception ex`
