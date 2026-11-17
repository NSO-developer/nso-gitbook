# ConfException <a href="#confexception-baeaab99f7f9" id="confexception-baeaab99f7f9"></a>

```java
public class com.tailf.conf.ConfException
    extends Exception
```

Exception base class. Capable of formatting protocol errors into exceptions.
 This is also baseclass for all other exceptions.

**Related classes**

- [CdbException](../cdb/CdbException.md#cdbexception-a14a27a1a190)
- [ConfBadTermException](ConfBadTermException.md#confbadtermexception-cf79bd96951c)
- [ConfWarningException](ConfWarningException.md#confwarningexception-0eb4469acfd8)
- [DpException](../dp/DpException.md#dpexception-79c01c670be8)
- [HaException](../ha/HaException.md#haexception-050bb3853186)
- [MaapiException](../maapi/MaapiException.md#maapiexception-af58eb4e109e)
- [MmapSchemaException](../ncs/maapi/MmapSchemaException.md#mmapschemaexception-d3943c962514)
- [NavuException](../navu/NavuException.md#navuexception-d80fa0cb4f3f)
- [NcsException](../ncs/NcsException.md#ncsexception-d2b40ca98ea5)
- [NotifException](../notif/NotifException.md#notifexception-d843ea72ec3f)

## Members

**Constructors**:

- [ConfException\(String\)](#confexception-dc970c7fe4fe)
- [ConfException\(String, ErrorCode\)](#confexception-d917b21fb864)
- [ConfException\(String, ErrorCode, Throwable\)](#confexception-2ef26e60c90a)
- [ConfException\(String, ErrorCode, Throwable, Object\)](#confexception-1d5a0544c033)
- [ConfException\(String, int\)](#confexception-f9ced700f545)
- [ConfException\(String, int, Throwable\)](#confexception-b28d9204d01c)
- [ConfException\(String, Throwable\)](#confexception-c87e2ff2e68c)
- [ConfException\(Throwable\)](#confexception-97f34dedf669)

**Methods**:

- [getErrorCode\(\)](#geterrorcode-812152fc083a)
- [getOpaque\(\)](#getopaque-92e4945ec92d)
- [mk\(ConfResponse\)](#mk-de1cedfc6ea8)
- [mk\(ConfResponse, ConfPath\)](#mk-79e69ffbc022)

## Constructors

### ConfException(String) <a href="#confexception-dc970c7fe4fe" id="confexception-dc970c7fe4fe"></a>

```java
public ConfException(String msg)
```

**Parameters**

- `String msg`

### ConfException(String, ErrorCode) <a href="#confexception-d917b21fb864" id="confexception-d917b21fb864"></a>

```java
public ConfException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](ErrorCode.md#errorcode-65263de08890)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

### ConfException(String, ErrorCode, Throwable) <a href="#confexception-2ef26e60c90a" id="confexception-2ef26e60c90a"></a>

```java
public ConfException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](ErrorCode.md#errorcode-65263de08890)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

### ConfException(String, ErrorCode, Throwable, Object) <a href="#confexception-1d5a0544c033" id="confexception-1d5a0544c033"></a>

```java
public ConfException(String msg, com.tailf.conf.ErrorCode code, Throwable cause, Object o)
```

Types: [ErrorCode](ErrorCode.md#errorcode-65263de08890)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`
- `Object o`

### ConfException(String, int) <a href="#confexception-f9ced700f545" id="confexception-f9ced700f545"></a>

```java
public ConfException(String msg, int codeInteger)
```

**Parameters**

- `String msg`
- `int codeInteger`

### ConfException(String, int, Throwable) <a href="#confexception-b28d9204d01c" id="confexception-b28d9204d01c"></a>

```java
public ConfException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`

### ConfException(String, Throwable) <a href="#confexception-c87e2ff2e68c" id="confexception-c87e2ff2e68c"></a>

```java
public ConfException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`

### ConfException(Throwable) <a href="#confexception-97f34dedf669" id="confexception-97f34dedf669"></a>

```java
public ConfException(Throwable cause)
```

**Parameters**

- `Throwable cause`


## Methods

### getErrorCode() <a href="#geterrorcode-812152fc083a" id="geterrorcode-812152fc083a"></a>

```java
public com.tailf.conf.ErrorCode getErrorCode()
```

Types: [ErrorCode](ErrorCode.md#errorcode-65263de08890)

### getOpaque() <a href="#getopaque-92e4945ec92d" id="getopaque-92e4945ec92d"></a>

```java
public Object getOpaque()
```

### mk(ConfResponse) <a href="#mk-de1cedfc6ea8" id="mk-de1cedfc6ea8"></a>

```java
public static com.tailf.conf.ConfException mk(com.tailf.conf.ConfResponse r)
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9), [ConfResponse](ConfResponse.md#confresponse-fd02dad17b49)

**Parameters**

- `com.tailf.conf.ConfResponse r`

### mk(ConfResponse, ConfPath) <a href="#mk-79e69ffbc022" id="mk-79e69ffbc022"></a>

```java
public static com.tailf.conf.ConfException mk(
    com.tailf.conf.ConfResponse r,
    com.tailf.conf.ConfPath errPath
)
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9), [ConfResponse](ConfResponse.md#confresponse-fd02dad17b49), [ConfPath](ConfPath.md#confpath-327831c6fc7d)

**Parameters**

- `com.tailf.conf.ConfResponse r`
- `com.tailf.conf.ConfPath errPath`
