# Attributes <a href="#attributes-ca725b6502c4" id="attributes-ca725b6502c4"></a>

```java
public class com.tailf.progress.Attributes
```

` Attributes ` class is used to create,
 and manipulate progress trace attributes. Attributes
 can be used when creating a new event or span.

## Members

**Constructors**:

- [Attributes()](#attributes-a6d98204d2be)
- [Attributes(String, String)](#attributes-d2ef445b0bc4)

**Methods**:

- [clear()](#clear-ca3baec040cb)
- [contains(String)](#contains-e4bc1b0057b7)
- [fromMap(HashMap<String,String>)](#frommap-0ea45f2e9170)
- [getValue(String)](#getvalue-9dc706042d5b)
- [merge(Attributes)](#merge-d3ebdfaf5faf)
- [set(String, String)](#set-6cacddbc8231)
- [toMap()](#tomap-36a006e0d56a)

## Constructors

### Attributes() <a href="#attributes-a6d98204d2be" id="attributes-a6d98204d2be"></a>

```java
public Attributes()
```

Instantiate an empty attribute object

### Attributes(String, String) <a href="#attributes-d2ef445b0bc4" id="attributes-d2ef445b0bc4"></a>

```java
public Attributes(String name, String value)
```

Instantiate an attribute object

**Parameters**

- `String name` - the name of the attribute
- `String value` - the value of the attribute


## Methods

### clear() <a href="#clear-ca3baec040cb" id="clear-ca3baec040cb"></a>

```java
public void clear()
```

Clear all existng attributes

### contains(String) <a href="#contains-e4bc1b0057b7" id="contains-e4bc1b0057b7"></a>

```java
public boolean contains(String name)
```

Check if attribute exists by its name

**Parameters**

- `String name` - the atrribute's name

**Returns:** true if the attribute exists,
 false otherwise

### fromMap(HashMap&lt;String,String&gt;) <a href="#frommap-0ea45f2e9170" id="frommap-0ea45f2e9170"></a>

```java
public static com.tailf.progress.Attributes fromMap(java.util.HashMap<String,String> map)
```

Types: [Attributes](Attributes.md#attributes-ca725b6502c4)

Build attributes from a `HashMap`

**Parameters**

- `java.util.HashMap<String,String> map` - attributes in `HashMap`

**Returns:** [`Attributes`](Attributes.md#attributes-ca725b6502c4) object

### getValue(String) <a href="#getvalue-9dc706042d5b" id="getvalue-9dc706042d5b"></a>

```java
public String getValue(String name)
```

Get an attribute's value

**Parameters**

- `String name` - the atrribute's name

**Returns:** the value as `String`. This
 can return `null` if the value
 is not found.

### merge(Attributes) <a href="#merge-d3ebdfaf5faf" id="merge-d3ebdfaf5faf"></a>

```java
public com.tailf.progress.Attributes merge(com.tailf.progress.Attributes otherAttrs)
```

Types: [Attributes](Attributes.md#attributes-ca725b6502c4)

Merge 2 attribute objects

**Parameters**

- `com.tailf.progress.Attributes otherAttrs` - other attributes

**Returns:** a new [`Attributes`](Attributes.md#attributes-ca725b6502c4) object

### set(String, String) <a href="#set-6cacddbc8231" id="set-6cacddbc8231"></a>

```java
public void set(String name, String value)
```

Set an attribute name and value

**Parameters**

- `String name` - the name of the attribute
- `String value` - the value of the attribute

### toMap() <a href="#tomap-36a006e0d56a" id="tomap-36a006e0d56a"></a>

```java
public java.util.HashMap<String,String> toMap()
```

Convert the current attributes to
 `HashMap` format

**Returns:** attributes in `HashMap`
