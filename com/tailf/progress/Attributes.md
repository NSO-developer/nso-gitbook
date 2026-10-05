# Attributes <a href="#cls-Attributes" id="cls-Attributes"></a>

```java
public class com.tailf.progress.Attributes
```

` Attributes ` class is used to create,
 and manipulate progress trace attributes. Attributes
 can be used when creating a new event or span.

## Members

**Constructors**:

- [Attributes()](#m-Attributes-a6d98204d2be)
- [Attributes(String, String)](#m-Attributes-d2ef445b0bc4)

**Methods**:

- [clear()](#m-clear-ca3baec040cb)
- [contains(String)](#m-contains-e4bc1b0057b7)
- [fromMap(HashMap<String,String>)](#m-fromMap-0ea45f2e9170)
- [getValue(String)](#m-getValue-9dc706042d5b)
- [merge(Attributes)](#m-merge-d3ebdfaf5faf)
- [set(String, String)](#m-set-6cacddbc8231)
- [toMap()](#m-toMap-36a006e0d56a)

## Constructors

### Attributes() <a href="#m-Attributes-a6d98204d2be" id="m-Attributes-a6d98204d2be"></a>

```java
public Attributes()
```

Instantiate an empty attribute object

### Attributes(String, String) <a href="#m-Attributes-d2ef445b0bc4" id="m-Attributes-d2ef445b0bc4"></a>

```java
public Attributes(String name, String value)
```

Instantiate an attribute object

**Parameters**

- `String name` - the name of the attribute
- `String value` - the value of the attribute


## Methods

### clear() <a href="#m-clear-ca3baec040cb" id="m-clear-ca3baec040cb"></a>

```java
public void clear()
```

Clear all existng attributes

### contains(String) <a href="#m-contains-e4bc1b0057b7" id="m-contains-e4bc1b0057b7"></a>

```java
public boolean contains(String name)
```

Check if attribute exists by its name

**Parameters**

- `String name` - the atrribute's name

**Returns:** true if the attribute exists,
 false otherwise

### fromMap(HashMap<String,String>) <a href="#m-fromMap-0ea45f2e9170" id="m-fromMap-0ea45f2e9170"></a>

```java
public static com.tailf.progress.Attributes fromMap(java.util.HashMap<String,String> map)
```

Types: [Attributes](Attributes.md#cls-Attributes)

Build attributes from a `HashMap`

**Parameters**

- `java.util.HashMap<String,String> map` - attributes in `HashMap`

**Returns:** [`Attributes`](Attributes.md#cls-Attributes) object

### getValue(String) <a href="#m-getValue-9dc706042d5b" id="m-getValue-9dc706042d5b"></a>

```java
public String getValue(String name)
```

Get an attribute's value

**Parameters**

- `String name` - the atrribute's name

**Returns:** the value as `String`. This
 can return `null` if the value
 is not found.

### merge(Attributes) <a href="#m-merge-d3ebdfaf5faf" id="m-merge-d3ebdfaf5faf"></a>

```java
public com.tailf.progress.Attributes merge(com.tailf.progress.Attributes otherAttrs)
```

Types: [Attributes](Attributes.md#cls-Attributes)

Merge 2 attribute objects

**Parameters**

- `com.tailf.progress.Attributes otherAttrs` - other attributes

**Returns:** a new [`Attributes`](Attributes.md#cls-Attributes) object

### set(String, String) <a href="#m-set-6cacddbc8231" id="m-set-6cacddbc8231"></a>

```java
public void set(String name, String value)
```

Set an attribute name and value

**Parameters**

- `String name` - the name of the attribute
- `String value` - the value of the attribute

### toMap() <a href="#m-toMap-36a006e0d56a" id="m-toMap-36a006e0d56a"></a>

```java
public java.util.HashMap<String,String> toMap()
```

Convert the current attributes to
 `HashMap` format

**Returns:** attributes in `HashMap`
