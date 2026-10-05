# NedExpectResult <a href="#nedexpectresult-cbdbaf0f9e87" id="nedexpectresult-cbdbaf0f9e87"></a>

```java
public class com.tailf.ned.NedExpectResult
```

The result of a expect() method invocation. It contains
 the text accumulated by the expect method and which
 pattern was matched.

## Members

**Constructors**:

- [NedExpectResult(int, String)](#nedexpectresult-066aa0c6fc6d)
- [NedExpectResult(int, String, String)](#nedexpectresult-7f02cc765eaa)

**Methods**:

- [getHit()](#gethit-282efa757bc8)
- [getMatch()](#getmatch-554153f4610e)
- [getText()](#gettext-e63d55fcdcbd)

## Constructors

### NedExpectResult(int, String) <a href="#nedexpectresult-066aa0c6fc6d" id="nedexpectresult-066aa0c6fc6d"></a>

```java
public NedExpectResult(int hit, String text)
```

**Parameters**

- `int hit`
- `String text`

### NedExpectResult(int, String, String) <a href="#nedexpectresult-7f02cc765eaa" id="nedexpectresult-7f02cc765eaa"></a>

```java
public NedExpectResult(int hit, String text, String match)
```

**Parameters**

- `int hit`
- `String text`
- `String match`


## Methods

### getHit() <a href="#gethit-282efa757bc8" id="gethit-282efa757bc8"></a>

```java
public int getHit()
```

### getMatch() <a href="#getmatch-554153f4610e" id="getmatch-554153f4610e"></a>

```java
public String getMatch()
```

### getText() <a href="#gettext-e63d55fcdcbd" id="gettext-e63d55fcdcbd"></a>

```java
public String getText()
```
