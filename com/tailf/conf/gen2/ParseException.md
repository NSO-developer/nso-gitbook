<a id="cls-ParseException"></a>
# ParseException

```java
public class com.tailf.conf.gen2.ParseException
    extends Exception
```

This exception is thrown when parse errors are encountered.
 You can explicitly create objects of this exception type by
 calling the method generateParseException in the generated
 parser.

 You can modify this class to customize your error reporting
 mechanisms so long as you retain the public fields.

## Members

**Constructors**:

- [ParseException()](#m-parseexception-7765e2a79d08)
- [ParseException(String)](#m-parseexception-0700cc800bd9)
- [ParseException(Token, int[][], String[])](#m-parseexception-a33ceea68e14)

**Fields**:

- [currentToken](#m-currentToken)
- [EOL](#m-EOL)
- [expectedTokenSequences](#m-expectedTokenSequences)
- [tokenImage](#m-tokenImage)

**Methods**:

- [add_escapes(String)](#m-add_escapes-6d7387de134e)

## Constructors

<a id="m-parseexception-7765e2a79d08"></a>
### ParseException()

```java
public ParseException()
```

The following constructors are for use by you for whatever
 purpose you can think of.  Constructing the exception in this
 manner makes the exception behave in the normal way - i.e., as
 documented in the class "Throwable".  The fields "errorToken",
 "expectedTokenSequences", and "tokenImage" do not contain
 relevant information.  The JavaCC generated code does not use
 these constructors.

<a id="m-parseexception-0700cc800bd9"></a>
### ParseException(String)

```java
public ParseException(String message)
```

Constructor with message.

**Parameters**

- `String message`

<a id="m-parseexception-a33ceea68e14"></a>
### ParseException(Token, int[][], String[])

```java
public ParseException(
    com.tailf.conf.gen2.Token currentTokenVal,
    int[][] expectedTokenSequencesVal,
    String[] tokenImageVal
)
```

Types: [Token](Token.md#cls-Token)

This constructor is used by the method "generateParseException"
 in the generated parser.  Calling this constructor generates
 a new object of this type with the fields "currentToken",
 "expectedTokenSequences", and "tokenImage" set.

**Parameters**

- `com.tailf.conf.gen2.Token currentTokenVal`
- `int[][] expectedTokenSequencesVal`
- `String[] tokenImageVal`


## Fields

<a id="m-currentToken"></a>
### currentToken

```java
public com.tailf.conf.gen2.Token currentToken = null;
```

Types: [Token](Token.md#cls-Token)

This is the last token that has been consumed successfully.  If
 this object has been created due to a parse error, the token
 following this token will (therefore) be the first error token.

<a id="m-EOL"></a>
### EOL

```java
protected static String EOL = null;
```

The end of line string for this machine.

<a id="m-expectedTokenSequences"></a>
### expectedTokenSequences

```java
public int[][] expectedTokenSequences = null;
```

Each entry in this array is an array of integers.  Each array
 of integers represents a sequence of tokens (by their ordinal
 values) that is expected at this point of the parse.

<a id="m-tokenImage"></a>
### tokenImage

```java
public String[] tokenImage = null;
```

This is a reference to the "tokenImage" array of the generated
 parser within which the parse error occurred.  This array is
 defined in the generated ...Constants interface.


## Methods

<a id="m-add_escapes-6d7387de134e"></a>
### add_escapes(String)

**Package-private**

```java
static String add_escapes(String str)
```

Used to convert raw characters to their escaped version
 when these raw version cannot be used as part of an ASCII
 string literal.

**Parameters**

- `String str`
