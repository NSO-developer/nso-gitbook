<a id="cls-Attributes"></a>
# Attributes

```java
public class com.tailf.progress.Attributes
```

` Attributes ` class is used to create,
 and manipulate progress trace attributes. Attributes
 can be used when creating a new event or span.

## Members

**Constructors**:

- [Attributes()](#m-attributes-a6d98204d2be)
- [Attributes(String, String)](#m-attributes-d2ef445b0bc4)

**Methods**:

- [clear()](#m-clear-ca3baec040cb)
- [contains(String)](#m-contains-e4bc1b0057b7)
- [fromMap(HashMap<String,String>)](#m-frommap-0ea45f2e9170)
- [getValue(String)](#m-getvalue-9dc706042d5b)
- [merge(Attributes)](#m-merge-d3ebdfaf5faf)
- [set(String, String)](#m-set-6cacddbc8231)
- [toMap()](#m-tomap-36a006e0d56a)

## Constructors

<a id="m-attributes-a6d98204d2be"></a>
### Attributes()

```java
public Attributes()
```

Instantiate an empty attribute object

<a id="m-attributes-d2ef445b0bc4"></a>
### Attributes(String, String)

```java
public Attributes(String name, String value)
```

Instantiate an attribute object

**Parameters**

- `String name` - the name of the attribute
- `String value` - the value of the attribute


## Methods

<a id="m-clear-ca3baec040cb"></a>
### clear()

```java
public void clear()
```

Clear all existng attributes

<a id="m-contains-e4bc1b0057b7"></a>
### contains(String)

```java
public boolean contains(String name)
```

Check if attribute exists by its name

**Parameters**

- `String name` - the atrribute's name

**Returns:** true if the attribute exists,
 false otherwise

<a id="m-frommap-0ea45f2e9170"></a>
### fromMap(HashMap<String,String>)

```java
public static com.tailf.progress.Attributes fromMap(java.util.HashMap<String,String> map)
```

Types: [Attributes](Attributes.md#cls-Attributes)

Build attributes from a `HashMap`

**Parameters**

- `java.util.HashMap<String,String> map` - attributes in `HashMap`

**Returns:** [`Attributes`](Attributes.md#cls-Attributes) object

<a id="m-getvalue-9dc706042d5b"></a>
### getValue(String)

```java
public String getValue(String name)
```

Get an attribute's value

**Parameters**

- `String name` - the atrribute's name

**Returns:** the value as `String`. This
 can return `null` if the value
 is not found.

<a id="m-merge-d3ebdfaf5faf"></a>
### merge(Attributes)

```java
public com.tailf.progress.Attributes merge(com.tailf.progress.Attributes otherAttrs)
```

Types: [Attributes](Attributes.md#cls-Attributes)

Merge 2 attribute objects

**Parameters**

- `com.tailf.progress.Attributes otherAttrs` - other attributes

**Returns:** a new [`Attributes`](Attributes.md#cls-Attributes) object

<a id="m-set-6cacddbc8231"></a>
### set(String, String)

```java
public void set(String name, String value)
```

Set an attribute name and value

**Parameters**

- `String name` - the name of the attribute
- `String value` - the value of the attribute

<a id="m-tomap-36a006e0d56a"></a>
### toMap()

```java
public java.util.HashMap<String,String> toMap()
```

Convert the current attributes to
 `HashMap` format

**Returns:** attributes in `HashMap`
