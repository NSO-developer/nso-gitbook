<a id="cls-Compiler"></a>
# Compiler

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
- [expressionPath(Object, Object[], Object[])](#m-expressionpath-5bf270c9d4c4)
- [function(int, Object[])](#m-function-2c16049fa829)
- [function(Object, Object[])](#m-function-1cc89eb447db)
- [getKP()](#m-getkp-45b2f95adae4)
- [literal(String)](#m-literal-ad0286a2ebc5)
- [locationPath(boolean, Object[])](#m-locationpath-62efb77d2c40)
- [nodeNameTest(Object)](#m-nodenametest-d6890d3b8e88)
- [nodeTypeTest(int)](#m-nodetypetest-6d6b838bb52c)
- [number(String)](#m-number-249f888e69f1)
- [qname(String, String)](#m-qname-1189e6474a0b)
- [step(int, Object, Object[])](#m-step-476841714396)

## Fields

<a id="m-AXIS_ANCESTOR"></a>
### AXIS_ANCESTOR

```java
public static final int AXIS_ANCESTOR = 4;
```

<a id="m-AXIS_ANCESTOR_OR_SELF"></a>
### AXIS_ANCESTOR_OR_SELF

```java
public static final int AXIS_ANCESTOR_OR_SELF = 10;
```

<a id="m-AXIS_ATTRIBUTE"></a>
### AXIS_ATTRIBUTE

```java
public static final int AXIS_ATTRIBUTE = 5;
```

<a id="m-AXIS_CHILD"></a>
### AXIS_CHILD

```java
public static final int AXIS_CHILD = 2;
```

<a id="m-AXIS_DESCENDANT"></a>
### AXIS_DESCENDANT

```java
public static final int AXIS_DESCENDANT = 9;
```

<a id="m-AXIS_DESCENDANT_OR_SELF"></a>
### AXIS_DESCENDANT_OR_SELF

```java
public static final int AXIS_DESCENDANT_OR_SELF = 13;
```

<a id="m-AXIS_FOLLOWING"></a>
### AXIS_FOLLOWING

```java
public static final int AXIS_FOLLOWING = 8;
```

<a id="m-AXIS_FOLLOWING_SIBLING"></a>
### AXIS_FOLLOWING_SIBLING

```java
public static final int AXIS_FOLLOWING_SIBLING = 11;
```

<a id="m-AXIS_NAMESPACE"></a>
### AXIS_NAMESPACE

```java
public static final int AXIS_NAMESPACE = 6;
```

<a id="m-AXIS_PARENT"></a>
### AXIS_PARENT

```java
public static final int AXIS_PARENT = 3;
```

<a id="m-AXIS_PRECEDING"></a>
### AXIS_PRECEDING

```java
public static final int AXIS_PRECEDING = 7;
```

<a id="m-AXIS_PRECEDING_SIBLING"></a>
### AXIS_PRECEDING_SIBLING

```java
public static final int AXIS_PRECEDING_SIBLING = 12;
```

<a id="m-AXIS_SELF"></a>
### AXIS_SELF

```java
public static final int AXIS_SELF = 1;
```

<a id="m-FUNCTION_CURRENT"></a>
### FUNCTION_CURRENT

```java
public static final int FUNCTION_CURRENT = 1;
```

<a id="m-NODE_TYPE_COMMENT"></a>
### NODE_TYPE_COMMENT

```java
public static final int NODE_TYPE_COMMENT = 3;
```

<a id="m-NODE_TYPE_NODE"></a>
### NODE_TYPE_NODE

```java
public static final int NODE_TYPE_NODE = 1;
```

<a id="m-NODE_TYPE_PI"></a>
### NODE_TYPE_PI

```java
public static final int NODE_TYPE_PI = 4;
```

<a id="m-NODE_TYPE_TEXT"></a>
### NODE_TYPE_TEXT

```java
public static final int NODE_TYPE_TEXT = 2;
```


## Methods

<a id="m-equal-799a2136c547"></a>
### equal(Object, Object)

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

<a id="m-expressionpath-5bf270c9d4c4"></a>
### expressionPath(Object, Object[], Object[])

```java
public abstract Object expressionPath(Object expression, Object[] predicates, Object[] steps)
```

Produces an EXPRESSION object representing a filter expression

**Parameters**

- `Object expression` - is an EXPRESSION object
- `Object[] predicates` - are EXPRESSION objects
- `Object[] steps` - are STEP objects

**Returns:** Object

<a id="m-function-2c16049fa829"></a>
### function(int, Object[])

```java
public abstract Object function(int code, Object[] args)
```

Produces an EXPRESSION object representing the computation of
 a core function with the supplied arguments.

**Parameters**

- `int code` - is one of FUNCTION_... constants
- `Object[] args` - are EXPRESSION objects

**Returns:** Object

<a id="m-function-1cc89eb447db"></a>
### function(Object, Object[])

```java
public abstract Object function(Object name, Object[] args)
```

Produces an EXPRESSION object representing the computation of
 a library function with the supplied arguments.

**Parameters**

- `Object name` - is a QNAME object (function name)
- `Object[] args` - are EXPRESSION objects

**Returns:** Object

<a id="m-getkp-45b2f95adae4"></a>
### getKP()

```java
public abstract com.tailf.conf.ConfObject[] getKP()
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

<a id="m-literal-ad0286a2ebc5"></a>
### literal(String)

```java
public abstract Object literal(String value)
```

Produces an EXPRESSION object that represents a string constant.

**Parameters**

- `String value` - String literal

**Returns:** Object

<a id="m-locationpath-62efb77d2c40"></a>
### locationPath(boolean, Object[])

```java
public abstract Object locationPath(boolean absolute, Object[] steps)
```

Produces an EXPRESSION object representing a location path

**Parameters**

- `boolean absolute` - indicates whether the path is absolute
- `Object[] steps` - are STEP objects

**Returns:** Object

<a id="m-nodenametest-d6890d3b8e88"></a>
### nodeNameTest(Object)

```java
public abstract Object nodeNameTest(Object qname)
```

Produces a NODE_TEST object that represents a node name test.

**Parameters**

- `Object qname` - is a QNAME object

**Returns:** Object

<a id="m-nodetypetest-6d6b838bb52c"></a>
### nodeTypeTest(int)

```java
public abstract Object nodeTypeTest(int nodeType)
```

Produces a NODE_TEST object that represents a node type test.

**Parameters**

- `int nodeType` - is a NODE_TEST object

**Returns:** Object

<a id="m-number-249f888e69f1"></a>
### number(String)

```java
public abstract Object number(String value)
```

Produces an EXPRESSION object that represents a numeric constant.

**Parameters**

- `String value` - numeric String

**Returns:** Object

<a id="m-qname-1189e6474a0b"></a>
### qname(String, String)

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

<a id="m-step-476841714396"></a>
### step(int, Object, Object[])

```java
public abstract Object step(int axis, Object nodeTest, Object[] predicates)
```

Produces a STEP object that represents a node test.

**Parameters**

- `int axis` - is one of the AXIS_... constants
- `Object nodeTest` - is a NODE_TEST object
- `Object[] predicates` - are EXPRESSION objects

**Returns:** Object
