<a id="cls-InternalSAXException"></a>
# InternalSAXException

```java
public class com.tailf.navu.InternalSAXException
    extends org.xml.sax.SAXException
```

## Members

**Constructors**:

- [InternalSAXException(String, Stack<CSNode>)](#m-internalsaxexception-b166b15685f4)

**Methods**:

- [getCurrentStack()](#m-getcurrentstack-c7498012d33b)

## Constructors

<a id="m-internalsaxexception-b166b15685f4"></a>
### InternalSAXException(String, Stack<CSNode>)

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

<a id="m-getcurrentstack-c7498012d33b"></a>
### getCurrentStack()

```java
public java.util.Stack<com.tailf.maapi.MaapiSchemas.CSNode> getCurrentStack()
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)
