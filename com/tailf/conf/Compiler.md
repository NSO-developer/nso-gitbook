# Compiler <a href="#compiler-552d3a56b931" id="compiler-552d3a56b931"></a>

```java
public interface com.tailf.conf.Compiler
```

## Members

**Fields**:

- [AXIS_ANCESTOR](#axis_ancestor-62c59dd9b2e3)
- [AXIS_ANCESTOR_OR_SELF](#axis_ancestor_or_self-8a86e8f77b65)
- [AXIS_ATTRIBUTE](#axis_attribute-a05946445c05)
- [AXIS_CHILD](#axis_child-b30db2353719)
- [AXIS_DESCENDANT](#axis_descendant-15e7b43dd049)
- [AXIS_DESCENDANT_OR_SELF](#axis_descendant_or_self-9f6c29a66ab9)
- [AXIS_FOLLOWING](#axis_following-a1c4549e0b7e)
- [AXIS_FOLLOWING_SIBLING](#axis_following_sibling-15c026a27921)
- [AXIS_NAMESPACE](#axis_namespace-fca116cb0837)
- [AXIS_PARENT](#axis_parent-a46c866285ba)
- [AXIS_PRECEDING](#axis_preceding-928fdaa9975d)
- [AXIS_PRECEDING_SIBLING](#axis_preceding_sibling-d98b9bd3ec33)
- [AXIS_SELF](#axis_self-e8df13365b56)
- [FUNCTION_CURRENT](#function_current-756d70c6837c)
- [NODE_TYPE_COMMENT](#node_type_comment-08560091555e)
- [NODE_TYPE_NODE](#node_type_node-bcd5091e1f2c)
- [NODE_TYPE_PI](#node_type_pi-b3d41de190bb)
- [NODE_TYPE_TEXT](#node_type_text-be2adb978305)

**Methods**:

- [equal(Object, Object)](#equal-799a2136c547)
- [expressionPath(Object, Object[], Object[])](#expressionpath-5bf270c9d4c4)
- [function(int, Object[])](#function-2c16049fa829)
- [function(Object, Object[])](#function-1cc89eb447db)
- [getKP()](#getkp-45b2f95adae4)
- [literal(String)](#literal-ad0286a2ebc5)
- [locationPath(boolean, Object[])](#locationpath-62efb77d2c40)
- [nodeNameTest(Object)](#nodenametest-d6890d3b8e88)
- [nodeTypeTest(int)](#nodetypetest-6d6b838bb52c)
- [number(String)](#number-249f888e69f1)
- [qname(String, String)](#qname-1189e6474a0b)
- [step(int, Object, Object[])](#step-476841714396)

## Fields

### AXIS_ANCESTOR <a href="#axis_ancestor-62c59dd9b2e3" id="axis_ancestor-62c59dd9b2e3"></a>

```java
public static final int AXIS_ANCESTOR = 4;
```

### AXIS_ANCESTOR_OR_SELF <a href="#axis_ancestor_or_self-8a86e8f77b65" id="axis_ancestor_or_self-8a86e8f77b65"></a>

```java
public static final int AXIS_ANCESTOR_OR_SELF = 10;
```

### AXIS_ATTRIBUTE <a href="#axis_attribute-a05946445c05" id="axis_attribute-a05946445c05"></a>

```java
public static final int AXIS_ATTRIBUTE = 5;
```

### AXIS_CHILD <a href="#axis_child-b30db2353719" id="axis_child-b30db2353719"></a>

```java
public static final int AXIS_CHILD = 2;
```

### AXIS_DESCENDANT <a href="#axis_descendant-15e7b43dd049" id="axis_descendant-15e7b43dd049"></a>

```java
public static final int AXIS_DESCENDANT = 9;
```

### AXIS_DESCENDANT_OR_SELF <a href="#axis_descendant_or_self-9f6c29a66ab9" id="axis_descendant_or_self-9f6c29a66ab9"></a>

```java
public static final int AXIS_DESCENDANT_OR_SELF = 13;
```

### AXIS_FOLLOWING <a href="#axis_following-a1c4549e0b7e" id="axis_following-a1c4549e0b7e"></a>

```java
public static final int AXIS_FOLLOWING = 8;
```

### AXIS_FOLLOWING_SIBLING <a href="#axis_following_sibling-15c026a27921" id="axis_following_sibling-15c026a27921"></a>

```java
public static final int AXIS_FOLLOWING_SIBLING = 11;
```

### AXIS_NAMESPACE <a href="#axis_namespace-fca116cb0837" id="axis_namespace-fca116cb0837"></a>

```java
public static final int AXIS_NAMESPACE = 6;
```

### AXIS_PARENT <a href="#axis_parent-a46c866285ba" id="axis_parent-a46c866285ba"></a>

```java
public static final int AXIS_PARENT = 3;
```

### AXIS_PRECEDING <a href="#axis_preceding-928fdaa9975d" id="axis_preceding-928fdaa9975d"></a>

```java
public static final int AXIS_PRECEDING = 7;
```

### AXIS_PRECEDING_SIBLING <a href="#axis_preceding_sibling-d98b9bd3ec33" id="axis_preceding_sibling-d98b9bd3ec33"></a>

```java
public static final int AXIS_PRECEDING_SIBLING = 12;
```

### AXIS_SELF <a href="#axis_self-e8df13365b56" id="axis_self-e8df13365b56"></a>

```java
public static final int AXIS_SELF = 1;
```

### FUNCTION_CURRENT <a href="#function_current-756d70c6837c" id="function_current-756d70c6837c"></a>

```java
public static final int FUNCTION_CURRENT = 1;
```

### NODE_TYPE_COMMENT <a href="#node_type_comment-08560091555e" id="node_type_comment-08560091555e"></a>

```java
public static final int NODE_TYPE_COMMENT = 3;
```

### NODE_TYPE_NODE <a href="#node_type_node-bcd5091e1f2c" id="node_type_node-bcd5091e1f2c"></a>

```java
public static final int NODE_TYPE_NODE = 1;
```

### NODE_TYPE_PI <a href="#node_type_pi-b3d41de190bb" id="node_type_pi-b3d41de190bb"></a>

```java
public static final int NODE_TYPE_PI = 4;
```

### NODE_TYPE_TEXT <a href="#node_type_text-be2adb978305" id="node_type_text-be2adb978305"></a>

```java
public static final int NODE_TYPE_TEXT = 2;
```


## Methods

### equal(Object, Object) <a href="#equal-799a2136c547" id="equal-799a2136c547"></a>

```java
public abstract Object equal(Object left, Object right) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

Produces an EXPRESSION object representing the comparison:
 *left* equals to *right*

**Parameters**

- `Object left` - is an EXPRESSION object
- `Object right` - is an EXPRESSION object

**Returns:** Object

### expressionPath(Object, Object[], Object[]) <a href="#expressionpath-5bf270c9d4c4" id="expressionpath-5bf270c9d4c4"></a>

```java
public abstract Object expressionPath(Object expression, Object[] predicates, Object[] steps)
```

Produces an EXPRESSION object representing a filter expression

**Parameters**

- `Object expression` - is an EXPRESSION object
- `Object[] predicates` - are EXPRESSION objects
- `Object[] steps` - are STEP objects

**Returns:** Object

### function(int, Object[]) <a href="#function-2c16049fa829" id="function-2c16049fa829"></a>

```java
public abstract Object function(int code, Object[] args)
```

Produces an EXPRESSION object representing the computation of
 a core function with the supplied arguments.

**Parameters**

- `int code` - is one of FUNCTION_... constants
- `Object[] args` - are EXPRESSION objects

**Returns:** Object

### function(Object, Object[]) <a href="#function-1cc89eb447db" id="function-1cc89eb447db"></a>

```java
public abstract Object function(Object name, Object[] args)
```

Produces an EXPRESSION object representing the computation of
 a library function with the supplied arguments.

**Parameters**

- `Object name` - is a QNAME object (function name)
- `Object[] args` - are EXPRESSION objects

**Returns:** Object

### getKP() <a href="#getkp-45b2f95adae4" id="getkp-45b2f95adae4"></a>

```java
public abstract com.tailf.conf.ConfObject[] getKP()
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2)

### literal(String) <a href="#literal-ad0286a2ebc5" id="literal-ad0286a2ebc5"></a>

```java
public abstract Object literal(String value)
```

Produces an EXPRESSION object that represents a string constant.

**Parameters**

- `String value` - String literal

**Returns:** Object

### locationPath(boolean, Object[]) <a href="#locationpath-62efb77d2c40" id="locationpath-62efb77d2c40"></a>

```java
public abstract Object locationPath(boolean absolute, Object[] steps)
```

Produces an EXPRESSION object representing a location path

**Parameters**

- `boolean absolute` - indicates whether the path is absolute
- `Object[] steps` - are STEP objects

**Returns:** Object

### nodeNameTest(Object) <a href="#nodenametest-d6890d3b8e88" id="nodenametest-d6890d3b8e88"></a>

```java
public abstract Object nodeNameTest(Object qname)
```

Produces a NODE_TEST object that represents a node name test.

**Parameters**

- `Object qname` - is a QNAME object

**Returns:** Object

### nodeTypeTest(int) <a href="#nodetypetest-6d6b838bb52c" id="nodetypetest-6d6b838bb52c"></a>

```java
public abstract Object nodeTypeTest(int nodeType)
```

Produces a NODE_TEST object that represents a node type test.

**Parameters**

- `int nodeType` - is a NODE_TEST object

**Returns:** Object

### number(String) <a href="#number-249f888e69f1" id="number-249f888e69f1"></a>

```java
public abstract Object number(String value)
```

Produces an EXPRESSION object that represents a numeric constant.

**Parameters**

- `String value` - numeric String

**Returns:** Object

### qname(String, String) <a href="#qname-1189e6474a0b" id="qname-1189e6474a0b"></a>

```java
public abstract Object qname(
    String prefix,
    String name
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

Produces an QNAME that represents a name with an optional prefix.

**Parameters**

- `String prefix` - String prefix
- `String name` - String name

**Returns:** Object

### step(int, Object, Object[]) <a href="#step-476841714396" id="step-476841714396"></a>

```java
public abstract Object step(int axis, Object nodeTest, Object[] predicates)
```

Produces a STEP object that represents a node test.

**Parameters**

- `int axis` - is one of the AXIS_... constants
- `Object nodeTest` - is a NODE_TEST object
- `Object[] predicates` - are EXPRESSION objects

**Returns:** Object
