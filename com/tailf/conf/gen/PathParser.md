<a id="cls-PathParser"></a>
# PathParser

```java
public final class com.tailf.conf.gen.PathParser
    implements com.tailf.conf.gen.PathParserConstants
```

Types: [PathParserConstants](PathParserConstants.md#cls-PathParserConstants)

Path Parser.

## Members

**Constructors**:

- [PathParser()](#m-pathparser-c10c07c8cd77)
- [PathParser(InputStream)](#m-pathparser-6ef844c1b6fc)
- [PathParser(InputStream, String)](#m-pathparser-60a47d80f664)
- [PathParser(PathParserTokenManager)](#m-pathparser-87dc448d0bb4)
- [PathParser(Reader)](#m-pathparser-8195c9a0b35f)
- [PathParser(String, Object[])](#m-pathparser-e7ef3c34825a)

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

- [Composite()](#m-composite-395cb22786fb)
- [disable_tracing()](#m-disable_tracing-6da9cdfdd969)
- [Elem()](#m-elem-faaaa7f12a9f)
- [enable_tracing()](#m-enable_tracing-4b87a1586eda)
- [Entity()](#m-entity-0ac965935919)
- [Entity2()](#m-entity2-879dd3264818)
- [generateParseException()](#m-generateparseexception-deb7e661e2f1)
- [getNextToken()](#m-getnexttoken-dc921ada5024)
- [getToken(int)](#m-gettoken-dc7acf63f451)
- [list()](#m-list-e6b1546900c0)
- [MatchedBraces()](#m-matchedbraces-e9eca213d331)
- [MatchedBrackets()](#m-matchedbrackets-356b765831ae)
- [parse()](#m-parse-29d7b3df4ae2)
- [ReInit(InputStream)](#m-reinit-e03395a4a4ba)
- [ReInit(InputStream, String)](#m-reinit-330085293cfa)
- [ReInit(PathParserTokenManager)](#m-reinit-40008fea4204)
- [ReInit(Reader)](#m-reinit-4ce6f3557028)
- [Term()](#m-term-454e01cdf5f2)
- [trace_enabled()](#m-trace_enabled-0d5a0a082fa5)

**Nested Types**:

- [PathConfBinary](PathParser/PathConfBinary.md#cls-PathConfBinary)
- [PathElement](PathParser/PathElement.md#cls-PathElement)
- [PathKey](PathParser/PathKey.md#cls-PathKey)

## Constructors

<a id="m-pathparser-c10c07c8cd77"></a>
### PathParser()

```java
public PathParser()
```

<a id="m-pathparser-6ef844c1b6fc"></a>
### PathParser(InputStream)

```java
public PathParser(java.io.InputStream stream)
```

Constructor with InputStream.

**Parameters**

- `java.io.InputStream stream`

<a id="m-pathparser-60a47d80f664"></a>
### PathParser(InputStream, String)

```java
public PathParser(java.io.InputStream stream, String encoding)
```

Constructor with InputStream and supplied encoding

**Parameters**

- `java.io.InputStream stream`
- `String encoding`

<a id="m-pathparser-87dc448d0bb4"></a>
### PathParser(PathParserTokenManager)

```java
public PathParser(com.tailf.conf.gen.PathParserTokenManager tm)
```

Types: [PathParserTokenManager](PathParserTokenManager.md#cls-PathParserTokenManager)

Constructor with generated Token Manager.

**Parameters**

- `com.tailf.conf.gen.PathParserTokenManager tm`

<a id="m-pathparser-8195c9a0b35f"></a>
### PathParser(Reader)

```java
public PathParser(java.io.Reader stream)
```

Constructor.

**Parameters**

- `java.io.Reader stream`

<a id="m-pathparser-e7ef3c34825a"></a>
### PathParser(String, Object[])

```java
public PathParser(String s, Object[] args)
```

**Parameters**

- `String s`
- `Object[] args`


## Fields

<a id="m-jj_input_stream"></a>
### jj_input_stream

**Package-private**

```java
com.tailf.conf.gen.JavaCharStream jj_input_stream = null;
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

<a id="m-jj_nt"></a>
### jj_nt

```java
public com.tailf.conf.gen.Token jj_nt = null;
```

Types: [Token](Token.md#cls-Token)

Next token.

<a id="m-token"></a>
### token

```java
public com.tailf.conf.gen.Token token = null;
```

Types: [Token](Token.md#cls-Token)

Current token.

<a id="m-token_source"></a>
### token_source

```java
public com.tailf.conf.gen.PathParserTokenManager token_source = null;
```

Types: [PathParserTokenManager](PathParserTokenManager.md#cls-PathParserTokenManager)

Generated Token Manager.


## Methods

<a id="m-composite-395cb22786fb"></a>
### Composite()

```java
public final com.tailf.conf.ConfObject Composite() throws com.tailf.conf.gen.ParseException
```

Types: [ConfObject](../ConfObject.md#cls-ConfObject), [ParseException](ParseException.md#cls-ParseException)

<a id="m-disable_tracing-6da9cdfdd969"></a>
### disable_tracing()

```java
public final void disable_tracing()
```

Disable tracing.

<a id="m-elem-faaaa7f12a9f"></a>
### Elem()

```java
public final void Elem() throws com.tailf.conf.gen.ParseException
```

Types: [ParseException](ParseException.md#cls-ParseException)

<a id="m-enable_tracing-4b87a1586eda"></a>
### enable_tracing()

```java
public final void enable_tracing()
```

Enable tracing.

<a id="m-entity-0ac965935919"></a>
### Entity()

```java
public final com.tailf.conf.ConfObject Entity() throws com.tailf.conf.gen.ParseException
```

Types: [ConfObject](../ConfObject.md#cls-ConfObject), [ParseException](ParseException.md#cls-ParseException)

<a id="m-entity2-879dd3264818"></a>
### Entity2()

```java
public final com.tailf.conf.ConfObject Entity2() throws com.tailf.conf.gen.ParseException
```

Types: [ConfObject](../ConfObject.md#cls-ConfObject), [ParseException](ParseException.md#cls-ParseException)

<a id="m-generateparseexception-deb7e661e2f1"></a>
### generateParseException()

```java
public com.tailf.conf.gen.ParseException generateParseException()
```

Types: [ParseException](ParseException.md#cls-ParseException)

Generate ParseException.

<a id="m-getnexttoken-dc921ada5024"></a>
### getNextToken()

```java
public final com.tailf.conf.gen.Token getNextToken()
```

Types: [Token](Token.md#cls-Token)

Get the next Token.

<a id="m-gettoken-dc7acf63f451"></a>
### getToken(int)

```java
public final com.tailf.conf.gen.Token getToken(int index)
```

Types: [Token](Token.md#cls-Token)

Get the specific Token.

**Parameters**

- `int index`

<a id="m-list-e6b1546900c0"></a>
### list()

```java
public final void list() throws com.tailf.conf.gen.ParseException
```

Types: [ParseException](ParseException.md#cls-ParseException)

<a id="m-matchedbraces-e9eca213d331"></a>
### MatchedBraces()

```java
public final void MatchedBraces() throws com.tailf.conf.gen.ParseException
```

Types: [ParseException](ParseException.md#cls-ParseException)

<a id="m-matchedbrackets-356b765831ae"></a>
### MatchedBrackets()

```java
public final void MatchedBrackets() throws com.tailf.conf.gen.ParseException
```

Types: [ParseException](ParseException.md#cls-ParseException)

<a id="m-parse-29d7b3df4ae2"></a>
### parse()

```java
public final java.util.List<com.tailf.conf.gen.PathParser.PathElement> parse() throws com.tailf.conf.gen.ParseException
    throws com.tailf.conf.gen.ParseException
```

Types: [PathElement](PathParser/PathElement.md#cls-PathElement), [ParseException](ParseException.md#cls-ParseException)

root method.

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

<a id="m-reinit-40008fea4204"></a>
### ReInit(PathParserTokenManager)

```java
public void ReInit(com.tailf.conf.gen.PathParserTokenManager tm)
```

Types: [PathParserTokenManager](PathParserTokenManager.md#cls-PathParserTokenManager)

Reinitialise.

**Parameters**

- `com.tailf.conf.gen.PathParserTokenManager tm`

<a id="m-reinit-4ce6f3557028"></a>
### ReInit(Reader)

```java
public void ReInit(java.io.Reader stream)
```

Reinitialise.

**Parameters**

- `java.io.Reader stream`

<a id="m-term-454e01cdf5f2"></a>
### Term()

```java
public final void Term() throws com.tailf.conf.gen.ParseException
```

Types: [ParseException](ParseException.md#cls-ParseException)

<a id="m-trace_enabled-0d5a0a082fa5"></a>
### trace_enabled()

```java
public final boolean trace_enabled()
```

Trace enabled.


## Nested Types

- [PathConfBinary](PathParser/PathConfBinary.md#cls-PathConfBinary)
- [PathElement](PathParser/PathElement.md#cls-PathElement)
- [PathKey](PathParser/PathKey.md#cls-PathKey)
