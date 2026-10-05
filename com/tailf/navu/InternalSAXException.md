# InternalSAXException <a href="#cls-InternalSAXException" id="cls-InternalSAXException"></a>

```java
public class com.tailf.navu.InternalSAXException
    extends org.xml.sax.SAXException
```

## Members

**Constructors**:

- [InternalSAXException(String, Stack<CSNode>)](#m-InternalSAXException-b166b15685f4)

**Methods**:

- [getCurrentStack()](#m-getCurrentStack-c7498012d33b)

## Constructors

### InternalSAXException(String, Stack<CSNode>) <a href="#m-InternalSAXException-b166b15685f4" id="m-InternalSAXException-b166b15685f4"></a>

```java
public InternalSAXException(
    String msg,
    java.util.Stack<com.tailf.maapi.MaapiSchemas.CSNode> currentStack
)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `String msg`
- `java.util.Stack<com.tailf.maapi.MaapiSchemas.CSNode> currentStack`


## Methods

### getCurrentStack() <a href="#m-getCurrentStack-c7498012d33b" id="m-getCurrentStack-c7498012d33b"></a>

```java
public java.util.Stack<com.tailf.maapi.MaapiSchemas.CSNode> getCurrentStack()
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)
