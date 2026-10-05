<a id="s-CliSession"></a>
# CliSession

```java
public interface com.tailf.ned.CliSession
```

## Members

**Methods**:

- [close()](#s-close)
- [expect(Pattern)](#s-expect)
- [expect(Pattern, NedWorker)](#s-expect-1)
- [expect(Pattern[])](#s-expect-2)
- [expect(Pattern[], boolean, int)](#s-expect-3)
- [expect(Pattern[], boolean, int, NedWorker)](#s-expect-4)
- [expect(Pattern[], NedWorker)](#s-expect-5)
- [expect(String)](#s-expect-6)
- [expect(String, boolean, boolean, int)](#s-expect-7)
- [expect(String, boolean, boolean, int, NedWorker)](#s-expect-8)
- [expect(String, boolean, int)](#s-expect-9)
- [expect(String, int)](#s-expect-10)
- [expect(String, int, NedWorker)](#s-expect-11)
- [expect(String, NedWorker)](#s-expect-12)
- [expect(String[])](#s-expect-13)
- [expect(String[], boolean, int)](#s-expect-14)
- [expect(String[], boolean, int, NedWorker)](#s-expect-15)
- [expect(String[], NedWorker)](#s-expect-16)
- [flush()](#s-flush)
- [print(String)](#s-print)
- [println(String)](#s-println)
- [serverSideClosed()](#s-serverSideClosed)
- [setTracer(NedTracer)](#s-setTracer)

## Methods

<a id="s-close"></a>
### close()

```java
public abstract void close()
```

<a id="s-expect"></a>
### expect(Pattern)

```java
public abstract String expect(
    java.util.regex.Pattern p
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern p`

<a id="s-expect-1"></a>
### expect(Pattern, NedWorker)

```java
public abstract String expect(
    java.util.regex.Pattern p,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedWorker](NedWorker.md#s-NedWorker), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern p`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-2"></a>
### expect(Pattern[])

```java
public abstract com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`

<a id="s-expect-3"></a>
### expect(Pattern[], boolean, int)

```java
public abstract com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`

<a id="s-expect-4"></a>
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

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult), [NedWorker](NedWorker.md#s-NedWorker), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-5"></a>
### expect(Pattern[], NedWorker)

```java
public abstract com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult), [NedWorker](NedWorker.md#s-NedWorker), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `java.util.regex.Pattern[] p`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-6"></a>
### expect(String)

```java
public abstract String expect(
    String str
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String str`

<a id="s-expect-7"></a>
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

Types: [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String str`
- `boolean include`
- `boolean full`
- `int timeout`

<a id="s-expect-8"></a>
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

Types: [NedWorker](NedWorker.md#s-NedWorker), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String str`
- `boolean include`
- `boolean full`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-9"></a>
### expect(String, boolean, int)

```java
public abstract String expect(
    String str,
    boolean include,
    int timeout
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String str`
- `boolean include`
- `int timeout`

<a id="s-expect-10"></a>
### expect(String, int)

```java
public abstract String expect(
    String str,
    int timeout
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String str`
- `int timeout`

<a id="s-expect-11"></a>
### expect(String, int, NedWorker)

```java
public abstract String expect(
    String str,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedWorker](NedWorker.md#s-NedWorker), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String str`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-12"></a>
### expect(String, NedWorker)

```java
public abstract String expect(
    String str,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedWorker](NedWorker.md#s-NedWorker), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String str`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-13"></a>
### expect(String[])

```java
public abstract com.tailf.ned.NedExpectResult expect(
    String[] str
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String[] str`

<a id="s-expect-14"></a>
### expect(String[], boolean, int)

```java
public abstract com.tailf.ned.NedExpectResult expect(
    String[] str,
    boolean include,
    int timeout
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String[] str`
- `boolean include`
- `int timeout`

<a id="s-expect-15"></a>
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

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult), [NedWorker](NedWorker.md#s-NedWorker), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String[] str`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

<a id="s-expect-16"></a>
### expect(String[], NedWorker)

```java
public abstract com.tailf.ned.NedExpectResult expect(
    String[] str,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedExpectResult](NedExpectResult.md#s-NedExpectResult), [NedWorker](NedWorker.md#s-NedWorker), [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String[] str`
- `com.tailf.ned.NedWorker worker`

<a id="s-flush"></a>
### flush()

```java
public abstract void flush() throws java.io.IOException
```

<a id="s-print"></a>
### print(String)

```java
public abstract void print(String s) throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String s`

<a id="s-println"></a>
### println(String)

```java
public abstract void println(String s) throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#s-SSHSessionException)

**Parameters**

- `String s`

<a id="s-serverSideClosed"></a>
### serverSideClosed()

```java
public abstract boolean serverSideClosed()
```

<a id="s-setTracer"></a>
### setTracer(NedTracer)

```java
public abstract void setTracer(com.tailf.ned.NedTracer tracer)
```

Types: [NedTracer](NedTracer.md#s-NedTracer)

**Parameters**

- `com.tailf.ned.NedTracer tracer`
