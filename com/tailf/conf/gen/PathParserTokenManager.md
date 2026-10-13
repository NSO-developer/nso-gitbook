# PathParserTokenManager <a href="#pathparsertokenmanager-048d8d4f37c4" id="pathparsertokenmanager-048d8d4f37c4"></a>

**Package-private**

```java
@SuppressWarnings({"unused"})
class com.tailf.conf.gen.PathParserTokenManager
    implements com.tailf.conf.gen.PathParserConstants
```

Types: [PathParserConstants](PathParserConstants.md#pathparserconstants-bdbbf565b32b)

Token Manager.

## Members

**Constructors**:

- [PathParserTokenManager\(JavaCharStream\)](#pathparsertokenmanager-f1d632e41bca)
- [PathParserTokenManager\(JavaCharStream, int\)](#pathparsertokenmanager-ab57e84d09f3)

**Fields**:

- [CHAR](PathParserConstants.md#char-029984bb6c9e) from PathParserConstants
- [CHAR2](PathParserConstants.md#char2-88635d8a54cf) from PathParserConstants
- [COLON](PathParserConstants.md#colon-2c1dbe3aeee8) from PathParserConstants
- [curChar](#curchar-3e995b252b00)
- [curLexState](#curlexstate-28d5fb803bd1)
- [debugStream](#debugstream-9ee581db3e1f)
- [DEFAULT](PathParserConstants.md#default-5965fc85722b) from PathParserConstants
- [defaultLexState](#defaultlexstate-d63dd26271ca)
- [EOF](PathParserConstants.md#eof-e4ab74e8c3eb) from PathParserConstants
- [IDENTIFIER](PathParserConstants.md#identifier-73b18fdcf248) from PathParserConstants
- [IDENTIFIER2](PathParserConstants.md#identifier2-8a04449a942b) from PathParserConstants
- [input\_stream](#input_stream-2a4833575cfa)
- [INSIDE\_BRACES](PathParserConstants.md#inside_braces-126526a96a03) from PathParserConstants
- [INSIDE\_QUOTE](PathParserConstants.md#inside_quote-1a887df059d8) from PathParserConstants
- [jjbitVec0](#jjbitvec0-7cc00549bd7f)
- [jjbitVec2](#jjbitvec2-3e0977c072b2)
- [jjmatchedKind](#jjmatchedkind-d40cd9e25c29)
- [jjmatchedPos](#jjmatchedpos-4b5241cd0b47)
- [jjnewLexState](#jjnewlexstate-972aa67747d6)
- [jjnewStateCnt](#jjnewstatecnt-7d2b6d45c5f6)
- [jjnextStates](#jjnextstates-72a61a641496)
- [jjround](#jjround-c259d1b6eef2)
- [jjstrLiteralImages](#jjstrliteralimages-2ea424cda7b6)
- [jjtoMore](#jjtomore-21e8bf2d54c0)
- [jjtoSkip](#jjtoskip-5fd252490508)
- [jjtoSpecial](#jjtospecial-ebbc0c8f864a)
- [jjtoToken](#jjtotoken-0f3004df4c88)
- [LBRACE](PathParserConstants.md#lbrace-29f2f43b91d0) from PathParserConstants
- [LBRACKET](PathParserConstants.md#lbracket-2910754c7a67) from PathParserConstants
- [lexStateNames](#lexstatenames-5ae9c2c4b657)
- [PERCENT](PathParserConstants.md#percent-732182372b0c) from PathParserConstants
- [PERCENT2](PathParserConstants.md#percent2-b22c5103c9d8) from PathParserConstants
- [RBRACE](PathParserConstants.md#rbrace-0415afff6842) from PathParserConstants
- [RBRACKET](PathParserConstants.md#rbracket-71ce92365b6c) from PathParserConstants
- [SLASH](PathParserConstants.md#slash-3c7d823f3e28) from PathParserConstants
- [STRLIT](PathParserConstants.md#strlit-d6078ea07628) from PathParserConstants
- [tokenImage](PathParserConstants.md#tokenimage-c13f534d4471) from PathParserConstants

**Methods**:

- [getNextToken\(\)](#getnexttoken-dc921ada5024)
- [jjFillToken\(\)](#jjfilltoken-65cab186126c)
- [MoreLexicalActions\(\)](#morelexicalactions-949853b6331d)
- [ReInit\(JavaCharStream\)](#reinit-c114d2c1f7c1)
- [ReInit\(JavaCharStream, int\)](#reinit-eaef39c1af93)
- [setDebugStream\(PrintStream\)](#setdebugstream-b3ded1375b4f)
- [SkipLexicalActions\(Token\)](#skiplexicalactions-64f9393655bf)
- [SwitchTo\(int\)](#switchto-11e96339668c)
- [TokenLexicalActions\(Token\)](#tokenlexicalactions-f60b6e1bdbf0)

## Constructors

### PathParserTokenManager(JavaCharStream) <a href="#pathparsertokenmanager-f1d632e41bca" id="pathparsertokenmanager-f1d632e41bca"></a>

```java
public PathParserTokenManager(com.tailf.conf.gen.JavaCharStream stream)
```

Types: [JavaCharStream](JavaCharStream.md#javacharstream-b90e6870657d)

Constructor.

**Parameters**

- `com.tailf.conf.gen.JavaCharStream stream`

### PathParserTokenManager(JavaCharStream, int) <a href="#pathparsertokenmanager-ab57e84d09f3" id="pathparsertokenmanager-ab57e84d09f3"></a>

```java
public PathParserTokenManager(com.tailf.conf.gen.JavaCharStream stream, int lexState)
```

Types: [JavaCharStream](JavaCharStream.md#javacharstream-b90e6870657d)

Constructor.

**Parameters**

- `com.tailf.conf.gen.JavaCharStream stream`
- `int lexState`


## Fields

### curChar <a href="#curchar-3e995b252b00" id="curchar-3e995b252b00"></a>

```java
protected int curChar = null;
```

### curLexState <a href="#curlexstate-28d5fb803bd1" id="curlexstate-28d5fb803bd1"></a>

**Package-private**

```java
int curLexState = null;
```

### debugStream <a href="#debugstream-9ee581db3e1f" id="debugstream-9ee581db3e1f"></a>

```java
public java.io.PrintStream debugStream = null;
```

Debug output.

### defaultLexState <a href="#defaultlexstate-d63dd26271ca" id="defaultlexstate-d63dd26271ca"></a>

**Package-private**

```java
int defaultLexState = null;
```

### input_stream <a href="#input_stream-2a4833575cfa" id="input_stream-2a4833575cfa"></a>

```java
protected com.tailf.conf.gen.JavaCharStream input_stream = null;
```

Types: [JavaCharStream](JavaCharStream.md#javacharstream-b90e6870657d)

### jjbitVec0 <a href="#jjbitvec0-7cc00549bd7f" id="jjbitvec0-7cc00549bd7f"></a>

**Package-private**

```java
static final long[] jjbitVec0 = null;
```

### jjbitVec2 <a href="#jjbitvec2-3e0977c072b2" id="jjbitvec2-3e0977c072b2"></a>

**Package-private**

```java
static final long[] jjbitVec2 = null;
```

### jjmatchedKind <a href="#jjmatchedkind-d40cd9e25c29" id="jjmatchedkind-d40cd9e25c29"></a>

**Package-private**

```java
int jjmatchedKind = null;
```

### jjmatchedPos <a href="#jjmatchedpos-4b5241cd0b47" id="jjmatchedpos-4b5241cd0b47"></a>

**Package-private**

```java
int jjmatchedPos = null;
```

### jjnewLexState <a href="#jjnewlexstate-972aa67747d6" id="jjnewlexstate-972aa67747d6"></a>

```java
public static final int[] jjnewLexState = null;
```

Lex State array.

### jjnewStateCnt <a href="#jjnewstatecnt-7d2b6d45c5f6" id="jjnewstatecnt-7d2b6d45c5f6"></a>

**Package-private**

```java
int jjnewStateCnt = null;
```

### jjnextStates <a href="#jjnextstates-72a61a641496" id="jjnextstates-72a61a641496"></a>

**Package-private**

```java
static final int[] jjnextStates = null;
```

### jjround <a href="#jjround-c259d1b6eef2" id="jjround-c259d1b6eef2"></a>

**Package-private**

```java
int jjround = null;
```

### jjstrLiteralImages <a href="#jjstrliteralimages-2ea424cda7b6" id="jjstrliteralimages-2ea424cda7b6"></a>

```java
public static final String[] jjstrLiteralImages = null;
```

Token literal values.

### jjtoMore <a href="#jjtomore-21e8bf2d54c0" id="jjtomore-21e8bf2d54c0"></a>

**Package-private**

```java
static final long[] jjtoMore = null;
```

### jjtoSkip <a href="#jjtoskip-5fd252490508" id="jjtoskip-5fd252490508"></a>

**Package-private**

```java
static final long[] jjtoSkip = null;
```

### jjtoSpecial <a href="#jjtospecial-ebbc0c8f864a" id="jjtospecial-ebbc0c8f864a"></a>

**Package-private**

```java
static final long[] jjtoSpecial = null;
```

### jjtoToken <a href="#jjtotoken-0f3004df4c88" id="jjtotoken-0f3004df4c88"></a>

**Package-private**

```java
static final long[] jjtoToken = null;
```

### lexStateNames <a href="#lexstatenames-5ae9c2c4b657" id="lexstatenames-5ae9c2c4b657"></a>

```java
public static final String[] lexStateNames = null;
```

Lexer state names.


## Methods

### getNextToken() <a href="#getnexttoken-dc921ada5024" id="getnexttoken-dc921ada5024"></a>

```java
public com.tailf.conf.gen.Token getNextToken()
```

Types: [Token](Token.md#token-b7a155cc1a5e)

Get the next Token.

### jjFillToken() <a href="#jjfilltoken-65cab186126c" id="jjfilltoken-65cab186126c"></a>

```java
protected com.tailf.conf.gen.Token jjFillToken()
```

Types: [Token](Token.md#token-b7a155cc1a5e)

### MoreLexicalActions() <a href="#morelexicalactions-949853b6331d" id="morelexicalactions-949853b6331d"></a>

**Package-private**

```java
void MoreLexicalActions()
```

### ReInit(JavaCharStream) <a href="#reinit-c114d2c1f7c1" id="reinit-c114d2c1f7c1"></a>

```java
public void ReInit(com.tailf.conf.gen.JavaCharStream stream)
```

Types: [JavaCharStream](JavaCharStream.md#javacharstream-b90e6870657d)

Reinitialise parser.

**Parameters**

- `com.tailf.conf.gen.JavaCharStream stream`

### ReInit(JavaCharStream, int) <a href="#reinit-eaef39c1af93" id="reinit-eaef39c1af93"></a>

```java
public void ReInit(com.tailf.conf.gen.JavaCharStream stream, int lexState)
```

Types: [JavaCharStream](JavaCharStream.md#javacharstream-b90e6870657d)

Reinitialise parser.

**Parameters**

- `com.tailf.conf.gen.JavaCharStream stream`
- `int lexState`

### setDebugStream(PrintStream) <a href="#setdebugstream-b3ded1375b4f" id="setdebugstream-b3ded1375b4f"></a>

```java
public void setDebugStream(java.io.PrintStream ds)
```

Set debug output.

**Parameters**

- `java.io.PrintStream ds`

### SkipLexicalActions(Token) <a href="#skiplexicalactions-64f9393655bf" id="skiplexicalactions-64f9393655bf"></a>

**Package-private**

```java
void SkipLexicalActions(com.tailf.conf.gen.Token matchedToken)
```

Types: [Token](Token.md#token-b7a155cc1a5e)

**Parameters**

- `com.tailf.conf.gen.Token matchedToken`

### SwitchTo(int) <a href="#switchto-11e96339668c" id="switchto-11e96339668c"></a>

```java
public void SwitchTo(int lexState)
```

Switch to specified lex state.

**Parameters**

- `int lexState`

### TokenLexicalActions(Token) <a href="#tokenlexicalactions-f60b6e1bdbf0" id="tokenlexicalactions-f60b6e1bdbf0"></a>

**Package-private**

```java
void TokenLexicalActions(com.tailf.conf.gen.Token matchedToken)
```

Types: [Token](Token.md#token-b7a155cc1a5e)

**Parameters**

- `com.tailf.conf.gen.Token matchedToken`
