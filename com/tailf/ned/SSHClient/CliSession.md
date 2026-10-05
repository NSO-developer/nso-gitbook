# CliSession <a href="#cls-CliSession" id="cls-CliSession"></a>

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
- [getErrorStream()](#m-getErrorStream-8577e8676bda)
- [getInputStream()](#m-getInputStream-cb1d1fa14d56)
- [getLine()](#m-getLine-6cb6167e418b)
- [getOutputStream()](#m-getOutputStream-b7e39f99be28)
- [getReader()](#m-getReader-ca9cb7876cc5)
- [getReadTimeout()](#m-getReadTimeout-640fc089c1de)
- [getTermPrintlnMode()](#m-getTermPrintlnMode-bbc6ff231fae)
- [getWriter()](#m-getWriter-23ba297ab3e8)
- [logDebug(String)](#m-logDebug-91653b5096b0)
- [logInfo(String)](#m-logInfo-32ae00d19c47)
- [print(int)](#m-print-41f2f1534264)
- [print(String)](#m-print-b202251f9230)
- [println(int)](#m-println-4c26ee676efb)
- [println(String)](#m-println-15aea44318e6)
- [ready()](#m-ready-92162bd485a2)
- [ready(int)](#m-ready-c585210c0993)
- [serverSideClosed()](../CliSession.md#m-serverSideClosed-0dfe26b0733e) from CliSession
- [setReadTimeout(int)](#m-setReadTimeout-4f6742da7687)
- [setTermPrintlnMode(String)](#m-setTermPrintlnMode-36c6657337c2)
- [setTracer(NedTracer)](../CliSession.md#m-setTracer-6943f9aadf68) from CliSession
- [trace(String, String)](#m-trace-684478bdb6cc)
- [traceInBufAppend(String)](#m-traceInBufAppend-948da59d599a)
- [traceInBufFlush()](#m-traceInBufFlush-5f53f59ed390)

## Fields

### MODE_OCRNL <a href="#m-MODE_OCRNL" id="m-MODE_OCRNL"></a>

```java
public static final String MODE_OCRNL = "ocrnl";
```

Newline modes supported by the CLI session

### MODE_ONLRET <a href="#m-MODE_ONLRET" id="m-MODE_ONLRET"></a>

```java
public static final String MODE_ONLRET = "onlret";
```

### MODE_ONOCR <a href="#m-MODE_ONOCR" id="m-MODE_ONOCR"></a>

```java
public static final String MODE_ONOCR = "onocr";
```


## Methods

### expect(Pattern) <a href="#m-expect-98936155685a" id="m-expect-98936155685a"></a>

```java
public default String expect(
    java.util.regex.Pattern p
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern p`

### expect(Pattern, boolean, int) <a href="#m-expect-ae0bda32ace3" id="m-expect-ae0bda32ace3"></a>

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

### expect(Pattern, boolean, int, NedWorker) <a href="#m-expect-7eb828b58e63" id="m-expect-7eb828b58e63"></a>

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

### expect(Pattern, NedWorker) <a href="#m-expect-a363c018c396" id="m-expect-a363c018c396"></a>

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

### expect(Pattern[]) <a href="#m-expect-8149faa90d9d" id="m-expect-8149faa90d9d"></a>

```java
public default com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#cls-NedExpectResult), [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`

### expect(Pattern[], boolean, int) <a href="#m-expect-5cc2e4122c7b" id="m-expect-5cc2e4122c7b"></a>

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

### expect(Pattern[], boolean, int, boolean) <a href="#m-expect-7b0546ada421" id="m-expect-7b0546ada421"></a>

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

### expect(Pattern[], boolean, int, boolean, NedWorker) <a href="#m-expect-8367e41003a6" id="m-expect-8367e41003a6"></a>

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

### expect(Pattern[], boolean, int, NedWorker) <a href="#m-expect-6c58bada9cc6" id="m-expect-6c58bada9cc6"></a>

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

### expect(Pattern[], NedWorker) <a href="#m-expect-b0896c6a7b2a" id="m-expect-b0896c6a7b2a"></a>

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

### expect(String) <a href="#m-expect-5f5d11ad490b" id="m-expect-5f5d11ad490b"></a>

```java
public default String expect(
    String str
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String str`

### expect(String, boolean, boolean, int) <a href="#m-expect-b7ee8aa21949" id="m-expect-b7ee8aa21949"></a>

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

### expect(String, boolean, boolean, int, NedWorker) <a href="#m-expect-a44ee9613d91" id="m-expect-a44ee9613d91"></a>

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

### expect(String, boolean, int) <a href="#m-expect-16cd2f682137" id="m-expect-16cd2f682137"></a>

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

### expect(String, boolean, int, NedWorker) <a href="#m-expect-6e2d86346550" id="m-expect-6e2d86346550"></a>

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

### expect(String, int) <a href="#m-expect-37295e1967db" id="m-expect-37295e1967db"></a>

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

### expect(String, int, NedWorker) <a href="#m-expect-4ba232d952f7" id="m-expect-4ba232d952f7"></a>

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

### expect(String, NedWorker) <a href="#m-expect-6426c41e07e7" id="m-expect-6426c41e07e7"></a>

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

### expect(String[]) <a href="#m-expect-740d81a74e4b" id="m-expect-740d81a74e4b"></a>

```java
public default com.tailf.ned.NedExpectResult expect(
    String[] str
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#cls-NedExpectResult), [SSHSessionException](../SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String[] str`

### expect(String[], boolean, int) <a href="#m-expect-f6cb6c02c198" id="m-expect-f6cb6c02c198"></a>

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

### expect(String[], boolean, int, NedWorker) <a href="#m-expect-90d4e3ee7ac2" id="m-expect-90d4e3ee7ac2"></a>

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

### expect(String[], NedWorker) <a href="#m-expect-4485477b99db" id="m-expect-4485477b99db"></a>

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

### flush() <a href="#m-flush-a4d76f158943" id="m-flush-a4d76f158943"></a>

```java
public default void flush()
```

Signals that the final chunk of data has to be printed to the output
 transport stream. This method furthermore flushes the transport
 output stream buffer.

### getErrorStream() <a href="#m-getErrorStream-8577e8676bda" id="m-getErrorStream-8577e8676bda"></a>

```java
public abstract java.io.InputStream getErrorStream()
```

### getInputStream() <a href="#m-getInputStream-cb1d1fa14d56" id="m-getInputStream-cb1d1fa14d56"></a>

```java
public abstract java.io.InputStream getInputStream()
```

### getLine() <a href="#m-getLine-6cb6167e418b" id="m-getLine-6cb6167e418b"></a>

```java
public abstract StringBuilder getLine()
```

### getOutputStream() <a href="#m-getOutputStream-b7e39f99be28" id="m-getOutputStream-b7e39f99be28"></a>

```java
public abstract java.io.OutputStream getOutputStream()
```

### getReader() <a href="#m-getReader-ca9cb7876cc5" id="m-getReader-ca9cb7876cc5"></a>

```java
public abstract java.io.BufferedReader getReader()
```

### getReadTimeout() <a href="#m-getReadTimeout-640fc089c1de" id="m-getReadTimeout-640fc089c1de"></a>

```java
public abstract int getReadTimeout()
```

Interface methods that must be implemented

### getTermPrintlnMode() <a href="#m-getTermPrintlnMode-bbc6ff231fae" id="m-getTermPrintlnMode-bbc6ff231fae"></a>

```java
public abstract String getTermPrintlnMode()
```

### getWriter() <a href="#m-getWriter-23ba297ab3e8" id="m-getWriter-23ba297ab3e8"></a>

```java
public abstract java.io.PrintWriter getWriter()
```

### logDebug(String) <a href="#m-logDebug-91653b5096b0" id="m-logDebug-91653b5096b0"></a>

```java
public abstract void logDebug(String msg)
```

**Parameters**

- `String msg`

### logInfo(String) <a href="#m-logInfo-32ae00d19c47" id="m-logInfo-32ae00d19c47"></a>

```java
public abstract void logInfo(String msg)
```

**Parameters**

- `String msg`

### print(int) <a href="#m-print-41f2f1534264" id="m-print-41f2f1534264"></a>

```java
public default void print(int iVal)
```

Prints an integer (as text) to the output stream.

**Parameters**

- `int iVal` - Text to send to the stream.

### print(String) <a href="#m-print-b202251f9230" id="m-print-b202251f9230"></a>

```java
public default void print(String s)
```

Prints text to the output stream.

**Parameters**

- `String s` - Text to send to the stream.

### println(int) <a href="#m-println-4c26ee676efb" id="m-println-4c26ee676efb"></a>

```java
public default void println(int iVal)
```

Prints an integer (as text) to the output stream.
 A newline char is appended to end of the output stream.

**Parameters**

- `int iVal` - Text to send to the stream.

### println(String) <a href="#m-println-15aea44318e6" id="m-println-15aea44318e6"></a>

```java
public default void println(String s)
```

Print text to the output stream.
 A newline char is appended to end of the output stream.

**Parameters**

- `String s` - Text to send to the stream.

### ready() <a href="#m-ready-92162bd485a2" id="m-ready-92162bd485a2"></a>

```java
public default boolean ready() throws java.io.IOException
```

Interface methods with default implementation

### ready(int) <a href="#m-ready-c585210c0993" id="m-ready-c585210c0993"></a>

```java
public abstract boolean ready(int timeout) throws java.io.IOException
```

**Parameters**

- `int timeout`

### setReadTimeout(int) <a href="#m-setReadTimeout-4f6742da7687" id="m-setReadTimeout-4f6742da7687"></a>

```java
public abstract void setReadTimeout(int readTimeout)
```

**Parameters**

- `int readTimeout`

### setTermPrintlnMode(String) <a href="#m-setTermPrintlnMode-36c6657337c2" id="m-setTermPrintlnMode-36c6657337c2"></a>

```java
public abstract void setTermPrintlnMode(String mode)
```

**Parameters**

- `String mode`

### trace(String, String) <a href="#m-trace-684478bdb6cc" id="m-trace-684478bdb6cc"></a>

```java
public abstract void trace(String msg, String direction)
```

**Parameters**

- `String msg`
- `String direction`

### traceInBufAppend(String) <a href="#m-traceInBufAppend-948da59d599a" id="m-traceInBufAppend-948da59d599a"></a>

```java
public abstract void traceInBufAppend(String msg)
```

**Parameters**

- `String msg`

### traceInBufFlush() <a href="#m-traceInBufFlush-5f53f59ed390" id="m-traceInBufFlush-5f53f59ed390"></a>

```java
public abstract void traceInBufFlush()
```
