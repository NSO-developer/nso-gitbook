<a id="s-SSHSession"></a>
# SSHSession

```java
public class com.tailf.ned.SSHSession
    implements com.tailf.ned.CliSession
```

Types: [CliSession](CliSession.md#s-CliSession)

A SSH  transport.
 This class uses the Ganymed SSH implementation.
 (
     http://www.ganymed.ethz.ch/ssh2/)

 Example:


```
 SSHConnection c = new SSHConnection("127.0.0.1", 22);
 c.authenticateWithPassword("ola", "secret");
 SSHSession ssh = new SSHSession(c);
```

## Members

**Constructors**:

- [SSHSession(SSHConnection)](#s-SSHSession-1)
- [SSHSession(SSHConnection, int, NedTracer, NedConnectionBase)](#s-SSHSession-2)
- [SSHSession(SSHConnection, int, NedTracer, NedConnectionBase, int, int)](#s-SSHSession-3)
- [SSHSession(SSHConnection, NedTracer, NedConnectionBase)](#s-SSHSession-4)

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
- [expectStr(String, boolean, int)](#s-expectStr)
- [flush()](#s-flush)
- [getReadTimeout()](#s-getReadTimeout)
- [getSession()](#s-getSession)
- [getSSHConnection()](#s-getSSHConnection)
- [print(int)](#s-print)
- [print(String)](#s-print-1)
- [println(int)](#s-println)
- [println(String)](#s-println-1)
- [readUntilWouldBlock()](#s-readUntilWouldBlock)
- [ready()](#s-ready)
- [ready(int)](#s-ready-1)
- [serverSideClosed()](#s-serverSideClosed)
- [setReadTimeout(int)](#s-setReadTimeout)
- [setTracer(NedTracer)](#s-setTracer)

## Constructors

<a id="s-SSHSession-1"></a>
### SSHSession(SSHConnection)

```java
public SSHSession(com.tailf.ned.SSHConnection con) throws java.io.IOException
```

Types: [SSHConnection](SSHConnection.md#s-SSHConnection)

Constructor for SSH session object. This method creates a
 a new SSh channel on top of an existing connection.
 SSHSession objects implement the Transport interface and they
 are passed into the constructor of the NetconfSession class.

**Parameters**

- `com.tailf.ned.SSHConnection con` - an established and authenticated SSH connection

**Throws**

- `IOException`

<a id="s-SSHSession-2"></a>
### SSHSession(SSHConnection, int, NedTracer, NedConnectionBase)

```java
public SSHSession(
    com.tailf.ned.SSHConnection con,
    int readTimeout,
    com.tailf.ned.NedTracer tracer,
    com.tailf.ned.NedConnectionBase conn
)
    throws java.io.IOException
```

Types: [SSHConnection](SSHConnection.md#s-SSHConnection), [NedTracer](NedTracer.md#s-NedTracer), [NedConnectionBase](NedConnectionBase.md#s-NedConnectionBase)

Constructor with an extra argument for a readTimeout timer.

**Parameters**

- `com.tailf.ned.SSHConnection con` - an established and authenticated SSH connection
- `int readTimeout` - timeout in milliseconds
- `com.tailf.ned.NedTracer tracer` - Ned Tracer
- `com.tailf.ned.NedConnectionBase conn` - NedConnection object

**Throws**

- `IOException`

<a id="s-SSHSession-3"></a>
### SSHSession(SSHConnection, int, NedTracer, NedConnectionBase, int, int)

```java
public SSHSession(
    com.tailf.ned.SSHConnection con,
    int readTimeout,
    com.tailf.ned.NedTracer tracer,
    com.tailf.ned.NedConnectionBase conn,
    int width,
    int height
)
    throws java.io.IOException
```

Types: [SSHConnection](SSHConnection.md#s-SSHConnection), [NedTracer](NedTracer.md#s-NedTracer), [NedConnectionBase](NedConnectionBase.md#s-NedConnectionBase)

Constructor with extra terminal width and height arguments

**Parameters**

- `com.tailf.ned.SSHConnection con` - an established and authenticated SSH connection
- `int readTimeout` - timeout in milliseconds
- `com.tailf.ned.NedTracer tracer` - Ned Tracer
- `com.tailf.ned.NedConnectionBase conn` - NedConnection object
- `int width` - Terminal width (in characters)
- `int height` - Terminal height (in characters)

**Throws**

- `IOException`

<a id="s-SSHSession-4"></a>
### SSHSession(SSHConnection, NedTracer, NedConnectionBase)

```java
public SSHSession(
    com.tailf.ned.SSHConnection con,
    com.tailf.ned.NedTracer tracer,
    com.tailf.ned.NedConnectionBase conn
)
    throws java.io.IOException
```

Types: [SSHConnection](SSHConnection.md#s-SSHConnection), [NedTracer](NedTracer.md#s-NedTracer), [NedConnectionBase](NedConnectionBase.md#s-NedConnectionBase)

Constructor for SSH session object. This method creates a
 a new SSH channel on top of an existing connection.
 SSHSession objects implement the Transport interface and they
 are passed into the constructor of the NetconfSession class.

**Parameters**

- `com.tailf.ned.SSHConnection con` - an established and authenticated SSH connection
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

Closes the SSH connection, including all sessions (only one in
 this case, compared to many in Netconf)

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
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

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
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](NedWorker.md#s-NedWorker), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

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
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

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
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

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
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult), [NedWorker](NedWorker.md#s-NedWorker), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

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
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult), [NedWorker](NedWorker.md#s-NedWorker), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

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
public String expect(String str) throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

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
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

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
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](NedWorker.md#s-NedWorker), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String str`
- `boolean include`
- `boolean full`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-13"></a>
### expect(String, boolean, int)

```java
public String expect(
    String str,
    boolean include,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

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
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](NedWorker.md#s-NedWorker), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String str`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-15"></a>
### expect(String, int)

```java
public String expect(
    String str,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

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
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](NedWorker.md#s-NedWorker), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String str`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-17"></a>
### expect(String, NedWorker)

```java
public String expect(
    String str,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](NedWorker.md#s-NedWorker), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String str`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-18"></a>
### expect(String[])

```java
public com.tailf.ned.NedExpectResult expect(
    String[] str
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

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
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

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
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult), [NedWorker](NedWorker.md#s-NedWorker), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

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
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult), [NedWorker](NedWorker.md#s-NedWorker), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String[] str`
- `com.tailf.ned.NedWorker worker`

<a id="s-expectStr"></a>
### expectStr(String, boolean, int)

```java
public String expectStr(
    String str,
    boolean include,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

Read from socket until Pattern is encountered.

**Parameters**

- `String str` - is a string which is match against each line read.
- `boolean include` - controls if the pattern should be include
 in the returned string or not.
- `int timeout`

**Returns:** the characters read.

<a id="s-flush"></a>
### flush()

```java
public void flush()
```

Signals that the final chunk of data has be printed to the output
 transport stream. This method furthermore flushes the transport
 output stream buffer.

<a id="s-getReadTimeout"></a>
### getReadTimeout()

```java
public int getReadTimeout()
```

Return the readTimeout value that is used to read data from
 the ssh socket. If a read doesn't complete within the stipulated
 timeout an INMException is thrown *

<a id="s-getSession"></a>
### getSession()

```java
public ch.ethz.ssh2.Session getSession()
```

Needed by users that need to monitor a session for EOF .
 This will return the underlying Ganymed SSH Session object.

 The ganymed Session object has a method waitForCondition()
 that can be used to check the connection state of an ssh socket.
 Assuming a A Session object s:


```
 int conditionSet =
     ChannelCondition.TIMEOUT ;amp
     ChannelCondition.CLOSED ;amp
     ChannelCondition.EOF;
     conditionSet = s.waitForCondition(conditionSet, 1);
  if (conditionSet != ChannelCondition.TIMEOUT) {
      // We know the server closed it's end of the ssh
      // socket
```

<a id="s-getSSHConnection"></a>
### getSSHConnection()

```java
public ch.ethz.ssh2.Connection getSSHConnection()
```

Return the underlying ssh connection object

<a id="s-print"></a>
### print(int)

```java
public void print(int iVal)
```

Prints an integer (as text) to the output stream.

**Parameters**

- `int iVal` - Text to send to the stream.

<a id="s-print-1"></a>
### print(String)

```java
public void print(String s)
```

Prints text to the output stream.

**Parameters**

- `String s` - Text to send to the stream.

<a id="s-println"></a>
### println(int)

```java
public void println(int iVal)
```

Prints an integer (as text) to the output stream.
 A newline char is appended to end of the output stream.

**Parameters**

- `int iVal` - Text to send to the stream.

<a id="s-println-1"></a>
### println(String)

```java
public void println(String s)
```

Print text to the output stream.
 A newline char is appended to end of the output stream.

**Parameters**

- `String s` - Text to send to the stream.

<a id="s-readUntilWouldBlock"></a>
### readUntilWouldBlock()

```java
public int readUntilWouldBlock()
```

If we have readTimeout set, and an outstanding operation was
 timed out - the socket may still be alive.

**Returns:** number of discarded characters

<a id="s-ready"></a>
### ready()

```java
public boolean ready() throws java.io.IOException
```

Tell whether this transport is ready to be read.

**Returns:** true if there is something to read, false otherwise.
 This function can typically be used to poll a socket and see
 there is data to be read. The function will also return true
 if the server side has closed its end of the ssh socket.
 To explicitly just check for that, use the serverSideClosed()
 method.

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

given a live SSHSession, check if the server side has
 closed it's end of the ssh socket

<a id="s-setReadTimeout"></a>
### setReadTimeout(int)

```java
public void setReadTimeout(int readTimeout)
```

Set the read timeout

**Parameters**

- `int readTimeout` - timeout in milliseconds
 The readTimeout parameter affects all read operations. If a timeout
 is reached, an INMException is thrown. The socket is not closed.

<a id="s-setTracer"></a>
### setTracer(NedTracer)

```java
public void setTracer(com.tailf.ned.NedTracer tracer)
```

Types: [NedTracer](NedTracer.md#s-NedTracer)

**Parameters**

- `com.tailf.ned.NedTracer tracer`
