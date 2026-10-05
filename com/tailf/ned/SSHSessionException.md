<a id="s-SSHSessionException"></a>
# SSHSessionException

```java
public class com.tailf.ned.SSHSessionException
    extends Exception
```

Exception raised from the SSH Session

## Members

**Constructors**:

- [SSHSessionException(int, String)](#s-SSHSessionException-1)

**Fields**:

- [READ_EOF](#s-READ_EOF)
- [READ_TIMEOUT](#s-READ_TIMEOUT)

**Methods**:

- [getErrorCode()](#s-getErrorCode)

## Constructors

<a id="s-SSHSessionException-1"></a>
### SSHSessionException(int, String)

```java
public SSHSessionException(int id, String msg)
```

**Parameters**

- `int id`
- `String msg`


## Fields

<a id="s-READ_EOF"></a>
### READ_EOF

```java
public static final int READ_EOF = 1;
```

<a id="s-READ_TIMEOUT"></a>
### READ_TIMEOUT

```java
public static final int READ_TIMEOUT = 0;
```


## Methods

<a id="s-getErrorCode"></a>
### getErrorCode()

```java
public int getErrorCode()
```
