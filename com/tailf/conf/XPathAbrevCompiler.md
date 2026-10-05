# XPathAbrevCompiler <a href="#cls-XPathAbrevCompiler" id="cls-XPathAbrevCompiler"></a>

```java
public class com.tailf.conf.XPathAbrevCompiler
    implements com.tailf.conf.Compiler
```

Types: [Compiler](Compiler.md#cls-Compiler)

## Members

**Constructors**:

- [XPathAbrevCompiler(MountIdInterface)](#m-XPathAbrevCompiler-ad338abd9ed9)

**Fields**:

- [AXIS_ANCESTOR](Compiler.md#m-AXIS_ANCESTOR) from Compiler
- [AXIS_ANCESTOR_OR_SELF](Compiler.md#m-AXIS_ANCESTOR_OR_SELF) from Compiler
- [AXIS_ATTRIBUTE](Compiler.md#m-AXIS_ATTRIBUTE) from Compiler
- [AXIS_CHILD](Compiler.md#m-AXIS_CHILD) from Compiler
- [AXIS_DESCENDANT](Compiler.md#m-AXIS_DESCENDANT) from Compiler
- [AXIS_DESCENDANT_OR_SELF](Compiler.md#m-AXIS_DESCENDANT_OR_SELF) from Compiler
- [AXIS_FOLLOWING](Compiler.md#m-AXIS_FOLLOWING) from Compiler
- [AXIS_FOLLOWING_SIBLING](Compiler.md#m-AXIS_FOLLOWING_SIBLING) from Compiler
- [AXIS_NAMESPACE](Compiler.md#m-AXIS_NAMESPACE) from Compiler
- [AXIS_PARENT](Compiler.md#m-AXIS_PARENT) from Compiler
- [AXIS_PRECEDING](Compiler.md#m-AXIS_PRECEDING) from Compiler
- [AXIS_PRECEDING_SIBLING](Compiler.md#m-AXIS_PRECEDING_SIBLING) from Compiler
- [AXIS_SELF](Compiler.md#m-AXIS_SELF) from Compiler
- [FUNCTION_CURRENT](Compiler.md#m-FUNCTION_CURRENT) from Compiler
- [NODE_TYPE_COMMENT](Compiler.md#m-NODE_TYPE_COMMENT) from Compiler
- [NODE_TYPE_NODE](Compiler.md#m-NODE_TYPE_NODE) from Compiler
- [NODE_TYPE_PI](Compiler.md#m-NODE_TYPE_PI) from Compiler
- [NODE_TYPE_TEXT](Compiler.md#m-NODE_TYPE_TEXT) from Compiler

**Methods**:

- [addKeys(CSNode, XPathTag, ConfNamespace)](#m-addKeys-81beca2ad90e)
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

## Constructors

### XPathAbrevCompiler(MountIdInterface) <a href="#m-XPathAbrevCompiler-ad338abd9ed9" id="m-XPathAbrevCompiler-ad338abd9ed9"></a>

```java
public XPathAbrevCompiler(com.tailf.conf.MountIdInterface mountGetter)
```

Types: [MountIdInterface](MountIdInterface.md#cls-MountIdInterface)

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter`


## Methods

### addKeys(CSNode, XPathTag, ConfNamespace) <a href="#m-addKeys-81beca2ad90e" id="m-addKeys-81beca2ad90e"></a>

```java
public void addKeys(
    com.tailf.maapi.MaapiSchemas.CSNode current,
    com.tailf.conf.XPathAbrevCompiler.XPathTag tag,
    com.tailf.conf.ConfNamespace ns
)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [ConfNamespace](ConfNamespace.md#cls-ConfNamespace)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode current`
- `com.tailf.conf.XPathAbrevCompiler.XPathTag tag`
- `com.tailf.conf.ConfNamespace ns`

### equal(Object, Object) <a href="#m-equal-799a2136c547" id="m-equal-799a2136c547"></a>

```java
public Object equal(Object left, Object right) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `Object left`
- `Object right`

### expressionPath(Object, Object[], Object[]) <a href="#m-expressionPath-5bf270c9d4c4" id="m-expressionPath-5bf270c9d4c4"></a>

```java
public Object expressionPath(Object expression, Object[] predicates, Object[] steps)
```

**Parameters**

- `Object expression`
- `Object[] predicates`
- `Object[] steps`

### function(int, Object[]) <a href="#m-function-2c16049fa829" id="m-function-2c16049fa829"></a>

```java
public Object function(int code, Object[] args)
```

**Parameters**

- `int code`
- `Object[] args`

### function(Object, Object[]) <a href="#m-function-1cc89eb447db" id="m-function-1cc89eb447db"></a>

```java
public Object function(Object name, Object[] args)
```

**Parameters**

- `Object name`
- `Object[] args`

### getKP() <a href="#m-getKP-45b2f95adae4" id="m-getKP-45b2f95adae4"></a>

```java
public com.tailf.conf.ConfObject[] getKP()
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

### literal(String) <a href="#m-literal-ad0286a2ebc5" id="m-literal-ad0286a2ebc5"></a>

```java
public Object literal(String value)
```

**Parameters**

- `String value`

### locationPath(boolean, Object[]) <a href="#m-locationPath-62efb77d2c40" id="m-locationPath-62efb77d2c40"></a>

```java
public Object locationPath(boolean absolute, Object[] steps)
```

**Parameters**

- `boolean absolute`
- `Object[] steps`

### nodeNameTest(Object) <a href="#m-nodeNameTest-d6890d3b8e88" id="m-nodeNameTest-d6890d3b8e88"></a>

```java
public Object nodeNameTest(Object qname)
```

**Parameters**

- `Object qname`

### nodeTypeTest(int) <a href="#m-nodeTypeTest-6d6b838bb52c" id="m-nodeTypeTest-6d6b838bb52c"></a>

```java
public Object nodeTypeTest(int nodeType)
```

**Parameters**

- `int nodeType`

### number(String) <a href="#m-number-249f888e69f1" id="m-number-249f888e69f1"></a>

```java
public Object number(String value)
```

**Parameters**

- `String value`

### qname(String, String) <a href="#m-qname-1189e6474a0b" id="m-qname-1189e6474a0b"></a>

```java
public Object qname(
    String prefix,
    String tagName
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `String prefix`
- `String tagName`

### step(int, Object, Object[]) <a href="#m-step-476841714396" id="m-step-476841714396"></a>

```java
public Object step(int axis, Object nodeTest, Object[] predicates)
```

**Parameters**

- `int axis`
- `Object nodeTest`
- `Object[] predicates`
