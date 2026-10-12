# XPathAbrev1 <a href="#xpathabrev1-507e4cad9296" id="xpathabrev1-507e4cad9296"></a>

```java
public class com.tailf.conf.gen2.XPathAbrev1
```

## Members

**Constructors**:

- [XPathAbrev1\(InputStream\)](#xpathabrev1-80044810d17a)
- [XPathAbrev1\(InputStream, String\)](#xpathabrev1-1182b6f6db85)
- [XPathAbrev1\(Reader\)](#xpathabrev1-e0aec549afa6)
- [XPathAbrev1\(XPathAbrev1TokenManager\)](#xpathabrev1-b45a7fedd78a)

**Fields**:

- [AXIS\_ANCESTOR](#axis_ancestor-62c59dd9b2e3)
- [AXIS\_ANCESTOR\_OR\_SELF](#axis_ancestor_or_self-8a86e8f77b65)
- [AXIS\_ATTRIBUTE](#axis_attribute-a05946445c05)
- [AXIS\_CHILD](#axis_child-b30db2353719)
- [AXIS\_DESCENDANT](#axis_descendant-15e7b43dd049)
- [AXIS\_DESCENDANT\_OR\_SELF](#axis_descendant_or_self-9f6c29a66ab9)
- [AXIS\_FOLLOWING](#axis_following-a1c4549e0b7e)
- [AXIS\_FOLLOWING\_SIBLING](#axis_following_sibling-15c026a27921)
- [AXIS\_NAMESPACE](#axis_namespace-fca116cb0837)
- [AXIS\_PARENT](#axis_parent-a46c866285ba)
- [AXIS\_PRECEDING](#axis_preceding-928fdaa9975d)
- [AXIS\_PRECEDING\_SIBLING](#axis_preceding_sibling-d98b9bd3ec33)
- [AXIS\_SELF](#axis_self-e8df13365b56)
- [BaseChar](#basechar-40e1261471a6)
- [CombiningChar](#combiningchar-04353df29e46)
- [DEFAULT](#default-5965fc85722b)
- [Digit](#digit-d562fa9fa27a)
- [EOF](#eof-e4ab74e8c3eb)
- [EQ](#eq-27379a35bac0)
- [Extender](#extender-16833fdff759)
- [FUNCTION\_CURRENT](#function_current-756d70c6837c)
- [Ideographic](#ideographic-9e9a508c5c4b)
- [jj\_nt](#jj_nt-9db0740275fe)
- [Letter](#letter-b7da983a0a77)
- [Literal](#literal-d5804337bb25)
- [NCName](#ncname-61cf3f5186ac)
- [Number](#number-d1bd19560532)
- [SLASH](#slash-3c7d823f3e28)
- [token](#token-93f8344c37b8)
- [token\_source](#token_source-65d526092316)
- [tokenImage](#tokenimage-c13f534d4471)
- [UnicodeDigit](#unicodedigit-85441abdb275)

**Methods**:

- [AbbreviatedAxisSpecifier\(\)](#abbreviatedaxisspecifier-2077ffc46a36)
- [AbsoluteLocationPath\(\)](#absolutelocationpath-4e8bf87fbecb)
- [AxisName\(\)](#axisname-26f35eaa1e25)
- [AxisSpecifier\(\)](#axisspecifier-3422df92e1f5)
- [CoreFunctionCall\(\)](#corefunctioncall-bbc848cd7f68)
- [CoreFunctionName\(\)](#corefunctionname-a9428b54fc9d)
- [disable\_tracing\(\)](#disable_tracing-6da9cdfdd969)
- [enable\_tracing\(\)](#enable_tracing-4b87a1586eda)
- [EqualityExpr\(\)](#equalityexpr-01aa6828049d)
- [Expression\(\)](#expression-202b8d891679)
- [FilterExpr\(\)](#filterexpr-2734d9da846d)
- [FunctionCall\(\)](#functioncall-b53ad6cb019a)
- [FunctionName\(\)](#functionname-e065b916e82a)
- [generateParseException\(\)](#generateparseexception-deb7e661e2f1)
- [getNextToken\(\)](#getnexttoken-dc921ada5024)
- [getToken\(int\)](#gettoken-dc7acf63f451)
- [LocationPath\(\)](#locationpath-35ea9d0f3255)
- [LocationStep\(ArrayList\<Object\>\)](#locationstep-a5e94dba22db)
- [NCName\(\)](#ncname-7b30a4c1f737)
- [NCName\_Without\_CoreFunctions\(\)](#ncname_without_corefunctions-6566bbe274b7)
- [NodeTest\(ArrayList\<Object\>\)](#nodetest-22e2f0747db1)
- [parse\(String, MountIdInterface\)](#parse-400296062d9d)
- [parseExpression\(\)](#parseexpression-09140d7abc03)
- [PathExpr\(\)](#pathexpr-2e73edb0ff0c)
- [Predicate\(\)](#predicate-c03c201960b0)
- [PrimaryExpr\(\)](#primaryexpr-1e465f74325b)
- [QName\(\)](#qname-7107ceb3aca9)
- [QName\_Without\_CoreFunctions\(\)](#qname_without_corefunctions-158727e2e312)
- [ReInit\(InputStream\)](#reinit-e03395a4a4ba)
- [ReInit\(InputStream, String\)](#reinit-330085293cfa)
- [ReInit\(Reader\)](#reinit-4ce6f3557028)
- [ReInit\(XPathAbrev1TokenManager\)](#reinit-5aac9f929a90)
- [RelationalExpr\(\)](#relationalexpr-1f528ea442a1)
- [RelativeLocationPath\(\)](#relativelocationpath-dddce07a8f49)
- [setCompiler\(Compiler\)](#setcompiler-ba6ce2506c89)
- [trace\_enabled\(\)](#trace_enabled-0d5a0a082fa5)
- [WildcardName\(\)](#wildcardname-8dffbb9f4b24)

## Constructors

### XPathAbrev1(InputStream) <a href="#xpathabrev1-80044810d17a" id="xpathabrev1-80044810d17a"></a>

```java
public XPathAbrev1(java.io.InputStream stream)
```

Constructor with InputStream.

**Parameters**

- `java.io.InputStream stream`

### XPathAbrev1(InputStream, String) <a href="#xpathabrev1-1182b6f6db85" id="xpathabrev1-1182b6f6db85"></a>

```java
public XPathAbrev1(java.io.InputStream stream, String encoding)
```

Constructor with InputStream and supplied encoding

**Parameters**

- `java.io.InputStream stream`
- `String encoding`

### XPathAbrev1(Reader) <a href="#xpathabrev1-e0aec549afa6" id="xpathabrev1-e0aec549afa6"></a>

```java
public XPathAbrev1(java.io.Reader stream)
```

Constructor.

**Parameters**

- `java.io.Reader stream`

### XPathAbrev1(XPathAbrev1TokenManager) <a href="#xpathabrev1-b45a7fedd78a" id="xpathabrev1-b45a7fedd78a"></a>

```java
public XPathAbrev1(com.tailf.conf.gen2.XPathAbrev1TokenManager tm)
```

Constructor with generated Token Manager.

**Parameters**

- `com.tailf.conf.gen2.XPathAbrev1TokenManager tm`


## Fields

### AXIS_ANCESTOR <a href="#axis_ancestor-62c59dd9b2e3" id="axis_ancestor-62c59dd9b2e3"></a>

```java
public static final int AXIS_ANCESTOR = 20;
```

RegularExpression Id.

### AXIS_ANCESTOR_OR_SELF <a href="#axis_ancestor_or_self-8a86e8f77b65" id="axis_ancestor_or_self-8a86e8f77b65"></a>

```java
public static final int AXIS_ANCESTOR_OR_SELF = 26;
```

RegularExpression Id.

### AXIS_ATTRIBUTE <a href="#axis_attribute-a05946445c05" id="axis_attribute-a05946445c05"></a>

```java
public static final int AXIS_ATTRIBUTE = 21;
```

RegularExpression Id.

### AXIS_CHILD <a href="#axis_child-b30db2353719" id="axis_child-b30db2353719"></a>

```java
public static final int AXIS_CHILD = 18;
```

RegularExpression Id.

### AXIS_DESCENDANT <a href="#axis_descendant-15e7b43dd049" id="axis_descendant-15e7b43dd049"></a>

```java
public static final int AXIS_DESCENDANT = 25;
```

RegularExpression Id.

### AXIS_DESCENDANT_OR_SELF <a href="#axis_descendant_or_self-9f6c29a66ab9" id="axis_descendant_or_self-9f6c29a66ab9"></a>

```java
public static final int AXIS_DESCENDANT_OR_SELF = 29;
```

RegularExpression Id.

### AXIS_FOLLOWING <a href="#axis_following-a1c4549e0b7e" id="axis_following-a1c4549e0b7e"></a>

```java
public static final int AXIS_FOLLOWING = 24;
```

RegularExpression Id.

### AXIS_FOLLOWING_SIBLING <a href="#axis_following_sibling-15c026a27921" id="axis_following_sibling-15c026a27921"></a>

```java
public static final int AXIS_FOLLOWING_SIBLING = 27;
```

RegularExpression Id.

### AXIS_NAMESPACE <a href="#axis_namespace-fca116cb0837" id="axis_namespace-fca116cb0837"></a>

```java
public static final int AXIS_NAMESPACE = 22;
```

RegularExpression Id.

### AXIS_PARENT <a href="#axis_parent-a46c866285ba" id="axis_parent-a46c866285ba"></a>

```java
public static final int AXIS_PARENT = 19;
```

RegularExpression Id.

### AXIS_PRECEDING <a href="#axis_preceding-928fdaa9975d" id="axis_preceding-928fdaa9975d"></a>

```java
public static final int AXIS_PRECEDING = 23;
```

RegularExpression Id.

### AXIS_PRECEDING_SIBLING <a href="#axis_preceding_sibling-d98b9bd3ec33" id="axis_preceding_sibling-d98b9bd3ec33"></a>

```java
public static final int AXIS_PRECEDING_SIBLING = 28;
```

RegularExpression Id.

### AXIS_SELF <a href="#axis_self-e8df13365b56" id="axis_self-e8df13365b56"></a>

```java
public static final int AXIS_SELF = 17;
```

RegularExpression Id.

### BaseChar <a href="#basechar-40e1261471a6" id="basechar-40e1261471a6"></a>

```java
public static final int BaseChar = 12;
```

RegularExpression Id.

### CombiningChar <a href="#combiningchar-04353df29e46" id="combiningchar-04353df29e46"></a>

```java
public static final int CombiningChar = 14;
```

RegularExpression Id.

### DEFAULT <a href="#default-5965fc85722b" id="default-5965fc85722b"></a>

```java
public static final int DEFAULT = 0;
```

Lexical state.

### Digit <a href="#digit-d562fa9fa27a" id="digit-d562fa9fa27a"></a>

```java
public static final int Digit = 9;
```

RegularExpression Id.

### EOF <a href="#eof-e4ab74e8c3eb" id="eof-e4ab74e8c3eb"></a>

```java
public static final int EOF = 0;
```

End of File.

### EQ <a href="#eq-27379a35bac0" id="eq-27379a35bac0"></a>

```java
public static final int EQ = 7;
```

RegularExpression Id.

### Extender <a href="#extender-16833fdff759" id="extender-16833fdff759"></a>

```java
public static final int Extender = 16;
```

RegularExpression Id.

### FUNCTION_CURRENT <a href="#function_current-756d70c6837c" id="function_current-756d70c6837c"></a>

```java
public static final int FUNCTION_CURRENT = 30;
```

RegularExpression Id.

### Ideographic <a href="#ideographic-9e9a508c5c4b" id="ideographic-9e9a508c5c4b"></a>

```java
public static final int Ideographic = 13;
```

RegularExpression Id.

### jj_nt <a href="#jj_nt-9db0740275fe" id="jj_nt-9db0740275fe"></a>

```java
public com.tailf.conf.gen2.Token jj_nt;
```

Next token.

### Letter <a href="#letter-b7da983a0a77" id="letter-b7da983a0a77"></a>

```java
public static final int Letter = 11;
```

RegularExpression Id.

### Literal <a href="#literal-d5804337bb25" id="literal-d5804337bb25"></a>

```java
public static final int Literal = 8;
```

RegularExpression Id.

### NCName <a href="#ncname-61cf3f5186ac" id="ncname-61cf3f5186ac"></a>

```java
public static final int NCName = 31;
```

RegularExpression Id.

### Number <a href="#number-d1bd19560532" id="number-d1bd19560532"></a>

```java
public static final int Number = 10;
```

RegularExpression Id.

### SLASH <a href="#slash-3c7d823f3e28" id="slash-3c7d823f3e28"></a>

```java
public static final int SLASH = 6;
```

RegularExpression Id.

### token <a href="#token-93f8344c37b8" id="token-93f8344c37b8"></a>

```java
public com.tailf.conf.gen2.Token token;
```

Current token.

### token_source <a href="#token_source-65d526092316" id="token_source-65d526092316"></a>

```java
public com.tailf.conf.gen2.XPathAbrev1TokenManager token_source;
```

Generated Token Manager.

### tokenImage <a href="#tokenimage-c13f534d4471" id="tokenimage-c13f534d4471"></a>

```java
public static final String[] tokenImage;
```

Literal token values.

### UnicodeDigit <a href="#unicodedigit-85441abdb275" id="unicodedigit-85441abdb275"></a>

```java
public static final int UnicodeDigit = 15;
```

RegularExpression Id.


## Methods

### AbbreviatedAxisSpecifier() <a href="#abbreviatedaxisspecifier-2077ffc46a36" id="abbreviatedaxisspecifier-2077ffc46a36"></a>

```java
public final int AbbreviatedAxisSpecifier()
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### AbsoluteLocationPath() <a href="#absolutelocationpath-4e8bf87fbecb" id="absolutelocationpath-4e8bf87fbecb"></a>

```java
public final Object AbsoluteLocationPath()
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### AxisName() <a href="#axisname-26f35eaa1e25" id="axisname-26f35eaa1e25"></a>

```java
public final int AxisName() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### AxisSpecifier() <a href="#axisspecifier-3422df92e1f5" id="axisspecifier-3422df92e1f5"></a>

```java
public final int AxisSpecifier()
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### CoreFunctionCall() <a href="#corefunctioncall-bbc848cd7f68" id="corefunctioncall-bbc848cd7f68"></a>

```java
public final Object CoreFunctionCall()
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### CoreFunctionName() <a href="#corefunctionname-a9428b54fc9d" id="corefunctionname-a9428b54fc9d"></a>

```java
public final int CoreFunctionName()
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### disable_tracing() <a href="#disable_tracing-6da9cdfdd969" id="disable_tracing-6da9cdfdd969"></a>

```java
public final void disable_tracing()
```

Disable tracing.

### enable_tracing() <a href="#enable_tracing-4b87a1586eda" id="enable_tracing-4b87a1586eda"></a>

```java
public final void enable_tracing()
```

Enable tracing.

### EqualityExpr() <a href="#equalityexpr-01aa6828049d" id="equalityexpr-01aa6828049d"></a>

```java
public final Object EqualityExpr()
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### Expression() <a href="#expression-202b8d891679" id="expression-202b8d891679"></a>

```java
public final Object Expression()
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### FilterExpr() <a href="#filterexpr-2734d9da846d" id="filterexpr-2734d9da846d"></a>

```java
public final Object FilterExpr()
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### FunctionCall() <a href="#functioncall-b53ad6cb019a" id="functioncall-b53ad6cb019a"></a>

```java
public final Object FunctionCall()
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### FunctionName() <a href="#functionname-e065b916e82a" id="functionname-e065b916e82a"></a>

```java
public final Object FunctionName()
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### generateParseException() <a href="#generateparseexception-deb7e661e2f1" id="generateparseexception-deb7e661e2f1"></a>

```java
public com.tailf.conf.gen2.ParseException generateParseException()
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad)

Generate ParseException.

### getNextToken() <a href="#getnexttoken-dc921ada5024" id="getnexttoken-dc921ada5024"></a>

```java
public final com.tailf.conf.gen2.Token getNextToken()
```

Get the next Token.

### getToken(int) <a href="#gettoken-dc7acf63f451" id="gettoken-dc7acf63f451"></a>

```java
public final com.tailf.conf.gen2.Token getToken(int index)
```

Get the specific Token.

**Parameters**

- `int index`

### LocationPath() <a href="#locationpath-35ea9d0f3255" id="locationpath-35ea9d0f3255"></a>

```java
public final Object LocationPath()
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### LocationStep(ArrayList&lt;Object&gt;) <a href="#locationstep-a5e94dba22db" id="locationstep-a5e94dba22db"></a>

```java
public final void LocationStep(
    java.util.ArrayList<Object> steps
)
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `java.util.ArrayList<Object> steps`

### NCName() <a href="#ncname-7b30a4c1f737" id="ncname-7b30a4c1f737"></a>

```java
public final String NCName() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### NCName_Without_CoreFunctions() <a href="#ncname_without_corefunctions-6566bbe274b7" id="ncname_without_corefunctions-6566bbe274b7"></a>

```java
public final String NCName_Without_CoreFunctions()
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### NodeTest(ArrayList&lt;Object&gt;) <a href="#nodetest-22e2f0747db1" id="nodetest-22e2f0747db1"></a>

```java
public final void NodeTest(
    java.util.ArrayList<Object> steps
)
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `java.util.ArrayList<Object> steps`

### parse(String, MountIdInterface) <a href="#parse-400296062d9d" id="parse-400296062d9d"></a>

```java
public static com.tailf.conf.Compiler parse(
    String line,
    com.tailf.conf.MountIdInterface mountGetter
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [Compiler](../Compiler.md#compiler-552d3a56b931), [MountIdInterface](../MountIdInterface.md#mountidinterface-113d1b54dae0), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String line`
- `com.tailf.conf.MountIdInterface mountGetter`

### parseExpression() <a href="#parseexpression-09140d7abc03" id="parseexpression-09140d7abc03"></a>

```java
public final Object parseExpression()
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### PathExpr() <a href="#pathexpr-2e73edb0ff0c" id="pathexpr-2e73edb0ff0c"></a>

```java
public final Object PathExpr()
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### Predicate() <a href="#predicate-c03c201960b0" id="predicate-c03c201960b0"></a>

```java
public final Object Predicate()
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### PrimaryExpr() <a href="#primaryexpr-1e465f74325b" id="primaryexpr-1e465f74325b"></a>

```java
public final Object PrimaryExpr()
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### QName() <a href="#qname-7107ceb3aca9" id="qname-7107ceb3aca9"></a>

```java
public final Object QName()
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### QName_Without_CoreFunctions() <a href="#qname_without_corefunctions-158727e2e312" id="qname_without_corefunctions-158727e2e312"></a>

```java
public final Object QName_Without_CoreFunctions()
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### ReInit(InputStream) <a href="#reinit-e03395a4a4ba" id="reinit-e03395a4a4ba"></a>

```java
public void ReInit(java.io.InputStream stream)
```

Reinitialise.

**Parameters**

- `java.io.InputStream stream`

### ReInit(InputStream, String) <a href="#reinit-330085293cfa" id="reinit-330085293cfa"></a>

```java
public void ReInit(java.io.InputStream stream, String encoding)
```

Reinitialise.

**Parameters**

- `java.io.InputStream stream`
- `String encoding`

### ReInit(Reader) <a href="#reinit-4ce6f3557028" id="reinit-4ce6f3557028"></a>

```java
public void ReInit(java.io.Reader stream)
```

Reinitialise.

**Parameters**

- `java.io.Reader stream`

### ReInit(XPathAbrev1TokenManager) <a href="#reinit-5aac9f929a90" id="reinit-5aac9f929a90"></a>

```java
public void ReInit(com.tailf.conf.gen2.XPathAbrev1TokenManager tm)
```

Reinitialise.

**Parameters**

- `com.tailf.conf.gen2.XPathAbrev1TokenManager tm`

### RelationalExpr() <a href="#relationalexpr-1f528ea442a1" id="relationalexpr-1f528ea442a1"></a>

```java
public final Object RelationalExpr()
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### RelativeLocationPath() <a href="#relativelocationpath-dddce07a8f49" id="relativelocationpath-dddce07a8f49"></a>

```java
public final Object RelativeLocationPath()
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### setCompiler(Compiler) <a href="#setcompiler-ba6ce2506c89" id="setcompiler-ba6ce2506c89"></a>

```java
public void setCompiler(com.tailf.conf.Compiler compiler)
```

Types: [Compiler](../Compiler.md#compiler-552d3a56b931)

**Parameters**

- `com.tailf.conf.Compiler compiler`

### trace_enabled() <a href="#trace_enabled-0d5a0a082fa5" id="trace_enabled-0d5a0a082fa5"></a>

```java
public final boolean trace_enabled()
```

Trace enabled.

### WildcardName() <a href="#wildcardname-8dffbb9f4b24" id="wildcardname-8dffbb9f4b24"></a>

```java
public final Object WildcardName()
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)
