# CdbException <a href="#cdbexception-a14a27a1a190" id="cdbexception-a14a27a1a190"></a>

```java
public class com.tailf.cdb.CdbException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Cdb package generic exception

**Related classes**

- [CdbExtendedException](CdbExtendedException.md#cdbextendedexception-9de7535dd8dd)

## Members

**Constructors**:

- [CdbException(String)](#cdbexception-712018a53039)
- [CdbException(String, ErrorCode)](#cdbexception-aa046b728f43)
- [CdbException(String, ErrorCode, Throwable)](#cdbexception-f772b12ea6ee)
- [CdbException(String, int)](#cdbexception-1a95721d5c78)
- [CdbException(String, int, Throwable)](#cdbexception-9adb758e9e8e)
- [CdbException(String, Throwable)](#cdbexception-5e6f61025d70)
- [CdbException(Throwable)](#cdbexception-7a4196d4ccee)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#geterrorcode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#getopaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](#mk-de1cedfc6ea8)
- [mk(ConfResponse, ConfPath)](#mk-79e69ffbc022)

## Constructors

### CdbException(String) <a href="#cdbexception-712018a53039" id="cdbexception-712018a53039"></a>

```java
public CdbException(String msg)
```

**Parameters**

- `String msg`

### CdbException(String, ErrorCode) <a href="#cdbexception-aa046b728f43" id="cdbexception-aa046b728f43"></a>

```java
public CdbException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](../conf/ErrorCode.md#errorcode-65263de08890)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

### CdbException(String, ErrorCode, Throwable) <a href="#cdbexception-f772b12ea6ee" id="cdbexception-f772b12ea6ee"></a>

```java
public CdbException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#errorcode-65263de08890)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

### CdbException(String, int) <a href="#cdbexception-1a95721d5c78" id="cdbexception-1a95721d5c78"></a>

```java
public CdbException(String msg, int codeInteger)
```

**Parameters**

- `String msg`
- `int codeInteger`

### CdbException(String, int, Throwable) <a href="#cdbexception-9adb758e9e8e" id="cdbexception-9adb758e9e8e"></a>

```java
public CdbException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`

### CdbException(String, Throwable) <a href="#cdbexception-5e6f61025d70" id="cdbexception-5e6f61025d70"></a>

```java
public CdbException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`

### CdbException(Throwable) <a href="#cdbexception-7a4196d4ccee" id="cdbexception-7a4196d4ccee"></a>

```java
public CdbException(Throwable t)
```

**Parameters**

- `Throwable t`


## Methods

### mk(ConfResponse) <a href="#mk-de1cedfc6ea8" id="mk-de1cedfc6ea8"></a>

```java
public static com.tailf.conf.ConfException mk(com.tailf.conf.ConfResponse r)
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9), [ConfResponse](../conf/ConfResponse.md#confresponse-fd02dad17b49)

**Parameters**

- `com.tailf.conf.ConfResponse r`

### mk(ConfResponse, ConfPath) <a href="#mk-79e69ffbc022" id="mk-79e69ffbc022"></a>

```java
public static com.tailf.conf.ConfException mk(
    com.tailf.conf.ConfResponse r,
    com.tailf.conf.ConfPath path
)
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9), [ConfResponse](../conf/ConfResponse.md#confresponse-fd02dad17b49), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d)

**Parameters**

- `com.tailf.conf.ConfResponse r`
- `com.tailf.conf.ConfPath path`
