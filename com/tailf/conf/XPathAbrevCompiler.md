# XPathAbrevCompiler <a href="#xpathabrevcompiler-e30fd52264f6" id="xpathabrevcompiler-e30fd52264f6"></a>

```java
public class com.tailf.conf.XPathAbrevCompiler
    implements com.tailf.conf.Compiler
```

Types: [Compiler](Compiler.md#compiler-552d3a56b931)

## Members

**Constructors**:

- [XPathAbrevCompiler(MountIdInterface)](#xpathabrevcompiler-ad338abd9ed9)

**Fields**:

- [AXIS_ANCESTOR](Compiler.md#axis_ancestor-62c59dd9b2e3) from Compiler
- [AXIS_ANCESTOR_OR_SELF](Compiler.md#axis_ancestor_or_self-8a86e8f77b65) from Compiler
- [AXIS_ATTRIBUTE](Compiler.md#axis_attribute-a05946445c05) from Compiler
- [AXIS_CHILD](Compiler.md#axis_child-b30db2353719) from Compiler
- [AXIS_DESCENDANT](Compiler.md#axis_descendant-15e7b43dd049) from Compiler
- [AXIS_DESCENDANT_OR_SELF](Compiler.md#axis_descendant_or_self-9f6c29a66ab9) from Compiler
- [AXIS_FOLLOWING](Compiler.md#axis_following-a1c4549e0b7e) from Compiler
- [AXIS_FOLLOWING_SIBLING](Compiler.md#axis_following_sibling-15c026a27921) from Compiler
- [AXIS_NAMESPACE](Compiler.md#axis_namespace-fca116cb0837) from Compiler
- [AXIS_PARENT](Compiler.md#axis_parent-a46c866285ba) from Compiler
- [AXIS_PRECEDING](Compiler.md#axis_preceding-928fdaa9975d) from Compiler
- [AXIS_PRECEDING_SIBLING](Compiler.md#axis_preceding_sibling-d98b9bd3ec33) from Compiler
- [AXIS_SELF](Compiler.md#axis_self-e8df13365b56) from Compiler
- [FUNCTION_CURRENT](Compiler.md#function_current-756d70c6837c) from Compiler
- [NODE_TYPE_COMMENT](Compiler.md#node_type_comment-08560091555e) from Compiler
- [NODE_TYPE_NODE](Compiler.md#node_type_node-bcd5091e1f2c) from Compiler
- [NODE_TYPE_PI](Compiler.md#node_type_pi-b3d41de190bb) from Compiler
- [NODE_TYPE_TEXT](Compiler.md#node_type_text-be2adb978305) from Compiler

**Methods**:

- [addKeys(CSNode, XPathTag, ConfNamespace)](#addkeys-81beca2ad90e)
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

## Constructors

### XPathAbrevCompiler(MountIdInterface) <a href="#xpathabrevcompiler-ad338abd9ed9" id="xpathabrevcompiler-ad338abd9ed9"></a>

```java
public XPathAbrevCompiler(com.tailf.conf.MountIdInterface mountGetter)
```

Types: [MountIdInterface](MountIdInterface.md#mountidinterface-113d1b54dae0)

**Parameters**

- `com.tailf.conf.MountIdInterface mountGetter`


## Methods

### addKeys(CSNode, XPathTag, ConfNamespace) <a href="#addkeys-81beca2ad90e" id="addkeys-81beca2ad90e"></a>

```java
public void addKeys(
    com.tailf.maapi.MaapiSchemas.CSNode current,
    com.tailf.conf.XPathAbrevCompiler.XPathTag tag,
    com.tailf.conf.ConfNamespace ns
)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [ConfNamespace](ConfNamespace.md#confnamespace-51b928e168d1)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode current`
- `com.tailf.conf.XPathAbrevCompiler.XPathTag tag`
- `com.tailf.conf.ConfNamespace ns`

### equal(Object, Object) <a href="#equal-799a2136c547" id="equal-799a2136c547"></a>

```java
public Object equal(Object left, Object right) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `Object left`
- `Object right`

### expressionPath(Object, Object[], Object[]) <a href="#expressionpath-5bf270c9d4c4" id="expressionpath-5bf270c9d4c4"></a>

```java
public Object expressionPath(Object expression, Object[] predicates, Object[] steps)
```

**Parameters**

- `Object expression`
- `Object[] predicates`
- `Object[] steps`

### function(int, Object[]) <a href="#function-2c16049fa829" id="function-2c16049fa829"></a>

```java
public Object function(int code, Object[] args)
```

**Parameters**

- `int code`
- `Object[] args`

### function(Object, Object[]) <a href="#function-1cc89eb447db" id="function-1cc89eb447db"></a>

```java
public Object function(Object name, Object[] args)
```

**Parameters**

- `Object name`
- `Object[] args`

### getKP() <a href="#getkp-45b2f95adae4" id="getkp-45b2f95adae4"></a>

```java
public com.tailf.conf.ConfObject[] getKP()
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2)

### literal(String) <a href="#literal-ad0286a2ebc5" id="literal-ad0286a2ebc5"></a>

```java
public Object literal(String value)
```

**Parameters**

- `String value`

### locationPath(boolean, Object[]) <a href="#locationpath-62efb77d2c40" id="locationpath-62efb77d2c40"></a>

```java
public Object locationPath(boolean absolute, Object[] steps)
```

**Parameters**

- `boolean absolute`
- `Object[] steps`

### nodeNameTest(Object) <a href="#nodenametest-d6890d3b8e88" id="nodenametest-d6890d3b8e88"></a>

```java
public Object nodeNameTest(Object qname)
```

**Parameters**

- `Object qname`

### nodeTypeTest(int) <a href="#nodetypetest-6d6b838bb52c" id="nodetypetest-6d6b838bb52c"></a>

```java
public Object nodeTypeTest(int nodeType)
```

**Parameters**

- `int nodeType`

### number(String) <a href="#number-249f888e69f1" id="number-249f888e69f1"></a>

```java
public Object number(String value)
```

**Parameters**

- `String value`

### qname(String, String) <a href="#qname-1189e6474a0b" id="qname-1189e6474a0b"></a>

```java
public Object qname(
    String prefix,
    String tagName
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String prefix`
- `String tagName`

### step(int, Object, Object[]) <a href="#step-476841714396" id="step-476841714396"></a>

```java
public Object step(int axis, Object nodeTest, Object[] predicates)
```

**Parameters**

- `int axis`
- `Object nodeTest`
- `Object[] predicates`
