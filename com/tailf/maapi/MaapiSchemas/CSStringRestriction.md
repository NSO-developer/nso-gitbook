<a id="cls-CSStringRestriction"></a>
# CSStringRestriction

```java
public static class com.tailf.maapi.MaapiSchemas.CSStringRestriction
```

## Members

**Constructors**:

- [CSStringRestriction()](#m-csstringrestriction-3876ae4b99b2)
- [CSStringRestriction(String, boolean, CSStringLength[])](#m-csstringrestriction-82ebcca0d9d3)

**Fields**:

- [COMPILED_PATTERN](#m-COMPILED_PATTERN)
- [TEXT_PATTERN](#m-TEXT_PATTERN)

**Methods**:

- [getCompiledPattern()](#m-getcompiledpattern-59c5274d608a)
- [getInvertMatch()](#m-getinvertmatch-323126ccbf2f)
- [getJavaPattern()](#m-getjavapattern-91c839a1079c)
- [getLengthArray()](#m-getlengtharray-9268b7dc6e45)
- [getPatternType()](#m-getpatterntype-21a9ae22d96b)
- [getTextPattern()](#m-gettextpattern-a7f518cee006)
- [setCompiledPattern(int)](#m-setcompiledpattern-3a9c38f879a6)
- [setInvertMatch(boolean)](#m-setinvertmatch-e00cbbce7115)
- [setJavaPattern(Pattern)](#m-setjavapattern-7222e0b83e1f)
- [setLengthArray(CSStringLength[])](#m-setlengtharray-030198126ca6)
- [setPatternType(int)](#m-setpatterntype-865c414ccb37)
- [setTextPattern(String)](#m-settextpattern-2901f3b12d12)

## Constructors

<a id="m-csstringrestriction-3876ae4b99b2"></a>
### CSStringRestriction()

```java
protected CSStringRestriction()
```

<a id="m-csstringrestriction-82ebcca0d9d3"></a>
### CSStringRestriction(String, boolean, CSStringLength[])

```java
public CSStringRestriction(
    String textPattern,
    boolean invertMatch,
    com.tailf.maapi.MaapiSchemas.CSStringLength[] lengthArr
)
```

Types: [CSStringLength](CSStringLength.md#cls-CSStringLength)

**Parameters**

- `String textPattern`
- `boolean invertMatch`
- `com.tailf.maapi.MaapiSchemas.CSStringLength[] lengthArr`


## Fields

<a id="m-COMPILED_PATTERN"></a>
### COMPILED_PATTERN

```java
public static final int COMPILED_PATTERN = 1;
```

<a id="m-TEXT_PATTERN"></a>
### TEXT_PATTERN

```java
public static final int TEXT_PATTERN = 2;
```


## Methods

<a id="m-getcompiledpattern-59c5274d608a"></a>
### getCompiledPattern()

```java
public int getCompiledPattern()
```

<a id="m-getinvertmatch-323126ccbf2f"></a>
### getInvertMatch()

```java
public boolean getInvertMatch()
```

<a id="m-getjavapattern-91c839a1079c"></a>
### getJavaPattern()

```java
public java.util.regex.Pattern getJavaPattern()
```

<a id="m-getlengtharray-9268b7dc6e45"></a>
### getLengthArray()

```java
public com.tailf.maapi.MaapiSchemas.CSStringLength[] getLengthArray()
```

Types: [CSStringLength](CSStringLength.md#cls-CSStringLength)

<a id="m-getpatterntype-21a9ae22d96b"></a>
### getPatternType()

```java
public int getPatternType()
```

<a id="m-gettextpattern-a7f518cee006"></a>
### getTextPattern()

```java
public String getTextPattern()
```

<a id="m-setcompiledpattern-3a9c38f879a6"></a>
### setCompiledPattern(int)

```java
protected void setCompiledPattern(int compiledPattern)
```

**Parameters**

- `int compiledPattern`

<a id="m-setinvertmatch-e00cbbce7115"></a>
### setInvertMatch(boolean)

```java
protected void setInvertMatch(boolean invertMatch)
```

**Parameters**

- `boolean invertMatch`

<a id="m-setjavapattern-7222e0b83e1f"></a>
### setJavaPattern(Pattern)

```java
protected void setJavaPattern(java.util.regex.Pattern javaPattern)
```

**Parameters**

- `java.util.regex.Pattern javaPattern`

<a id="m-setlengtharray-030198126ca6"></a>
### setLengthArray(CSStringLength[])

```java
protected void setLengthArray(com.tailf.maapi.MaapiSchemas.CSStringLength[] lengthArr)
```

Types: [CSStringLength](CSStringLength.md#cls-CSStringLength)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSStringLength[] lengthArr`

<a id="m-setpatterntype-865c414ccb37"></a>
### setPatternType(int)

```java
protected void setPatternType(int patternType)
```

**Parameters**

- `int patternType`

<a id="m-settextpattern-2901f3b12d12"></a>
### setTextPattern(String)

```java
protected void setTextPattern(String textPattern)
```

**Parameters**

- `String textPattern`
