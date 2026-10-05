# ConfList <a href="#cls-ConfList" id="cls-ConfList"></a>

```java
public class com.tailf.conf.ConfList
    extends com.tailf.conf.ConfValue
    implements Comparable<com.tailf.conf.ConfList>
```

Types: [ConfValue](ConfValue.md#cls-ConfValue), [ConfList](ConfList.md#cls-ConfList)

DATA_CONTAINER - Corresponds to the YANG leaf-list.

## Members

**Constructors**:

- [ConfList()](#m-ConfList-85031ba51a5a)
- [ConfList(ConfEObject)](#m-ConfList-98473c2678c8)
- [ConfList(ConfObject[])](#m-ConfList-5482a9eba06f)

**Fields**:

- [J_BINARY](ConfObject.md#m-J_BINARY) from ConfObject
- [J_BIT32](ConfObject.md#m-J_BIT32) from ConfObject
- [J_BIT64](ConfObject.md#m-J_BIT64) from ConfObject
- [J_BITBIG](ConfObject.md#m-J_BITBIG) from ConfObject
- [J_BOOL](ConfObject.md#m-J_BOOL) from ConfObject
- [J_BUF](ConfObject.md#m-J_BUF) from ConfObject
- [J_CDBBEGIN](ConfObject.md#m-J_CDBBEGIN) from ConfObject
- [J_DATE](ConfObject.md#m-J_DATE) from ConfObject
- [J_DATETIME](ConfObject.md#m-J_DATETIME) from ConfObject
- [J_DECIMAL64](ConfObject.md#m-J_DECIMAL64) from ConfObject
- [J_DEFAULT](ConfObject.md#m-J_DEFAULT) from ConfObject
- [J_DOUBLE](ConfObject.md#m-J_DOUBLE) from ConfObject
- [J_DQUAD](ConfObject.md#m-J_DQUAD) from ConfObject
- [J_DURATION](ConfObject.md#m-J_DURATION) from ConfObject
- [J_EMPTY](ConfObject.md#m-J_EMPTY) from ConfObject
- [J_ENUMERATION](ConfObject.md#m-J_ENUMERATION) from ConfObject
- [J_HEXSTR](ConfObject.md#m-J_HEXSTR) from ConfObject
- [J_IDENTITYREF](ConfObject.md#m-J_IDENTITYREF) from ConfObject
- [J_INSTANCE_IDENTIFIER](ConfObject.md#m-J_INSTANCE_IDENTIFIER) from ConfObject
- [J_INT16](ConfObject.md#m-J_INT16) from ConfObject
- [J_INT32](ConfObject.md#m-J_INT32) from ConfObject
- [J_INT64](ConfObject.md#m-J_INT64) from ConfObject
- [J_INT8](ConfObject.md#m-J_INT8) from ConfObject
- [J_IPV4](ConfObject.md#m-J_IPV4) from ConfObject
- [J_IPV4_AND_PLEN](ConfObject.md#m-J_IPV4_AND_PLEN) from ConfObject
- [J_IPV4PREFIX](ConfObject.md#m-J_IPV4PREFIX) from ConfObject
- [J_IPV6](ConfObject.md#m-J_IPV6) from ConfObject
- [J_IPV6_AND_PLEN](ConfObject.md#m-J_IPV6_AND_PLEN) from ConfObject
- [J_IPV6PREFIX](ConfObject.md#m-J_IPV6PREFIX) from ConfObject
- [J_LIST](ConfObject.md#m-J_LIST) from ConfObject
- [J_NOEXISTS](ConfObject.md#m-J_NOEXISTS) from ConfObject
- [J_OBJECTREF](ConfObject.md#m-J_OBJECTREF) from ConfObject
- [J_OID](ConfObject.md#m-J_OID) from ConfObject
- [J_PTR](ConfObject.md#m-J_PTR) from ConfObject
- [J_QNAME](ConfObject.md#m-J_QNAME) from ConfObject
- [J_STR](ConfObject.md#m-J_STR) from ConfObject
- [J_SYMBOL](ConfObject.md#m-J_SYMBOL) from ConfObject
- [J_TIME](ConfObject.md#m-J_TIME) from ConfObject
- [J_UINT16](ConfObject.md#m-J_UINT16) from ConfObject
- [J_UINT32](ConfObject.md#m-J_UINT32) from ConfObject
- [J_UINT64](ConfObject.md#m-J_UINT64) from ConfObject
- [J_UINT8](ConfObject.md#m-J_UINT8) from ConfObject
- [J_UNION](ConfObject.md#m-J_UNION) from ConfObject
- [J_XMLBEGIN](ConfObject.md#m-J_XMLBEGIN) from ConfObject
- [J_XMLBEGINDEL](ConfObject.md#m-J_XMLBEGINDEL) from ConfObject
- [J_XMLEND](ConfObject.md#m-J_XMLEND) from ConfObject
- [J_XMLMOVEAFTER](ConfObject.md#m-J_XMLMOVEAFTER) from ConfObject
- [J_XMLMOVEFIRST](ConfObject.md#m-J_XMLMOVEFIRST) from ConfObject
- [J_XMLTAG](ConfObject.md#m-J_XMLTAG) from ConfObject

**Methods**:

- [addElem(ConfObject)](#m-addElem-02ad7a1ca33a)
- [clone()](ConfObject.md#m-clone-164c86c45e9b) from ConfObject
- [compare(ConfObject, ConfObject)](ConfObject.md#m-compare-e78552baa2bf) from ConfObject
- [compareTo(ConfList)](#m-compareTo-e983880b8475)
- [decode(ConfEObject)](ConfObject.md#m-decode-609792d36602) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#m-decode-a814ebf64edc) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#m-decode-9b92f1de40d8) from ConfObject
- [delete(ConfObject)](#m-delete-fbb37de72a86)
- [elements()](#m-elements-1ac1cabc0e96)
- [encode()](#m-encode-fbae522bba37)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [get(int)](#m-get-5bd20d94a8b1)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#m-getStringByValue-841fa68ad0f9) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#m-getStringByValue-8ed173dcf8dc) from ConfValue
- [getValueByString(ConfPath, String)](ConfValue.md#m-getValueByString-e75fd0337a87) from ConfValue
- [getValueByString(String, String)](ConfValue.md#m-getValueByString-7804643cb027) from ConfValue
- [hashCode()](#m-hashCode-ef797a217903)
- [isMember(ConfObject)](#m-isMember-24395e4f17dc)
- [length()](#m-length-89e7822f25ca)
- [move(ConfObject, WhereTo, ConfObject)](#m-move-c3d69b566af0)
- [set(int, ConfObject)](#m-set-1cd8a8c79368)
- [toString()](#m-toString-e9d48c5503ef)

**Nested Types**:

- [WhereTo](ConfList/WhereTo.md#cls-WhereTo)

## Constructors

### ConfList() <a href="#m-ConfList-85031ba51a5a" id="m-ConfList-85031ba51a5a"></a>

```java
public ConfList()
```

### ConfList(ConfEObject) <a href="#m-ConfList-98473c2678c8" id="m-ConfList-98473c2678c8"></a>

```java
public ConfList(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

### ConfList(ConfObject[]) <a href="#m-ConfList-5482a9eba06f" id="m-ConfList-5482a9eba06f"></a>

```java
public ConfList(com.tailf.conf.ConfObject[] l)
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

**Parameters**

- `com.tailf.conf.ConfObject[] l`


## Methods

### addElem(ConfObject) <a href="#m-addElem-02ad7a1ca33a" id="m-addElem-02ad7a1ca33a"></a>

```java
public void addElem(com.tailf.conf.ConfObject n)
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

Add an element in the end of this ConfList unless it already exists

**Parameters**

- `com.tailf.conf.ConfObject n` - object to add

### compareTo(ConfList) <a href="#m-compareTo-e983880b8475" id="m-compareTo-e983880b8475"></a>

```java
public int compareTo(com.tailf.conf.ConfList o)
```

Types: [ConfList](ConfList.md#cls-ConfList)

**Parameters**

- `com.tailf.conf.ConfList o`

### delete(ConfObject) <a href="#m-delete-fbb37de72a86" id="m-delete-fbb37de72a86"></a>

```java
public void delete(com.tailf.conf.ConfObject n)
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

Delete arbitrary object from the ConfList

**Parameters**

- `com.tailf.conf.ConfObject n` - object to remove

### elements() <a href="#m-elements-1ac1cabc0e96" id="m-elements-1ac1cabc0e96"></a>

```java
public com.tailf.conf.ConfObject[] elements()
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

Return a copy as array of this

### encode() <a href="#m-encode-fbae522bba37" id="m-encode-fbae522bba37"></a>

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

### get(int) <a href="#m-get-5bd20d94a8b1" id="m-get-5bd20d94a8b1"></a>

```java
public com.tailf.conf.ConfObject get(int index)
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

**Parameters**

- `int index`

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### isMember(ConfObject) <a href="#m-isMember-24395e4f17dc" id="m-isMember-24395e4f17dc"></a>

```java
public boolean isMember(com.tailf.conf.ConfObject o)
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

**Parameters**

- `com.tailf.conf.ConfObject o`

### length() <a href="#m-length-89e7822f25ca" id="m-length-89e7822f25ca"></a>

```java
public int length()
```

### move(ConfObject, WhereTo, ConfObject) <a href="#m-move-c3d69b566af0" id="m-move-c3d69b566af0"></a>

```java
public void move(
    com.tailf.conf.ConfObject n,
    com.tailf.conf.ConfList.WhereTo where,
    com.tailf.conf.ConfObject to
)
    throws com.tailf.conf.ConfException
```

Types: [ConfObject](ConfObject.md#cls-ConfObject), [WhereTo](ConfList/WhereTo.md#cls-WhereTo), [ConfException](ConfException.md#cls-ConfException)

Move a list element to a new position in the list. The destination
 can be at the beginning, the end or in a relation to another element.
 This only makes sense for leaf-lists that are ordered by user.

**Parameters**

- `com.tailf.conf.ConfObject n` - object to move according to WhereTo
- `com.tailf.conf.ConfList.WhereTo where` - How the move should be performed. Move object
        WhereTo.FIRST or WhereTo.LAST or move object
        WhereTo.BEFORE or WhereTo.AFTER the element to.
- `com.tailf.conf.ConfObject to` - If the value of whereTo is WhereTo.FIRST or WhereTo.LAST
        this argument ignored

**Throws**

- `ConfException`

### set(int, ConfObject) <a href="#m-set-1cd8a8c79368" id="m-set-1cd8a8c79368"></a>

```java
public com.tailf.conf.ConfObject set(int index, com.tailf.conf.ConfObject val)
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

**Parameters**

- `int index`
- `com.tailf.conf.ConfObject val`

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```


## Nested Types

- [WhereTo](ConfList/WhereTo.md#cls-WhereTo)
