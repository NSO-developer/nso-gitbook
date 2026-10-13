# PathParser <a href="#pathparser-c76e6680dd52" id="pathparser-c76e6680dd52"></a>

```java
public final class com.tailf.conf.gen.PathParser
    implements com.tailf.conf.gen.PathParserConstants
```

Types: [PathParserConstants](PathParserConstants.md#pathparserconstants-bdbbf565b32b)

Path Parser.

## Members

**Constructors**:

- [PathParser\(\)](#pathparser-c10c07c8cd77)
- [PathParser\(InputStream\)](#pathparser-6ef844c1b6fc)
- [PathParser\(InputStream, String\)](#pathparser-60a47d80f664)
- [PathParser\(PathParserTokenManager\)](#pathparser-87dc448d0bb4)
- [PathParser\(Reader\)](#pathparser-8195c9a0b35f)
- [PathParser\(String, Object\[\]\)](#pathparser-e7ef3c34825a)

**Fields**:

- [CHAR](PathParserConstants.md#char-029984bb6c9e) from PathParserConstants
- [CHAR2](PathParserConstants.md#char2-88635d8a54cf) from PathParserConstants
- [COLON](PathParserConstants.md#colon-2c1dbe3aeee8) from PathParserConstants
- [DEFAULT](PathParserConstants.md#default-5965fc85722b) from PathParserConstants
- [EOF](PathParserConstants.md#eof-e4ab74e8c3eb) from PathParserConstants
- [IDENTIFIER](PathParserConstants.md#identifier-73b18fdcf248) from PathParserConstants
- [IDENTIFIER2](PathParserConstants.md#identifier2-8a04449a942b) from PathParserConstants
- [INSIDE\_BRACES](PathParserConstants.md#inside_braces-126526a96a03) from PathParserConstants
- [INSIDE\_QUOTE](PathParserConstants.md#inside_quote-1a887df059d8) from PathParserConstants
- [jj\_input\_stream](#jj_input_stream-a656fd5e96db)
- [jj\_nt](#jj_nt-9db0740275fe)
- [LBRACE](PathParserConstants.md#lbrace-29f2f43b91d0) from PathParserConstants
- [LBRACKET](PathParserConstants.md#lbracket-2910754c7a67) from PathParserConstants
- [PERCENT](PathParserConstants.md#percent-732182372b0c) from PathParserConstants
- [PERCENT2](PathParserConstants.md#percent2-b22c5103c9d8) from PathParserConstants
- [RBRACE](PathParserConstants.md#rbrace-0415afff6842) from PathParserConstants
- [RBRACKET](PathParserConstants.md#rbracket-71ce92365b6c) from PathParserConstants
- [SLASH](PathParserConstants.md#slash-3c7d823f3e28) from PathParserConstants
- [STRLIT](PathParserConstants.md#strlit-d6078ea07628) from PathParserConstants
- [token](#token-93f8344c37b8)
- [token\_source](#token_source-65d526092316)
- [tokenImage](PathParserConstants.md#tokenimage-c13f534d4471) from PathParserConstants

**Methods**:

- [Composite\(\)](#composite-395cb22786fb)
- [disable\_tracing\(\)](#disable_tracing-6da9cdfdd969)
- [Elem\(\)](#elem-faaaa7f12a9f)
- [enable\_tracing\(\)](#enable_tracing-4b87a1586eda)
- [Entity\(\)](#entity-0ac965935919)
- [Entity2\(\)](#entity2-879dd3264818)
- [generateParseException\(\)](#generateparseexception-deb7e661e2f1)
- [getNextToken\(\)](#getnexttoken-dc921ada5024)
- [getToken\(int\)](#gettoken-dc7acf63f451)
- [list\(\)](#list-e6b1546900c0)
- [MatchedBraces\(\)](#matchedbraces-e9eca213d331)
- [MatchedBrackets\(\)](#matchedbrackets-356b765831ae)
- [parse\(\)](#parse-29d7b3df4ae2)
- [ReInit\(InputStream\)](#reinit-e03395a4a4ba)
- [ReInit\(InputStream, String\)](#reinit-330085293cfa)
- [ReInit\(PathParserTokenManager\)](#reinit-40008fea4204)
- [ReInit\(Reader\)](#reinit-4ce6f3557028)
- [Term\(\)](#term-454e01cdf5f2)
- [trace\_enabled\(\)](#trace_enabled-0d5a0a082fa5)

**Nested Types**:

- [PathConfBinary](PathParser/PathConfBinary.md#pathconfbinary-5ab7abfe8171)
- [PathElement](PathParser/PathElement.md#pathelement-30082145995b)
- [PathKey](PathParser/PathKey.md#pathkey-a9b70d1850aa)

## Constructors

### PathParser() <a href="#pathparser-c10c07c8cd77" id="pathparser-c10c07c8cd77"></a>

```java
public PathParser()
```

### PathParser(InputStream) <a href="#pathparser-6ef844c1b6fc" id="pathparser-6ef844c1b6fc"></a>

```java
public PathParser(java.io.InputStream stream)
```

Constructor with InputStream.

**Parameters**

- `java.io.InputStream stream`

### PathParser(InputStream, String) <a href="#pathparser-60a47d80f664" id="pathparser-60a47d80f664"></a>

```java
public PathParser(java.io.InputStream stream, String encoding)
```

Constructor with InputStream and supplied encoding

**Parameters**

- `java.io.InputStream stream`
- `String encoding`

### PathParser(PathParserTokenManager) <a href="#pathparser-87dc448d0bb4" id="pathparser-87dc448d0bb4"></a>

```java
public PathParser(com.tailf.conf.gen.PathParserTokenManager tm)
```

Types: [PathParserTokenManager](PathParserTokenManager.md#pathparsertokenmanager-048d8d4f37c4)

Constructor with generated Token Manager.

**Parameters**

- `com.tailf.conf.gen.PathParserTokenManager tm`

### PathParser(Reader) <a href="#pathparser-8195c9a0b35f" id="pathparser-8195c9a0b35f"></a>

```java
public PathParser(java.io.Reader stream)
```

Constructor.

**Parameters**

- `java.io.Reader stream`

### PathParser(String, Object[]) <a href="#pathparser-e7ef3c34825a" id="pathparser-e7ef3c34825a"></a>

```java
public PathParser(String s, Object[] args)
```

**Parameters**

- `String s`
- `Object[] args`


## Fields

### jj_input_stream <a href="#jj_input_stream-a656fd5e96db" id="jj_input_stream-a656fd5e96db"></a>

**Package-private**

```java
com.tailf.conf.gen.JavaCharStream jj_input_stream = null;
```

Types: [JavaCharStream](JavaCharStream.md#javacharstream-b90e6870657d)

### jj_nt <a href="#jj_nt-9db0740275fe" id="jj_nt-9db0740275fe"></a>

```java
public com.tailf.conf.gen.Token jj_nt = null;
```

Types: [Token](Token.md#token-b7a155cc1a5e)

Next token.

### token <a href="#token-93f8344c37b8" id="token-93f8344c37b8"></a>

```java
public com.tailf.conf.gen.Token token = null;
```

Types: [Token](Token.md#token-b7a155cc1a5e)

Current token.

### token_source <a href="#token_source-65d526092316" id="token_source-65d526092316"></a>

```java
public com.tailf.conf.gen.PathParserTokenManager token_source = null;
```

Types: [PathParserTokenManager](PathParserTokenManager.md#pathparsertokenmanager-048d8d4f37c4)

Generated Token Manager.


## Methods

### Composite() <a href="#composite-395cb22786fb" id="composite-395cb22786fb"></a>

```java
public final com.tailf.conf.ConfObject Composite() throws com.tailf.conf.gen.ParseException
```

Types: [ConfObject](../ConfObject.md#confobject-5433616953b2), [ParseException](ParseException.md#parseexception-451af1d737ad)

### disable_tracing() <a href="#disable_tracing-6da9cdfdd969" id="disable_tracing-6da9cdfdd969"></a>

```java
public final void disable_tracing()
```

Disable tracing.

### Elem() <a href="#elem-faaaa7f12a9f" id="elem-faaaa7f12a9f"></a>

```java
public final void Elem() throws com.tailf.conf.gen.ParseException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad)

### enable_tracing() <a href="#enable_tracing-4b87a1586eda" id="enable_tracing-4b87a1586eda"></a>

```java
public final void enable_tracing()
```

Enable tracing.

### Entity() <a href="#entity-0ac965935919" id="entity-0ac965935919"></a>

```java
public final com.tailf.conf.ConfObject Entity() throws com.tailf.conf.gen.ParseException
```

Types: [ConfObject](../ConfObject.md#confobject-5433616953b2), [ParseException](ParseException.md#parseexception-451af1d737ad)

### Entity2() <a href="#entity2-879dd3264818" id="entity2-879dd3264818"></a>

```java
public final com.tailf.conf.ConfObject Entity2() throws com.tailf.conf.gen.ParseException
```

Types: [ConfObject](../ConfObject.md#confobject-5433616953b2), [ParseException](ParseException.md#parseexception-451af1d737ad)

### generateParseException() <a href="#generateparseexception-deb7e661e2f1" id="generateparseexception-deb7e661e2f1"></a>

```java
public com.tailf.conf.gen.ParseException generateParseException()
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad)

Generate ParseException.

### getNextToken() <a href="#getnexttoken-dc921ada5024" id="getnexttoken-dc921ada5024"></a>

```java
public final com.tailf.conf.gen.Token getNextToken()
```

Types: [Token](Token.md#token-b7a155cc1a5e)

Get the next Token.

### getToken(int) <a href="#gettoken-dc7acf63f451" id="gettoken-dc7acf63f451"></a>

```java
public final com.tailf.conf.gen.Token getToken(int index)
```

Types: [Token](Token.md#token-b7a155cc1a5e)

Get the specific Token.

**Parameters**

- `int index`

### list() <a href="#list-e6b1546900c0" id="list-e6b1546900c0"></a>

```java
public final void list() throws com.tailf.conf.gen.ParseException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad)

### MatchedBraces() <a href="#matchedbraces-e9eca213d331" id="matchedbraces-e9eca213d331"></a>

```java
public final void MatchedBraces() throws com.tailf.conf.gen.ParseException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad)

### MatchedBrackets() <a href="#matchedbrackets-356b765831ae" id="matchedbrackets-356b765831ae"></a>

```java
public final void MatchedBrackets() throws com.tailf.conf.gen.ParseException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad)

### parse() <a href="#parse-29d7b3df4ae2" id="parse-29d7b3df4ae2"></a>

```java
public final java.util.List<com.tailf.conf.gen.PathParser.PathElement> parse() throws com.tailf.conf.gen.ParseException
    throws com.tailf.conf.gen.ParseException
```

Types: [PathElement](PathParser/PathElement.md#pathelement-30082145995b), [ParseException](ParseException.md#parseexception-451af1d737ad)

root method.

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

### ReInit(PathParserTokenManager) <a href="#reinit-40008fea4204" id="reinit-40008fea4204"></a>

```java
public void ReInit(com.tailf.conf.gen.PathParserTokenManager tm)
```

Types: [PathParserTokenManager](PathParserTokenManager.md#pathparsertokenmanager-048d8d4f37c4)

Reinitialise.

**Parameters**

- `com.tailf.conf.gen.PathParserTokenManager tm`

### ReInit(Reader) <a href="#reinit-4ce6f3557028" id="reinit-4ce6f3557028"></a>

```java
public void ReInit(java.io.Reader stream)
```

Reinitialise.

**Parameters**

- `java.io.Reader stream`

### Term() <a href="#term-454e01cdf5f2" id="term-454e01cdf5f2"></a>

```java
public final void Term() throws com.tailf.conf.gen.ParseException
```

Types: [ParseException](ParseException.md#parseexception-451af1d737ad)

### trace_enabled() <a href="#trace_enabled-0d5a0a082fa5" id="trace_enabled-0d5a0a082fa5"></a>

```java
public final boolean trace_enabled()
```

Trace enabled.


## Nested Types

- [PathConfBinary](PathParser/PathConfBinary.md#pathconfbinary-5ab7abfe8171)
- [PathElement](PathParser/PathElement.md#pathelement-30082145995b)
- [PathKey](PathParser/PathKey.md#pathkey-a9b70d1850aa)
