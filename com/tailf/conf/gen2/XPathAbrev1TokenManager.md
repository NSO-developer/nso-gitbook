<a id="s-XPathAbrev1TokenManager"></a>
# XPathAbrev1TokenManager

**Package-private**

```java
@SuppressWarnings({"unused"})
class com.tailf.conf.gen2.XPathAbrev1TokenManager
    implements com.tailf.conf.gen2.XPathAbrev1Constants
```

Types: [XPathAbrev1Constants](XPathAbrev1Constants.md#s-XPathAbrev1Constants)

Token Manager.

## Members

**Constructors**:

- [XPathAbrev1TokenManager(JavaCharStream)](#s-XPathAbrev1TokenManager-1)
- [XPathAbrev1TokenManager(JavaCharStream, int)](#s-XPathAbrev1TokenManager-2)

**Fields**:

- [AXIS_ANCESTOR](XPathAbrev1Constants.md#s-AXIS_ANCESTOR) from XPathAbrev1Constants
- [AXIS_ANCESTOR_OR_SELF](XPathAbrev1Constants.md#s-AXIS_ANCESTOR_OR_SELF) from XPathAbrev1Constants
- [AXIS_ATTRIBUTE](XPathAbrev1Constants.md#s-AXIS_ATTRIBUTE) from XPathAbrev1Constants
- [AXIS_CHILD](XPathAbrev1Constants.md#s-AXIS_CHILD) from XPathAbrev1Constants
- [AXIS_DESCENDANT](XPathAbrev1Constants.md#s-AXIS_DESCENDANT) from XPathAbrev1Constants
- [AXIS_DESCENDANT_OR_SELF](XPathAbrev1Constants.md#s-AXIS_DESCENDANT_OR_SELF) from XPathAbrev1Constants
- [AXIS_FOLLOWING](XPathAbrev1Constants.md#s-AXIS_FOLLOWING) from XPathAbrev1Constants
- [AXIS_FOLLOWING_SIBLING](XPathAbrev1Constants.md#s-AXIS_FOLLOWING_SIBLING) from XPathAbrev1Constants
- [AXIS_NAMESPACE](XPathAbrev1Constants.md#s-AXIS_NAMESPACE) from XPathAbrev1Constants
- [AXIS_PARENT](XPathAbrev1Constants.md#s-AXIS_PARENT) from XPathAbrev1Constants
- [AXIS_PRECEDING](XPathAbrev1Constants.md#s-AXIS_PRECEDING) from XPathAbrev1Constants
- [AXIS_PRECEDING_SIBLING](XPathAbrev1Constants.md#s-AXIS_PRECEDING_SIBLING) from XPathAbrev1Constants
- [AXIS_SELF](XPathAbrev1Constants.md#s-AXIS_SELF) from XPathAbrev1Constants
- [BaseChar](XPathAbrev1Constants.md#s-BaseChar) from XPathAbrev1Constants
- [CombiningChar](XPathAbrev1Constants.md#s-CombiningChar) from XPathAbrev1Constants
- [curChar](#s-curChar)
- [curLexState](#s-curLexState)
- [debugStream](#s-debugStream)
- [DEFAULT](XPathAbrev1Constants.md#s-DEFAULT) from XPathAbrev1Constants
- [defaultLexState](#s-defaultLexState)
- [Digit](XPathAbrev1Constants.md#s-Digit) from XPathAbrev1Constants
- [EOF](XPathAbrev1Constants.md#s-EOF) from XPathAbrev1Constants
- [EQ](XPathAbrev1Constants.md#s-EQ) from XPathAbrev1Constants
- [Extender](XPathAbrev1Constants.md#s-Extender) from XPathAbrev1Constants
- [FUNCTION_CURRENT](XPathAbrev1Constants.md#s-FUNCTION_CURRENT) from XPathAbrev1Constants
- [Ideographic](XPathAbrev1Constants.md#s-Ideographic) from XPathAbrev1Constants
- [input_stream](#s-input_stream)
- [jjbitVec0](#s-jjbitVec0)
- [jjbitVec10](#s-jjbitVec10)
- [jjbitVec11](#s-jjbitVec11)
- [jjbitVec12](#s-jjbitVec12)
- [jjbitVec13](#s-jjbitVec13)
- [jjbitVec14](#s-jjbitVec14)
- [jjbitVec15](#s-jjbitVec15)
- [jjbitVec16](#s-jjbitVec16)
- [jjbitVec17](#s-jjbitVec17)
- [jjbitVec18](#s-jjbitVec18)
- [jjbitVec19](#s-jjbitVec19)
- [jjbitVec2](#s-jjbitVec2)
- [jjbitVec20](#s-jjbitVec20)
- [jjbitVec21](#s-jjbitVec21)
- [jjbitVec22](#s-jjbitVec22)
- [jjbitVec23](#s-jjbitVec23)
- [jjbitVec24](#s-jjbitVec24)
- [jjbitVec25](#s-jjbitVec25)
- [jjbitVec26](#s-jjbitVec26)
- [jjbitVec27](#s-jjbitVec27)
- [jjbitVec28](#s-jjbitVec28)
- [jjbitVec29](#s-jjbitVec29)
- [jjbitVec3](#s-jjbitVec3)
- [jjbitVec30](#s-jjbitVec30)
- [jjbitVec31](#s-jjbitVec31)
- [jjbitVec32](#s-jjbitVec32)
- [jjbitVec33](#s-jjbitVec33)
- [jjbitVec34](#s-jjbitVec34)
- [jjbitVec35](#s-jjbitVec35)
- [jjbitVec36](#s-jjbitVec36)
- [jjbitVec37](#s-jjbitVec37)
- [jjbitVec38](#s-jjbitVec38)
- [jjbitVec39](#s-jjbitVec39)
- [jjbitVec4](#s-jjbitVec4)
- [jjbitVec40](#s-jjbitVec40)
- [jjbitVec41](#s-jjbitVec41)
- [jjbitVec5](#s-jjbitVec5)
- [jjbitVec6](#s-jjbitVec6)
- [jjbitVec7](#s-jjbitVec7)
- [jjbitVec8](#s-jjbitVec8)
- [jjbitVec9](#s-jjbitVec9)
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
- [Letter](XPathAbrev1Constants.md#s-Letter) from XPathAbrev1Constants
- [lexStateNames](#s-lexStateNames)
- [Literal](XPathAbrev1Constants.md#s-Literal) from XPathAbrev1Constants
- [NCName](XPathAbrev1Constants.md#s-NCName) from XPathAbrev1Constants
- [Number](XPathAbrev1Constants.md#s-Number) from XPathAbrev1Constants
- [SLASH](XPathAbrev1Constants.md#s-SLASH) from XPathAbrev1Constants
- [tokenImage](XPathAbrev1Constants.md#s-tokenImage) from XPathAbrev1Constants
- [UnicodeDigit](XPathAbrev1Constants.md#s-UnicodeDigit) from XPathAbrev1Constants

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

<a id="s-XPathAbrev1TokenManager-1"></a>
### XPathAbrev1TokenManager(JavaCharStream)

```java
public XPathAbrev1TokenManager(com.tailf.conf.gen2.JavaCharStream stream)
```

Types: [JavaCharStream](JavaCharStream.md#s-JavaCharStream)

Constructor.

**Parameters**

- `com.tailf.conf.gen2.JavaCharStream stream`

<a id="s-XPathAbrev1TokenManager-2"></a>
### XPathAbrev1TokenManager(JavaCharStream, int)

```java
public XPathAbrev1TokenManager(com.tailf.conf.gen2.JavaCharStream stream, int lexState)
```

Types: [JavaCharStream](JavaCharStream.md#s-JavaCharStream)

Constructor.

**Parameters**

- `com.tailf.conf.gen2.JavaCharStream stream`
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
protected com.tailf.conf.gen2.JavaCharStream input_stream = null;
```

Types: [JavaCharStream](JavaCharStream.md#s-JavaCharStream)

<a id="s-jjbitVec0"></a>
### jjbitVec0

**Package-private**

```java
static final long[] jjbitVec0 = null;
```

<a id="s-jjbitVec10"></a>
### jjbitVec10

**Package-private**

```java
static final long[] jjbitVec10 = null;
```

<a id="s-jjbitVec11"></a>
### jjbitVec11

**Package-private**

```java
static final long[] jjbitVec11 = null;
```

<a id="s-jjbitVec12"></a>
### jjbitVec12

**Package-private**

```java
static final long[] jjbitVec12 = null;
```

<a id="s-jjbitVec13"></a>
### jjbitVec13

**Package-private**

```java
static final long[] jjbitVec13 = null;
```

<a id="s-jjbitVec14"></a>
### jjbitVec14

**Package-private**

```java
static final long[] jjbitVec14 = null;
```

<a id="s-jjbitVec15"></a>
### jjbitVec15

**Package-private**

```java
static final long[] jjbitVec15 = null;
```

<a id="s-jjbitVec16"></a>
### jjbitVec16

**Package-private**

```java
static final long[] jjbitVec16 = null;
```

<a id="s-jjbitVec17"></a>
### jjbitVec17

**Package-private**

```java
static final long[] jjbitVec17 = null;
```

<a id="s-jjbitVec18"></a>
### jjbitVec18

**Package-private**

```java
static final long[] jjbitVec18 = null;
```

<a id="s-jjbitVec19"></a>
### jjbitVec19

**Package-private**

```java
static final long[] jjbitVec19 = null;
```

<a id="s-jjbitVec2"></a>
### jjbitVec2

**Package-private**

```java
static final long[] jjbitVec2 = null;
```

<a id="s-jjbitVec20"></a>
### jjbitVec20

**Package-private**

```java
static final long[] jjbitVec20 = null;
```

<a id="s-jjbitVec21"></a>
### jjbitVec21

**Package-private**

```java
static final long[] jjbitVec21 = null;
```

<a id="s-jjbitVec22"></a>
### jjbitVec22

**Package-private**

```java
static final long[] jjbitVec22 = null;
```

<a id="s-jjbitVec23"></a>
### jjbitVec23

**Package-private**

```java
static final long[] jjbitVec23 = null;
```

<a id="s-jjbitVec24"></a>
### jjbitVec24

**Package-private**

```java
static final long[] jjbitVec24 = null;
```

<a id="s-jjbitVec25"></a>
### jjbitVec25

**Package-private**

```java
static final long[] jjbitVec25 = null;
```

<a id="s-jjbitVec26"></a>
### jjbitVec26

**Package-private**

```java
static final long[] jjbitVec26 = null;
```

<a id="s-jjbitVec27"></a>
### jjbitVec27

**Package-private**

```java
static final long[] jjbitVec27 = null;
```

<a id="s-jjbitVec28"></a>
### jjbitVec28

**Package-private**

```java
static final long[] jjbitVec28 = null;
```

<a id="s-jjbitVec29"></a>
### jjbitVec29

**Package-private**

```java
static final long[] jjbitVec29 = null;
```

<a id="s-jjbitVec3"></a>
### jjbitVec3

**Package-private**

```java
static final long[] jjbitVec3 = null;
```

<a id="s-jjbitVec30"></a>
### jjbitVec30

**Package-private**

```java
static final long[] jjbitVec30 = null;
```

<a id="s-jjbitVec31"></a>
### jjbitVec31

**Package-private**

```java
static final long[] jjbitVec31 = null;
```

<a id="s-jjbitVec32"></a>
### jjbitVec32

**Package-private**

```java
static final long[] jjbitVec32 = null;
```

<a id="s-jjbitVec33"></a>
### jjbitVec33

**Package-private**

```java
static final long[] jjbitVec33 = null;
```

<a id="s-jjbitVec34"></a>
### jjbitVec34

**Package-private**

```java
static final long[] jjbitVec34 = null;
```

<a id="s-jjbitVec35"></a>
### jjbitVec35

**Package-private**

```java
static final long[] jjbitVec35 = null;
```

<a id="s-jjbitVec36"></a>
### jjbitVec36

**Package-private**

```java
static final long[] jjbitVec36 = null;
```

<a id="s-jjbitVec37"></a>
### jjbitVec37

**Package-private**

```java
static final long[] jjbitVec37 = null;
```

<a id="s-jjbitVec38"></a>
### jjbitVec38

**Package-private**

```java
static final long[] jjbitVec38 = null;
```

<a id="s-jjbitVec39"></a>
### jjbitVec39

**Package-private**

```java
static final long[] jjbitVec39 = null;
```

<a id="s-jjbitVec4"></a>
### jjbitVec4

**Package-private**

```java
static final long[] jjbitVec4 = null;
```

<a id="s-jjbitVec40"></a>
### jjbitVec40

**Package-private**

```java
static final long[] jjbitVec40 = null;
```

<a id="s-jjbitVec41"></a>
### jjbitVec41

**Package-private**

```java
static final long[] jjbitVec41 = null;
```

<a id="s-jjbitVec5"></a>
### jjbitVec5

**Package-private**

```java
static final long[] jjbitVec5 = null;
```

<a id="s-jjbitVec6"></a>
### jjbitVec6

**Package-private**

```java
static final long[] jjbitVec6 = null;
```

<a id="s-jjbitVec7"></a>
### jjbitVec7

**Package-private**

```java
static final long[] jjbitVec7 = null;
```

<a id="s-jjbitVec8"></a>
### jjbitVec8

**Package-private**

```java
static final long[] jjbitVec8 = null;
```

<a id="s-jjbitVec9"></a>
### jjbitVec9

**Package-private**

```java
static final long[] jjbitVec9 = null;
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
public com.tailf.conf.gen2.Token getNextToken()
```

Types: [Token](Token.md#s-Token)

Get the next Token.

<a id="s-jjFillToken"></a>
### jjFillToken()

```java
protected com.tailf.conf.gen2.Token jjFillToken()
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
public void ReInit(com.tailf.conf.gen2.JavaCharStream stream)
```

Types: [JavaCharStream](JavaCharStream.md#s-JavaCharStream)

Reinitialise parser.

**Parameters**

- `com.tailf.conf.gen2.JavaCharStream stream`

<a id="s-ReInit-1"></a>
### ReInit(JavaCharStream, int)

```java
public void ReInit(com.tailf.conf.gen2.JavaCharStream stream, int lexState)
```

Types: [JavaCharStream](JavaCharStream.md#s-JavaCharStream)

Reinitialise parser.

**Parameters**

- `com.tailf.conf.gen2.JavaCharStream stream`
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
void SkipLexicalActions(com.tailf.conf.gen2.Token matchedToken)
```

Types: [Token](Token.md#s-Token)

**Parameters**

- `com.tailf.conf.gen2.Token matchedToken`

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
void TokenLexicalActions(com.tailf.conf.gen2.Token matchedToken)
```

Types: [Token](Token.md#s-Token)

**Parameters**

- `com.tailf.conf.gen2.Token matchedToken`
