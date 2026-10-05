# NavuException <a href="#cls-NavuException" id="cls-NavuException"></a>

```java
public class com.tailf.navu.NavuException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Exception raised from the navu package

**Related classes**

- [IllegalParentNavuNodeException](IllegalParentNavuNodeException.md#cls-IllegalParentNavuNodeException)
- [NavuSAXException](NavuSAXException.md#cls-NavuSAXException)
- [NoSuchNavuCaseException](NoSuchNavuCaseException.md#cls-NoSuchNavuCaseException)
- [NoSuchNavuChoiceException](NoSuchNavuChoiceException.md#cls-NoSuchNavuChoiceException)
- [NoSuchNavuNodeException](NoSuchNavuNodeException.md#cls-NoSuchNavuNodeException)

## Members

**Constructors**:

- [NavuException(ConfException)](#m-NavuException-cb130257ec60)
- [NavuException(IOException)](#m-NavuException-77041496a997)
- [NavuException(MaapiException)](#m-NavuException-5c5a496fd22b)
- [NavuException(String)](#m-NavuException-a3ed40280047)
- [NavuException(String, ConfException)](#m-NavuException-a4ac943843f8)
- [NavuException(String, ErrorCode, Throwable)](#m-NavuException-011f1640694f)
- [NavuException(String, int, Throwable)](#m-NavuException-5613700dce64)
- [NavuException(String, Throwable)](#m-NavuException-f8be029568e4)
- [NavuException(Throwable)](#m-NavuException-d0b010924c53)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#m-getErrorCode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getOpaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](#m-mk-de1cedfc6ea8)
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#m-mk-79e69ffbc022) from ConfException

## Constructors

### NavuException(ConfException) <a href="#m-NavuException-cb130257ec60" id="m-NavuException-cb130257ec60"></a>

```java
public NavuException(com.tailf.conf.ConfException e)
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfException e`

### NavuException(IOException) <a href="#m-NavuException-77041496a997" id="m-NavuException-77041496a997"></a>

```java
public NavuException(java.io.IOException e)
```

**Parameters**

- `java.io.IOException e`

### NavuException(MaapiException) <a href="#m-NavuException-5c5a496fd22b" id="m-NavuException-5c5a496fd22b"></a>

```java
public NavuException(com.tailf.maapi.MaapiException e)
```

Types: [MaapiException](../maapi/MaapiException.md#cls-MaapiException)

**Parameters**

- `com.tailf.maapi.MaapiException e`

### NavuException(String) <a href="#m-NavuException-a3ed40280047" id="m-NavuException-a3ed40280047"></a>

```java
public NavuException(String msg)
```

**Parameters**

- `String msg`

### NavuException(String, ConfException) <a href="#m-NavuException-a4ac943843f8" id="m-NavuException-a4ac943843f8"></a>

```java
public NavuException(String msg, com.tailf.conf.ConfException e)
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `String msg` - a message describing the exception.
- `com.tailf.conf.ConfException e`

### NavuException(String, ErrorCode, Throwable) <a href="#m-NavuException-011f1640694f" id="m-NavuException-011f1640694f"></a>

```java
public NavuException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String msg` - a message describing the exception.
- `com.tailf.conf.ErrorCode code` - a code classifying the exception.
- `Throwable cause`

### NavuException(String, int, Throwable) <a href="#m-NavuException-5613700dce64" id="m-NavuException-5613700dce64"></a>

```java
public NavuException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`

### NavuException(String, Throwable) <a href="#m-NavuException-f8be029568e4" id="m-NavuException-f8be029568e4"></a>

```java
public NavuException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`

### NavuException(Throwable) <a href="#m-NavuException-d0b010924c53" id="m-NavuException-d0b010924c53"></a>

```java
public NavuException(Throwable cause)
```

**Parameters**

- `Throwable cause`


## Methods

### mk(ConfResponse) <a href="#m-mk-de1cedfc6ea8" id="m-mk-de1cedfc6ea8"></a>

```java
public static com.tailf.conf.ConfException mk(com.tailf.conf.ConfResponse r)
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException), [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse)

**Parameters**

- `com.tailf.conf.ConfResponse r`
