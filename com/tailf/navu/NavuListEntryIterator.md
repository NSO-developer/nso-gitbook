<a id="s-NavuListEntryIterator"></a>
# NavuListEntryIterator

```java
public class com.tailf.navu.NavuListEntryIterator
    implements java.util.Iterator<com.tailf.navu.NavuListEntry>
```

Types: [NavuListEntry](NavuListEntry.md#s-NavuListEntry)

## Members

**Constructors**:

- [NavuListEntryIterator()](#s-NavuListEntryIterator-1)
- [NavuListEntryIterator(NavuList)](#s-NavuListEntryIterator-2)

**Fields**:

- [current](#s-current)
- [navuList](#s-navuList)
- [next](#s-next)

**Methods**:

- [delete()](NavuListEntry.md#s-delete) from NavuListEntry
- [elem(ConfKey)](#s-elem)
- [equals(Object)](NavuListEntry.md#s-equals) from NavuListEntry
- [getContext()](#s-getContext)
- [getCSNodeChildren()](#s-getCSNodeChildren)
- [getKey()](NavuListEntry.md#s-getKey) from NavuListEntry
- [getKeys()](#s-getKeys)
- [getNext()](#s-getNext)
- [hashCode()](NavuListEntry.md#s-hashCode) from NavuListEntry
- [hasNext()](#s-hasNext)
- [isKeyLess()](#s-isKeyLess)
- [isOper()](#s-isOper)
- [next()](#s-next-1)
- [remove()](#s-remove)

## Constructors

<a id="s-NavuListEntryIterator-1"></a>
### NavuListEntryIterator()

```java
protected NavuListEntryIterator()
```

<a id="s-NavuListEntryIterator-2"></a>
### NavuListEntryIterator(NavuList)

```java
protected NavuListEntryIterator(com.tailf.navu.NavuList navuList)
```

Types: [NavuList](NavuList.md#s-NavuList)

**Parameters**

- `com.tailf.navu.NavuList navuList`


## Fields

<a id="s-current"></a>
### current

```java
protected com.tailf.conf.ConfKey current = null;
```

Types: [ConfKey](../conf/ConfKey.md#s-ConfKey)

<a id="s-navuList"></a>
### navuList

```java
protected com.tailf.navu.NavuList navuList = null;
```

Types: [NavuList](NavuList.md#s-NavuList)

<a id="s-next"></a>
### next

```java
protected com.tailf.conf.ConfKey next = null;
```

Types: [ConfKey](../conf/ConfKey.md#s-ConfKey)


## Methods

<a id="s-elem"></a>
### elem(ConfKey)

```java
protected com.tailf.navu.NavuListEntry elem(
    com.tailf.conf.ConfKey key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuListEntry](NavuListEntry.md#s-NavuListEntry), [ConfKey](../conf/ConfKey.md#s-ConfKey), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.conf.ConfKey key`

<a id="s-getContext"></a>
### getContext()

```java
protected com.tailf.navu.NavuContext getContext()
```

Types: [NavuContext](NavuContext.md#s-NavuContext)

<a id="s-getCSNodeChildren"></a>
### getCSNodeChildren()

```java
protected java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getCSNodeChildren()
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

<a id="s-getKeys"></a>
### getKeys()

```java
protected int[] getKeys()
```

<a id="s-getNext"></a>
### getNext()

```java
protected com.tailf.conf.ConfKey getNext()
```

Types: [ConfKey](../conf/ConfKey.md#s-ConfKey)

<a id="s-hasNext"></a>
### hasNext()

```java
public boolean hasNext()
```

<a id="s-isKeyLess"></a>
### isKeyLess()

```java
protected boolean isKeyLess()
```

<a id="s-isOper"></a>
### isOper()

```java
protected boolean isOper()
```

<a id="s-next-1"></a>
### next()

```java
public com.tailf.navu.NavuListEntry next()
```

Types: [NavuListEntry](NavuListEntry.md#s-NavuListEntry)

<a id="s-remove"></a>
### remove()

```java
public void remove()
```
