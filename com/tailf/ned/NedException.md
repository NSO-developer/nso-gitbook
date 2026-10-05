# NedException <a href="#cls-NedException" id="cls-NedException"></a>

```java
public class com.tailf.ned.NedException
    extends Exception
```

Exception raised from the NED package

## Members

**Constructors**:

- [NedException(NedErrorCode, String)](#m-NedException-b9f14788dc0a)
- [NedException(NedErrorCode, String, Throwable)](#m-NedException-076b429c0440)

**Methods**:

- [getNedErrorCode()](#m-getNedErrorCode-452b35680338)

## Constructors

### NedException(NedErrorCode, String) <a href="#m-NedException-b9f14788dc0a" id="m-NedException-b9f14788dc0a"></a>

```java
public NedException(com.tailf.ned.NedErrorCode aCode, String msg)
```

Types: [NedErrorCode](NedErrorCode.md#cls-NedErrorCode)

**Parameters**

- `com.tailf.ned.NedErrorCode aCode`
- `String msg`

### NedException(NedErrorCode, String, Throwable) <a href="#m-NedException-076b429c0440" id="m-NedException-076b429c0440"></a>

```java
public NedException(com.tailf.ned.NedErrorCode aCode, String msg, Throwable cause)
```

Types: [NedErrorCode](NedErrorCode.md#cls-NedErrorCode)

**Parameters**

- `com.tailf.ned.NedErrorCode aCode`
- `String msg`
- `Throwable cause`


## Methods

### getNedErrorCode() <a href="#m-getNedErrorCode-452b35680338" id="m-getNedErrorCode-452b35680338"></a>

```java
public com.tailf.ned.NedErrorCode getNedErrorCode()
```

Types: [NedErrorCode](NedErrorCode.md#cls-NedErrorCode)
