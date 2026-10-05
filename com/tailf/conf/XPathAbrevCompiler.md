<a id="s-XPathAbrevCompiler"></a>
# XPathAbrevCompiler

```java
public class com.tailf.conf.XPathAbrevCompiler
    implements com.tailf.conf.Compiler
```

Types: [Compiler](Compiler.md#s-Compiler)

## Members

**Constructors**:

- [XPathAbrevCompiler(MountIdInterface)](#s-XPathAbrevCompiler-1)

**Fields**:

- [AXIS_ANCESTOR](Compiler.md#s-AXIS_ANCESTOR) from Compiler
- [AXIS_ANCESTOR_OR_SELF](Compiler.md#s-AXIS_ANCESTOR_OR_SELF) from Compiler
- [AXIS_ATTRIBUTE](Compiler.md#s-AXIS_ATTRIBUTE) from Compiler
- [AXIS_CHILD](Compiler.md#s-AXIS_CHILD) from Compiler
- [AXIS_DESCENDANT](Compiler.md#s-AXIS_DESCENDANT) from Compiler
- [AXIS_DESCENDANT_OR_SELF](Compiler.md#s-AXIS_DESCENDANT_OR_SELF) from Compiler
- [AXIS_FOLLOWING](Compiler.md#s-AXIS_FOLLOWING) from Compiler
- [AXIS_FOLLOWING_SIBLING](Compiler.md#s-AXIS_FOLLOWING_SIBLING) from Compiler
- [AXIS_NAMESPACE](Compiler.md#s-AXIS_NAMESPACE) from Compiler
- [AXIS_PARENT](Compiler.md#s-AXIS_PARENT) from Compiler
- [AXIS_PRECEDING](Compiler.md#s-AXIS_PRECEDING) from Compiler
- [AXIS_PRECEDING_SIBLING](Compiler.md#s-AXIS_PRECEDING_SIBLING) from Compiler
- [AXIS_SELF](Compiler.md#s-AXIS_SELF) from Compiler
- [FUNCTION_CURRENT](Compiler.md#s-FUNCTION_CURRENT) from Compiler
- [NODE_TYPE_COMMENT](Compiler.md#s-NODE_TYPE_COMMENT) from Compiler
- [NODE_TYPE_NODE](Compiler.md#s-NODE_TYPE_NODE) from Compiler
- [NODE_TYPE_PI](Compiler.md#s-NODE_TYPE_PI) from Compiler
- [NODE_TYPE_TEXT](Compiler.md#s-NODE_TYPE_TEXT) from Compiler

**Methods**:

- [addKeys(CSNode, XPathTag, ConfNamespace)](#s-addKeys)
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

## Constructors

<a id="s-XPathAbrevCompiler-1"></a>
### XPathAbrevCompiler(MountIdInterface)

```java
public XPathAbrevCompiler(com.tailf.conf.MountIdInterface mountGetter)
```

Types: [MountIdInterface](MountIdInterface.md#s-MountIdInterface)

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter`


## Methods

<a id="s-addKeys"></a>
### addKeys(CSNode, XPathTag, ConfNamespace)

```java
public void addKeys(
    com.tailf.maapi.MaapiSchemas.CSNode current,
    com.tailf.conf.XPathAbrevCompiler.XPathTag tag,
    com.tailf.conf.ConfNamespace ns
)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [ConfNamespace](ConfNamespace.md#s-ConfNamespace)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode current`
- `com.tailf.conf.XPathAbrevCompiler.XPathTag tag`
- `com.tailf.conf.ConfNamespace ns`

<a id="s-equal"></a>
### equal(Object, Object)

```java
public Object equal(Object left, Object right) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `Object left`
- `Object right`

<a id="s-expressionPath"></a>
### expressionPath(Object, Object[], Object[])

```java
public Object expressionPath(Object expression, Object[] predicates, Object[] steps)
```

**Parameters**

- `Object expression`
- `Object[] predicates`
- `Object[] steps`

<a id="s-function"></a>
### function(int, Object[])

```java
public Object function(int code, Object[] args)
```

**Parameters**

- `int code`
- `Object[] args`

<a id="s-function-1"></a>
### function(Object, Object[])

```java
public Object function(Object name, Object[] args)
```

**Parameters**

- `Object name`
- `Object[] args`

<a id="s-getKP"></a>
### getKP()

```java
public com.tailf.conf.ConfObject[] getKP()
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

<a id="s-literal"></a>
### literal(String)

```java
public Object literal(String value)
```

**Parameters**

- `String value`

<a id="s-locationPath"></a>
### locationPath(boolean, Object[])

```java
public Object locationPath(boolean absolute, Object[] steps)
```

**Parameters**

- `boolean absolute`
- `Object[] steps`

<a id="s-nodeNameTest"></a>
### nodeNameTest(Object)

```java
public Object nodeNameTest(Object qname)
```

**Parameters**

- `Object qname`

<a id="s-nodeTypeTest"></a>
### nodeTypeTest(int)

```java
public Object nodeTypeTest(int nodeType)
```

**Parameters**

- `int nodeType`

<a id="s-number"></a>
### number(String)

```java
public Object number(String value)
```

**Parameters**

- `String value`

<a id="s-qname"></a>
### qname(String, String)

```java
public Object qname(
    String prefix,
    String tagName
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `String prefix`
- `String tagName`

<a id="s-step"></a>
### step(int, Object, Object[])

```java
public Object step(int axis, Object nodeTest, Object[] predicates)
```

**Parameters**

- `int axis`
- `Object nodeTest`
- `Object[] predicates`
