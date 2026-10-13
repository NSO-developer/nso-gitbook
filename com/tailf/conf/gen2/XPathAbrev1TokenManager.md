# XPathAbrev1TokenManager <a href="#xpathabrev1tokenmanager-d8148d2f4051" id="xpathabrev1tokenmanager-d8148d2f4051"></a>

**Package-private**

```java
@SuppressWarnings({"unused"})
class com.tailf.conf.gen2.XPathAbrev1TokenManager
    implements com.tailf.conf.gen2.XPathAbrev1Constants
```

Types: [XPathAbrev1Constants](XPathAbrev1Constants.md#xpathabrev1constants-bdd3adcbaea7)

Token Manager.

## Members

**Constructors**:

- [XPathAbrev1TokenManager\(JavaCharStream\)](#xpathabrev1tokenmanager-9d591d3f2da9)
- [XPathAbrev1TokenManager\(JavaCharStream, int\)](#xpathabrev1tokenmanager-77d0e278c64e)

**Fields**:

- [AXIS\_ANCESTOR](XPathAbrev1Constants.md#axis_ancestor-62c59dd9b2e3) from XPathAbrev1Constants
- [AXIS\_ANCESTOR\_OR\_SELF](XPathAbrev1Constants.md#axis_ancestor_or_self-8a86e8f77b65) from XPathAbrev1Constants
- [AXIS\_ATTRIBUTE](XPathAbrev1Constants.md#axis_attribute-a05946445c05) from XPathAbrev1Constants
- [AXIS\_CHILD](XPathAbrev1Constants.md#axis_child-b30db2353719) from XPathAbrev1Constants
- [AXIS\_DESCENDANT](XPathAbrev1Constants.md#axis_descendant-15e7b43dd049) from XPathAbrev1Constants
- [AXIS\_DESCENDANT\_OR\_SELF](XPathAbrev1Constants.md#axis_descendant_or_self-9f6c29a66ab9) from XPathAbrev1Constants
- [AXIS\_FOLLOWING](XPathAbrev1Constants.md#axis_following-a1c4549e0b7e) from XPathAbrev1Constants
- [AXIS\_FOLLOWING\_SIBLING](XPathAbrev1Constants.md#axis_following_sibling-15c026a27921) from XPathAbrev1Constants
- [AXIS\_NAMESPACE](XPathAbrev1Constants.md#axis_namespace-fca116cb0837) from XPathAbrev1Constants
- [AXIS\_PARENT](XPathAbrev1Constants.md#axis_parent-a46c866285ba) from XPathAbrev1Constants
- [AXIS\_PRECEDING](XPathAbrev1Constants.md#axis_preceding-928fdaa9975d) from XPathAbrev1Constants
- [AXIS\_PRECEDING\_SIBLING](XPathAbrev1Constants.md#axis_preceding_sibling-d98b9bd3ec33) from XPathAbrev1Constants
- [AXIS\_SELF](XPathAbrev1Constants.md#axis_self-e8df13365b56) from XPathAbrev1Constants
- [BaseChar](XPathAbrev1Constants.md#basechar-40e1261471a6) from XPathAbrev1Constants
- [CombiningChar](XPathAbrev1Constants.md#combiningchar-04353df29e46) from XPathAbrev1Constants
- [curChar](#curchar-3e995b252b00)
- [curLexState](#curlexstate-28d5fb803bd1)
- [debugStream](#debugstream-9ee581db3e1f)
- [DEFAULT](XPathAbrev1Constants.md#default-5965fc85722b) from XPathAbrev1Constants
- [defaultLexState](#defaultlexstate-d63dd26271ca)
- [Digit](XPathAbrev1Constants.md#digit-d562fa9fa27a) from XPathAbrev1Constants
- [EOF](XPathAbrev1Constants.md#eof-e4ab74e8c3eb) from XPathAbrev1Constants
- [EQ](XPathAbrev1Constants.md#eq-27379a35bac0) from XPathAbrev1Constants
- [Extender](XPathAbrev1Constants.md#extender-16833fdff759) from XPathAbrev1Constants
- [FUNCTION\_CURRENT](XPathAbrev1Constants.md#function_current-756d70c6837c) from XPathAbrev1Constants
- [Ideographic](XPathAbrev1Constants.md#ideographic-9e9a508c5c4b) from XPathAbrev1Constants
- [input\_stream](#input_stream-2a4833575cfa)
- [jjbitVec0](#jjbitvec0-7cc00549bd7f)
- [jjbitVec10](#jjbitvec10-5873bcaf2305)
- [jjbitVec11](#jjbitvec11-239c699d39a0)
- [jjbitVec12](#jjbitvec12-e75b4f1f4759)
- [jjbitVec13](#jjbitvec13-a74a99c28f5b)
- [jjbitVec14](#jjbitvec14-7ae92695215e)
- [jjbitVec15](#jjbitvec15-5dede9f0b3b3)
- [jjbitVec16](#jjbitvec16-63f2f5107767)
- [jjbitVec17](#jjbitvec17-ae2b7fde1aeb)
- [jjbitVec18](#jjbitvec18-ba5792c035db)
- [jjbitVec19](#jjbitvec19-f08f47adcf2d)
- [jjbitVec2](#jjbitvec2-3e0977c072b2)
- [jjbitVec20](#jjbitvec20-388f39eaf4fe)
- [jjbitVec21](#jjbitvec21-fd4a2af839bf)
- [jjbitVec22](#jjbitvec22-0af006b5acf7)
- [jjbitVec23](#jjbitvec23-4fb70833870e)
- [jjbitVec24](#jjbitvec24-1f1a0f9158a7)
- [jjbitVec25](#jjbitvec25-fb54aa49e581)
- [jjbitVec26](#jjbitvec26-bfa680b345e8)
- [jjbitVec27](#jjbitvec27-38a0e2220abc)
- [jjbitVec28](#jjbitvec28-2c1314c7696b)
- [jjbitVec29](#jjbitvec29-1851415cffd5)
- [jjbitVec3](#jjbitvec3-47f010fce42b)
- [jjbitVec30](#jjbitvec30-4fbef0a07226)
- [jjbitVec31](#jjbitvec31-bd25d5bfb022)
- [jjbitVec32](#jjbitvec32-2a29e98d94fb)
- [jjbitVec33](#jjbitvec33-19f8df7b86b0)
- [jjbitVec34](#jjbitvec34-0879404b9efc)
- [jjbitVec35](#jjbitvec35-816d74f73647)
- [jjbitVec36](#jjbitvec36-b3f7ecd44c11)
- [jjbitVec37](#jjbitvec37-7c1276fc1d5e)
- [jjbitVec38](#jjbitvec38-9378da481292)
- [jjbitVec39](#jjbitvec39-d5819859a14b)
- [jjbitVec4](#jjbitvec4-a3d22b891aed)
- [jjbitVec40](#jjbitvec40-3b4c6d3bdb3d)
- [jjbitVec41](#jjbitvec41-01b924fed7e8)
- [jjbitVec5](#jjbitvec5-48499b1b4798)
- [jjbitVec6](#jjbitvec6-f800ecdeb61c)
- [jjbitVec7](#jjbitvec7-abf77c716a0f)
- [jjbitVec8](#jjbitvec8-cca1b2293022)
- [jjbitVec9](#jjbitvec9-4106fd066991)
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
- [Letter](XPathAbrev1Constants.md#letter-b7da983a0a77) from XPathAbrev1Constants
- [lexStateNames](#lexstatenames-5ae9c2c4b657)
- [Literal](XPathAbrev1Constants.md#literal-d5804337bb25) from XPathAbrev1Constants
- [NCName](XPathAbrev1Constants.md#ncname-61cf3f5186ac) from XPathAbrev1Constants
- [Number](XPathAbrev1Constants.md#number-d1bd19560532) from XPathAbrev1Constants
- [SLASH](XPathAbrev1Constants.md#slash-3c7d823f3e28) from XPathAbrev1Constants
- [tokenImage](XPathAbrev1Constants.md#tokenimage-c13f534d4471) from XPathAbrev1Constants
- [UnicodeDigit](XPathAbrev1Constants.md#unicodedigit-85441abdb275) from XPathAbrev1Constants

**Methods**:

- [getNextToken\(\)](#getnexttoken-dc921ada5024)
- [jjFillToken\(\)](#jjfilltoken-65cab186126c)
- [MoreLexicalActions\(\)](#morelexicalactions-949853b6331d)
- [ReInit\(JavaCharStream\)](#reinit-aea274b20650)
- [ReInit\(JavaCharStream, int\)](#reinit-162412793959)
- [setDebugStream\(PrintStream\)](#setdebugstream-b3ded1375b4f)
- [SkipLexicalActions\(Token\)](#skiplexicalactions-0975b69b0591)
- [SwitchTo\(int\)](#switchto-11e96339668c)
- [TokenLexicalActions\(Token\)](#tokenlexicalactions-16d53417ba92)

## Constructors

### XPathAbrev1TokenManager(JavaCharStream) <a href="#xpathabrev1tokenmanager-9d591d3f2da9" id="xpathabrev1tokenmanager-9d591d3f2da9"></a>

```java
public XPathAbrev1TokenManager(com.tailf.conf.gen2.JavaCharStream stream)
```

Types: [JavaCharStream](JavaCharStream.md#javacharstream-b90e6870657d)

Constructor.

**Parameters**

- `com.tailf.conf.gen2.JavaCharStream stream`

### XPathAbrev1TokenManager(JavaCharStream, int) <a href="#xpathabrev1tokenmanager-77d0e278c64e" id="xpathabrev1tokenmanager-77d0e278c64e"></a>

```java
public XPathAbrev1TokenManager(com.tailf.conf.gen2.JavaCharStream stream, int lexState)
```

Types: [JavaCharStream](JavaCharStream.md#javacharstream-b90e6870657d)

Constructor.

**Parameters**

- `com.tailf.conf.gen2.JavaCharStream stream`
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
protected com.tailf.conf.gen2.JavaCharStream input_stream = null;
```

Types: [JavaCharStream](JavaCharStream.md#javacharstream-b90e6870657d)

### jjbitVec0 <a href="#jjbitvec0-7cc00549bd7f" id="jjbitvec0-7cc00549bd7f"></a>

**Package-private**

```java
static final long[] jjbitVec0 = null;
```

### jjbitVec10 <a href="#jjbitvec10-5873bcaf2305" id="jjbitvec10-5873bcaf2305"></a>

**Package-private**

```java
static final long[] jjbitVec10 = null;
```

### jjbitVec11 <a href="#jjbitvec11-239c699d39a0" id="jjbitvec11-239c699d39a0"></a>

**Package-private**

```java
static final long[] jjbitVec11 = null;
```

### jjbitVec12 <a href="#jjbitvec12-e75b4f1f4759" id="jjbitvec12-e75b4f1f4759"></a>

**Package-private**

```java
static final long[] jjbitVec12 = null;
```

### jjbitVec13 <a href="#jjbitvec13-a74a99c28f5b" id="jjbitvec13-a74a99c28f5b"></a>

**Package-private**

```java
static final long[] jjbitVec13 = null;
```

### jjbitVec14 <a href="#jjbitvec14-7ae92695215e" id="jjbitvec14-7ae92695215e"></a>

**Package-private**

```java
static final long[] jjbitVec14 = null;
```

### jjbitVec15 <a href="#jjbitvec15-5dede9f0b3b3" id="jjbitvec15-5dede9f0b3b3"></a>

**Package-private**

```java
static final long[] jjbitVec15 = null;
```

### jjbitVec16 <a href="#jjbitvec16-63f2f5107767" id="jjbitvec16-63f2f5107767"></a>

**Package-private**

```java
static final long[] jjbitVec16 = null;
```

### jjbitVec17 <a href="#jjbitvec17-ae2b7fde1aeb" id="jjbitvec17-ae2b7fde1aeb"></a>

**Package-private**

```java
static final long[] jjbitVec17 = null;
```

### jjbitVec18 <a href="#jjbitvec18-ba5792c035db" id="jjbitvec18-ba5792c035db"></a>

**Package-private**

```java
static final long[] jjbitVec18 = null;
```

### jjbitVec19 <a href="#jjbitvec19-f08f47adcf2d" id="jjbitvec19-f08f47adcf2d"></a>

**Package-private**

```java
static final long[] jjbitVec19 = null;
```

### jjbitVec2 <a href="#jjbitvec2-3e0977c072b2" id="jjbitvec2-3e0977c072b2"></a>

**Package-private**

```java
static final long[] jjbitVec2 = null;
```

### jjbitVec20 <a href="#jjbitvec20-388f39eaf4fe" id="jjbitvec20-388f39eaf4fe"></a>

**Package-private**

```java
static final long[] jjbitVec20 = null;
```

### jjbitVec21 <a href="#jjbitvec21-fd4a2af839bf" id="jjbitvec21-fd4a2af839bf"></a>

**Package-private**

```java
static final long[] jjbitVec21 = null;
```

### jjbitVec22 <a href="#jjbitvec22-0af006b5acf7" id="jjbitvec22-0af006b5acf7"></a>

**Package-private**

```java
static final long[] jjbitVec22 = null;
```

### jjbitVec23 <a href="#jjbitvec23-4fb70833870e" id="jjbitvec23-4fb70833870e"></a>

**Package-private**

```java
static final long[] jjbitVec23 = null;
```

### jjbitVec24 <a href="#jjbitvec24-1f1a0f9158a7" id="jjbitvec24-1f1a0f9158a7"></a>

**Package-private**

```java
static final long[] jjbitVec24 = null;
```

### jjbitVec25 <a href="#jjbitvec25-fb54aa49e581" id="jjbitvec25-fb54aa49e581"></a>

**Package-private**

```java
static final long[] jjbitVec25 = null;
```

### jjbitVec26 <a href="#jjbitvec26-bfa680b345e8" id="jjbitvec26-bfa680b345e8"></a>

**Package-private**

```java
static final long[] jjbitVec26 = null;
```

### jjbitVec27 <a href="#jjbitvec27-38a0e2220abc" id="jjbitvec27-38a0e2220abc"></a>

**Package-private**

```java
static final long[] jjbitVec27 = null;
```

### jjbitVec28 <a href="#jjbitvec28-2c1314c7696b" id="jjbitvec28-2c1314c7696b"></a>

**Package-private**

```java
static final long[] jjbitVec28 = null;
```

### jjbitVec29 <a href="#jjbitvec29-1851415cffd5" id="jjbitvec29-1851415cffd5"></a>

**Package-private**

```java
static final long[] jjbitVec29 = null;
```

### jjbitVec3 <a href="#jjbitvec3-47f010fce42b" id="jjbitvec3-47f010fce42b"></a>

**Package-private**

```java
static final long[] jjbitVec3 = null;
```

### jjbitVec30 <a href="#jjbitvec30-4fbef0a07226" id="jjbitvec30-4fbef0a07226"></a>

**Package-private**

```java
static final long[] jjbitVec30 = null;
```

### jjbitVec31 <a href="#jjbitvec31-bd25d5bfb022" id="jjbitvec31-bd25d5bfb022"></a>

**Package-private**

```java
static final long[] jjbitVec31 = null;
```

### jjbitVec32 <a href="#jjbitvec32-2a29e98d94fb" id="jjbitvec32-2a29e98d94fb"></a>

**Package-private**

```java
static final long[] jjbitVec32 = null;
```

### jjbitVec33 <a href="#jjbitvec33-19f8df7b86b0" id="jjbitvec33-19f8df7b86b0"></a>

**Package-private**

```java
static final long[] jjbitVec33 = null;
```

### jjbitVec34 <a href="#jjbitvec34-0879404b9efc" id="jjbitvec34-0879404b9efc"></a>

**Package-private**

```java
static final long[] jjbitVec34 = null;
```

### jjbitVec35 <a href="#jjbitvec35-816d74f73647" id="jjbitvec35-816d74f73647"></a>

**Package-private**

```java
static final long[] jjbitVec35 = null;
```

### jjbitVec36 <a href="#jjbitvec36-b3f7ecd44c11" id="jjbitvec36-b3f7ecd44c11"></a>

**Package-private**

```java
static final long[] jjbitVec36 = null;
```

### jjbitVec37 <a href="#jjbitvec37-7c1276fc1d5e" id="jjbitvec37-7c1276fc1d5e"></a>

**Package-private**

```java
static final long[] jjbitVec37 = null;
```

### jjbitVec38 <a href="#jjbitvec38-9378da481292" id="jjbitvec38-9378da481292"></a>

**Package-private**

```java
static final long[] jjbitVec38 = null;
```

### jjbitVec39 <a href="#jjbitvec39-d5819859a14b" id="jjbitvec39-d5819859a14b"></a>

**Package-private**

```java
static final long[] jjbitVec39 = null;
```

### jjbitVec4 <a href="#jjbitvec4-a3d22b891aed" id="jjbitvec4-a3d22b891aed"></a>

**Package-private**

```java
static final long[] jjbitVec4 = null;
```

### jjbitVec40 <a href="#jjbitvec40-3b4c6d3bdb3d" id="jjbitvec40-3b4c6d3bdb3d"></a>

**Package-private**

```java
static final long[] jjbitVec40 = null;
```

### jjbitVec41 <a href="#jjbitvec41-01b924fed7e8" id="jjbitvec41-01b924fed7e8"></a>

**Package-private**

```java
static final long[] jjbitVec41 = null;
```

### jjbitVec5 <a href="#jjbitvec5-48499b1b4798" id="jjbitvec5-48499b1b4798"></a>

**Package-private**

```java
static final long[] jjbitVec5 = null;
```

### jjbitVec6 <a href="#jjbitvec6-f800ecdeb61c" id="jjbitvec6-f800ecdeb61c"></a>

**Package-private**

```java
static final long[] jjbitVec6 = null;
```

### jjbitVec7 <a href="#jjbitvec7-abf77c716a0f" id="jjbitvec7-abf77c716a0f"></a>

**Package-private**

```java
static final long[] jjbitVec7 = null;
```

### jjbitVec8 <a href="#jjbitvec8-cca1b2293022" id="jjbitvec8-cca1b2293022"></a>

**Package-private**

```java
static final long[] jjbitVec8 = null;
```

### jjbitVec9 <a href="#jjbitvec9-4106fd066991" id="jjbitvec9-4106fd066991"></a>

**Package-private**

```java
static final long[] jjbitVec9 = null;
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
public com.tailf.conf.gen2.Token getNextToken()
```

Types: [Token](Token.md#token-b7a155cc1a5e)

Get the next Token.

### jjFillToken() <a href="#jjfilltoken-65cab186126c" id="jjfilltoken-65cab186126c"></a>

```java
protected com.tailf.conf.gen2.Token jjFillToken()
```

Types: [Token](Token.md#token-b7a155cc1a5e)

### MoreLexicalActions() <a href="#morelexicalactions-949853b6331d" id="morelexicalactions-949853b6331d"></a>

**Package-private**

```java
void MoreLexicalActions()
```

### ReInit(JavaCharStream) <a href="#reinit-aea274b20650" id="reinit-aea274b20650"></a>

```java
public void ReInit(com.tailf.conf.gen2.JavaCharStream stream)
```

Types: [JavaCharStream](JavaCharStream.md#javacharstream-b90e6870657d)

Reinitialise parser.

**Parameters**

- `com.tailf.conf.gen2.JavaCharStream stream`

### ReInit(JavaCharStream, int) <a href="#reinit-162412793959" id="reinit-162412793959"></a>

```java
public void ReInit(com.tailf.conf.gen2.JavaCharStream stream, int lexState)
```

Types: [JavaCharStream](JavaCharStream.md#javacharstream-b90e6870657d)

Reinitialise parser.

**Parameters**

- `com.tailf.conf.gen2.JavaCharStream stream`
- `int lexState`

### setDebugStream(PrintStream) <a href="#setdebugstream-b3ded1375b4f" id="setdebugstream-b3ded1375b4f"></a>

```java
public void setDebugStream(java.io.PrintStream ds)
```

Set debug output.

**Parameters**

- `java.io.PrintStream ds`

### SkipLexicalActions(Token) <a href="#skiplexicalactions-0975b69b0591" id="skiplexicalactions-0975b69b0591"></a>

**Package-private**

```java
void SkipLexicalActions(com.tailf.conf.gen2.Token matchedToken)
```

Types: [Token](Token.md#token-b7a155cc1a5e)

**Parameters**

- `com.tailf.conf.gen2.Token matchedToken`

### SwitchTo(int) <a href="#switchto-11e96339668c" id="switchto-11e96339668c"></a>

```java
public void SwitchTo(int lexState)
```

Switch to specified lex state.

**Parameters**

- `int lexState`

### TokenLexicalActions(Token) <a href="#tokenlexicalactions-16d53417ba92" id="tokenlexicalactions-16d53417ba92"></a>

**Package-private**

```java
void TokenLexicalActions(com.tailf.conf.gen2.Token matchedToken)
```

Types: [Token](Token.md#token-b7a155cc1a5e)

**Parameters**

- `com.tailf.conf.gen2.Token matchedToken`
