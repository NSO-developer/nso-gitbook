# CliSession <a href="#clisession-1e55c4457237" id="clisession-1e55c4457237"></a>

```java
public interface com.tailf.ned.CliSession
```

## Members

**Methods**:

- [close\(\)](#close-8107c6dc012b)
- [expect\(Pattern\)](#expect-98936155685a)
- [expect\(Pattern, NedWorker\)](#expect-a363c018c396)
- [expect\(Pattern\[\]\)](#expect-8149faa90d9d)
- [expect\(Pattern\[\], boolean, int\)](#expect-5cc2e4122c7b)
- [expect\(Pattern\[\], boolean, int, NedWorker\)](#expect-6c58bada9cc6)
- [expect\(Pattern\[\], NedWorker\)](#expect-b0896c6a7b2a)
- [expect\(String\)](#expect-5f5d11ad490b)
- [expect\(String, boolean, boolean, int\)](#expect-b7ee8aa21949)
- [expect\(String, boolean, boolean, int, NedWorker\)](#expect-a44ee9613d91)
- [expect\(String, boolean, int\)](#expect-16cd2f682137)
- [expect\(String, int\)](#expect-37295e1967db)
- [expect\(String, int, NedWorker\)](#expect-4ba232d952f7)
- [expect\(String, NedWorker\)](#expect-6426c41e07e7)
- [expect\(String\[\]\)](#expect-740d81a74e4b)
- [expect\(String\[\], boolean, int\)](#expect-f6cb6c02c198)
- [expect\(String\[\], boolean, int, NedWorker\)](#expect-90d4e3ee7ac2)
- [expect\(String\[\], NedWorker\)](#expect-4485477b99db)
- [flush\(\)](#flush-a4d76f158943)
- [print\(String\)](#print-b202251f9230)
- [println\(String\)](#println-15aea44318e6)
- [serverSideClosed\(\)](#serversideclosed-0dfe26b0733e)
- [setTracer\(NedTracer\)](#settracer-6943f9aadf68)

## Methods

### close() <a href="#close-8107c6dc012b" id="close-8107c6dc012b"></a>

```java
public abstract void close()
```

### expect(Pattern) <a href="#expect-98936155685a" id="expect-98936155685a"></a>

```java
public abstract String expect(
    java.util.regex.Pattern p
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern p`

### expect(Pattern, NedWorker) <a href="#expect-a363c018c396" id="expect-a363c018c396"></a>

```java
public abstract String expect(
    java.util.regex.Pattern p,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern p`
- `com.tailf.ned.NedWorker worker`

### expect(Pattern[]) <a href="#expect-8149faa90d9d" id="expect-8149faa90d9d"></a>

```java
public abstract com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p
)
    throws com.tailf.ned.SSHSessionException, java.io.IOException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern[] p`

### expect(Pattern[], boolean, int) <a href="#expect-5cc2e4122c7b" id="expect-5cc2e4122c7b"></a>

```java
public abstract com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`

### expect(Pattern[], boolean, int, NedWorker) <a href="#expect-6c58bada9cc6" id="expect-6c58bada9cc6"></a>

```java
public abstract com.tailf.ned.NedExpectResult expect(
    java.util.regex.Pattern[] p,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [NedWorker](NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `java.util.regex.Pattern[] p`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(Pattern[], NedWorker) <a href="#expect-b0896c6a7b2a" id="expect-b0896c6a7b2a"></a>

```java
public abstract com.tailf.ned.NedExpectResult expect(
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
public abstract String expect(
    String str
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String str`

### expect(String, boolean, boolean, int) <a href="#expect-b7ee8aa21949" id="expect-b7ee8aa21949"></a>

```java
public abstract String expect(
    String str,
    boolean include,
    boolean full,
    int timeout
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String str`
- `boolean include`
- `boolean full`
- `int timeout`

### expect(String, boolean, boolean, int, NedWorker) <a href="#expect-a44ee9613d91" id="expect-a44ee9613d91"></a>

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

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String str`
- `boolean include`
- `boolean full`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(String, boolean, int) <a href="#expect-16cd2f682137" id="expect-16cd2f682137"></a>

```java
public abstract String expect(
    String str,
    boolean include,
    int timeout
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String str`
- `boolean include`
- `int timeout`

### expect(String, int) <a href="#expect-37295e1967db" id="expect-37295e1967db"></a>

```java
public abstract String expect(
    String str,
    int timeout
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String str`
- `int timeout`

### expect(String, int, NedWorker) <a href="#expect-4ba232d952f7" id="expect-4ba232d952f7"></a>

```java
public abstract String expect(
    String str,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String str`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(String, NedWorker) <a href="#expect-6426c41e07e7" id="expect-6426c41e07e7"></a>

```java
public abstract String expect(
    String str,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String str`
- `com.tailf.ned.NedWorker worker`

### expect(String[]) <a href="#expect-740d81a74e4b" id="expect-740d81a74e4b"></a>

```java
public abstract com.tailf.ned.NedExpectResult expect(
    String[] str
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String[] str`

### expect(String[], boolean, int) <a href="#expect-f6cb6c02c198" id="expect-f6cb6c02c198"></a>

```java
public abstract com.tailf.ned.NedExpectResult expect(
    String[] str,
    boolean include,
    int timeout
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String[] str`
- `boolean include`
- `int timeout`

### expect(String[], boolean, int, NedWorker) <a href="#expect-90d4e3ee7ac2" id="expect-90d4e3ee7ac2"></a>

```java
public abstract com.tailf.ned.NedExpectResult expect(
    String[] str,
    boolean include,
    int timeout,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [NedWorker](NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String[] str`
- `boolean include`
- `int timeout`
- `com.tailf.ned.NedWorker worker`

### expect(String[], NedWorker) <a href="#expect-4485477b99db" id="expect-4485477b99db"></a>

```java
public abstract com.tailf.ned.NedExpectResult expect(
    String[] str,
    com.tailf.ned.NedWorker worker
)
    throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [NedExpectResult](NedExpectResult.md#nedexpectresult-cbdbaf0f9e87), [NedWorker](NedWorker.md#nedworker-b063de7c0998), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String[] str`
- `com.tailf.ned.NedWorker worker`

### flush() <a href="#flush-a4d76f158943" id="flush-a4d76f158943"></a>

```java
public abstract void flush() throws java.io.IOException
```

### print(String) <a href="#print-b202251f9230" id="print-b202251f9230"></a>

```java
public abstract void print(String s) throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String s`

### println(String) <a href="#println-15aea44318e6" id="println-15aea44318e6"></a>

```java
public abstract void println(String s) throws java.io.IOException, com.tailf.ned.SSHSessionException
```

Types: [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1)

**Parameters**

- `String s`

### serverSideClosed() <a href="#serversideclosed-0dfe26b0733e" id="serversideclosed-0dfe26b0733e"></a>

```java
public abstract boolean serverSideClosed()
```

### setTracer(NedTracer) <a href="#settracer-6943f9aadf68" id="settracer-6943f9aadf68"></a>

```java
public abstract void setTracer(com.tailf.ned.NedTracer tracer)
```

Types: [NedTracer](NedTracer.md#nedtracer-f8730263f5f2)

**Parameters**

- `com.tailf.ned.NedTracer tracer`
