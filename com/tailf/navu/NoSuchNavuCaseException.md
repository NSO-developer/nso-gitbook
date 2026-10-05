# NoSuchNavuCaseException <a href="#nosuchnavucaseexception-2ffd47d19768" id="nosuchnavucaseexception-2ffd47d19768"></a>

```java
public class com.tailf.navu.NoSuchNavuCaseException
    extends com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

## Members

**Constructors**:

- [NoSuchNavuCaseException(NavuChoice, String, String)](#nosuchnavucaseexception-e1cdf258242d)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#geterrorcode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#getopaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](NavuException.md#mk-de1cedfc6ea8) from NavuException
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#mk-79e69ffbc022) from ConfException
- [mk(NavuChoice, String)](#mk-aac9088ddfd6)

## Constructors

### NoSuchNavuCaseException(NavuChoice, String, String) <a href="#nosuchnavucaseexception-e1cdf258242d" id="nosuchnavucaseexception-e1cdf258242d"></a>

```java
public NoSuchNavuCaseException(
    com.tailf.navu.NavuChoice navuChoice,
    String failureCaseName,
    String childrenMsg
)
```

Types: [NavuChoice](NavuChoice.md#navuchoice-e8914a50eee5)

**Parameters**

- `com.tailf.navu.NavuChoice navuChoice`
- `String failureCaseName`
- `String childrenMsg`


## Methods

### mk(NavuChoice, String) <a href="#mk-aac9088ddfd6" id="mk-aac9088ddfd6"></a>

```java
public static com.tailf.navu.NoSuchNavuCaseException mk(
    com.tailf.navu.NavuChoice choice,
    String errCaseName
)
```

Types: [NoSuchNavuCaseException](NoSuchNavuCaseException.md#nosuchnavucaseexception-2ffd47d19768), [NavuChoice](NavuChoice.md#navuchoice-e8914a50eee5)

**Parameters**

- `com.tailf.navu.NavuChoice choice`
- `String errCaseName`
