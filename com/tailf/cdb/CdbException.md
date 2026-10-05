<a id="cls-CdbException"></a>
# CdbException

```java
public class com.tailf.cdb.CdbException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Cdb package generic exception

**Related classes**

- [CdbExtendedException](CdbExtendedException.md#cls-CdbExtendedException)

## Members

**Constructors**:

- [CdbException(String)](#m-cdbexception-712018a53039)
- [CdbException(String, ErrorCode)](#m-cdbexception-aa046b728f43)
- [CdbException(String, ErrorCode, Throwable)](#m-cdbexception-f772b12ea6ee)
- [CdbException(String, int)](#m-cdbexception-1a95721d5c78)
- [CdbException(String, int, Throwable)](#m-cdbexception-9adb758e9e8e)
- [CdbException(String, Throwable)](#m-cdbexception-5e6f61025d70)
- [CdbException(Throwable)](#m-cdbexception-7a4196d4ccee)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#m-geterrorcode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getopaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](#m-mk-de1cedfc6ea8)
- [mk(ConfResponse, ConfPath)](#m-mk-79e69ffbc022)

## Constructors

<a id="m-cdbexception-712018a53039"></a>
### CdbException(String)

```java
public CdbException(String msg)
```

**Parameters**

- `String msg`

<a id="m-cdbexception-aa046b728f43"></a>
### CdbException(String, ErrorCode)

```java
public CdbException(String msg, com.tailf.conf.ErrorCode code)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`

<a id="m-cdbexception-f772b12ea6ee"></a>
### CdbException(String, ErrorCode, Throwable)

```java
public CdbException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg`
- `com.tailf.conf.ErrorCode code`
- `Throwable cause`

<a id="m-cdbexception-1a95721d5c78"></a>
### CdbException(String, int)

```java
public CdbException(String msg, int codeInteger)
```

**Parameters**

- `String msg`
- `int codeInteger`

<a id="m-cdbexception-9adb758e9e8e"></a>
### CdbException(String, int, Throwable)

```java
public CdbException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`

<a id="m-cdbexception-5e6f61025d70"></a>
### CdbException(String, Throwable)

```java
public CdbException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`

<a id="m-cdbexception-7a4196d4ccee"></a>
### CdbException(Throwable)

```java
public CdbException(Throwable t)
```

**Parameters**

- `Throwable t`


## Methods

<a id="m-mk-de1cedfc6ea8"></a>
### mk(ConfResponse)

```java
public static com.tailf.conf.ConfException mk(com.tailf.conf.ConfResponse r)
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException), [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse)

**Parameters**

- `com.tailf.conf.ConfResponse r`

<a id="m-mk-79e69ffbc022"></a>
### mk(ConfResponse, ConfPath)

```java
public static com.tailf.conf.ConfException mk(
    com.tailf.conf.ConfResponse r,
    com.tailf.conf.ConfPath path
)
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException), [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse), [ConfPath](../conf/ConfPath.md#cls-ConfPath)

**Parameters**

- `com.tailf.conf.ConfResponse r`
- `com.tailf.conf.ConfPath path`
