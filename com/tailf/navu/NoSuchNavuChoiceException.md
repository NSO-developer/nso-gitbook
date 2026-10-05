<a id="cls-NoSuchNavuChoiceException"></a>
# NoSuchNavuChoiceException

```java
public class com.tailf.navu.NoSuchNavuChoiceException
    extends com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

## Members

**Constructors**:

- [NoSuchNavuChoiceException(NavuContainer, String, String)](#m-nosuchnavuchoiceexception-bcaffba36e7e)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#m-geterrorcode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getopaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](NavuException.md#m-mk-de1cedfc6ea8) from NavuException
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#m-mk-79e69ffbc022) from ConfException
- [mk(NavuContainer, String)](#m-mk-6170c505319c)

## Constructors

<a id="m-nosuchnavuchoiceexception-bcaffba36e7e"></a>
### NoSuchNavuChoiceException(NavuContainer, String, String)

```java
public NoSuchNavuChoiceException(
    com.tailf.navu.NavuContainer surroundingContainer,
    String failureChoiceName,
    String childrenMsg
)
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer)

**Parameters**

- `com.tailf.navu.NavuContainer surroundingContainer`
- `String failureChoiceName`
- `String childrenMsg`


## Methods

<a id="m-mk-6170c505319c"></a>
### mk(NavuContainer, String)

```java
public static com.tailf.navu.NoSuchNavuChoiceException mk(
    com.tailf.navu.NavuContainer node,
    String errChoiceName
)
```

Types: [NoSuchNavuChoiceException](NoSuchNavuChoiceException.md#cls-NoSuchNavuChoiceException), [NavuContainer](NavuContainer.md#cls-NavuContainer)

**Parameters**

- `com.tailf.navu.NavuContainer node`
- `String errChoiceName`
