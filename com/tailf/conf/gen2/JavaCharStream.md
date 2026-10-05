# JavaCharStream <a href="#cls-JavaCharStream" id="cls-JavaCharStream"></a>

**Package-private**

```java
class com.tailf.conf.gen2.JavaCharStream
```

An implementation of interface CharStream, where the stream is assumed to
 contain only ASCII characters (with java-like unicode escape processing).

## Members

**Constructors**:

- [JavaCharStream(InputStream)](#m-JavaCharStream-03b11f45e76e)
- [JavaCharStream(InputStream, int, int)](#m-JavaCharStream-1abe1abeff81)
- [JavaCharStream(InputStream, int, int, int)](#m-JavaCharStream-6115ec31926d)
- [JavaCharStream(InputStream, String)](#m-JavaCharStream-1e8a1658de9d)
- [JavaCharStream(InputStream, String, int, int)](#m-JavaCharStream-6fabfea0d728)
- [JavaCharStream(InputStream, String, int, int, int)](#m-JavaCharStream-61734768a680)
- [JavaCharStream(Reader)](#m-JavaCharStream-ac019f5a3248)
- [JavaCharStream(Reader, int, int)](#m-JavaCharStream-b489a0930918)
- [JavaCharStream(Reader, int, int, int)](#m-JavaCharStream-e1ec5eab2d32)

**Fields**:

- [available](#m-available)
- [bufcolumn](#m-bufcolumn)
- [buffer](#m-buffer)
- [bufline](#m-bufline)
- [bufpos](#m-bufpos)
- [bufsize](#m-bufsize)
- [column](#m-column)
- [inBuf](#m-inBuf)
- [inputStream](#m-inputStream)
- [line](#m-line)
- [maxNextCharInd](#m-maxNextCharInd)
- [nextCharBuf](#m-nextCharBuf)
- [nextCharInd](#m-nextCharInd)
- [prevCharIsCR](#m-prevCharIsCR)
- [prevCharIsLF](#m-prevCharIsLF)
- [staticFlag](#m-staticFlag)
- [tabSize](#m-tabSize)
- [tokenBegin](#m-tokenBegin)
- [trackLineColumn](#m-trackLineColumn)

**Methods**:

- [adjustBeginLineColumn(int, int)](#m-adjustBeginLineColumn-c801c3184566)
- [AdjustBuffSize()](#m-AdjustBuffSize-1677d88bc028)
- [backup(int)](#m-backup-836a66148d50)
- [BeginToken()](#m-BeginToken-5ad4afb8570c)
- [Done()](#m-Done-c29e8ae89379)
- [ExpandBuff(boolean)](#m-ExpandBuff-f0e0eea8edf6)
- [FillBuff()](#m-FillBuff-55ac2c816918)
- [getBeginColumn()](#m-getBeginColumn-57cc4a053b54)
- [getBeginLine()](#m-getBeginLine-ad626ebde8d7)
- [getColumn()](#m-getColumn-d5f8434d3d26)
- [getEndColumn()](#m-getEndColumn-c6e9f843adab)
- [getEndLine()](#m-getEndLine-68fe642cd927)
- [GetImage()](#m-GetImage-0197a5c17d27)
- [getLine()](#m-getLine-6cb6167e418b)
- [GetSuffix(int)](#m-GetSuffix-7b3a8af159d6)
- [getTabSize()](#m-getTabSize-078d32ef6745)
- [getTrackLineColumn()](#m-getTrackLineColumn-a0b86e838bf8)
- [hexval(char)](#m-hexval-e1e2757cc157)
- [ReadByte()](#m-ReadByte-767d1ca98b33)
- [readChar()](#m-readChar-a461864752cb)
- [ReInit(InputStream)](#m-ReInit-e03395a4a4ba)
- [ReInit(InputStream, int, int)](#m-ReInit-da459bea1274)
- [ReInit(InputStream, int, int, int)](#m-ReInit-2194eb0cc2c1)
- [ReInit(InputStream, String)](#m-ReInit-330085293cfa)
- [ReInit(InputStream, String, int, int)](#m-ReInit-93d364214350)
- [ReInit(InputStream, String, int, int, int)](#m-ReInit-47e847ed6762)
- [ReInit(Reader)](#m-ReInit-4ce6f3557028)
- [ReInit(Reader, int, int)](#m-ReInit-ab9e0b4d897b)
- [ReInit(Reader, int, int, int)](#m-ReInit-ec4c242b8fe2)
- [setTabSize(int)](#m-setTabSize-cb0051487f7f)
- [setTrackLineColumn(boolean)](#m-setTrackLineColumn-5819bc88a9f7)
- [UpdateLineColumn(char)](#m-UpdateLineColumn-16cd5c192e8f)

## Constructors

### JavaCharStream(InputStream) <a href="#m-JavaCharStream-03b11f45e76e" id="m-JavaCharStream-03b11f45e76e"></a>

```java
public JavaCharStream(java.io.InputStream dstream)
```

Constructor.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.

### JavaCharStream(InputStream, int, int) <a href="#m-JavaCharStream-1abe1abeff81" id="m-JavaCharStream-1abe1abeff81"></a>

```java
public JavaCharStream(java.io.InputStream dstream, int startline, int startcolumn)
```

Constructor.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.
- `int startline` - line number of the first character of the stream, mostly for error messages.
- `int startcolumn` - column number of the first character of the stream.

### JavaCharStream(InputStream, int, int, int) <a href="#m-JavaCharStream-6115ec31926d" id="m-JavaCharStream-6115ec31926d"></a>

```java
public JavaCharStream(java.io.InputStream dstream, int startline, int startcolumn, int buffersize)
```

Constructor.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.
- `int startline` - line number of the first character of the stream, mostly for error messages.
- `int startcolumn` - column number of the first character of the stream.
- `int buffersize` - size of the buffer

### JavaCharStream(InputStream, String) <a href="#m-JavaCharStream-1e8a1658de9d" id="m-JavaCharStream-1e8a1658de9d"></a>

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

### JavaCharStream(InputStream, String, int, int) <a href="#m-JavaCharStream-6fabfea0d728" id="m-JavaCharStream-6fabfea0d728"></a>

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

### JavaCharStream(InputStream, String, int, int, int) <a href="#m-JavaCharStream-61734768a680" id="m-JavaCharStream-61734768a680"></a>

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

### JavaCharStream(Reader) <a href="#m-JavaCharStream-ac019f5a3248" id="m-JavaCharStream-ac019f5a3248"></a>

```java
public JavaCharStream(java.io.Reader dstream)
```

Constructor.

**Parameters**

- `java.io.Reader dstream` - the underlying data source.

### JavaCharStream(Reader, int, int) <a href="#m-JavaCharStream-b489a0930918" id="m-JavaCharStream-b489a0930918"></a>

```java
public JavaCharStream(java.io.Reader dstream, int startline, int startcolumn)
```

Constructor.

**Parameters**

- `java.io.Reader dstream` - the underlying data source.
- `int startline` - line number of the first character of the stream, mostly for error messages.
- `int startcolumn` - column number of the first character of the stream.

### JavaCharStream(Reader, int, int, int) <a href="#m-JavaCharStream-e1ec5eab2d32" id="m-JavaCharStream-e1ec5eab2d32"></a>

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

### available <a href="#m-available" id="m-available"></a>

**Package-private**

```java
int available = null;
```

### bufcolumn <a href="#m-bufcolumn" id="m-bufcolumn"></a>

```java
protected int[] bufcolumn = null;
```

### buffer <a href="#m-buffer" id="m-buffer"></a>

```java
protected char[] buffer = null;
```

### bufline <a href="#m-bufline" id="m-bufline"></a>

```java
protected int[] bufline = null;
```

### bufpos <a href="#m-bufpos" id="m-bufpos"></a>

```java
public int bufpos = null;
```

### bufsize <a href="#m-bufsize" id="m-bufsize"></a>

**Package-private**

```java
int bufsize = null;
```

### column <a href="#m-column" id="m-column"></a>

```java
protected int column = null;
```

### inBuf <a href="#m-inBuf" id="m-inBuf"></a>

```java
protected int inBuf = null;
```

### inputStream <a href="#m-inputStream" id="m-inputStream"></a>

```java
protected java.io.Reader inputStream = null;
```

### line <a href="#m-line" id="m-line"></a>

```java
protected int line = null;
```

### maxNextCharInd <a href="#m-maxNextCharInd" id="m-maxNextCharInd"></a>

```java
protected int maxNextCharInd = null;
```

### nextCharBuf <a href="#m-nextCharBuf" id="m-nextCharBuf"></a>

```java
protected char[] nextCharBuf = null;
```

### nextCharInd <a href="#m-nextCharInd" id="m-nextCharInd"></a>

```java
protected int nextCharInd = null;
```

### prevCharIsCR <a href="#m-prevCharIsCR" id="m-prevCharIsCR"></a>

```java
protected boolean prevCharIsCR = null;
```

### prevCharIsLF <a href="#m-prevCharIsLF" id="m-prevCharIsLF"></a>

```java
protected boolean prevCharIsLF = null;
```

### staticFlag <a href="#m-staticFlag" id="m-staticFlag"></a>

```java
public static final boolean staticFlag = false;
```

Whether parser is static.

### tabSize <a href="#m-tabSize" id="m-tabSize"></a>

```java
protected int tabSize = null;
```

### tokenBegin <a href="#m-tokenBegin" id="m-tokenBegin"></a>

**Package-private**

```java
int tokenBegin = null;
```

### trackLineColumn <a href="#m-trackLineColumn" id="m-trackLineColumn"></a>

```java
protected boolean trackLineColumn = null;
```


## Methods

### adjustBeginLineColumn(int, int) <a href="#m-adjustBeginLineColumn-c801c3184566" id="m-adjustBeginLineColumn-c801c3184566"></a>

```java
public void adjustBeginLineColumn(int newLine, int newCol)
```

Method to adjust line and column numbers for the start of a token.

**Parameters**

- `int newLine` - the new line number.
- `int newCol` - the new column number.

### AdjustBuffSize() <a href="#m-AdjustBuffSize-1677d88bc028" id="m-AdjustBuffSize-1677d88bc028"></a>

```java
protected void AdjustBuffSize()
```

### backup(int) <a href="#m-backup-836a66148d50" id="m-backup-836a66148d50"></a>

```java
public void backup(int amount)
```

Retreat.

**Parameters**

- `int amount`

### BeginToken() <a href="#m-BeginToken-5ad4afb8570c" id="m-BeginToken-5ad4afb8570c"></a>

```java
public char BeginToken() throws java.io.IOException
```

### Done() <a href="#m-Done-c29e8ae89379" id="m-Done-c29e8ae89379"></a>

```java
public void Done()
```

Set buffers back to null when finished.

### ExpandBuff(boolean) <a href="#m-ExpandBuff-f0e0eea8edf6" id="m-ExpandBuff-f0e0eea8edf6"></a>

```java
protected void ExpandBuff(boolean wrapAround)
```

**Parameters**

- `boolean wrapAround`

### FillBuff() <a href="#m-FillBuff-55ac2c816918" id="m-FillBuff-55ac2c816918"></a>

```java
protected void FillBuff() throws java.io.IOException
```

### getBeginColumn() <a href="#m-getBeginColumn-57cc4a053b54" id="m-getBeginColumn-57cc4a053b54"></a>

```java
public int getBeginColumn()
```

Get the beginning column.

**Returns:** column of token start

### getBeginLine() <a href="#m-getBeginLine-ad626ebde8d7" id="m-getBeginLine-ad626ebde8d7"></a>

```java
public int getBeginLine()
```

**Returns:** line number of token start

### getColumn() <a href="#m-getColumn-d5f8434d3d26" id="m-getColumn-d5f8434d3d26"></a>

```java
public int getColumn()
```

### getEndColumn() <a href="#m-getEndColumn-c6e9f843adab" id="m-getEndColumn-c6e9f843adab"></a>

```java
public int getEndColumn()
```

Get end column.

**Returns:** the end column or -1

### getEndLine() <a href="#m-getEndLine-68fe642cd927" id="m-getEndLine-68fe642cd927"></a>

```java
public int getEndLine()
```

Get end line.

**Returns:** the end line number or -1

### GetImage() <a href="#m-GetImage-0197a5c17d27" id="m-GetImage-0197a5c17d27"></a>

```java
public String GetImage()
```

Get the token timage.

**Returns:** token image as String

### getLine() <a href="#m-getLine-6cb6167e418b" id="m-getLine-6cb6167e418b"></a>

```java
public int getLine()
```

### GetSuffix(int) <a href="#m-GetSuffix-7b3a8af159d6" id="m-GetSuffix-7b3a8af159d6"></a>

```java
public char[] GetSuffix(int len)
```

Get the suffix as an array of characters.

**Parameters**

- `int len` - the length of the array to return.

**Returns:** suffix

### getTabSize() <a href="#m-getTabSize-078d32ef6745" id="m-getTabSize-078d32ef6745"></a>

```java
public int getTabSize()
```

### getTrackLineColumn() <a href="#m-getTrackLineColumn-a0b86e838bf8" id="m-getTrackLineColumn-a0b86e838bf8"></a>

**Package-private**

```java
boolean getTrackLineColumn()
```

### hexval(char) <a href="#m-hexval-e1e2757cc157" id="m-hexval-e1e2757cc157"></a>

**Package-private**

```java
static final int hexval(char c) throws java.io.IOException
```

**Parameters**

- `char c`

### ReadByte() <a href="#m-ReadByte-767d1ca98b33" id="m-ReadByte-767d1ca98b33"></a>

```java
protected char ReadByte() throws java.io.IOException
```

### readChar() <a href="#m-readChar-a461864752cb" id="m-readChar-a461864752cb"></a>

```java
public char readChar() throws java.io.IOException
```

### ReInit(InputStream) <a href="#m-ReInit-e03395a4a4ba" id="m-ReInit-e03395a4a4ba"></a>

```java
public void ReInit(java.io.InputStream dstream)
```

Reinitialise.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.

### ReInit(InputStream, int, int) <a href="#m-ReInit-da459bea1274" id="m-ReInit-da459bea1274"></a>

```java
public void ReInit(java.io.InputStream dstream, int startline, int startcolumn)
```

Reinitialise.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.
- `int startline` - line number of the first character of the stream, mostly for error messages.
- `int startcolumn` - column number of the first character of the stream.

### ReInit(InputStream, int, int, int) <a href="#m-ReInit-2194eb0cc2c1" id="m-ReInit-2194eb0cc2c1"></a>

```java
public void ReInit(java.io.InputStream dstream, int startline, int startcolumn, int buffersize)
```

Reinitialise.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.
- `int startline` - line number of the first character of the stream, mostly for error messages.
- `int startcolumn` - column number of the first character of the stream.
- `int buffersize` - size of the buffer

### ReInit(InputStream, String) <a href="#m-ReInit-330085293cfa" id="m-ReInit-330085293cfa"></a>

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

### ReInit(InputStream, String, int, int) <a href="#m-ReInit-93d364214350" id="m-ReInit-93d364214350"></a>

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

### ReInit(InputStream, String, int, int, int) <a href="#m-ReInit-47e847ed6762" id="m-ReInit-47e847ed6762"></a>

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

### ReInit(Reader) <a href="#m-ReInit-4ce6f3557028" id="m-ReInit-4ce6f3557028"></a>

```java
public void ReInit(java.io.Reader dstream)
```

**Parameters**

- `java.io.Reader dstream`

### ReInit(Reader, int, int) <a href="#m-ReInit-ab9e0b4d897b" id="m-ReInit-ab9e0b4d897b"></a>

```java
public void ReInit(java.io.Reader dstream, int startline, int startcolumn)
```

**Parameters**

- `java.io.Reader dstream`
- `int startline`
- `int startcolumn`

### ReInit(Reader, int, int, int) <a href="#m-ReInit-ec4c242b8fe2" id="m-ReInit-ec4c242b8fe2"></a>

```java
public void ReInit(java.io.Reader dstream, int startline, int startcolumn, int buffersize)
```

**Parameters**

- `java.io.Reader dstream`
- `int startline`
- `int startcolumn`
- `int buffersize`

### setTabSize(int) <a href="#m-setTabSize-cb0051487f7f" id="m-setTabSize-cb0051487f7f"></a>

```java
public void setTabSize(int i)
```

**Parameters**

- `int i`

### setTrackLineColumn(boolean) <a href="#m-setTrackLineColumn-5819bc88a9f7" id="m-setTrackLineColumn-5819bc88a9f7"></a>

**Package-private**

```java
void setTrackLineColumn(boolean tlc)
```

**Parameters**

- `boolean tlc`

### UpdateLineColumn(char) <a href="#m-UpdateLineColumn-16cd5c192e8f" id="m-UpdateLineColumn-16cd5c192e8f"></a>

```java
protected void UpdateLineColumn(char c)
```

**Parameters**

- `char c`
