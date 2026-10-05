<a id="cls-SSHSessionException"></a>
# SSHSessionException

```java
public class com.tailf.ned.SSHSessionException
    extends Exception
```

Exception raised from the SSH Session

## Members

**Constructors**:

- [SSHSessionException(int, String)](#m-sshsessionexception-f6a2f2c7feea)

**Fields**:

- [READ_EOF](#m-READ_EOF)
- [READ_TIMEOUT](#m-READ_TIMEOUT)

**Methods**:

- [getErrorCode()](#m-geterrorcode-812152fc083a)

## Constructors

<a id="m-sshsessionexception-f6a2f2c7feea"></a>
### SSHSessionException(int, String)

```java
public SSHSessionException(int id, String msg)
```

**Parameters**

- `int id`
- `String msg`


## Fields

<a id="m-READ_EOF"></a>
### READ_EOF

```java
public static final int READ_EOF = 1;
```

<a id="m-READ_TIMEOUT"></a>
### READ_TIMEOUT

```java
public static final int READ_TIMEOUT = 0;
```


## Methods

<a id="m-geterrorcode-812152fc083a"></a>
### getErrorCode()

```java
public int getErrorCode()
```
