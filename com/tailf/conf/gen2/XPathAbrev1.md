# XPathAbrev1 <a href="#cls-XPathAbrev1" id="cls-XPathAbrev1"></a>

```java
public class com.tailf.conf.gen2.XPathAbrev1
    implements com.tailf.conf.gen2.XPathAbrev1Constants
```

Types: [XPathAbrev1Constants](XPathAbrev1Constants.md#cls-XPathAbrev1Constants)

## Members

**Constructors**:

- [XPathAbrev1(InputStream)](#m-XPathAbrev1-80044810d17a)
- [XPathAbrev1(InputStream, String)](#m-XPathAbrev1-1182b6f6db85)
- [XPathAbrev1(Reader)](#m-XPathAbrev1-e0aec549afa6)
- [XPathAbrev1(XPathAbrev1TokenManager)](#m-XPathAbrev1-b45a7fedd78a)

**Fields**:

- [AXIS_ANCESTOR](XPathAbrev1Constants.md#m-AXIS_ANCESTOR) from XPathAbrev1Constants
- [AXIS_ANCESTOR_OR_SELF](XPathAbrev1Constants.md#m-AXIS_ANCESTOR_OR_SELF) from XPathAbrev1Constants
- [AXIS_ATTRIBUTE](XPathAbrev1Constants.md#m-AXIS_ATTRIBUTE) from XPathAbrev1Constants
- [AXIS_CHILD](XPathAbrev1Constants.md#m-AXIS_CHILD) from XPathAbrev1Constants
- [AXIS_DESCENDANT](XPathAbrev1Constants.md#m-AXIS_DESCENDANT) from XPathAbrev1Constants
- [AXIS_DESCENDANT_OR_SELF](XPathAbrev1Constants.md#m-AXIS_DESCENDANT_OR_SELF) from XPathAbrev1Constants
- [AXIS_FOLLOWING](XPathAbrev1Constants.md#m-AXIS_FOLLOWING) from XPathAbrev1Constants
- [AXIS_FOLLOWING_SIBLING](XPathAbrev1Constants.md#m-AXIS_FOLLOWING_SIBLING) from XPathAbrev1Constants
- [AXIS_NAMESPACE](XPathAbrev1Constants.md#m-AXIS_NAMESPACE) from XPathAbrev1Constants
- [AXIS_PARENT](XPathAbrev1Constants.md#m-AXIS_PARENT) from XPathAbrev1Constants
- [AXIS_PRECEDING](XPathAbrev1Constants.md#m-AXIS_PRECEDING) from XPathAbrev1Constants
- [AXIS_PRECEDING_SIBLING](XPathAbrev1Constants.md#m-AXIS_PRECEDING_SIBLING) from XPathAbrev1Constants
- [AXIS_SELF](XPathAbrev1Constants.md#m-AXIS_SELF) from XPathAbrev1Constants
- [BaseChar](XPathAbrev1Constants.md#m-BaseChar) from XPathAbrev1Constants
- [CombiningChar](XPathAbrev1Constants.md#m-CombiningChar) from XPathAbrev1Constants
- [DEFAULT](XPathAbrev1Constants.md#m-DEFAULT) from XPathAbrev1Constants
- [Digit](XPathAbrev1Constants.md#m-Digit) from XPathAbrev1Constants
- [EOF](XPathAbrev1Constants.md#m-EOF) from XPathAbrev1Constants
- [EQ](XPathAbrev1Constants.md#m-EQ) from XPathAbrev1Constants
- [Extender](XPathAbrev1Constants.md#m-Extender) from XPathAbrev1Constants
- [FUNCTION_CURRENT](XPathAbrev1Constants.md#m-FUNCTION_CURRENT) from XPathAbrev1Constants
- [Ideographic](XPathAbrev1Constants.md#m-Ideographic) from XPathAbrev1Constants
- [jj_input_stream](#m-jj_input_stream)
- [jj_nt](#m-jj_nt)
- [Letter](XPathAbrev1Constants.md#m-Letter) from XPathAbrev1Constants
- [Literal](XPathAbrev1Constants.md#m-Literal) from XPathAbrev1Constants
- [NCName](XPathAbrev1Constants.md#m-NCName) from XPathAbrev1Constants
- [Number](XPathAbrev1Constants.md#m-Number) from XPathAbrev1Constants
- [SLASH](XPathAbrev1Constants.md#m-SLASH) from XPathAbrev1Constants
- [token](#m-token)
- [token_source](#m-token_source)
- [tokenImage](XPathAbrev1Constants.md#m-tokenImage) from XPathAbrev1Constants
- [UnicodeDigit](XPathAbrev1Constants.md#m-UnicodeDigit) from XPathAbrev1Constants

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
- [NCName()](#m-NCName-7b30a4c1f737)
- [NCName_Without_CoreFunctions()](#m-NCName_Without_CoreFunctions-6566bbe274b7)
- [NodeTest(ArrayList<Object>)](#m-NodeTest-22e2f0747db1)
- [parse(String, MountIdInterface)](#m-parse-400296062d9d)
- [parseExpression()](#m-parseExpression-09140d7abc03)
- [PathExpr()](#m-PathExpr-2e73edb0ff0c)
- [Predicate()](#m-Predicate-c03c201960b0)
- [PrimaryExpr()](#m-PrimaryExpr-1e465f74325b)
- [QName()](#m-QName-7107ceb3aca9)
- [QName_Without_CoreFunctions()](#m-QName_Without_CoreFunctions-158727e2e312)
- [ReInit(InputStream)](#m-ReInit-e03395a4a4ba)
- [ReInit(InputStream, String)](#m-ReInit-330085293cfa)
- [ReInit(Reader)](#m-ReInit-4ce6f3557028)
- [ReInit(XPathAbrev1TokenManager)](#m-ReInit-5aac9f929a90)
- [RelationalExpr()](#m-RelationalExpr-1f528ea442a1)
- [RelativeLocationPath()](#m-RelativeLocationPath-dddce07a8f49)
- [setCompiler(Compiler)](#m-setCompiler-ba6ce2506c89)
- [trace_enabled()](#m-trace_enabled-0d5a0a082fa5)
- [WildcardName()](#m-WildcardName-8dffbb9f4b24)

**Nested Types**:

- [JJCalls](XPathAbrev1/JJCalls.md#cls-JJCalls)

## Constructors

### XPathAbrev1(InputStream) <a href="#m-XPathAbrev1-80044810d17a" id="m-XPathAbrev1-80044810d17a"></a>

```java
public XPathAbrev1(java.io.InputStream stream)
```

Constructor with InputStream.

**Parameters**

- `java.io.InputStream stream`

### XPathAbrev1(InputStream, String) <a href="#m-XPathAbrev1-1182b6f6db85" id="m-XPathAbrev1-1182b6f6db85"></a>

```java
public XPathAbrev1(java.io.InputStream stream, String encoding)
```

Constructor with InputStream and supplied encoding

**Parameters**

- `java.io.InputStream stream`
- `String encoding`

### XPathAbrev1(Reader) <a href="#m-XPathAbrev1-e0aec549afa6" id="m-XPathAbrev1-e0aec549afa6"></a>

```java
public XPathAbrev1(java.io.Reader stream)
```

Constructor.

**Parameters**

- `java.io.Reader stream`

### XPathAbrev1(XPathAbrev1TokenManager) <a href="#m-XPathAbrev1-b45a7fedd78a" id="m-XPathAbrev1-b45a7fedd78a"></a>

```java
public XPathAbrev1(com.tailf.conf.gen2.XPathAbrev1TokenManager tm)
```

Types: [XPathAbrev1TokenManager](XPathAbrev1TokenManager.md#cls-XPathAbrev1TokenManager)

Constructor with generated Token Manager.

**Parameters**

- `com.tailf.conf.gen2.XPathAbrev1TokenManager tm`


## Fields

### jj_input_stream <a href="#m-jj_input_stream" id="m-jj_input_stream"></a>

**Package-private**

```java
com.tailf.conf.gen2.JavaCharStream jj_input_stream = null;
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

### jj_nt <a href="#m-jj_nt" id="m-jj_nt"></a>

```java
public com.tailf.conf.gen2.Token jj_nt = null;
```

Types: [Token](Token.md#cls-Token)

Next token.

### token <a href="#m-token" id="m-token"></a>

```java
public com.tailf.conf.gen2.Token token = null;
```

Types: [Token](Token.md#cls-Token)

Current token.

### token_source <a href="#m-token_source" id="m-token_source"></a>

```java
public com.tailf.conf.gen2.XPathAbrev1TokenManager token_source = null;
```

Types: [XPathAbrev1TokenManager](XPathAbrev1TokenManager.md#cls-XPathAbrev1TokenManager)

Generated Token Manager.


## Methods

### AbbreviatedAxisSpecifier() <a href="#m-AbbreviatedAxisSpecifier-2077ffc46a36" id="m-AbbreviatedAxisSpecifier-2077ffc46a36"></a>

```java
public final int AbbreviatedAxisSpecifier() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### AbsoluteLocationPath() <a href="#m-AbsoluteLocationPath-4e8bf87fbecb" id="m-AbsoluteLocationPath-4e8bf87fbecb"></a>

```java
public final Object AbsoluteLocationPath() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### AxisName() <a href="#m-AxisName-26f35eaa1e25" id="m-AxisName-26f35eaa1e25"></a>

```java
public final int AxisName() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### AxisSpecifier() <a href="#m-AxisSpecifier-3422df92e1f5" id="m-AxisSpecifier-3422df92e1f5"></a>

```java
public final int AxisSpecifier() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### CoreFunctionCall() <a href="#m-CoreFunctionCall-bbc848cd7f68" id="m-CoreFunctionCall-bbc848cd7f68"></a>

```java
public final Object CoreFunctionCall() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### CoreFunctionName() <a href="#m-CoreFunctionName-a9428b54fc9d" id="m-CoreFunctionName-a9428b54fc9d"></a>

```java
public final int CoreFunctionName() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

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
public final Object EqualityExpr() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### Expression() <a href="#m-Expression-202b8d891679" id="m-Expression-202b8d891679"></a>

```java
public final Object Expression() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### FilterExpr() <a href="#m-FilterExpr-2734d9da846d" id="m-FilterExpr-2734d9da846d"></a>

```java
public final Object FilterExpr() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### FunctionCall() <a href="#m-FunctionCall-b53ad6cb019a" id="m-FunctionCall-b53ad6cb019a"></a>

```java
public final Object FunctionCall() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### FunctionName() <a href="#m-FunctionName-e065b916e82a" id="m-FunctionName-e065b916e82a"></a>

```java
public final Object FunctionName() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### generateParseException() <a href="#m-generateParseException-deb7e661e2f1" id="m-generateParseException-deb7e661e2f1"></a>

```java
public com.tailf.conf.gen2.ParseException generateParseException()
```

Types: [ParseException](ParseException.md#cls-ParseException)

Generate ParseException.

### getNextToken() <a href="#m-getNextToken-dc921ada5024" id="m-getNextToken-dc921ada5024"></a>

```java
public final com.tailf.conf.gen2.Token getNextToken()
```

Types: [Token](Token.md#cls-Token)

Get the next Token.

### getToken(int) <a href="#m-getToken-dc7acf63f451" id="m-getToken-dc7acf63f451"></a>

```java
public final com.tailf.conf.gen2.Token getToken(int index)
```

Types: [Token](Token.md#cls-Token)

Get the specific Token.

**Parameters**

- `int index`

### LocationPath() <a href="#m-LocationPath-35ea9d0f3255" id="m-LocationPath-35ea9d0f3255"></a>

```java
public final Object LocationPath() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### LocationStep(ArrayList<Object>) <a href="#m-LocationStep-a5e94dba22db" id="m-LocationStep-a5e94dba22db"></a>

```java
public final void LocationStep(
    java.util.ArrayList<Object> steps
)
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

**Parameters**

- `java.util.ArrayList<Object> steps`

### NCName() <a href="#m-NCName-7b30a4c1f737" id="m-NCName-7b30a4c1f737"></a>

```java
public final String NCName() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### NCName_Without_CoreFunctions() <a href="#m-NCName_Without_CoreFunctions-6566bbe274b7" id="m-NCName_Without_CoreFunctions-6566bbe274b7"></a>

```java
public final String NCName_Without_CoreFunctions() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### NodeTest(ArrayList<Object>) <a href="#m-NodeTest-22e2f0747db1" id="m-NodeTest-22e2f0747db1"></a>

```java
public final void NodeTest(
    java.util.ArrayList<Object> steps
)
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

**Parameters**

- `java.util.ArrayList<Object> steps`

### parse(String, MountIdInterface) <a href="#m-parse-400296062d9d" id="m-parse-400296062d9d"></a>

```java
public static com.tailf.conf.Compiler parse(
    String line,
    com.tailf.conf.MountIdInterface mountGetter
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [Compiler](../Compiler.md#cls-Compiler), [MountIdInterface](../MountIdInterface.md#cls-MountIdInterface), [ConfException](../ConfException.md#cls-ConfException)

**Parameters**

- `String line`
- `com.tailf.conf.MountIdInterface mountGetter`

### parseExpression() <a href="#m-parseExpression-09140d7abc03" id="m-parseExpression-09140d7abc03"></a>

```java
public final Object parseExpression() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### PathExpr() <a href="#m-PathExpr-2e73edb0ff0c" id="m-PathExpr-2e73edb0ff0c"></a>

```java
public final Object PathExpr() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### Predicate() <a href="#m-Predicate-c03c201960b0" id="m-Predicate-c03c201960b0"></a>

```java
public final Object Predicate() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### PrimaryExpr() <a href="#m-PrimaryExpr-1e465f74325b" id="m-PrimaryExpr-1e465f74325b"></a>

```java
public final Object PrimaryExpr() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### QName() <a href="#m-QName-7107ceb3aca9" id="m-QName-7107ceb3aca9"></a>

```java
public final Object QName() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### QName_Without_CoreFunctions() <a href="#m-QName_Without_CoreFunctions-158727e2e312" id="m-QName_Without_CoreFunctions-158727e2e312"></a>

```java
public final Object QName_Without_CoreFunctions() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
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

### ReInit(XPathAbrev1TokenManager) <a href="#m-ReInit-5aac9f929a90" id="m-ReInit-5aac9f929a90"></a>

```java
public void ReInit(com.tailf.conf.gen2.XPathAbrev1TokenManager tm)
```

Types: [XPathAbrev1TokenManager](XPathAbrev1TokenManager.md#cls-XPathAbrev1TokenManager)

Reinitialise.

**Parameters**

- `com.tailf.conf.gen2.XPathAbrev1TokenManager tm`

### RelationalExpr() <a href="#m-RelationalExpr-1f528ea442a1" id="m-RelationalExpr-1f528ea442a1"></a>

```java
public final Object RelationalExpr() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

### RelativeLocationPath() <a href="#m-RelativeLocationPath-dddce07a8f49" id="m-RelativeLocationPath-dddce07a8f49"></a>

```java
public final Object RelativeLocationPath() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
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
public final Object WildcardName() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)


## Nested Types

- [JJCalls](XPathAbrev1/JJCalls.md#cls-JJCalls)
