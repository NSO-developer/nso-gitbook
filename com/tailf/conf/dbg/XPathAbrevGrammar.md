# XPathAbrevGrammar <a href="#xpathabrevgrammar-eb9fe1769e6c" id="xpathabrevgrammar-eb9fe1769e6c"></a>

```java
public class com.tailf.conf.dbg.XPathAbrevGrammar
    implements com.tailf.conf.dbg.XPathAbrevGrammarConstants
```

Types: [XPathAbrevGrammarConstants](XPathAbrevGrammarConstants.md#xpathabrevgrammarconstants-75bbcfc11d48)

## Members

**Constructors**:

- [XPathAbrevGrammar(InputStream)](#xpathabrevgrammar-2e473df9b9b4)
- [XPathAbrevGrammar(InputStream, String)](#xpathabrevgrammar-e1a637b61fa2)
- [XPathAbrevGrammar(Reader)](#xpathabrevgrammar-118515e28a0e)
- [XPathAbrevGrammar(XPathAbrevGrammarTokenManager)](#xpathabrevgrammar-a4de409058c6)

**Fields**:

- [AXIS_ANCESTOR](XPathAbrevGrammarConstants.md#axis_ancestor-62c59dd9b2e3) from XPathAbrevGrammarConstants
- [AXIS_ANCESTOR_OR_SELF](XPathAbrevGrammarConstants.md#axis_ancestor_or_self-8a86e8f77b65) from XPathAbrevGrammarConstants
- [AXIS_ATTRIBUTE](XPathAbrevGrammarConstants.md#axis_attribute-a05946445c05) from XPathAbrevGrammarConstants
- [AXIS_CHILD](XPathAbrevGrammarConstants.md#axis_child-b30db2353719) from XPathAbrevGrammarConstants
- [AXIS_DESCENDANT](XPathAbrevGrammarConstants.md#axis_descendant-15e7b43dd049) from XPathAbrevGrammarConstants
- [AXIS_DESCENDANT_OR_SELF](XPathAbrevGrammarConstants.md#axis_descendant_or_self-9f6c29a66ab9) from XPathAbrevGrammarConstants
- [AXIS_FOLLOWING](XPathAbrevGrammarConstants.md#axis_following-a1c4549e0b7e) from XPathAbrevGrammarConstants
- [AXIS_FOLLOWING_SIBLING](XPathAbrevGrammarConstants.md#axis_following_sibling-15c026a27921) from XPathAbrevGrammarConstants
- [AXIS_NAMESPACE](XPathAbrevGrammarConstants.md#axis_namespace-fca116cb0837) from XPathAbrevGrammarConstants
- [AXIS_PARENT](XPathAbrevGrammarConstants.md#axis_parent-a46c866285ba) from XPathAbrevGrammarConstants
- [AXIS_PRECEDING](XPathAbrevGrammarConstants.md#axis_preceding-928fdaa9975d) from XPathAbrevGrammarConstants
- [AXIS_PRECEDING_SIBLING](XPathAbrevGrammarConstants.md#axis_preceding_sibling-d98b9bd3ec33) from XPathAbrevGrammarConstants
- [AXIS_SELF](XPathAbrevGrammarConstants.md#axis_self-e8df13365b56) from XPathAbrevGrammarConstants
- [BaseChar](XPathAbrevGrammarConstants.md#basechar-40e1261471a6) from XPathAbrevGrammarConstants
- [CombiningChar](XPathAbrevGrammarConstants.md#combiningchar-04353df29e46) from XPathAbrevGrammarConstants
- [DEFAULT](XPathAbrevGrammarConstants.md#default-5965fc85722b) from XPathAbrevGrammarConstants
- [Digit](XPathAbrevGrammarConstants.md#digit-d562fa9fa27a) from XPathAbrevGrammarConstants
- [EOF](XPathAbrevGrammarConstants.md#eof-e4ab74e8c3eb) from XPathAbrevGrammarConstants
- [EQ](XPathAbrevGrammarConstants.md#eq-27379a35bac0) from XPathAbrevGrammarConstants
- [Extender](XPathAbrevGrammarConstants.md#extender-16833fdff759) from XPathAbrevGrammarConstants
- [FUNCTION_CURRENT](XPathAbrevGrammarConstants.md#function_current-756d70c6837c) from XPathAbrevGrammarConstants
- [Ideographic](XPathAbrevGrammarConstants.md#ideographic-9e9a508c5c4b) from XPathAbrevGrammarConstants
- [jj_input_stream](#jj_input_stream-a656fd5e96db)
- [jj_nt](#jj_nt-9db0740275fe)
- [Letter](XPathAbrevGrammarConstants.md#letter-b7da983a0a77) from XPathAbrevGrammarConstants
- [Literal](XPathAbrevGrammarConstants.md#literal-d5804337bb25) from XPathAbrevGrammarConstants
- [NCName](XPathAbrevGrammarConstants.md#ncname-61cf3f5186ac) from XPathAbrevGrammarConstants
- [Number](XPathAbrevGrammarConstants.md#number-d1bd19560532) from XPathAbrevGrammarConstants
- [SLASH](XPathAbrevGrammarConstants.md#slash-3c7d823f3e28) from XPathAbrevGrammarConstants
- [token](#token-93f8344c37b8)
- [token_source](#token_source-65d526092316)
- [tokenImage](XPathAbrevGrammarConstants.md#tokenimage-c13f534d4471) from XPathAbrevGrammarConstants
- [UnicodeDigit](XPathAbrevGrammarConstants.md#unicodedigit-85441abdb275) from XPathAbrevGrammarConstants

**Methods**:

- [AbbreviatedAxisSpecifier()](#abbreviatedaxisspecifier-2077ffc46a36)
- [AbsoluteLocationPath()](#absolutelocationpath-4e8bf87fbecb)
- [AxisName()](#axisname-26f35eaa1e25)
- [AxisSpecifier()](#axisspecifier-3422df92e1f5)
- [CoreFunctionCall()](#corefunctioncall-bbc848cd7f68)
- [CoreFunctionName()](#corefunctionname-a9428b54fc9d)
- [disable_tracing()](#disable_tracing-6da9cdfdd969)
- [enable_tracing()](#enable_tracing-4b87a1586eda)
- [EqualityExpr()](#equalityexpr-01aa6828049d)
- [Expression()](#expression-202b8d891679)
- [FilterExpr()](#filterexpr-2734d9da846d)
- [FunctionCall()](#functioncall-b53ad6cb019a)
- [FunctionName()](#functionname-e065b916e82a)
- [generateParseException()](#generateparseexception-deb7e661e2f1)
- [getNextToken()](#getnexttoken-dc921ada5024)
- [getToken(int)](#gettoken-dc7acf63f451)
- [LocationPath()](#locationpath-35ea9d0f3255)
- [LocationStep(ArrayList<Object>)](#locationstep-a5e94dba22db)
- [main(String[])](#main-1503518a8568)
- [NCName()](#ncname-7b30a4c1f737)
- [NCName_Without_CoreFunctions()](#ncname_without_corefunctions-6566bbe274b7)
- [NodeTest(ArrayList<Object>)](#nodetest-22e2f0747db1)
- [parseExpression()](#parseexpression-09140d7abc03)
- [PathExpr()](#pathexpr-2e73edb0ff0c)
- [Predicate()](#predicate-c03c201960b0)
- [PrimaryExpr()](#primaryexpr-1e465f74325b)
- [QName()](#qname-7107ceb3aca9)
- [QName_Without_CoreFunctions()](#qname_without_corefunctions-158727e2e312)
- [ReInit(InputStream)](#reinit-e03395a4a4ba)
- [ReInit(InputStream, String)](#reinit-330085293cfa)
- [ReInit(Reader)](#reinit-4ce6f3557028)
- [ReInit(XPathAbrevGrammarTokenManager)](#reinit-88ffc30c9b57)
- [RelationalExpr()](#relationalexpr-1f528ea442a1)
- [RelativeLocationPath()](#relativelocationpath-dddce07a8f49)
- [setCompiler(Compiler)](#setcompiler-ba6ce2506c89)
- [trace_enabled()](#trace_enabled-0d5a0a082fa5)
- [WildcardName()](#wildcardname-8dffbb9f4b24)

**Nested Types**:

- [JJCalls](XPathAbrevGrammar/JJCalls.md#jjcalls-1cdac36bbc39)
- [MyCompiler](XPathAbrevGrammar/MyCompiler.md#mycompiler-143644d69d61)

## Constructors

### XPathAbrevGrammar(InputStream) <a href="#xpathabrevgrammar-2e473df9b9b4" id="xpathabrevgrammar-2e473df9b9b4"></a>

```java
public XPathAbrevGrammar(java.io.InputStream stream)
```

Constructor with InputStream.

**Parameters**

- `java.io.InputStream stream`

### XPathAbrevGrammar(InputStream, String) <a href="#xpathabrevgrammar-e1a637b61fa2" id="xpathabrevgrammar-e1a637b61fa2"></a>

```java
public XPathAbrevGrammar(java.io.InputStream stream, String encoding)
```

Constructor with InputStream and supplied encoding

**Parameters**

- `java.io.InputStream stream`
- `String encoding`

### XPathAbrevGrammar(Reader) <a href="#xpathabrevgrammar-118515e28a0e" id="xpathabrevgrammar-118515e28a0e"></a>

```java
public XPathAbrevGrammar(java.io.Reader stream)
```

Constructor.

**Parameters**

- `java.io.Reader stream`

### XPathAbrevGrammar(XPathAbrevGrammarTokenManager) <a href="#xpathabrevgrammar-a4de409058c6" id="xpathabrevgrammar-a4de409058c6"></a>

```java
public XPathAbrevGrammar(com.tailf.conf.dbg.XPathAbrevGrammarTokenManager tm)
```

Types: [XPathAbrevGrammarTokenManager](XPathAbrevGrammarTokenManager.md#xpathabrevgrammartokenmanager-88e4a4841144)

Constructor with generated Token Manager.

**Parameters**

- `com.tailf.conf.dbg.XPathAbrevGrammarTokenManager tm`


## Fields

### jj_input_stream <a href="#jj_input_stream-a656fd5e96db" id="jj_input_stream-a656fd5e96db"></a>

**Package-private**

```java
com.tailf.conf.dbg.JavaCharStream jj_input_stream = null;
```

Types: [JavaCharStream](JavaCharStream.md#javacharstream-b90e6870657d)

### jj_nt <a href="#jj_nt-9db0740275fe" id="jj_nt-9db0740275fe"></a>

```java
public com.tailf.conf.dbg.Token jj_nt = null;
```

Types: [Token](Token.md#token-b7a155cc1a5e)

Next token.

### token <a href="#token-93f8344c37b8" id="token-93f8344c37b8"></a>

```java
public com.tailf.conf.dbg.Token token = null;
```

Types: [Token](Token.md#token-b7a155cc1a5e)

Current token.

### token_source <a href="#token_source-65d526092316" id="token_source-65d526092316"></a>

```java
public com.tailf.conf.dbg.XPathAbrevGrammarTokenManager token_source = null;
```

Types: [XPathAbrevGrammarTokenManager](XPathAbrevGrammarTokenManager.md#xpathabrevgrammartokenmanager-88e4a4841144)

Generated Token Manager.


## Methods

### AbbreviatedAxisSpecifier() <a href="#abbreviatedaxisspecifier-2077ffc46a36" id="abbreviatedaxisspecifier-2077ffc46a36"></a>

```java
public final int AbbreviatedAxisSpecifier() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### AbsoluteLocationPath() <a href="#absolutelocationpath-4e8bf87fbecb" id="absolutelocationpath-4e8bf87fbecb"></a>

```java
public final Object AbsoluteLocationPath() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### AxisName() <a href="#axisname-26f35eaa1e25" id="axisname-26f35eaa1e25"></a>

```java
public final int AxisName() throws com.tailf.conf.dbg.ParseException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad)

### AxisSpecifier() <a href="#axisspecifier-3422df92e1f5" id="axisspecifier-3422df92e1f5"></a>

```java
public final int AxisSpecifier() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### CoreFunctionCall() <a href="#corefunctioncall-bbc848cd7f68" id="corefunctioncall-bbc848cd7f68"></a>

```java
public final Object CoreFunctionCall() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### CoreFunctionName() <a href="#corefunctionname-a9428b54fc9d" id="corefunctionname-a9428b54fc9d"></a>

```java
public final int CoreFunctionName() throws com.tailf.conf.dbg.ParseException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad)

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
public final Object EqualityExpr() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### Expression() <a href="#expression-202b8d891679" id="expression-202b8d891679"></a>

```java
public final Object Expression() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### FilterExpr() <a href="#filterexpr-2734d9da846d" id="filterexpr-2734d9da846d"></a>

```java
public final Object FilterExpr() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### FunctionCall() <a href="#functioncall-b53ad6cb019a" id="functioncall-b53ad6cb019a"></a>

```java
public final Object FunctionCall() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### FunctionName() <a href="#functionname-e065b916e82a" id="functionname-e065b916e82a"></a>

```java
public final Object FunctionName() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### generateParseException() <a href="#generateparseexception-deb7e661e2f1" id="generateparseexception-deb7e661e2f1"></a>

```java
public com.tailf.conf.dbg.ParseException generateParseException()
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad)

Generate ParseException.

### getNextToken() <a href="#getnexttoken-dc921ada5024" id="getnexttoken-dc921ada5024"></a>

```java
public final com.tailf.conf.dbg.Token getNextToken()
```

Types: [Token](Token.md#token-b7a155cc1a5e)

Get the next Token.

### getToken(int) <a href="#gettoken-dc7acf63f451" id="gettoken-dc7acf63f451"></a>

```java
public final com.tailf.conf.dbg.Token getToken(int index)
```

Types: [Token](Token.md#token-b7a155cc1a5e)

Get the specific Token.

**Parameters**

- `int index`

### LocationPath() <a href="#locationpath-35ea9d0f3255" id="locationpath-35ea9d0f3255"></a>

```java
public final Object LocationPath() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### LocationStep(ArrayList&lt;Object&gt;) <a href="#locationstep-a5e94dba22db" id="locationstep-a5e94dba22db"></a>

```java
public final void LocationStep(
    java.util.ArrayList<Object> steps
)
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `java.util.ArrayList<Object> steps`

### main(String[]) <a href="#main-1503518a8568" id="main-1503518a8568"></a>

```java
public static void main(String[] args)
```

**Parameters**

- `String[] args`

### NCName() <a href="#ncname-7b30a4c1f737" id="ncname-7b30a4c1f737"></a>

```java
public final String NCName() throws com.tailf.conf.dbg.ParseException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad)

### NCName_Without_CoreFunctions() <a href="#ncname_without_corefunctions-6566bbe274b7" id="ncname_without_corefunctions-6566bbe274b7"></a>

```java
public final String NCName_Without_CoreFunctions() throws com.tailf.conf.dbg.ParseException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad)

### NodeTest(ArrayList&lt;Object&gt;) <a href="#nodetest-22e2f0747db1" id="nodetest-22e2f0747db1"></a>

```java
public final void NodeTest(
    java.util.ArrayList<Object> steps
)
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `java.util.ArrayList<Object> steps`

### parseExpression() <a href="#parseexpression-09140d7abc03" id="parseexpression-09140d7abc03"></a>

```java
public final Object parseExpression() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### PathExpr() <a href="#pathexpr-2e73edb0ff0c" id="pathexpr-2e73edb0ff0c"></a>

```java
public final Object PathExpr() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### Predicate() <a href="#predicate-c03c201960b0" id="predicate-c03c201960b0"></a>

```java
public final Object Predicate() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### PrimaryExpr() <a href="#primaryexpr-1e465f74325b" id="primaryexpr-1e465f74325b"></a>

```java
public final Object PrimaryExpr() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### QName() <a href="#qname-7107ceb3aca9" id="qname-7107ceb3aca9"></a>

```java
public final Object QName() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### QName_Without_CoreFunctions() <a href="#qname_without_corefunctions-158727e2e312" id="qname_without_corefunctions-158727e2e312"></a>

```java
public final Object QName_Without_CoreFunctions() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
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

### ReInit(XPathAbrevGrammarTokenManager) <a href="#reinit-88ffc30c9b57" id="reinit-88ffc30c9b57"></a>

```java
public void ReInit(com.tailf.conf.dbg.XPathAbrevGrammarTokenManager tm)
```

Types: [XPathAbrevGrammarTokenManager](XPathAbrevGrammarTokenManager.md#xpathabrevgrammartokenmanager-88e4a4841144)

Reinitialise.

**Parameters**

- `com.tailf.conf.dbg.XPathAbrevGrammarTokenManager tm`

### RelationalExpr() <a href="#relationalexpr-1f528ea442a1" id="relationalexpr-1f528ea442a1"></a>

```java
public final Object RelationalExpr() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)

### RelativeLocationPath() <a href="#relativelocationpath-dddce07a8f49" id="relativelocationpath-dddce07a8f49"></a>

```java
public final Object RelativeLocationPath() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
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
public final Object WildcardName() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad), [ConfException](../ConfException.md#confexception-baeaab99f7f9)


## Nested Types

- [JJCalls](XPathAbrevGrammar/JJCalls.md#jjcalls-1cdac36bbc39)
- [MyCompiler](XPathAbrevGrammar/MyCompiler.md#mycompiler-143644d69d61)
