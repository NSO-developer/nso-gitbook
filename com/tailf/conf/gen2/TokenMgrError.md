<a id="cls-TokenMgrError"></a>
# TokenMgrError

**Package-private**

```java
@SuppressWarnings({"all"})
class com.tailf.conf.gen2.TokenMgrError
    extends Error
```

Token Manager Error.

## Members

**Constructors**:

- [TokenMgrError()](#m-tokenmgrerror-effbd6b83fab)
- [TokenMgrError(boolean, int, int, int, String, int, int)](#m-tokenmgrerror-531c6d946fca)
- [TokenMgrError(String, int)](#m-tokenmgrerror-e90dda5e1ebf)

**Fields**:

- [errorCode](#m-errorCode)
- [INVALID_LEXICAL_STATE](#m-INVALID_LEXICAL_STATE)
- [LEXICAL_ERROR](#m-LEXICAL_ERROR)
- [LOOP_DETECTED](#m-LOOP_DETECTED)
- [STATIC_LEXER_ERROR](#m-STATIC_LEXER_ERROR)

**Methods**:

- [addEscapes(String)](#m-addescapes-83898b501596)
- [getMessage()](#m-getmessage-77b7dae8469e)
- [LexicalErr(boolean, int, int, int, String, int)](#m-lexicalerr-369ebacfdb5b)

## Constructors

<a id="m-tokenmgrerror-effbd6b83fab"></a>
### TokenMgrError()

```java
public TokenMgrError()
```

No arg constructor.

<a id="m-tokenmgrerror-531c6d946fca"></a>
### TokenMgrError(boolean, int, int, int, String, int, int)

```java
public TokenMgrError(
    boolean EOFSeen,
    int lexState,
    int errorLine,
    int errorColumn,
    String errorAfter,
    int curChar,
    int reason
)
```

Full Constructor.

**Parameters**

- `boolean EOFSeen`
- `int lexState`
- `int errorLine`
- `int errorColumn`
- `String errorAfter`
- `int curChar`
- `int reason`

<a id="m-tokenmgrerror-e90dda5e1ebf"></a>
### TokenMgrError(String, int)

```java
public TokenMgrError(String message, int reason)
```

Constructor with message and reason.

**Parameters**

- `String message`
- `int reason`


## Fields

<a id="m-errorCode"></a>
### errorCode

**Package-private**

```java
int errorCode = null;
```

Indicates the reason why the exception is thrown. It will have
 one of the above 4 values.

<a id="m-INVALID_LEXICAL_STATE"></a>
### INVALID_LEXICAL_STATE

```java
public static final int INVALID_LEXICAL_STATE = 2;
```

Tried to change to an invalid lexical state.

<a id="m-LEXICAL_ERROR"></a>
### LEXICAL_ERROR

```java
public static final int LEXICAL_ERROR = 0;
```

Lexical error occurred.

<a id="m-LOOP_DETECTED"></a>
### LOOP_DETECTED

```java
public static final int LOOP_DETECTED = 3;
```

Detected (and bailed out of) an infinite loop in the token manager.

<a id="m-STATIC_LEXER_ERROR"></a>
### STATIC_LEXER_ERROR

```java
public static final int STATIC_LEXER_ERROR = 1;
```

An attempt was made to create a second instance of a static token manager.


## Methods

<a id="m-addescapes-83898b501596"></a>
### addEscapes(String)

```java
protected static final String addEscapes(String str)
```

Replaces unprintable characters by their escaped (or unicode escaped)
 equivalents in the given string

**Parameters**

- `String str`

<a id="m-getmessage-77b7dae8469e"></a>
### getMessage()

```java
public String getMessage()
```

You can also modify the body of this method to customize your error messages.
 For example, cases like LOOP_DETECTED and INVALID_LEXICAL_STATE are not
 of end-users concern, so you can return something like :

     "Internal Error : Please file a bug report .... "

 from this method for such cases in the release version of your parser.

<a id="m-lexicalerr-369ebacfdb5b"></a>
### LexicalErr(boolean, int, int, int, String, int)

```java
protected static String LexicalErr(
    boolean EOFSeen,
    int lexState,
    int errorLine,
    int errorColumn,
    String errorAfter,
    int curChar
)
```

Returns a detailed message for the Error when it is thrown by the
 token manager to indicate a lexical error.
 Parameters :
    EOFSeen     : indicates if EOF caused the lexical error
    lexState    : lexical state in which this error occurred
    errorLine   : line number when the error occurred
    errorColumn : column number when the error occurred
    errorAfter  : prefix that was seen before this error occurred
    curchar     : the offending character
 Note: You can customize the lexical error message by modifying this method.

**Parameters**

- `boolean EOFSeen`
- `int lexState`
- `int errorLine`
- `int errorColumn`
- `String errorAfter`
- `int curChar`
