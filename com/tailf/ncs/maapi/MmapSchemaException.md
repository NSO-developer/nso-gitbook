# MmapSchemaException <a href="#cls-MmapSchemaException" id="cls-MmapSchemaException"></a>

```java
public class com.tailf.ncs.maapi.MmapSchemaException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../../conf/ConfException.md#cls-ConfException)

Exception thrown when there are issues with the file that is memory
 mapped for accessing schema data or issues with the content in the file.

## Members

**Constructors**:

- [MmapSchemaException(String)](#m-MmapSchemaException-5b836f8a9bea)
- [MmapSchemaException(String, Exception)](#m-MmapSchemaException-7bc027194a0d)
- [MmapSchemaException(String, String)](#m-MmapSchemaException-075013e40234)
- [MmapSchemaException(String, String, Exception)](#m-MmapSchemaException-9e6c1063e9ef)

**Methods**:

- [getErrorCode()](../../conf/ConfException.md#m-getErrorCode-812152fc083a) from ConfException
- [getOpaque()](../../conf/ConfException.md#m-getOpaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](../../conf/ConfException.md#m-mk-de1cedfc6ea8) from ConfException
- [mk(ConfResponse, ConfPath)](../../conf/ConfException.md#m-mk-79e69ffbc022) from ConfException

## Constructors

### MmapSchemaException(String) <a href="#m-MmapSchemaException-5b836f8a9bea" id="m-MmapSchemaException-5b836f8a9bea"></a>

**Package-private**

```java
MmapSchemaException(String message)
```

**Parameters**

- `String message`

### MmapSchemaException(String, Exception) <a href="#m-MmapSchemaException-7bc027194a0d" id="m-MmapSchemaException-7bc027194a0d"></a>

**Package-private**

```java
MmapSchemaException(String message, Exception ex)
```

**Parameters**

- `String message`
- `Exception ex`

### MmapSchemaException(String, String) <a href="#m-MmapSchemaException-075013e40234" id="m-MmapSchemaException-075013e40234"></a>

**Package-private**

```java
MmapSchemaException(String path, String message)
```

**Parameters**

- `String path`
- `String message`

### MmapSchemaException(String, String, Exception) <a href="#m-MmapSchemaException-9e6c1063e9ef" id="m-MmapSchemaException-9e6c1063e9ef"></a>

**Package-private**

```java
MmapSchemaException(String path, String message, Exception ex)
```

**Parameters**

- `String path`
- `String message`
- `Exception ex`
