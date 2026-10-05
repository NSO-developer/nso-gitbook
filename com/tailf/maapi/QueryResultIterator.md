<a id="cls-QueryResultIterator"></a>
# QueryResultIterator

**Package-private**

```java
class com.tailf.maapi.QueryResultIterator<T extends com.tailf.maapi.ResultType>
    implements java.util.Iterator<com.tailf.maapi.QueryResult.Entry<T>>
```

Types: [Entry](QueryResult/Entry.md#cls-Entry), [ResultType](ResultType.md#cls-ResultType)

## Members

**Constructors**:

- [QueryResultIterator(Maapi, ConfELong)](#m-queryresultiterator-331ff5362a54)

**Methods**:

- [hasNext()](#m-hasnext-93a8c9169964)
- [next()](#m-next-9a4cfa383e59)
- [remove()](#m-remove-8a10330a964f)
- [value()](QueryResult/Entry.md#m-value-9e1512d1a0ce) from Entry

## Constructors

<a id="m-queryresultiterator-331ff5362a54"></a>
### QueryResultIterator(Maapi, ConfELong)

**Package-private**

```java
QueryResultIterator(
    com.tailf.maapi.Maapi maapi,
    com.tailf.proto.ConfELong qh
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [Maapi](Maapi.md#cls-Maapi), [ConfELong](../proto/ConfELong.md#cls-ConfELong), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `com.tailf.proto.ConfELong qh`


## Methods

<a id="m-hasnext-93a8c9169964"></a>
### hasNext()

```java
public boolean hasNext()
```

<a id="m-next-9a4cfa383e59"></a>
### next()

```java
public synchronized com.tailf.maapi.QueryResult.Entry<T> next()
```

Types: [Entry](QueryResult/Entry.md#cls-Entry)

<a id="m-remove-8a10330a964f"></a>
### remove()

```java
public void remove()
```
