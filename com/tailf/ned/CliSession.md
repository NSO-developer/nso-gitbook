# CliSession <a href="#cls-CliSession" id="cls-CliSession"></a>

```java
public interface com.tailf.ned.CliSession
```

## Members

**Methods**:

- [close()](#m-close-8107c6dc012b)
- [expect(Pattern)](#m-expect-98936155685a)
- [expect(Pattern, NedWorker)](#m-expect-a363c018c396)
- [expect(Pattern[])](#m-expect-8149faa90d9d)
- [expect(Pattern[], boolean, int)](#m-expect-5cc2e4122c7b)
- [expect(Pattern[], boolean, int, NedWorker)](#m-expect-6c58bada9cc6)
- [expect(Pattern[], NedWorker)](#m-expect-b0896c6a7b2a)
- [expect(String)](#m-expect-5f5d11ad490b)
- [expect(String, boolean, boolean, int)](#m-expect-b7ee8aa21949)
- [expect(String, boolean, boolean, int, NedWorker)](#m-expect-a44ee9613d91)
- [expect(String, boolean, int)](#m-expect-16cd2f682137)
- [expect(String, int)](#m-expect-37295e1967db)
- [expect(String, int, NedWorker)](#m-expect-4ba232d952f7)
- [expect(String, NedWorker)](#m-expect-6426c41e07e7)
- [expect(String[])](#m-expect-740d81a74e4b)
- [expect(String[], boolean, int)](#m-expect-f6cb6c02c198)
- [expect(String[], boolean, int, NedWorker)](#m-expect-90d4e3ee7ac2)
- [expect(String[], NedWorker)](#m-expect-4485477b99db)
- [flush()](#m-flush-a4d76f158943)
- [print(String)](#m-print-b202251f9230)
- [println(String)](#m-println-15aea44318e6)
- [serverSideClosed()](#m-serverSideClosed-0dfe26b0733e)
- [setTracer(NedTracer)](#m-setTracer-6943f9aadf68)

## Methods

### close() <a href="#m-close-8107c6dc012b" id="m-close-8107c6dc012b"></a>

```java
public abstract void close()
```

### expect(Pattern) <a href="#m-expect-98936155685a" id="m-expect-98936155685a"></a>

```java
public abstract String expect(
    java.util.regex.Pattern p
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern p`

### expect(Pattern, NedWorker) <a href="#m-expect-a363c018c396" id="m-expect-a363c018c396"></a>

```java
public abstract String expect(
    java.util.regex.Pattern p,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern p`
- `com.tailf.ned.NedWorker worker`

### expect(Pattern[]) <a href="#m-expect-8149faa90d9d" id="m-expect-8149faa90d9d"></a>

```java
public abstract com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`

### expect(Pattern[], boolean, int) <a href="#m-expect-5cc2e4122c7b" id="m-expect-5cc2e4122c7b"></a>

```java
public abstract com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`

### expect(Pattern[], boolean, int, NedWorker) <a href="#m-expect-6c58bada9cc6" id="m-expect-6c58bada9cc6"></a>

```java
public abstract com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [NedWorker](NedWorker.md#cls-NedWorker), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(Pattern[], NedWorker) <a href="#m-expect-b0896c6a7b2a" id="m-expect-b0896c6a7b2a"></a>

```java
public abstract com.tailf.ned.NedExpectResult expect(
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
public abstract String expect(
    String str
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String str`

### expect(String, boolean, boolean, int) <a href="#m-expect-b7ee8aa21949" id="m-expect-b7ee8aa21949"></a>

```java
public abstract String expect(
    String str,
    boolean include,
    boolean full,
    int timeout
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String str`
- `boolean include`
- `boolean full`
- `int timeout`

### expect(String, boolean, boolean, int, NedWorker) <a href="#m-expect-a44ee9613d91" id="m-expect-a44ee9613d91"></a>

```java
public abstract String expect(
    String str,
    boolean include,
    boolean full,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String str`
- `boolean include`
- `boolean full`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(String, boolean, int) <a href="#m-expect-16cd2f682137" id="m-expect-16cd2f682137"></a>

```java
public abstract String expect(
    String str,
    boolean include,
    int timeout
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String str`
- `boolean include`
- `int timeout`

### expect(String, int) <a href="#m-expect-37295e1967db" id="m-expect-37295e1967db"></a>

```java
public abstract String expect(
    String str,
    int timeout
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String str`
- `int timeout`

### expect(String, int, NedWorker) <a href="#m-expect-4ba232d952f7" id="m-expect-4ba232d952f7"></a>

```java
public abstract String expect(
    String str,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String str`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(String, NedWorker) <a href="#m-expect-6426c41e07e7" id="m-expect-6426c41e07e7"></a>

```java
public abstract String expect(
    String str,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String str`
- `com.tailf.ned.NedWorker worker`

### expect(String[]) <a href="#m-expect-740d81a74e4b" id="m-expect-740d81a74e4b"></a>

```java
public abstract com.tailf.ned.NedExpectResult expect(
    String[] str
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String[] str`

### expect(String[], boolean, int) <a href="#m-expect-f6cb6c02c198" id="m-expect-f6cb6c02c198"></a>

```java
public abstract com.tailf.ned.NedExpectResult expect(
    String[] str,
    boolean include,
    int timeout
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String[] str`
- `boolean include`
- `int timeout`

### expect(String[], boolean, int, NedWorker) <a href="#m-expect-90d4e3ee7ac2" id="m-expect-90d4e3ee7ac2"></a>

```java
public abstract com.tailf.ned.NedExpectResult expect(
    String[] str,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [NedWorker](NedWorker.md#cls-NedWorker), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String[] str`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(String[], NedWorker) <a href="#m-expect-4485477b99db" id="m-expect-4485477b99db"></a>

```java
public abstract com.tailf.ned.NedExpectResult expect(
    String[] str,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [NedWorker](NedWorker.md#cls-NedWorker), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String[] str`
- `com.tailf.ned.NedWorker worker`

### flush() <a href="#m-flush-a4d76f158943" id="m-flush-a4d76f158943"></a>

```java
public abstract void flush() throws java.io.IOException
```

### print(String) <a href="#m-print-b202251f9230" id="m-print-b202251f9230"></a>

```java
public abstract void print(String s) throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String s`

### println(String) <a href="#m-println-15aea44318e6" id="m-println-15aea44318e6"></a>

```java
public abstract void println(String s) throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String s`

### serverSideClosed() <a href="#m-serverSideClosed-0dfe26b0733e" id="m-serverSideClosed-0dfe26b0733e"></a>

```java
public abstract boolean serverSideClosed()
```

### setTracer(NedTracer) <a href="#m-setTracer-6943f9aadf68" id="m-setTracer-6943f9aadf68"></a>

```java
public abstract void setTracer(com.tailf.ned.NedTracer tracer)
```

Types: [NedTracer](NedTracer.md#cls-NedTracer)

**Parameters**

- `com.tailf.ned.NedTracer tracer`
