<a id="s-XPathAbrevGrammar"></a>
# XPathAbrevGrammar

```java
public class com.tailf.conf.dbg.XPathAbrevGrammar
    implements com.tailf.conf.dbg.XPathAbrevGrammarConstants
```

Types: [XPathAbrevGrammarConstants](XPathAbrevGrammarConstants.md#s-XPathAbrevGrammarConstants)

## Members

**Constructors**:

- [XPathAbrevGrammar(InputStream)](#s-XPathAbrevGrammar-1)
- [XPathAbrevGrammar(InputStream, String)](#s-XPathAbrevGrammar-2)
- [XPathAbrevGrammar(Reader)](#s-XPathAbrevGrammar-3)
- [XPathAbrevGrammar(XPathAbrevGrammarTokenManager)](#s-XPathAbrevGrammar-4)

**Fields**:

- [AXIS_ANCESTOR](XPathAbrevGrammarConstants.md#s-AXIS_ANCESTOR) from XPathAbrevGrammarConstants
- [AXIS_ANCESTOR_OR_SELF](XPathAbrevGrammarConstants.md#s-AXIS_ANCESTOR_OR_SELF) from XPathAbrevGrammarConstants
- [AXIS_ATTRIBUTE](XPathAbrevGrammarConstants.md#s-AXIS_ATTRIBUTE) from XPathAbrevGrammarConstants
- [AXIS_CHILD](XPathAbrevGrammarConstants.md#s-AXIS_CHILD) from XPathAbrevGrammarConstants
- [AXIS_DESCENDANT](XPathAbrevGrammarConstants.md#s-AXIS_DESCENDANT) from XPathAbrevGrammarConstants
- [AXIS_DESCENDANT_OR_SELF](XPathAbrevGrammarConstants.md#s-AXIS_DESCENDANT_OR_SELF) from XPathAbrevGrammarConstants
- [AXIS_FOLLOWING](XPathAbrevGrammarConstants.md#s-AXIS_FOLLOWING) from XPathAbrevGrammarConstants
- [AXIS_FOLLOWING_SIBLING](XPathAbrevGrammarConstants.md#s-AXIS_FOLLOWING_SIBLING) from XPathAbrevGrammarConstants
- [AXIS_NAMESPACE](XPathAbrevGrammarConstants.md#s-AXIS_NAMESPACE) from XPathAbrevGrammarConstants
- [AXIS_PARENT](XPathAbrevGrammarConstants.md#s-AXIS_PARENT) from XPathAbrevGrammarConstants
- [AXIS_PRECEDING](XPathAbrevGrammarConstants.md#s-AXIS_PRECEDING) from XPathAbrevGrammarConstants
- [AXIS_PRECEDING_SIBLING](XPathAbrevGrammarConstants.md#s-AXIS_PRECEDING_SIBLING) from XPathAbrevGrammarConstants
- [AXIS_SELF](XPathAbrevGrammarConstants.md#s-AXIS_SELF) from XPathAbrevGrammarConstants
- [BaseChar](XPathAbrevGrammarConstants.md#s-BaseChar) from XPathAbrevGrammarConstants
- [CombiningChar](XPathAbrevGrammarConstants.md#s-CombiningChar) from XPathAbrevGrammarConstants
- [DEFAULT](XPathAbrevGrammarConstants.md#s-DEFAULT) from XPathAbrevGrammarConstants
- [Digit](XPathAbrevGrammarConstants.md#s-Digit) from XPathAbrevGrammarConstants
- [EOF](XPathAbrevGrammarConstants.md#s-EOF) from XPathAbrevGrammarConstants
- [EQ](XPathAbrevGrammarConstants.md#s-EQ) from XPathAbrevGrammarConstants
- [Extender](XPathAbrevGrammarConstants.md#s-Extender) from XPathAbrevGrammarConstants
- [FUNCTION_CURRENT](XPathAbrevGrammarConstants.md#s-FUNCTION_CURRENT) from XPathAbrevGrammarConstants
- [Ideographic](XPathAbrevGrammarConstants.md#s-Ideographic) from XPathAbrevGrammarConstants
- [jj_input_stream](#s-jj_input_stream)
- [jj_nt](#s-jj_nt)
- [Letter](XPathAbrevGrammarConstants.md#s-Letter) from XPathAbrevGrammarConstants
- [Literal](XPathAbrevGrammarConstants.md#s-Literal) from XPathAbrevGrammarConstants
- [NCName](XPathAbrevGrammarConstants.md#s-NCName) from XPathAbrevGrammarConstants
- [Number](XPathAbrevGrammarConstants.md#s-Number) from XPathAbrevGrammarConstants
- [SLASH](XPathAbrevGrammarConstants.md#s-SLASH) from XPathAbrevGrammarConstants
- [token](#s-token)
- [token_source](#s-token_source)
- [tokenImage](XPathAbrevGrammarConstants.md#s-tokenImage) from XPathAbrevGrammarConstants
- [UnicodeDigit](XPathAbrevGrammarConstants.md#s-UnicodeDigit) from XPathAbrevGrammarConstants

**Methods**:

- [AbbreviatedAxisSpecifier()](#s-AbbreviatedAxisSpecifier)
- [AbsoluteLocationPath()](#s-AbsoluteLocationPath)
- [AxisName()](#s-AxisName)
- [AxisSpecifier()](#s-AxisSpecifier)
- [CoreFunctionCall()](#s-CoreFunctionCall)
- [CoreFunctionName()](#s-CoreFunctionName)
- [disable_tracing()](#s-disable_tracing)
- [enable_tracing()](#s-enable_tracing)
- [EqualityExpr()](#s-EqualityExpr)
- [Expression()](#s-Expression)
- [FilterExpr()](#s-FilterExpr)
- [FunctionCall()](#s-FunctionCall)
- [FunctionName()](#s-FunctionName)
- [generateParseException()](#s-generateParseException)
- [getNextToken()](#s-getNextToken)
- [getToken(int)](#s-getToken)
- [LocationPath()](#s-LocationPath)
- [LocationStep(ArrayList<Object>)](#s-LocationStep)
- [main(String[])](#s-main)
- [NCName()](#s-NCName)
- [NCName_Without_CoreFunctions()](#s-NCName_Without_CoreFunctions)
- [NodeTest(ArrayList<Object>)](#s-NodeTest)
- [parseExpression()](#s-parseExpression)
- [PathExpr()](#s-PathExpr)
- [Predicate()](#s-Predicate)
- [PrimaryExpr()](#s-PrimaryExpr)
- [QName()](#s-QName)
- [QName_Without_CoreFunctions()](#s-QName_Without_CoreFunctions)
- [ReInit(InputStream)](#s-ReInit)
- [ReInit(InputStream, String)](#s-ReInit-1)
- [ReInit(Reader)](#s-ReInit-2)
- [ReInit(XPathAbrevGrammarTokenManager)](#s-ReInit-3)
- [RelationalExpr()](#s-RelationalExpr)
- [RelativeLocationPath()](#s-RelativeLocationPath)
- [setCompiler(Compiler)](#s-setCompiler)
- [trace_enabled()](#s-trace_enabled)
- [WildcardName()](#s-WildcardName)

**Nested Types**:

- [JJCalls](XPathAbrevGrammar/JJCalls.md#s-JJCalls)
- [MyCompiler](XPathAbrevGrammar/MyCompiler.md#s-MyCompiler)

## Constructors

<a id="s-XPathAbrevGrammar-1"></a>
### XPathAbrevGrammar(InputStream)

```java
public XPathAbrevGrammar(java.io.InputStream stream)
```

Constructor with InputStream.

**Parameters**

- `java.io.InputStream stream`

<a id="s-XPathAbrevGrammar-2"></a>
### XPathAbrevGrammar(InputStream, String)

```java
public XPathAbrevGrammar(java.io.InputStream stream, String encoding)
```

Constructor with InputStream and supplied encoding

**Parameters**

- `java.io.InputStream stream`
- `String encoding`

<a id="s-XPathAbrevGrammar-3"></a>
### XPathAbrevGrammar(Reader)

```java
public XPathAbrevGrammar(java.io.Reader stream)
```

Constructor.

**Parameters**

- `java.io.Reader stream`

<a id="s-XPathAbrevGrammar-4"></a>
### XPathAbrevGrammar(XPathAbrevGrammarTokenManager)

```java
public XPathAbrevGrammar(com.tailf.conf.dbg.XPathAbrevGrammarTokenManager tm)
```

Types: [XPathAbrevGrammarTokenManager](XPathAbrevGrammarTokenManager.md#s-XPathAbrevGrammarTokenManager)

Constructor with generated Token Manager.

**Parameters**

- `com.tailf.conf.dbg.XPathAbrevGrammarTokenManager tm`


## Fields

<a id="s-jj_input_stream"></a>
### jj_input_stream

**Package-private**

```java
com.tailf.conf.dbg.JavaCharStream jj_input_stream = null;
```

Types: [JavaCharStream](JavaCharStream.md#s-JavaCharStream)

<a id="s-jj_nt"></a>
### jj_nt

```java
public com.tailf.conf.dbg.Token jj_nt = null;
```

Types: [Token](Token.md#s-Token)

Next token.

<a id="s-token"></a>
### token

```java
public com.tailf.conf.dbg.Token token = null;
```

Types: [Token](Token.md#s-Token)

Current token.

<a id="s-token_source"></a>
### token_source

```java
public com.tailf.conf.dbg.XPathAbrevGrammarTokenManager token_source = null;
```

Types: [XPathAbrevGrammarTokenManager](XPathAbrevGrammarTokenManager.md#s-XPathAbrevGrammarTokenManager)

Generated Token Manager.


## Methods

<a id="s-AbbreviatedAxisSpecifier"></a>
### AbbreviatedAxisSpecifier()

```java
public final int AbbreviatedAxisSpecifier() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-AbsoluteLocationPath"></a>
### AbsoluteLocationPath()

```java
public final Object AbsoluteLocationPath() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-AxisName"></a>
### AxisName()

```java
public final int AxisName() throws com.tailf.conf.dbg.ParseException
```

Types: [ParseException](ParseException.md#s-ParseException)

<a id="s-AxisSpecifier"></a>
### AxisSpecifier()

```java
public final int AxisSpecifier() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-CoreFunctionCall"></a>
### CoreFunctionCall()

```java
public final Object CoreFunctionCall() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-CoreFunctionName"></a>
### CoreFunctionName()

```java
public final int CoreFunctionName() throws com.tailf.conf.dbg.ParseException
```

Types: [ParseException](ParseException.md#s-ParseException)

<a id="s-disable_tracing"></a>
### disable_tracing()

```java
public final void disable_tracing()
```

Disable tracing.

<a id="s-enable_tracing"></a>
### enable_tracing()

```java
public final void enable_tracing()
```

Enable tracing.

<a id="s-EqualityExpr"></a>
### EqualityExpr()

```java
public final Object EqualityExpr() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-Expression"></a>
### Expression()

```java
public final Object Expression() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-FilterExpr"></a>
### FilterExpr()

```java
public final Object FilterExpr() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-FunctionCall"></a>
### FunctionCall()

```java
public final Object FunctionCall() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-FunctionName"></a>
### FunctionName()

```java
public final Object FunctionName() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-generateParseException"></a>
### generateParseException()

```java
public com.tailf.conf.dbg.ParseException generateParseException()
```

Types: [ParseException](ParseException.md#s-ParseException)

Generate ParseException.

<a id="s-getNextToken"></a>
### getNextToken()

```java
public final com.tailf.conf.dbg.Token getNextToken()
```

Types: [Token](Token.md#s-Token)

Get the next Token.

<a id="s-getToken"></a>
### getToken(int)

```java
public final com.tailf.conf.dbg.Token getToken(int index)
```

Types: [Token](Token.md#s-Token)

Get the specific Token.

**Parameters**

- `int index`

<a id="s-LocationPath"></a>
### LocationPath()

```java
public final Object LocationPath() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-LocationStep"></a>
### LocationStep(ArrayList<Object>)

```java
public final void LocationStep(
    java.util.ArrayList<Object> steps
)
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

**Parameters**

- `java.util.ArrayList<Object> steps`

<a id="s-main"></a>
### main(String[])

```java
public static void main(String[] args)
```

**Parameters**

- `String[] args`

<a id="s-NCName"></a>
### NCName()

```java
public final String NCName() throws com.tailf.conf.dbg.ParseException
```

Types: [ParseException](ParseException.md#s-ParseException)

<a id="s-NCName_Without_CoreFunctions"></a>
### NCName_Without_CoreFunctions()

```java
public final String NCName_Without_CoreFunctions() throws com.tailf.conf.dbg.ParseException
```

Types: [ParseException](ParseException.md#s-ParseException)

<a id="s-NodeTest"></a>
### NodeTest(ArrayList<Object>)

```java
public final void NodeTest(
    java.util.ArrayList<Object> steps
)
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

**Parameters**

- `java.util.ArrayList<Object> steps`

<a id="s-parseExpression"></a>
### parseExpression()

```java
public final Object parseExpression() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-PathExpr"></a>
### PathExpr()

```java
public final Object PathExpr() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-Predicate"></a>
### Predicate()

```java
public final Object Predicate() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-PrimaryExpr"></a>
### PrimaryExpr()

```java
public final Object PrimaryExpr() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-QName"></a>
### QName()

```java
public final Object QName() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-QName_Without_CoreFunctions"></a>
### QName_Without_CoreFunctions()

```java
public final Object QName_Without_CoreFunctions() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-ReInit"></a>
### ReInit(InputStream)

```java
public void ReInit(java.io.InputStream stream)
```

Reinitialise.

**Parameters**

- `java.io.InputStream stream`

<a id="s-ReInit-1"></a>
### ReInit(InputStream, String)

```java
public void ReInit(java.io.InputStream stream, String encoding)
```

Reinitialise.

**Parameters**

- `java.io.InputStream stream`
- `String encoding`

<a id="s-ReInit-2"></a>
### ReInit(Reader)

```java
public void ReInit(java.io.Reader stream)
```

Reinitialise.

**Parameters**

- `java.io.Reader stream`

<a id="s-ReInit-3"></a>
### ReInit(XPathAbrevGrammarTokenManager)

```java
public void ReInit(com.tailf.conf.dbg.XPathAbrevGrammarTokenManager tm)
```

Types: [XPathAbrevGrammarTokenManager](XPathAbrevGrammarTokenManager.md#s-XPathAbrevGrammarTokenManager)

Reinitialise.

**Parameters**

- `com.tailf.conf.dbg.XPathAbrevGrammarTokenManager tm`

<a id="s-RelationalExpr"></a>
### RelationalExpr()

```java
public final Object RelationalExpr() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-RelativeLocationPath"></a>
### RelativeLocationPath()

```java
public final Object RelativeLocationPath() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-setCompiler"></a>
### setCompiler(Compiler)

```java
public void setCompiler(com.tailf.conf.Compiler compiler)
```

Types: [Compiler](../Compiler.md#s-Compiler)

**Parameters**

- `com.tailf.conf.Compiler compiler`

<a id="s-trace_enabled"></a>
### trace_enabled()

```java
public final boolean trace_enabled()
```

Trace enabled.

<a id="s-WildcardName"></a>
### WildcardName()

```java
public final Object WildcardName() throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.dbg.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)


## Nested Types

- [JJCalls](XPathAbrevGrammar/JJCalls.md)
- [MyCompiler](XPathAbrevGrammar/MyCompiler.md)
