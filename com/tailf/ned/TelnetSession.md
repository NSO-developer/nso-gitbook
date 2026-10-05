# TelnetSession <a href="#cls-TelnetSession" id="cls-TelnetSession"></a>

```java
public class com.tailf.ned.TelnetSession
    implements com.tailf.ned.CliSession
```

Types: [CliSession](CliSession.md#cls-CliSession)

A telnet  transport.
 Example:


```
 TelnetSession c = new TelnetSession("127.0.0.1", 23);
```

## Members

**Constructors**:

- [TelnetSession(NedWorker)](#m-TelnetSession-d3b2dd744527)
- [TelnetSession(NedWorker, int, NedTracer, NedConnectionBase)](#m-TelnetSession-21f327968cad)
- [TelnetSession(NedWorker, NedTracer, NedConnectionBase)](#m-TelnetSession-caa93be5f9d7)
- [TelnetSession(NedWorker, String, int, NedTracer, NedConnectionBase)](#m-TelnetSession-3ec47bd8b865)

**Fields**:

- [readTimeout](#m-readTimeout)

**Methods**:

- [close()](#m-close-8107c6dc012b)
- [expect(Pattern)](#m-expect-98936155685a)
- [expect(Pattern, boolean, int)](#m-expect-ae0bda32ace3)
- [expect(Pattern, boolean, int, NedWorker)](#m-expect-7eb828b58e63)
- [expect(Pattern, NedWorker)](#m-expect-a363c018c396)
- [expect(Pattern[])](#m-expect-8149faa90d9d)
- [expect(Pattern[], boolean, int)](#m-expect-5cc2e4122c7b)
- [expect(Pattern[], boolean, int, boolean)](#m-expect-7b0546ada421)
- [expect(Pattern[], boolean, int, boolean, NedWorker)](#m-expect-8367e41003a6)
- [expect(Pattern[], boolean, int, NedWorker)](#m-expect-6c58bada9cc6)
- [expect(Pattern[], NedWorker)](#m-expect-b0896c6a7b2a)
- [expect(String)](#m-expect-5f5d11ad490b)
- [expect(String, boolean, boolean, int)](#m-expect-b7ee8aa21949)
- [expect(String, boolean, boolean, int, NedWorker)](#m-expect-a44ee9613d91)
- [expect(String, boolean, int)](#m-expect-16cd2f682137)
- [expect(String, boolean, int, NedWorker)](#m-expect-6e2d86346550)
- [expect(String, int)](#m-expect-37295e1967db)
- [expect(String, int, NedWorker)](#m-expect-4ba232d952f7)
- [expect(String, NedWorker)](#m-expect-6426c41e07e7)
- [expect(String[])](#m-expect-740d81a74e4b)
- [expect(String[], boolean, int)](#m-expect-f6cb6c02c198)
- [expect(String[], boolean, int, NedWorker)](#m-expect-90d4e3ee7ac2)
- [expect(String[], NedWorker)](#m-expect-4485477b99db)
- [flush()](#m-flush-a4d76f158943)
- [getSocket()](#m-getSocket-d7da2de81b81)
- [print(String)](#m-print-b202251f9230)
- [println(String)](#m-println-15aea44318e6)
- [ready()](#m-ready-92162bd485a2)
- [ready(int)](#m-ready-c585210c0993)
- [serverSideClosed()](#m-serverSideClosed-0dfe26b0733e)
- [setScreenSize(int, int)](#m-setScreenSize-cb107ae34294)
- [setTracer(NedTracer)](#m-setTracer-6943f9aadf68)
- [write(String)](#m-write-65e1fbc7c416)

## Constructors

### TelnetSession(NedWorker) <a href="#m-TelnetSession-d3b2dd744527" id="m-TelnetSession-d3b2dd744527"></a>

```java
public TelnetSession(com.tailf.ned.NedWorker worker) throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

Constructor for Telnet session object. This method creates a
 a new telnet session on top of an existing connection.
 Telnet objects implement the Transport interface and they
 are passed into the constructor of the NetconfSession class.

**Parameters**

- `com.tailf.ned.NedWorker worker` - current NedWorker object

**Throws**

- `IOException`

### TelnetSession(NedWorker, int, NedTracer, NedConnectionBase) <a href="#m-TelnetSession-21f327968cad" id="m-TelnetSession-21f327968cad"></a>

```java
public TelnetSession(
    com.tailf.ned.NedWorker worker,
    int readTimeout,
    com.tailf.ned.NedTracer tracer,
    com.tailf.ned.NedConnectionBase conn
)
    throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [NedTracer](NedTracer.md#cls-NedTracer), [NedConnectionBase](NedConnectionBase.md#cls-NedConnectionBase)

Constructor with an extra argument for a readTimeout timer.

**Parameters**

- `com.tailf.ned.NedWorker worker` - current NedWorker object
- `int readTimeout` - timeout in milliseconds
- `com.tailf.ned.NedTracer tracer` - Ned tracer
- `com.tailf.ned.NedConnectionBase conn` - NedConnection object

**Throws**

- `IOException`

### TelnetSession(NedWorker, NedTracer, NedConnectionBase) <a href="#m-TelnetSession-caa93be5f9d7" id="m-TelnetSession-caa93be5f9d7"></a>

```java
public TelnetSession(
    com.tailf.ned.NedWorker worker,
    com.tailf.ned.NedTracer tracer,
    com.tailf.ned.NedConnectionBase conn
)
    throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [NedTracer](NedTracer.md#cls-NedTracer), [NedConnectionBase](NedConnectionBase.md#cls-NedConnectionBase)

Constructor for Telnet session object. This method creates a
 a new telnet connection.

**Parameters**

- `com.tailf.ned.NedWorker worker` - current NedWorker object
- `com.tailf.ned.NedTracer tracer` - Ned tracer
- `com.tailf.ned.NedConnectionBase conn` - NedConnection object

**Throws**

- `IOException`

### TelnetSession(NedWorker, String, int, NedTracer, NedConnectionBase) <a href="#m-TelnetSession-3ec47bd8b865" id="m-TelnetSession-3ec47bd8b865"></a>

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

Types: [NedWorker](NedWorker.md#cls-NedWorker), [NedTracer](NedTracer.md#cls-NedTracer), [NedConnectionBase](NedConnectionBase.md#cls-NedConnectionBase)

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

### readTimeout <a href="#m-readTimeout" id="m-readTimeout"></a>

```java
protected int readTimeout = null;
```


## Methods

### close() <a href="#m-close-8107c6dc012b" id="m-close-8107c6dc012b"></a>

```java
public void close()
```

### expect(Pattern) <a href="#m-expect-98936155685a" id="m-expect-98936155685a"></a>

```java
public String expect(
    java.util.regex.Pattern p
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern p`

### expect(Pattern, boolean, int) <a href="#m-expect-ae0bda32ace3" id="m-expect-ae0bda32ace3"></a>

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

### expect(Pattern, boolean, int, NedWorker) <a href="#m-expect-7eb828b58e63" id="m-expect-7eb828b58e63"></a>

```java
public String expect(
    java.util.regex.Pattern p,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `java.util.regex.Pattern p`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(Pattern, NedWorker) <a href="#m-expect-a363c018c396" id="m-expect-a363c018c396"></a>

```java
public String expect(
    java.util.regex.Pattern p,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern p`
- `com.tailf.ned.NedWorker worker`

### expect(Pattern[]) <a href="#m-expect-8149faa90d9d" id="m-expect-8149faa90d9d"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`

### expect(Pattern[], boolean, int) <a href="#m-expect-5cc2e4122c7b" id="m-expect-5cc2e4122c7b"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout
)
    throws java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`

### expect(Pattern[], boolean, int, boolean) <a href="#m-expect-7b0546ada421" id="m-expect-7b0546ada421"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout,
    boolean full
)
    throws java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `boolean full`

### expect(Pattern[], boolean, int, boolean, NedWorker) <a href="#m-expect-8367e41003a6" id="m-expect-8367e41003a6"></a>

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

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `boolean full`
- `com.tailf.ned.NedWorker worker`

### expect(Pattern[], boolean, int, NedWorker) <a href="#m-expect-6c58bada9cc6" id="m-expect-6c58bada9cc6"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(Pattern[], NedWorker) <a href="#m-expect-b0896c6a7b2a" id="m-expect-b0896c6a7b2a"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [NedWorker](NedWorker.md#cls-NedWorker), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`
- `com.tailf.ned.NedWorker worker`

### expect(String) <a href="#m-expect-5f5d11ad490b" id="m-expect-5f5d11ad490b"></a>

```java
public String expect(String str) throws java.io.IOException
```

Read from socket until Pattern is encountered.

**Parameters**

- `String str` - is a regular expression pattern which is match against
 each line read.

**Returns:** the characters read.

### expect(String, boolean, boolean, int) <a href="#m-expect-b7ee8aa21949" id="m-expect-b7ee8aa21949"></a>

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

### expect(String, boolean, boolean, int, NedWorker) <a href="#m-expect-a44ee9613d91" id="m-expect-a44ee9613d91"></a>

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

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `String str`
- `boolean include`
- `boolean full`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(String, boolean, int) <a href="#m-expect-16cd2f682137" id="m-expect-16cd2f682137"></a>

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

### expect(String, boolean, int, NedWorker) <a href="#m-expect-6e2d86346550" id="m-expect-6e2d86346550"></a>

```java
public String expect(
    String str,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `String str`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(String, int) <a href="#m-expect-37295e1967db" id="m-expect-37295e1967db"></a>

```java
public String expect(String str, int timeout) throws java.io.IOException
```

Read from socket until Pattern is encountered.

**Parameters**

- `String str` - is a regular expression pattern which is match against
 each line read.
- `int timeout` - indicates the read timeout

**Returns:** the characters read.

### expect(String, int, NedWorker) <a href="#m-expect-4ba232d952f7" id="m-expect-4ba232d952f7"></a>

```java
public String expect(
    String str,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `String str`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(String, NedWorker) <a href="#m-expect-6426c41e07e7" id="m-expect-6426c41e07e7"></a>

```java
public String expect(String str, com.tailf.ned.NedWorker worker) throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `String str`
- `com.tailf.ned.NedWorker worker`

### expect(String[]) <a href="#m-expect-740d81a74e4b" id="m-expect-740d81a74e4b"></a>

```java
public com.tailf.ned.NedExpectResult expect(String[] str) throws java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult)

**Parameters**

- `String[] str`

### expect(String[], boolean, int) <a href="#m-expect-f6cb6c02c198" id="m-expect-f6cb6c02c198"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    String[] str,
    boolean include,
    int timeout
)
    throws java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult)

**Parameters**

- `String[] str`
- `boolean include`
- `int timeout`

### expect(String[], boolean, int, NedWorker) <a href="#m-expect-90d4e3ee7ac2" id="m-expect-90d4e3ee7ac2"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    String[] str,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `String[] str`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(String[], NedWorker) <a href="#m-expect-4485477b99db" id="m-expect-4485477b99db"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    String[] str,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `String[] str`
- `com.tailf.ned.NedWorker worker`

### flush() <a href="#m-flush-a4d76f158943" id="m-flush-a4d76f158943"></a>

```java
public void flush() throws java.io.IOException
```

Signals that the final chunk of data has be printed to the output
 transport stream. This method furthermore flushes the transport
 output stream buffer.

### getSocket() <a href="#m-getSocket-d7da2de81b81" id="m-getSocket-d7da2de81b81"></a>

```java
public java.net.Socket getSocket()
```

Needed by users that need to monitor a socket for EOF .
 This will return the underlying socket object.

### print(String) <a href="#m-print-b202251f9230" id="m-print-b202251f9230"></a>

```java
public void print(String s) throws java.io.IOException
```

Prints text to the output stream.

**Parameters**

- `String s` - Text to send to the stream.

### println(String) <a href="#m-println-15aea44318e6" id="m-println-15aea44318e6"></a>

```java
public void println(String s) throws java.io.IOException
```

Print text to the output stream.
 A newline char is appended to end of the output stream.

**Parameters**

- `String s` - Text to send to the stream.

### ready() <a href="#m-ready-92162bd485a2" id="m-ready-92162bd485a2"></a>

```java
public boolean ready() throws java.io.IOException
```

Tell whether this transport is ready to be read.

**Returns:** true if there is something to read, false otherwise.
 This function can typically be used to poll a socket and see
 there is data to be read.
 Note that this method does not detect that the socket is in half-closed
 state and in such case will return false after timeout.

### ready(int) <a href="#m-ready-c585210c0993" id="m-ready-c585210c0993"></a>

```java
public boolean ready(int timeout) throws java.io.IOException
```

**Parameters**

- `int timeout`

### serverSideClosed() <a href="#m-serverSideClosed-0dfe26b0733e" id="m-serverSideClosed-0dfe26b0733e"></a>

```java
public boolean serverSideClosed()
```

given a live session, check if the server side has
 closed it's end of the socket.
 Note that it does not detect that the socket in half-closed state.

### setScreenSize(int, int) <a href="#m-setScreenSize-cb107ae34294" id="m-setScreenSize-cb107ae34294"></a>

```java
public void setScreenSize(int width, int length) throws java.io.IOException
```

**Parameters**

- `int width`
- `int length`

### setTracer(NedTracer) <a href="#m-setTracer-6943f9aadf68" id="m-setTracer-6943f9aadf68"></a>

```java
public void setTracer(com.tailf.ned.NedTracer tracer)
```

Types: [NedTracer](NedTracer.md#cls-NedTracer)

**Parameters**

- `com.tailf.ned.NedTracer tracer`

### write(String) <a href="#m-write-65e1fbc7c416" id="m-write-65e1fbc7c416"></a>

```java
public void write(String s) throws java.io.IOException
```

**Parameters**

- `String s`
