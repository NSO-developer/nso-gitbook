# NedException <a href="#nedexception-9d3a19f3640e" id="nedexception-9d3a19f3640e"></a>

```java
public class com.tailf.ned.NedException
    extends Exception
```

Exception raised from the NED package

## Members

**Constructors**:

- [NedException(NedErrorCode, String)](#nedexception-b9f14788dc0a)
- [NedException(NedErrorCode, String, Throwable)](#nedexception-076b429c0440)

**Methods**:

- [getNedErrorCode()](#getnederrorcode-452b35680338)

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


## Methods

### getNedErrorCode() <a href="#getnederrorcode-452b35680338" id="getnederrorcode-452b35680338"></a>

```java
public com.tailf.ned.NedErrorCode getNedErrorCode()
```

Types: [NedErrorCode](NedErrorCode.md#nederrorcode-e5f6e08a55a2)
