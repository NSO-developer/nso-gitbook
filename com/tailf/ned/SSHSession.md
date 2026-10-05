<a id="cls-SSHSession"></a>
# SSHSession

```java
public class com.tailf.ned.SSHSession
    implements com.tailf.ned.CliSession
```

Types: [CliSession](CliSession.md#cls-CliSession)

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

- [SSHSession(SSHConnection)](#m-sshsession-8292ed2fa199)
- [SSHSession(SSHConnection, int, NedTracer, NedConnectionBase)](#m-sshsession-5bfc258db6fa)
- [SSHSession(SSHConnection, int, NedTracer, NedConnectionBase, int, int)](#m-sshsession-5bbe10e388cd)
- [SSHSession(SSHConnection, NedTracer, NedConnectionBase)](#m-sshsession-fa053fc79631)

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
- [expectStr(String, boolean, int)](#m-expectstr-a0568beb746e)
- [flush()](#m-flush-a4d76f158943)
- [getReadTimeout()](#m-getreadtimeout-640fc089c1de)
- [getSession()](#m-getsession-d2df47d6a1b6)
- [getSSHConnection()](#m-getsshconnection-d215c3958a3d)
- [print(int)](#m-print-41f2f1534264)
- [print(String)](#m-print-b202251f9230)
- [println(int)](#m-println-4c26ee676efb)
- [println(String)](#m-println-15aea44318e6)
- [readUntilWouldBlock()](#m-readuntilwouldblock-a932110e11be)
- [ready()](#m-ready-92162bd485a2)
- [ready(int)](#m-ready-c585210c0993)
- [serverSideClosed()](#m-serversideclosed-0dfe26b0733e)
- [setReadTimeout(int)](#m-setreadtimeout-4f6742da7687)
- [setTracer(NedTracer)](#m-settracer-6943f9aadf68)

## Constructors

<a id="m-sshsession-8292ed2fa199"></a>
### SSHSession(SSHConnection)

```java
public SSHSession(com.tailf.ned.SSHConnection con) throws java.io.IOException
```

Types: [SSHConnection](SSHConnection.md#cls-SSHConnection)

Constructor for SSH session object. This method creates a
 a new SSh channel on top of an existing connection.
 SSHSession objects implement the Transport interface and they
 are passed into the constructor of the NetconfSession class.

**Parameters**

- `com.tailf.ned.SSHConnection con` - an established and authenticated SSH connection

**Throws**

- `IOException`

<a id="m-sshsession-5bfc258db6fa"></a>
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

Types: [SSHConnection](SSHConnection.md#cls-SSHConnection), [NedTracer](NedTracer.md#cls-NedTracer), [NedConnectionBase](NedConnectionBase.md#cls-NedConnectionBase)

Constructor with an extra argument for a readTimeout timer.

**Parameters**

- `com.tailf.ned.SSHConnection con` - an established and authenticated SSH connection
- `int readTimeout` - timeout in milliseconds
- `com.tailf.ned.NedTracer tracer` - Ned Tracer
- `com.tailf.ned.NedConnectionBase conn` - NedConnection object

**Throws**

- `IOException`

<a id="m-sshsession-5bbe10e388cd"></a>
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

Types: [SSHConnection](SSHConnection.md#cls-SSHConnection), [NedTracer](NedTracer.md#cls-NedTracer), [NedConnectionBase](NedConnectionBase.md#cls-NedConnectionBase)

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

<a id="m-sshsession-fa053fc79631"></a>
### SSHSession(SSHConnection, NedTracer, NedConnectionBase)

```java
public SSHSession(
    com.tailf.ned.SSHConnection con,
    com.tailf.ned.NedTracer tracer,
    com.tailf.ned.NedConnectionBase conn
)
    throws java.io.IOException
```

Types: [SSHConnection](SSHConnection.md#cls-SSHConnection), [NedTracer](NedTracer.md#cls-NedTracer), [NedConnectionBase](NedConnectionBase.md#cls-NedConnectionBase)

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

Closes the SSH connection, including all sessions (only one in
 this case, compared to many in Netconf)

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
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

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
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

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
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

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
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

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
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [NedWorker](NedWorker.md#cls-NedWorker), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

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
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [NedWorker](NedWorker.md#cls-NedWorker), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

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
public String expect(String str) throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

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
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

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
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String str`
- `boolean include`
- `boolean full`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="m-expect-16cd2f682137"></a>
### expect(String, boolean, int)

```java
public String expect(
    String str,
    boolean include,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

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
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String str`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="m-expect-37295e1967db"></a>
### expect(String, int)

```java
public String expect(
    String str,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

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
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String str`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="m-expect-6426c41e07e7"></a>
### expect(String, NedWorker)

```java
public String expect(
    String str,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String str`
- `com.tailf.ned.NedWorker worker`

<a id="m-expect-740d81a74e4b"></a>
### expect(String[])

```java
public com.tailf.ned.NedExpectResult expect(
    String[] str
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

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
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

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
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [NedWorker](NedWorker.md#cls-NedWorker), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

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
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [NedWorker](NedWorker.md#cls-NedWorker), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String[] str`
- `com.tailf.ned.NedWorker worker`

<a id="m-expectstr-a0568beb746e"></a>
### expectStr(String, boolean, int)

```java
public String expectStr(
    String str,
    boolean include,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

Read from socket until Pattern is encountered.

**Parameters**

- `String str` - is a string which is match against each line read.
- `boolean include` - controls if the pattern should be include
 in the returned string or not.
- `int timeout`

**Returns:** the characters read.

<a id="m-flush-a4d76f158943"></a>
### flush()

```java
public void flush()
```

Signals that the final chunk of data has be printed to the output
 transport stream. This method furthermore flushes the transport
 output stream buffer.

<a id="m-getreadtimeout-640fc089c1de"></a>
### getReadTimeout()

```java
public int getReadTimeout()
```

Return the readTimeout value that is used to read data from
 the ssh socket. If a read doesn't complete within the stipulated
 timeout an INMException is thrown *

<a id="m-getsession-d2df47d6a1b6"></a>
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

<a id="m-getsshconnection-d215c3958a3d"></a>
### getSSHConnection()

```java
public ch.ethz.ssh2.Connection getSSHConnection()
```

Return the underlying ssh connection object

<a id="m-print-41f2f1534264"></a>
### print(int)

```java
public void print(int iVal)
```

Prints an integer (as text) to the output stream.

**Parameters**

- `int iVal` - Text to send to the stream.

<a id="m-print-b202251f9230"></a>
### print(String)

```java
public void print(String s)
```

Prints text to the output stream.

**Parameters**

- `String s` - Text to send to the stream.

<a id="m-println-4c26ee676efb"></a>
### println(int)

```java
public void println(int iVal)
```

Prints an integer (as text) to the output stream.
 A newline char is appended to end of the output stream.

**Parameters**

- `int iVal` - Text to send to the stream.

<a id="m-println-15aea44318e6"></a>
### println(String)

```java
public void println(String s)
```

Print text to the output stream.
 A newline char is appended to end of the output stream.

**Parameters**

- `String s` - Text to send to the stream.

<a id="m-readuntilwouldblock-a932110e11be"></a>
### readUntilWouldBlock()

```java
public int readUntilWouldBlock()
```

If we have readTimeout set, and an outstanding operation was
 timed out - the socket may still be alive.

**Returns:** number of discarded characters

<a id="m-ready-92162bd485a2"></a>
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

given a live SSHSession, check if the server side has
 closed it's end of the ssh socket

<a id="m-setreadtimeout-4f6742da7687"></a>
### setReadTimeout(int)

```java
public void setReadTimeout(int readTimeout)
```

Set the read timeout

**Parameters**

- `int readTimeout` - timeout in milliseconds
 The readTimeout parameter affects all read operations. If a timeout
 is reached, an INMException is thrown. The socket is not closed.

<a id="m-settracer-6943f9aadf68"></a>
### setTracer(NedTracer)

```java
public void setTracer(com.tailf.ned.NedTracer tracer)
```

Types: [NedTracer](NedTracer.md#cls-NedTracer)

**Parameters**

- `com.tailf.ned.NedTracer tracer`
