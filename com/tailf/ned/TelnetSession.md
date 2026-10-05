<a id="cls-TelnetSession"></a>
# TelnetSession

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

- [TelnetSession(NedWorker)](#m-telnetsession-d3b2dd744527)
- [TelnetSession(NedWorker, int, NedTracer, NedConnectionBase)](#m-telnetsession-21f327968cad)
- [TelnetSession(NedWorker, NedTracer, NedConnectionBase)](#m-telnetsession-caa93be5f9d7)
- [TelnetSession(NedWorker, String, int, NedTracer, NedConnectionBase)](#m-telnetsession-3ec47bd8b865)

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
- [getSocket()](#m-getsocket-d7da2de81b81)
- [print(String)](#m-print-b202251f9230)
- [println(String)](#m-println-15aea44318e6)
- [ready()](#m-ready-92162bd485a2)
- [ready(int)](#m-ready-c585210c0993)
- [serverSideClosed()](#m-serversideclosed-0dfe26b0733e)
- [setScreenSize(int, int)](#m-setscreensize-cb107ae34294)
- [setTracer(NedTracer)](#m-settracer-6943f9aadf68)
- [write(String)](#m-write-65e1fbc7c416)

## Constructors

<a id="m-telnetsession-d3b2dd744527"></a>
### TelnetSession(NedWorker)

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

<a id="m-telnetsession-21f327968cad"></a>
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

Types: [NedWorker](NedWorker.md#cls-NedWorker), [NedTracer](NedTracer.md#cls-NedTracer), [NedConnectionBase](NedConnectionBase.md#cls-NedConnectionBase)

Constructor with an extra argument for a readTimeout timer.

**Parameters**

- `com.tailf.ned.NedWorker worker` - current NedWorker object
- `int readTimeout` - timeout in milliseconds
- `com.tailf.ned.NedTracer tracer` - Ned tracer
- `com.tailf.ned.NedConnectionBase conn` - NedConnection object

**Throws**

- `IOException`

<a id="m-telnetsession-caa93be5f9d7"></a>
### TelnetSession(NedWorker, NedTracer, NedConnectionBase)

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

<a id="m-telnetsession-3ec47bd8b865"></a>
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

<a id="m-readTimeout"></a>
### readTimeout

```java
protected int readTimeout = null;
```


## Methods

<a id="m-close-8107c6dc012b"></a>
### close()

```java
public void close()
```

<a id="m-expect-98936155685a"></a>
### expect(Pattern)

```java
public String expect(
    java.util.regex.Pattern p
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern p`

<a id="m-expect-ae0bda32ace3"></a>
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

<a id="m-expect-7eb828b58e63"></a>
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

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `java.util.regex.Pattern p`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="m-expect-a363c018c396"></a>
### expect(Pattern, NedWorker)

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

<a id="m-expect-8149faa90d9d"></a>
### expect(Pattern[])

```java
public com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`

<a id="m-expect-5cc2e4122c7b"></a>
### expect(Pattern[], boolean, int)

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

<a id="m-expect-7b0546ada421"></a>
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

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `boolean full`

<a id="m-expect-8367e41003a6"></a>
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

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `boolean full`
- `com.tailf.ned.NedWorker worker`

<a id="m-expect-6c58bada9cc6"></a>
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

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="m-expect-b0896c6a7b2a"></a>
### expect(Pattern[], NedWorker)

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

<a id="m-expect-5f5d11ad490b"></a>
### expect(String)

```java
public String expect(String str) throws java.io.IOException
```

Read from socket until Pattern is encountered.

**Parameters**

- `String str` - is a regular expression pattern which is match against
 each line read.

**Returns:** the characters read.

<a id="m-expect-b7ee8aa21949"></a>
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

<a id="m-expect-a44ee9613d91"></a>
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

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `String str`
- `boolean include`
- `boolean full`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="m-expect-16cd2f682137"></a>
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

<a id="m-expect-6e2d86346550"></a>
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

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `String str`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="m-expect-37295e1967db"></a>
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

<a id="m-expect-4ba232d952f7"></a>
### expect(String, int, NedWorker)

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

<a id="m-expect-6426c41e07e7"></a>
### expect(String, NedWorker)

```java
public String expect(String str, com.tailf.ned.NedWorker worker) throws java.io.IOException
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `String str`
- `com.tailf.ned.NedWorker worker`

<a id="m-expect-740d81a74e4b"></a>
### expect(String[])

```java
public com.tailf.ned.NedExpectResult expect(String[] str) throws java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult)

**Parameters**

- `String[] str`

<a id="m-expect-f6cb6c02c198"></a>
### expect(String[], boolean, int)

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

<a id="m-expect-90d4e3ee7ac2"></a>
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

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `String[] str`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="m-expect-4485477b99db"></a>
### expect(String[], NedWorker)

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

<a id="m-flush-a4d76f158943"></a>
### flush()

```java
public void flush() throws java.io.IOException
```

Signals that the final chunk of data has be printed to the output
 transport stream. This method furthermore flushes the transport
 output stream buffer.

<a id="m-getsocket-d7da2de81b81"></a>
### getSocket()

```java
public java.net.Socket getSocket()
```

Needed by users that need to monitor a socket for EOF .
 This will return the underlying socket object.

<a id="m-print-b202251f9230"></a>
### print(String)

```java
public void print(String s) throws java.io.IOException
```

Prints text to the output stream.

**Parameters**

- `String s` - Text to send to the stream.

<a id="m-println-15aea44318e6"></a>
### println(String)

```java
public void println(String s) throws java.io.IOException
```

Print text to the output stream.
 A newline char is appended to end of the output stream.

**Parameters**

- `String s` - Text to send to the stream.

<a id="m-ready-92162bd485a2"></a>
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

<a id="m-ready-c585210c0993"></a>
### ready(int)

```java
public boolean ready(int timeout) throws java.io.IOException
```

**Parameters**

- `int timeout`

<a id="m-serversideclosed-0dfe26b0733e"></a>
### serverSideClosed()

```java
public boolean serverSideClosed()
```

given a live session, check if the server side has
 closed it's end of the socket.
 Note that it does not detect that the socket in half-closed state.

<a id="m-setscreensize-cb107ae34294"></a>
### setScreenSize(int, int)

```java
public void setScreenSize(int width, int length) throws java.io.IOException
```

**Parameters**

- `int width`
- `int length`

<a id="m-settracer-6943f9aadf68"></a>
### setTracer(NedTracer)

```java
public void setTracer(com.tailf.ned.NedTracer tracer)
```

Types: [NedTracer](NedTracer.md#cls-NedTracer)

**Parameters**

- `com.tailf.ned.NedTracer tracer`

<a id="m-write-65e1fbc7c416"></a>
### write(String)

```java
public void write(String s) throws java.io.IOException
```

**Parameters**

- `String s`
