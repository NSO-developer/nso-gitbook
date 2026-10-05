<a id="cls-PathParserTokenManager"></a>
# PathParserTokenManager

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

- [PathParserTokenManager(JavaCharStream)](#m-pathparsertokenmanager-f1d632e41bca)
- [PathParserTokenManager(JavaCharStream, int)](#m-pathparsertokenmanager-ab57e84d09f3)

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

- [getNextToken()](#m-getnexttoken-dc921ada5024)
- [jjFillToken()](#m-jjfilltoken-65cab186126c)
- [MoreLexicalActions()](#m-morelexicalactions-949853b6331d)
- [ReInit(JavaCharStream)](#m-reinit-c114d2c1f7c1)
- [ReInit(JavaCharStream, int)](#m-reinit-eaef39c1af93)
- [setDebugStream(PrintStream)](#m-setdebugstream-b3ded1375b4f)
- [SkipLexicalActions(Token)](#m-skiplexicalactions-64f9393655bf)
- [SwitchTo(int)](#m-switchto-11e96339668c)
- [TokenLexicalActions(Token)](#m-tokenlexicalactions-f60b6e1bdbf0)

## Constructors

<a id="m-pathparsertokenmanager-f1d632e41bca"></a>
### PathParserTokenManager(JavaCharStream)

```java
public PathParserTokenManager(com.tailf.conf.gen.JavaCharStream stream)
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

Constructor.

**Parameters**

- `com.tailf.conf.gen.JavaCharStream stream`

<a id="m-pathparsertokenmanager-ab57e84d09f3"></a>
### PathParserTokenManager(JavaCharStream, int)

```java
public PathParserTokenManager(com.tailf.conf.gen.JavaCharStream stream, int lexState)
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

Constructor.

**Parameters**

- `com.tailf.conf.gen.JavaCharStream stream`
- `int lexState`


## Fields

<a id="m-curChar"></a>
### curChar

```java
protected int curChar = null;
```

<a id="m-curLexState"></a>
### curLexState

**Package-private**

```java
int curLexState = null;
```

<a id="m-debugStream"></a>
### debugStream

```java
public java.io.PrintStream debugStream = null;
```

Debug output.

<a id="m-defaultLexState"></a>
### defaultLexState

**Package-private**

```java
int defaultLexState = null;
```

<a id="m-input_stream"></a>
### input_stream

```java
protected com.tailf.conf.gen.JavaCharStream input_stream = null;
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

<a id="m-jjbitVec0"></a>
### jjbitVec0

**Package-private**

```java
static final long[] jjbitVec0 = null;
```

<a id="m-jjbitVec2"></a>
### jjbitVec2

**Package-private**

```java
static final long[] jjbitVec2 = null;
```

<a id="m-jjmatchedKind"></a>
### jjmatchedKind

**Package-private**

```java
int jjmatchedKind = null;
```

<a id="m-jjmatchedPos"></a>
### jjmatchedPos

**Package-private**

```java
int jjmatchedPos = null;
```

<a id="m-jjnewLexState"></a>
### jjnewLexState

```java
public static final int[] jjnewLexState = null;
```

Lex State array.

<a id="m-jjnewStateCnt"></a>
### jjnewStateCnt

**Package-private**

```java
int jjnewStateCnt = null;
```

<a id="m-jjnextStates"></a>
### jjnextStates

**Package-private**

```java
static final int[] jjnextStates = null;
```

<a id="m-jjround"></a>
### jjround

**Package-private**

```java
int jjround = null;
```

<a id="m-jjstrLiteralImages"></a>
### jjstrLiteralImages

```java
public static final String[] jjstrLiteralImages = null;
```

Token literal values.

<a id="m-jjtoMore"></a>
### jjtoMore

**Package-private**

```java
static final long[] jjtoMore = null;
```

<a id="m-jjtoSkip"></a>
### jjtoSkip

**Package-private**

```java
static final long[] jjtoSkip = null;
```

<a id="m-jjtoSpecial"></a>
### jjtoSpecial

**Package-private**

```java
static final long[] jjtoSpecial = null;
```

<a id="m-jjtoToken"></a>
### jjtoToken

**Package-private**

```java
static final long[] jjtoToken = null;
```

<a id="m-lexStateNames"></a>
### lexStateNames

```java
public static final String[] lexStateNames = null;
```

Lexer state names.


## Methods

<a id="m-getnexttoken-dc921ada5024"></a>
### getNextToken()

```java
public com.tailf.conf.gen.Token getNextToken()
```

Types: [Token](Token.md#cls-Token)

Get the next Token.

<a id="m-jjfilltoken-65cab186126c"></a>
### jjFillToken()

```java
protected com.tailf.conf.gen.Token jjFillToken()
```

Types: [Token](Token.md#cls-Token)

<a id="m-morelexicalactions-949853b6331d"></a>
### MoreLexicalActions()

**Package-private**

```java
void MoreLexicalActions()
```

<a id="m-reinit-c114d2c1f7c1"></a>
### ReInit(JavaCharStream)

```java
public void ReInit(com.tailf.conf.gen.JavaCharStream stream)
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

Reinitialise parser.

**Parameters**

- `com.tailf.conf.gen.JavaCharStream stream`

<a id="m-reinit-eaef39c1af93"></a>
### ReInit(JavaCharStream, int)

```java
public void ReInit(com.tailf.conf.gen.JavaCharStream stream, int lexState)
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

Reinitialise parser.

**Parameters**

- `com.tailf.conf.gen.JavaCharStream stream`
- `int lexState`

<a id="m-setdebugstream-b3ded1375b4f"></a>
### setDebugStream(PrintStream)

```java
public void setDebugStream(java.io.PrintStream ds)
```

Set debug output.

**Parameters**

- `java.io.PrintStream ds`

<a id="m-skiplexicalactions-64f9393655bf"></a>
### SkipLexicalActions(Token)

**Package-private**

```java
void SkipLexicalActions(com.tailf.conf.gen.Token matchedToken)
```

Types: [Token](Token.md#cls-Token)

**Parameters**

- `com.tailf.conf.gen.Token matchedToken`

<a id="m-switchto-11e96339668c"></a>
### SwitchTo(int)

```java
public void SwitchTo(int lexState)
```

Switch to specified lex state.

**Parameters**

- `int lexState`

<a id="m-tokenlexicalactions-f60b6e1bdbf0"></a>
### TokenLexicalActions(Token)

**Package-private**

```java
void TokenLexicalActions(com.tailf.conf.gen.Token matchedToken)
```

Types: [Token](Token.md#cls-Token)

**Parameters**

- `com.tailf.conf.gen.Token matchedToken`
