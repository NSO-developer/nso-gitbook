<a id="cls-CliSession"></a>
# CliSession

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
- [serverSideClosed()](#m-serversideclosed-0dfe26b0733e)
- [setTracer(NedTracer)](#m-settracer-6943f9aadf68)

## Methods

<a id="m-close-8107c6dc012b"></a>
### close()

```java
public abstract void close()
```

<a id="m-expect-98936155685a"></a>
### expect(Pattern)

```java
public abstract String expect(
    java.util.regex.Pattern p
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern p`

<a id="m-expect-a363c018c396"></a>
### expect(Pattern, NedWorker)

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

<a id="m-expect-8149faa90d9d"></a>
### expect(Pattern[])

```java
public abstract com.tailf.ned.NedExpectResult expect(
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

<a id="m-expect-6c58bada9cc6"></a>
### expect(Pattern[], boolean, int, NedWorker)

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

<a id="m-expect-b0896c6a7b2a"></a>
### expect(Pattern[], NedWorker)

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

<a id="m-expect-5f5d11ad490b"></a>
### expect(String)

```java
public abstract String expect(
    String str
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String str`

<a id="m-expect-b7ee8aa21949"></a>
### expect(String, boolean, boolean, int)

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

<a id="m-expect-a44ee9613d91"></a>
### expect(String, boolean, boolean, int, NedWorker)

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

<a id="m-expect-16cd2f682137"></a>
### expect(String, boolean, int)

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

<a id="m-expect-37295e1967db"></a>
### expect(String, int)

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

<a id="m-expect-4ba232d952f7"></a>
### expect(String, int, NedWorker)

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

<a id="m-expect-6426c41e07e7"></a>
### expect(String, NedWorker)

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

<a id="m-expect-740d81a74e4b"></a>
### expect(String[])

```java
public abstract com.tailf.ned.NedExpectResult expect(
    String[] str
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedExpectResult](NedExpectResult.md#cls-NedExpectResult), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String[] str`

<a id="m-expect-f6cb6c02c198"></a>
### expect(String[], boolean, int)

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

<a id="m-expect-90d4e3ee7ac2"></a>
### expect(String[], boolean, int, NedWorker)

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

<a id="m-expect-4485477b99db"></a>
### expect(String[], NedWorker)

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

<a id="m-flush-a4d76f158943"></a>
### flush()

```java
public abstract void flush() throws java.io.IOException
```

<a id="m-print-b202251f9230"></a>
### print(String)

```java
public abstract void print(String s) throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String s`

<a id="m-println-15aea44318e6"></a>
### println(String)

```java
public abstract void println(String s) throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#cls-SSHSessionException)

**Parameters**

- `String s`

<a id="m-serversideclosed-0dfe26b0733e"></a>
### serverSideClosed()

```java
public abstract boolean serverSideClosed()
```

<a id="m-settracer-6943f9aadf68"></a>
### setTracer(NedTracer)

```java
public abstract void setTracer(com.tailf.ned.NedTracer tracer)
```

Types: [NedTracer](NedTracer.md#cls-NedTracer)

**Parameters**

- `com.tailf.ned.NedTracer tracer`
