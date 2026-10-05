<a id="cls-NedExpectResult"></a>
# NedExpectResult

```java
public class com.tailf.ned.NedExpectResult
```

The result of a expect() method invocation. It contains
 the text accumulated by the expect method and which
 pattern was matched.

## Members

**Constructors**:

- [NedExpectResult(int, String)](#m-nedexpectresult-066aa0c6fc6d)
- [NedExpectResult(int, String, String)](#m-nedexpectresult-7f02cc765eaa)

**Methods**:

- [getHit()](#m-gethit-282efa757bc8)
- [getMatch()](#m-getmatch-554153f4610e)
- [getText()](#m-gettext-e63d55fcdcbd)

## Constructors

<a id="m-nedexpectresult-066aa0c6fc6d"></a>
### NedExpectResult(int, String)

```java
public NedExpectResult(int hit, String text)
```

**Parameters**

- `int hit`
- `String text`

<a id="m-nedexpectresult-7f02cc765eaa"></a>
### NedExpectResult(int, String, String)

```java
public NedExpectResult(int hit, String text, String match)
```

**Parameters**

- `int hit`
- `String text`
- `String match`


## Methods

<a id="m-gethit-282efa757bc8"></a>
### getHit()

```java
public int getHit()
```

<a id="m-getmatch-554153f4610e"></a>
### getMatch()

```java
public String getMatch()
```

<a id="m-gettext-e63d55fcdcbd"></a>
### getText()

```java
public String getText()
```
