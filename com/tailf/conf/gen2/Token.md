# Token <a href="#token-b7a155cc1a5e" id="token-b7a155cc1a5e"></a>

**Package-private**

```java
class com.tailf.conf.gen2.Token
    implements java.io.Serializable
```

Describes the input token stream.

## Members

**Constructors**:

- [Token\(\)](#token-ad1ba4434bc6)
- [Token\(int\)](#token-9b190fa6121c)
- [Token\(int, String\)](#token-096b06e2c2ae)

**Fields**:

- [beginColumn](#begincolumn-56b00cef8c42)
- [beginLine](#beginline-2657c0698892)
- [endColumn](#endcolumn-860edf8434cc)
- [endLine](#endline-65e4aad4b1b0)
- [image](#image-9507963a0a99)
- [kind](#kind-71806e3b577f)
- [next](#next-1a37cdd4ba4b)
- [specialToken](#specialtoken-2b843b59f7ee)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [newToken\(int\)](#newtoken-17fd3841532d)
- [newToken\(int, String\)](#newtoken-d7f9b13e20a7)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### Token() <a href="#token-ad1ba4434bc6" id="token-ad1ba4434bc6"></a>

```java
public Token()
```

No-argument constructor

### Token(int) <a href="#token-9b190fa6121c" id="token-9b190fa6121c"></a>

```java
public Token(int kind)
```

Constructs a new token for the specified Image.

**Parameters**

- `int kind`

### Token(int, String) <a href="#token-096b06e2c2ae" id="token-096b06e2c2ae"></a>

```java
public Token(int kind, String image)
```

Constructs a new token for the specified Image and Kind.

**Parameters**

- `int kind`
- `String image`


## Fields

### beginColumn <a href="#begincolumn-56b00cef8c42" id="begincolumn-56b00cef8c42"></a>

```java
public int beginColumn = null;
```

The column number of the first character of this Token.

### beginLine <a href="#beginline-2657c0698892" id="beginline-2657c0698892"></a>

```java
public int beginLine = null;
```

The line number of the first character of this Token.

### endColumn <a href="#endcolumn-860edf8434cc" id="endcolumn-860edf8434cc"></a>

```java
public int endColumn = null;
```

The column number of the last character of this Token.

### endLine <a href="#endline-65e4aad4b1b0" id="endline-65e4aad4b1b0"></a>

```java
public int endLine = null;
```

The line number of the last character of this Token.

### image <a href="#image-9507963a0a99" id="image-9507963a0a99"></a>

```java
public String image = null;
```

The string image of the token.

### kind <a href="#kind-71806e3b577f" id="kind-71806e3b577f"></a>

```java
public int kind = null;
```

An integer that describes the kind of this token.  This numbering
 system is determined by JavaCCParser, and a table of these numbers is
 stored in the file ...Constants.java.

### next <a href="#next-1a37cdd4ba4b" id="next-1a37cdd4ba4b"></a>

```java
public com.tailf.conf.gen2.Token next = null;
```

Types: [Token](Token.md#token-b7a155cc1a5e)

A reference to the next regular (non-special) token from the input
 stream.  If this is the last token from the input stream, or if the
 token manager has not read tokens beyond this one, this field is
 set to null.  This is true only if this token is also a regular
 token.  Otherwise, see below for a description of the contents of
 this field.

### specialToken <a href="#specialtoken-2b843b59f7ee" id="specialtoken-2b843b59f7ee"></a>

```java
public com.tailf.conf.gen2.Token specialToken = null;
```

Types: [Token](Token.md#token-b7a155cc1a5e)

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

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public Object getValue()
```

An optional attribute value of the Token.
 Tokens which are not used as syntactic sugar will often contain
 meaningful values that will be used later on by the compiler or
 interpreter. This attribute value is often different from the image.
 Any subclass of Token that actually wants to return a non-null value can
 override this method as appropriate.

### newToken(int) <a href="#newtoken-17fd3841532d" id="newtoken-17fd3841532d"></a>

```java
public static com.tailf.conf.gen2.Token newToken(int ofKind)
```

Types: [Token](Token.md#token-b7a155cc1a5e)

**Parameters**

- `int ofKind`

### newToken(int, String) <a href="#newtoken-d7f9b13e20a7" id="newtoken-d7f9b13e20a7"></a>

```java
public static com.tailf.conf.gen2.Token newToken(int ofKind, String image)
```

Types: [Token](Token.md#token-b7a155cc1a5e)

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

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Returns the image.
