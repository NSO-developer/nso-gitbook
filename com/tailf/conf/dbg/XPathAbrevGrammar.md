# XPathAbrevGrammar <a href="#cls-XPathAbrevGrammar" id="cls-XPathAbrevGrammar"></a>

```java
public class com.tailf.conf.dbg.XPathAbrevGrammar
    implements com.tailf.conf.dbg.XPathAbrevGrammarConstants
```

Types: [XPathAbrevGrammarConstants](XPathAbrevGrammarConstants.md#cls-XPathAbrevGrammarConstants)

## Members

**Constructors**:

- [XPathAbrevGrammar(InputStream)](#m-XPathAbrevGrammar-2e473df9b9b4)
- [XPathAbrevGrammar(InputStream, String)](#m-XPathAbrevGrammar-e1a637b61fa2)
- [XPathAbrevGrammar(Reader)](#m-XPathAbrevGrammar-118515e28a0e)
- [XPathAbrevGrammar(XPathAbrevGrammarTokenManager)](#m-XPathAbrevGrammar-a4de409058c6)

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

- [AbbreviatedAxisSpecifier()](#m-AbbreviatedAxisSpecifier-2077ffc46a36)
- [AbsoluteLocationPath()](#m-AbsoluteLocationPath-4e8bf87fbecb)
- [AxisName()](#m-AxisName-26f35eaa1e25)
- [AxisSpecifier()](#m-AxisSpecifier-3422df92e1f5)
- [CoreFunctionCall()](#m-CoreFunctionCall-bbc848cd7f68)
- [CoreFunctionName()](#m-CoreFunctionName-a9428b54fc9d)
- [disable_tracing()](#m-disable_tracing-6da9cdfdd969)
- [enable_tracing()](#m-enable_tracing-4b87a1586eda)
- [EqualityExpr()](#m-EqualityExpr-01aa6828049d)
- [Expression()](#m-Expression-202b8d891679)
- [FilterExpr()](#m-FilterExpr-2734d9da846d)
- [FunctionCall()](#m-FunctionCall-b53ad6cb019a)
- [FunctionName()](#m-FunctionName-e065b916e82a)
- [generateParseException()](#m-generateParseException-deb7e661e2f1)
- [getNextToken()](#m-getNextToken-dc921ada5024)
- [getToken(int)](#m-getToken-dc7acf63f451)
- [LocationPath()](#m-LocationPath-35ea9d0f3255)
- [LocationStep(ArrayList<Object>)](#m-LocationStep-a5e94dba22db)
- [main(String[])](#m-main-1503518a8568)
- [NCName()](#m-NCName-7b30a4c1f737)
- [NCName_Without_CoreFunctions()](#m-NCName_Without_CoreFunctions-6566bbe274b7)
- [NodeTest(ArrayList<Object>)](#m-NodeTest-22e2f0747db1)
- [parseExpression()](#m-parseExpression-09140d7abc03)
- [PathExpr()](#m-PathExpr-2e73edb0ff0c)
- [Predicate()](#m-Predicate-c03c201960b0)
- [PrimaryExpr()](#m-PrimaryExpr-1e465f74325b)
- [QName()](#m-QName-7107ceb3aca9)
- [QName_Without_CoreFunctions()](#m-QName_Without_CoreFunctions-158727e2e312)
- [ReInit(InputStream)](#m-ReInit-e03395a4a4ba)
- [ReInit(InputStream, String)](#m-ReInit-330085293cfa)
- [ReInit(Reader)](#m-ReInit-4ce6f3557028)
- [ReInit(XPathAbrevGrammarTokenManager)](#m-ReInit-88ffc30c9b57)
- [RelationalExpr()](#m-RelationalExpr-1f528ea442a1)
- [RelativeLocationPath()](#m-RelativeLocationPath-dddce07a8f49)
- [setCompiler(Compiler)](#m-setCompiler-ba6ce2506c89)
- [trace_enabled()](#m-trace_enabled-0d5a0a082fa5)
- [WildcardName()](#m-WildcardName-8dffbb9f4b24)

**Nested Types**:

- [JJCalls](XPathAbrevGrammar/JJCalls.md#cls-JJCalls)
- [MyCompiler](XPathAbrevGrammar/MyCompiler.md#cls-MyCompiler)

## Constructors

### XPathAbrevGrammar(InputStream) <a href="#m-XPathAbrevGrammar-2e473df9b9b4" id="m-XPathAbrevGrammar-2e473df9b9b4"></a>

```java
public XPathAbrevGrammar(java.io.InputStream stream)
```

Constructor with InputStream.

**Parameters**

- `java.io.InputStream stream`

### XPathAbrevGrammar(InputStream, String) <a href="#m-XPathAbrevGrammar-e1a637b61fa2" id="m-XPathAbrevGrammar-e1a637b61fa2"></a>

```java
public XPathAbrevGrammar(java.io.InputStream stream, String encoding)
```

Constructor with InputStream and supplied encoding

**Parameters**

- `java.io.InputStream stream`
- `String encoding`

### XPathAbrevGrammar(Reader) <a href="#m-XPathAbrevGrammar-118515e28a0e" id="m-XPathAbrevGrammar-118515e28a0e"></a>

```java
public XPathAbrevGrammar(java.io.Reader stream)
```

Constructor.

**Parameters**

- `java.io.Reader stream`

### XPathAbrevGrammar(XPathAbrevGrammarTokenManager) <a href="#m-XPathAbrevGrammar-a4de409058c6" id="m-XPathAbrevGrammar-a4de409058c6"></a>

```java
public XPathAbrevGrammar(com.tailf.conf.dbg.XPathAbrevGrammarTokenManager tm)
```

Types: [XPathAbrevGrammarTokenManager](XPathAbrevGrammarTokenManager.md#cls-XPathAbrevGrammarTokenManager)

Constructor with generated Token Manager.

**Parameters**

- `com.tailf.conf.dbg.XPathAbrevGrammarTokenManager tm`


## Fields

### jj_input_stream <a href="#m-jj_input_stream" id="m-jj_input_stream"></a>

**Package-private**

```java
com.tailf.conf.dbg.JavaCharStream jj_input_stream = null;
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

### jj_nt <a href="#m-jj_nt" id="m-jj_nt"></a>

```java
public com.tailf.conf.dbg.Token jj_nt = null;
```

Types: [Token](Token.md#cls-Token)

Next token.

### token <a href="#m-token" id="m-token"></a>

```java
public com.tailf.conf.dbg.Token token = null;
```

Types: [Token](Token.md#cls-Token)

Current token.

### token_source <a href="#m-token_source" id="m-token_source"></a>

```java
public com.tailf.conf.dbg.XPathAbrevGrammarTokenManager token_source = null;
```

Types: [XPathAbrevGrammarTokenManager](XPathAbrevGrammarTokenManager.md#cls-XPathAbrevGrammarTokenManager)

Generated Token Manager.


## Methods

### AbbreviatedAxisSpecifier() <a href="#m-AbbreviatedAxisSpecifier-2077ffc46a36" id="m-AbbreviatedAxisSpecifier-2077ffc46a36"></a>

```java
public final int AbbreviatedAxisSpecifier() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### AbsoluteLocationPath() <a href="#m-AbsoluteLocationPath-4e8bf87fbecb" id="m-AbsoluteLocationPath-4e8bf87fbecb"></a>

```java
public final Object AbsoluteLocationPath() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### AxisName() <a href="#m-AxisName-26f35eaa1e25" id="m-AxisName-26f35eaa1e25"></a>

```java
public final int AxisName() throws com.tailf.conf.dbg.ParseException
```

Types: [ParseException](ParseException.md#cls-ParseException)

### AxisSpecifier() <a href="#m-AxisSpecifier-3422df92e1f5" id="m-AxisSpecifier-3422df92e1f5"></a>

```java
public final int AxisSpecifier() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### CoreFunctionCall() <a href="#m-CoreFunctionCall-bbc848cd7f68" id="m-CoreFunctionCall-bbc848cd7f68"></a>

```java
public final Object CoreFunctionCall() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### CoreFunctionName() <a href="#m-CoreFunctionName-a9428b54fc9d" id="m-CoreFunctionName-a9428b54fc9d"></a>

```java
public final int CoreFunctionName() throws com.tailf.conf.dbg.ParseException
```

Types: [ParseException](ParseException.md#cls-ParseException)

### disable_tracing() <a href="#m-disable_tracing-6da9cdfdd969" id="m-disable_tracing-6da9cdfdd969"></a>

```java
public final void disable_tracing()
```

Disable tracing.

### enable_tracing() <a href="#m-enable_tracing-4b87a1586eda" id="m-enable_tracing-4b87a1586eda"></a>

```java
public final void enable_tracing()
```

Enable tracing.

### EqualityExpr() <a href="#m-EqualityExpr-01aa6828049d" id="m-EqualityExpr-01aa6828049d"></a>

```java
public final Object EqualityExpr() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### Expression() <a href="#m-Expression-202b8d891679" id="m-Expression-202b8d891679"></a>

```java
public final Object Expression() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### FilterExpr() <a href="#m-FilterExpr-2734d9da846d" id="m-FilterExpr-2734d9da846d"></a>

```java
public final Object FilterExpr() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### FunctionCall() <a href="#m-FunctionCall-b53ad6cb019a" id="m-FunctionCall-b53ad6cb019a"></a>

```java
public final Object FunctionCall() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### FunctionName() <a href="#m-FunctionName-e065b916e82a" id="m-FunctionName-e065b916e82a"></a>

```java
public final Object FunctionName() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### generateParseException() <a href="#m-generateParseException-deb7e661e2f1" id="m-generateParseException-deb7e661e2f1"></a>

```java
public com.tailf.conf.dbg.ParseException generateParseException()
```

Types: [ParseException](ParseException.md#cls-ParseException)

Generate ParseException.

### getNextToken() <a href="#m-getNextToken-dc921ada5024" id="m-getNextToken-dc921ada5024"></a>

```java
public final com.tailf.conf.dbg.Token getNextToken()
```

Types: [Token](Token.md#cls-Token)

Get the next Token.

### getToken(int) <a href="#m-getToken-dc7acf63f451" id="m-getToken-dc7acf63f451"></a>

```java
public final com.tailf.conf.dbg.Token getToken(int index)
```

Types: [Token](Token.md#cls-Token)

Get the specific Token.

**Parameters**

- `int index`

### LocationPath() <a href="#m-LocationPath-35ea9d0f3255" id="m-LocationPath-35ea9d0f3255"></a>

```java
public final Object LocationPath() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### LocationStep(ArrayList<Object>) <a href="#m-LocationStep-a5e94dba22db" id="m-LocationStep-a5e94dba22db"></a>

```java
public final void LocationStep(
    java.util.ArrayList<Object> steps
)
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

**Parameters**

- `java.util.ArrayList<Object> steps`

### main(String[]) <a href="#m-main-1503518a8568" id="m-main-1503518a8568"></a>

```java
public static void main(String[] args)
```

**Parameters**

- `String[] args`

### NCName() <a href="#m-NCName-7b30a4c1f737" id="m-NCName-7b30a4c1f737"></a>

```java
public final String NCName() throws com.tailf.conf.dbg.ParseException
```

Types: [ParseException](ParseException.md#cls-ParseException)

### NCName_Without_CoreFunctions() <a href="#m-NCName_Without_CoreFunctions-6566bbe274b7" id="m-NCName_Without_CoreFunctions-6566bbe274b7"></a>

```java
public final String NCName_Without_CoreFunctions() throws com.tailf.conf.dbg.ParseException
```

Types: [ParseException](ParseException.md#cls-ParseException)

### NodeTest(ArrayList<Object>) <a href="#m-NodeTest-22e2f0747db1" id="m-NodeTest-22e2f0747db1"></a>

```java
public final void NodeTest(
    java.util.ArrayList<Object> steps
)
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

**Parameters**

- `java.util.ArrayList<Object> steps`

### parseExpression() <a href="#m-parseExpression-09140d7abc03" id="m-parseExpression-09140d7abc03"></a>

```java
public final Object parseExpression() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### PathExpr() <a href="#m-PathExpr-2e73edb0ff0c" id="m-PathExpr-2e73edb0ff0c"></a>

```java
public final Object PathExpr() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### Predicate() <a href="#m-Predicate-c03c201960b0" id="m-Predicate-c03c201960b0"></a>

```java
public final Object Predicate() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### PrimaryExpr() <a href="#m-PrimaryExpr-1e465f74325b" id="m-PrimaryExpr-1e465f74325b"></a>

```java
public final Object PrimaryExpr() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### QName() <a href="#m-QName-7107ceb3aca9" id="m-QName-7107ceb3aca9"></a>

```java
public final Object QName() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### QName_Without_CoreFunctions() <a href="#m-QName_Without_CoreFunctions-158727e2e312" id="m-QName_Without_CoreFunctions-158727e2e312"></a>

```java
public final Object QName_Without_CoreFunctions() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### ReInit(InputStream) <a href="#m-ReInit-e03395a4a4ba" id="m-ReInit-e03395a4a4ba"></a>

```java
public void ReInit(java.io.InputStream stream)
```

Reinitialise.

**Parameters**

- `java.io.InputStream stream`

### ReInit(InputStream, String) <a href="#m-ReInit-330085293cfa" id="m-ReInit-330085293cfa"></a>

```java
public void ReInit(java.io.InputStream stream, String encoding)
```

Reinitialise.

**Parameters**

- `java.io.InputStream stream`
- `String encoding`

### ReInit(Reader) <a href="#m-ReInit-4ce6f3557028" id="m-ReInit-4ce6f3557028"></a>

```java
public void ReInit(java.io.Reader stream)
```

Reinitialise.

**Parameters**

- `java.io.Reader stream`

### ReInit(XPathAbrevGrammarTokenManager) <a href="#m-ReInit-88ffc30c9b57" id="m-ReInit-88ffc30c9b57"></a>

```java
public void ReInit(com.tailf.conf.dbg.XPathAbrevGrammarTokenManager tm)
```

Types: [XPathAbrevGrammarTokenManager](XPathAbrevGrammarTokenManager.md#cls-XPathAbrevGrammarTokenManager)

Reinitialise.

**Parameters**

- `com.tailf.conf.dbg.XPathAbrevGrammarTokenManager tm`

### RelationalExpr() <a href="#m-RelationalExpr-1f528ea442a1" id="m-RelationalExpr-1f528ea442a1"></a>

```java
public final Object RelationalExpr() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### RelativeLocationPath() <a href="#m-RelativeLocationPath-dddce07a8f49" id="m-RelativeLocationPath-dddce07a8f49"></a>

```java
public final Object RelativeLocationPath() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### setCompiler(Compiler) <a href="#m-setCompiler-ba6ce2506c89" id="m-setCompiler-ba6ce2506c89"></a>

```java
public void setCompiler(com.tailf.conf.Compiler compiler)
```

Types: [Compiler](../Compiler.md#cls-Compiler)

**Parameters**

- `com.tailf.conf.Compiler compiler`

### trace_enabled() <a href="#m-trace_enabled-0d5a0a082fa5" id="m-trace_enabled-0d5a0a082fa5"></a>

```java
public final boolean trace_enabled()
```

Trace enabled.

### WildcardName() <a href="#m-WildcardName-8dffbb9f4b24" id="m-WildcardName-8dffbb9f4b24"></a>

```java
public final Object WildcardName() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)


## Nested Types

- [JJCalls](XPathAbrevGrammar/JJCalls.md#cls-JJCalls)
- [MyCompiler](XPathAbrevGrammar/MyCompiler.md#cls-MyCompiler)
