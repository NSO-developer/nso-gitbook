# NedExpectResult <a href="#cls-NedExpectResult" id="cls-NedExpectResult"></a>

```java
public class com.tailf.ned.NedExpectResult
```

The result of a expect() method invocation. It contains
 the text accumulated by the expect method and which
 pattern was matched.

## Members

**Constructors**:

- [NedExpectResult(int, String)](#m-NedExpectResult-066aa0c6fc6d)
- [NedExpectResult(int, String, String)](#m-NedExpectResult-7f02cc765eaa)

**Methods**:

- [getHit()](#m-getHit-282efa757bc8)
- [getMatch()](#m-getMatch-554153f4610e)
- [getText()](#m-getText-e63d55fcdcbd)

## Constructors

### NedExpectResult(int, String) <a href="#m-NedExpectResult-066aa0c6fc6d" id="m-NedExpectResult-066aa0c6fc6d"></a>

```java
public NedExpectResult(int hit, String text)
```

**Parameters**

- `int hit`
- `String text`

### NedExpectResult(int, String, String) <a href="#m-NedExpectResult-7f02cc765eaa" id="m-NedExpectResult-7f02cc765eaa"></a>

```java
public NedExpectResult(int hit, String text, String match)
```

**Parameters**

- `int hit`
- `String text`
- `String match`


## Methods

### getHit() <a href="#m-getHit-282efa757bc8" id="m-getHit-282efa757bc8"></a>

```java
public int getHit()
```

### getMatch() <a href="#m-getMatch-554153f4610e" id="m-getMatch-554153f4610e"></a>

```java
public String getMatch()
```

### getText() <a href="#m-getText-e63d55fcdcbd" id="m-getText-e63d55fcdcbd"></a>

```java
public String getText()
```
