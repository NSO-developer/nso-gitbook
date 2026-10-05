<a id="s-NoSuchNavuChoiceException"></a>
# NoSuchNavuChoiceException

```java
public class com.tailf.navu.NoSuchNavuChoiceException
    extends com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

## Members

**Constructors**:

- [NoSuchNavuChoiceException(NavuContainer, String, String)](#s-NoSuchNavuChoiceException-1)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#s-getErrorCode) from ConfException
- [getOpaque()](../conf/ConfException.md#s-getOpaque) from ConfException
- [mk(ConfResponse)](NavuException.md#s-mk) from NavuException
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#s-mk-1) from ConfException
- [mk(NavuContainer, String)](#s-mk)

## Constructors

<a id="s-NoSuchNavuChoiceException-1"></a>
### NoSuchNavuChoiceException(NavuContainer, String, String)

```java
public NoSuchNavuChoiceException(
    com.tailf.navu.NavuContainer surroundingContainer,
    String failureChoiceName,
    String childrenMsg
)
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer)

**Parameters**

- `com.tailf.navu.NavuContainer surroundingContainer`
- `String failureChoiceName`
- `String childrenMsg`


## Methods

<a id="s-mk"></a>
### mk(NavuContainer, String)

```java
public static com.tailf.navu.NoSuchNavuChoiceException mk(
    com.tailf.navu.NavuContainer node,
    String errChoiceName
)
```

Types: [NoSuchNavuChoiceException](NoSuchNavuChoiceException.md#s-NoSuchNavuChoiceException), [NavuContainer](NavuContainer.md#s-NavuContainer)

**Parameters**

- `com.tailf.navu.NavuContainer node`
- `String errChoiceName`
