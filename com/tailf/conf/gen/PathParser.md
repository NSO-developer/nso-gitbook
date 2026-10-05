<a id="s-PathParser"></a>
# PathParser

```java
public final class com.tailf.conf.gen.PathParser
    implements com.tailf.conf.gen.PathParserConstants
```

Types: [PathParserConstants](PathParserConstants.md#s-PathParserConstants)

Path Parser.

## Members

**Constructors**:

- [PathParser()](#s-PathParser-1)
- [PathParser(InputStream)](#s-PathParser-2)
- [PathParser(InputStream, String)](#s-PathParser-3)
- [PathParser(PathParserTokenManager)](#s-PathParser-4)
- [PathParser(Reader)](#s-PathParser-5)
- [PathParser(String, Object[])](#s-PathParser-6)

**Fields**:

- [CHAR](PathParserConstants.md#s-CHAR) from PathParserConstants
- [CHAR2](PathParserConstants.md#s-CHAR2) from PathParserConstants
- [COLON](PathParserConstants.md#s-COLON) from PathParserConstants
- [DEFAULT](PathParserConstants.md#s-DEFAULT) from PathParserConstants
- [EOF](PathParserConstants.md#s-EOF) from PathParserConstants
- [IDENTIFIER](PathParserConstants.md#s-IDENTIFIER) from PathParserConstants
- [IDENTIFIER2](PathParserConstants.md#s-IDENTIFIER2) from PathParserConstants
- [INSIDE_BRACES](PathParserConstants.md#s-INSIDE_BRACES) from PathParserConstants
- [INSIDE_QUOTE](PathParserConstants.md#s-INSIDE_QUOTE) from PathParserConstants
- [jj_input_stream](#s-jj_input_stream)
- [jj_nt](#s-jj_nt)
- [LBRACE](PathParserConstants.md#s-LBRACE) from PathParserConstants
- [LBRACKET](PathParserConstants.md#s-LBRACKET) from PathParserConstants
- [PERCENT](PathParserConstants.md#s-PERCENT) from PathParserConstants
- [PERCENT2](PathParserConstants.md#s-PERCENT2) from PathParserConstants
- [RBRACE](PathParserConstants.md#s-RBRACE) from PathParserConstants
- [RBRACKET](PathParserConstants.md#s-RBRACKET) from PathParserConstants
- [SLASH](PathParserConstants.md#s-SLASH) from PathParserConstants
- [STRLIT](PathParserConstants.md#s-STRLIT) from PathParserConstants
- [token](#s-token)
- [token_source](#s-token_source)
- [tokenImage](PathParserConstants.md#s-tokenImage) from PathParserConstants

**Methods**:

- [Composite()](#s-Composite)
- [disable_tracing()](#s-disable_tracing)
- [Elem()](#s-Elem)
- [enable_tracing()](#s-enable_tracing)
- [Entity()](#s-Entity)
- [Entity2()](#s-Entity2)
- [generateParseException()](#s-generateParseException)
- [getNextToken()](#s-getNextToken)
- [getToken(int)](#s-getToken)
- [list()](#s-list)
- [MatchedBraces()](#s-MatchedBraces)
- [MatchedBrackets()](#s-MatchedBrackets)
- [parse()](#s-parse)
- [ReInit(InputStream)](#s-ReInit)
- [ReInit(InputStream, String)](#s-ReInit-1)
- [ReInit(PathParserTokenManager)](#s-ReInit-2)
- [ReInit(Reader)](#s-ReInit-3)
- [Term()](#s-Term)
- [trace_enabled()](#s-trace_enabled)

**Nested Types**:

- [PathConfBinary](PathParser/PathConfBinary.md#s-PathConfBinary)
- [PathElement](PathParser/PathElement.md#s-PathElement)
- [PathKey](PathParser/PathKey.md#s-PathKey)

## Constructors

<a id="s-PathParser-1"></a>
### PathParser()

```java
public PathParser()
```

<a id="s-PathParser-2"></a>
### PathParser(InputStream)

```java
public PathParser(java.io.InputStream stream)
```

Constructor with InputStream.

**Parameters**

- `java.io.InputStream stream`

<a id="s-PathParser-3"></a>
### PathParser(InputStream, String)

```java
public PathParser(java.io.InputStream stream, String encoding)
```

Constructor with InputStream and supplied encoding

**Parameters**

- `java.io.InputStream stream`
- `String encoding`

<a id="s-PathParser-4"></a>
### PathParser(PathParserTokenManager)

```java
public PathParser(com.tailf.conf.gen.PathParserTokenManager tm)
```

Types: [PathParserTokenManager](PathParserTokenManager.md#s-PathParserTokenManager)

Constructor with generated Token Manager.

**Parameters**

- `com.tailf.conf.gen.PathParserTokenManager tm`

<a id="s-PathParser-5"></a>
### PathParser(Reader)

```java
public PathParser(java.io.Reader stream)
```

Constructor.

**Parameters**

- `java.io.Reader stream`

<a id="s-PathParser-6"></a>
### PathParser(String, Object[])

```java
public PathParser(String s, Object[] args)
```

**Parameters**

- `String s`
- `Object[] args`


## Fields

<a id="s-jj_input_stream"></a>
### jj_input_stream

**Package-private**

```java
com.tailf.conf.gen.JavaCharStream jj_input_stream = null;
```

Types: [JavaCharStream](JavaCharStream.md#s-JavaCharStream)

<a id="s-jj_nt"></a>
### jj_nt

```java
public com.tailf.conf.gen.Token jj_nt = null;
```

Types: [Token](Token.md#s-Token)

Next token.

<a id="s-token"></a>
### token

```java
public com.tailf.conf.gen.Token token = null;
```

Types: [Token](Token.md#s-Token)

Current token.

<a id="s-token_source"></a>
### token_source

```java
public com.tailf.conf.gen.PathParserTokenManager token_source = null;
```

Types: [PathParserTokenManager](PathParserTokenManager.md#s-PathParserTokenManager)

Generated Token Manager.


## Methods

<a id="s-Composite"></a>
### Composite()

```java
public final com.tailf.conf.ConfObject Composite() throws com.tailf.conf.gen.ParseException
```

Types: [ConfObject](../ConfObject.md#s-ConfObject), [ParseException](ParseException.md#s-ParseException)

<a id="s-disable_tracing"></a>
### disable_tracing()

```java
public final void disable_tracing()
```

Disable tracing.

<a id="s-Elem"></a>
### Elem()

```java
public final void Elem() throws com.tailf.conf.gen.ParseException
```

Types: [ParseException](ParseException.md#s-ParseException)

<a id="s-enable_tracing"></a>
### enable_tracing()

```java
public final void enable_tracing()
```

Enable tracing.

<a id="s-Entity"></a>
### Entity()

```java
public final com.tailf.conf.ConfObject Entity() throws com.tailf.conf.gen.ParseException
```

Types: [ConfObject](../ConfObject.md#s-ConfObject), [ParseException](ParseException.md#s-ParseException)

<a id="s-Entity2"></a>
### Entity2()

```java
public final com.tailf.conf.ConfObject Entity2() throws com.tailf.conf.gen.ParseException
```

Types: [ConfObject](../ConfObject.md#s-ConfObject), [ParseException](ParseException.md#s-ParseException)

<a id="s-generateParseException"></a>
### generateParseException()

```java
public com.tailf.conf.gen.ParseException generateParseException()
```

Types: [ParseException](ParseException.md#s-ParseException)

Generate ParseException.

<a id="s-getNextToken"></a>
### getNextToken()

```java
public final com.tailf.conf.gen.Token getNextToken()
```

Types: [Token](Token.md#s-Token)

Get the next Token.

<a id="s-getToken"></a>
### getToken(int)

```java
public final com.tailf.conf.gen.Token getToken(int index)
```

Types: [Token](Token.md#s-Token)

Get the specific Token.

**Parameters**

- `int index`

<a id="s-list"></a>
### list()

```java
public final void list() throws com.tailf.conf.gen.ParseException
```

Types: [ParseException](ParseException.md#s-ParseException)

<a id="s-MatchedBraces"></a>
### MatchedBraces()

```java
public final void MatchedBraces() throws com.tailf.conf.gen.ParseException
```

Types: [ParseException](ParseException.md#s-ParseException)

<a id="s-MatchedBrackets"></a>
### MatchedBrackets()

```java
public final void MatchedBrackets() throws com.tailf.conf.gen.ParseException
```

Types: [ParseException](ParseException.md#s-ParseException)

<a id="s-parse"></a>
### parse()

```java
public final java.util.List<com.tailf.conf.gen.PathParser.PathElement> parse() throws com.tailf.conf.gen.ParseException
    throws com.tailf.conf.gen.ParseException
```

Types: [PathElement](PathParser/PathElement.md#s-PathElement), [ParseException](ParseException.md#s-ParseException)

root method.

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
### ReInit(PathParserTokenManager)

```java
public void ReInit(com.tailf.conf.gen.PathParserTokenManager tm)
```

Types: [PathParserTokenManager](PathParserTokenManager.md#s-PathParserTokenManager)

Reinitialise.

**Parameters**

- `com.tailf.conf.gen.PathParserTokenManager tm`

<a id="s-ReInit-3"></a>
### ReInit(Reader)

```java
public void ReInit(java.io.Reader stream)
```

Reinitialise.

**Parameters**

- `java.io.Reader stream`

<a id="s-Term"></a>
### Term()

```java
public final void Term() throws com.tailf.conf.gen.ParseException
```

Types: [ParseException](ParseException.md#s-ParseException)

<a id="s-trace_enabled"></a>
### trace_enabled()

```java
public final boolean trace_enabled()
```

Trace enabled.


## Nested Types

- [PathConfBinary](PathParser/PathConfBinary.md)
- [PathElement](PathParser/PathElement.md)
- [PathKey](PathParser/PathKey.md)
