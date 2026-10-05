# PathParserTokenManager <a href="#cls-PathParserTokenManager" id="cls-PathParserTokenManager"></a>

**Package-private**

```java
@SuppressWarnings({"unused"})
class com.tailf.conf.gen.PathParserTokenManager
    implements com.tailf.conf.gen.PathParserConstants
```

Types: [PathParserConstants](PathParserConstants.md#cls-PathParserConstants)

Token Manager.

## Members

**Constructors**:

- [PathParserTokenManager(JavaCharStream)](#m-PathParserTokenManager-f1d632e41bca)
- [PathParserTokenManager(JavaCharStream, int)](#m-PathParserTokenManager-ab57e84d09f3)

**Fields**:

- [CHAR](PathParserConstants.md#m-CHAR) from PathParserConstants
- [CHAR2](PathParserConstants.md#m-CHAR2) from PathParserConstants
- [COLON](PathParserConstants.md#m-COLON) from PathParserConstants
- [curChar](#m-curChar)
- [curLexState](#m-curLexState)
- [debugStream](#m-debugStream)
- [DEFAULT](PathParserConstants.md#m-DEFAULT) from PathParserConstants
- [defaultLexState](#m-defaultLexState)
- [EOF](PathParserConstants.md#m-EOF) from PathParserConstants
- [IDENTIFIER](PathParserConstants.md#m-IDENTIFIER) from PathParserConstants
- [IDENTIFIER2](PathParserConstants.md#m-IDENTIFIER2) from PathParserConstants
- [input_stream](#m-input_stream)
- [INSIDE_BRACES](PathParserConstants.md#m-INSIDE_BRACES) from PathParserConstants
- [INSIDE_QUOTE](PathParserConstants.md#m-INSIDE_QUOTE) from PathParserConstants
- [jjbitVec0](#m-jjbitVec0)
- [jjbitVec2](#m-jjbitVec2)
- [jjmatchedKind](#m-jjmatchedKind)
- [jjmatchedPos](#m-jjmatchedPos)
- [jjnewLexState](#m-jjnewLexState)
- [jjnewStateCnt](#m-jjnewStateCnt)
- [jjnextStates](#m-jjnextStates)
- [jjround](#m-jjround)
- [jjstrLiteralImages](#m-jjstrLiteralImages)
- [jjtoMore](#m-jjtoMore)
- [jjtoSkip](#m-jjtoSkip)
- [jjtoSpecial](#m-jjtoSpecial)
- [jjtoToken](#m-jjtoToken)
- [LBRACE](PathParserConstants.md#m-LBRACE) from PathParserConstants
- [LBRACKET](PathParserConstants.md#m-LBRACKET) from PathParserConstants
- [lexStateNames](#m-lexStateNames)
- [PERCENT](PathParserConstants.md#m-PERCENT) from PathParserConstants
- [PERCENT2](PathParserConstants.md#m-PERCENT2) from PathParserConstants
- [RBRACE](PathParserConstants.md#m-RBRACE) from PathParserConstants
- [RBRACKET](PathParserConstants.md#m-RBRACKET) from PathParserConstants
- [SLASH](PathParserConstants.md#m-SLASH) from PathParserConstants
- [STRLIT](PathParserConstants.md#m-STRLIT) from PathParserConstants
- [tokenImage](PathParserConstants.md#m-tokenImage) from PathParserConstants

**Methods**:

- [getNextToken()](#m-getNextToken-dc921ada5024)
- [jjFillToken()](#m-jjFillToken-65cab186126c)
- [MoreLexicalActions()](#m-MoreLexicalActions-949853b6331d)
- [ReInit(JavaCharStream)](#m-ReInit-c114d2c1f7c1)
- [ReInit(JavaCharStream, int)](#m-ReInit-eaef39c1af93)
- [setDebugStream(PrintStream)](#m-setDebugStream-b3ded1375b4f)
- [SkipLexicalActions(Token)](#m-SkipLexicalActions-64f9393655bf)
- [SwitchTo(int)](#m-SwitchTo-11e96339668c)
- [TokenLexicalActions(Token)](#m-TokenLexicalActions-f60b6e1bdbf0)

## Constructors

### PathParserTokenManager(JavaCharStream) <a href="#m-PathParserTokenManager-f1d632e41bca" id="m-PathParserTokenManager-f1d632e41bca"></a>

```java
public PathParserTokenManager(com.tailf.conf.gen.JavaCharStream stream)
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

Constructor.

**Parameters**

- `com.tailf.conf.gen.JavaCharStream stream`

### PathParserTokenManager(JavaCharStream, int) <a href="#m-PathParserTokenManager-ab57e84d09f3" id="m-PathParserTokenManager-ab57e84d09f3"></a>

```java
public PathParserTokenManager(com.tailf.conf.gen.JavaCharStream stream, int lexState)
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

Constructor.

**Parameters**

- `com.tailf.conf.gen.JavaCharStream stream`
- `int lexState`


## Fields

### curChar <a href="#m-curChar" id="m-curChar"></a>

```java
protected int curChar = null;
```

### curLexState <a href="#m-curLexState" id="m-curLexState"></a>

**Package-private**

```java
int curLexState = null;
```

### debugStream <a href="#m-debugStream" id="m-debugStream"></a>

```java
public java.io.PrintStream debugStream = null;
```

Debug output.

### defaultLexState <a href="#m-defaultLexState" id="m-defaultLexState"></a>

**Package-private**

```java
int defaultLexState = null;
```

### input_stream <a href="#m-input_stream" id="m-input_stream"></a>

```java
protected com.tailf.conf.gen.JavaCharStream input_stream = null;
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

### jjbitVec0 <a href="#m-jjbitVec0" id="m-jjbitVec0"></a>

**Package-private**

```java
static final long[] jjbitVec0 = null;
```

### jjbitVec2 <a href="#m-jjbitVec2" id="m-jjbitVec2"></a>

**Package-private**

```java
static final long[] jjbitVec2 = null;
```

### jjmatchedKind <a href="#m-jjmatchedKind" id="m-jjmatchedKind"></a>

**Package-private**

```java
int jjmatchedKind = null;
```

### jjmatchedPos <a href="#m-jjmatchedPos" id="m-jjmatchedPos"></a>

**Package-private**

```java
int jjmatchedPos = null;
```

### jjnewLexState <a href="#m-jjnewLexState" id="m-jjnewLexState"></a>

```java
public static final int[] jjnewLexState = null;
```

Lex State array.

### jjnewStateCnt <a href="#m-jjnewStateCnt" id="m-jjnewStateCnt"></a>

**Package-private**

```java
int jjnewStateCnt = null;
```

### jjnextStates <a href="#m-jjnextStates" id="m-jjnextStates"></a>

**Package-private**

```java
static final int[] jjnextStates = null;
```

### jjround <a href="#m-jjround" id="m-jjround"></a>

**Package-private**

```java
int jjround = null;
```

### jjstrLiteralImages <a href="#m-jjstrLiteralImages" id="m-jjstrLiteralImages"></a>

```java
public static final String[] jjstrLiteralImages = null;
```

Token literal values.

### jjtoMore <a href="#m-jjtoMore" id="m-jjtoMore"></a>

**Package-private**

```java
static final long[] jjtoMore = null;
```

### jjtoSkip <a href="#m-jjtoSkip" id="m-jjtoSkip"></a>

**Package-private**

```java
static final long[] jjtoSkip = null;
```

### jjtoSpecial <a href="#m-jjtoSpecial" id="m-jjtoSpecial"></a>

**Package-private**

```java
static final long[] jjtoSpecial = null;
```

### jjtoToken <a href="#m-jjtoToken" id="m-jjtoToken"></a>

**Package-private**

```java
static final long[] jjtoToken = null;
```

### lexStateNames <a href="#m-lexStateNames" id="m-lexStateNames"></a>

```java
public static final String[] lexStateNames = null;
```

Lexer state names.


## Methods

### getNextToken() <a href="#m-getNextToken-dc921ada5024" id="m-getNextToken-dc921ada5024"></a>

```java
public com.tailf.conf.gen.Token getNextToken()
```

Types: [Token](Token.md#cls-Token)

Get the next Token.

### jjFillToken() <a href="#m-jjFillToken-65cab186126c" id="m-jjFillToken-65cab186126c"></a>

```java
protected com.tailf.conf.gen.Token jjFillToken()
```

Types: [Token](Token.md#cls-Token)

### MoreLexicalActions() <a href="#m-MoreLexicalActions-949853b6331d" id="m-MoreLexicalActions-949853b6331d"></a>

**Package-private**

```java
void MoreLexicalActions()
```

### ReInit(JavaCharStream) <a href="#m-ReInit-c114d2c1f7c1" id="m-ReInit-c114d2c1f7c1"></a>

```java
public void ReInit(com.tailf.conf.gen.JavaCharStream stream)
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

Reinitialise parser.

**Parameters**

- `com.tailf.conf.gen.JavaCharStream stream`

### ReInit(JavaCharStream, int) <a href="#m-ReInit-eaef39c1af93" id="m-ReInit-eaef39c1af93"></a>

```java
public void ReInit(com.tailf.conf.gen.JavaCharStream stream, int lexState)
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

Reinitialise parser.

**Parameters**

- `com.tailf.conf.gen.JavaCharStream stream`
- `int lexState`

### setDebugStream(PrintStream) <a href="#m-setDebugStream-b3ded1375b4f" id="m-setDebugStream-b3ded1375b4f"></a>

```java
public void setDebugStream(java.io.PrintStream ds)
```

Set debug output.

**Parameters**

- `java.io.PrintStream ds`

### SkipLexicalActions(Token) <a href="#m-SkipLexicalActions-64f9393655bf" id="m-SkipLexicalActions-64f9393655bf"></a>

**Package-private**

```java
void SkipLexicalActions(com.tailf.conf.gen.Token matchedToken)
```

Types: [Token](Token.md#cls-Token)

**Parameters**

- `com.tailf.conf.gen.Token matchedToken`

### SwitchTo(int) <a href="#m-SwitchTo-11e96339668c" id="m-SwitchTo-11e96339668c"></a>

```java
public void SwitchTo(int lexState)
```

Switch to specified lex state.

**Parameters**

- `int lexState`

### TokenLexicalActions(Token) <a href="#m-TokenLexicalActions-f60b6e1bdbf0" id="m-TokenLexicalActions-f60b6e1bdbf0"></a>

**Package-private**

```java
void TokenLexicalActions(com.tailf.conf.gen.Token matchedToken)
```

Types: [Token](Token.md#cls-Token)

**Parameters**

- `com.tailf.conf.gen.Token matchedToken`
