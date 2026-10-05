<a id="s-PathParserTokenManager"></a>
# PathParserTokenManager

**Package-private**

```java
@SuppressWarnings({"unused"})
class com.tailf.conf.gen.PathParserTokenManager
    implements com.tailf.conf.gen.PathParserConstants
```

Types: [PathParserConstants](PathParserConstants.md#s-PathParserConstants)

Token Manager.

## Members

**Constructors**:

- [PathParserTokenManager(JavaCharStream)](#s-PathParserTokenManager-1)
- [PathParserTokenManager(JavaCharStream, int)](#s-PathParserTokenManager-2)

**Fields**:

- [CHAR](PathParserConstants.md#s-CHAR) from PathParserConstants
- [CHAR2](PathParserConstants.md#s-CHAR2) from PathParserConstants
- [COLON](PathParserConstants.md#s-COLON) from PathParserConstants
- [curChar](#s-curChar)
- [curLexState](#s-curLexState)
- [debugStream](#s-debugStream)
- [DEFAULT](PathParserConstants.md#s-DEFAULT) from PathParserConstants
- [defaultLexState](#s-defaultLexState)
- [EOF](PathParserConstants.md#s-EOF) from PathParserConstants
- [IDENTIFIER](PathParserConstants.md#s-IDENTIFIER) from PathParserConstants
- [IDENTIFIER2](PathParserConstants.md#s-IDENTIFIER2) from PathParserConstants
- [input_stream](#s-input_stream)
- [INSIDE_BRACES](PathParserConstants.md#s-INSIDE_BRACES) from PathParserConstants
- [INSIDE_QUOTE](PathParserConstants.md#s-INSIDE_QUOTE) from PathParserConstants
- [jjbitVec0](#s-jjbitVec0)
- [jjbitVec2](#s-jjbitVec2)
- [jjmatchedKind](#s-jjmatchedKind)
- [jjmatchedPos](#s-jjmatchedPos)
- [jjnewLexState](#s-jjnewLexState)
- [jjnewStateCnt](#s-jjnewStateCnt)
- [jjnextStates](#s-jjnextStates)
- [jjround](#s-jjround)
- [jjstrLiteralImages](#s-jjstrLiteralImages)
- [jjtoMore](#s-jjtoMore)
- [jjtoSkip](#s-jjtoSkip)
- [jjtoSpecial](#s-jjtoSpecial)
- [jjtoToken](#s-jjtoToken)
- [LBRACE](PathParserConstants.md#s-LBRACE) from PathParserConstants
- [LBRACKET](PathParserConstants.md#s-LBRACKET) from PathParserConstants
- [lexStateNames](#s-lexStateNames)
- [PERCENT](PathParserConstants.md#s-PERCENT) from PathParserConstants
- [PERCENT2](PathParserConstants.md#s-PERCENT2) from PathParserConstants
- [RBRACE](PathParserConstants.md#s-RBRACE) from PathParserConstants
- [RBRACKET](PathParserConstants.md#s-RBRACKET) from PathParserConstants
- [SLASH](PathParserConstants.md#s-SLASH) from PathParserConstants
- [STRLIT](PathParserConstants.md#s-STRLIT) from PathParserConstants
- [tokenImage](PathParserConstants.md#s-tokenImage) from PathParserConstants

**Methods**:

- [getNextToken()](#s-getNextToken)
- [jjFillToken()](#s-jjFillToken)
- [MoreLexicalActions()](#s-MoreLexicalActions)
- [ReInit(JavaCharStream)](#s-ReInit)
- [ReInit(JavaCharStream, int)](#s-ReInit-1)
- [setDebugStream(PrintStream)](#s-setDebugStream)
- [SkipLexicalActions(Token)](#s-SkipLexicalActions)
- [SwitchTo(int)](#s-SwitchTo)
- [TokenLexicalActions(Token)](#s-TokenLexicalActions)

## Constructors

<a id="s-PathParserTokenManager-1"></a>
### PathParserTokenManager(JavaCharStream)

```java
public PathParserTokenManager(com.tailf.conf.gen.JavaCharStream stream)
```

Types: [JavaCharStream](JavaCharStream.md#s-JavaCharStream)

Constructor.

**Parameters**

- `com.tailf.conf.gen.JavaCharStream stream`

<a id="s-PathParserTokenManager-2"></a>
### PathParserTokenManager(JavaCharStream, int)

```java
public PathParserTokenManager(com.tailf.conf.gen.JavaCharStream stream, int lexState)
```

Types: [JavaCharStream](JavaCharStream.md#s-JavaCharStream)

Constructor.

**Parameters**

- `com.tailf.conf.gen.JavaCharStream stream`
- `int lexState`


## Fields

<a id="s-curChar"></a>
### curChar

```java
protected int curChar = null;
```

<a id="s-curLexState"></a>
### curLexState

**Package-private**

```java
int curLexState = null;
```

<a id="s-debugStream"></a>
### debugStream

```java
public java.io.PrintStream debugStream = null;
```

Debug output.

<a id="s-defaultLexState"></a>
### defaultLexState

**Package-private**

```java
int defaultLexState = null;
```

<a id="s-input_stream"></a>
### input_stream

```java
protected com.tailf.conf.gen.JavaCharStream input_stream = null;
```

Types: [JavaCharStream](JavaCharStream.md#s-JavaCharStream)

<a id="s-jjbitVec0"></a>
### jjbitVec0

**Package-private**

```java
static final long[] jjbitVec0 = null;
```

<a id="s-jjbitVec2"></a>
### jjbitVec2

**Package-private**

```java
static final long[] jjbitVec2 = null;
```

<a id="s-jjmatchedKind"></a>
### jjmatchedKind

**Package-private**

```java
int jjmatchedKind = null;
```

<a id="s-jjmatchedPos"></a>
### jjmatchedPos

**Package-private**

```java
int jjmatchedPos = null;
```

<a id="s-jjnewLexState"></a>
### jjnewLexState

```java
public static final int[] jjnewLexState = null;
```

Lex State array.

<a id="s-jjnewStateCnt"></a>
### jjnewStateCnt

**Package-private**

```java
int jjnewStateCnt = null;
```

<a id="s-jjnextStates"></a>
### jjnextStates

**Package-private**

```java
static final int[] jjnextStates = null;
```

<a id="s-jjround"></a>
### jjround

**Package-private**

```java
int jjround = null;
```

<a id="s-jjstrLiteralImages"></a>
### jjstrLiteralImages

```java
public static final String[] jjstrLiteralImages = null;
```

Token literal values.

<a id="s-jjtoMore"></a>
### jjtoMore

**Package-private**

```java
static final long[] jjtoMore = null;
```

<a id="s-jjtoSkip"></a>
### jjtoSkip

**Package-private**

```java
static final long[] jjtoSkip = null;
```

<a id="s-jjtoSpecial"></a>
### jjtoSpecial

**Package-private**

```java
static final long[] jjtoSpecial = null;
```

<a id="s-jjtoToken"></a>
### jjtoToken

**Package-private**

```java
static final long[] jjtoToken = null;
```

<a id="s-lexStateNames"></a>
### lexStateNames

```java
public static final String[] lexStateNames = null;
```

Lexer state names.


## Methods

<a id="s-getNextToken"></a>
### getNextToken()

```java
public com.tailf.conf.gen.Token getNextToken()
```

Types: [Token](Token.md#s-Token)

Get the next Token.

<a id="s-jjFillToken"></a>
### jjFillToken()

```java
protected com.tailf.conf.gen.Token jjFillToken()
```

Types: [Token](Token.md#s-Token)

<a id="s-MoreLexicalActions"></a>
### MoreLexicalActions()

**Package-private**

```java
void MoreLexicalActions()
```

<a id="s-ReInit"></a>
### ReInit(JavaCharStream)

```java
public void ReInit(com.tailf.conf.gen.JavaCharStream stream)
```

Types: [JavaCharStream](JavaCharStream.md#s-JavaCharStream)

Reinitialise parser.

**Parameters**

- `com.tailf.conf.gen.JavaCharStream stream`

<a id="s-ReInit-1"></a>
### ReInit(JavaCharStream, int)

```java
public void ReInit(com.tailf.conf.gen.JavaCharStream stream, int lexState)
```

Types: [JavaCharStream](JavaCharStream.md#s-JavaCharStream)

Reinitialise parser.

**Parameters**

- `com.tailf.conf.gen.JavaCharStream stream`
- `int lexState`

<a id="s-setDebugStream"></a>
### setDebugStream(PrintStream)

```java
public void setDebugStream(java.io.PrintStream ds)
```

Set debug output.

**Parameters**

- `java.io.PrintStream ds`

<a id="s-SkipLexicalActions"></a>
### SkipLexicalActions(Token)

**Package-private**

```java
void SkipLexicalActions(com.tailf.conf.gen.Token matchedToken)
```

Types: [Token](Token.md#s-Token)

**Parameters**

- `com.tailf.conf.gen.Token matchedToken`

<a id="s-SwitchTo"></a>
### SwitchTo(int)

```java
public void SwitchTo(int lexState)
```

Switch to specified lex state.

**Parameters**

- `int lexState`

<a id="s-TokenLexicalActions"></a>
### TokenLexicalActions(Token)

**Package-private**

```java
void TokenLexicalActions(com.tailf.conf.gen.Token matchedToken)
```

Types: [Token](Token.md#s-Token)

**Parameters**

- `com.tailf.conf.gen.Token matchedToken`
