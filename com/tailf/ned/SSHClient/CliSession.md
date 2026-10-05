<a id="s-CliSession"></a>
# CliSession

```java
public static interface com.tailf.ned.SSHClient.CliSession
    extends com.tailf.ned.CliSession
```

Types: [CliSession](../CliSession.md#s-CliSession)

The SSH CLI session interface.
 Inherited from the old SSHSession implementation.

## Members

**Fields**:

- [MODE_OCRNL](#s-MODE_OCRNL)
- [MODE_ONLRET](#s-MODE_ONLRET)
- [MODE_ONOCR](#s-MODE_ONOCR)

**Methods**:

- [close()](../CliSession.md#s-close) from CliSession
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
- [getErrorStream()](#s-getErrorStream)
- [getInputStream()](#s-getInputStream)
- [getLine()](#s-getLine)
- [getOutputStream()](#s-getOutputStream)
- [getReader()](#s-getReader)
- [getReadTimeout()](#s-getReadTimeout)
- [getTermPrintlnMode()](#s-getTermPrintlnMode)
- [getWriter()](#s-getWriter)
- [logDebug(String)](#s-logDebug)
- [logInfo(String)](#s-logInfo)
- [print(int)](#s-print)
- [print(String)](#s-print-1)
- [println(int)](#s-println)
- [println(String)](#s-println-1)
- [ready()](#s-ready)
- [ready(int)](#s-ready-1)
- [serverSideClosed()](../CliSession.md#s-serverSideClosed) from CliSession
- [setReadTimeout(int)](#s-setReadTimeout)
- [setTermPrintlnMode(String)](#s-setTermPrintlnMode)
- [setTracer(NedTracer)](../CliSession.md#s-setTracer) from CliSession
- [trace(String, String)](#s-trace)
- [traceInBufAppend(String)](#s-traceInBufAppend)
- [traceInBufFlush()](#s-traceInBufFlush)

## Fields

<a id="s-MODE_OCRNL"></a>
### MODE_OCRNL

```java
public static final String MODE_OCRNL = "ocrnl";
```

Newline modes supported by the CLI session

<a id="s-MODE_ONLRET"></a>
### MODE_ONLRET

```java
public static final String MODE_ONLRET = "onlret";
```

<a id="s-MODE_ONOCR"></a>
### MODE_ONOCR

```java
public static final String MODE_ONOCR = "onocr";
```


## Methods

<a id="s-expect"></a>
### expect(Pattern)

```java
public default String expect(
    java.util.regex.Pattern p
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](../SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern p`

<a id="s-expect-1"></a>
### expect(Pattern, boolean, int)

```java
public default String expect(
    java.util.regex.Pattern p,
    boolean include,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](../SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern p`
- `boolean include`
- `int timeout`

<a id="s-expect-2"></a>
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

Types: [NedWorker](../NedWorker.md#s-NedWorker), [SSHSessionException](../SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern p`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-3"></a>
### expect(Pattern, NedWorker)

```java
public default String expect(
    java.util.regex.Pattern p,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](../NedWorker.md#s-NedWorker), [SSHSessionException](../SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern p`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-4"></a>
### expect(Pattern[])

```java
public default com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#s-NedExpectResult), [SSHSessionException](../SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`

<a id="s-expect-5"></a>
### expect(Pattern[], boolean, int)

```java
public default com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#s-NedExpectResult), [SSHSessionException](../SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`

<a id="s-expect-6"></a>
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

Types: [NedExpectResult](../NedExpectResult.md#s-NedExpectResult), [SSHSessionException](../SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `boolean full`

<a id="s-expect-7"></a>
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

Types: [NedExpectResult](../NedExpectResult.md#s-NedExpectResult), [NedWorker](../NedWorker.md#s-NedWorker), [SSHSessionException](../SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `boolean full`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-8"></a>
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

Types: [NedExpectResult](../NedExpectResult.md#s-NedExpectResult), [NedWorker](../NedWorker.md#s-NedWorker), [SSHSessionException](../SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-9"></a>
### expect(Pattern[], NedWorker)

```java
public default com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#s-NedExpectResult), [NedWorker](../NedWorker.md#s-NedWorker), [SSHSessionException](../SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-10"></a>
### expect(String)

```java
public default String expect(
    String str
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](../SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String str`

<a id="s-expect-11"></a>
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

Types: [SSHSessionException](../SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String str`
- `boolean include`
- `boolean full`
- `int timeout`

<a id="s-expect-12"></a>
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

Types: [NedWorker](../NedWorker.md#s-NedWorker), [SSHSessionException](../SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String str`
- `boolean include`
- `boolean full`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-13"></a>
### expect(String, boolean, int)

```java
public default String expect(
    String str,
    boolean include,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](../SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String str`
- `boolean include`
- `int timeout`

<a id="s-expect-14"></a>
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

Types: [NedWorker](../NedWorker.md#s-NedWorker), [SSHSessionException](../SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String str`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-15"></a>
### expect(String, int)

```java
public default String expect(
    String str,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](../SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String str`
- `int timeout`

<a id="s-expect-16"></a>
### expect(String, int, NedWorker)

```java
public default String expect(
    String str,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](../NedWorker.md#s-NedWorker), [SSHSessionException](../SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String str`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-17"></a>
### expect(String, NedWorker)

```java
public default String expect(
    String str,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](../NedWorker.md#s-NedWorker), [SSHSessionException](../SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String str`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-18"></a>
### expect(String[])

```java
public default com.tailf.ned.NedExpectResult expect(
    String[] str
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#s-NedExpectResult), [SSHSessionException](../SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String[] str`

<a id="s-expect-19"></a>
### expect(String[], boolean, int)

```java
public default com.tailf.ned.NedExpectResult expect(
    String[] str,
    boolean include,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#s-NedExpectResult), [SSHSessionException](../SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String[] str`
- `boolean include`
- `int timeout`

<a id="s-expect-20"></a>
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

Types: [NedExpectResult](../NedExpectResult.md#s-NedExpectResult), [NedWorker](../NedWorker.md#s-NedWorker), [SSHSessionException](../SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String[] str`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-21"></a>
### expect(String[], NedWorker)

```java
public default com.tailf.ned.NedExpectResult expect(
    String[] str,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#s-NedExpectResult), [NedWorker](../NedWorker.md#s-NedWorker), [SSHSessionException](../SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String[] str`
- `com.tailf.ned.NedWorker worker`

<a id="s-flush"></a>
### flush()

```java
public default void flush()
```

Signals that the final chunk of data has to be printed to the output
 transport stream. This method furthermore flushes the transport
 output stream buffer.

<a id="s-getErrorStream"></a>
### getErrorStream()

```java
public abstract java.io.InputStream getErrorStream()
```

<a id="s-getInputStream"></a>
### getInputStream()

```java
public abstract java.io.InputStream getInputStream()
```

<a id="s-getLine"></a>
### getLine()

```java
public abstract StringBuilder getLine()
```

<a id="s-getOutputStream"></a>
### getOutputStream()

```java
public abstract java.io.OutputStream getOutputStream()
```

<a id="s-getReader"></a>
### getReader()

```java
public abstract java.io.BufferedReader getReader()
```

<a id="s-getReadTimeout"></a>
### getReadTimeout()

```java
public abstract int getReadTimeout()
```

Interface methods that must be implemented

<a id="s-getTermPrintlnMode"></a>
### getTermPrintlnMode()

```java
public abstract String getTermPrintlnMode()
```

<a id="s-getWriter"></a>
### getWriter()

```java
public abstract java.io.PrintWriter getWriter()
```

<a id="s-logDebug"></a>
### logDebug(String)

```java
public abstract void logDebug(String msg)
```

**Parameters**

- `String msg`

<a id="s-logInfo"></a>
### logInfo(String)

```java
public abstract void logInfo(String msg)
```

**Parameters**

- `String msg`

<a id="s-print"></a>
### print(int)

```java
public default void print(int iVal)
```

Prints an integer (as text) to the output stream.

**Parameters**

- `int iVal` - Text to send to the stream.

<a id="s-print-1"></a>
### print(String)

```java
public default void print(String s)
```

Prints text to the output stream.

**Parameters**

- `String s` - Text to send to the stream.

<a id="s-println"></a>
### println(int)

```java
public default void println(int iVal)
```

Prints an integer (as text) to the output stream.
 A newline char is appended to end of the output stream.

**Parameters**

- `int iVal` - Text to send to the stream.

<a id="s-println-1"></a>
### println(String)

```java
public default void println(String s)
```

Print text to the output stream.
 A newline char is appended to end of the output stream.

**Parameters**

- `String s` - Text to send to the stream.

<a id="s-ready"></a>
### ready()

```java
public default boolean ready() throws java.io.IOException
```

Interface methods with default implementation

<a id="s-ready-1"></a>
### ready(int)

```java
public abstract boolean ready(int timeout) throws java.io.IOException
```

**Parameters**

- `int timeout`

<a id="s-setReadTimeout"></a>
### setReadTimeout(int)

```java
public abstract void setReadTimeout(int readTimeout)
```

**Parameters**

- `int readTimeout`

<a id="s-setTermPrintlnMode"></a>
### setTermPrintlnMode(String)

```java
public abstract void setTermPrintlnMode(String mode)
```

**Parameters**

- `String mode`

<a id="s-trace"></a>
### trace(String, String)

```java
public abstract void trace(String msg, String direction)
```

**Parameters**

- `String msg`
- `String direction`

<a id="s-traceInBufAppend"></a>
### traceInBufAppend(String)

```java
public abstract void traceInBufAppend(String msg)
```

**Parameters**

- `String msg`

<a id="s-traceInBufFlush"></a>
### traceInBufFlush()

```java
public abstract void traceInBufFlush()
```
