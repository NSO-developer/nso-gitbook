# Compiler <a href="#cls-Compiler" id="cls-Compiler"></a>

```java
public interface com.tailf.conf.Compiler
```

## Members

**Fields**:

- [AXIS_ANCESTOR](#m-AXIS_ANCESTOR)
- [AXIS_ANCESTOR_OR_SELF](#m-AXIS_ANCESTOR_OR_SELF)
- [AXIS_ATTRIBUTE](#m-AXIS_ATTRIBUTE)
- [AXIS_CHILD](#m-AXIS_CHILD)
- [AXIS_DESCENDANT](#m-AXIS_DESCENDANT)
- [AXIS_DESCENDANT_OR_SELF](#m-AXIS_DESCENDANT_OR_SELF)
- [AXIS_FOLLOWING](#m-AXIS_FOLLOWING)
- [AXIS_FOLLOWING_SIBLING](#m-AXIS_FOLLOWING_SIBLING)
- [AXIS_NAMESPACE](#m-AXIS_NAMESPACE)
- [AXIS_PARENT](#m-AXIS_PARENT)
- [AXIS_PRECEDING](#m-AXIS_PRECEDING)
- [AXIS_PRECEDING_SIBLING](#m-AXIS_PRECEDING_SIBLING)
- [AXIS_SELF](#m-AXIS_SELF)
- [FUNCTION_CURRENT](#m-FUNCTION_CURRENT)
- [NODE_TYPE_COMMENT](#m-NODE_TYPE_COMMENT)
- [NODE_TYPE_NODE](#m-NODE_TYPE_NODE)
- [NODE_TYPE_PI](#m-NODE_TYPE_PI)
- [NODE_TYPE_TEXT](#m-NODE_TYPE_TEXT)

**Methods**:

- [equal(Object, Object)](#m-equal-799a2136c547)
- [expressionPath(Object, Object[], Object[])](#m-expressionPath-5bf270c9d4c4)
- [function(int, Object[])](#m-function-2c16049fa829)
- [function(Object, Object[])](#m-function-1cc89eb447db)
- [getKP()](#m-getKP-45b2f95adae4)
- [literal(String)](#m-literal-ad0286a2ebc5)
- [locationPath(boolean, Object[])](#m-locationPath-62efb77d2c40)
- [nodeNameTest(Object)](#m-nodeNameTest-d6890d3b8e88)
- [nodeTypeTest(int)](#m-nodeTypeTest-6d6b838bb52c)
- [number(String)](#m-number-249f888e69f1)
- [qname(String, String)](#m-qname-1189e6474a0b)
- [step(int, Object, Object[])](#m-step-476841714396)

## Fields

### AXIS_ANCESTOR <a href="#m-AXIS_ANCESTOR" id="m-AXIS_ANCESTOR"></a>

```java
public static final int AXIS_ANCESTOR = 4;
```

### AXIS_ANCESTOR_OR_SELF <a href="#m-AXIS_ANCESTOR_OR_SELF" id="m-AXIS_ANCESTOR_OR_SELF"></a>

```java
public static final int AXIS_ANCESTOR_OR_SELF = 10;
```

### AXIS_ATTRIBUTE <a href="#m-AXIS_ATTRIBUTE" id="m-AXIS_ATTRIBUTE"></a>

```java
public static final int AXIS_ATTRIBUTE = 5;
```

### AXIS_CHILD <a href="#m-AXIS_CHILD" id="m-AXIS_CHILD"></a>

```java
public static final int AXIS_CHILD = 2;
```

### AXIS_DESCENDANT <a href="#m-AXIS_DESCENDANT" id="m-AXIS_DESCENDANT"></a>

```java
public static final int AXIS_DESCENDANT = 9;
```

### AXIS_DESCENDANT_OR_SELF <a href="#m-AXIS_DESCENDANT_OR_SELF" id="m-AXIS_DESCENDANT_OR_SELF"></a>

```java
public static final int AXIS_DESCENDANT_OR_SELF = 13;
```

### AXIS_FOLLOWING <a href="#m-AXIS_FOLLOWING" id="m-AXIS_FOLLOWING"></a>

```java
public static final int AXIS_FOLLOWING = 8;
```

### AXIS_FOLLOWING_SIBLING <a href="#m-AXIS_FOLLOWING_SIBLING" id="m-AXIS_FOLLOWING_SIBLING"></a>

```java
public static final int AXIS_FOLLOWING_SIBLING = 11;
```

### AXIS_NAMESPACE <a href="#m-AXIS_NAMESPACE" id="m-AXIS_NAMESPACE"></a>

```java
public static final int AXIS_NAMESPACE = 6;
```

### AXIS_PARENT <a href="#m-AXIS_PARENT" id="m-AXIS_PARENT"></a>

```java
public static final int AXIS_PARENT = 3;
```

### AXIS_PRECEDING <a href="#m-AXIS_PRECEDING" id="m-AXIS_PRECEDING"></a>

```java
public static final int AXIS_PRECEDING = 7;
```

### AXIS_PRECEDING_SIBLING <a href="#m-AXIS_PRECEDING_SIBLING" id="m-AXIS_PRECEDING_SIBLING"></a>

```java
public static final int AXIS_PRECEDING_SIBLING = 12;
```

### AXIS_SELF <a href="#m-AXIS_SELF" id="m-AXIS_SELF"></a>

```java
public static final int AXIS_SELF = 1;
```

### FUNCTION_CURRENT <a href="#m-FUNCTION_CURRENT" id="m-FUNCTION_CURRENT"></a>

```java
public static final int FUNCTION_CURRENT = 1;
```

### NODE_TYPE_COMMENT <a href="#m-NODE_TYPE_COMMENT" id="m-NODE_TYPE_COMMENT"></a>

```java
public static final int NODE_TYPE_COMMENT = 3;
```

### NODE_TYPE_NODE <a href="#m-NODE_TYPE_NODE" id="m-NODE_TYPE_NODE"></a>

```java
public static final int NODE_TYPE_NODE = 1;
```

### NODE_TYPE_PI <a href="#m-NODE_TYPE_PI" id="m-NODE_TYPE_PI"></a>

```java
public static final int NODE_TYPE_PI = 4;
```

### NODE_TYPE_TEXT <a href="#m-NODE_TYPE_TEXT" id="m-NODE_TYPE_TEXT"></a>

```java
public static final int NODE_TYPE_TEXT = 2;
```


## Methods

### equal(Object, Object) <a href="#m-equal-799a2136c547" id="m-equal-799a2136c547"></a>

```java
public abstract Object equal(Object left, Object right) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Produces an EXPRESSION object representing the comparison:
 *left* equals to *right*

**Parameters**

- `Object left` - is an EXPRESSION object
- `Object right` - is an EXPRESSION object

**Returns:** Object

### expressionPath(Object, Object[], Object[]) <a href="#m-expressionPath-5bf270c9d4c4" id="m-expressionPath-5bf270c9d4c4"></a>

```java
public abstract Object expressionPath(Object expression, Object[] predicates, Object[] steps)
```

Produces an EXPRESSION object representing a filter expression

**Parameters**

- `Object expression` - is an EXPRESSION object
- `Object[] predicates` - are EXPRESSION objects
- `Object[] steps` - are STEP objects

**Returns:** Object

### function(int, Object[]) <a href="#m-function-2c16049fa829" id="m-function-2c16049fa829"></a>

```java
public abstract Object function(int code, Object[] args)
```

Produces an EXPRESSION object representing the computation of
 a core function with the supplied arguments.

**Parameters**

- `int code` - is one of FUNCTION_... constants
- `Object[] args` - are EXPRESSION objects

**Returns:** Object

### function(Object, Object[]) <a href="#m-function-1cc89eb447db" id="m-function-1cc89eb447db"></a>

```java
public abstract Object function(Object name, Object[] args)
```

Produces an EXPRESSION object representing the computation of
 a library function with the supplied arguments.

**Parameters**

- `Object name` - is a QNAME object (function name)
- `Object[] args` - are EXPRESSION objects

**Returns:** Object

### getKP() <a href="#m-getKP-45b2f95adae4" id="m-getKP-45b2f95adae4"></a>

```java
public abstract com.tailf.conf.ConfObject[] getKP()
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

### literal(String) <a href="#m-literal-ad0286a2ebc5" id="m-literal-ad0286a2ebc5"></a>

```java
public abstract Object literal(String value)
```

Produces an EXPRESSION object that represents a string constant.

**Parameters**

- `String value` - String literal

**Returns:** Object

### locationPath(boolean, Object[]) <a href="#m-locationPath-62efb77d2c40" id="m-locationPath-62efb77d2c40"></a>

```java
public abstract Object locationPath(boolean absolute, Object[] steps)
```

Produces an EXPRESSION object representing a location path

**Parameters**

- `boolean absolute` - indicates whether the path is absolute
- `Object[] steps` - are STEP objects

**Returns:** Object

### nodeNameTest(Object) <a href="#m-nodeNameTest-d6890d3b8e88" id="m-nodeNameTest-d6890d3b8e88"></a>

```java
public abstract Object nodeNameTest(Object qname)
```

Produces a NODE_TEST object that represents a node name test.

**Parameters**

- `Object qname` - is a QNAME object

**Returns:** Object

### nodeTypeTest(int) <a href="#m-nodeTypeTest-6d6b838bb52c" id="m-nodeTypeTest-6d6b838bb52c"></a>

```java
public abstract Object nodeTypeTest(int nodeType)
```

Produces a NODE_TEST object that represents a node type test.

**Parameters**

- `int nodeType` - is a NODE_TEST object

**Returns:** Object

### number(String) <a href="#m-number-249f888e69f1" id="m-number-249f888e69f1"></a>

```java
public abstract Object number(String value)
```

Produces an EXPRESSION object that represents a numeric constant.

**Parameters**

- `String value` - numeric String

**Returns:** Object

### qname(String, String) <a href="#m-qname-1189e6474a0b" id="m-qname-1189e6474a0b"></a>

```java
public abstract Object qname(
    String prefix,
    String name
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Produces an QNAME that represents a name with an optional prefix.

**Parameters**

- `String prefix` - String prefix
- `String name` - String name

**Returns:** Object

### step(int, Object, Object[]) <a href="#m-step-476841714396" id="m-step-476841714396"></a>

```java
public abstract Object step(int axis, Object nodeTest, Object[] predicates)
```

Produces a STEP object that represents a node test.

**Parameters**

- `int axis` - is one of the AXIS_... constants
- `Object nodeTest` - is a NODE_TEST object
- `Object[] predicates` - are EXPRESSION objects

**Returns:** Object
