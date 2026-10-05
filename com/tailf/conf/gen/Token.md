# Token <a href="#cls-Token" id="cls-Token"></a>

**Package-private**

```java
class com.tailf.conf.gen.Token
    implements java.io.Serializable
```

Describes the input token stream.

## Members

**Constructors**:

- [Token()](#m-Token-ad1ba4434bc6)
- [Token(int)](#m-Token-9b190fa6121c)
- [Token(int, String)](#m-Token-096b06e2c2ae)

**Fields**:

- [beginColumn](#m-beginColumn)
- [beginLine](#m-beginLine)
- [endColumn](#m-endColumn)
- [endLine](#m-endLine)
- [image](#m-image)
- [kind](#m-kind)
- [next](#m-next)
- [specialToken](#m-specialToken)

**Methods**:

- [getValue()](#m-getValue-d93864668c40)
- [newToken(int)](#m-newToken-17fd3841532d)
- [newToken(int, String)](#m-newToken-d7f9b13e20a7)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### Token() <a href="#m-Token-ad1ba4434bc6" id="m-Token-ad1ba4434bc6"></a>

```java
public Token()
```

No-argument constructor

### Token(int) <a href="#m-Token-9b190fa6121c" id="m-Token-9b190fa6121c"></a>

```java
public Token(int kind)
```

Constructs a new token for the specified Image.

**Parameters**

- `int kind`

### Token(int, String) <a href="#m-Token-096b06e2c2ae" id="m-Token-096b06e2c2ae"></a>

```java
public Token(int kind, String image)
```

Constructs a new token for the specified Image and Kind.

**Parameters**

- `int kind`
- `String image`


## Fields

### beginColumn <a href="#m-beginColumn" id="m-beginColumn"></a>

```java
public int beginColumn = null;
```

The column number of the first character of this Token.

### beginLine <a href="#m-beginLine" id="m-beginLine"></a>

```java
public int beginLine = null;
```

The line number of the first character of this Token.

### endColumn <a href="#m-endColumn" id="m-endColumn"></a>

```java
public int endColumn = null;
```

The column number of the last character of this Token.

### endLine <a href="#m-endLine" id="m-endLine"></a>

```java
public int endLine = null;
```

The line number of the last character of this Token.

### image <a href="#m-image" id="m-image"></a>

```java
public String image = null;
```

The string image of the token.

### kind <a href="#m-kind" id="m-kind"></a>

```java
public int kind = null;
```

An integer that describes the kind of this token.  This numbering
 system is determined by JavaCCParser, and a table of these numbers is
 stored in the file ...Constants.java.

### next <a href="#m-next" id="m-next"></a>

```java
public com.tailf.conf.gen.Token next = null;
```

Types: [Token](Token.md#cls-Token)

A reference to the next regular (non-special) token from the input
 stream.  If this is the last token from the input stream, or if the
 token manager has not read tokens beyond this one, this field is
 set to null.  This is true only if this token is also a regular
 token.  Otherwise, see below for a description of the contents of
 this field.

### specialToken <a href="#m-specialToken" id="m-specialToken"></a>

```java
public com.tailf.conf.gen.Token specialToken = null;
```

Types: [Token](Token.md#cls-Token)

This field is used to access special tokens that occur prior to this
 token, but after the immediately preceding regular (non-special) token.
 If there are no such special tokens, this field is set to null.
 When there are more than one such special token, this field refers
 to the last of these special tokens, which in turn refers to the next
 previous special token through its specialToken field, and so on
 until the first special token (whose specialToken field is null).
 The next fields of special tokens refer to other special tokens that
 immediately follow it (without an intervening regular token).  If there
 is no such token, this field is null.


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public Object getValue()
```

An optional attribute value of the Token.
 Tokens which are not used as syntactic sugar will often contain
 meaningful values that will be used later on by the compiler or
 interpreter. This attribute value is often different from the image.
 Any subclass of Token that actually wants to return a non-null value can
 override this method as appropriate.

### newToken(int) <a href="#m-newToken-17fd3841532d" id="m-newToken-17fd3841532d"></a>

```java
public static com.tailf.conf.gen.Token newToken(int ofKind)
```

Types: [Token](Token.md#cls-Token)

**Parameters**

- `int ofKind`

### newToken(int, String) <a href="#m-newToken-d7f9b13e20a7" id="m-newToken-d7f9b13e20a7"></a>

```java
public static com.tailf.conf.gen.Token newToken(int ofKind, String image)
```

Types: [Token](Token.md#cls-Token)

Returns a new Token object, by default. However, if you want, you
 can create and return subclass objects based on the value of ofKind.
 Simply add the cases to the switch for all those special cases.
 For example, if you have a subclass of Token called IDToken that
 you want to create if ofKind is ID, simply add something like :

    case MyParserConstants.ID : return new IDToken(ofKind, image);

 to the following switch statement. Then you can cast matchedToken
 variable to the appropriate type and use sit in your lexical actions.

**Parameters**

- `int ofKind`
- `String image`

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Returns the image.
