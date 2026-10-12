# PathParser <a href="#pathparser-c76e6680dd52" id="pathparser-c76e6680dd52"></a>

```java
public final class com.tailf.conf.gen.PathParser
```

Path Parser.

## Members

**Constructors**:

- [PathParser\(\)](#pathparser-c10c07c8cd77)
- [PathParser\(InputStream\)](#pathparser-6ef844c1b6fc)
- [PathParser\(InputStream, String\)](#pathparser-60a47d80f664)
- [PathParser\(PathParserTokenManager\)](#pathparser-87dc448d0bb4)
- [PathParser\(Reader\)](#pathparser-8195c9a0b35f)
- [PathParser\(String, Object\.\.\.\)](#pathparser-33ee1cafe074)

**Fields**:

- [CHAR](#char-029984bb6c9e)
- [CHAR2](#char2-88635d8a54cf)
- [COLON](#colon-2c1dbe3aeee8)
- [DEFAULT](#default-5965fc85722b)
- [EOF](#eof-e4ab74e8c3eb)
- [IDENTIFIER](#identifier-73b18fdcf248)
- [IDENTIFIER2](#identifier2-8a04449a942b)
- [INSIDE\_BRACES](#inside_braces-126526a96a03)
- [INSIDE\_QUOTE](#inside_quote-1a887df059d8)
- [jj\_nt](#jj_nt-9db0740275fe)
- [LBRACE](#lbrace-29f2f43b91d0)
- [LBRACKET](#lbracket-2910754c7a67)
- [PERCENT](#percent-732182372b0c)
- [PERCENT2](#percent2-b22c5103c9d8)
- [RBRACE](#rbrace-0415afff6842)
- [RBRACKET](#rbracket-71ce92365b6c)
- [SLASH](#slash-3c7d823f3e28)
- [STRLIT](#strlit-d6078ea07628)
- [token](#token-93f8344c37b8)
- [token\_source](#token_source-65d526092316)
- [tokenImage](#tokenimage-c13f534d4471)

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

### PathParser(String, Object...) <a href="#pathparser-33ee1cafe074" id="pathparser-33ee1cafe074"></a>

```java
public PathParser(String s, Object... args)
```

**Parameters**

- `String s`
- `Object... args`


## Fields

### CHAR <a href="#char-029984bb6c9e" id="char-029984bb6c9e"></a>

```java
public static final int CHAR = 7;
```

RegularExpression Id.

### CHAR2 <a href="#char2-88635d8a54cf" id="char2-88635d8a54cf"></a>

```java
public static final int CHAR2 = 19;
```

RegularExpression Id.

### COLON <a href="#colon-2c1dbe3aeee8" id="colon-2c1dbe3aeee8"></a>

```java
public static final int COLON = 9;
```

RegularExpression Id.

### DEFAULT <a href="#default-5965fc85722b" id="default-5965fc85722b"></a>

```java
public static final int DEFAULT = 0;
```

Lexical state.

### EOF <a href="#eof-e4ab74e8c3eb" id="eof-e4ab74e8c3eb"></a>

```java
public static final int EOF = 0;
```

End of File.

### IDENTIFIER <a href="#identifier-73b18fdcf248" id="identifier-73b18fdcf248"></a>

```java
public static final int IDENTIFIER = 6;
```

RegularExpression Id.

### IDENTIFIER2 <a href="#identifier2-8a04449a942b" id="identifier2-8a04449a942b"></a>

```java
public static final int IDENTIFIER2 = 18;
```

RegularExpression Id.

### INSIDE_BRACES <a href="#inside_braces-126526a96a03" id="inside_braces-126526a96a03"></a>

```java
public static final int INSIDE_BRACES = 1;
```

Lexical state.

### INSIDE_QUOTE <a href="#inside_quote-1a887df059d8" id="inside_quote-1a887df059d8"></a>

```java
public static final int INSIDE_QUOTE = 2;
```

Lexical state.

### jj_nt <a href="#jj_nt-9db0740275fe" id="jj_nt-9db0740275fe"></a>

```java
public com.tailf.conf.gen.Token jj_nt;
```

Next token.

### LBRACE <a href="#lbrace-29f2f43b91d0" id="lbrace-29f2f43b91d0"></a>

```java
public static final int LBRACE = 11;
```

RegularExpression Id.

### LBRACKET <a href="#lbracket-2910754c7a67" id="lbracket-2910754c7a67"></a>

```java
public static final int LBRACKET = 12;
```

RegularExpression Id.

### PERCENT <a href="#percent-732182372b0c" id="percent-732182372b0c"></a>

```java
public static final int PERCENT = 8;
```

RegularExpression Id.

### PERCENT2 <a href="#percent2-b22c5103c9d8" id="percent2-b22c5103c9d8"></a>

```java
public static final int PERCENT2 = 20;
```

RegularExpression Id.

### RBRACE <a href="#rbrace-0415afff6842" id="rbrace-0415afff6842"></a>

```java
public static final int RBRACE = 21;
```

RegularExpression Id.

### RBRACKET <a href="#rbracket-71ce92365b6c" id="rbracket-71ce92365b6c"></a>

```java
public static final int RBRACKET = 13;
```

RegularExpression Id.

### SLASH <a href="#slash-3c7d823f3e28" id="slash-3c7d823f3e28"></a>

```java
public static final int SLASH = 10;
```

RegularExpression Id.

### STRLIT <a href="#strlit-d6078ea07628" id="strlit-d6078ea07628"></a>

```java
public static final int STRLIT = 23;
```

RegularExpression Id.

### token <a href="#token-93f8344c37b8" id="token-93f8344c37b8"></a>

```java
public com.tailf.conf.gen.Token token;
```

Current token.

### token_source <a href="#token_source-65d526092316" id="token_source-65d526092316"></a>

```java
public com.tailf.conf.gen.PathParserTokenManager token_source;
```

Generated Token Manager.

### tokenImage <a href="#tokenimage-c13f534d4471" id="tokenimage-c13f534d4471"></a>

```java
public static final String[] tokenImage;
```

Literal token values.


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

Get the next Token.

### getToken(int) <a href="#gettoken-dc7acf63f451" id="gettoken-dc7acf63f451"></a>

```java
public final com.tailf.conf.gen.Token getToken(int index)
```

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
public final java.util.List<com.tailf.conf.gen.PathParser.PathElement> parse()
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
