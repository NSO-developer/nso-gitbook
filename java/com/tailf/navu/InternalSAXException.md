# InternalSAXException <a href="#internalsaxexception-ecf958a8bf68" id="internalsaxexception-ecf958a8bf68"></a>

```java
public class com.tailf.navu.InternalSAXException
    extends org.xml.sax.SAXException
```

## Members

**Constructors**:

- [InternalSAXException\(String, Stack\<CSNode\>\)](#internalsaxexception-b166b15685f4)

**Methods**:

- [getCurrentStack\(\)](#getcurrentstack-c7498012d33b)

## Constructors

### InternalSAXException(String, Stack&lt;CSNode&gt;) <a href="#internalsaxexception-b166b15685f4" id="internalsaxexception-b166b15685f4"></a>

```java
public InternalSAXException(
    String msg,
    java.util.Stack<com.tailf.maapi.MaapiSchemas.CSNode> currentStack
)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

**Parameters**

- `String msg`
- `java.util.Stack<com.tailf.maapi.MaapiSchemas.CSNode> currentStack`


## Methods

### getCurrentStack() <a href="#getcurrentstack-c7498012d33b" id="getcurrentstack-c7498012d33b"></a>

```java
public java.util.Stack<com.tailf.maapi.MaapiSchemas.CSNode> getCurrentStack()
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)
