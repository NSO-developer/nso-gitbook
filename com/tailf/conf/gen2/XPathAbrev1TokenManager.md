<a id="cls-XPathAbrev1TokenManager"></a>
# XPathAbrev1TokenManager

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

- [XPathAbrev1TokenManager(JavaCharStream)](#m-xpathabrev1tokenmanager-9d591d3f2da9)
- [XPathAbrev1TokenManager(JavaCharStream, int)](#m-xpathabrev1tokenmanager-77d0e278c64e)

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

- [getNextToken()](#m-getnexttoken-dc921ada5024)
- [jjFillToken()](#m-jjfilltoken-65cab186126c)
- [MoreLexicalActions()](#m-morelexicalactions-949853b6331d)
- [ReInit(JavaCharStream)](#m-reinit-aea274b20650)
- [ReInit(JavaCharStream, int)](#m-reinit-162412793959)
- [setDebugStream(PrintStream)](#m-setdebugstream-b3ded1375b4f)
- [SkipLexicalActions(Token)](#m-skiplexicalactions-0975b69b0591)
- [SwitchTo(int)](#m-switchto-11e96339668c)
- [TokenLexicalActions(Token)](#m-tokenlexicalactions-16d53417ba92)

## Constructors

<a id="m-xpathabrev1tokenmanager-9d591d3f2da9"></a>
### XPathAbrev1TokenManager(JavaCharStream)

```java
public XPathAbrev1TokenManager(com.tailf.conf.gen2.JavaCharStream stream)
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

Constructor.

**Parameters**

- `com.tailf.conf.gen2.JavaCharStream stream`

<a id="m-xpathabrev1tokenmanager-77d0e278c64e"></a>
### XPathAbrev1TokenManager(JavaCharStream, int)

```java
public XPathAbrev1TokenManager(com.tailf.conf.gen2.JavaCharStream stream, int lexState)
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

Constructor.

**Parameters**

- `com.tailf.conf.gen2.JavaCharStream stream`
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
protected com.tailf.conf.gen2.JavaCharStream input_stream = null;
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
public com.tailf.conf.gen2.Token getNextToken()
```

Types: [Token](Token.md#cls-Token)

Get the next Token.

<a id="m-jjfilltoken-65cab186126c"></a>
### jjFillToken()

```java
protected com.tailf.conf.gen2.Token jjFillToken()
```

Types: [Token](Token.md#cls-Token)

<a id="m-morelexicalactions-949853b6331d"></a>
### MoreLexicalActions()

**Package-private**

```java
void MoreLexicalActions()
```

<a id="m-reinit-aea274b20650"></a>
### ReInit(JavaCharStream)

```java
public void ReInit(com.tailf.conf.gen2.JavaCharStream stream)
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

Reinitialise parser.

**Parameters**

- `com.tailf.conf.gen2.JavaCharStream stream`

<a id="m-reinit-162412793959"></a>
### ReInit(JavaCharStream, int)

```java
public void ReInit(com.tailf.conf.gen2.JavaCharStream stream, int lexState)
```

Types: [JavaCharStream](JavaCharStream.md#cls-JavaCharStream)

Reinitialise parser.

**Parameters**

- `com.tailf.conf.gen2.JavaCharStream stream`
- `int lexState`

<a id="m-setdebugstream-b3ded1375b4f"></a>
### setDebugStream(PrintStream)

```java
public void setDebugStream(java.io.PrintStream ds)
```

Set debug output.

**Parameters**

- `java.io.PrintStream ds`

<a id="m-skiplexicalactions-0975b69b0591"></a>
### SkipLexicalActions(Token)

**Package-private**

```java
void SkipLexicalActions(com.tailf.conf.gen2.Token matchedToken)
```

Types: [Token](Token.md#cls-Token)

**Parameters**

- `com.tailf.conf.gen2.Token matchedToken`

<a id="m-switchto-11e96339668c"></a>
### SwitchTo(int)

```java
public void SwitchTo(int lexState)
```

Switch to specified lex state.

**Parameters**

- `int lexState`

<a id="m-tokenlexicalactions-16d53417ba92"></a>
### TokenLexicalActions(Token)

**Package-private**

```java
void TokenLexicalActions(com.tailf.conf.gen2.Token matchedToken)
```

Types: [Token](Token.md#cls-Token)

**Parameters**

- `com.tailf.conf.gen2.Token matchedToken`
