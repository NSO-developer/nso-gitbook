# MyCompiler <a href="#mycompiler-143644d69d61" id="mycompiler-143644d69d61"></a>

```java
public static class com.tailf.conf.dbg.XPathAbrevGrammar.MyCompiler
    implements com.tailf.conf.Compiler
```

Types: [Compiler](../../Compiler.md#compiler-552d3a56b931)

## Members

**Constructors**:

- [MyCompiler\(\)](#mycompiler-f3bd14588ccc)

**Fields**:

- [AXIS\_ANCESTOR](../../Compiler.md#axis_ancestor-62c59dd9b2e3) from Compiler
- [AXIS\_ANCESTOR\_OR\_SELF](../../Compiler.md#axis_ancestor_or_self-8a86e8f77b65) from Compiler
- [AXIS\_ATTRIBUTE](../../Compiler.md#axis_attribute-a05946445c05) from Compiler
- [AXIS\_CHILD](../../Compiler.md#axis_child-b30db2353719) from Compiler
- [AXIS\_DESCENDANT](../../Compiler.md#axis_descendant-15e7b43dd049) from Compiler
- [AXIS\_DESCENDANT\_OR\_SELF](../../Compiler.md#axis_descendant_or_self-9f6c29a66ab9) from Compiler
- [AXIS\_FOLLOWING](../../Compiler.md#axis_following-a1c4549e0b7e) from Compiler
- [AXIS\_FOLLOWING\_SIBLING](../../Compiler.md#axis_following_sibling-15c026a27921) from Compiler
- [AXIS\_NAMESPACE](../../Compiler.md#axis_namespace-fca116cb0837) from Compiler
- [AXIS\_PARENT](../../Compiler.md#axis_parent-a46c866285ba) from Compiler
- [AXIS\_PRECEDING](../../Compiler.md#axis_preceding-928fdaa9975d) from Compiler
- [AXIS\_PRECEDING\_SIBLING](../../Compiler.md#axis_preceding_sibling-d98b9bd3ec33) from Compiler
- [AXIS\_SELF](../../Compiler.md#axis_self-e8df13365b56) from Compiler
- [FUNCTION\_CURRENT](../../Compiler.md#function_current-756d70c6837c) from Compiler
- [NODE\_TYPE\_COMMENT](../../Compiler.md#node_type_comment-08560091555e) from Compiler
- [NODE\_TYPE\_NODE](../../Compiler.md#node_type_node-bcd5091e1f2c) from Compiler
- [NODE\_TYPE\_PI](../../Compiler.md#node_type_pi-b3d41de190bb) from Compiler
- [NODE\_TYPE\_TEXT](../../Compiler.md#node_type_text-be2adb978305) from Compiler

**Methods**:

- [equal\(Object, Object\)](#equal-799a2136c547)
- [expressionPath\(Object, Object\[\], Object\[\]\)](#expressionpath-5bf270c9d4c4)
- [function\(int, Object\[\]\)](#function-2c16049fa829)
- [function\(Object, Object\[\]\)](#function-1cc89eb447db)
- [getKP\(\)](#getkp-45b2f95adae4)
- [literal\(String\)](#literal-ad0286a2ebc5)
- [locationPath\(boolean, Object\[\]\)](#locationpath-62efb77d2c40)
- [nodeNameTest\(Object\)](#nodenametest-d6890d3b8e88)
- [nodeTypeTest\(int\)](#nodetypetest-6d6b838bb52c)
- [number\(String\)](#number-249f888e69f1)
- [qname\(String, String\)](#qname-1189e6474a0b)
- [step\(int, Object, Object\[\]\)](#step-476841714396)

## Constructors

### MyCompiler() <a href="#mycompiler-f3bd14588ccc" id="mycompiler-f3bd14588ccc"></a>

```java
public MyCompiler()
```


## Methods

### equal(Object, Object) <a href="#equal-799a2136c547" id="equal-799a2136c547"></a>

```java
public Object equal(Object left, Object right)
```

*Description from* [`Compiler.equal(Object, Object)`](../../Compiler.md#equal-799a2136c547)

Produces an EXPRESSION object representing the comparison:
 *left* equals to *right*

**Parameters**

- `Object left` - is an EXPRESSION object
- `Object right` - is an EXPRESSION object

**Returns:** Object

### expressionPath(Object, Object[], Object[]) <a href="#expressionpath-5bf270c9d4c4" id="expressionpath-5bf270c9d4c4"></a>

```java
public Object expressionPath(Object expression, Object[] predicates, Object[] steps)
```

*Description from* [`Compiler.expressionPath(Object, Object[], Object[])`](../../Compiler.md#expressionpath-5bf270c9d4c4)

Produces an EXPRESSION object representing a filter expression

**Parameters**

- `Object expression` - is an EXPRESSION object
- `Object[] predicates` - are EXPRESSION objects
- `Object[] steps` - are STEP objects

**Returns:** Object

### function(int, Object[]) <a href="#function-2c16049fa829" id="function-2c16049fa829"></a>

```java
public Object function(int code, Object[] args)
```

*Description from* [`Compiler.function(int, Object[])`](../../Compiler.md#function-2c16049fa829)

Produces an EXPRESSION object representing the computation of
 a core function with the supplied arguments.

**Parameters**

- `int code` - is one of FUNCTION\_... constants
- `Object[] args` - are EXPRESSION objects

**Returns:** Object

### function(Object, Object[]) <a href="#function-1cc89eb447db" id="function-1cc89eb447db"></a>

```java
public Object function(Object name, Object[] args)
```

*Description from* [`Compiler.function(Object, Object[])`](../../Compiler.md#function-1cc89eb447db)

Produces an EXPRESSION object representing the computation of
 a library function with the supplied arguments.

**Parameters**

- `Object name` - is a QNAME object (function name)
- `Object[] args` - are EXPRESSION objects

**Returns:** Object

### getKP() <a href="#getkp-45b2f95adae4" id="getkp-45b2f95adae4"></a>

```java
public com.tailf.conf.ConfObject[] getKP()
```

Types: [ConfObject](../../ConfObject.md#confobject-5433616953b2)

### literal(String) <a href="#literal-ad0286a2ebc5" id="literal-ad0286a2ebc5"></a>

```java
public Object literal(String value)
```

*Description from* [`Compiler.literal(String)`](../../Compiler.md#literal-ad0286a2ebc5)

Produces an EXPRESSION object that represents a string constant.

**Parameters**

- `String value` - String literal

**Returns:** Object

### locationPath(boolean, Object[]) <a href="#locationpath-62efb77d2c40" id="locationpath-62efb77d2c40"></a>

```java
public Object locationPath(boolean absolute, Object[] steps)
```

*Description from* [`Compiler.locationPath(boolean, Object[])`](../../Compiler.md#locationpath-62efb77d2c40)

Produces an EXPRESSION object representing a location path

**Parameters**

- `boolean absolute` - indicates whether the path is absolute
- `Object[] steps` - are STEP objects

**Returns:** Object

### nodeNameTest(Object) <a href="#nodenametest-d6890d3b8e88" id="nodenametest-d6890d3b8e88"></a>

```java
public Object nodeNameTest(Object qname)
```

*Description from* [`Compiler.nodeNameTest(Object)`](../../Compiler.md#nodenametest-d6890d3b8e88)

Produces a NODE_TEST object that represents a node name test.

**Parameters**

- `Object qname` - is a QNAME object

**Returns:** Object

### nodeTypeTest(int) <a href="#nodetypetest-6d6b838bb52c" id="nodetypetest-6d6b838bb52c"></a>

```java
public Object nodeTypeTest(int nodeType)
```

*Description from* [`Compiler.nodeTypeTest(int)`](../../Compiler.md#nodetypetest-6d6b838bb52c)

Produces a NODE_TEST object that represents a node type test.

**Parameters**

- `int nodeType` - is a NODE_TEST object

**Returns:** Object

### number(String) <a href="#number-249f888e69f1" id="number-249f888e69f1"></a>

```java
public Object number(String value)
```

*Description from* [`Compiler.number(String)`](../../Compiler.md#number-249f888e69f1)

Produces an EXPRESSION object that represents a numeric constant.

**Parameters**

- `String value` - numeric String

**Returns:** Object

### qname(String, String) <a href="#qname-1189e6474a0b" id="qname-1189e6474a0b"></a>

```java
public Object qname(String prefix, String name)
```

*Description from* [`Compiler.qname(String, String)`](../../Compiler.md#qname-1189e6474a0b)

Produces an QNAME that represents a name with an optional prefix.

**Parameters**

- `String prefix` - String prefix
- `String name` - String name

**Returns:** Object

### step(int, Object, Object[]) <a href="#step-476841714396" id="step-476841714396"></a>

```java
public Object step(int axis, Object nodeTest, Object[] predicates)
```

*Description from* [`Compiler.step(int, Object, Object[])`](../../Compiler.md#step-476841714396)

Produces a STEP object that represents a node test.

**Parameters**

- `int axis` - is one of the AXIS\_... constants
- `Object nodeTest` - is a NODE_TEST object
- `Object[] predicates` - are EXPRESSION objects

**Returns:** Object
