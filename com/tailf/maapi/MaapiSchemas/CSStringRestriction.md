# CSStringRestriction <a href="#csstringrestriction-bde26fa14e67" id="csstringrestriction-bde26fa14e67"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.CSStringRestriction
```

## Members

**Constructors**:

- [CSStringRestriction()](#csstringrestriction-3876ae4b99b2)
- [CSStringRestriction(String, boolean, CSStringLength[])](#csstringrestriction-82ebcca0d9d3)

**Fields**:

- [COMPILED_PATTERN](#compiled_pattern-407b0bf7a25d)
- [TEXT_PATTERN](#text_pattern-9f27c2f91100)

**Methods**:

- [getCompiledPattern()](#getcompiledpattern-59c5274d608a)
- [getInvertMatch()](#getinvertmatch-323126ccbf2f)
- [getJavaPattern()](#getjavapattern-91c839a1079c)
- [getLengthArray()](#getlengtharray-9268b7dc6e45)
- [getPatternType()](#getpatterntype-21a9ae22d96b)
- [getTextPattern()](#gettextpattern-a7f518cee006)
- [setCompiledPattern(int)](#setcompiledpattern-3a9c38f879a6)
- [setInvertMatch(boolean)](#setinvertmatch-e00cbbce7115)
- [setJavaPattern(Pattern)](#setjavapattern-7222e0b83e1f)
- [setLengthArray(CSStringLength[])](#setlengtharray-030198126ca6)
- [setPatternType(int)](#setpatterntype-865c414ccb37)
- [setTextPattern(String)](#settextpattern-2901f3b12d12)

## Constructors

### CSStringRestriction() <a href="#csstringrestriction-3876ae4b99b2" id="csstringrestriction-3876ae4b99b2"></a>

```java
protected CSStringRestriction()
```

### CSStringRestriction(String, boolean, CSStringLength[]) <a href="#csstringrestriction-82ebcca0d9d3" id="csstringrestriction-82ebcca0d9d3"></a>

```java
public CSStringRestriction(
    String textPattern,
    boolean invertMatch,
    com.tailf.maapi.MaapiSchemas.CSStringLength[] lengthArr
)
```

Types: [CSStringLength](CSStringLength.md#csstringlength-f40944c587da)

**Parameters**

- `String textPattern`
- `boolean invertMatch`
- `com.tailf.maapi.MaapiSchemas.CSStringLength[] lengthArr`


## Fields

### COMPILED_PATTERN <a href="#compiled_pattern-407b0bf7a25d" id="compiled_pattern-407b0bf7a25d"></a>

```java
public static final int COMPILED_PATTERN = 1;
```

### TEXT_PATTERN <a href="#text_pattern-9f27c2f91100" id="text_pattern-9f27c2f91100"></a>

```java
public static final int TEXT_PATTERN = 2;
```


## Methods

### getCompiledPattern() <a href="#getcompiledpattern-59c5274d608a" id="getcompiledpattern-59c5274d608a"></a>

```java
public int getCompiledPattern()
```

### getInvertMatch() <a href="#getinvertmatch-323126ccbf2f" id="getinvertmatch-323126ccbf2f"></a>

```java
public boolean getInvertMatch()
```

### getJavaPattern() <a href="#getjavapattern-91c839a1079c" id="getjavapattern-91c839a1079c"></a>

```java
public java.util.regex.Pattern getJavaPattern()
```

### getLengthArray() <a href="#getlengtharray-9268b7dc6e45" id="getlengtharray-9268b7dc6e45"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSStringLength[] getLengthArray()
```

Types: [CSStringLength](CSStringLength.md#csstringlength-f40944c587da)

### getPatternType() <a href="#getpatterntype-21a9ae22d96b" id="getpatterntype-21a9ae22d96b"></a>

```java
public int getPatternType()
```

### getTextPattern() <a href="#gettextpattern-a7f518cee006" id="gettextpattern-a7f518cee006"></a>

```java
public String getTextPattern()
```

### setCompiledPattern(int) <a href="#setcompiledpattern-3a9c38f879a6" id="setcompiledpattern-3a9c38f879a6"></a>

```java
protected void setCompiledPattern(int compiledPattern)
```

**Parameters**

- `int compiledPattern`

### setInvertMatch(boolean) <a href="#setinvertmatch-e00cbbce7115" id="setinvertmatch-e00cbbce7115"></a>

```java
protected void setInvertMatch(boolean invertMatch)
```

**Parameters**

- `boolean invertMatch`

### setJavaPattern(Pattern) <a href="#setjavapattern-7222e0b83e1f" id="setjavapattern-7222e0b83e1f"></a>

```java
protected void setJavaPattern(java.util.regex.Pattern javaPattern)
```

**Parameters**

- `java.util.regex.Pattern javaPattern`

### setLengthArray(CSStringLength[]) <a href="#setlengtharray-030198126ca6" id="setlengtharray-030198126ca6"></a>

```java
protected void setLengthArray(com.tailf.maapi.MaapiSchemas.CSStringLength[] lengthArr)
```

Types: [CSStringLength](CSStringLength.md#csstringlength-f40944c587da)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSStringLength[] lengthArr`

### setPatternType(int) <a href="#setpatterntype-865c414ccb37" id="setpatterntype-865c414ccb37"></a>

```java
protected void setPatternType(int patternType)
```

**Parameters**

- `int patternType`

### setTextPattern(String) <a href="#settextpattern-2901f3b12d12" id="settextpattern-2901f3b12d12"></a>

```java
protected void setTextPattern(String textPattern)
```

**Parameters**

- `String textPattern`
