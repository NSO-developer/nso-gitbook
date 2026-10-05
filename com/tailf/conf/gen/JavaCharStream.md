<a id="cls-JavaCharStream"></a>
# JavaCharStream

**Package-private**

```java
class com.tailf.conf.gen.JavaCharStream
```

An implementation of interface CharStream, where the stream is assumed to
 contain only ASCII characters (with java-like unicode escape processing).

## Members

**Constructors**:

- [JavaCharStream(InputStream)](#m-javacharstream-03b11f45e76e)
- [JavaCharStream(InputStream, int, int)](#m-javacharstream-1abe1abeff81)
- [JavaCharStream(InputStream, int, int, int)](#m-javacharstream-6115ec31926d)
- [JavaCharStream(InputStream, String)](#m-javacharstream-1e8a1658de9d)
- [JavaCharStream(InputStream, String, int, int)](#m-javacharstream-6fabfea0d728)
- [JavaCharStream(InputStream, String, int, int, int)](#m-javacharstream-61734768a680)
- [JavaCharStream(Reader)](#m-javacharstream-ac019f5a3248)
- [JavaCharStream(Reader, int, int)](#m-javacharstream-b489a0930918)
- [JavaCharStream(Reader, int, int, int)](#m-javacharstream-e1ec5eab2d32)

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

- [adjustBeginLineColumn(int, int)](#m-adjustbeginlinecolumn-c801c3184566)
- [AdjustBuffSize()](#m-adjustbuffsize-1677d88bc028)
- [backup(int)](#m-backup-836a66148d50)
- [BeginToken()](#m-begintoken-5ad4afb8570c)
- [Done()](#m-done-c29e8ae89379)
- [ExpandBuff(boolean)](#m-expandbuff-f0e0eea8edf6)
- [FillBuff()](#m-fillbuff-55ac2c816918)
- [getBeginColumn()](#m-getbegincolumn-57cc4a053b54)
- [getBeginLine()](#m-getbeginline-ad626ebde8d7)
- [getColumn()](#m-getcolumn-d5f8434d3d26)
- [getEndColumn()](#m-getendcolumn-c6e9f843adab)
- [getEndLine()](#m-getendline-68fe642cd927)
- [GetImage()](#m-getimage-0197a5c17d27)
- [getLine()](#m-getline-6cb6167e418b)
- [GetSuffix(int)](#m-getsuffix-7b3a8af159d6)
- [getTabSize()](#m-gettabsize-078d32ef6745)
- [getTrackLineColumn()](#m-gettracklinecolumn-a0b86e838bf8)
- [hexval(char)](#m-hexval-e1e2757cc157)
- [ReadByte()](#m-readbyte-767d1ca98b33)
- [readChar()](#m-readchar-a461864752cb)
- [ReInit(InputStream)](#m-reinit-e03395a4a4ba)
- [ReInit(InputStream, int, int)](#m-reinit-da459bea1274)
- [ReInit(InputStream, int, int, int)](#m-reinit-2194eb0cc2c1)
- [ReInit(InputStream, String)](#m-reinit-330085293cfa)
- [ReInit(InputStream, String, int, int)](#m-reinit-93d364214350)
- [ReInit(InputStream, String, int, int, int)](#m-reinit-47e847ed6762)
- [ReInit(Reader)](#m-reinit-4ce6f3557028)
- [ReInit(Reader, int, int)](#m-reinit-ab9e0b4d897b)
- [ReInit(Reader, int, int, int)](#m-reinit-ec4c242b8fe2)
- [setTabSize(int)](#m-settabsize-cb0051487f7f)
- [setTrackLineColumn(boolean)](#m-settracklinecolumn-5819bc88a9f7)
- [UpdateLineColumn(char)](#m-updatelinecolumn-16cd5c192e8f)

## Constructors

<a id="m-javacharstream-03b11f45e76e"></a>
### JavaCharStream(InputStream)

```java
public JavaCharStream(java.io.InputStream dstream)
```

Constructor.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.

<a id="m-javacharstream-1abe1abeff81"></a>
### JavaCharStream(InputStream, int, int)

```java
public JavaCharStream(java.io.InputStream dstream, int startline, int startcolumn)
```

Constructor.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.
- `int startline` - line number of the first character of the stream, mostly for error messages.
- `int startcolumn` - column number of the first character of the stream.

<a id="m-javacharstream-6115ec31926d"></a>
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

<a id="m-javacharstream-1e8a1658de9d"></a>
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

<a id="m-javacharstream-6fabfea0d728"></a>
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

<a id="m-javacharstream-61734768a680"></a>
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

<a id="m-javacharstream-ac019f5a3248"></a>
### JavaCharStream(Reader)

```java
public JavaCharStream(java.io.Reader dstream)
```

Constructor.

**Parameters**

- `java.io.Reader dstream` - the underlying data source.

<a id="m-javacharstream-b489a0930918"></a>
### JavaCharStream(Reader, int, int)

```java
public JavaCharStream(java.io.Reader dstream, int startline, int startcolumn)
```

Constructor.

**Parameters**

- `java.io.Reader dstream` - the underlying data source.
- `int startline` - line number of the first character of the stream, mostly for error messages.
- `int startcolumn` - column number of the first character of the stream.

<a id="m-javacharstream-e1ec5eab2d32"></a>
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

<a id="m-available"></a>
### available

**Package-private**

```java
int available = null;
```

<a id="m-bufcolumn"></a>
### bufcolumn

```java
protected int[] bufcolumn = null;
```

<a id="m-buffer"></a>
### buffer

```java
protected char[] buffer = null;
```

<a id="m-bufline"></a>
### bufline

```java
protected int[] bufline = null;
```

<a id="m-bufpos"></a>
### bufpos

```java
public int bufpos = null;
```

<a id="m-bufsize"></a>
### bufsize

**Package-private**

```java
int bufsize = null;
```

<a id="m-column"></a>
### column

```java
protected int column = null;
```

<a id="m-inBuf"></a>
### inBuf

```java
protected int inBuf = null;
```

<a id="m-inputStream"></a>
### inputStream

```java
protected java.io.Reader inputStream = null;
```

<a id="m-line"></a>
### line

```java
protected int line = null;
```

<a id="m-maxNextCharInd"></a>
### maxNextCharInd

```java
protected int maxNextCharInd = null;
```

<a id="m-nextCharBuf"></a>
### nextCharBuf

```java
protected char[] nextCharBuf = null;
```

<a id="m-nextCharInd"></a>
### nextCharInd

```java
protected int nextCharInd = null;
```

<a id="m-prevCharIsCR"></a>
### prevCharIsCR

```java
protected boolean prevCharIsCR = null;
```

<a id="m-prevCharIsLF"></a>
### prevCharIsLF

```java
protected boolean prevCharIsLF = null;
```

<a id="m-staticFlag"></a>
### staticFlag

```java
public static final boolean staticFlag = false;
```

Whether parser is static.

<a id="m-tabSize"></a>
### tabSize

```java
protected int tabSize = null;
```

<a id="m-tokenBegin"></a>
### tokenBegin

**Package-private**

```java
int tokenBegin = null;
```

<a id="m-trackLineColumn"></a>
### trackLineColumn

```java
protected boolean trackLineColumn = null;
```


## Methods

<a id="m-adjustbeginlinecolumn-c801c3184566"></a>
### adjustBeginLineColumn(int, int)

```java
public void adjustBeginLineColumn(int newLine, int newCol)
```

Method to adjust line and column numbers for the start of a token.

**Parameters**

- `int newLine` - the new line number.
- `int newCol` - the new column number.

<a id="m-adjustbuffsize-1677d88bc028"></a>
### AdjustBuffSize()

```java
protected void AdjustBuffSize()
```

<a id="m-backup-836a66148d50"></a>
### backup(int)

```java
public void backup(int amount)
```

Retreat.

**Parameters**

- `int amount`

<a id="m-begintoken-5ad4afb8570c"></a>
### BeginToken()

```java
public char BeginToken() throws java.io.IOException
```

<a id="m-done-c29e8ae89379"></a>
### Done()

```java
public void Done()
```

Set buffers back to null when finished.

<a id="m-expandbuff-f0e0eea8edf6"></a>
### ExpandBuff(boolean)

```java
protected void ExpandBuff(boolean wrapAround)
```

**Parameters**

- `boolean wrapAround`

<a id="m-fillbuff-55ac2c816918"></a>
### FillBuff()

```java
protected void FillBuff() throws java.io.IOException
```

<a id="m-getbegincolumn-57cc4a053b54"></a>
### getBeginColumn()

```java
public int getBeginColumn()
```

Get the beginning column.

**Returns:** column of token start

<a id="m-getbeginline-ad626ebde8d7"></a>
### getBeginLine()

```java
public int getBeginLine()
```

**Returns:** line number of token start

<a id="m-getcolumn-d5f8434d3d26"></a>
### getColumn()

```java
public int getColumn()
```

<a id="m-getendcolumn-c6e9f843adab"></a>
### getEndColumn()

```java
public int getEndColumn()
```

Get end column.

**Returns:** the end column or -1

<a id="m-getendline-68fe642cd927"></a>
### getEndLine()

```java
public int getEndLine()
```

Get end line.

**Returns:** the end line number or -1

<a id="m-getimage-0197a5c17d27"></a>
### GetImage()

```java
public String GetImage()
```

Get the token timage.

**Returns:** token image as String

<a id="m-getline-6cb6167e418b"></a>
### getLine()

```java
public int getLine()
```

<a id="m-getsuffix-7b3a8af159d6"></a>
### GetSuffix(int)

```java
public char[] GetSuffix(int len)
```

Get the suffix as an array of characters.

**Parameters**

- `int len` - the length of the array to return.

**Returns:** suffix

<a id="m-gettabsize-078d32ef6745"></a>
### getTabSize()

```java
public int getTabSize()
```

<a id="m-gettracklinecolumn-a0b86e838bf8"></a>
### getTrackLineColumn()

**Package-private**

```java
boolean getTrackLineColumn()
```

<a id="m-hexval-e1e2757cc157"></a>
### hexval(char)

**Package-private**

```java
static final int hexval(char c) throws java.io.IOException
```

**Parameters**

- `char c`

<a id="m-readbyte-767d1ca98b33"></a>
### ReadByte()

```java
protected char ReadByte() throws java.io.IOException
```

<a id="m-readchar-a461864752cb"></a>
### readChar()

```java
public char readChar() throws java.io.IOException
```

<a id="m-reinit-e03395a4a4ba"></a>
### ReInit(InputStream)

```java
public void ReInit(java.io.InputStream dstream)
```

Reinitialise.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.

<a id="m-reinit-da459bea1274"></a>
### ReInit(InputStream, int, int)

```java
public void ReInit(java.io.InputStream dstream, int startline, int startcolumn)
```

Reinitialise.

**Parameters**

- `java.io.InputStream dstream` - the underlying data source.
- `int startline` - line number of the first character of the stream, mostly for error messages.
- `int startcolumn` - column number of the first character of the stream.

<a id="m-reinit-2194eb0cc2c1"></a>
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

<a id="m-reinit-330085293cfa"></a>
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

<a id="m-reinit-93d364214350"></a>
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

<a id="m-reinit-47e847ed6762"></a>
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

<a id="m-reinit-4ce6f3557028"></a>
### ReInit(Reader)

```java
public void ReInit(java.io.Reader dstream)
```

**Parameters**

- `java.io.Reader dstream`

<a id="m-reinit-ab9e0b4d897b"></a>
### ReInit(Reader, int, int)

```java
public void ReInit(java.io.Reader dstream, int startline, int startcolumn)
```

**Parameters**

- `java.io.Reader dstream`
- `int startline`
- `int startcolumn`

<a id="m-reinit-ec4c242b8fe2"></a>
### ReInit(Reader, int, int, int)

```java
public void ReInit(java.io.Reader dstream, int startline, int startcolumn, int buffersize)
```

**Parameters**

- `java.io.Reader dstream`
- `int startline`
- `int startcolumn`
- `int buffersize`

<a id="m-settabsize-cb0051487f7f"></a>
### setTabSize(int)

```java
public void setTabSize(int i)
```

**Parameters**

- `int i`

<a id="m-settracklinecolumn-5819bc88a9f7"></a>
### setTrackLineColumn(boolean)

**Package-private**

```java
void setTrackLineColumn(boolean tlc)
```

**Parameters**

- `boolean tlc`

<a id="m-updatelinecolumn-16cd5c192e8f"></a>
### UpdateLineColumn(char)

```java
protected void UpdateLineColumn(char c)
```

**Parameters**

- `char c`
