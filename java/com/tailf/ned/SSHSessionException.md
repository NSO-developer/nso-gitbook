# SSHSessionException <a href="#sshsessionexception-971db2359ab1" id="sshsessionexception-971db2359ab1"></a>

```java
public class com.tailf.ned.SSHSessionException
    extends Exception
```

Exception raised from the SSH Session

## Members

**Constructors**:

- [SSHSessionException\(int, String\)](#sshsessionexception-f6a2f2c7feea)

**Fields**:

- [READ\_EOF](#read_eof-8c3114d59520)
- [READ\_TIMEOUT](#read_timeout-bf92ad0bc4d2)

**Methods**:

- [getErrorCode\(\)](#geterrorcode-812152fc083a)

## Constructors

### SSHSessionException(int, String) <a href="#sshsessionexception-f6a2f2c7feea" id="sshsessionexception-f6a2f2c7feea"></a>

```java
public SSHSessionException(int id, String msg)
```

**Parameters**

- `int id`
- `String msg`


## Fields

### READ_EOF <a href="#read_eof-8c3114d59520" id="read_eof-8c3114d59520"></a>

```java
public static final int READ_EOF = 1;
```

### READ_TIMEOUT <a href="#read_timeout-bf92ad0bc4d2" id="read_timeout-bf92ad0bc4d2"></a>

```java
public static final int READ_TIMEOUT = 0;
```


## Methods

### getErrorCode() <a href="#geterrorcode-812152fc083a" id="geterrorcode-812152fc083a"></a>

```java
public int getErrorCode()
```
