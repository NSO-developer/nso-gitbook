<a id="s-CSSchema"></a>
# CSSchema

```java
public static class com.tailf.maapi.MaapiSchemas.CSSchema
```

The Schema Container class. Contains the first root node, if available,
 of the schema as well as other information about the schema and its named
 types.

 It is instances of this class that is retrieved using method findSchema
 see [`MaapiSchemas`](../MaapiSchemas.md#s-MaapiSchemas) and
 [`MaapiSchemas`](../MaapiSchemas.md#s-MaapiSchemas)

## Members

**Constructors**:

- [CSSchema(int, String)](#s-CSSchema-1)
- [CSSchema(int, String, String, String, String, String)](#s-CSSchema-2)

**Methods**:

- [addType(CSNamedType)](#s-addType)
- [equals(Object)](#s-equals)
- [getModule()](#s-getModule)
- [getNamedTypes()](#s-getNamedTypes)
- [getNS()](#s-getNS)
- [getNSHash()](#s-getNSHash)
- [getPrefix()](#s-getPrefix)
- [getRevision()](#s-getRevision)
- [getRootNode()](#s-getRootNode)
- [getURI()](#s-getURI)
- [hashCode()](#s-hashCode)
- [isDynamic()](#s-isDynamic)
- [setRoot(CSNode)](#s-setRoot)
- [toString()](#s-toString)

## Constructors

<a id="s-CSSchema-1"></a>
### CSSchema(int, String)

```java
public CSSchema(int nshash, String namespace)
```

**Parameters**

- `int nshash`
- `String namespace`

<a id="s-CSSchema-2"></a>
### CSSchema(int, String, String, String, String, String)

```java
public CSSchema(
    int nshash,
    String namespace,
    String uri,
    String prefix,
    String revision,
    String module
)
```

**Parameters**

- `int nshash`
- `String namespace`
- `String uri`
- `String prefix`
- `String revision`
- `String module`


## Methods

<a id="s-addType"></a>
### addType(CSNamedType)

```java
public void addType(com.tailf.maapi.MaapiSchemas.CSNamedType type)
```

Types: [CSNamedType](CSNamedType.md#s-CSNamedType)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNamedType type`

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

<a id="s-getModule"></a>
### getModule()

```java
public String getModule()
```

Get module name

**Returns:** String module

<a id="s-getNamedTypes"></a>
### getNamedTypes()

```java
public java.util.Hashtable<String,com.tailf.maapi.MaapiSchemas.CSNamedType> getNamedTypes()
```

Types: [CSNamedType](CSNamedType.md#s-CSNamedType)

Get a Hashtable of all named types, the Hashtable has the type names
 as keys represented as strings and the types as values represented as
 CSType objects.

**Returns:** Hashtable of named types

<a id="s-getNS"></a>
### getNS()

```java
public String getNS()
```

Get Namespace string. Usually it is unique string that
 defines the namespace .
 (for example: "http://acme.example.com/system")

**Returns:** String Namespace string

<a id="s-getNSHash"></a>
### getNSHash()

```java
public int getNSHash()
```

Get Namespace hashvalue

**Returns:** int hashvalue

<a id="s-getPrefix"></a>
### getPrefix()

```java
public String getPrefix()
```

Get Namespace prefix string

**Returns:** String Namespace prefix string

<a id="s-getRevision"></a>
### getRevision()

```java
public String getRevision()
```

Get schema revision

**Returns:** String revision

<a id="s-getRootNode"></a>
### getRootNode()

```java
public com.tailf.maapi.MaapiSchemas.CSNode getRootNode()
```

Types: [CSNode](CSNode.md#s-CSNode)

Get first Schema root node. Note, that a Schema can have several
 nodes on root level in parallel, this method retrieves the first root
 node. Also, a schema does not necessarily have any root node
 then this method returns null.

**Returns:** CSNode the first root node or null if no root node exists

<a id="s-getURI"></a>
### getURI()

```java
public String getURI()
```

Get Schema uri string

**Returns:** String Schema uri string

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-isDynamic"></a>
### isDynamic()

```java
public boolean isDynamic()
```

Check if Schema is dynamically lalala

**Returns:** boolean true if dynamically lalala

<a id="s-setRoot"></a>
### setRoot(CSNode)

```java
public void setRoot(com.tailf.maapi.MaapiSchemas.CSNode root)
```

Types: [CSNode](CSNode.md#s-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode root`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Informative string representation of a CSSchema instance

**Returns:** String
