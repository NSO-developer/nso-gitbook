<a id="s-InternalSAXException"></a>
# InternalSAXException

```java
public class com.tailf.navu.InternalSAXException
    extends org.xml.sax.SAXException
```

## Members

**Constructors**:

- [InternalSAXException(String, Stack<CSNode>)](#s-InternalSAXException-1)

**Methods**:

- [getCurrentStack()](#s-getCurrentStack)

## Constructors

<a id="s-InternalSAXException-1"></a>
### InternalSAXException(String, Stack<CSNode>)

```java
public InternalSAXException(
    String msg,
    java.util.Stack<com.tailf.maapi.MaapiSchemas.CSNode> currentStack
)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `String msg`
- `java.util.Stack<com.tailf.maapi.MaapiSchemas.CSNode> currentStack`


## Methods

<a id="s-getCurrentStack"></a>
### getCurrentStack()

```java
public java.util.Stack<com.tailf.maapi.MaapiSchemas.CSNode> getCurrentStack()
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)
