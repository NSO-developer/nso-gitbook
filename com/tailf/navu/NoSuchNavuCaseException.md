# NoSuchNavuCaseException <a href="#cls-NoSuchNavuCaseException" id="cls-NoSuchNavuCaseException"></a>

```java
public class com.tailf.navu.NoSuchNavuCaseException
    extends com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

## Members

**Constructors**:

- [NoSuchNavuCaseException(NavuChoice, String, String)](#m-NoSuchNavuCaseException-e1cdf258242d)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#m-getErrorCode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getOpaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](NavuException.md#m-mk-de1cedfc6ea8) from NavuException
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#m-mk-79e69ffbc022) from ConfException
- [mk(NavuChoice, String)](#m-mk-aac9088ddfd6)

## Constructors

### NoSuchNavuCaseException(NavuChoice, String, String) <a href="#m-NoSuchNavuCaseException-e1cdf258242d" id="m-NoSuchNavuCaseException-e1cdf258242d"></a>

```java
public NoSuchNavuCaseException(
    com.tailf.navu.NavuChoice navuChoice,
    String failureCaseName,
    String childrenMsg
)
```

Types: [NavuChoice](NavuChoice.md#cls-NavuChoice)

**Parameters**

- `com.tailf.navu.NavuChoice navuChoice`
- `String failureCaseName`
- `String childrenMsg`


## Methods

### mk(NavuChoice, String) <a href="#m-mk-aac9088ddfd6" id="m-mk-aac9088ddfd6"></a>

```java
public static com.tailf.navu.NoSuchNavuCaseException mk(
    com.tailf.navu.NavuChoice choice,
    String errCaseName
)
```

Types: [NoSuchNavuCaseException](NoSuchNavuCaseException.md#cls-NoSuchNavuCaseException), [NavuChoice](NavuChoice.md#cls-NavuChoice)

**Parameters**

- `com.tailf.navu.NavuChoice choice`
- `String errCaseName`
