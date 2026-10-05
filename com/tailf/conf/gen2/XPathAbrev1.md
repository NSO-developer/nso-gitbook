<a id="s-XPathAbrev1"></a>
# XPathAbrev1

```java
public class com.tailf.conf.gen2.XPathAbrev1
    implements com.tailf.conf.gen2.XPathAbrev1Constants
```

Types: [XPathAbrev1Constants](XPathAbrev1Constants.md#s-XPathAbrev1Constants)

## Members

**Constructors**:

- [XPathAbrev1(InputStream)](#s-XPathAbrev1-1)
- [XPathAbrev1(InputStream, String)](#s-XPathAbrev1-2)
- [XPathAbrev1(Reader)](#s-XPathAbrev1-3)
- [XPathAbrev1(XPathAbrev1TokenManager)](#s-XPathAbrev1-4)

**Fields**:

- [AXIS_ANCESTOR](XPathAbrev1Constants.md#s-AXIS_ANCESTOR) from XPathAbrev1Constants
- [AXIS_ANCESTOR_OR_SELF](XPathAbrev1Constants.md#s-AXIS_ANCESTOR_OR_SELF) from XPathAbrev1Constants
- [AXIS_ATTRIBUTE](XPathAbrev1Constants.md#s-AXIS_ATTRIBUTE) from XPathAbrev1Constants
- [AXIS_CHILD](XPathAbrev1Constants.md#s-AXIS_CHILD) from XPathAbrev1Constants
- [AXIS_DESCENDANT](XPathAbrev1Constants.md#s-AXIS_DESCENDANT) from XPathAbrev1Constants
- [AXIS_DESCENDANT_OR_SELF](XPathAbrev1Constants.md#s-AXIS_DESCENDANT_OR_SELF) from XPathAbrev1Constants
- [AXIS_FOLLOWING](XPathAbrev1Constants.md#s-AXIS_FOLLOWING) from XPathAbrev1Constants
- [AXIS_FOLLOWING_SIBLING](XPathAbrev1Constants.md#s-AXIS_FOLLOWING_SIBLING) from XPathAbrev1Constants
- [AXIS_NAMESPACE](XPathAbrev1Constants.md#s-AXIS_NAMESPACE) from XPathAbrev1Constants
- [AXIS_PARENT](XPathAbrev1Constants.md#s-AXIS_PARENT) from XPathAbrev1Constants
- [AXIS_PRECEDING](XPathAbrev1Constants.md#s-AXIS_PRECEDING) from XPathAbrev1Constants
- [AXIS_PRECEDING_SIBLING](XPathAbrev1Constants.md#s-AXIS_PRECEDING_SIBLING) from XPathAbrev1Constants
- [AXIS_SELF](XPathAbrev1Constants.md#s-AXIS_SELF) from XPathAbrev1Constants
- [BaseChar](XPathAbrev1Constants.md#s-BaseChar) from XPathAbrev1Constants
- [CombiningChar](XPathAbrev1Constants.md#s-CombiningChar) from XPathAbrev1Constants
- [DEFAULT](XPathAbrev1Constants.md#s-DEFAULT) from XPathAbrev1Constants
- [Digit](XPathAbrev1Constants.md#s-Digit) from XPathAbrev1Constants
- [EOF](XPathAbrev1Constants.md#s-EOF) from XPathAbrev1Constants
- [EQ](XPathAbrev1Constants.md#s-EQ) from XPathAbrev1Constants
- [Extender](XPathAbrev1Constants.md#s-Extender) from XPathAbrev1Constants
- [FUNCTION_CURRENT](XPathAbrev1Constants.md#s-FUNCTION_CURRENT) from XPathAbrev1Constants
- [Ideographic](XPathAbrev1Constants.md#s-Ideographic) from XPathAbrev1Constants
- [jj_input_stream](#s-jj_input_stream)
- [jj_nt](#s-jj_nt)
- [Letter](XPathAbrev1Constants.md#s-Letter) from XPathAbrev1Constants
- [Literal](XPathAbrev1Constants.md#s-Literal) from XPathAbrev1Constants
- [NCName](XPathAbrev1Constants.md#s-NCName) from XPathAbrev1Constants
- [Number](XPathAbrev1Constants.md#s-Number) from XPathAbrev1Constants
- [SLASH](XPathAbrev1Constants.md#s-SLASH) from XPathAbrev1Constants
- [token](#s-token)
- [token_source](#s-token_source)
- [tokenImage](XPathAbrev1Constants.md#s-tokenImage) from XPathAbrev1Constants
- [UnicodeDigit](XPathAbrev1Constants.md#s-UnicodeDigit) from XPathAbrev1Constants

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
- [NCName()](#s-NCName)
- [NCName_Without_CoreFunctions()](#s-NCName_Without_CoreFunctions)
- [NodeTest(ArrayList<Object>)](#s-NodeTest)
- [parse(String, MountIdInterface)](#s-parse)
- [parseExpression()](#s-parseExpression)
- [PathExpr()](#s-PathExpr)
- [Predicate()](#s-Predicate)
- [PrimaryExpr()](#s-PrimaryExpr)
- [QName()](#s-QName)
- [QName_Without_CoreFunctions()](#s-QName_Without_CoreFunctions)
- [ReInit(InputStream)](#s-ReInit)
- [ReInit(InputStream, String)](#s-ReInit-1)
- [ReInit(Reader)](#s-ReInit-2)
- [ReInit(XPathAbrev1TokenManager)](#s-ReInit-3)
- [RelationalExpr()](#s-RelationalExpr)
- [RelativeLocationPath()](#s-RelativeLocationPath)
- [setCompiler(Compiler)](#s-setCompiler)
- [trace_enabled()](#s-trace_enabled)
- [WildcardName()](#s-WildcardName)

**Nested Types**:

- [JJCalls](XPathAbrev1/JJCalls.md#s-JJCalls)

## Constructors

<a id="s-XPathAbrev1-1"></a>
### XPathAbrev1(InputStream)

```java
public XPathAbrev1(java.io.InputStream stream)
```

Constructor with InputStream.

**Parameters**

- `java.io.InputStream stream`

<a id="s-XPathAbrev1-2"></a>
### XPathAbrev1(InputStream, String)

```java
public XPathAbrev1(java.io.InputStream stream, String encoding)
```

Constructor with InputStream and supplied encoding

**Parameters**

- `java.io.InputStream stream`
- `String encoding`

<a id="s-XPathAbrev1-3"></a>
### XPathAbrev1(Reader)

```java
public XPathAbrev1(java.io.Reader stream)
```

Constructor.

**Parameters**

- `java.io.Reader stream`

<a id="s-XPathAbrev1-4"></a>
### XPathAbrev1(XPathAbrev1TokenManager)

```java
public XPathAbrev1(com.tailf.conf.gen2.XPathAbrev1TokenManager tm)
```

Types: [XPathAbrev1TokenManager](XPathAbrev1TokenManager.md#s-XPathAbrev1TokenManager)

Constructor with generated Token Manager.

**Parameters**

- `com.tailf.conf.gen2.XPathAbrev1TokenManager tm`


## Fields

<a id="s-jj_input_stream"></a>
### jj_input_stream

**Package-private**

```java
com.tailf.conf.gen2.JavaCharStream jj_input_stream = null;
```

Types: [JavaCharStream](JavaCharStream.md#s-JavaCharStream)

<a id="s-jj_nt"></a>
### jj_nt

```java
public com.tailf.conf.gen2.Token jj_nt = null;
```

Types: [Token](Token.md#s-Token)

Next token.

<a id="s-token"></a>
### token

```java
public com.tailf.conf.gen2.Token token = null;
```

Types: [Token](Token.md#s-Token)

Current token.

<a id="s-token_source"></a>
### token_source

```java
public com.tailf.conf.gen2.XPathAbrev1TokenManager token_source = null;
```

Types: [XPathAbrev1TokenManager](XPathAbrev1TokenManager.md#s-XPathAbrev1TokenManager)

Generated Token Manager.


## Methods

<a id="s-AbbreviatedAxisSpecifier"></a>
### AbbreviatedAxisSpecifier()

```java
public final int AbbreviatedAxisSpecifier() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-AbsoluteLocationPath"></a>
### AbsoluteLocationPath()

```java
public final Object AbsoluteLocationPath() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-AxisName"></a>
### AxisName()

```java
public final int AxisName() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-AxisSpecifier"></a>
### AxisSpecifier()

```java
public final int AxisSpecifier() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-CoreFunctionCall"></a>
### CoreFunctionCall()

```java
public final Object CoreFunctionCall() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-CoreFunctionName"></a>
### CoreFunctionName()

```java
public final int CoreFunctionName() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

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
public final Object EqualityExpr() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-Expression"></a>
### Expression()

```java
public final Object Expression() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-FilterExpr"></a>
### FilterExpr()

```java
public final Object FilterExpr() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-FunctionCall"></a>
### FunctionCall()

```java
public final Object FunctionCall() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-FunctionName"></a>
### FunctionName()

```java
public final Object FunctionName() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-generateParseException"></a>
### generateParseException()

```java
public com.tailf.conf.gen2.ParseException generateParseException()
```

Types: [ParseException](ParseException.md#s-ParseException)

Generate ParseException.

<a id="s-getNextToken"></a>
### getNextToken()

```java
public final com.tailf.conf.gen2.Token getNextToken()
```

Types: [Token](Token.md#s-Token)

Get the next Token.

<a id="s-getToken"></a>
### getToken(int)

```java
public final com.tailf.conf.gen2.Token getToken(int index)
```

Types: [Token](Token.md#s-Token)

Get the specific Token.

**Parameters**

- `int index`

<a id="s-LocationPath"></a>
### LocationPath()

```java
public final Object LocationPath() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-LocationStep"></a>
### LocationStep(ArrayList<Object>)

```java
public final void LocationStep(
    java.util.ArrayList<Object> steps
)
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

**Parameters**

- `java.util.ArrayList<Object> steps`

<a id="s-NCName"></a>
### NCName()

```java
public final String NCName() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-NCName_Without_CoreFunctions"></a>
### NCName_Without_CoreFunctions()

```java
public final String NCName_Without_CoreFunctions() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-NodeTest"></a>
### NodeTest(ArrayList<Object>)

```java
public final void NodeTest(
    java.util.ArrayList<Object> steps
)
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

**Parameters**

- `java.util.ArrayList<Object> steps`

<a id="s-parse"></a>
### parse(String, MountIdInterface)

```java
public static com.tailf.conf.Compiler parse(
    String line,
    com.tailf.conf.MountIdInterface mountGetter
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [Compiler](../Compiler.md#s-Compiler), [MountIdInterface](../MountIdInterface.md#s-MountIdInterface), [ConfException](../ConfException.md#s-ConfException)

**Parameters**

- `String line`
- `com.tailf.conf.MountIdInterface mountGetter`

<a id="s-parseExpression"></a>
### parseExpression()

```java
public final Object parseExpression() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-PathExpr"></a>
### PathExpr()

```java
public final Object PathExpr() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-Predicate"></a>
### Predicate()

```java
public final Object Predicate() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-PrimaryExpr"></a>
### PrimaryExpr()

```java
public final Object PrimaryExpr() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-QName"></a>
### QName()

```java
public final Object QName() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-QName_Without_CoreFunctions"></a>
### QName_Without_CoreFunctions()

```java
public final Object QName_Without_CoreFunctions() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
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
### ReInit(XPathAbrev1TokenManager)

```java
public void ReInit(com.tailf.conf.gen2.XPathAbrev1TokenManager tm)
```

Types: [XPathAbrev1TokenManager](XPathAbrev1TokenManager.md#s-XPathAbrev1TokenManager)

Reinitialise.

**Parameters**

- `com.tailf.conf.gen2.XPathAbrev1TokenManager tm`

<a id="s-RelationalExpr"></a>
### RelationalExpr()

```java
public final Object RelationalExpr() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)

<a id="s-RelativeLocationPath"></a>
### RelativeLocationPath()

```java
public final Object RelativeLocationPath() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
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
public final Object WildcardName() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#s-ParseException), [ConfException](../ConfException.md#s-ConfException)


## Nested Types

- [JJCalls](XPathAbrev1/JJCalls.md)
