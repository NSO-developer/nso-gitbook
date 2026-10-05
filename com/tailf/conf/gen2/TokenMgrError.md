# TokenMgrError <a href="#tokenmgrerror-8f7fd8ddd910" id="tokenmgrerror-8f7fd8ddd910"></a>

**Package-private**

```java
@SuppressWarnings({"all"})
class com.tailf.conf.gen2.TokenMgrError
    extends Error
```

Token Manager Error.

## Members

**Constructors**:

- [TokenMgrError()](#tokenmgrerror-effbd6b83fab)
- [TokenMgrError(boolean, int, int, int, String, int, int)](#tokenmgrerror-531c6d946fca)
- [TokenMgrError(String, int)](#tokenmgrerror-e90dda5e1ebf)

**Fields**:

- [errorCode](#errorcode-e873fccf9c64)
- [INVALID_LEXICAL_STATE](#invalid_lexical_state-851c129557cb)
- [LEXICAL_ERROR](#lexical_error-885f326ca7c5)
- [LOOP_DETECTED](#loop_detected-edd9f4707a4a)
- [STATIC_LEXER_ERROR](#static_lexer_error-79f12685e808)

**Methods**:

- [addEscapes(String)](#addescapes-83898b501596)
- [getMessage()](#getmessage-77b7dae8469e)
- [LexicalErr(boolean, int, int, int, String, int)](#lexicalerr-369ebacfdb5b)

## Constructors

### TokenMgrError() <a href="#tokenmgrerror-effbd6b83fab" id="tokenmgrerror-effbd6b83fab"></a>

```java
public TokenMgrError()
```

No arg constructor.

### TokenMgrError(boolean, int, int, int, String, int, int) <a href="#tokenmgrerror-531c6d946fca" id="tokenmgrerror-531c6d946fca"></a>

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

### TokenMgrError(String, int) <a href="#tokenmgrerror-e90dda5e1ebf" id="tokenmgrerror-e90dda5e1ebf"></a>

```java
public TokenMgrError(String message, int reason)
```

Constructor with message and reason.

**Parameters**

- `String message`
- `int reason`


## Fields

### errorCode <a href="#errorcode-e873fccf9c64" id="errorcode-e873fccf9c64"></a>

**Package-private**

```java
int errorCode = null;
```

Indicates the reason why the exception is thrown. It will have
 one of the above 4 values.

### INVALID_LEXICAL_STATE <a href="#invalid_lexical_state-851c129557cb" id="invalid_lexical_state-851c129557cb"></a>

```java
public static final int INVALID_LEXICAL_STATE = 2;
```

Tried to change to an invalid lexical state.

### LEXICAL_ERROR <a href="#lexical_error-885f326ca7c5" id="lexical_error-885f326ca7c5"></a>

```java
public static final int LEXICAL_ERROR = 0;
```

Lexical error occurred.

### LOOP_DETECTED <a href="#loop_detected-edd9f4707a4a" id="loop_detected-edd9f4707a4a"></a>

```java
public static final int LOOP_DETECTED = 3;
```

Detected (and bailed out of) an infinite loop in the token manager.

### STATIC_LEXER_ERROR <a href="#static_lexer_error-79f12685e808" id="static_lexer_error-79f12685e808"></a>

```java
public static final int STATIC_LEXER_ERROR = 1;
```

An attempt was made to create a second instance of a static token manager.


## Methods

### addEscapes(String) <a href="#addescapes-83898b501596" id="addescapes-83898b501596"></a>

```java
protected static final String addEscapes(String str)
```

Replaces unprintable characters by their escaped (or unicode escaped)
 equivalents in the given string

**Parameters**

- `String str`

### getMessage() <a href="#getmessage-77b7dae8469e" id="getmessage-77b7dae8469e"></a>

```java
public String getMessage()
```

You can also modify the body of this method to customize your error messages.
 For example, cases like LOOP_DETECTED and INVALID_LEXICAL_STATE are not
 of end-users concern, so you can return something like :

     "Internal Error : Please file a bug report .... "

 from this method for such cases in the release version of your parser.

### LexicalErr(boolean, int, int, int, String, int) <a href="#lexicalerr-369ebacfdb5b" id="lexicalerr-369ebacfdb5b"></a>

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
