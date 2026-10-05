<a id="s-Token"></a>
# Token

**Package-private**

```java
class com.tailf.conf.gen.Token
    implements java.io.Serializable
```

Describes the input token stream.

## Members

**Constructors**:

- [Token()](#s-Token-1)
- [Token(int)](#s-Token-2)
- [Token(int, String)](#s-Token-3)

**Fields**:

- [beginColumn](#s-beginColumn)
- [beginLine](#s-beginLine)
- [endColumn](#s-endColumn)
- [endLine](#s-endLine)
- [image](#s-image)
- [kind](#s-kind)
- [next](#s-next)
- [specialToken](#s-specialToken)

**Methods**:

- [getValue()](#s-getValue)
- [newToken(int)](#s-newToken)
- [newToken(int, String)](#s-newToken-1)
- [toString()](#s-toString)

## Constructors

<a id="s-Token-1"></a>
### Token()

```java
public Token()
```

No-argument constructor

<a id="s-Token-2"></a>
### Token(int)

```java
public Token(int kind)
```

Constructs a new token for the specified Image.

**Parameters**

- `int kind`

<a id="s-Token-3"></a>
### Token(int, String)

```java
public Token(int kind, String image)
```

Constructs a new token for the specified Image and Kind.

**Parameters**

- `int kind`
- `String image`


## Fields

<a id="s-beginColumn"></a>
### beginColumn

```java
public int beginColumn = null;
```

The column number of the first character of this Token.

<a id="s-beginLine"></a>
### beginLine

```java
public int beginLine = null;
```

The line number of the first character of this Token.

<a id="s-endColumn"></a>
### endColumn

```java
public int endColumn = null;
```

The column number of the last character of this Token.

<a id="s-endLine"></a>
### endLine

```java
public int endLine = null;
```

The line number of the last character of this Token.

<a id="s-image"></a>
### image

```java
public String image = null;
```

The string image of the token.

<a id="s-kind"></a>
### kind

```java
public int kind = null;
```

An integer that describes the kind of this token.  This numbering
 system is determined by JavaCCParser, and a table of these numbers is
 stored in the file ...Constants.java.

<a id="s-next"></a>
### next

```java
public com.tailf.conf.gen.Token next = null;
```

Types: [Token](Token.md#s-Token)

A reference to the next regular (non-special) token from the input
 stream.  If this is the last token from the input stream, or if the
 token manager has not read tokens beyond this one, this field is
 set to null.  This is true only if this token is also a regular
 token.  Otherwise, see below for a description of the contents of
 this field.

<a id="s-specialToken"></a>
### specialToken

```java
public com.tailf.conf.gen.Token specialToken = null;
```

Types: [Token](Token.md#s-Token)

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

<a id="s-getValue"></a>
### getValue()

```java
public Object getValue()
```

An optional attribute value of the Token.
 Tokens which are not used as syntactic sugar will often contain
 meaningful values that will be used later on by the compiler or
 interpreter. This attribute value is often different from the image.
 Any subclass of Token that actually wants to return a non-null value can
 override this method as appropriate.

<a id="s-newToken"></a>
### newToken(int)

```java
public static com.tailf.conf.gen.Token newToken(int ofKind)
```

Types: [Token](Token.md#s-Token)

**Parameters**

- `int ofKind`

<a id="s-newToken-1"></a>
### newToken(int, String)

```java
public static com.tailf.conf.gen.Token newToken(int ofKind, String image)
```

Types: [Token](Token.md#s-Token)

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

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Returns the image.
