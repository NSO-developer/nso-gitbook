<a id="cls-XPathAbrev1"></a>
# XPathAbrev1

```java
public class com.tailf.conf.gen2.XPathAbrev1
    implements com.tailf.conf.gen2.XPathAbrev1Constants
```

Types: [XPathAbrev1Constants](XPathAbrev1Constants.md#cls-XPathAbrev1Constants)

## Members

**Constructors**:

- [XPathAbrev1(InputStream)](#m-xpathabrev1-80044810d17a)
- [XPathAbrev1(InputStream, String)](#m-xpathabrev1-1182b6f6db85)
- [XPathAbrev1(Reader)](#m-xpathabrev1-e0aec549afa6)
- [XPathAbrev1(XPathAbrev1TokenManager)](#m-xpathabrev1-b45a7fedd78a)

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
- [NCName()](#m-ncname-7b30a4c1f737)
- [NCName_Without_CoreFunctions()](#m-ncname_without_corefunctions-6566bbe274b7)
- [NodeTest(ArrayList<Object>)](#m-nodetest-22e2f0747db1)
- [parse(String, MountIdInterface)](#m-parse-400296062d9d)
- [parseExpression()](#m-parseexpression-09140d7abc03)
- [PathExpr()](#m-pathexpr-2e73edb0ff0c)
- [Predicate()](#m-predicate-c03c201960b0)
- [PrimaryExpr()](#m-primaryexpr-1e465f74325b)
- [QName()](#m-qname-7107ceb3aca9)
- [QName_Without_CoreFunctions()](#m-qname_without_corefunctions-158727e2e312)
- [ReInit(InputStream)](#m-reinit-e03395a4a4ba)
- [ReInit(InputStream, String)](#m-reinit-330085293cfa)
- [ReInit(Reader)](#m-reinit-4ce6f3557028)
- [ReInit(XPathAbrev1TokenManager)](#m-reinit-5aac9f929a90)
- [RelationalExpr()](#m-relationalexpr-1f528ea442a1)
- [RelativeLocationPath()](#m-relativelocationpath-dddce07a8f49)
- [setCompiler(Compiler)](#m-setcompiler-ba6ce2506c89)
- [trace_enabled()](#m-trace_enabled-0d5a0a082fa5)
- [WildcardName()](#m-wildcardname-8dffbb9f4b24)

**Nested Types**:

- [JJCalls](XPathAbrev1/JJCalls.md#cls-JJCalls)

## Constructors

<a id="m-xpathabrev1-80044810d17a"></a>
### XPathAbrev1(InputStream)

```java
public XPathAbrev1(java.io.InputStream stream)
```

Constructor with InputStream.

**Parameters**

- `java.io.InputStream stream`

<a id="m-xpathabrev1-1182b6f6db85"></a>
### XPathAbrev1(InputStream, String)

```java
public XPathAbrev1(java.io.InputStream stream, String encoding)
```

Constructor with InputStream and supplied encoding

**Parameters**

- `java.io.InputStream stream`
- `String encoding`

<a id="m-xpathabrev1-e0aec549afa6"></a>
### XPathAbrev1(Reader)

```java
public XPathAbrev1(java.io.Reader stream)
```

Constructor.

**Parameters**

- `java.io.Reader stream`

<a id="m-xpathabrev1-b45a7fedd78a"></a>
### XPathAbrev1(XPathAbrev1TokenManager)

```java
public XPathAbrev1(com.tailf.conf.gen2.XPathAbrev1TokenManager tm)
```

Types: [XPathAbrev1TokenManager](XPathAbrev1TokenManager.md#cls-XPathAbrev1TokenManager)

Constructor with generated Token Manager.

**Parameters**

- `com.tailf.conf.gen2.XPathAbrev1TokenManager tm`


## Fields

<a id="m-jj_input_stream"></a>
### jj_input_stream

**Package-private**

```java
com.tailf.conf.gen2.JavaCharStream jj_input_stream = null;
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

<a id="m-jj_nt"></a>
### jj_nt

```java
public com.tailf.conf.gen2.Token jj_nt = null;
```

Types: [Token](Token.md#cls-Token)

Next token.

<a id="m-token"></a>
### token

```java
public com.tailf.conf.gen2.Token token = null;
```

Types: [Token](Token.md#cls-Token)

Current token.

<a id="m-token_source"></a>
### token_source

```java
public com.tailf.conf.gen2.XPathAbrev1TokenManager token_source = null;
```

Types: [XPathAbrev1TokenManager](XPathAbrev1TokenManager.md#cls-XPathAbrev1TokenManager)

Generated Token Manager.


## Methods

<a id="m-abbreviatedaxisspecifier-2077ffc46a36"></a>
### AbbreviatedAxisSpecifier()

```java
public final int AbbreviatedAxisSpecifier() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-absolutelocationpath-4e8bf87fbecb"></a>
### AbsoluteLocationPath()

```java
public final Object AbsoluteLocationPath() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-axisname-26f35eaa1e25"></a>
### AxisName()

```java
public final int AxisName() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-axisspecifier-3422df92e1f5"></a>
### AxisSpecifier()

```java
public final int AxisSpecifier() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-corefunctioncall-bbc848cd7f68"></a>
### CoreFunctionCall()

```java
public final Object CoreFunctionCall() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-corefunctionname-a9428b54fc9d"></a>
### CoreFunctionName()

```java
public final int CoreFunctionName() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

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
public final Object EqualityExpr() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-expression-202b8d891679"></a>
### Expression()

```java
public final Object Expression() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-filterexpr-2734d9da846d"></a>
### FilterExpr()

```java
public final Object FilterExpr() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-functioncall-b53ad6cb019a"></a>
### FunctionCall()

```java
public final Object FunctionCall() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-functionname-e065b916e82a"></a>
### FunctionName()

```java
public final Object FunctionName() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-generateparseexception-deb7e661e2f1"></a>
### generateParseException()

```java
public com.tailf.conf.gen2.ParseException generateParseException()
```

Types: [ParseException](ParseException.md#cls-ParseException)

Generate ParseException.

<a id="m-getnexttoken-dc921ada5024"></a>
### getNextToken()

```java
public final com.tailf.conf.gen2.Token getNextToken()
```

Types: [Token](Token.md#cls-Token)

Get the next Token.

<a id="m-gettoken-dc7acf63f451"></a>
### getToken(int)

```java
public final com.tailf.conf.gen2.Token getToken(int index)
```

Types: [Token](Token.md#cls-Token)

Get the specific Token.

**Parameters**

- `int index`

<a id="m-locationpath-35ea9d0f3255"></a>
### LocationPath()

```java
public final Object LocationPath() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-locationstep-a5e94dba22db"></a>
### LocationStep(ArrayList<Object>)

```java
public final void LocationStep(
    java.util.ArrayList<Object> steps
)
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

**Parameters**

- `java.util.ArrayList<Object> steps`

<a id="m-ncname-7b30a4c1f737"></a>
### NCName()

```java
public final String NCName() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-ncname_without_corefunctions-6566bbe274b7"></a>
### NCName_Without_CoreFunctions()

```java
public final String NCName_Without_CoreFunctions() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-nodetest-22e2f0747db1"></a>
### NodeTest(ArrayList<Object>)

```java
public final void NodeTest(
    java.util.ArrayList<Object> steps
)
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

**Parameters**

- `java.util.ArrayList<Object> steps`

<a id="m-parse-400296062d9d"></a>
### parse(String, MountIdInterface)

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

<a id="m-parseexpression-09140d7abc03"></a>
### parseExpression()

```java
public final Object parseExpression() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-pathexpr-2e73edb0ff0c"></a>
### PathExpr()

```java
public final Object PathExpr() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-predicate-c03c201960b0"></a>
### Predicate()

```java
public final Object Predicate() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-primaryexpr-1e465f74325b"></a>
### PrimaryExpr()

```java
public final Object PrimaryExpr() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-qname-7107ceb3aca9"></a>
### QName()

```java
public final Object QName() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-qname_without_corefunctions-158727e2e312"></a>
### QName_Without_CoreFunctions()

```java
public final Object QName_Without_CoreFunctions() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
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

<a id="m-reinit-5aac9f929a90"></a>
### ReInit(XPathAbrev1TokenManager)

```java
public void ReInit(com.tailf.conf.gen2.XPathAbrev1TokenManager tm)
```

Types: [XPathAbrev1TokenManager](XPathAbrev1TokenManager.md#cls-XPathAbrev1TokenManager)

Reinitialise.

**Parameters**

- `com.tailf.conf.gen2.XPathAbrev1TokenManager tm`

<a id="m-relationalexpr-1f528ea442a1"></a>
### RelationalExpr()

```java
public final Object RelationalExpr() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)

<a id="m-relativelocationpath-dddce07a8f49"></a>
### RelativeLocationPath()

```java
public final Object RelativeLocationPath() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
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
public final Object WildcardName() throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
    throws com.tailf.conf.gen2.ParseException, com.tailf.conf.ConfException, java.io.IOException
```

Types: [ParseException](ParseException.md#cls-ParseException), [ConfException](../ConfException.md#cls-ConfException)


## Nested Types

- [JJCalls](XPathAbrev1/JJCalls.md#cls-JJCalls)
