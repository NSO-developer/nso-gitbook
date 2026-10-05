<a id="s-Compiler"></a>
# Compiler

```java
public interface com.tailf.conf.Compiler
```

## Members

**Fields**:

- [AXIS_ANCESTOR](#s-AXIS_ANCESTOR)
- [AXIS_ANCESTOR_OR_SELF](#s-AXIS_ANCESTOR_OR_SELF)
- [AXIS_ATTRIBUTE](#s-AXIS_ATTRIBUTE)
- [AXIS_CHILD](#s-AXIS_CHILD)
- [AXIS_DESCENDANT](#s-AXIS_DESCENDANT)
- [AXIS_DESCENDANT_OR_SELF](#s-AXIS_DESCENDANT_OR_SELF)
- [AXIS_FOLLOWING](#s-AXIS_FOLLOWING)
- [AXIS_FOLLOWING_SIBLING](#s-AXIS_FOLLOWING_SIBLING)
- [AXIS_NAMESPACE](#s-AXIS_NAMESPACE)
- [AXIS_PARENT](#s-AXIS_PARENT)
- [AXIS_PRECEDING](#s-AXIS_PRECEDING)
- [AXIS_PRECEDING_SIBLING](#s-AXIS_PRECEDING_SIBLING)
- [AXIS_SELF](#s-AXIS_SELF)
- [FUNCTION_CURRENT](#s-FUNCTION_CURRENT)
- [NODE_TYPE_COMMENT](#s-NODE_TYPE_COMMENT)
- [NODE_TYPE_NODE](#s-NODE_TYPE_NODE)
- [NODE_TYPE_PI](#s-NODE_TYPE_PI)
- [NODE_TYPE_TEXT](#s-NODE_TYPE_TEXT)

**Methods**:

- [equal(Object, Object)](#s-equal)
- [expressionPath(Object, Object[], Object[])](#s-expressionPath)
- [function(int, Object[])](#s-function)
- [function(Object, Object[])](#s-function-1)
- [getKP()](#s-getKP)
- [literal(String)](#s-literal)
- [locationPath(boolean, Object[])](#s-locationPath)
- [nodeNameTest(Object)](#s-nodeNameTest)
- [nodeTypeTest(int)](#s-nodeTypeTest)
- [number(String)](#s-number)
- [qname(String, String)](#s-qname)
- [step(int, Object, Object[])](#s-step)

## Fields

<a id="s-AXIS_ANCESTOR"></a>
### AXIS_ANCESTOR

```java
public static final int AXIS_ANCESTOR = 4;
```

<a id="s-AXIS_ANCESTOR_OR_SELF"></a>
### AXIS_ANCESTOR_OR_SELF

```java
public static final int AXIS_ANCESTOR_OR_SELF = 10;
```

<a id="s-AXIS_ATTRIBUTE"></a>
### AXIS_ATTRIBUTE

```java
public static final int AXIS_ATTRIBUTE = 5;
```

<a id="s-AXIS_CHILD"></a>
### AXIS_CHILD

```java
public static final int AXIS_CHILD = 2;
```

<a id="s-AXIS_DESCENDANT"></a>
### AXIS_DESCENDANT

```java
public static final int AXIS_DESCENDANT = 9;
```

<a id="s-AXIS_DESCENDANT_OR_SELF"></a>
### AXIS_DESCENDANT_OR_SELF

```java
public static final int AXIS_DESCENDANT_OR_SELF = 13;
```

<a id="s-AXIS_FOLLOWING"></a>
### AXIS_FOLLOWING

```java
public static final int AXIS_FOLLOWING = 8;
```

<a id="s-AXIS_FOLLOWING_SIBLING"></a>
### AXIS_FOLLOWING_SIBLING

```java
public static final int AXIS_FOLLOWING_SIBLING = 11;
```

<a id="s-AXIS_NAMESPACE"></a>
### AXIS_NAMESPACE

```java
public static final int AXIS_NAMESPACE = 6;
```

<a id="s-AXIS_PARENT"></a>
### AXIS_PARENT

```java
public static final int AXIS_PARENT = 3;
```

<a id="s-AXIS_PRECEDING"></a>
### AXIS_PRECEDING

```java
public static final int AXIS_PRECEDING = 7;
```

<a id="s-AXIS_PRECEDING_SIBLING"></a>
### AXIS_PRECEDING_SIBLING

```java
public static final int AXIS_PRECEDING_SIBLING = 12;
```

<a id="s-AXIS_SELF"></a>
### AXIS_SELF

```java
public static final int AXIS_SELF = 1;
```

<a id="s-FUNCTION_CURRENT"></a>
### FUNCTION_CURRENT

```java
public static final int FUNCTION_CURRENT = 1;
```

<a id="s-NODE_TYPE_COMMENT"></a>
### NODE_TYPE_COMMENT

```java
public static final int NODE_TYPE_COMMENT = 3;
```

<a id="s-NODE_TYPE_NODE"></a>
### NODE_TYPE_NODE

```java
public static final int NODE_TYPE_NODE = 1;
```

<a id="s-NODE_TYPE_PI"></a>
### NODE_TYPE_PI

```java
public static final int NODE_TYPE_PI = 4;
```

<a id="s-NODE_TYPE_TEXT"></a>
### NODE_TYPE_TEXT

```java
public static final int NODE_TYPE_TEXT = 2;
```


## Methods

<a id="s-equal"></a>
### equal(Object, Object)

```java
public abstract Object equal(Object left, Object right) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

Produces an EXPRESSION object representing the comparison:
 *left* equals to *right*

**Parameters**

- `Object left` - is an EXPRESSION object
- `Object right` - is an EXPRESSION object

**Returns:** Object

<a id="s-expressionPath"></a>
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

<a id="s-function"></a>
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

<a id="s-function-1"></a>
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

<a id="s-getKP"></a>
### getKP()

```java
public abstract com.tailf.conf.ConfObject[] getKP()
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

<a id="s-literal"></a>
### literal(String)

```java
public abstract Object literal(String value)
```

Produces an EXPRESSION object that represents a string constant.

**Parameters**

- `String value` - String literal

**Returns:** Object

<a id="s-locationPath"></a>
### locationPath(boolean, Object[])

```java
public abstract Object locationPath(boolean absolute, Object[] steps)
```

Produces an EXPRESSION object representing a location path

**Parameters**

- `boolean absolute` - indicates whether the path is absolute
- `Object[] steps` - are STEP objects

**Returns:** Object

<a id="s-nodeNameTest"></a>
### nodeNameTest(Object)

```java
public abstract Object nodeNameTest(Object qname)
```

Produces a NODE_TEST object that represents a node name test.

**Parameters**

- `Object qname` - is a QNAME object

**Returns:** Object

<a id="s-nodeTypeTest"></a>
### nodeTypeTest(int)

```java
public abstract Object nodeTypeTest(int nodeType)
```

Produces a NODE_TEST object that represents a node type test.

**Parameters**

- `int nodeType` - is a NODE_TEST object

**Returns:** Object

<a id="s-number"></a>
### number(String)

```java
public abstract Object number(String value)
```

Produces an EXPRESSION object that represents a numeric constant.

**Parameters**

- `String value` - numeric String

**Returns:** Object

<a id="s-qname"></a>
### qname(String, String)

```java
public abstract Object qname(
    String prefix,
    String name
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](ConfException.md#s-ConfException)

Produces an QNAME that represents a name with an optional prefix.

**Parameters**

- `String prefix` - String prefix
- `String name` - String name

**Returns:** Object

<a id="s-step"></a>
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
