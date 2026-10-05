# XPathAbrevGrammarTokenManager <a href="#cls-XPathAbrevGrammarTokenManager" id="cls-XPathAbrevGrammarTokenManager"></a>

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

- [XPathAbrevGrammarTokenManager(JavaCharStream)](#m-XPathAbrevGrammarTokenManager-17b8fdcee667)
- [XPathAbrevGrammarTokenManager(JavaCharStream, int)](#m-XPathAbrevGrammarTokenManager-e879d22c6d57)

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

- [getNextToken()](#m-getNextToken-dc921ada5024)
- [jjFillToken()](#m-jjFillToken-65cab186126c)
- [MoreLexicalActions()](#m-MoreLexicalActions-949853b6331d)
- [ReInit(JavaCharStream)](#m-ReInit-b39574178b47)
- [ReInit(JavaCharStream, int)](#m-ReInit-6000a5dcdc64)
- [setDebugStream(PrintStream)](#m-setDebugStream-b3ded1375b4f)
- [SkipLexicalActions(Token)](#m-SkipLexicalActions-424bc724dae7)
- [SwitchTo(int)](#m-SwitchTo-11e96339668c)
- [TokenLexicalActions(Token)](#m-TokenLexicalActions-2e44b9f98c7f)

## Constructors

### XPathAbrevGrammarTokenManager(JavaCharStream) <a href="#m-XPathAbrevGrammarTokenManager-17b8fdcee667" id="m-XPathAbrevGrammarTokenManager-17b8fdcee667"></a>

```java
public XPathAbrevGrammarTokenManager(com.tailf.conf.dbg.JavaCharStream stream)
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

Constructor.

**Parameters**

- `com.tailf.conf.dbg.JavaCharStream stream`

### XPathAbrevGrammarTokenManager(JavaCharStream, int) <a href="#m-XPathAbrevGrammarTokenManager-e879d22c6d57" id="m-XPathAbrevGrammarTokenManager-e879d22c6d57"></a>

```java
public XPathAbrevGrammarTokenManager(com.tailf.conf.dbg.JavaCharStream stream, int lexState)
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

Constructor.

**Parameters**

- `com.tailf.conf.dbg.JavaCharStream stream`
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
protected com.tailf.conf.dbg.JavaCharStream input_stream = null;
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

### jjbitVec0 <a href="#m-jjbitVec0" id="m-jjbitVec0"></a>

**Package-private**

```java
static final long[] jjbitVec0 = null;
```

### jjbitVec10 <a href="#m-jjbitVec10" id="m-jjbitVec10"></a>

**Package-private**

```java
static final long[] jjbitVec10 = null;
```

### jjbitVec11 <a href="#m-jjbitVec11" id="m-jjbitVec11"></a>

**Package-private**

```java
static final long[] jjbitVec11 = null;
```

### jjbitVec12 <a href="#m-jjbitVec12" id="m-jjbitVec12"></a>

**Package-private**

```java
static final long[] jjbitVec12 = null;
```

### jjbitVec13 <a href="#m-jjbitVec13" id="m-jjbitVec13"></a>

**Package-private**

```java
static final long[] jjbitVec13 = null;
```

### jjbitVec14 <a href="#m-jjbitVec14" id="m-jjbitVec14"></a>

**Package-private**

```java
static final long[] jjbitVec14 = null;
```

### jjbitVec15 <a href="#m-jjbitVec15" id="m-jjbitVec15"></a>

**Package-private**

```java
static final long[] jjbitVec15 = null;
```

### jjbitVec16 <a href="#m-jjbitVec16" id="m-jjbitVec16"></a>

**Package-private**

```java
static final long[] jjbitVec16 = null;
```

### jjbitVec17 <a href="#m-jjbitVec17" id="m-jjbitVec17"></a>

**Package-private**

```java
static final long[] jjbitVec17 = null;
```

### jjbitVec18 <a href="#m-jjbitVec18" id="m-jjbitVec18"></a>

**Package-private**

```java
static final long[] jjbitVec18 = null;
```

### jjbitVec19 <a href="#m-jjbitVec19" id="m-jjbitVec19"></a>

**Package-private**

```java
static final long[] jjbitVec19 = null;
```

### jjbitVec2 <a href="#m-jjbitVec2" id="m-jjbitVec2"></a>

**Package-private**

```java
static final long[] jjbitVec2 = null;
```

### jjbitVec20 <a href="#m-jjbitVec20" id="m-jjbitVec20"></a>

**Package-private**

```java
static final long[] jjbitVec20 = null;
```

### jjbitVec21 <a href="#m-jjbitVec21" id="m-jjbitVec21"></a>

**Package-private**

```java
static final long[] jjbitVec21 = null;
```

### jjbitVec22 <a href="#m-jjbitVec22" id="m-jjbitVec22"></a>

**Package-private**

```java
static final long[] jjbitVec22 = null;
```

### jjbitVec23 <a href="#m-jjbitVec23" id="m-jjbitVec23"></a>

**Package-private**

```java
static final long[] jjbitVec23 = null;
```

### jjbitVec24 <a href="#m-jjbitVec24" id="m-jjbitVec24"></a>

**Package-private**

```java
static final long[] jjbitVec24 = null;
```

### jjbitVec25 <a href="#m-jjbitVec25" id="m-jjbitVec25"></a>

**Package-private**

```java
static final long[] jjbitVec25 = null;
```

### jjbitVec26 <a href="#m-jjbitVec26" id="m-jjbitVec26"></a>

**Package-private**

```java
static final long[] jjbitVec26 = null;
```

### jjbitVec27 <a href="#m-jjbitVec27" id="m-jjbitVec27"></a>

**Package-private**

```java
static final long[] jjbitVec27 = null;
```

### jjbitVec28 <a href="#m-jjbitVec28" id="m-jjbitVec28"></a>

**Package-private**

```java
static final long[] jjbitVec28 = null;
```

### jjbitVec29 <a href="#m-jjbitVec29" id="m-jjbitVec29"></a>

**Package-private**

```java
static final long[] jjbitVec29 = null;
```

### jjbitVec3 <a href="#m-jjbitVec3" id="m-jjbitVec3"></a>

**Package-private**

```java
static final long[] jjbitVec3 = null;
```

### jjbitVec30 <a href="#m-jjbitVec30" id="m-jjbitVec30"></a>

**Package-private**

```java
static final long[] jjbitVec30 = null;
```

### jjbitVec31 <a href="#m-jjbitVec31" id="m-jjbitVec31"></a>

**Package-private**

```java
static final long[] jjbitVec31 = null;
```

### jjbitVec32 <a href="#m-jjbitVec32" id="m-jjbitVec32"></a>

**Package-private**

```java
static final long[] jjbitVec32 = null;
```

### jjbitVec33 <a href="#m-jjbitVec33" id="m-jjbitVec33"></a>

**Package-private**

```java
static final long[] jjbitVec33 = null;
```

### jjbitVec34 <a href="#m-jjbitVec34" id="m-jjbitVec34"></a>

**Package-private**

```java
static final long[] jjbitVec34 = null;
```

### jjbitVec35 <a href="#m-jjbitVec35" id="m-jjbitVec35"></a>

**Package-private**

```java
static final long[] jjbitVec35 = null;
```

### jjbitVec36 <a href="#m-jjbitVec36" id="m-jjbitVec36"></a>

**Package-private**

```java
static final long[] jjbitVec36 = null;
```

### jjbitVec37 <a href="#m-jjbitVec37" id="m-jjbitVec37"></a>

**Package-private**

```java
static final long[] jjbitVec37 = null;
```

### jjbitVec38 <a href="#m-jjbitVec38" id="m-jjbitVec38"></a>

**Package-private**

```java
static final long[] jjbitVec38 = null;
```

### jjbitVec39 <a href="#m-jjbitVec39" id="m-jjbitVec39"></a>

**Package-private**

```java
static final long[] jjbitVec39 = null;
```

### jjbitVec4 <a href="#m-jjbitVec4" id="m-jjbitVec4"></a>

**Package-private**

```java
static final long[] jjbitVec4 = null;
```

### jjbitVec40 <a href="#m-jjbitVec40" id="m-jjbitVec40"></a>

**Package-private**

```java
static final long[] jjbitVec40 = null;
```

### jjbitVec41 <a href="#m-jjbitVec41" id="m-jjbitVec41"></a>

**Package-private**

```java
static final long[] jjbitVec41 = null;
```

### jjbitVec5 <a href="#m-jjbitVec5" id="m-jjbitVec5"></a>

**Package-private**

```java
static final long[] jjbitVec5 = null;
```

### jjbitVec6 <a href="#m-jjbitVec6" id="m-jjbitVec6"></a>

**Package-private**

```java
static final long[] jjbitVec6 = null;
```

### jjbitVec7 <a href="#m-jjbitVec7" id="m-jjbitVec7"></a>

**Package-private**

```java
static final long[] jjbitVec7 = null;
```

### jjbitVec8 <a href="#m-jjbitVec8" id="m-jjbitVec8"></a>

**Package-private**

```java
static final long[] jjbitVec8 = null;
```

### jjbitVec9 <a href="#m-jjbitVec9" id="m-jjbitVec9"></a>

**Package-private**

```java
static final long[] jjbitVec9 = null;
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
public com.tailf.conf.dbg.Token getNextToken()
```

Types: [Token](Token.md#cls-Token)

Get the next Token.

### jjFillToken() <a href="#m-jjFillToken-65cab186126c" id="m-jjFillToken-65cab186126c"></a>

```java
protected com.tailf.conf.dbg.Token jjFillToken()
```

Types: [Token](Token.md#cls-Token)

### MoreLexicalActions() <a href="#m-MoreLexicalActions-949853b6331d" id="m-MoreLexicalActions-949853b6331d"></a>

**Package-private**

```java
void MoreLexicalActions()
```

### ReInit(JavaCharStream) <a href="#m-ReInit-b39574178b47" id="m-ReInit-b39574178b47"></a>

```java
public void ReInit(com.tailf.conf.dbg.JavaCharStream stream)
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

Reinitialise parser.

**Parameters**

- `com.tailf.conf.dbg.JavaCharStream stream`

### ReInit(JavaCharStream, int) <a href="#m-ReInit-6000a5dcdc64" id="m-ReInit-6000a5dcdc64"></a>

```java
public void ReInit(com.tailf.conf.dbg.JavaCharStream stream, int lexState)
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

Reinitialise parser.

**Parameters**

- `com.tailf.conf.dbg.JavaCharStream stream`
- `int lexState`

### setDebugStream(PrintStream) <a href="#m-setDebugStream-b3ded1375b4f" id="m-setDebugStream-b3ded1375b4f"></a>

```java
public void setDebugStream(java.io.PrintStream ds)
```

Set debug output.

**Parameters**

- `java.io.PrintStream ds`

### SkipLexicalActions(Token) <a href="#m-SkipLexicalActions-424bc724dae7" id="m-SkipLexicalActions-424bc724dae7"></a>

**Package-private**

```java
void SkipLexicalActions(com.tailf.conf.dbg.Token matchedToken)
```

Types: [Token](Token.md#cls-Token)

**Parameters**

- `com.tailf.conf.dbg.Token matchedToken`

### SwitchTo(int) <a href="#m-SwitchTo-11e96339668c" id="m-SwitchTo-11e96339668c"></a>

```java
public void SwitchTo(int lexState)
```

Switch to specified lex state.

**Parameters**

- `int lexState`

### TokenLexicalActions(Token) <a href="#m-TokenLexicalActions-2e44b9f98c7f" id="m-TokenLexicalActions-2e44b9f98c7f"></a>

**Package-private**

```java
void TokenLexicalActions(com.tailf.conf.dbg.Token matchedToken)
```

Types: [Token](Token.md#cls-Token)

**Parameters**

- `com.tailf.conf.dbg.Token matchedToken`
