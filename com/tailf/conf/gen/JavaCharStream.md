<a id="s-JavaCharStream"></a>
# JavaCharStream

**Package-private**

```java
class com.tailf.conf.gen.JavaCharStream
```

An implementation of interface CharStream, where the stream is assumed to
 contain only ASCII characters (with java-like unicode escape processing).

## Members

**Constructors**:

- [JavaCharStream(InputStream)](#s-JavaCharStream-1)
- [JavaCharStream(InputStream, int, int)](#s-JavaCharStream-2)
- [JavaCharStream(InputStream, int, int, int)](#s-JavaCharStream-3)
- [JavaCharStream(InputStream, String)](#s-JavaCharStream-4)
- [JavaCharStream(InputStream, String, int, int)](#s-JavaCharStream-5)
- [JavaCharStream(InputStream, String, int, int, int)](#s-JavaCharStream-6)
- [JavaCharStream(Reader)](#s-JavaCharStream-7)
- [JavaCharStream(Reader, int, int)](#s-JavaCharStream-8)
- [JavaCharStream(Reader, int, int, int)](#s-JavaCharStream-9)

**Fields**:

- [available](#s-available)
- [bufcolumn](#s-bufcolumn)
- [buffer](#s-buffer)
- [bufline](#s-bufline)
- [bufpos](#s-bufpos)
- [bufsize](#s-bufsize)
- [column](#s-column)
- [inBuf](#s-inBuf)
- [inputStream](#s-inputStream)
- [line](#s-line)
- [maxNextCharInd](#s-maxNextCharInd)
- [nextCharBuf](#s-nextCharBuf)
- [nextCharInd](#s-nextCharInd)
- [prevCharIsCR](#s-prevCharIsCR)
- [prevCharIsLF](#s-prevCharIsLF)
- [staticFlag](#s-staticFlag)
- [tabSize](#s-tabSize)
- [tokenBegin](#s-tokenBegin)
- [trackLineColumn](#s-trackLineColumn)

**Methods**:

- [adjustBeginLineColumn(int, int)](#s-adjustBeginLineColumn)
- [AdjustBuffSize()](#s-AdjustBuffSize)
- [backup(int)](#s-backup)
- [BeginToken()](#s-BeginToken)
- [Done()](#s-Done)
- [ExpandBuff(boolean)](#s-ExpandBuff)
- [FillBuff()](#s-FillBuff)
- [getBeginColumn()](#s-getBeginColumn)
- [getBeginLine()](#s-getBeginLine)
- [getColumn()](#s-getColumn)
- [getEndColumn()](#s-getEndColumn)
- [getEndLine()](#s-getEndLine)
- [GetImage()](#s-GetImage)
- [getLine()](#s-getLine)
- [GetSuffix(int)](#s-GetSuffix)
- [getTabSize()](#s-getTabSize)
- [getTrackLineColumn()](#s-getTrackLineColumn)
- [hexval(char)](#s-hexval)
- [ReadByte()](#s-ReadByte)
- [readChar()](#s-readChar)
- [ReInit(InputStream)](#s-ReInit)
- [ReInit(InputStream, int, int)](#s-ReInit-1)
- [ReInit(InputStream, int, int, int)](#s-ReInit-2)
- [ReInit(InputStream, String)](#s-ReInit-3)
- [ReInit(InputStream, String, int, int)](#s-ReInit-4)
- [ReInit(InputStream, String, int, int, int)](#s-ReInit-5)
- [ReInit(Reader)](#s-ReInit-6)
- [ReInit(Reader, int, int)](#s-ReInit-7)
- [ReInit(Reader, int, int, int)](#s-ReInit-8)
- [setTabSize(int)](#s-setTabSize)
- [setTrackLineColumn(boolean)](#s-setTrackLineColumn)
- [UpdateLineColumn(char)](#s-UpdateLineColumn)

## Constructors

<a id="s-JavaCharStream-1"></a>
### JavaCharStream(InputStream)

```java
public JavaCharStream(java.io.InputStream dstream)
```

Constructor.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.

<a id="s-JavaCharStream-2"></a>
### JavaCharStream(InputStream, int, int)

```java
public JavaCharStream(java.io.InputStream dstream, int startline, int startcolumn)
```

Constructor.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.
- `int startline` - line number of the first character of the stream, mostly for error messages.
- `int startcolumn` - column number of the first character of the stream.

<a id="s-JavaCharStream-3"></a>
### JavaCharStream(InputStream, int, int, int)

```java
public JavaCharStream(java.io.InputStream dstream, int startline, int startcolumn, int buffersize)
```

Constructor.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.
- `int startline` - line number of the first character of the stream, mostly for error messages.
- `int startcolumn` - column number of the first character of the stream.
- `int buffersize` - size of the buffer

<a id="s-JavaCharStream-4"></a>
### JavaCharStream(InputStream, String)

```java
public JavaCharStream(
    java.io.InputStream dstream,
    String encoding
)
    throws java.io.UnsupportedEncodingException
```

Constructor.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.
- `String encoding` - the character encoding of the data stream.

**Throws**

- `UnsupportedEncodingException` - encoding is invalid or unsupported.

<a id="s-JavaCharStream-5"></a>
### JavaCharStream(InputStream, String, int, int)

```java
public JavaCharStream(
    java.io.InputStream dstream,
    String encoding,
    int startline,
    int startcolumn
)
    throws java.io.UnsupportedEncodingException
```

Constructor.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.
- `String encoding` - the character encoding of the data stream.
- `int startline` - line number of the first character of the stream, mostly for error messages.
- `int startcolumn` - column number of the first character of the stream.

**Throws**

- `UnsupportedEncodingException` - encoding is invalid or unsupported.

<a id="s-JavaCharStream-6"></a>
### JavaCharStream(InputStream, String, int, int, int)

```java
public JavaCharStream(
    java.io.InputStream dstream,
    String encoding,
    int startline,
    int startcolumn,
    int buffersize
)
    throws java.io.UnsupportedEncodingException
```

Constructor.

**Parameters**

- `java.io.InputStream dstream`
- `String encoding`
- `int startline`
- `int startcolumn`
- `int buffersize`

<a id="s-JavaCharStream-7"></a>
### JavaCharStream(Reader)

```java
public JavaCharStream(java.io.Reader dstream)
```

Constructor.

**Parameters**

- `java.io.Reader dstream` - the underlying data source.

<a id="s-JavaCharStream-8"></a>
### JavaCharStream(Reader, int, int)

```java
public JavaCharStream(java.io.Reader dstream, int startline, int startcolumn)
```

Constructor.

**Parameters**

- `java.io.Reader dstream` - the underlying data source.
- `int startline` - line number of the first character of the stream, mostly for error messages.
- `int startcolumn` - column number of the first character of the stream.

<a id="s-JavaCharStream-9"></a>
### JavaCharStream(Reader, int, int, int)

```java
public JavaCharStream(java.io.Reader dstream, int startline, int startcolumn, int buffersize)
```

Constructor.

**Parameters**

- `java.io.Reader dstream` - the underlying data source.
- `int startline` - line number of the first character of the stream, mostly for error messages.
- `int startcolumn` - column number of the first character of the stream.
- `int buffersize` - size of the buffer


## Fields

<a id="s-available"></a>
### available

**Package-private**

```java
int available = null;
```

<a id="s-bufcolumn"></a>
### bufcolumn

```java
protected int[] bufcolumn = null;
```

<a id="s-buffer"></a>
### buffer

```java
protected char[] buffer = null;
```

<a id="s-bufline"></a>
### bufline

```java
protected int[] bufline = null;
```

<a id="s-bufpos"></a>
### bufpos

```java
public int bufpos = null;
```

<a id="s-bufsize"></a>
### bufsize

**Package-private**

```java
int bufsize = null;
```

<a id="s-column"></a>
### column

```java
protected int column = null;
```

<a id="s-inBuf"></a>
### inBuf

```java
protected int inBuf = null;
```

<a id="s-inputStream"></a>
### inputStream

```java
protected java.io.Reader inputStream = null;
```

<a id="s-line"></a>
### line

```java
protected int line = null;
```

<a id="s-maxNextCharInd"></a>
### maxNextCharInd

```java
protected int maxNextCharInd = null;
```

<a id="s-nextCharBuf"></a>
### nextCharBuf

```java
protected char[] nextCharBuf = null;
```

<a id="s-nextCharInd"></a>
### nextCharInd

```java
protected int nextCharInd = null;
```

<a id="s-prevCharIsCR"></a>
### prevCharIsCR

```java
protected boolean prevCharIsCR = null;
```

<a id="s-prevCharIsLF"></a>
### prevCharIsLF

```java
protected boolean prevCharIsLF = null;
```

<a id="s-staticFlag"></a>
### staticFlag

```java
public static final boolean staticFlag = false;
```

Whether parser is static.

<a id="s-tabSize"></a>
### tabSize

```java
protected int tabSize = null;
```

<a id="s-tokenBegin"></a>
### tokenBegin

**Package-private**

```java
int tokenBegin = null;
```

<a id="s-trackLineColumn"></a>
### trackLineColumn

```java
protected boolean trackLineColumn = null;
```


## Methods

<a id="s-adjustBeginLineColumn"></a>
### adjustBeginLineColumn(int, int)

```java
public void adjustBeginLineColumn(int newLine, int newCol)
```

Method to adjust line and column numbers for the start of a token.

**Parameters**

- `int newLine` - the new line number.
- `int newCol` - the new column number.

<a id="s-AdjustBuffSize"></a>
### AdjustBuffSize()

```java
protected void AdjustBuffSize()
```

<a id="s-backup"></a>
### backup(int)

```java
public void backup(int amount)
```

Retreat.

**Parameters**

- `int amount`

<a id="s-BeginToken"></a>
### BeginToken()

```java
public char BeginToken() throws java.io.IOException
```

<a id="s-Done"></a>
### Done()

```java
public void Done()
```

Set buffers back to null when finished.

<a id="s-ExpandBuff"></a>
### ExpandBuff(boolean)

```java
protected void ExpandBuff(boolean wrapAround)
```

**Parameters**

- `boolean wrapAround`

<a id="s-FillBuff"></a>
### FillBuff()

```java
protected void FillBuff() throws java.io.IOException
```

<a id="s-getBeginColumn"></a>
### getBeginColumn()

```java
public int getBeginColumn()
```

Get the beginning column.

**Returns:** column of token start

<a id="s-getBeginLine"></a>
### getBeginLine()

```java
public int getBeginLine()
```

**Returns:** line number of token start

<a id="s-getColumn"></a>
### getColumn()

```java
public int getColumn()
```

<a id="s-getEndColumn"></a>
### getEndColumn()

```java
public int getEndColumn()
```

Get end column.

**Returns:** the end column or -1

<a id="s-getEndLine"></a>
### getEndLine()

```java
public int getEndLine()
```

Get end line.

**Returns:** the end line number or -1

<a id="s-GetImage"></a>
### GetImage()

```java
public String GetImage()
```

Get the token timage.

**Returns:** token image as String

<a id="s-getLine"></a>
### getLine()

```java
public int getLine()
```

<a id="s-GetSuffix"></a>
### GetSuffix(int)

```java
public char[] GetSuffix(int len)
```

Get the suffix as an array of characters.

**Parameters**

- `int len` - the length of the array to return.

**Returns:** suffix

<a id="s-getTabSize"></a>
### getTabSize()

```java
public int getTabSize()
```

<a id="s-getTrackLineColumn"></a>
### getTrackLineColumn()

**Package-private**

```java
boolean getTrackLineColumn()
```

<a id="s-hexval"></a>
### hexval(char)

**Package-private**

```java
static final int hexval(char c) throws java.io.IOException
```

**Parameters**

- `char c`

<a id="s-ReadByte"></a>
### ReadByte()

```java
protected char ReadByte() throws java.io.IOException
```

<a id="s-readChar"></a>
### readChar()

```java
public char readChar() throws java.io.IOException
```

<a id="s-ReInit"></a>
### ReInit(InputStream)

```java
public void ReInit(java.io.InputStream dstream)
```

Reinitialise.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.

<a id="s-ReInit-1"></a>
### ReInit(InputStream, int, int)

```java
public void ReInit(java.io.InputStream dstream, int startline, int startcolumn)
```

Reinitialise.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.
- `int startline` - line number of the first character of the stream, mostly for error messages.
- `int startcolumn` - column number of the first character of the stream.

<a id="s-ReInit-2"></a>
### ReInit(InputStream, int, int, int)

```java
public void ReInit(java.io.InputStream dstream, int startline, int startcolumn, int buffersize)
```

Reinitialise.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.
- `int startline` - line number of the first character of the stream, mostly for error messages.
- `int startcolumn` - column number of the first character of the stream.
- `int buffersize` - size of the buffer

<a id="s-ReInit-3"></a>
### ReInit(InputStream, String)

```java
public void ReInit(
    java.io.InputStream dstream,
    String encoding
)
    throws java.io.UnsupportedEncodingException
```

Reinitialise.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.
- `String encoding` - the character encoding of the data stream.

**Throws**

- `UnsupportedEncodingException` - encoding is invalid or unsupported.

<a id="s-ReInit-4"></a>
### ReInit(InputStream, String, int, int)

```java
public void ReInit(
    java.io.InputStream dstream,
    String encoding,
    int startline,
    int startcolumn
)
    throws java.io.UnsupportedEncodingException
```

Reinitialise.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.
- `String encoding` - the character encoding of the data stream.
- `int startline` - line number of the first character of the stream, mostly for error messages.
- `int startcolumn` - column number of the first character of the stream.

**Throws**

- `UnsupportedEncodingException` - encoding is invalid or unsupported.

<a id="s-ReInit-5"></a>
### ReInit(InputStream, String, int, int, int)

```java
public void ReInit(
    java.io.InputStream dstream,
    String encoding,
    int startline,
    int startcolumn,
    int buffersize
)
    throws java.io.UnsupportedEncodingException
```

Reinitialise.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.
- `String encoding` - the character encoding of the data stream.
- `int startline` - line number of the first character of the stream, mostly for error messages.
- `int startcolumn` - column number of the first character of the stream.
- `int buffersize` - size of the buffer

<a id="s-ReInit-6"></a>
### ReInit(Reader)

```java
public void ReInit(java.io.Reader dstream)
```

**Parameters**

- `java.io.Reader dstream`

<a id="s-ReInit-7"></a>
### ReInit(Reader, int, int)

```java
public void ReInit(java.io.Reader dstream, int startline, int startcolumn)
```

**Parameters**

- `java.io.Reader dstream`
- `int startline`
- `int startcolumn`

<a id="s-ReInit-8"></a>
### ReInit(Reader, int, int, int)

```java
public void ReInit(java.io.Reader dstream, int startline, int startcolumn, int buffersize)
```

**Parameters**

- `java.io.Reader dstream`
- `int startline`
- `int startcolumn`
- `int buffersize`

<a id="s-setTabSize"></a>
### setTabSize(int)

```java
public void setTabSize(int i)
```

**Parameters**

- `int i`

<a id="s-setTrackLineColumn"></a>
### setTrackLineColumn(boolean)

**Package-private**

```java
void setTrackLineColumn(boolean tlc)
```

**Parameters**

- `boolean tlc`

<a id="s-UpdateLineColumn"></a>
### UpdateLineColumn(char)

```java
protected void UpdateLineColumn(char c)
```

**Parameters**

- `char c`
