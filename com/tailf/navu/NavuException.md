# NavuException <a href="#navuexception-d80fa0cb4f3f" id="navuexception-d80fa0cb4f3f"></a>

```java
public class com.tailf.navu.NavuException
    extends com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Exception raised from the navu package

**Related classes**

- [IllegalParentNavuNodeException](IllegalParentNavuNodeException.md#illegalparentnavunodeexception-a74e9b9f6d4a)
- [NavuSAXException](NavuSAXException.md#navusaxexception-11da52982a79)
- [NoSuchNavuCaseException](NoSuchNavuCaseException.md#nosuchnavucaseexception-2ffd47d19768)
- [NoSuchNavuChoiceException](NoSuchNavuChoiceException.md#nosuchnavuchoiceexception-553bbfa1348d)
- [NoSuchNavuNodeException](NoSuchNavuNodeException.md#nosuchnavunodeexception-55702ea478b0)

## Members

**Constructors**:

- [NavuException(ConfException)](#navuexception-cb130257ec60)
- [NavuException(IOException)](#navuexception-77041496a997)
- [NavuException(MaapiException)](#navuexception-5c5a496fd22b)
- [NavuException(String)](#navuexception-a3ed40280047)
- [NavuException(String, ConfException)](#navuexception-a4ac943843f8)
- [NavuException(String, ErrorCode, Throwable)](#navuexception-011f1640694f)
- [NavuException(String, int, Throwable)](#navuexception-5613700dce64)
- [NavuException(String, Throwable)](#navuexception-f8be029568e4)
- [NavuException(Throwable)](#navuexception-d0b010924c53)

**Methods**:

- [getErrorCode()](../conf/ConfException.md#geterrorcode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#getopaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](#mk-de1cedfc6ea8)
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#mk-79e69ffbc022) from ConfException

## Constructors

### NavuException(ConfException) <a href="#navuexception-cb130257ec60" id="navuexception-cb130257ec60"></a>

```java
public NavuException(com.tailf.conf.ConfException e)
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.ConfException e`

### NavuException(IOException) <a href="#navuexception-77041496a997" id="navuexception-77041496a997"></a>

```java
public NavuException(java.io.IOException e)
```

**Parameters**

- `java.io.IOException e`

### NavuException(MaapiException) <a href="#navuexception-5c5a496fd22b" id="navuexception-5c5a496fd22b"></a>

```java
public NavuException(com.tailf.maapi.MaapiException e)
```

Types: [MaapiException](../maapi/MaapiException.md#maapiexception-af58eb4e109e)

**Parameters**

- `com.tailf.maapi.MaapiException e`

### NavuException(String) <a href="#navuexception-a3ed40280047" id="navuexception-a3ed40280047"></a>

```java
public NavuException(String msg)
```

**Parameters**

- `String msg`

### NavuException(String, ConfException) <a href="#navuexception-a4ac943843f8" id="navuexception-a4ac943843f8"></a>

```java
public NavuException(String msg, com.tailf.conf.ConfException e)
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String msg` - a message describing the exception.
- `com.tailf.conf.ConfException e`

### NavuException(String, ErrorCode, Throwable) <a href="#navuexception-011f1640694f" id="navuexception-011f1640694f"></a>

```java
public NavuException(String msg, com.tailf.conf.ErrorCode code, Throwable cause)
```

Types: [ErrorCode](../conf/ErrorCode.md#errorcode-65263de08890)

**Parameters**

- `String msg` - a message describing the exception.
- `com.tailf.conf.ErrorCode code` - a code classifying the exception.
- `Throwable cause`

### NavuException(String, int, Throwable) <a href="#navuexception-5613700dce64" id="navuexception-5613700dce64"></a>

```java
public NavuException(String msg, int codeInteger, Throwable cause)
```

**Parameters**

- `String msg`
- `int codeInteger`
- `Throwable cause`

### NavuException(String, Throwable) <a href="#navuexception-f8be029568e4" id="navuexception-f8be029568e4"></a>

```java
public NavuException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`

### NavuException(Throwable) <a href="#navuexception-d0b010924c53" id="navuexception-d0b010924c53"></a>

```java
public NavuException(Throwable cause)
```

**Parameters**

- `Throwable cause`


## Methods

### mk(ConfResponse) <a href="#mk-de1cedfc6ea8" id="mk-de1cedfc6ea8"></a>

```java
public static com.tailf.conf.ConfException mk(com.tailf.conf.ConfResponse r)
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9), [ConfResponse](../conf/ConfResponse.md#confresponse-fd02dad17b49)

**Parameters**

- `com.tailf.conf.ConfResponse r`
