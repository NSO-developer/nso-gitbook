# XPathAbrev1TokenManager <a href="#cls-XPathAbrev1TokenManager" id="cls-XPathAbrev1TokenManager"></a>

**Package-private**

```java
@SuppressWarnings({"unused"})
class com.tailf.conf.gen2.XPathAbrev1TokenManager
    implements com.tailf.conf.gen2.XPathAbrev1Constants
```

Types: [XPathAbrev1Constants](XPathAbrev1Constants.md#cls-XPathAbrev1Constants)

Token Manager.

## Members

**Constructors**:

- [XPathAbrev1TokenManager(JavaCharStream)](#m-XPathAbrev1TokenManager-9d591d3f2da9)
- [XPathAbrev1TokenManager(JavaCharStream, int)](#m-XPathAbrev1TokenManager-77d0e278c64e)

**Fields**:

- [AXIS_ANCESTOR](XPathAbrev1Constants.md#m-AXIS_ANCESTOR) from XPathAbrev1Constants
- [AXIS_ANCESTOR_OR_SELF](XPathAbrev1Constants.md#m-AXIS_ANCESTOR_OR_SELF) from XPathAbrev1Constants
- [AXIS_ATTRIBUTE](XPathAbrev1Constants.md#m-AXIS_ATTRIBUTE) from XPathAbrev1Constants
- [AXIS_CHILD](XPathAbrev1Constants.md#m-AXIS_CHILD) from XPathAbrev1Constants
- [AXIS_DESCENDANT](XPathAbrev1Constants.md#m-AXIS_DESCENDANT) from XPathAbrev1Constants
- [AXIS_DESCENDANT_OR_SELF](XPathAbrev1Constants.md#m-AXIS_DESCENDANT_OR_SELF) from XPathAbrev1Constants
- [AXIS_FOLLOWING](XPathAbrev1Constants.md#m-AXIS_FOLLOWING) from XPathAbrev1Constants
- [AXIS_FOLLOWING_SIBLING](XPathAbrev1Constants.md#m-AXIS_FOLLOWING_SIBLING) from XPathAbrev1Constants
- [AXIS_NAMESPACE](XPathAbrev1Constants.md#m-AXIS_NAMESPACE) from XPathAbrev1Constants
- [AXIS_PARENT](XPathAbrev1Constants.md#m-AXIS_PARENT) from XPathAbrev1Constants
- [AXIS_PRECEDING](XPathAbrev1Constants.md#m-AXIS_PRECEDING) from XPathAbrev1Constants
- [AXIS_PRECEDING_SIBLING](XPathAbrev1Constants.md#m-AXIS_PRECEDING_SIBLING) from XPathAbrev1Constants
- [AXIS_SELF](XPathAbrev1Constants.md#m-AXIS_SELF) from XPathAbrev1Constants
- [BaseChar](XPathAbrev1Constants.md#m-BaseChar) from XPathAbrev1Constants
- [CombiningChar](XPathAbrev1Constants.md#m-CombiningChar) from XPathAbrev1Constants
- [curChar](#m-curChar)
- [curLexState](#m-curLexState)
- [debugStream](#m-debugStream)
- [DEFAULT](XPathAbrev1Constants.md#m-DEFAULT) from XPathAbrev1Constants
- [defaultLexState](#m-defaultLexState)
- [Digit](XPathAbrev1Constants.md#m-Digit) from XPathAbrev1Constants
- [EOF](XPathAbrev1Constants.md#m-EOF) from XPathAbrev1Constants
- [EQ](XPathAbrev1Constants.md#m-EQ) from XPathAbrev1Constants
- [Extender](XPathAbrev1Constants.md#m-Extender) from XPathAbrev1Constants
- [FUNCTION_CURRENT](XPathAbrev1Constants.md#m-FUNCTION_CURRENT) from XPathAbrev1Constants
- [Ideographic](XPathAbrev1Constants.md#m-Ideographic) from XPathAbrev1Constants
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
- [Letter](XPathAbrev1Constants.md#m-Letter) from XPathAbrev1Constants
- [lexStateNames](#m-lexStateNames)
- [Literal](XPathAbrev1Constants.md#m-Literal) from XPathAbrev1Constants
- [NCName](XPathAbrev1Constants.md#m-NCName) from XPathAbrev1Constants
- [Number](XPathAbrev1Constants.md#m-Number) from XPathAbrev1Constants
- [SLASH](XPathAbrev1Constants.md#m-SLASH) from XPathAbrev1Constants
- [tokenImage](XPathAbrev1Constants.md#m-tokenImage) from XPathAbrev1Constants
- [UnicodeDigit](XPathAbrev1Constants.md#m-UnicodeDigit) from XPathAbrev1Constants

**Methods**:

- [getNextToken()](#m-getNextToken-dc921ada5024)
- [jjFillToken()](#m-jjFillToken-65cab186126c)
- [MoreLexicalActions()](#m-MoreLexicalActions-949853b6331d)
- [ReInit(JavaCharStream)](#m-ReInit-aea274b20650)
- [ReInit(JavaCharStream, int)](#m-ReInit-162412793959)
- [setDebugStream(PrintStream)](#m-setDebugStream-b3ded1375b4f)
- [SkipLexicalActions(Token)](#m-SkipLexicalActions-0975b69b0591)
- [SwitchTo(int)](#m-SwitchTo-11e96339668c)
- [TokenLexicalActions(Token)](#m-TokenLexicalActions-16d53417ba92)

## Constructors

### XPathAbrev1TokenManager(JavaCharStream) <a href="#m-XPathAbrev1TokenManager-9d591d3f2da9" id="m-XPathAbrev1TokenManager-9d591d3f2da9"></a>

```java
public XPathAbrev1TokenManager(com.tailf.conf.gen2.JavaCharStream stream)
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

Constructor.

**Parameters**

- `com.tailf.conf.gen2.JavaCharStream stream`

### XPathAbrev1TokenManager(JavaCharStream, int) <a href="#m-XPathAbrev1TokenManager-77d0e278c64e" id="m-XPathAbrev1TokenManager-77d0e278c64e"></a>

```java
public XPathAbrev1TokenManager(com.tailf.conf.gen2.JavaCharStream stream, int lexState)
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

Constructor.

**Parameters**

- `com.tailf.conf.gen2.JavaCharStream stream`
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
protected com.tailf.conf.gen2.JavaCharStream input_stream = null;
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
public com.tailf.conf.gen2.Token getNextToken()
```

Types: [Token](Token.md#cls-Token)

Get the next Token.

### jjFillToken() <a href="#m-jjFillToken-65cab186126c" id="m-jjFillToken-65cab186126c"></a>

```java
protected com.tailf.conf.gen2.Token jjFillToken()
```

Types: [Token](Token.md#cls-Token)

### MoreLexicalActions() <a href="#m-MoreLexicalActions-949853b6331d" id="m-MoreLexicalActions-949853b6331d"></a>

**Package-private**

```java
void MoreLexicalActions()
```

### ReInit(JavaCharStream) <a href="#m-ReInit-aea274b20650" id="m-ReInit-aea274b20650"></a>

```java
public void ReInit(com.tailf.conf.gen2.JavaCharStream stream)
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

Reinitialise parser.

**Parameters**

- `com.tailf.conf.gen2.JavaCharStream stream`

### ReInit(JavaCharStream, int) <a href="#m-ReInit-162412793959" id="m-ReInit-162412793959"></a>

```java
public void ReInit(com.tailf.conf.gen2.JavaCharStream stream, int lexState)
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

Reinitialise parser.

**Parameters**

- `com.tailf.conf.gen2.JavaCharStream stream`
- `int lexState`

### setDebugStream(PrintStream) <a href="#m-setDebugStream-b3ded1375b4f" id="m-setDebugStream-b3ded1375b4f"></a>

```java
public void setDebugStream(java.io.PrintStream ds)
```

Set debug output.

**Parameters**

- `java.io.PrintStream ds`

### SkipLexicalActions(Token) <a href="#m-SkipLexicalActions-0975b69b0591" id="m-SkipLexicalActions-0975b69b0591"></a>

**Package-private**

```java
void SkipLexicalActions(com.tailf.conf.gen2.Token matchedToken)
```

Types: [Token](Token.md#cls-Token)

**Parameters**

- `com.tailf.conf.gen2.Token matchedToken`

### SwitchTo(int) <a href="#m-SwitchTo-11e96339668c" id="m-SwitchTo-11e96339668c"></a>

```java
public void SwitchTo(int lexState)
```

Switch to specified lex state.

**Parameters**

- `int lexState`

### TokenLexicalActions(Token) <a href="#m-TokenLexicalActions-16d53417ba92" id="m-TokenLexicalActions-16d53417ba92"></a>

**Package-private**

```java
void TokenLexicalActions(com.tailf.conf.gen2.Token matchedToken)
```

Types: [Token](Token.md#cls-Token)

**Parameters**

- `com.tailf.conf.gen2.Token matchedToken`
