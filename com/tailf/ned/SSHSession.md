# SSHSession <a href="#sshsession-2d9642a66770" id="sshsession-2d9642a66770"></a>

```java
public class com.tailf.ned.SSHSession
    implements com.tailf.ned.CliSession
```

Types: [CliSession](CliSession.md#clisession-1e55c4457237)

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

- [SSHSession\(SSHConnection\)](#sshsession-8292ed2fa199)
- [SSHSession\(SSHConnection, int, NedTracer, NedConnectionBase\)](#sshsession-5bfc258db6fa)
- [SSHSession\(SSHConnection, int, NedTracer, NedConnectionBase, int, int\)](#sshsession-5bbe10e388cd)
- [SSHSession\(SSHConnection, NedTracer, NedConnectionBase\)](#sshsession-fa053fc79631)

**Fields**:

- [readTimeout](#readtimeout-0c3689315cf4)

**Methods**:

- [close\(\)](#close-8107c6dc012b)
- [expect\(Pattern\)](#expect-98936155685a)
- [expect\(Pattern, boolean, int\)](#expect-ae0bda32ace3)
- [expect\(Pattern, boolean, int, NedWorker\)](#expect-7eb828b58e63)
- [expect\(Pattern, NedWorker\)](#expect-a363c018c396)
- [expect\(Pattern\[\]\)](#expect-8149faa90d9d)
- [expect\(Pattern\[\], boolean, int\)](#expect-5cc2e4122c7b)
- [expect\(Pattern\[\], boolean, int, boolean\)](#expect-7b0546ada421)
- [expect\(Pattern\[\], boolean, int, boolean, NedWorker\)](#expect-8367e41003a6)
- [expect\(Pattern\[\], boolean, int, NedWorker\)](#expect-6c58bada9cc6)
- [expect\(Pattern\[\], NedWorker\)](#expect-b0896c6a7b2a)
- [expect\(String\)](#expect-5f5d11ad490b)
- [expect\(String, boolean, boolean, int\)](#expect-b7ee8aa21949)
- [expect\(String, boolean, boolean, int, NedWorker\)](#expect-a44ee9613d91)
- [expect\(String, boolean, int\)](#expect-16cd2f682137)
- [expect\(String, boolean, int, NedWorker\)](#expect-6e2d86346550)
- [expect\(String, int\)](#expect-37295e1967db)
- [expect\(String, int, NedWorker\)](#expect-4ba232d952f7)
- [expect\(String, NedWorker\)](#expect-6426c41e07e7)
- [expect\(String\[\]\)](#expect-740d81a74e4b)
- [expect\(String\[\], boolean, int\)](#expect-f6cb6c02c198)
- [expect\(String\[\], boolean, int, NedWorker\)](#expect-90d4e3ee7ac2)
- [expect\(String\[\], NedWorker\)](#expect-4485477b99db)
- [expectStr\(String, boolean, int\)](#expectstr-a0568beb746e)
- [flush\(\)](#flush-a4d76f158943)
- [getReadTimeout\(\)](#getreadtimeout-640fc089c1de)
- [getSession\(\)](#getsession-d2df47d6a1b6)
- [getSSHConnection\(\)](#getsshconnection-d215c3958a3d)
- [print\(int\)](#print-41f2f1534264)
- [print\(String\)](#print-b202251f9230)
- [println\(int\)](#println-4c26ee676efb)
- [println\(String\)](#println-15aea44318e6)
- [readUntilWouldBlock\(\)](#readuntilwouldblock-a932110e11be)
- [ready\(\)](#ready-92162bd485a2)
- [ready\(int\)](#ready-c585210c0993)
- [serverSideClosed\(\)](#serversideclosed-0dfe26b0733e)
- [setReadTimeout\(int\)](#setreadtimeout-4f6742da7687)
- [setTracer\(NedTracer\)](#settracer-6943f9aadf68)

## Constructors

### SSHSession(SSHConnection) <a href="#sshsession-8292ed2fa199" id="sshsession-8292ed2fa199"></a>

```java
public SSHSession(com.tailf.ned.SSHConnection con) throws java.io.IOException
```

Types: [SSHConnection](SSHConnection.md#sshconnection-b3d3a2094429)

Constructor for SSH session object. This method creates a
 a new SSh channel on top of an existing connection.
 SSHSession objects implement the Transport interface and they
 are passed into the constructor of the NetconfSession class.

**Parameters**

- `com.tailf.ned.SSHConnection con` - an established and authenticated SSH connection

**Throws**

- `IOException`

### SSHSession(SSHConnection, int, NedTracer, NedConnectionBase) <a href="#sshsession-5bfc258db6fa" id="sshsession-5bfc258db6fa"></a>

```java
public SSHSession(
    com.tailf.ned.SSHConnection con,
    int readTimeout,
    com.tailf.ned.NedTracer tracer,
    com.tailf.ned.NedConnectionBase conn
)
    throws java.io.IOException
```

Types: [SSHConnection](SSHConnection.md#sshconnection-b3d3a2094429), [NedTracer](NedTracer.md#nedtracer-f8730263f5f2), [NedConnectionBase](NedConnectionBase.md#nedconnectionbase-3139efb66faf)

Constructor with an extra argument for a readTimeout timer.

**Parameters**

- `com.tailf.ned.SSHConnection con` - an established and authenticated SSH connection
- `int readTimeout` - timeout in milliseconds
- `com.tailf.ned.NedTracer tracer` - Ned Tracer
- `com.tailf.ned.NedConnectionBase conn` - NedConnection object

**Throws**

- `IOException`

### SSHSession(SSHConnection, int, NedTracer, NedConnectionBase, int, int) <a href="#sshsession-5bbe10e388cd" id="sshsession-5bbe10e388cd"></a>

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

Types: [SSHConnection](SSHConnection.md#sshconnection-b3d3a2094429), [NedTracer](NedTracer.md#nedtracer-f8730263f5f2), [NedConnectionBase](NedConnectionBase.md#nedconnectionbase-3139efb66faf)

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

### SSHSession(SSHConnection, NedTracer, NedConnectionBase) <a href="#sshsession-fa053fc79631" id="sshsession-fa053fc79631"></a>

```java
public SSHSession(
    com.tailf.ned.SSHConnection con,
    com.tailf.ned.NedTracer tracer,
    com.tailf.ned.NedConnectionBase conn
)
    throws java.io.IOException
```

Types: [SSHConnection](SSHConnection.md#sshconnection-b3d3a2094429), [NedTracer](NedTracer.md#nedtracer-f8730263f5f2), [NedConnectionBase](NedConnectionBase.md#nedconnectionbase-3139efb66faf)

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

### readTimeout <a href="#readtimeout-0c3689315cf4" id="readtimeout-0c3689315cf4"></a>

```java
protected int readTimeout = null;
```


## Methods

### close() <a href="#close-8107c6dc012b" id="close-8107c6dc012b"></a>

```java
public void close()
```

Closes the SSH connection, including all sessions (only one in
 this case, compared to many in Netconf)

### expect(Pattern) <a href="#expect-98936155685a" id="expect-98936155685a"></a>

```java
public String expect(
    java.util.regex.Pattern p
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern p`

### expect(Pattern, boolean, int) <a href="#expect-ae0bda32ace3" id="expect-ae0bda32ace3"></a>

```java
public String expect(
    java.util.regex.Pattern p,
    boolean include,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern p`
- `boolean include`
- `int timeout`

### expect(Pattern, boolean, int, NedWorker) <a href="#expect-7eb828b58e63" id="expect-7eb828b58e63"></a>

```java
public String expect(
    java.util.regex.Pattern p,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern p`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(Pattern, NedWorker) <a href="#expect-a363c018c396" id="expect-a363c018c396"></a>

```java
public String expect(
    java.util.regex.Pattern p,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern p`
- `com.tailf.ned.NedWorker worker`

### expect(Pattern[]) <a href="#expect-8149faa90d9d" id="expect-8149faa90d9d"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern[] p`

### expect(Pattern[], boolean, int) <a href="#expect-5cc2e4122c7b" id="expect-5cc2e4122c7b"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`

### expect(Pattern[], boolean, int, boolean) <a href="#expect-7b0546ada421" id="expect-7b0546ada421"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout,
    boolean full
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `boolean full`

### expect(Pattern[], boolean, int, boolean, NedWorker) <a href="#expect-8367e41003a6" id="expect-8367e41003a6"></a>

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

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [NedWorker](NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `boolean full`
- `com.tailf.ned.NedWorker worker`

### expect(Pattern[], boolean, int, NedWorker) <a href="#expect-6c58bada9cc6" id="expect-6c58bada9cc6"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [NedWorker](NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(Pattern[], NedWorker) <a href="#expect-b0896c6a7b2a" id="expect-b0896c6a7b2a"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [NedWorker](NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern[] p`
- `com.tailf.ned.NedWorker worker`

### expect(String) <a href="#expect-5f5d11ad490b" id="expect-5f5d11ad490b"></a>

```java
public String expect(String str) throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

Read from socket until Pattern is encountered.

**Parameters**

- `String str` - is a regular expression pattern which is match against
 each line read.

**Returns:** the characters read.

### expect(String, boolean, boolean, int) <a href="#expect-b7ee8aa21949" id="expect-b7ee8aa21949"></a>

```java
public String expect(
    String str,
    boolean include,
    boolean full,
    int timeout
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

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

### expect(String, boolean, boolean, int, NedWorker) <a href="#expect-a44ee9613d91" id="expect-a44ee9613d91"></a>

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

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String str`
- `boolean include`
- `boolean full`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(String, boolean, int) <a href="#expect-16cd2f682137" id="expect-16cd2f682137"></a>

```java
public String expect(
    String str,
    boolean include,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

Read from socket until Pattern is encountered.

**Parameters**

- `String str` - is a regular expression pattern which is match against
 each line read.
- `boolean include` - controls if the pattern should be include
 in the returned string or not.
- `int timeout`

**Returns:** the characters read.

### expect(String, boolean, int, NedWorker) <a href="#expect-6e2d86346550" id="expect-6e2d86346550"></a>

```java
public String expect(
    String str,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String str`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(String, int) <a href="#expect-37295e1967db" id="expect-37295e1967db"></a>

```java
public String expect(
    String str,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

Read from socket until Pattern is encountered.

**Parameters**

- `String str` - is a regular expression pattern which is match against
 each line read.
- `int timeout` - indicates the read timeout

**Returns:** the characters read.

### expect(String, int, NedWorker) <a href="#expect-4ba232d952f7" id="expect-4ba232d952f7"></a>

```java
public String expect(
    String str,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String str`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(String, NedWorker) <a href="#expect-6426c41e07e7" id="expect-6426c41e07e7"></a>

```java
public String expect(
    String str,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String str`
- `com.tailf.ned.NedWorker worker`

### expect(String[]) <a href="#expect-740d81a74e4b" id="expect-740d81a74e4b"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    String[] str
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String[] str`

### expect(String[], boolean, int) <a href="#expect-f6cb6c02c198" id="expect-f6cb6c02c198"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    String[] str,
    boolean include,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String[] str`
- `boolean include`
- `int timeout`

### expect(String[], boolean, int, NedWorker) <a href="#expect-90d4e3ee7ac2" id="expect-90d4e3ee7ac2"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    String[] str,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [NedWorker](NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String[] str`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(String[], NedWorker) <a href="#expect-4485477b99db" id="expect-4485477b99db"></a>

```java
public com.tailf.ned.NedExpectResult expect(
    String[] str,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [NedWorker](NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String[] str`
- `com.tailf.ned.NedWorker worker`

### expectStr(String, boolean, int) <a href="#expectstr-a0568beb746e" id="expectstr-a0568beb746e"></a>

```java
public String expectStr(
    String str,
    boolean include,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

Read from socket until Pattern is encountered.

**Parameters**

- `String str` - is a string which is match against each line read.
- `boolean include` - controls if the pattern should be include
 in the returned string or not.
- `int timeout`

**Returns:** the characters read.

### flush() <a href="#flush-a4d76f158943" id="flush-a4d76f158943"></a>

```java
public void flush()
```

Signals that the final chunk of data has be printed to the output
 transport stream. This method furthermore flushes the transport
 output stream buffer.

### getReadTimeout() <a href="#getreadtimeout-640fc089c1de" id="getreadtimeout-640fc089c1de"></a>

```java
public int getReadTimeout()
```

Return the readTimeout value that is used to read data from
 the ssh socket. If a read doesn't complete within the stipulated
 timeout an INMException is thrown *

### getSession() <a href="#getsession-d2df47d6a1b6" id="getsession-d2df47d6a1b6"></a>

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

### getSSHConnection() <a href="#getsshconnection-d215c3958a3d" id="getsshconnection-d215c3958a3d"></a>

```java
public ch.ethz.ssh2.Connection getSSHConnection()
```

Return the underlying ssh connection object

### print(int) <a href="#print-41f2f1534264" id="print-41f2f1534264"></a>

```java
public void print(int iVal)
```

Prints an integer (as text) to the output stream.

**Parameters**

- `int iVal` - Text to send to the stream.

### print(String) <a href="#print-b202251f9230" id="print-b202251f9230"></a>

```java
public void print(String s)
```

Prints text to the output stream.

**Parameters**

- `String s` - Text to send to the stream.

### println(int) <a href="#println-4c26ee676efb" id="println-4c26ee676efb"></a>

```java
public void println(int iVal)
```

Prints an integer (as text) to the output stream.
 A newline char is appended to end of the output stream.

**Parameters**

- `int iVal` - Text to send to the stream.

### println(String) <a href="#println-15aea44318e6" id="println-15aea44318e6"></a>

```java
public void println(String s)
```

Print text to the output stream.
 A newline char is appended to end of the output stream.

**Parameters**

- `String s` - Text to send to the stream.

### readUntilWouldBlock() <a href="#readuntilwouldblock-a932110e11be" id="readuntilwouldblock-a932110e11be"></a>

```java
public int readUntilWouldBlock()
```

If we have readTimeout set, and an outstanding operation was
 timed out - the socket may still be alive.

**Returns:** number of discarded characters

### ready() <a href="#ready-92162bd485a2" id="ready-92162bd485a2"></a>

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

### ready(int) <a href="#ready-c585210c0993" id="ready-c585210c0993"></a>

```java
public boolean ready(int timeout) throws java.io.IOException
```

**Parameters**

- `int timeout`

### serverSideClosed() <a href="#serversideclosed-0dfe26b0733e" id="serversideclosed-0dfe26b0733e"></a>

```java
public boolean serverSideClosed()
```

given a live SSHSession, check if the server side has
 closed it's end of the ssh socket

### setReadTimeout(int) <a href="#setreadtimeout-4f6742da7687" id="setreadtimeout-4f6742da7687"></a>

```java
public void setReadTimeout(int readTimeout)
```

Set the read timeout

**Parameters**

- `int readTimeout` - timeout in milliseconds
 The readTimeout parameter affects all read operations. If a timeout
 is reached, an INMException is thrown. The socket is not closed.

### setTracer(NedTracer) <a href="#settracer-6943f9aadf68" id="settracer-6943f9aadf68"></a>

```java
public void setTracer(com.tailf.ned.NedTracer tracer)
```

Types: [NedTracer](NedTracer.md#nedtracer-f8730263f5f2)

**Parameters**

- `com.tailf.ned.NedTracer tracer`
