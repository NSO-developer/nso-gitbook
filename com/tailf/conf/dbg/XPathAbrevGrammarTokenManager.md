<a id="cls-XPathAbrevGrammarTokenManager"></a>
# XPathAbrevGrammarTokenManager

**Package-private**

```java
@SuppressWarnings({"unused"})
class com.tailf.conf.dbg.XPathAbrevGrammarTokenManager
    implements com.tailf.conf.dbg.XPathAbrevGrammarConstants
```

Types: [XPathAbrevGrammarConstants](XPathAbrevGrammarConstants.md#cls-XPathAbrevGrammarConstants)

Token Manager.

## Members

**Constructors**:

- [XPathAbrevGrammarTokenManager(JavaCharStream)](#m-xpathabrevgrammartokenmanager-17b8fdcee667)
- [XPathAbrevGrammarTokenManager(JavaCharStream, int)](#m-xpathabrevgrammartokenmanager-e879d22c6d57)

**Fields**:

- [AXIS_ANCESTOR](XPathAbrevGrammarConstants.md#m-AXIS_ANCESTOR) from XPathAbrevGrammarConstants
- [AXIS_ANCESTOR_OR_SELF](XPathAbrevGrammarConstants.md#m-AXIS_ANCESTOR_OR_SELF) from XPathAbrevGrammarConstants
- [AXIS_ATTRIBUTE](XPathAbrevGrammarConstants.md#m-AXIS_ATTRIBUTE) from XPathAbrevGrammarConstants
- [AXIS_CHILD](XPathAbrevGrammarConstants.md#m-AXIS_CHILD) from XPathAbrevGrammarConstants
- [AXIS_DESCENDANT](XPathAbrevGrammarConstants.md#m-AXIS_DESCENDANT) from XPathAbrevGrammarConstants
- [AXIS_DESCENDANT_OR_SELF](XPathAbrevGrammarConstants.md#m-AXIS_DESCENDANT_OR_SELF) from XPathAbrevGrammarConstants
- [AXIS_FOLLOWING](XPathAbrevGrammarConstants.md#m-AXIS_FOLLOWING) from XPathAbrevGrammarConstants
- [AXIS_FOLLOWING_SIBLING](XPathAbrevGrammarConstants.md#m-AXIS_FOLLOWING_SIBLING) from XPathAbrevGrammarConstants
- [AXIS_NAMESPACE](XPathAbrevGrammarConstants.md#m-AXIS_NAMESPACE) from XPathAbrevGrammarConstants
- [AXIS_PARENT](XPathAbrevGrammarConstants.md#m-AXIS_PARENT) from XPathAbrevGrammarConstants
- [AXIS_PRECEDING](XPathAbrevGrammarConstants.md#m-AXIS_PRECEDING) from XPathAbrevGrammarConstants
- [AXIS_PRECEDING_SIBLING](XPathAbrevGrammarConstants.md#m-AXIS_PRECEDING_SIBLING) from XPathAbrevGrammarConstants
- [AXIS_SELF](XPathAbrevGrammarConstants.md#m-AXIS_SELF) from XPathAbrevGrammarConstants
- [BaseChar](XPathAbrevGrammarConstants.md#m-BaseChar) from XPathAbrevGrammarConstants
- [CombiningChar](XPathAbrevGrammarConstants.md#m-CombiningChar) from XPathAbrevGrammarConstants
- [curChar](#m-curChar)
- [curLexState](#m-curLexState)
- [debugStream](#m-debugStream)
- [DEFAULT](XPathAbrevGrammarConstants.md#m-DEFAULT) from XPathAbrevGrammarConstants
- [defaultLexState](#m-defaultLexState)
- [Digit](XPathAbrevGrammarConstants.md#m-Digit) from XPathAbrevGrammarConstants
- [EOF](XPathAbrevGrammarConstants.md#m-EOF) from XPathAbrevGrammarConstants
- [EQ](XPathAbrevGrammarConstants.md#m-EQ) from XPathAbrevGrammarConstants
- [Extender](XPathAbrevGrammarConstants.md#m-Extender) from XPathAbrevGrammarConstants
- [FUNCTION_CURRENT](XPathAbrevGrammarConstants.md#m-FUNCTION_CURRENT) from XPathAbrevGrammarConstants
- [Ideographic](XPathAbrevGrammarConstants.md#m-Ideographic) from XPathAbrevGrammarConstants
- [input_stream](#m-input_stream)
- [jjbitVec0](#m-jjbitVec0)
- [jjbitVec10](#m-jjbitVec10)
- [jjbitVec11](#m-jjbitVec11)
- [jjbitVec12](#m-jjbitVec12)
- [jjbitVec13](#m-jjbitVec13)
- [jjbitVec14](#m-jjbitVec14)
- [jjbitVec15](#m-jjbitVec15)
- [jjbitVec16](#m-jjbitVec16)
- [jjbitVec17](#m-jjbitVec17)
- [jjbitVec18](#m-jjbitVec18)
- [jjbitVec19](#m-jjbitVec19)
- [jjbitVec2](#m-jjbitVec2)
- [jjbitVec20](#m-jjbitVec20)
- [jjbitVec21](#m-jjbitVec21)
- [jjbitVec22](#m-jjbitVec22)
- [jjbitVec23](#m-jjbitVec23)
- [jjbitVec24](#m-jjbitVec24)
- [jjbitVec25](#m-jjbitVec25)
- [jjbitVec26](#m-jjbitVec26)
- [jjbitVec27](#m-jjbitVec27)
- [jjbitVec28](#m-jjbitVec28)
- [jjbitVec29](#m-jjbitVec29)
- [jjbitVec3](#m-jjbitVec3)
- [jjbitVec30](#m-jjbitVec30)
- [jjbitVec31](#m-jjbitVec31)
- [jjbitVec32](#m-jjbitVec32)
- [jjbitVec33](#m-jjbitVec33)
- [jjbitVec34](#m-jjbitVec34)
- [jjbitVec35](#m-jjbitVec35)
- [jjbitVec36](#m-jjbitVec36)
- [jjbitVec37](#m-jjbitVec37)
- [jjbitVec38](#m-jjbitVec38)
- [jjbitVec39](#m-jjbitVec39)
- [jjbitVec4](#m-jjbitVec4)
- [jjbitVec40](#m-jjbitVec40)
- [jjbitVec41](#m-jjbitVec41)
- [jjbitVec5](#m-jjbitVec5)
- [jjbitVec6](#m-jjbitVec6)
- [jjbitVec7](#m-jjbitVec7)
- [jjbitVec8](#m-jjbitVec8)
- [jjbitVec9](#m-jjbitVec9)
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
- [Letter](XPathAbrevGrammarConstants.md#m-Letter) from XPathAbrevGrammarConstants
- [lexStateNames](#m-lexStateNames)
- [Literal](XPathAbrevGrammarConstants.md#m-Literal) from XPathAbrevGrammarConstants
- [NCName](XPathAbrevGrammarConstants.md#m-NCName) from XPathAbrevGrammarConstants
- [Number](XPathAbrevGrammarConstants.md#m-Number) from XPathAbrevGrammarConstants
- [SLASH](XPathAbrevGrammarConstants.md#m-SLASH) from XPathAbrevGrammarConstants
- [tokenImage](XPathAbrevGrammarConstants.md#m-tokenImage) from XPathAbrevGrammarConstants
- [UnicodeDigit](XPathAbrevGrammarConstants.md#m-UnicodeDigit) from XPathAbrevGrammarConstants

**Methods**:

- [getNextToken()](#m-getnexttoken-dc921ada5024)
- [jjFillToken()](#m-jjfilltoken-65cab186126c)
- [MoreLexicalActions()](#m-morelexicalactions-949853b6331d)
- [ReInit(JavaCharStream)](#m-reinit-b39574178b47)
- [ReInit(JavaCharStream, int)](#m-reinit-6000a5dcdc64)
- [setDebugStream(PrintStream)](#m-setdebugstream-b3ded1375b4f)
- [SkipLexicalActions(Token)](#m-skiplexicalactions-424bc724dae7)
- [SwitchTo(int)](#m-switchto-11e96339668c)
- [TokenLexicalActions(Token)](#m-tokenlexicalactions-2e44b9f98c7f)

## Constructors

<a id="m-xpathabrevgrammartokenmanager-17b8fdcee667"></a>
### XPathAbrevGrammarTokenManager(JavaCharStream)

```java
public XPathAbrevGrammarTokenManager(com.tailf.conf.dbg.JavaCharStream stream)
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

Constructor.

**Parameters**

- `com.tailf.conf.dbg.JavaCharStream stream`

<a id="m-xpathabrevgrammartokenmanager-e879d22c6d57"></a>
### XPathAbrevGrammarTokenManager(JavaCharStream, int)

```java
public XPathAbrevGrammarTokenManager(com.tailf.conf.dbg.JavaCharStream stream, int lexState)
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

Constructor.

**Parameters**

- `com.tailf.conf.dbg.JavaCharStream stream`
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
protected com.tailf.conf.dbg.JavaCharStream input_stream = null;
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

<a id="m-jjbitVec0"></a>
### jjbitVec0

**Package-private**

```java
static final long[] jjbitVec0 = null;
```

<a id="m-jjbitVec10"></a>
### jjbitVec10

**Package-private**

```java
static final long[] jjbitVec10 = null;
```

<a id="m-jjbitVec11"></a>
### jjbitVec11

**Package-private**

```java
static final long[] jjbitVec11 = null;
```

<a id="m-jjbitVec12"></a>
### jjbitVec12

**Package-private**

```java
static final long[] jjbitVec12 = null;
```

<a id="m-jjbitVec13"></a>
### jjbitVec13

**Package-private**

```java
static final long[] jjbitVec13 = null;
```

<a id="m-jjbitVec14"></a>
### jjbitVec14

**Package-private**

```java
static final long[] jjbitVec14 = null;
```

<a id="m-jjbitVec15"></a>
### jjbitVec15

**Package-private**

```java
static final long[] jjbitVec15 = null;
```

<a id="m-jjbitVec16"></a>
### jjbitVec16

**Package-private**

```java
static final long[] jjbitVec16 = null;
```

<a id="m-jjbitVec17"></a>
### jjbitVec17

**Package-private**

```java
static final long[] jjbitVec17 = null;
```

<a id="m-jjbitVec18"></a>
### jjbitVec18

**Package-private**

```java
static final long[] jjbitVec18 = null;
```

<a id="m-jjbitVec19"></a>
### jjbitVec19

**Package-private**

```java
static final long[] jjbitVec19 = null;
```

<a id="m-jjbitVec2"></a>
### jjbitVec2

**Package-private**

```java
static final long[] jjbitVec2 = null;
```

<a id="m-jjbitVec20"></a>
### jjbitVec20

**Package-private**

```java
static final long[] jjbitVec20 = null;
```

<a id="m-jjbitVec21"></a>
### jjbitVec21

**Package-private**

```java
static final long[] jjbitVec21 = null;
```

<a id="m-jjbitVec22"></a>
### jjbitVec22

**Package-private**

```java
static final long[] jjbitVec22 = null;
```

<a id="m-jjbitVec23"></a>
### jjbitVec23

**Package-private**

```java
static final long[] jjbitVec23 = null;
```

<a id="m-jjbitVec24"></a>
### jjbitVec24

**Package-private**

```java
static final long[] jjbitVec24 = null;
```

<a id="m-jjbitVec25"></a>
### jjbitVec25

**Package-private**

```java
static final long[] jjbitVec25 = null;
```

<a id="m-jjbitVec26"></a>
### jjbitVec26

**Package-private**

```java
static final long[] jjbitVec26 = null;
```

<a id="m-jjbitVec27"></a>
### jjbitVec27

**Package-private**

```java
static final long[] jjbitVec27 = null;
```

<a id="m-jjbitVec28"></a>
### jjbitVec28

**Package-private**

```java
static final long[] jjbitVec28 = null;
```

<a id="m-jjbitVec29"></a>
### jjbitVec29

**Package-private**

```java
static final long[] jjbitVec29 = null;
```

<a id="m-jjbitVec3"></a>
### jjbitVec3

**Package-private**

```java
static final long[] jjbitVec3 = null;
```

<a id="m-jjbitVec30"></a>
### jjbitVec30

**Package-private**

```java
static final long[] jjbitVec30 = null;
```

<a id="m-jjbitVec31"></a>
### jjbitVec31

**Package-private**

```java
static final long[] jjbitVec31 = null;
```

<a id="m-jjbitVec32"></a>
### jjbitVec32

**Package-private**

```java
static final long[] jjbitVec32 = null;
```

<a id="m-jjbitVec33"></a>
### jjbitVec33

**Package-private**

```java
static final long[] jjbitVec33 = null;
```

<a id="m-jjbitVec34"></a>
### jjbitVec34

**Package-private**

```java
static final long[] jjbitVec34 = null;
```

<a id="m-jjbitVec35"></a>
### jjbitVec35

**Package-private**

```java
static final long[] jjbitVec35 = null;
```

<a id="m-jjbitVec36"></a>
### jjbitVec36

**Package-private**

```java
static final long[] jjbitVec36 = null;
```

<a id="m-jjbitVec37"></a>
### jjbitVec37

**Package-private**

```java
static final long[] jjbitVec37 = null;
```

<a id="m-jjbitVec38"></a>
### jjbitVec38

**Package-private**

```java
static final long[] jjbitVec38 = null;
```

<a id="m-jjbitVec39"></a>
### jjbitVec39

**Package-private**

```java
static final long[] jjbitVec39 = null;
```

<a id="m-jjbitVec4"></a>
### jjbitVec4

**Package-private**

```java
static final long[] jjbitVec4 = null;
```

<a id="m-jjbitVec40"></a>
### jjbitVec40

**Package-private**

```java
static final long[] jjbitVec40 = null;
```

<a id="m-jjbitVec41"></a>
### jjbitVec41

**Package-private**

```java
static final long[] jjbitVec41 = null;
```

<a id="m-jjbitVec5"></a>
### jjbitVec5

**Package-private**

```java
static final long[] jjbitVec5 = null;
```

<a id="m-jjbitVec6"></a>
### jjbitVec6

**Package-private**

```java
static final long[] jjbitVec6 = null;
```

<a id="m-jjbitVec7"></a>
### jjbitVec7

**Package-private**

```java
static final long[] jjbitVec7 = null;
```

<a id="m-jjbitVec8"></a>
### jjbitVec8

**Package-private**

```java
static final long[] jjbitVec8 = null;
```

<a id="m-jjbitVec9"></a>
### jjbitVec9

**Package-private**

```java
static final long[] jjbitVec9 = null;
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
public com.tailf.conf.dbg.Token getNextToken()
```

Types: [Token](Token.md#cls-Token)

Get the next Token.

<a id="m-jjfilltoken-65cab186126c"></a>
### jjFillToken()

```java
protected com.tailf.conf.dbg.Token jjFillToken()
```

Types: [Token](Token.md#cls-Token)

<a id="m-morelexicalactions-949853b6331d"></a>
### MoreLexicalActions()

**Package-private**

```java
void MoreLexicalActions()
```

<a id="m-reinit-b39574178b47"></a>
### ReInit(JavaCharStream)

```java
public void ReInit(com.tailf.conf.dbg.JavaCharStream stream)
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

Reinitialise parser.

**Parameters**

- `com.tailf.conf.dbg.JavaCharStream stream`

<a id="m-reinit-6000a5dcdc64"></a>
### ReInit(JavaCharStream, int)

```java
public void ReInit(com.tailf.conf.dbg.JavaCharStream stream, int lexState)
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

Reinitialise parser.

**Parameters**

- `com.tailf.conf.dbg.JavaCharStream stream`
- `int lexState`

<a id="m-setdebugstream-b3ded1375b4f"></a>
### setDebugStream(PrintStream)

```java
public void setDebugStream(java.io.PrintStream ds)
```

Set debug output.

**Parameters**

- `java.io.PrintStream ds`

<a id="m-skiplexicalactions-424bc724dae7"></a>
### SkipLexicalActions(Token)

**Package-private**

```java
void SkipLexicalActions(com.tailf.conf.dbg.Token matchedToken)
```

Types: [Token](Token.md#cls-Token)

**Parameters**

- `com.tailf.conf.dbg.Token matchedToken`

<a id="m-switchto-11e96339668c"></a>
### SwitchTo(int)

```java
public void SwitchTo(int lexState)
```

Switch to specified lex state.

**Parameters**

- `int lexState`

<a id="m-tokenlexicalactions-2e44b9f98c7f"></a>
### TokenLexicalActions(Token)

**Package-private**

```java
void TokenLexicalActions(com.tailf.conf.dbg.Token matchedToken)
```

Types: [Token](Token.md#cls-Token)

**Parameters**

- `com.tailf.conf.dbg.Token matchedToken`
