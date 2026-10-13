# CSSchema <a href="#csschema-f51a58180f67" id="csschema-f51a58180f67"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.CSSchema
```

The Schema Container class. Contains the first root node, if available,
 of the schema as well as other information about the schema and its named
 types.

 It is instances of this class that is retrieved using method findSchema
 see [`MaapiSchemas#findCSSchema(int)`](../MaapiSchemas.md#findcsschema-880b1533ffd2) and
 [`MaapiSchemas#findCSSchema(String)`](../MaapiSchemas.md#findcsschema-6023156b0628)

## Members

**Constructors**:

- [CSSchema\(int, String\)](#csschema-f9e5989e119d)
- [CSSchema\(int, String, String, String, String, String\)](#csschema-1d155be5067d)

**Methods**:

- [addType\(CSNamedType\)](#addtype-f27eb8b6623c)
- [equals\(Object\)](#equals-fcd6492e0d6c)
- [getModule\(\)](#getmodule-68694513ccce)
- [getNamedTypes\(\)](#getnamedtypes-ac976f4fda73)
- [getNS\(\)](#getns-3613c99d8888)
- [getNSHash\(\)](#getnshash-2129fb8b3cfe)
- [getPrefix\(\)](#getprefix-9268091e0223)
- [getRevision\(\)](#getrevision-b0088aa9f0bf)
- [getRootNode\(\)](#getrootnode-eed9b3c70129)
- [getURI\(\)](#geturi-7ec1ffd8cd93)
- [hashCode\(\)](#hashcode-ef797a217903)
- [isDynamic\(\)](#isdynamic-6b453d4ad739)
- [setRoot\(CSNode\)](#setroot-4ba56f7c3847)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### CSSchema(int, String) <a href="#csschema-f9e5989e119d" id="csschema-f9e5989e119d"></a>

```java
public CSSchema(int nshash, String namespace)
```

**Parameters**

- `int nshash`
- `String namespace`

### CSSchema(int, String, String, String, String, String) <a href="#csschema-1d155be5067d" id="csschema-1d155be5067d"></a>

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

### addType(CSNamedType) <a href="#addtype-f27eb8b6623c" id="addtype-f27eb8b6623c"></a>

```java
public void addType(com.tailf.maapi.MaapiSchemas.CSNamedType type)
```

Types: [CSNamedType](CSNamedType.md#csnamedtype-6305f923b0f3)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNamedType type`

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

### getModule() <a href="#getmodule-68694513ccce" id="getmodule-68694513ccce"></a>

```java
public String getModule()
```

Get module name

**Returns:** String module

### getNamedTypes() <a href="#getnamedtypes-ac976f4fda73" id="getnamedtypes-ac976f4fda73"></a>

```java
public java.util.Hashtable<String,com.tailf.maapi.MaapiSchemas.CSNamedType> getNamedTypes()
```

Types: [CSNamedType](CSNamedType.md#csnamedtype-6305f923b0f3)

Get a Hashtable of all named types, the Hashtable has the type names
 as keys represented as strings and the types as values represented as
 CSType objects.

**Returns:** Hashtable of named types

### getNS() <a href="#getns-3613c99d8888" id="getns-3613c99d8888"></a>

```java
public String getNS()
```

Get Namespace string. Usually it is unique string that
 defines the namespace .
 (for example: "http://acme.example.com/system")

**Returns:** String Namespace string

### getNSHash() <a href="#getnshash-2129fb8b3cfe" id="getnshash-2129fb8b3cfe"></a>

```java
public int getNSHash()
```

Get Namespace hashvalue

**Returns:** int hashvalue

### getPrefix() <a href="#getprefix-9268091e0223" id="getprefix-9268091e0223"></a>

```java
public String getPrefix()
```

Get Namespace prefix string

**Returns:** String Namespace prefix string

### getRevision() <a href="#getrevision-b0088aa9f0bf" id="getrevision-b0088aa9f0bf"></a>

```java
public String getRevision()
```

Get schema revision

**Returns:** String revision

### getRootNode() <a href="#getrootnode-eed9b3c70129" id="getrootnode-eed9b3c70129"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getRootNode()
```

Types: [CSNode](CSNode.md#csnode-f12d9ad69c28)

Get first Schema root node. Note, that a Schema can have several
 nodes on root level in parallel, this method retrieves the first root
 node. Also, a schema does not necessarily have any root node
 then this method returns null.

**Returns:** CSNode the first root node or null if no root node exists

### getURI() <a href="#geturi-7ec1ffd8cd93" id="geturi-7ec1ffd8cd93"></a>

```java
public String getURI()
```

Get Schema uri string

**Returns:** String Schema uri string

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

### isDynamic() <a href="#isdynamic-6b453d4ad739" id="isdynamic-6b453d4ad739"></a>

```java
public boolean isDynamic()
```

Check if Schema is dynamically lalala

**Returns:** boolean true if dynamically lalala

### setRoot(CSNode) <a href="#setroot-4ba56f7c3847" id="setroot-4ba56f7c3847"></a>

```java
public void setRoot(com.tailf.maapi.MaapiSchemas.CSNode root)
```

Types: [CSNode](CSNode.md#csnode-f12d9ad69c28)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode root`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Informative string representation of a CSSchema instance

**Returns:** String
