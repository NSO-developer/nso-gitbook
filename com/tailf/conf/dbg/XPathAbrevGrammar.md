<a id="cls-XPathAbrevGrammar"></a>
# XPathAbrevGrammar

```java
public class com.tailf.conf.dbg.XPathAbrevGrammar
    implements com.tailf.conf.dbg.XPathAbrevGrammarConstants
```

Types: [XPathAbrevGrammarConstants](XPathAbrevGrammarConstants.md#cls-XPathAbrevGrammarConstants)

## Members

**Constructors**:

- [XPathAbrevGrammar(InputStream)](#m-xpathabrevgrammar-2e473df9b9b4)
- [XPathAbrevGrammar(InputStream, String)](#m-xpathabrevgrammar-e1a637b61fa2)
- [XPathAbrevGrammar(Reader)](#m-xpathabrevgrammar-118515e28a0e)
- [XPathAbrevGrammar(XPathAbrevGrammarTokenManager)](#m-xpathabrevgrammar-a4de409058c6)

**Fields**:

- [AXIS_ANCESTOR](XPathAbrevGrammarConstants.md#m-AXIS_ANCESTOR) from XPathAbrevGrammarConstants
- [AXIS_ANCESTOR_OR_SELF](XPathAbrevGrammarConstants.md#m-AXIS_ANCESTOR_OR_SELF) from XPathAbrevGrammarConstants
- [AXIS_ATTRIBUTE](XPathAbrevGrammarConstants.md#m-AXIS_ATTRIBUTE) from XPathAbrevGrammarConstants
- [AXIS_CHILD](XPathAbrevGrammarConstants.md#m-AXIS_CHILD) from XPathAbrevGrammarConstants
- [AXIS_DESCENDANT](XPathAbrevGrammarConstants.md#m-AXIS_DESCENDANT) from XPathAbrevGrammarConstants
- [AXIS_DESCENDANT_OR_SELF](XPathAbrevGrammarConstants.md#m-AXIS_DESCENDANT_OR_SELF) from XPathAbrevGrammarConstants
- [AXIS_FOLLOWING](XPathAbrevGrammarConstants.md#m-AXIS_FOLLOWING) from XPathAbrevGrammarConstants
- [AXIS_FOLLOWING_SIBLING](XPathAbrevGrammarConstants.md#m-AXIS_FOLLOWING_SIBLING) from XPathAbrevGrammarConstants
- [AXIS_NAMESPACE](XPathAbrevGrammarConstants.md#m-AXIS_NAMESPACE) from XPathAbrevGrammarConstants
- [AXIS_PARENT](XPathAbrevGrammarConstants.md#m-AXIS_PARENT) from XPathAbrevGrammarConstants
- [AXIS_PRECEDING](XPathAbrevGrammarConstants.md#m-AXIS_PRECEDING) from XPathAbrevGrammarConstants
- [AXIS_PRECEDING_SIBLING](XPathAbrevGrammarConstants.md#m-AXIS_PRECEDING_SIBLING) from XPathAbrevGrammarConstants
- [AXIS_SELF](XPathAbrevGrammarConstants.md#m-AXIS_SELF) from XPathAbrevGrammarConstants
- [BaseChar](XPathAbrevGrammarConstants.md#m-BaseChar) from XPathAbrevGrammarConstants
- [CombiningChar](XPathAbrevGrammarConstants.md#m-CombiningChar) from XPathAbrevGrammarConstants
- [DEFAULT](XPathAbrevGrammarConstants.md#m-DEFAULT) from XPathAbrevGrammarConstants
- [Digit](XPathAbrevGrammarConstants.md#m-Digit) from XPathAbrevGrammarConstants
- [EOF](XPathAbrevGrammarConstants.md#m-EOF) from XPathAbrevGrammarConstants
- [EQ](XPathAbrevGrammarConstants.md#m-EQ) from XPathAbrevGrammarConstants
- [Extender](XPathAbrevGrammarConstants.md#m-Extender) from XPathAbrevGrammarConstants
- [FUNCTION_CURRENT](XPathAbrevGrammarConstants.md#m-FUNCTION_CURRENT) from XPathAbrevGrammarConstants
- [Ideographic](XPathAbrevGrammarConstants.md#m-Ideographic) from XPathAbrevGrammarConstants
- [jj_input_stream](#m-jj_input_stream)
- [jj_nt](#m-jj_nt)
- [Letter](XPathAbrevGrammarConstants.md#m-Letter) from XPathAbrevGrammarConstants
- [Literal](XPathAbrevGrammarConstants.md#m-Literal) from XPathAbrevGrammarConstants
- [NCName](XPathAbrevGrammarConstants.md#m-NCName) from XPathAbrevGrammarConstants
- [Number](XPathAbrevGrammarConstants.md#m-Number) from XPathAbrevGrammarConstants
- [SLASH](XPathAbrevGrammarConstants.md#m-SLASH) from XPathAbrevGrammarConstants
- [token](#m-token)
- [token_source](#m-token_source)
- [tokenImage](XPathAbrevGrammarConstants.md#m-tokenImage) from XPathAbrevGrammarConstants
- [UnicodeDigit](XPathAbrevGrammarConstants.md#m-UnicodeDigit) from XPathAbrevGrammarConstants

**Methods**:

- [AbbreviatedAxisSpecifier()](#m-abbreviatedaxisspecifier-2077ffc46a36)
- [AbsoluteLocationPath()](#m-absolutelocationpath-4e8bf87fbecb)
- [AxisName()](#m-axisname-26f35eaa1e25)
- [AxisSpecifier()](#m-axisspecifier-3422df92e1f5)
- [CoreFunctionCall()](#m-corefunctioncall-bbc848cd7f68)
- [CoreFunctionName()](#m-corefunctionname-a9428b54fc9d)
- [disable_tracing()](#m-disable_tracing-6da9cdfdd969)
- [enable_tracing()](#m-enable_tracing-4b87a1586eda)
- [EqualityExpr()](#m-equalityexpr-01aa6828049d)
- [Expression()](#m-expression-202b8d891679)
- [FilterExpr()](#m-filterexpr-2734d9da846d)
- [FunctionCall()](#m-functioncall-b53ad6cb019a)
- [FunctionName()](#m-functionname-e065b916e82a)
- [generateParseException()](#m-generateparseexception-deb7e661e2f1)
- [getNextToken()](#m-getnexttoken-dc921ada5024)
- [getToken(int)](#m-gettoken-dc7acf63f451)
- [LocationPath()](#m-locationpath-35ea9d0f3255)
- [LocationStep(ArrayList<Object>)](#m-locationstep-a5e94dba22db)
- [main(String[])](#m-main-1503518a8568)
- [NCName()](#m-ncname-7b30a4c1f737)
- [NCName_Without_CoreFunctions()](#m-ncname_without_corefunctions-6566bbe274b7)
- [NodeTest(ArrayList<Object>)](#m-nodetest-22e2f0747db1)
- [parseExpression()](#m-parseexpression-09140d7abc03)
- [PathExpr()](#m-pathexpr-2e73edb0ff0c)
- [Predicate()](#m-predicate-c03c201960b0)
- [PrimaryExpr()](#m-primaryexpr-1e465f74325b)
- [QName()](#m-qname-7107ceb3aca9)
- [QName_Without_CoreFunctions()](#m-qname_without_corefunctions-158727e2e312)
- [ReInit(InputStream)](#m-reinit-e03395a4a4ba)
- [ReInit(InputStream, String)](#m-reinit-330085293cfa)
- [ReInit(Reader)](#m-reinit-4ce6f3557028)
- [ReInit(XPathAbrevGrammarTokenManager)](#m-reinit-88ffc30c9b57)
- [RelationalExpr()](#m-relationalexpr-1f528ea442a1)
- [RelativeLocationPath()](#m-relativelocationpath-dddce07a8f49)
- [setCompiler(Compiler)](#m-setcompiler-ba6ce2506c89)
- [trace_enabled()](#m-trace_enabled-0d5a0a082fa5)
- [WildcardName()](#m-wildcardname-8dffbb9f4b24)

**Nested Types**:

- [JJCalls](XPathAbrevGrammar/JJCalls.md#cls-JJCalls)
- [MyCompiler](XPathAbrevGrammar/MyCompiler.md#cls-MyCompiler)

## Constructors

<a id="m-xpathabrevgrammar-2e473df9b9b4"></a>
### XPathAbrevGrammar(InputStream)

```java
public XPathAbrevGrammar(java.io.InputStream stream)
```

Constructor with InputStream.

**Parameters**

- `java.io.InputStream stream`

<a id="m-xpathabrevgrammar-e1a637b61fa2"></a>
### XPathAbrevGrammar(InputStream, String)

```java
public XPathAbrevGrammar(java.io.InputStream stream, String encoding)
```

Constructor with InputStream and supplied encoding

**Parameters**

- `java.io.InputStream stream`
- `String encoding`

<a id="m-xpathabrevgrammar-118515e28a0e"></a>
### XPathAbrevGrammar(Reader)

```java
public XPathAbrevGrammar(java.io.Reader stream)
```

Constructor.

**Parameters**

- `java.io.Reader stream`

<a id="m-xpathabrevgrammar-a4de409058c6"></a>
### XPathAbrevGrammar(XPathAbrevGrammarTokenManager)

```java
public XPathAbrevGrammar(com.tailf.conf.dbg.XPathAbrevGrammarTokenManager tm)
```

Types: [XPathAbrevGrammarTokenManager](XPathAbrevGrammarTokenManager.md#cls-XPathAbrevGrammarTokenManager)

Constructor with generated Token Manager.

**Parameters**

- `com.tailf.conf.dbg.XPathAbrevGrammarTokenManager tm`


## Fields

<a id="m-jj_input_stream"></a>
### jj_input_stream

**Package-private**

```java
com.tailf.conf.dbg.JavaCharStream jj_input_stream = null;
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

<a id="m-jj_nt"></a>
### jj_nt

```java
public com.tailf.conf.dbg.Token jj_nt = null;
```

Types: [Token](Token.md#cls-Token)

Next token.

<a id="m-token"></a>
### token

```java
public com.tailf.conf.dbg.Token token = null;
```

Types: [Token](Token.md#cls-Token)

Current token.

<a id="m-token_source"></a>
### token_source

```java
public com.tailf.conf.dbg.XPathAbrevGrammarTokenManager token_source = null;
```

Types: [XPathAbrevGrammarTokenManager](XPathAbrevGrammarTokenManager.md#cls-XPathAbrevGrammarTokenManager)

Generated Token Manager.


## Methods

<a id="m-abbreviatedaxisspecifier-2077ffc46a36"></a>
### AbbreviatedAxisSpecifier()

```java
public final int AbbreviatedAxisSpecifier() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-absolutelocationpath-4e8bf87fbecb"></a>
### AbsoluteLocationPath()

```java
public final Object AbsoluteLocationPath() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-axisname-26f35eaa1e25"></a>
### AxisName()

```java
public final int AxisName() throws com.tailf.conf.dbg.ParseException
```

Types: [ParseException](ParseException.md#cls-ParseException)

<a id="m-axisspecifier-3422df92e1f5"></a>
### AxisSpecifier()

```java
public final int AxisSpecifier() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-corefunctioncall-bbc848cd7f68"></a>
### CoreFunctionCall()

```java
public final Object CoreFunctionCall() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-corefunctionname-a9428b54fc9d"></a>
### CoreFunctionName()

```java
public final int CoreFunctionName() throws com.tailf.conf.dbg.ParseException
```

Types: [ParseException](ParseException.md#cls-ParseException)

<a id="m-disable_tracing-6da9cdfdd969"></a>
### disable_tracing()

```java
public final void disable_tracing()
```

Disable tracing.

<a id="m-enable_tracing-4b87a1586eda"></a>
### enable_tracing()

```java
public final void enable_tracing()
```

Enable tracing.

<a id="m-equalityexpr-01aa6828049d"></a>
### EqualityExpr()

```java
public final Object EqualityExpr() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-expression-202b8d891679"></a>
### Expression()

```java
public final Object Expression() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-filterexpr-2734d9da846d"></a>
### FilterExpr()

```java
public final Object FilterExpr() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-functioncall-b53ad6cb019a"></a>
### FunctionCall()

```java
public final Object FunctionCall() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-functionname-e065b916e82a"></a>
### FunctionName()

```java
public final Object FunctionName() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-generateparseexception-deb7e661e2f1"></a>
### generateParseException()

```java
public com.tailf.conf.dbg.ParseException generateParseException()
```

Types: [ParseException](ParseException.md#cls-ParseException)

Generate ParseException.

<a id="m-getnexttoken-dc921ada5024"></a>
### getNextToken()

```java
public final com.tailf.conf.dbg.Token getNextToken()
```

Types: [Token](Token.md#cls-Token)

Get the next Token.

<a id="m-gettoken-dc7acf63f451"></a>
### getToken(int)

```java
public final com.tailf.conf.dbg.Token getToken(int index)
```

Types: [Token](Token.md#cls-Token)

Get the specific Token.

**Parameters**

- `int index`

<a id="m-locationpath-35ea9d0f3255"></a>
### LocationPath()

```java
public final Object LocationPath() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-locationstep-a5e94dba22db"></a>
### LocationStep(ArrayList<Object>)

```java
public final void LocationStep(
    java.util.ArrayList<Object> steps
)
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

**Parameters**

- `java.util.ArrayList<Object> steps`

<a id="m-main-1503518a8568"></a>
### main(String[])

```java
public static void main(String[] args)
```

**Parameters**

- `String[] args`

<a id="m-ncname-7b30a4c1f737"></a>
### NCName()

```java
public final String NCName() throws com.tailf.conf.dbg.ParseException
```

Types: [ParseException](ParseException.md#cls-ParseException)

<a id="m-ncname_without_corefunctions-6566bbe274b7"></a>
### NCName_Without_CoreFunctions()

```java
public final String NCName_Without_CoreFunctions() throws com.tailf.conf.dbg.ParseException
```

Types: [ParseException](ParseException.md#cls-ParseException)

<a id="m-nodetest-22e2f0747db1"></a>
### NodeTest(ArrayList<Object>)

```java
public final void NodeTest(
    java.util.ArrayList<Object> steps
)
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

**Parameters**

- `java.util.ArrayList<Object> steps`

<a id="m-parseexpression-09140d7abc03"></a>
### parseExpression()

```java
public final Object parseExpression() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-pathexpr-2e73edb0ff0c"></a>
### PathExpr()

```java
public final Object PathExpr() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-predicate-c03c201960b0"></a>
### Predicate()

```java
public final Object Predicate() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-primaryexpr-1e465f74325b"></a>
### PrimaryExpr()

```java
public final Object PrimaryExpr() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-qname-7107ceb3aca9"></a>
### QName()

```java
public final Object QName() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-qname_without_corefunctions-158727e2e312"></a>
### QName_Without_CoreFunctions()

```java
public final Object QName_Without_CoreFunctions() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-reinit-e03395a4a4ba"></a>
### ReInit(InputStream)

```java
public void ReInit(java.io.InputStream stream)
```

Reinitialise.

**Parameters**

- `java.io.InputStream stream`

<a id="m-reinit-330085293cfa"></a>
### ReInit(InputStream, String)

```java
public void ReInit(java.io.InputStream stream, String encoding)
```

Reinitialise.

**Parameters**

- `java.io.InputStream stream`
- `String encoding`

<a id="m-reinit-4ce6f3557028"></a>
### ReInit(Reader)

```java
public void ReInit(java.io.Reader stream)
```

Reinitialise.

**Parameters**

- `java.io.Reader stream`

<a id="m-reinit-88ffc30c9b57"></a>
### ReInit(XPathAbrevGrammarTokenManager)

```java
public void ReInit(com.tailf.conf.dbg.XPathAbrevGrammarTokenManager tm)
```

Types: [XPathAbrevGrammarTokenManager](XPathAbrevGrammarTokenManager.md#cls-XPathAbrevGrammarTokenManager)

Reinitialise.

**Parameters**

- `com.tailf.conf.dbg.XPathAbrevGrammarTokenManager tm`

<a id="m-relationalexpr-1f528ea442a1"></a>
### RelationalExpr()

```java
public final Object RelationalExpr() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-relativelocationpath-dddce07a8f49"></a>
### RelativeLocationPath()

```java
public final Object RelativeLocationPath() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-setcompiler-ba6ce2506c89"></a>
### setCompiler(Compiler)

```java
public void setCompiler(com.tailf.conf.Compiler compiler)
```

Types: [Compiler](../Compiler.md#cls-Compiler)

**Parameters**

- `com.tailf.conf.Compiler compiler`

<a id="m-trace_enabled-0d5a0a082fa5"></a>
### trace_enabled()

```java
public final boolean trace_enabled()
```

Trace enabled.

<a id="m-wildcardname-8dffbb9f4b24"></a>
### WildcardName()

```java
public final Object WildcardName() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)


## Nested Types

- [JJCalls](XPathAbrevGrammar/JJCalls.md#cls-JJCalls)
- [MyCompiler](XPathAbrevGrammar/MyCompiler.md#cls-MyCompiler)
