# ParseException <a href="#parseexception-451af1d737ad" id="parseexception-451af1d737ad"></a>

```java
public class com.tailf.conf.dbg.ParseException
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

- [ParseException()](#parseexception-7765e2a79d08)
- [ParseException(String)](#parseexception-0700cc800bd9)
- [ParseException(Token, int[][], String[])](#parseexception-b51b2d926e10)

**Fields**:

- [currentToken](#currenttoken-4ec0f6257b86)
- [EOL](#eol-4031ee2a7b21)
- [expectedTokenSequences](#expectedtokensequences-869b21f3e4e1)
- [tokenImage](#tokenimage-c13f534d4471)

**Methods**:

- [add_escapes(String)](#add_escapes-6d7387de134e)

## Constructors

### ParseException() <a href="#parseexception-7765e2a79d08" id="parseexception-7765e2a79d08"></a>

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

### ParseException(String) <a href="#parseexception-0700cc800bd9" id="parseexception-0700cc800bd9"></a>

```java
public ParseException(String message)
```

Constructor with message.

**Parameters**

- `String message`

### ParseException(Token, int[][], String[]) <a href="#parseexception-b51b2d926e10" id="parseexception-b51b2d926e10"></a>

```java
public ParseException(
    com.tailf.conf.dbg.Token currentTokenVal,
    int[][] expectedTokenSequencesVal,
    String[] tokenImageVal
)
```

Types: [Token](Token.md#token-b7a155cc1a5e)

This constructor is used by the method "generateParseException"
 in the generated parser.  Calling this constructor generates
 a new object of this type with the fields "currentToken",
 "expectedTokenSequences", and "tokenImage" set.

**Parameters**

- `com.tailf.conf.dbg.Token currentTokenVal`
- `int[][] expectedTokenSequencesVal`
- `String[] tokenImageVal`


## Fields

### currentToken <a href="#currenttoken-4ec0f6257b86" id="currenttoken-4ec0f6257b86"></a>

```java
public com.tailf.conf.dbg.Token currentToken = null;
```

Types: [Token](Token.md#token-b7a155cc1a5e)

This is the last token that has been consumed successfully.  If
 this object has been created due to a parse error, the token
 following this token will (therefore) be the first error token.

### EOL <a href="#eol-4031ee2a7b21" id="eol-4031ee2a7b21"></a>

```java
protected static String EOL = null;
```

The end of line string for this machine.

### expectedTokenSequences <a href="#expectedtokensequences-869b21f3e4e1" id="expectedtokensequences-869b21f3e4e1"></a>

```java
public int[][] expectedTokenSequences = null;
```

Each entry in this array is an array of integers.  Each array
 of integers represents a sequence of tokens (by their ordinal
 values) that is expected at this point of the parse.

### tokenImage <a href="#tokenimage-c13f534d4471" id="tokenimage-c13f534d4471"></a>

```java
public String[] tokenImage = null;
```

This is a reference to the "tokenImage" array of the generated
 parser within which the parse error occurred.  This array is
 defined in the generated ...Constants interface.


## Methods

### add_escapes(String) <a href="#add_escapes-6d7387de134e" id="add_escapes-6d7387de134e"></a>

**Package-private**

```java
static String add_escapes(String str)
```

Used to convert raw characters to their escaped version
 when these raw version cannot be used as part of an ASCII
 string literal.

**Parameters**

- `String str`
