# MmapSchemaException <a href="#mmapschemaexception-d3943c962514" id="mmapschemaexception-d3943c962514"></a>

```java
public class com.tailf.ncs.maapi.MmapSchemaException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../../conf/ConfException.md#confexception-baeaab99f7f9)

Exception thrown when there are issues with the file that is memory
 mapped for accessing schema data or issues with the content in the file.

## Members

**Constructors**:

- [MmapSchemaException\(String\)](#mmapschemaexception-5b836f8a9bea)
- [MmapSchemaException\(String, Exception\)](#mmapschemaexception-7bc027194a0d)
- [MmapSchemaException\(String, String\)](#mmapschemaexception-075013e40234)
- [MmapSchemaException\(String, String, Exception\)](#mmapschemaexception-9e6c1063e9ef)

**Methods**:

- [getErrorCode\(\)](../../conf/ConfException.md#geterrorcode-812152fc083a) from ConfException
- [getOpaque\(\)](../../conf/ConfException.md#getopaque-92e4945ec92d) from ConfException
- [mk\(ConfResponse\)](../../conf/ConfException.md#mk-de1cedfc6ea8) from ConfException
- [mk\(ConfResponse, ConfPath\)](../../conf/ConfException.md#mk-79e69ffbc022) from ConfException

## Constructors

### MmapSchemaException(String) <a href="#mmapschemaexception-5b836f8a9bea" id="mmapschemaexception-5b836f8a9bea"></a>

**Package-private**

```java
MmapSchemaException(String message)
```

**Parameters**

- `String message`

### MmapSchemaException(String, Exception) <a href="#mmapschemaexception-7bc027194a0d" id="mmapschemaexception-7bc027194a0d"></a>

**Package-private**

```java
MmapSchemaException(String message, Exception ex)
```

**Parameters**

- `String message`
- `Exception ex`

### MmapSchemaException(String, String) <a href="#mmapschemaexception-075013e40234" id="mmapschemaexception-075013e40234"></a>

**Package-private**

```java
MmapSchemaException(String path, String message)
```

**Parameters**

- `String path`
- `String message`

### MmapSchemaException(String, String, Exception) <a href="#mmapschemaexception-9e6c1063e9ef" id="mmapschemaexception-9e6c1063e9ef"></a>

**Package-private**

```java
MmapSchemaException(String path, String message, Exception ex)
```

**Parameters**

- `String path`
- `String message`
- `Exception ex`
