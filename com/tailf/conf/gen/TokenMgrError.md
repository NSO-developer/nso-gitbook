# TokenMgrError <a href="#cls-TokenMgrError" id="cls-TokenMgrError"></a>

**Package-private**

```java
@SuppressWarnings({"all"})
class com.tailf.conf.gen.TokenMgrError
    extends Error
```

Token Manager Error.

## Members

**Constructors**:

- [TokenMgrError()](#m-TokenMgrError-effbd6b83fab)
- [TokenMgrError(boolean, int, int, int, String, int, int)](#m-TokenMgrError-531c6d946fca)
- [TokenMgrError(String, int)](#m-TokenMgrError-e90dda5e1ebf)

**Fields**:

- [errorCode](#m-errorCode)
- [INVALID_LEXICAL_STATE](#m-INVALID_LEXICAL_STATE)
- [LEXICAL_ERROR](#m-LEXICAL_ERROR)
- [LOOP_DETECTED](#m-LOOP_DETECTED)
- [STATIC_LEXER_ERROR](#m-STATIC_LEXER_ERROR)

**Methods**:

- [addEscapes(String)](#m-addEscapes-83898b501596)
- [getMessage()](#m-getMessage-77b7dae8469e)
- [LexicalErr(boolean, int, int, int, String, int)](#m-LexicalErr-369ebacfdb5b)

## Constructors

### TokenMgrError() <a href="#m-TokenMgrError-effbd6b83fab" id="m-TokenMgrError-effbd6b83fab"></a>

```java
public TokenMgrError()
```

No arg constructor.

### TokenMgrError(boolean, int, int, int, String, int, int) <a href="#m-TokenMgrError-531c6d946fca" id="m-TokenMgrError-531c6d946fca"></a>

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

### TokenMgrError(String, int) <a href="#m-TokenMgrError-e90dda5e1ebf" id="m-TokenMgrError-e90dda5e1ebf"></a>

```java
public TokenMgrError(String message, int reason)
```

Constructor with message and reason.

**Parameters**

- `String message`
- `int reason`


## Fields

### errorCode <a href="#m-errorCode" id="m-errorCode"></a>

**Package-private**

```java
int errorCode = null;
```

Indicates the reason why the exception is thrown. It will have
 one of the above 4 values.

### INVALID_LEXICAL_STATE <a href="#m-INVALID_LEXICAL_STATE" id="m-INVALID_LEXICAL_STATE"></a>

```java
public static final int INVALID_LEXICAL_STATE = 2;
```

Tried to change to an invalid lexical state.

### LEXICAL_ERROR <a href="#m-LEXICAL_ERROR" id="m-LEXICAL_ERROR"></a>

```java
public static final int LEXICAL_ERROR = 0;
```

Lexical error occurred.

### LOOP_DETECTED <a href="#m-LOOP_DETECTED" id="m-LOOP_DETECTED"></a>

```java
public static final int LOOP_DETECTED = 3;
```

Detected (and bailed out of) an infinite loop in the token manager.

### STATIC_LEXER_ERROR <a href="#m-STATIC_LEXER_ERROR" id="m-STATIC_LEXER_ERROR"></a>

```java
public static final int STATIC_LEXER_ERROR = 1;
```

An attempt was made to create a second instance of a static token manager.


## Methods

### addEscapes(String) <a href="#m-addEscapes-83898b501596" id="m-addEscapes-83898b501596"></a>

```java
protected static final String addEscapes(String str)
```

Replaces unprintable characters by their escaped (or unicode escaped)
 equivalents in the given string

**Parameters**

- `String str`

### getMessage() <a href="#m-getMessage-77b7dae8469e" id="m-getMessage-77b7dae8469e"></a>

```java
public String getMessage()
```

You can also modify the body of this method to customize your error messages.
 For example, cases like LOOP_DETECTED and INVALID_LEXICAL_STATE are not
 of end-users concern, so you can return something like :

     "Internal Error : Please file a bug report .... "

 from this method for such cases in the release version of your parser.

### LexicalErr(boolean, int, int, int, String, int) <a href="#m-LexicalErr-369ebacfdb5b" id="m-LexicalErr-369ebacfdb5b"></a>

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
