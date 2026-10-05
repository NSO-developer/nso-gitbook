# CSSchema <a href="#cls-CSSchema" id="cls-CSSchema"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.CSSchema
```

The Schema Container class. Contains the first root node, if available,
 of the schema as well as other information about the schema and its named
 types.

 It is instances of this class that is retrieved using method findSchema
 see [`MaapiSchemas#findCSSchema(int)`](../MaapiSchemas.md#m-findCSSchema-880b1533ffd2) and
 [`MaapiSchemas#findCSSchema(String)`](../MaapiSchemas.md#m-findCSSchema-6023156b0628)

## Members

**Constructors**:

- [CSSchema(int, String)](#m-CSSchema-f9e5989e119d)
- [CSSchema(int, String, String, String, String, String)](#m-CSSchema-1d155be5067d)

**Methods**:

- [addType(CSNamedType)](#m-addType-f27eb8b6623c)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getModule()](#m-getModule-68694513ccce)
- [getNamedTypes()](#m-getNamedTypes-ac976f4fda73)
- [getNS()](#m-getNS-3613c99d8888)
- [getNSHash()](#m-getNSHash-2129fb8b3cfe)
- [getPrefix()](#m-getPrefix-9268091e0223)
- [getRevision()](#m-getRevision-b0088aa9f0bf)
- [getRootNode()](#m-getRootNode-eed9b3c70129)
- [getURI()](#m-getURI-7ec1ffd8cd93)
- [hashCode()](#m-hashCode-ef797a217903)
- [isDynamic()](#m-isDynamic-6b453d4ad739)
- [setRoot(CSNode)](#m-setRoot-4ba56f7c3847)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### CSSchema(int, String) <a href="#m-CSSchema-f9e5989e119d" id="m-CSSchema-f9e5989e119d"></a>

```java
public CSSchema(int nshash, String namespace)
```

**Parameters**

- `int nshash`
- `String namespace`

### CSSchema(int, String, String, String, String, String) <a href="#m-CSSchema-1d155be5067d" id="m-CSSchema-1d155be5067d"></a>

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

### addType(CSNamedType) <a href="#m-addType-f27eb8b6623c" id="m-addType-f27eb8b6623c"></a>

```java
public void addType(com.tailf.maapi.MaapiSchemas.CSNamedType type)
```

Types: [CSNamedType](CSNamedType.md#cls-CSNamedType)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNamedType type`

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

### getModule() <a href="#m-getModule-68694513ccce" id="m-getModule-68694513ccce"></a>

```java
public String getModule()
```

Get module name

**Returns:** String module

### getNamedTypes() <a href="#m-getNamedTypes-ac976f4fda73" id="m-getNamedTypes-ac976f4fda73"></a>

```java
public java.util.Hashtable<String,com.tailf.maapi.MaapiSchemas.CSNamedType> getNamedTypes()
```

Types: [CSNamedType](CSNamedType.md#cls-CSNamedType)

Get a Hashtable of all named types, the Hashtable has the type names
 as keys represented as strings and the types as values represented as
 CSType objects.

**Returns:** Hashtable of named types

### getNS() <a href="#m-getNS-3613c99d8888" id="m-getNS-3613c99d8888"></a>

```java
public String getNS()
```

Get Namespace string. Usually it is unique string that
 defines the namespace .
 (for example: "http://acme.example.com/system")

**Returns:** String Namespace string

### getNSHash() <a href="#m-getNSHash-2129fb8b3cfe" id="m-getNSHash-2129fb8b3cfe"></a>

```java
public int getNSHash()
```

Get Namespace hashvalue

**Returns:** int hashvalue

### getPrefix() <a href="#m-getPrefix-9268091e0223" id="m-getPrefix-9268091e0223"></a>

```java
public String getPrefix()
```

Get Namespace prefix string

**Returns:** String Namespace prefix string

### getRevision() <a href="#m-getRevision-b0088aa9f0bf" id="m-getRevision-b0088aa9f0bf"></a>

```java
public String getRevision()
```

Get schema revision

**Returns:** String revision

### getRootNode() <a href="#m-getRootNode-eed9b3c70129" id="m-getRootNode-eed9b3c70129"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getRootNode()
```

Types: [CSNode](CSNode.md#cls-CSNode)

Get first Schema root node. Note, that a Schema can have several
 nodes on root level in parallel, this method retrieves the first root
 node. Also, a schema does not necessarily have any root node
 then this method returns null.

**Returns:** CSNode the first root node or null if no root node exists

### getURI() <a href="#m-getURI-7ec1ffd8cd93" id="m-getURI-7ec1ffd8cd93"></a>

```java
public String getURI()
```

Get Schema uri string

**Returns:** String Schema uri string

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### isDynamic() <a href="#m-isDynamic-6b453d4ad739" id="m-isDynamic-6b453d4ad739"></a>

```java
public boolean isDynamic()
```

Check if Schema is dynamically lalala

**Returns:** boolean true if dynamically lalala

### setRoot(CSNode) <a href="#m-setRoot-4ba56f7c3847" id="m-setRoot-4ba56f7c3847"></a>

```java
public void setRoot(com.tailf.maapi.MaapiSchemas.CSNode root)
```

Types: [CSNode](CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode root`

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Informative string representation of a CSSchema instance

**Returns:** String
