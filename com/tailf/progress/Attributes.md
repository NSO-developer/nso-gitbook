<a id="s-Attributes"></a>
# Attributes

```java
public class com.tailf.progress.Attributes
```

` Attributes ` class is used to create,
 and manipulate progress trace attributes. Attributes
 can be used when creating a new event or span.

## Members

**Constructors**:

- [Attributes()](#s-Attributes-1)
- [Attributes(String, String)](#s-Attributes-2)

**Methods**:

- [clear()](#s-clear)
- [contains(String)](#s-contains)
- [fromMap(HashMap<String,String>)](#s-fromMap)
- [getValue(String)](#s-getValue)
- [merge(Attributes)](#s-merge)
- [set(String, String)](#s-set)
- [toMap()](#s-toMap)

## Constructors

<a id="s-Attributes-1"></a>
### Attributes()

```java
public Attributes()
```

Instantiate an empty attribute object

<a id="s-Attributes-2"></a>
### Attributes(String, String)

```java
public Attributes(String name, String value)
```

Instantiate an attribute object

**Parameters**

- `String name` - the name of the attribute
- `String value` - the value of the attribute


## Methods

<a id="s-clear"></a>
### clear()

```java
public void clear()
```

Clear all existng attributes

<a id="s-contains"></a>
### contains(String)

```java
public boolean contains(String name)
```

Check if attribute exists by its name

**Parameters**

- `String name` - the atrribute's name

**Returns:** true if the attribute exists,
 false otherwise

<a id="s-fromMap"></a>
### fromMap(HashMap<String,String>)

```java
public static com.tailf.progress.Attributes fromMap(java.util.HashMap<String,String> map)
```

Types: [Attributes](Attributes.md#s-Attributes)

Build attributes from a `HashMap`

**Parameters**

- `java.util.HashMap<String,String> map` - attributes in `HashMap`

**Returns:** [`Attributes`](Attributes.md#s-Attributes) object

<a id="s-getValue"></a>
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

<a id="s-merge"></a>
### merge(Attributes)

```java
public com.tailf.progress.Attributes merge(com.tailf.progress.Attributes otherAttrs)
```

Types: [Attributes](Attributes.md#s-Attributes)

Merge 2 attribute objects

**Parameters**

- `com.tailf.progress.Attributes otherAttrs` - other attributes

**Returns:** a new [`Attributes`](Attributes.md#s-Attributes) object

<a id="s-set"></a>
### set(String, String)

```java
public void set(String name, String value)
```

Set an attribute name and value

**Parameters**

- `String name` - the name of the attribute
- `String value` - the value of the attribute

<a id="s-toMap"></a>
### toMap()

```java
public java.util.HashMap<String,String> toMap()
```

Convert the current attributes to
 `HashMap` format

**Returns:** attributes in `HashMap`
