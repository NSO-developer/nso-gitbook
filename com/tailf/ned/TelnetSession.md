<a id="s-TelnetSession"></a>
# TelnetSession

```java
public class com.tailf.ned.TelnetSession
    implements com.tailf.ned.CliSession
```

Types: [CliSession](CliSession.md#s-CliSession)

A telnet  transport.
 Example:


```
 TelnetSession c = new TelnetSession("127.0.0.1", 23);
```

## Members

**Constructors**:

- [TelnetSession(NedWorker)](#s-TelnetSession-1)
- [TelnetSession(NedWorker, int, NedTracer, NedConnectionBase)](#s-TelnetSession-2)
- [TelnetSession(NedWorker, NedTracer, NedConnectionBase)](#s-TelnetSession-3)
- [TelnetSession(NedWorker, String, int, NedTracer, NedConnectionBase)](#s-TelnetSession-4)

**Fields**:

- [readTimeout](#s-readTimeout)

**Methods**:

- [close()](#s-close)
- [expect(Pattern)](#s-expect)
- [expect(Pattern, boolean, int)](#s-expect-1)
- [expect(Pattern, boolean, int, NedWorker)](#s-expect-2)
- [expect(Pattern, NedWorker)](#s-expect-3)
- [expect(Pattern[])](#s-expect-4)
- [expect(Pattern[], boolean, int)](#s-expect-5)
- [expect(Pattern[], boolean, int, boolean)](#s-expect-6)
- [expect(Pattern[], boolean, int, boolean, NedWorker)](#s-expect-7)
- [expect(Pattern[], boolean, int, NedWorker)](#s-expect-8)
- [expect(Pattern[], NedWorker)](#s-expect-9)
- [expect(String)](#s-expect-10)
- [expect(String, boolean, boolean, int)](#s-expect-11)
- [expect(String, boolean, boolean, int, NedWorker)](#s-expect-12)
- [expect(String, boolean, int)](#s-expect-13)
- [expect(String, boolean, int, NedWorker)](#s-expect-14)
- [expect(String, int)](#s-expect-15)
- [expect(String, int, NedWorker)](#s-expect-16)
- [expect(String, NedWorker)](#s-expect-17)
- [expect(String[])](#s-expect-18)
- [expect(String[], boolean, int)](#s-expect-19)
- [expect(String[], boolean, int, NedWorker)](#s-expect-20)
- [expect(String[], NedWorker)](#s-expect-21)
- [flush()](#s-flush)
- [getSocket()](#s-getSocket)
- [print(String)](#s-print)
- [println(String)](#s-println)
- [ready()](#s-ready)
- [ready(int)](#s-ready-1)
- [serverSideClosed()](#s-serverSideClosed)
- [setScreenSize(int, int)](#s-setScreenSize)
- [setTracer(NedTracer)](#s-setTracer)
- [write(String)](#s-write)

## Constructors

<a id="s-TelnetSession-1"></a>
### TelnetSession(NedWorker)

```java
public TelnetSession(com.tailf.ned.NedWorker worker) throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

Constructor for Telnet session object. This method creates a
 a new telnet session on top of an existing connection.
 Telnet objects implement the Transport interface and they
 are passed into the constructor of the NetconfSession class.

**Parameters**

- `com.tailf.ned.NedWorker worker` - current NedWorker object

**Throws**

- `IOException`

<a id="s-TelnetSession-2"></a>
### TelnetSession(NedWorker, int, NedTracer, NedConnectionBase)

```java
public TelnetSession(
    com.tailf.ned.NedWorker worker,
    int readTimeout,
    com.tailf.ned.NedTracer tracer,
    com.tailf.ned.NedConnectionBase conn
)
    throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#s-NedWorker), [NedTracer](NedTracer.md#s-NedTracer), [NedConnectionBase](NedConnectionBase.md#s-NedConnectionBase)

Constructor with an extra argument for a readTimeout timer.

**Parameters**

- `com.tailf.ned.NedWorker worker` - current NedWorker object
- `int readTimeout` - timeout in milliseconds
- `com.tailf.ned.NedTracer tracer` - Ned tracer
- `com.tailf.ned.NedConnectionBase conn` - NedConnection object

**Throws**

- `IOException`

<a id="s-TelnetSession-3"></a>
### TelnetSession(NedWorker, NedTracer, NedConnectionBase)

```java
public TelnetSession(
    com.tailf.ned.NedWorker worker,
    com.tailf.ned.NedTracer tracer,
    com.tailf.ned.NedConnectionBase conn
)
    throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#s-NedWorker), [NedTracer](NedTracer.md#s-NedTracer), [NedConnectionBase](NedConnectionBase.md#s-NedConnectionBase)

Constructor for Telnet session object. This method creates a
 a new telnet connection.

**Parameters**

- `com.tailf.ned.NedWorker worker` - current NedWorker object
- `com.tailf.ned.NedTracer tracer` - Ned tracer
- `com.tailf.ned.NedConnectionBase conn` - NedConnection object

**Throws**

- `IOException`

<a id="s-TelnetSession-4"></a>
### TelnetSession(NedWorker, String, int, NedTracer, NedConnectionBase)

```java
public TelnetSession(
    com.tailf.ned.NedWorker worker,
    String username,
    int readTimeout,
    com.tailf.ned.NedTracer tracer,
    com.tailf.ned.NedConnectionBase conn
)
    throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#s-NedWorker), [NedTracer](NedTracer.md#s-NedTracer), [NedConnectionBase](NedConnectionBase.md#s-NedConnectionBase)

Constructor with extra user name argument.

**Parameters**

- `com.tailf.ned.NedWorker worker` - current NedWorker object
- `String username`
- `int readTimeout` - timeout in milliseconds
- `com.tailf.ned.NedTracer tracer` - Ned tracer
- `com.tailf.ned.NedConnectionBase conn` - NedConnection object

**Throws**

- `IOException`


## Fields

<a id="s-readTimeout"></a>
### readTimeout

```java
protected int readTimeout = null;
```


## Methods

<a id="s-close"></a>
### close()

```java
public void close()
```

<a id="s-expect"></a>
### expect(Pattern)

```java
public String expect(
    java.util.regex.Pattern p
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern p`

<a id="s-expect-1"></a>
### expect(Pattern, boolean, int)

```java
public String expect(
    java.util.regex.Pattern p,
    boolean include,
    int timeout
)
    throws java.io.IOException
```

**Parameters**

- `java.util.regex.Pattern p`
- `boolean include`
- `int timeout`

<a id="s-expect-2"></a>
### expect(Pattern, boolean, int, NedWorker)

```java
public String expect(
    java.util.regex.Pattern p,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

**Parameters**

- `java.util.regex.Pattern p`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-3"></a>
### expect(Pattern, NedWorker)

```java
public String expect(
    java.util.regex.Pattern p,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](NedWorker.md#s-NedWorker), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern p`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-4"></a>
### expect(Pattern[])

```java
public com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`

<a id="s-expect-5"></a>
### expect(Pattern[], boolean, int)

```java
public com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout
)
    throws java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`

<a id="s-expect-6"></a>
### expect(Pattern[], boolean, int, boolean)

```java
public com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout,
    boolean full
)
    throws java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `boolean full`

<a id="s-expect-7"></a>
### expect(Pattern[], boolean, int, boolean, NedWorker)

```java
public com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout,
    boolean full,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult), [NedWorker](NedWorker.md#s-NedWorker)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `boolean full`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-8"></a>
### expect(Pattern[], boolean, int, NedWorker)

```java
public com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult), [NedWorker](NedWorker.md#s-NedWorker)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-9"></a>
### expect(Pattern[], NedWorker)

```java
public com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult), [NedWorker](NedWorker.md#s-NedWorker), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-10"></a>
### expect(String)

```java
public String expect(String str) throws java.io.IOException
```

Read from socket until Pattern is encountered.

**Parameters**

- `String str` - is a regular expression pattern which is match against
 each line read.

**Returns:** the characters read.

<a id="s-expect-11"></a>
### expect(String, boolean, boolean, int)

```java
public String expect(
    String str,
    boolean include,
    boolean full,
    int timeout
)
    throws java.io.IOException
```

Read from socket until Pattern is encountered.

**Parameters**

- `String str` - is a regular expression pattern which is match against
 each line read.
- `boolean include` - controls if the pattern should be include
 in the returned string or not.
- `boolean full` - controls if the pattern should be matched against
 the entire line, or if a positive match is accepted whenever the
 pattern matches any substring on a line.
- `int timeout`

**Returns:** the characters read.

<a id="s-expect-12"></a>
### expect(String, boolean, boolean, int, NedWorker)

```java
public String expect(
    String str,
    boolean include,
    boolean full,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

**Parameters**

- `String str`
- `boolean include`
- `boolean full`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-13"></a>
### expect(String, boolean, int)

```java
public String expect(String str, boolean include, int timeout) throws java.io.IOException
```

Read from socket until Pattern is encountered.

**Parameters**

- `String str` - is a regular expression pattern which is match against
 each line read.
- `boolean include` - controls if the pattern should be include
 in the returned string or not.
- `int timeout`

**Returns:** the characters read.

<a id="s-expect-14"></a>
### expect(String, boolean, int, NedWorker)

```java
public String expect(
    String str,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

**Parameters**

- `String str`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-15"></a>
### expect(String, int)

```java
public String expect(String str, int timeout) throws java.io.IOException
```

Read from socket until Pattern is encountered.

**Parameters**

- `String str` - is a regular expression pattern which is match against
 each line read.
- `int timeout` - indicates the read timeout

**Returns:** the characters read.

<a id="s-expect-16"></a>
### expect(String, int, NedWorker)

```java
public String expect(
    String str,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

**Parameters**

- `String str`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-17"></a>
### expect(String, NedWorker)

```java
public String expect(String str, com.tailf.ned.NedWorker worker) throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

**Parameters**

- `String str`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-18"></a>
### expect(String[])

```java
public com.tailf.ned.NedExpectResult expect(String[] str) throws java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult)

**Parameters**

- `String[] str`

<a id="s-expect-19"></a>
### expect(String[], boolean, int)

```java
public com.tailf.ned.NedExpectResult expect(
    String[] str,
    boolean include,
    int timeout
)
    throws java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult)

**Parameters**

- `String[] str`
- `boolean include`
- `int timeout`

<a id="s-expect-20"></a>
### expect(String[], boolean, int, NedWorker)

```java
public com.tailf.ned.NedExpectResult expect(
    String[] str,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult), [NedWorker](NedWorker.md#s-NedWorker)

**Parameters**

- `String[] str`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-21"></a>
### expect(String[], NedWorker)

```java
public com.tailf.ned.NedExpectResult expect(
    String[] str,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult), [NedWorker](NedWorker.md#s-NedWorker)

**Parameters**

- `String[] str`
- `com.tailf.ned.NedWorker worker`

<a id="s-flush"></a>
### flush()

```java
public void flush() throws java.io.IOException
```

Signals that the final chunk of data has be printed to the output
 transport stream. This method furthermore flushes the transport
 output stream buffer.

<a id="s-getSocket"></a>
### getSocket()

```java
public java.net.Socket getSocket()
```

Needed by users that need to monitor a socket for EOF .
 This will return the underlying socket object.

<a id="s-print"></a>
### print(String)

```java
public void print(String s) throws java.io.IOException
```

Prints text to the output stream.

**Parameters**

- `String s` - Text to send to the stream.

<a id="s-println"></a>
### println(String)

```java
public void println(String s) throws java.io.IOException
```

Print text to the output stream.
 A newline char is appended to end of the output stream.

**Parameters**

- `String s` - Text to send to the stream.

<a id="s-ready"></a>
### ready()

```java
public boolean ready() throws java.io.IOException
```

Tell whether this transport is ready to be read.

**Returns:** true if there is something to read, false otherwise.
 This function can typically be used to poll a socket and see
 there is data to be read.
 Note that this method does not detect that the socket is in half-closed
 state and in such case will return false after timeout.

<a id="s-ready-1"></a>
### ready(int)

```java
public boolean ready(int timeout) throws java.io.IOException
```

**Parameters**

- `int timeout`

<a id="s-serverSideClosed"></a>
### serverSideClosed()

```java
public boolean serverSideClosed()
```

given a live session, check if the server side has
 closed it's end of the socket.
 Note that it does not detect that the socket in half-closed state.

<a id="s-setScreenSize"></a>
### setScreenSize(int, int)

```java
public void setScreenSize(int width, int length) throws java.io.IOException
```

**Parameters**

- `int width`
- `int length`

<a id="s-setTracer"></a>
### setTracer(NedTracer)

```java
public void setTracer(com.tailf.ned.NedTracer tracer)
```

Types: [NedTracer](NedTracer.md#s-NedTracer)

**Parameters**

- `com.tailf.ned.NedTracer tracer`

<a id="s-write"></a>
### write(String)

```java
public void write(String s) throws java.io.IOException
```

**Parameters**

- `String s`
