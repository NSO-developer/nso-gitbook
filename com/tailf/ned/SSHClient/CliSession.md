<a id="cls-CliSession"></a>
# CliSession

```java
public static interface com.tailf.ned.SSHClient.CliSession
    extends com.tailf.ned.CliSession
```

Types: [CliSession](../CliSession.md#cls-CliSession)

The SSH CLI session interface.
 Inherited from the old SSHSession implementation.

## Members

**Fields**:

- [MODE_OCRNL](#m-MODE_OCRNL)
- [MODE_ONLRET](#m-MODE_ONLRET)
- [MODE_ONOCR](#m-MODE_ONOCR)

**Methods**:

- [close()](../CliSession.md#m-close-8107c6dc012b) from CliSession
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
- [getErrorStream()](#m-geterrorstream-8577e8676bda)
- [getInputStream()](#m-getinputstream-cb1d1fa14d56)
- [getLine()](#m-getline-6cb6167e418b)
- [getOutputStream()](#m-getoutputstream-b7e39f99be28)
- [getReader()](#m-getreader-ca9cb7876cc5)
- [getReadTimeout()](#m-getreadtimeout-640fc089c1de)
- [getTermPrintlnMode()](#m-gettermprintlnmode-bbc6ff231fae)
- [getWriter()](#m-getwriter-23ba297ab3e8)
- [logDebug(String)](#m-logdebug-91653b5096b0)
- [logInfo(String)](#m-loginfo-32ae00d19c47)
- [print(int)](#m-print-41f2f1534264)
- [print(String)](#m-print-b202251f9230)
- [println(int)](#m-println-4c26ee676efb)
- [println(String)](#m-println-15aea44318e6)
- [ready()](#m-ready-92162bd485a2)
- [ready(int)](#m-ready-c585210c0993)
- [serverSideClosed()](../CliSession.md#m-serversideclosed-0dfe26b0733e) from CliSession
- [setReadTimeout(int)](#m-setreadtimeout-4f6742da7687)
- [setTermPrintlnMode(String)](#m-settermprintlnmode-36c6657337c2)
- [setTracer(NedTracer)](../CliSession.md#m-settracer-6943f9aadf68) from CliSession
- [trace(String, String)](#m-trace-684478bdb6cc)
- [traceInBufAppend(String)](#m-traceinbufappend-948da59d599a)
- [traceInBufFlush()](#m-traceinbufflush-5f53f59ed390)

## Fields

<a id="m-MODE_OCRNL"></a>
### MODE_OCRNL

```java
public static final String MODE_OCRNL = "ocrnl";
```

Newline modes supported by the CLI session

<a id="m-MODE_ONLRET"></a>
### MODE_ONLRET

```java
public static final String MODE_ONLRET = "onlret";
```

<a id="m-MODE_ONOCR"></a>
### MODE_ONOCR

```java
public static final String MODE_ONOCR = "onocr";
```


## Methods

<a id="m-expect-98936155685a"></a>
### expect(Pattern)

```java
public default String expect(
    java.util.regex.Pattern p
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern p`

<a id="m-expect-ae0bda32ace3"></a>
### expect(Pattern, boolean, int)

```java
public default String expect(
    java.util.regex.Pattern p,
    boolean include,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern p`
- `boolean include`
- `int timeout`

<a id="m-expect-7eb828b58e63"></a>
### expect(Pattern, boolean, int, NedWorker)

```java
public default String expect(
    java.util.regex.Pattern p,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](../NedWorker.md#cls-NedWorker), [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern p`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="m-expect-a363c018c396"></a>
### expect(Pattern, NedWorker)

```java
public default String expect(
    java.util.regex.Pattern p,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](../NedWorker.md#cls-NedWorker), [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern p`
- `com.tailf.ned.NedWorker worker`

<a id="m-expect-8149faa90d9d"></a>
### expect(Pattern[])

```java
public default com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#cls-NedExpectResult), [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`

<a id="m-expect-5cc2e4122c7b"></a>
### expect(Pattern[], boolean, int)

```java
public default com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#cls-NedExpectResult), [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`

<a id="m-expect-7b0546ada421"></a>
### expect(Pattern[], boolean, int, boolean)

```java
public default com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout,
    boolean full
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#cls-NedExpectResult), [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `boolean full`

<a id="m-expect-8367e41003a6"></a>
### expect(Pattern[], boolean, int, boolean, NedWorker)

```java
public default com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout,
    boolean full,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#cls-NedExpectResult), [NedWorker](../NedWorker.md#cls-NedWorker), [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `boolean full`
- `com.tailf.ned.NedWorker worker`

<a id="m-expect-6c58bada9cc6"></a>
### expect(Pattern[], boolean, int, NedWorker)

```java
public default com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#cls-NedExpectResult), [NedWorker](../NedWorker.md#cls-NedWorker), [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="m-expect-b0896c6a7b2a"></a>
### expect(Pattern[], NedWorker)

```java
public default com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#cls-NedExpectResult), [NedWorker](../NedWorker.md#cls-NedWorker), [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`
- `com.tailf.ned.NedWorker worker`

<a id="m-expect-5f5d11ad490b"></a>
### expect(String)

```java
public default String expect(
    String str
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String str`

<a id="m-expect-b7ee8aa21949"></a>
### expect(String, boolean, boolean, int)

```java
public default String expect(
    String str,
    boolean include,
    boolean full,
    int timeout
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String str`
- `boolean include`
- `boolean full`
- `int timeout`

<a id="m-expect-a44ee9613d91"></a>
### expect(String, boolean, boolean, int, NedWorker)

```java
public default String expect(
    String str,
    boolean include,
    boolean full,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](../NedWorker.md#cls-NedWorker), [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String str`
- `boolean include`
- `boolean full`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="m-expect-16cd2f682137"></a>
### expect(String, boolean, int)

```java
public default String expect(
    String str,
    boolean include,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String str`
- `boolean include`
- `int timeout`

<a id="m-expect-6e2d86346550"></a>
### expect(String, boolean, int, NedWorker)

```java
public default String expect(
    String str,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](../NedWorker.md#cls-NedWorker), [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String str`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="m-expect-37295e1967db"></a>
### expect(String, int)

```java
public default String expect(
    String str,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String str`
- `int timeout`

<a id="m-expect-4ba232d952f7"></a>
### expect(String, int, NedWorker)

```java
public default String expect(
    String str,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](../NedWorker.md#cls-NedWorker), [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String str`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="m-expect-6426c41e07e7"></a>
### expect(String, NedWorker)

```java
public default String expect(
    String str,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](../NedWorker.md#cls-NedWorker), [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String str`
- `com.tailf.ned.NedWorker worker`

<a id="m-expect-740d81a74e4b"></a>
### expect(String[])

```java
public default com.tailf.ned.NedExpectResult expect(
    String[] str
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#cls-NedExpectResult), [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String[] str`

<a id="m-expect-f6cb6c02c198"></a>
### expect(String[], boolean, int)

```java
public default com.tailf.ned.NedExpectResult expect(
    String[] str,
    boolean include,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#cls-NedExpectResult), [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String[] str`
- `boolean include`
- `int timeout`

<a id="m-expect-90d4e3ee7ac2"></a>
### expect(String[], boolean, int, NedWorker)

```java
public default com.tailf.ned.NedExpectResult expect(
    String[] str,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#cls-NedExpectResult), [NedWorker](../NedWorker.md#cls-NedWorker), [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String[] str`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="m-expect-4485477b99db"></a>
### expect(String[], NedWorker)

```java
public default com.tailf.ned.NedExpectResult expect(
    String[] str,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#cls-NedExpectResult), [NedWorker](../NedWorker.md#cls-NedWorker), [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String[] str`
- `com.tailf.ned.NedWorker worker`

<a id="m-flush-a4d76f158943"></a>
### flush()

```java
public default void flush()
```

Signals that the final chunk of data has to be printed to the output
 transport stream. This method furthermore flushes the transport
 output stream buffer.

<a id="m-geterrorstream-8577e8676bda"></a>
### getErrorStream()

```java
public abstract java.io.InputStream getErrorStream()
```

<a id="m-getinputstream-cb1d1fa14d56"></a>
### getInputStream()

```java
public abstract java.io.InputStream getInputStream()
```

<a id="m-getline-6cb6167e418b"></a>
### getLine()

```java
public abstract StringBuilder getLine()
```

<a id="m-getoutputstream-b7e39f99be28"></a>
### getOutputStream()

```java
public abstract java.io.OutputStream getOutputStream()
```

<a id="m-getreader-ca9cb7876cc5"></a>
### getReader()

```java
public abstract java.io.BufferedReader getReader()
```

<a id="m-getreadtimeout-640fc089c1de"></a>
### getReadTimeout()

```java
public abstract int getReadTimeout()
```

Interface methods that must be implemented

<a id="m-gettermprintlnmode-bbc6ff231fae"></a>
### getTermPrintlnMode()

```java
public abstract String getTermPrintlnMode()
```

<a id="m-getwriter-23ba297ab3e8"></a>
### getWriter()

```java
public abstract java.io.PrintWriter getWriter()
```

<a id="m-logdebug-91653b5096b0"></a>
### logDebug(String)

```java
public abstract void logDebug(String msg)
```

**Parameters**

- `String msg`

<a id="m-loginfo-32ae00d19c47"></a>
### logInfo(String)

```java
public abstract void logInfo(String msg)
```

**Parameters**

- `String msg`

<a id="m-print-41f2f1534264"></a>
### print(int)

```java
public default void print(int iVal)
```

Prints an integer (as text) to the output stream.

**Parameters**

- `int iVal` - Text to send to the stream.

<a id="m-print-b202251f9230"></a>
### print(String)

```java
public default void print(String s)
```

Prints text to the output stream.

**Parameters**

- `String s` - Text to send to the stream.

<a id="m-println-4c26ee676efb"></a>
### println(int)

```java
public default void println(int iVal)
```

Prints an integer (as text) to the output stream.
 A newline char is appended to end of the output stream.

**Parameters**

- `int iVal` - Text to send to the stream.

<a id="m-println-15aea44318e6"></a>
### println(String)

```java
public default void println(String s)
```

Print text to the output stream.
 A newline char is appended to end of the output stream.

**Parameters**

- `String s` - Text to send to the stream.

<a id="m-ready-92162bd485a2"></a>
### ready()

```java
public default boolean ready() throws java.io.IOException
```

Interface methods with default implementation

<a id="m-ready-c585210c0993"></a>
### ready(int)

```java
public abstract boolean ready(int timeout) throws java.io.IOException
```

**Parameters**

- `int timeout`

<a id="m-setreadtimeout-4f6742da7687"></a>
### setReadTimeout(int)

```java
public abstract void setReadTimeout(int readTimeout)
```

**Parameters**

- `int readTimeout`

<a id="m-settermprintlnmode-36c6657337c2"></a>
### setTermPrintlnMode(String)

```java
public abstract void setTermPrintlnMode(String mode)
```

**Parameters**

- `String mode`

<a id="m-trace-684478bdb6cc"></a>
### trace(String, String)

```java
public abstract void trace(String msg, String direction)
```

**Parameters**

- `String msg`
- `String direction`

<a id="m-traceinbufappend-948da59d599a"></a>
### traceInBufAppend(String)

```java
public abstract void traceInBufAppend(String msg)
```

**Parameters**

- `String msg`

<a id="m-traceinbufflush-5f53f59ed390"></a>
### traceInBufFlush()

```java
public abstract void traceInBufFlush()
```
