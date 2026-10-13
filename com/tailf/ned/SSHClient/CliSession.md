# CliSession <a href="#clisession-1e55c4457237" id="clisession-1e55c4457237"></a>

```java
public static interface com.tailf.ned.SSHClient.CliSession
    extends com.tailf.ned.CliSession
```

Types: [CliSession](../CliSession.md#clisession-1e55c4457237)

The SSH CLI session interface.
 Inherited from the old SSHSession implementation.

## Members

**Fields**:

- [MODE\_OCRNL](#mode_ocrnl-2476ec5d2765)
- [MODE\_ONLRET](#mode_onlret-96689b9dd127)
- [MODE\_ONOCR](#mode_onocr-54f46cfe0a80)

**Methods**:

- [close\(\)](../CliSession.md#close-8107c6dc012b) from CliSession
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
- [flush\(\)](#flush-a4d76f158943)
- [getErrorStream\(\)](#geterrorstream-8577e8676bda)
- [getInputStream\(\)](#getinputstream-cb1d1fa14d56)
- [getLine\(\)](#getline-6cb6167e418b)
- [getOutputStream\(\)](#getoutputstream-b7e39f99be28)
- [getReader\(\)](#getreader-ca9cb7876cc5)
- [getReadTimeout\(\)](#getreadtimeout-640fc089c1de)
- [getTermPrintlnMode\(\)](#gettermprintlnmode-bbc6ff231fae)
- [getWriter\(\)](#getwriter-23ba297ab3e8)
- [logDebug\(String\)](#logdebug-91653b5096b0)
- [logInfo\(String\)](#loginfo-32ae00d19c47)
- [print\(int\)](#print-41f2f1534264)
- [print\(String\)](#print-b202251f9230)
- [println\(int\)](#println-4c26ee676efb)
- [println\(String\)](#println-15aea44318e6)
- [ready\(\)](#ready-92162bd485a2)
- [ready\(int\)](#ready-c585210c0993)
- [serverSideClosed\(\)](../CliSession.md#serversideclosed-0dfe26b0733e) from CliSession
- [setReadTimeout\(int\)](#setreadtimeout-4f6742da7687)
- [setTermPrintlnMode\(String\)](#settermprintlnmode-36c6657337c2)
- [setTracer\(NedTracer\)](../CliSession.md#settracer-6943f9aadf68) from CliSession
- [trace\(String, String\)](#trace-684478bdb6cc)
- [traceInBufAppend\(String\)](#traceinbufappend-948da59d599a)
- [traceInBufFlush\(\)](#traceinbufflush-5f53f59ed390)

## Fields

### MODE_OCRNL <a href="#mode_ocrnl-2476ec5d2765" id="mode_ocrnl-2476ec5d2765"></a>

```java
public static final String MODE_OCRNL = "ocrnl";
```

Newline modes supported by the CLI session

### MODE_ONLRET <a href="#mode_onlret-96689b9dd127" id="mode_onlret-96689b9dd127"></a>

```java
public static final String MODE_ONLRET = "onlret";
```

### MODE_ONOCR <a href="#mode_onocr-54f46cfe0a80" id="mode_onocr-54f46cfe0a80"></a>

```java
public static final String MODE_ONOCR = "onocr";
```


## Methods

### expect(Pattern) <a href="#expect-98936155685a" id="expect-98936155685a"></a>

```java
public default String expect(
    java.util.regex.Pattern p
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](../SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern p`

### expect(Pattern, boolean, int) <a href="#expect-ae0bda32ace3" id="expect-ae0bda32ace3"></a>

```java
public default String expect(
    java.util.regex.Pattern p,
    boolean include,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](../SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern p`
- `boolean include`
- `int timeout`

### expect(Pattern, boolean, int, NedWorker) <a href="#expect-7eb828b58e63" id="expect-7eb828b58e63"></a>

```java
public default String expect(
    java.util.regex.Pattern p,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](../NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](../SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern p`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(Pattern, NedWorker) <a href="#expect-a363c018c396" id="expect-a363c018c396"></a>

```java
public default String expect(
    java.util.regex.Pattern p,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](../NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](../SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern p`
- `com.tailf.ned.NedWorker worker`

### expect(Pattern[]) <a href="#expect-8149faa90d9d" id="expect-8149faa90d9d"></a>

```java
public default com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [SSHSessionException](../SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern[] p`

### expect(Pattern[], boolean, int) <a href="#expect-5cc2e4122c7b" id="expect-5cc2e4122c7b"></a>

```java
public default com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [SSHSessionException](../SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`

### expect(Pattern[], boolean, int, boolean) <a href="#expect-7b0546ada421" id="expect-7b0546ada421"></a>

```java
public default com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout,
    boolean full
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [SSHSessionException](../SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `boolean full`

### expect(Pattern[], boolean, int, boolean, NedWorker) <a href="#expect-8367e41003a6" id="expect-8367e41003a6"></a>

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

Types: [NedExpectResult](../NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [NedWorker](../NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](../SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `boolean full`
- `com.tailf.ned.NedWorker worker`

### expect(Pattern[], boolean, int, NedWorker) <a href="#expect-6c58bada9cc6" id="expect-6c58bada9cc6"></a>

```java
public default com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [NedWorker](../NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](../SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(Pattern[], NedWorker) <a href="#expect-b0896c6a7b2a" id="expect-b0896c6a7b2a"></a>

```java
public default com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [NedWorker](../NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](../SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern[] p`
- `com.tailf.ned.NedWorker worker`

### expect(String) <a href="#expect-5f5d11ad490b" id="expect-5f5d11ad490b"></a>

```java
public default String expect(
    String str
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](../SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String str`

### expect(String, boolean, boolean, int) <a href="#expect-b7ee8aa21949" id="expect-b7ee8aa21949"></a>

```java
public default String expect(
    String str,
    boolean include,
    boolean full,
    int timeout
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](../SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String str`
- `boolean include`
- `boolean full`
- `int timeout`

### expect(String, boolean, boolean, int, NedWorker) <a href="#expect-a44ee9613d91" id="expect-a44ee9613d91"></a>

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

Types: [NedWorker](../NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](../SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String str`
- `boolean include`
- `boolean full`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(String, boolean, int) <a href="#expect-16cd2f682137" id="expect-16cd2f682137"></a>

```java
public default String expect(
    String str,
    boolean include,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](../SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String str`
- `boolean include`
- `int timeout`

### expect(String, boolean, int, NedWorker) <a href="#expect-6e2d86346550" id="expect-6e2d86346550"></a>

```java
public default String expect(
    String str,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](../NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](../SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String str`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(String, int) <a href="#expect-37295e1967db" id="expect-37295e1967db"></a>

```java
public default String expect(
    String str,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [SSHSessionException](../SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String str`
- `int timeout`

### expect(String, int, NedWorker) <a href="#expect-4ba232d952f7" id="expect-4ba232d952f7"></a>

```java
public default String expect(
    String str,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](../NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](../SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String str`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(String, NedWorker) <a href="#expect-6426c41e07e7" id="expect-6426c41e07e7"></a>

```java
public default String expect(
    String str,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedWorker](../NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](../SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String str`
- `com.tailf.ned.NedWorker worker`

### expect(String[]) <a href="#expect-740d81a74e4b" id="expect-740d81a74e4b"></a>

```java
public default com.tailf.ned.NedExpectResult expect(
    String[] str
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [SSHSessionException](../SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String[] str`

### expect(String[], boolean, int) <a href="#expect-f6cb6c02c198" id="expect-f6cb6c02c198"></a>

```java
public default com.tailf.ned.NedExpectResult expect(
    String[] str,
    boolean include,
    int timeout
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [SSHSessionException](../SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String[] str`
- `boolean include`
- `int timeout`

### expect(String[], boolean, int, NedWorker) <a href="#expect-90d4e3ee7ac2" id="expect-90d4e3ee7ac2"></a>

```java
public default com.tailf.ned.NedExpectResult expect(
    String[] str,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [NedWorker](../NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](../SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String[] str`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(String[], NedWorker) <a href="#expect-4485477b99db" id="expect-4485477b99db"></a>

```java
public default com.tailf.ned.NedExpectResult expect(
    String[] str,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](../NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [NedWorker](../NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](../SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String[] str`
- `com.tailf.ned.NedWorker worker`

### flush() <a href="#flush-a4d76f158943" id="flush-a4d76f158943"></a>

```java
public default void flush()
```

Signals that the final chunk of data has to be printed to the output
 transport stream. This method furthermore flushes the transport
 output stream buffer.

### getErrorStream() <a href="#geterrorstream-8577e8676bda" id="geterrorstream-8577e8676bda"></a>

```java
public abstract java.io.InputStream getErrorStream()
```

### getInputStream() <a href="#getinputstream-cb1d1fa14d56" id="getinputstream-cb1d1fa14d56"></a>

```java
public abstract java.io.InputStream getInputStream()
```

### getLine() <a href="#getline-6cb6167e418b" id="getline-6cb6167e418b"></a>

```java
public abstract StringBuilder getLine()
```

### getOutputStream() <a href="#getoutputstream-b7e39f99be28" id="getoutputstream-b7e39f99be28"></a>

```java
public abstract java.io.OutputStream getOutputStream()
```

### getReader() <a href="#getreader-ca9cb7876cc5" id="getreader-ca9cb7876cc5"></a>

```java
public abstract java.io.BufferedReader getReader()
```

### getReadTimeout() <a href="#getreadtimeout-640fc089c1de" id="getreadtimeout-640fc089c1de"></a>

```java
public abstract int getReadTimeout()
```

Interface methods that must be implemented

### getTermPrintlnMode() <a href="#gettermprintlnmode-bbc6ff231fae" id="gettermprintlnmode-bbc6ff231fae"></a>

```java
public abstract String getTermPrintlnMode()
```

### getWriter() <a href="#getwriter-23ba297ab3e8" id="getwriter-23ba297ab3e8"></a>

```java
public abstract java.io.PrintWriter getWriter()
```

### logDebug(String) <a href="#logdebug-91653b5096b0" id="logdebug-91653b5096b0"></a>

```java
public abstract void logDebug(String msg)
```

**Parameters**

- `String msg`

### logInfo(String) <a href="#loginfo-32ae00d19c47" id="loginfo-32ae00d19c47"></a>

```java
public abstract void logInfo(String msg)
```

**Parameters**

- `String msg`

### print(int) <a href="#print-41f2f1534264" id="print-41f2f1534264"></a>

```java
public default void print(int iVal)
```

Prints an integer (as text) to the output stream.

**Parameters**

- `int iVal` - Text to send to the stream.

### print(String) <a href="#print-b202251f9230" id="print-b202251f9230"></a>

```java
public default void print(String s)
```

Prints text to the output stream.

**Parameters**

- `String s` - Text to send to the stream.

### println(int) <a href="#println-4c26ee676efb" id="println-4c26ee676efb"></a>

```java
public default void println(int iVal)
```

Prints an integer (as text) to the output stream.
 A newline char is appended to end of the output stream.

**Parameters**

- `int iVal` - Text to send to the stream.

### println(String) <a href="#println-15aea44318e6" id="println-15aea44318e6"></a>

```java
public default void println(String s)
```

Print text to the output stream.
 A newline char is appended to end of the output stream.

**Parameters**

- `String s` - Text to send to the stream.

### ready() <a href="#ready-92162bd485a2" id="ready-92162bd485a2"></a>

```java
public default boolean ready() throws java.io.IOException
```

Interface methods with default implementation

### ready(int) <a href="#ready-c585210c0993" id="ready-c585210c0993"></a>

```java
public abstract boolean ready(int timeout) throws java.io.IOException
```

**Parameters**

- `int timeout`

### setReadTimeout(int) <a href="#setreadtimeout-4f6742da7687" id="setreadtimeout-4f6742da7687"></a>

```java
public abstract void setReadTimeout(int readTimeout)
```

**Parameters**

- `int readTimeout`

### setTermPrintlnMode(String) <a href="#settermprintlnmode-36c6657337c2" id="settermprintlnmode-36c6657337c2"></a>

```java
public abstract void setTermPrintlnMode(String mode)
```

**Parameters**

- `String mode`

### trace(String, String) <a href="#trace-684478bdb6cc" id="trace-684478bdb6cc"></a>

```java
public abstract void trace(String msg, String direction)
```

**Parameters**

- `String msg`
- `String direction`

### traceInBufAppend(String) <a href="#traceinbufappend-948da59d599a" id="traceinbufappend-948da59d599a"></a>

```java
public abstract void traceInBufAppend(String msg)
```

**Parameters**

- `String msg`

### traceInBufFlush() <a href="#traceinbufflush-5f53f59ed390" id="traceinbufflush-5f53f59ed390"></a>

```java
public abstract void traceInBufFlush()
```
