<a id="s-ConfList"></a>
# ConfList

```java
public class com.tailf.conf.ConfList
    extends com.tailf.conf.ConfValue
    implements Comparable<com.tailf.conf.ConfList>
```

Types: [ConfValue](ConfValue.md#s-ConfValue), [ConfList](ConfList.md#s-ConfList)

DATA_CONTAINER - Corresponds to the YANG leaf-list.

## Members

**Constructors**:

- [ConfList()](#s-ConfList-1)
- [ConfList(ConfEObject)](#s-ConfList-2)
- [ConfList(ConfObject[])](#s-ConfList-3)

**Fields**:

- [J_BINARY](ConfObject.md#s-J_BINARY) from ConfObject
- [J_BIT32](ConfObject.md#s-J_BIT32) from ConfObject
- [J_BIT64](ConfObject.md#s-J_BIT64) from ConfObject
- [J_BITBIG](ConfObject.md#s-J_BITBIG) from ConfObject
- [J_BOOL](ConfObject.md#s-J_BOOL) from ConfObject
- [J_BUF](ConfObject.md#s-J_BUF) from ConfObject
- [J_CDBBEGIN](ConfObject.md#s-J_CDBBEGIN) from ConfObject
- [J_DATE](ConfObject.md#s-J_DATE) from ConfObject
- [J_DATETIME](ConfObject.md#s-J_DATETIME) from ConfObject
- [J_DECIMAL64](ConfObject.md#s-J_DECIMAL64) from ConfObject
- [J_DEFAULT](ConfObject.md#s-J_DEFAULT) from ConfObject
- [J_DOUBLE](ConfObject.md#s-J_DOUBLE) from ConfObject
- [J_DQUAD](ConfObject.md#s-J_DQUAD) from ConfObject
- [J_DURATION](ConfObject.md#s-J_DURATION) from ConfObject
- [J_EMPTY](ConfObject.md#s-J_EMPTY) from ConfObject
- [J_ENUMERATION](ConfObject.md#s-J_ENUMERATION) from ConfObject
- [J_HEXSTR](ConfObject.md#s-J_HEXSTR) from ConfObject
- [J_IDENTITYREF](ConfObject.md#s-J_IDENTITYREF) from ConfObject
- [J_INSTANCE_IDENTIFIER](ConfObject.md#s-J_INSTANCE_IDENTIFIER) from ConfObject
- [J_INT16](ConfObject.md#s-J_INT16) from ConfObject
- [J_INT32](ConfObject.md#s-J_INT32) from ConfObject
- [J_INT64](ConfObject.md#s-J_INT64) from ConfObject
- [J_INT8](ConfObject.md#s-J_INT8) from ConfObject
- [J_IPV4](ConfObject.md#s-J_IPV4) from ConfObject
- [J_IPV4_AND_PLEN](ConfObject.md#s-J_IPV4_AND_PLEN) from ConfObject
- [J_IPV4PREFIX](ConfObject.md#s-J_IPV4PREFIX) from ConfObject
- [J_IPV6](ConfObject.md#s-J_IPV6) from ConfObject
- [J_IPV6_AND_PLEN](ConfObject.md#s-J_IPV6_AND_PLEN) from ConfObject
- [J_IPV6PREFIX](ConfObject.md#s-J_IPV6PREFIX) from ConfObject
- [J_LIST](ConfObject.md#s-J_LIST) from ConfObject
- [J_NOEXISTS](ConfObject.md#s-J_NOEXISTS) from ConfObject
- [J_OBJECTREF](ConfObject.md#s-J_OBJECTREF) from ConfObject
- [J_OID](ConfObject.md#s-J_OID) from ConfObject
- [J_PTR](ConfObject.md#s-J_PTR) from ConfObject
- [J_QNAME](ConfObject.md#s-J_QNAME) from ConfObject
- [J_STR](ConfObject.md#s-J_STR) from ConfObject
- [J_SYMBOL](ConfObject.md#s-J_SYMBOL) from ConfObject
- [J_TIME](ConfObject.md#s-J_TIME) from ConfObject
- [J_UINT16](ConfObject.md#s-J_UINT16) from ConfObject
- [J_UINT32](ConfObject.md#s-J_UINT32) from ConfObject
- [J_UINT64](ConfObject.md#s-J_UINT64) from ConfObject
- [J_UINT8](ConfObject.md#s-J_UINT8) from ConfObject
- [J_UNION](ConfObject.md#s-J_UNION) from ConfObject
- [J_XMLBEGIN](ConfObject.md#s-J_XMLBEGIN) from ConfObject
- [J_XMLBEGINDEL](ConfObject.md#s-J_XMLBEGINDEL) from ConfObject
- [J_XMLEND](ConfObject.md#s-J_XMLEND) from ConfObject
- [J_XMLMOVEAFTER](ConfObject.md#s-J_XMLMOVEAFTER) from ConfObject
- [J_XMLMOVEFIRST](ConfObject.md#s-J_XMLMOVEFIRST) from ConfObject
- [J_XMLTAG](ConfObject.md#s-J_XMLTAG) from ConfObject

**Methods**:

- [addElem(ConfObject)](#s-addElem)
- [clone()](ConfObject.md#s-clone) from ConfObject
- [compare(ConfObject, ConfObject)](ConfObject.md#s-compare) from ConfObject
- [compareTo(ConfList)](#s-compareTo)
- [decode(ConfEObject)](ConfObject.md#s-decode) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#s-decode-1) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#s-decode-2) from ConfObject
- [delete(ConfObject)](#s-delete)
- [elements()](#s-elements)
- [encode()](#s-encode)
- [equals(Object)](#s-equals)
- [get(int)](#s-get)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#s-getStringByValue) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#s-getStringByValue-1) from ConfValue
- [getValueByString(ConfPath, String)](ConfValue.md#s-getValueByString) from ConfValue
- [getValueByString(String, String)](ConfValue.md#s-getValueByString-1) from ConfValue
- [hashCode()](#s-hashCode)
- [isMember(ConfObject)](#s-isMember)
- [length()](#s-length)
- [move(ConfObject, WhereTo, ConfObject)](#s-move)
- [set(int, ConfObject)](#s-set)
- [toString()](#s-toString)

**Nested Types**:

- [WhereTo](ConfList/WhereTo.md#s-WhereTo)

## Constructors

<a id="s-ConfList-1"></a>
### ConfList()

```java
public ConfList()
```

<a id="s-ConfList-2"></a>
### ConfList(ConfEObject)

```java
public ConfList(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

<a id="s-ConfList-3"></a>
### ConfList(ConfObject[])

```java
public ConfList(com.tailf.conf.ConfObject[] l)
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

**Parameters**

- `com.tailf.conf.ConfObject[] l`


## Methods

<a id="s-addElem"></a>
### addElem(ConfObject)

```java
public void addElem(com.tailf.conf.ConfObject n)
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

Add an element in the end of this ConfList unless it already exists

**Parameters**

- `com.tailf.conf.ConfObject n` - object to add

<a id="s-compareTo"></a>
### compareTo(ConfList)

```java
public int compareTo(com.tailf.conf.ConfList o)
```

Types: [ConfList](ConfList.md#s-ConfList)

**Parameters**

- `com.tailf.conf.ConfList o`

<a id="s-delete"></a>
### delete(ConfObject)

```java
public void delete(com.tailf.conf.ConfObject n)
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

Delete arbitrary object from the ConfList

**Parameters**

- `com.tailf.conf.ConfObject n` - object to remove

<a id="s-elements"></a>
### elements()

```java
public com.tailf.conf.ConfObject[] elements()
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

Return a copy as array of this

<a id="s-encode"></a>
### encode()

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

<a id="s-get"></a>
### get(int)

```java
public com.tailf.conf.ConfObject get(int index)
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

**Parameters**

- `int index`

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-isMember"></a>
### isMember(ConfObject)

```java
public boolean isMember(com.tailf.conf.ConfObject o)
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

**Parameters**

- `com.tailf.conf.ConfObject o`

<a id="s-length"></a>
### length()

```java
public int length()
```

<a id="s-move"></a>
### move(ConfObject, WhereTo, ConfObject)

```java
public void move(
    com.tailf.conf.ConfObject n,
    com.tailf.conf.ConfList.WhereTo where,
    com.tailf.conf.ConfObject to
)
    throws com.tailf.conf.ConfException
```

Types: [ConfObject](ConfObject.md#s-ConfObject), [WhereTo](ConfList/WhereTo.md#s-WhereTo), [ConfException](ConfException.md#s-ConfException)

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

<a id="s-set"></a>
### set(int, ConfObject)

```java
public com.tailf.conf.ConfObject set(int index, com.tailf.conf.ConfObject val)
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

**Parameters**

- `int index`
- `com.tailf.conf.ConfObject val`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```


## Nested Types

- [WhereTo](ConfList/WhereTo.md)
