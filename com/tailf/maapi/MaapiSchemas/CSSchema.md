<a id="cls-CSSchema"></a>
# CSSchema

```java
public static class com.tailf.maapi.MaapiSchemas.CSSchema
```

The Schema Container class. Contains the first root node, if available,
 of the schema as well as other information about the schema and its named
 types.

 It is instances of this class that is retrieved using method findSchema
 see [`MaapiSchemas#findCSSchema(int)`](../MaapiSchemas.md#m-findcsschema-880b1533ffd2) and
 [`MaapiSchemas#findCSSchema(String)`](../MaapiSchemas.md#m-findcsschema-6023156b0628)

## Members

**Constructors**:

- [CSSchema(int, String)](#m-csschema-f9e5989e119d)
- [CSSchema(int, String, String, String, String, String)](#m-csschema-1d155be5067d)

**Methods**:

- [addType(CSNamedType)](#m-addtype-f27eb8b6623c)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getModule()](#m-getmodule-68694513ccce)
- [getNamedTypes()](#m-getnamedtypes-ac976f4fda73)
- [getNS()](#m-getns-3613c99d8888)
- [getNSHash()](#m-getnshash-2129fb8b3cfe)
- [getPrefix()](#m-getprefix-9268091e0223)
- [getRevision()](#m-getrevision-b0088aa9f0bf)
- [getRootNode()](#m-getrootnode-eed9b3c70129)
- [getURI()](#m-geturi-7ec1ffd8cd93)
- [hashCode()](#m-hashcode-ef797a217903)
- [isDynamic()](#m-isdynamic-6b453d4ad739)
- [setRoot(CSNode)](#m-setroot-4ba56f7c3847)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-csschema-f9e5989e119d"></a>
### CSSchema(int, String)

```java
public CSSchema(int nshash, String namespace)
```

**Parameters**

- `int nshash`
- `String namespace`

<a id="m-csschema-1d155be5067d"></a>
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

<a id="m-addtype-f27eb8b6623c"></a>
### addType(CSNamedType)

```java
public void addType(com.tailf.maapi.MaapiSchemas.CSNamedType type)
```

Types: [CSNamedType](CSNamedType.md#cls-CSNamedType)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNamedType type`

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

<a id="m-getmodule-68694513ccce"></a>
### getModule()

```java
public String getModule()
```

Get module name

**Returns:** String module

<a id="m-getnamedtypes-ac976f4fda73"></a>
### getNamedTypes()

```java
public java.util.Hashtable<String,com.tailf.maapi.MaapiSchemas.CSNamedType> getNamedTypes()
```

Types: [CSNamedType](CSNamedType.md#cls-CSNamedType)

Get a Hashtable of all named types, the Hashtable has the type names
 as keys represented as strings and the types as values represented as
 CSType objects.

**Returns:** Hashtable of named types

<a id="m-getns-3613c99d8888"></a>
### getNS()

```java
public String getNS()
```

Get Namespace string. Usually it is unique string that
 defines the namespace .
 (for example: "http://acme.example.com/system")

**Returns:** String Namespace string

<a id="m-getnshash-2129fb8b3cfe"></a>
### getNSHash()

```java
public int getNSHash()
```

Get Namespace hashvalue

**Returns:** int hashvalue

<a id="m-getprefix-9268091e0223"></a>
### getPrefix()

```java
public String getPrefix()
```

Get Namespace prefix string

**Returns:** String Namespace prefix string

<a id="m-getrevision-b0088aa9f0bf"></a>
### getRevision()

```java
public String getRevision()
```

Get schema revision

**Returns:** String revision

<a id="m-getrootnode-eed9b3c70129"></a>
### getRootNode()

```java
public com.tailf.maapi.MaapiSchemas.CSNode getRootNode()
```

Types: [CSNode](CSNode.md#cls-CSNode)

Get first Schema root node. Note, that a Schema can have several
 nodes on root level in parallel, this method retrieves the first root
 node. Also, a schema does not necessarily have any root node
 then this method returns null.

**Returns:** CSNode the first root node or null if no root node exists

<a id="m-geturi-7ec1ffd8cd93"></a>
### getURI()

```java
public String getURI()
```

Get Schema uri string

**Returns:** String Schema uri string

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```

<a id="m-isdynamic-6b453d4ad739"></a>
### isDynamic()

```java
public boolean isDynamic()
```

Check if Schema is dynamically lalala

**Returns:** boolean true if dynamically lalala

<a id="m-setroot-4ba56f7c3847"></a>
### setRoot(CSNode)

```java
public void setRoot(com.tailf.maapi.MaapiSchemas.CSNode root)
```

Types: [CSNode](CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode root`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Informative string representation of a CSSchema instance

**Returns:** String
