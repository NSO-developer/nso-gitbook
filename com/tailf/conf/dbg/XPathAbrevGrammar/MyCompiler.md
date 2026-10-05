<a id="s-MyCompiler"></a>
# MyCompiler

```java
public static class com.tailf.conf.dbg.XPathAbrevGrammar.MyCompiler
    implements com.tailf.conf.Compiler
```

Types: [Compiler](../../Compiler.md#s-Compiler)

## Members

**Constructors**:

- [MyCompiler()](#s-MyCompiler-1)

**Fields**:

- [AXIS_ANCESTOR](../../Compiler.md#s-AXIS_ANCESTOR) from Compiler
- [AXIS_ANCESTOR_OR_SELF](../../Compiler.md#s-AXIS_ANCESTOR_OR_SELF) from Compiler
- [AXIS_ATTRIBUTE](../../Compiler.md#s-AXIS_ATTRIBUTE) from Compiler
- [AXIS_CHILD](../../Compiler.md#s-AXIS_CHILD) from Compiler
- [AXIS_DESCENDANT](../../Compiler.md#s-AXIS_DESCENDANT) from Compiler
- [AXIS_DESCENDANT_OR_SELF](../../Compiler.md#s-AXIS_DESCENDANT_OR_SELF) from Compiler
- [AXIS_FOLLOWING](../../Compiler.md#s-AXIS_FOLLOWING) from Compiler
- [AXIS_FOLLOWING_SIBLING](../../Compiler.md#s-AXIS_FOLLOWING_SIBLING) from Compiler
- [AXIS_NAMESPACE](../../Compiler.md#s-AXIS_NAMESPACE) from Compiler
- [AXIS_PARENT](../../Compiler.md#s-AXIS_PARENT) from Compiler
- [AXIS_PRECEDING](../../Compiler.md#s-AXIS_PRECEDING) from Compiler
- [AXIS_PRECEDING_SIBLING](../../Compiler.md#s-AXIS_PRECEDING_SIBLING) from Compiler
- [AXIS_SELF](../../Compiler.md#s-AXIS_SELF) from Compiler
- [FUNCTION_CURRENT](../../Compiler.md#s-FUNCTION_CURRENT) from Compiler
- [NODE_TYPE_COMMENT](../../Compiler.md#s-NODE_TYPE_COMMENT) from Compiler
- [NODE_TYPE_NODE](../../Compiler.md#s-NODE_TYPE_NODE) from Compiler
- [NODE_TYPE_PI](../../Compiler.md#s-NODE_TYPE_PI) from Compiler
- [NODE_TYPE_TEXT](../../Compiler.md#s-NODE_TYPE_TEXT) from Compiler

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

## Constructors

<a id="s-MyCompiler-1"></a>
### MyCompiler()

```java
public MyCompiler()
```


## Methods

<a id="s-equal"></a>
### equal(Object, Object)

```java
public Object equal(Object left, Object right)
```

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

Types: [ConfObject](../../ConfObject.md#s-ConfObject)

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
public Object qname(String prefix, String name)
```

**Parameters**

- `String prefix`
- `String name`

<a id="s-step"></a>
### step(int, Object, Object[])

```java
public Object step(int axis, Object nodeTest, Object[] predicates)
```

**Parameters**

- `int axis`
- `Object nodeTest`
- `Object[] predicates`
