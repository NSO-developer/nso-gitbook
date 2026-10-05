# HaException <a href="#haexception-050bb3853186" id="haexception-050bb3853186"></a>

```java
public class com.tailf.ha.HaException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Exception for the HA handling

## Members

**Constructors**:

- [HaException\(String\)](#haexception-6466f26d1012)
- [HaException\(String, ErrorCode\)](#haexception-32139dd642cc)
- [HaException\(String, ErrorCode, Throwable\)](#haexception-c7b840ccd056)
- [HaException\(String, Throwable\)](#haexception-21b4bcf9175b)

**Methods**:

- [getErrorCode\(\)](../conf/ConfException.md#geterrorcode-812152fc083a) from ConfException
- [getOpaque\(\)](../conf/ConfException.md#getopaque-92e4945ec92d) from ConfException
- [mk\(ConfResponse\)](#mk-de1cedfc6ea8)
- [mk\(ConfResponse, ConfPath\)](../conf/ConfException.md#mk-79e69ffbc022) from ConfException

## Constructors

### HaException(String) <a href="#haexception-6466f26d1012" id="haexception-6466f26d1012"></a>

```java
public HaException(String msg)
```

**Parameters**

- `String msg`

### HaException(String, ErrorCode) <a href="#haexception-32139dd642cc" id="haexception-32139dd642cc"></a>

```java
public HaException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](../conf/ErrorCode.md#errorcode-65263de08890)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

### HaException(String, ErrorCode, Throwable) <a href="#haexception-c7b840ccd056" id="haexception-c7b840ccd056"></a>

```java
public HaException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#errorcode-65263de08890)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

### HaException(String, Throwable) <a href="#haexception-21b4bcf9175b" id="haexception-21b4bcf9175b"></a>

```java
public HaException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`


## Methods

### mk(ConfResponse) <a href="#mk-de1cedfc6ea8" id="mk-de1cedfc6ea8"></a>

```java
public static com.tailf.ha.HaException mk(com.tailf.conf.ConfResponse r)
```

Types: [HaException](HaException.md#haexception-050bb3853186), [ConfResponse](../conf/ConfResponse.md#confresponse-fd02dad17b49)

**Parameters**

- `com.tailf.conf.ConfResponse r`
