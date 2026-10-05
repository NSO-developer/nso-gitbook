# JavaCharStream <a href="#javacharstream-b90e6870657d" id="javacharstream-b90e6870657d"></a>

**Package-private**

```java
class com.tailf.conf.dbg.JavaCharStream
```

An implementation of interface CharStream, where the stream is assumed to
 contain only ASCII characters (with java-like unicode escape processing).

## Members

**Constructors**:

- [JavaCharStream(InputStream)](#javacharstream-03b11f45e76e)
- [JavaCharStream(InputStream, int, int)](#javacharstream-1abe1abeff81)
- [JavaCharStream(InputStream, int, int, int)](#javacharstream-6115ec31926d)
- [JavaCharStream(InputStream, String)](#javacharstream-1e8a1658de9d)
- [JavaCharStream(InputStream, String, int, int)](#javacharstream-6fabfea0d728)
- [JavaCharStream(InputStream, String, int, int, int)](#javacharstream-61734768a680)
- [JavaCharStream(Reader)](#javacharstream-ac019f5a3248)
- [JavaCharStream(Reader, int, int)](#javacharstream-b489a0930918)
- [JavaCharStream(Reader, int, int, int)](#javacharstream-e1ec5eab2d32)

**Fields**:

- [available](#available-5d495e0b7a49)
- [bufcolumn](#bufcolumn-d54f32d24464)
- [buffer](#buffer-402e953fc14f)
- [bufline](#bufline-9119d0b1f9cf)
- [bufpos](#bufpos-fc156b6e2188)
- [bufsize](#bufsize-58539f7987a8)
- [column](#column-29ba72c5c6d3)
- [inBuf](#inbuf-92adf6d96237)
- [inputStream](#inputstream-45fd15a0b791)
- [line](#line-b7a101b0cce9)
- [maxNextCharInd](#maxnextcharind-7c059fb76be9)
- [nextCharBuf](#nextcharbuf-627ca57a0dc8)
- [nextCharInd](#nextcharind-b9ecc4c0ef61)
- [prevCharIsCR](#prevchariscr-41651b7dad42)
- [prevCharIsLF](#prevcharislf-f537f27adeb4)
- [staticFlag](#staticflag-f7d17f928f4f)
- [tabSize](#tabsize-2e0962f67d1f)
- [tokenBegin](#tokenbegin-aeb7e1b65303)
- [trackLineColumn](#tracklinecolumn-2b6eec3acdc9)

**Methods**:

- [adjustBeginLineColumn(int, int)](#adjustbeginlinecolumn-c801c3184566)
- [AdjustBuffSize()](#adjustbuffsize-1677d88bc028)
- [backup(int)](#backup-836a66148d50)
- [BeginToken()](#begintoken-5ad4afb8570c)
- [Done()](#done-c29e8ae89379)
- [ExpandBuff(boolean)](#expandbuff-f0e0eea8edf6)
- [FillBuff()](#fillbuff-55ac2c816918)
- [getBeginColumn()](#getbegincolumn-57cc4a053b54)
- [getBeginLine()](#getbeginline-ad626ebde8d7)
- [getColumn()](#getcolumn-d5f8434d3d26)
- [getEndColumn()](#getendcolumn-c6e9f843adab)
- [getEndLine()](#getendline-68fe642cd927)
- [GetImage()](#getimage-0197a5c17d27)
- [getLine()](#getline-6cb6167e418b)
- [GetSuffix(int)](#getsuffix-7b3a8af159d6)
- [getTabSize()](#gettabsize-078d32ef6745)
- [getTrackLineColumn()](#gettracklinecolumn-a0b86e838bf8)
- [hexval(char)](#hexval-e1e2757cc157)
- [ReadByte()](#readbyte-767d1ca98b33)
- [readChar()](#readchar-a461864752cb)
- [ReInit(InputStream)](#reinit-e03395a4a4ba)
- [ReInit(InputStream, int, int)](#reinit-da459bea1274)
- [ReInit(InputStream, int, int, int)](#reinit-2194eb0cc2c1)
- [ReInit(InputStream, String)](#reinit-330085293cfa)
- [ReInit(InputStream, String, int, int)](#reinit-93d364214350)
- [ReInit(InputStream, String, int, int, int)](#reinit-47e847ed6762)
- [ReInit(Reader)](#reinit-4ce6f3557028)
- [ReInit(Reader, int, int)](#reinit-ab9e0b4d897b)
- [ReInit(Reader, int, int, int)](#reinit-ec4c242b8fe2)
- [setTabSize(int)](#settabsize-cb0051487f7f)
- [setTrackLineColumn(boolean)](#settracklinecolumn-5819bc88a9f7)
- [UpdateLineColumn(char)](#updatelinecolumn-16cd5c192e8f)

## Constructors

### JavaCharStream(InputStream) <a href="#javacharstream-03b11f45e76e" id="javacharstream-03b11f45e76e"></a>

```java
public JavaCharStream(java.io.InputStream dstream)
```

Constructor.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.

### JavaCharStream(InputStream, int, int) <a href="#javacharstream-1abe1abeff81" id="javacharstream-1abe1abeff81"></a>

```java
public JavaCharStream(java.io.InputStream dstream, int startline, int startcolumn)
```

Constructor.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.
- `int startline` - line number of the first character of the stream, mostly for error messages.
- `int startcolumn` - column number of the first character of the stream.

### JavaCharStream(InputStream, int, int, int) <a href="#javacharstream-6115ec31926d" id="javacharstream-6115ec31926d"></a>

```java
public JavaCharStream(java.io.InputStream dstream, int startline, int startcolumn, int buffersize)
```

Constructor.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.
- `int startline` - line number of the first character of the stream, mostly for error messages.
- `int startcolumn` - column number of the first character of the stream.
- `int buffersize` - size of the buffer

### JavaCharStream(InputStream, String) <a href="#javacharstream-1e8a1658de9d" id="javacharstream-1e8a1658de9d"></a>

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

### JavaCharStream(InputStream, String, int, int) <a href="#javacharstream-6fabfea0d728" id="javacharstream-6fabfea0d728"></a>

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

### JavaCharStream(InputStream, String, int, int, int) <a href="#javacharstream-61734768a680" id="javacharstream-61734768a680"></a>

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

### JavaCharStream(Reader) <a href="#javacharstream-ac019f5a3248" id="javacharstream-ac019f5a3248"></a>

```java
public JavaCharStream(java.io.Reader dstream)
```

Constructor.

**Parameters**

- `java.io.Reader dstream` - the underlying data source.

### JavaCharStream(Reader, int, int) <a href="#javacharstream-b489a0930918" id="javacharstream-b489a0930918"></a>

```java
public JavaCharStream(java.io.Reader dstream, int startline, int startcolumn)
```

Constructor.

**Parameters**

- `java.io.Reader dstream` - the underlying data source.
- `int startline` - line number of the first character of the stream, mostly for error messages.
- `int startcolumn` - column number of the first character of the stream.

### JavaCharStream(Reader, int, int, int) <a href="#javacharstream-e1ec5eab2d32" id="javacharstream-e1ec5eab2d32"></a>

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

### available <a href="#available-5d495e0b7a49" id="available-5d495e0b7a49"></a>

**Package-private**

```java
int available = null;
```

### bufcolumn <a href="#bufcolumn-d54f32d24464" id="bufcolumn-d54f32d24464"></a>

```java
protected int[] bufcolumn = null;
```

### buffer <a href="#buffer-402e953fc14f" id="buffer-402e953fc14f"></a>

```java
protected char[] buffer = null;
```

### bufline <a href="#bufline-9119d0b1f9cf" id="bufline-9119d0b1f9cf"></a>

```java
protected int[] bufline = null;
```

### bufpos <a href="#bufpos-fc156b6e2188" id="bufpos-fc156b6e2188"></a>

```java
public int bufpos = null;
```

### bufsize <a href="#bufsize-58539f7987a8" id="bufsize-58539f7987a8"></a>

**Package-private**

```java
int bufsize = null;
```

### column <a href="#column-29ba72c5c6d3" id="column-29ba72c5c6d3"></a>

```java
protected int column = null;
```

### inBuf <a href="#inbuf-92adf6d96237" id="inbuf-92adf6d96237"></a>

```java
protected int inBuf = null;
```

### inputStream <a href="#inputstream-45fd15a0b791" id="inputstream-45fd15a0b791"></a>

```java
protected java.io.Reader inputStream = null;
```

### line <a href="#line-b7a101b0cce9" id="line-b7a101b0cce9"></a>

```java
protected int line = null;
```

### maxNextCharInd <a href="#maxnextcharind-7c059fb76be9" id="maxnextcharind-7c059fb76be9"></a>

```java
protected int maxNextCharInd = null;
```

### nextCharBuf <a href="#nextcharbuf-627ca57a0dc8" id="nextcharbuf-627ca57a0dc8"></a>

```java
protected char[] nextCharBuf = null;
```

### nextCharInd <a href="#nextcharind-b9ecc4c0ef61" id="nextcharind-b9ecc4c0ef61"></a>

```java
protected int nextCharInd = null;
```

### prevCharIsCR <a href="#prevchariscr-41651b7dad42" id="prevchariscr-41651b7dad42"></a>

```java
protected boolean prevCharIsCR = null;
```

### prevCharIsLF <a href="#prevcharislf-f537f27adeb4" id="prevcharislf-f537f27adeb4"></a>

```java
protected boolean prevCharIsLF = null;
```

### staticFlag <a href="#staticflag-f7d17f928f4f" id="staticflag-f7d17f928f4f"></a>

```java
public static final boolean staticFlag = false;
```

Whether parser is static.

### tabSize <a href="#tabsize-2e0962f67d1f" id="tabsize-2e0962f67d1f"></a>

```java
protected int tabSize = null;
```

### tokenBegin <a href="#tokenbegin-aeb7e1b65303" id="tokenbegin-aeb7e1b65303"></a>

**Package-private**

```java
int tokenBegin = null;
```

### trackLineColumn <a href="#tracklinecolumn-2b6eec3acdc9" id="tracklinecolumn-2b6eec3acdc9"></a>

```java
protected boolean trackLineColumn = null;
```


## Methods

### adjustBeginLineColumn(int, int) <a href="#adjustbeginlinecolumn-c801c3184566" id="adjustbeginlinecolumn-c801c3184566"></a>

```java
public void adjustBeginLineColumn(int newLine, int newCol)
```

Method to adjust line and column numbers for the start of a token.

**Parameters**

- `int newLine` - the new line number.
- `int newCol` - the new column number.

### AdjustBuffSize() <a href="#adjustbuffsize-1677d88bc028" id="adjustbuffsize-1677d88bc028"></a>

```java
protected void AdjustBuffSize()
```

### backup(int) <a href="#backup-836a66148d50" id="backup-836a66148d50"></a>

```java
public void backup(int amount)
```

Retreat.

**Parameters**

- `int amount`

### BeginToken() <a href="#begintoken-5ad4afb8570c" id="begintoken-5ad4afb8570c"></a>

```java
public char BeginToken() throws java.io.IOException
```

### Done() <a href="#done-c29e8ae89379" id="done-c29e8ae89379"></a>

```java
public void Done()
```

Set buffers back to null when finished.

### ExpandBuff(boolean) <a href="#expandbuff-f0e0eea8edf6" id="expandbuff-f0e0eea8edf6"></a>

```java
protected void ExpandBuff(boolean wrapAround)
```

**Parameters**

- `boolean wrapAround`

### FillBuff() <a href="#fillbuff-55ac2c816918" id="fillbuff-55ac2c816918"></a>

```java
protected void FillBuff() throws java.io.IOException
```

### getBeginColumn() <a href="#getbegincolumn-57cc4a053b54" id="getbegincolumn-57cc4a053b54"></a>

```java
public int getBeginColumn()
```

Get the beginning column.

**Returns:** column of token start

### getBeginLine() <a href="#getbeginline-ad626ebde8d7" id="getbeginline-ad626ebde8d7"></a>

```java
public int getBeginLine()
```

**Returns:** line number of token start

### getColumn() <a href="#getcolumn-d5f8434d3d26" id="getcolumn-d5f8434d3d26"></a>

```java
public int getColumn()
```

### getEndColumn() <a href="#getendcolumn-c6e9f843adab" id="getendcolumn-c6e9f843adab"></a>

```java
public int getEndColumn()
```

Get end column.

**Returns:** the end column or -1

### getEndLine() <a href="#getendline-68fe642cd927" id="getendline-68fe642cd927"></a>

```java
public int getEndLine()
```

Get end line.

**Returns:** the end line number or -1

### GetImage() <a href="#getimage-0197a5c17d27" id="getimage-0197a5c17d27"></a>

```java
public String GetImage()
```

Get the token timage.

**Returns:** token image as String

### getLine() <a href="#getline-6cb6167e418b" id="getline-6cb6167e418b"></a>

```java
public int getLine()
```

### GetSuffix(int) <a href="#getsuffix-7b3a8af159d6" id="getsuffix-7b3a8af159d6"></a>

```java
public char[] GetSuffix(int len)
```

Get the suffix as an array of characters.

**Parameters**

- `int len` - the length of the array to return.

**Returns:** suffix

### getTabSize() <a href="#gettabsize-078d32ef6745" id="gettabsize-078d32ef6745"></a>

```java
public int getTabSize()
```

### getTrackLineColumn() <a href="#gettracklinecolumn-a0b86e838bf8" id="gettracklinecolumn-a0b86e838bf8"></a>

**Package-private**

```java
boolean getTrackLineColumn()
```

### hexval(char) <a href="#hexval-e1e2757cc157" id="hexval-e1e2757cc157"></a>

**Package-private**

```java
static final int hexval(char c) throws java.io.IOException
```

**Parameters**

- `char c`

### ReadByte() <a href="#readbyte-767d1ca98b33" id="readbyte-767d1ca98b33"></a>

```java
protected char ReadByte() throws java.io.IOException
```

### readChar() <a href="#readchar-a461864752cb" id="readchar-a461864752cb"></a>

```java
public char readChar() throws java.io.IOException
```

### ReInit(InputStream) <a href="#reinit-e03395a4a4ba" id="reinit-e03395a4a4ba"></a>

```java
public void ReInit(java.io.InputStream dstream)
```

Reinitialise.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.

### ReInit(InputStream, int, int) <a href="#reinit-da459bea1274" id="reinit-da459bea1274"></a>

```java
public void ReInit(java.io.InputStream dstream, int startline, int startcolumn)
```

Reinitialise.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.
- `int startline` - line number of the first character of the stream, mostly for error messages.
- `int startcolumn` - column number of the first character of the stream.

### ReInit(InputStream, int, int, int) <a href="#reinit-2194eb0cc2c1" id="reinit-2194eb0cc2c1"></a>

```java
public void ReInit(java.io.InputStream dstream, int startline, int startcolumn, int buffersize)
```

Reinitialise.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.
- `int startline` - line number of the first character of the stream, mostly for error messages.
- `int startcolumn` - column number of the first character of the stream.
- `int buffersize` - size of the buffer

### ReInit(InputStream, String) <a href="#reinit-330085293cfa" id="reinit-330085293cfa"></a>

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

### ReInit(InputStream, String, int, int) <a href="#reinit-93d364214350" id="reinit-93d364214350"></a>

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

### ReInit(InputStream, String, int, int, int) <a href="#reinit-47e847ed6762" id="reinit-47e847ed6762"></a>

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

### ReInit(Reader) <a href="#reinit-4ce6f3557028" id="reinit-4ce6f3557028"></a>

```java
public void ReInit(java.io.Reader dstream)
```

**Parameters**

- `java.io.Reader dstream`

### ReInit(Reader, int, int) <a href="#reinit-ab9e0b4d897b" id="reinit-ab9e0b4d897b"></a>

```java
public void ReInit(java.io.Reader dstream, int startline, int startcolumn)
```

**Parameters**

- `java.io.Reader dstream`
- `int startline`
- `int startcolumn`

### ReInit(Reader, int, int, int) <a href="#reinit-ec4c242b8fe2" id="reinit-ec4c242b8fe2"></a>

```java
public void ReInit(java.io.Reader dstream, int startline, int startcolumn, int buffersize)
```

**Parameters**

- `java.io.Reader dstream`
- `int startline`
- `int startcolumn`
- `int buffersize`

### setTabSize(int) <a href="#settabsize-cb0051487f7f" id="settabsize-cb0051487f7f"></a>

```java
public void setTabSize(int i)
```

**Parameters**

- `int i`

### setTrackLineColumn(boolean) <a href="#settracklinecolumn-5819bc88a9f7" id="settracklinecolumn-5819bc88a9f7"></a>

**Package-private**

```java
void setTrackLineColumn(boolean tlc)
```

**Parameters**

- `boolean tlc`

### UpdateLineColumn(char) <a href="#updatelinecolumn-16cd5c192e8f" id="updatelinecolumn-16cd5c192e8f"></a>

```java
protected void UpdateLineColumn(char c)
```

**Parameters**

- `char c`
