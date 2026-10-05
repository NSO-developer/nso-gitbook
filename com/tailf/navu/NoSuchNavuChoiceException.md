# NoSuchNavuChoiceException <a href="#nosuchnavuchoiceexception-553bbfa1348d" id="nosuchnavuchoiceexception-553bbfa1348d"></a>

```java
public class com.tailf.navu.NoSuchNavuChoiceException
    extends com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

## Members

**Constructors**:

- [NoSuchNavuChoiceException(NavuContainer, String, String)](#nosuchnavuchoiceexception-bcaffba36e7e)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#geterrorcode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#getopaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](NavuException.md#mk-de1cedfc6ea8) from NavuException
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#mk-79e69ffbc022) from ConfException
- [mk(NavuContainer, String)](#mk-6170c505319c)

## Constructors

### NoSuchNavuChoiceException(NavuContainer, String, String) <a href="#nosuchnavuchoiceexception-bcaffba36e7e" id="nosuchnavuchoiceexception-bcaffba36e7e"></a>

```java
public NoSuchNavuChoiceException(
    com.tailf.navu.NavuContainer surroundingContainer,
    String failureChoiceName,
    String childrenMsg
)
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f)

**Parameters**

- `com.tailf.navu.NavuContainer surroundingContainer`
- `String failureChoiceName`
- `String childrenMsg`


## Methods

### mk(NavuContainer, String) <a href="#mk-6170c505319c" id="mk-6170c505319c"></a>

```java
public static com.tailf.navu.NoSuchNavuChoiceException mk(
    com.tailf.navu.NavuContainer node,
    String errChoiceName
)
```

Types: [NoSuchNavuChoiceException](NoSuchNavuChoiceException.md#nosuchnavuchoiceexception-553bbfa1348d), [NavuContainer](NavuContainer.md#navucontainer-8e321756755f)

**Parameters**

- `com.tailf.navu.NavuContainer node`
- `String errChoiceName`
