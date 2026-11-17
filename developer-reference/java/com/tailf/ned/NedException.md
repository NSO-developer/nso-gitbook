# NedException <a href="#nedexception-9d3a19f3640e" id="nedexception-9d3a19f3640e"></a>

```java
public class com.tailf.ned.NedException
    extends Exception
```

Exception raised from the NED package

## Members

**Constructors**:

- [NedException\(NedErrorCode, String\)](#nedexception-b9f14788dc0a)
- [NedException\(NedErrorCode, String, Throwable\)](#nedexception-076b429c0440)
- [NedException\(String\)](#nedexception-c57f7245e8d4)
- [NedException\(String, Throwable\)](#nedexception-46fc94b8057e)

**Methods**:

- [getNedErrorCode\(\)](#getnederrorcode-452b35680338)

## Constructors

### NedException(NedErrorCode, String) <a href="#nedexception-b9f14788dc0a" id="nedexception-b9f14788dc0a"></a>

```java
public NedException(com.tailf.ned.NedErrorCode aCode, String msg)
```

Types: [NedErrorCode](NedErrorCode.md#nederrorcode-e5f6e08a55a2)

**Parameters**

- `com.tailf.ned.NedErrorCode aCode`
- `String msg`

### NedException(NedErrorCode, String, Throwable) <a href="#nedexception-076b429c0440" id="nedexception-076b429c0440"></a>

```java
public NedException(com.tailf.ned.NedErrorCode aCode, String msg, Throwable cause)
```

Types: [NedErrorCode](NedErrorCode.md#nederrorcode-e5f6e08a55a2)

**Parameters**

- `com.tailf.ned.NedErrorCode aCode`
- `String msg`
- `Throwable cause`

### NedException(String) <a href="#nedexception-c57f7245e8d4" id="nedexception-c57f7245e8d4"></a>

```java
public NedException(String msg)
```

**Parameters**

- `String msg`

### NedException(String, Throwable) <a href="#nedexception-46fc94b8057e" id="nedexception-46fc94b8057e"></a>

```java
public NedException(String msg, Throwable cause)
```

**Parameters**

- `String msg`
- `Throwable cause`


## Methods

### getNedErrorCode() <a href="#getnederrorcode-452b35680338" id="getnederrorcode-452b35680338"></a>

```java
public com.tailf.ned.NedErrorCode getNedErrorCode()
```

Types: [NedErrorCode](NedErrorCode.md#nederrorcode-e5f6e08a55a2)
