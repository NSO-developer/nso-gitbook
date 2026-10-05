# PathParser <a href="#cls-PathParser" id="cls-PathParser"></a>

```java
public final class com.tailf.conf.gen.PathParser
    implements com.tailf.conf.gen.PathParserConstants
```

Types: [PathParserConstants](PathParserConstants.md#cls-PathParserConstants)

Path Parser.

## Members

**Constructors**:

- [PathParser()](#m-PathParser-c10c07c8cd77)
- [PathParser(InputStream)](#m-PathParser-6ef844c1b6fc)
- [PathParser(InputStream, String)](#m-PathParser-60a47d80f664)
- [PathParser(PathParserTokenManager)](#m-PathParser-87dc448d0bb4)
- [PathParser(Reader)](#m-PathParser-8195c9a0b35f)
- [PathParser(String, Object[])](#m-PathParser-e7ef3c34825a)

**Fields**:

- [CHAR](PathParserConstants.md#m-CHAR) from PathParserConstants
- [CHAR2](PathParserConstants.md#m-CHAR2) from PathParserConstants
- [COLON](PathParserConstants.md#m-COLON) from PathParserConstants
- [DEFAULT](PathParserConstants.md#m-DEFAULT) from PathParserConstants
- [EOF](PathParserConstants.md#m-EOF) from PathParserConstants
- [IDENTIFIER](PathParserConstants.md#m-IDENTIFIER) from PathParserConstants
- [IDENTIFIER2](PathParserConstants.md#m-IDENTIFIER2) from PathParserConstants
- [INSIDE_BRACES](PathParserConstants.md#m-INSIDE_BRACES) from PathParserConstants
- [INSIDE_QUOTE](PathParserConstants.md#m-INSIDE_QUOTE) from PathParserConstants
- [jj_input_stream](#m-jj_input_stream)
- [jj_nt](#m-jj_nt)
- [LBRACE](PathParserConstants.md#m-LBRACE) from PathParserConstants
- [LBRACKET](PathParserConstants.md#m-LBRACKET) from PathParserConstants
- [PERCENT](PathParserConstants.md#m-PERCENT) from PathParserConstants
- [PERCENT2](PathParserConstants.md#m-PERCENT2) from PathParserConstants
- [RBRACE](PathParserConstants.md#m-RBRACE) from PathParserConstants
- [RBRACKET](PathParserConstants.md#m-RBRACKET) from PathParserConstants
- [SLASH](PathParserConstants.md#m-SLASH) from PathParserConstants
- [STRLIT](PathParserConstants.md#m-STRLIT) from PathParserConstants
- [token](#m-token)
- [token_source](#m-token_source)
- [tokenImage](PathParserConstants.md#m-tokenImage) from PathParserConstants

**Methods**:

- [Composite()](#m-Composite-395cb22786fb)
- [disable_tracing()](#m-disable_tracing-6da9cdfdd969)
- [Elem()](#m-Elem-faaaa7f12a9f)
- [enable_tracing()](#m-enable_tracing-4b87a1586eda)
- [Entity()](#m-Entity-0ac965935919)
- [Entity2()](#m-Entity2-879dd3264818)
- [generateParseException()](#m-generateParseException-deb7e661e2f1)
- [getNextToken()](#m-getNextToken-dc921ada5024)
- [getToken(int)](#m-getToken-dc7acf63f451)
- [list()](#m-list-e6b1546900c0)
- [MatchedBraces()](#m-MatchedBraces-e9eca213d331)
- [MatchedBrackets()](#m-MatchedBrackets-356b765831ae)
- [parse()](#m-parse-29d7b3df4ae2)
- [ReInit(InputStream)](#m-ReInit-e03395a4a4ba)
- [ReInit(InputStream, String)](#m-ReInit-330085293cfa)
- [ReInit(PathParserTokenManager)](#m-ReInit-40008fea4204)
- [ReInit(Reader)](#m-ReInit-4ce6f3557028)
- [Term()](#m-Term-454e01cdf5f2)
- [trace_enabled()](#m-trace_enabled-0d5a0a082fa5)

**Nested Types**:

- [PathConfBinary](PathParser/PathConfBinary.md#cls-PathConfBinary)
- [PathElement](PathParser/PathElement.md#cls-PathElement)
- [PathKey](PathParser/PathKey.md#cls-PathKey)

## Constructors

### PathParser() <a href="#m-PathParser-c10c07c8cd77" id="m-PathParser-c10c07c8cd77"></a>

```java
public PathParser()
```

### PathParser(InputStream) <a href="#m-PathParser-6ef844c1b6fc" id="m-PathParser-6ef844c1b6fc"></a>

```java
public PathParser(java.io.InputStream stream)
```

Constructor with InputStream.

**Parameters**

- `java.io.InputStream stream`

### PathParser(InputStream, String) <a href="#m-PathParser-60a47d80f664" id="m-PathParser-60a47d80f664"></a>

```java
public PathParser(java.io.InputStream stream, String encoding)
```

Constructor with InputStream and supplied encoding

**Parameters**

- `java.io.InputStream stream`
- `String encoding`

### PathParser(PathParserTokenManager) <a href="#m-PathParser-87dc448d0bb4" id="m-PathParser-87dc448d0bb4"></a>

```java
public PathParser(com.tailf.conf.gen.PathParserTokenManager tm)
```

Types: [PathParserTokenManager](PathParserTokenManager.md#cls-PathParserTokenManager)

Constructor with generated Token Manager.

**Parameters**

- `com.tailf.conf.gen.PathParserTokenManager tm`

### PathParser(Reader) <a href="#m-PathParser-8195c9a0b35f" id="m-PathParser-8195c9a0b35f"></a>

```java
public PathParser(java.io.Reader stream)
```

Constructor.

**Parameters**

- `java.io.Reader stream`

### PathParser(String, Object[]) <a href="#m-PathParser-e7ef3c34825a" id="m-PathParser-e7ef3c34825a"></a>

```java
public PathParser(String s, Object[] args)
```

**Parameters**

- `String s`
- `Object[] args`


## Fields

### jj_input_stream <a href="#m-jj_input_stream" id="m-jj_input_stream"></a>

**Package-private**

```java
com.tailf.conf.gen.JavaCharStream jj_input_stream = null;
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

### jj_nt <a href="#m-jj_nt" id="m-jj_nt"></a>

```java
public com.tailf.conf.gen.Token jj_nt = null;
```

Types: [Token](Token.md#cls-Token)

Next token.

### token <a href="#m-token" id="m-token"></a>

```java
public com.tailf.conf.gen.Token token = null;
```

Types: [Token](Token.md#cls-Token)

Current token.

### token_source <a href="#m-token_source" id="m-token_source"></a>

```java
public com.tailf.conf.gen.PathParserTokenManager token_source = null;
```

Types: [PathParserTokenManager](PathParserTokenManager.md#cls-PathParserTokenManager)

Generated Token Manager.


## Methods

### Composite() <a href="#m-Composite-395cb22786fb" id="m-Composite-395cb22786fb"></a>

```java
public final com.tailf.conf.ConfObject Composite() throws com.tailf.conf.gen.ParseException
```

Types: [ConfObject](../ConfObject.md#cls-ConfObject), [ParseException](ParseException.md#cls-ParseException)

### disable_tracing() <a href="#m-disable_tracing-6da9cdfdd969" id="m-disable_tracing-6da9cdfdd969"></a>

```java
public final void disable_tracing()
```

Disable tracing.

### Elem() <a href="#m-Elem-faaaa7f12a9f" id="m-Elem-faaaa7f12a9f"></a>

```java
public final void Elem() throws com.tailf.conf.gen.ParseException
```

Types: [ParseException](ParseException.md#cls-ParseException)

### enable_tracing() <a href="#m-enable_tracing-4b87a1586eda" id="m-enable_tracing-4b87a1586eda"></a>

```java
public final void enable_tracing()
```

Enable tracing.

### Entity() <a href="#m-Entity-0ac965935919" id="m-Entity-0ac965935919"></a>

```java
public final com.tailf.conf.ConfObject Entity() throws com.tailf.conf.gen.ParseException
```

Types: [ConfObject](../ConfObject.md#cls-ConfObject), [ParseException](ParseException.md#cls-ParseException)

### Entity2() <a href="#m-Entity2-879dd3264818" id="m-Entity2-879dd3264818"></a>

```java
public final com.tailf.conf.ConfObject Entity2() throws com.tailf.conf.gen.ParseException
```

Types: [ConfObject](../ConfObject.md#cls-ConfObject), [ParseException](ParseException.md#cls-ParseException)

### generateParseException() <a href="#m-generateParseException-deb7e661e2f1" id="m-generateParseException-deb7e661e2f1"></a>

```java
public com.tailf.conf.gen.ParseException generateParseException()
```

Types: [ParseException](ParseException.md#cls-ParseException)

Generate ParseException.

### getNextToken() <a href="#m-getNextToken-dc921ada5024" id="m-getNextToken-dc921ada5024"></a>

```java
public final com.tailf.conf.gen.Token getNextToken()
```

Types: [Token](Token.md#cls-Token)

Get the next Token.

### getToken(int) <a href="#m-getToken-dc7acf63f451" id="m-getToken-dc7acf63f451"></a>

```java
public final com.tailf.conf.gen.Token getToken(int index)
```

Types: [Token](Token.md#cls-Token)

Get the specific Token.

**Parameters**

- `int index`

### list() <a href="#m-list-e6b1546900c0" id="m-list-e6b1546900c0"></a>

```java
public final void list() throws com.tailf.conf.gen.ParseException
```

Types: [ParseException](ParseException.md#cls-ParseException)

### MatchedBraces() <a href="#m-MatchedBraces-e9eca213d331" id="m-MatchedBraces-e9eca213d331"></a>

```java
public final void MatchedBraces() throws com.tailf.conf.gen.ParseException
```

Types: [ParseException](ParseException.md#cls-ParseException)

### MatchedBrackets() <a href="#m-MatchedBrackets-356b765831ae" id="m-MatchedBrackets-356b765831ae"></a>

```java
public final void MatchedBrackets() throws com.tailf.conf.gen.ParseException
```

Types: [ParseException](ParseException.md#cls-ParseException)

### parse() <a href="#m-parse-29d7b3df4ae2" id="m-parse-29d7b3df4ae2"></a>

```java
public final java.util.List<com.tailf.conf.gen.PathParser.PathElement> parse() throws com.tailf.conf.gen.ParseException
    throws com.tailf.conf.gen.ParseException
```

Types: [PathElement](PathParser/PathElement.md#cls-PathElement), [ParseException](ParseException.md#cls-ParseException)

root method.

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

### ReInit(PathParserTokenManager) <a href="#m-ReInit-40008fea4204" id="m-ReInit-40008fea4204"></a>

```java
public void ReInit(com.tailf.conf.gen.PathParserTokenManager tm)
```

Types: [PathParserTokenManager](PathParserTokenManager.md#cls-PathParserTokenManager)

Reinitialise.

**Parameters**

- `com.tailf.conf.gen.PathParserTokenManager tm`

### ReInit(Reader) <a href="#m-ReInit-4ce6f3557028" id="m-ReInit-4ce6f3557028"></a>

```java
public void ReInit(java.io.Reader stream)
```

Reinitialise.

**Parameters**

- `java.io.Reader stream`

### Term() <a href="#m-Term-454e01cdf5f2" id="m-Term-454e01cdf5f2"></a>

```java
public final void Term() throws com.tailf.conf.gen.ParseException
```

Types: [ParseException](ParseException.md#cls-ParseException)

### trace_enabled() <a href="#m-trace_enabled-0d5a0a082fa5" id="m-trace_enabled-0d5a0a082fa5"></a>

```java
public final boolean trace_enabled()
```

Trace enabled.


## Nested Types

- [PathConfBinary](PathParser/PathConfBinary.md#cls-PathConfBinary)
- [PathElement](PathParser/PathElement.md#cls-PathElement)
- [PathKey](PathParser/PathKey.md#cls-PathKey)
