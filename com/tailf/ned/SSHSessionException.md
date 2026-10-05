# SSHSessionException <a href="#cls-SSHSessionException" id="cls-SSHSessionException"></a>

```java
public class com.tailf.ned.SSHSessionException
    extends Exception
```

Exception raised from the SSH Session

## Members

**Constructors**:

- [SSHSessionException(int, String)](#m-SSHSessionException-f6a2f2c7feea)

**Fields**:

- [READ_EOF](#m-READ_EOF)
- [READ_TIMEOUT](#m-READ_TIMEOUT)

**Methods**:

- [getErrorCode()](#m-getErrorCode-812152fc083a)

## Constructors

### SSHSessionException(int, String) <a href="#m-SSHSessionException-f6a2f2c7feea" id="m-SSHSessionException-f6a2f2c7feea"></a>

```java
public SSHSessionException(int id, String msg)
```

**Parameters**

- `int id`
- `String msg`


## Fields

### READ_EOF <a href="#m-READ_EOF" id="m-READ_EOF"></a>

```java
public static final int READ_EOF = 1;
```

### READ_TIMEOUT <a href="#m-READ_TIMEOUT" id="m-READ_TIMEOUT"></a>

```java
public static final int READ_TIMEOUT = 0;
```


## Methods

### getErrorCode() <a href="#m-getErrorCode-812152fc083a" id="m-getErrorCode-812152fc083a"></a>

```java
public int getErrorCode()
```
