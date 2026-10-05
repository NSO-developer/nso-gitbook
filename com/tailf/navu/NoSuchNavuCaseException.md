<a id="s-NoSuchNavuCaseException"></a>
# NoSuchNavuCaseException

```java
public class com.tailf.navu.NoSuchNavuCaseException
    extends com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

## Members

**Constructors**:

- [NoSuchNavuCaseException(NavuChoice, String, String)](#s-NoSuchNavuCaseException-1)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#s-getErrorCode) from ConfException
- [getOpaque()](../conf/ConfException.md#s-getOpaque) from ConfException
- [mk(ConfResponse)](NavuException.md#s-mk) from NavuException
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#s-mk-1) from ConfException
- [mk(NavuChoice, String)](#s-mk)

## Constructors

<a id="s-NoSuchNavuCaseException-1"></a>
### NoSuchNavuCaseException(NavuChoice, String, String)

```java
public NoSuchNavuCaseException(
    com.tailf.navu.NavuChoice navuChoice,
    String failureCaseName,
    String childrenMsg
)
```

Types: [NavuChoice](NavuChoice.md#s-NavuChoice)

**Parameters**

- `com.tailf.navu.NavuChoice navuChoice`
- `String failureCaseName`
- `String childrenMsg`


## Methods

<a id="s-mk"></a>
### mk(NavuChoice, String)

```java
public static com.tailf.navu.NoSuchNavuCaseException mk(
    com.tailf.navu.NavuChoice choice,
    String errCaseName
)
```

Types: [NoSuchNavuCaseException](NoSuchNavuCaseException.md#s-NoSuchNavuCaseException), [NavuChoice](NavuChoice.md#s-NavuChoice)

**Parameters**

- `com.tailf.navu.NavuChoice choice`
- `String errCaseName`
