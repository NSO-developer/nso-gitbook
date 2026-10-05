# QueryResultIterator <a href="#queryresultiterator-05c3c45152b8" id="queryresultiterator-05c3c45152b8"></a>

**Package-private**

```java
class com.tailf.maapi.QueryResultIterator<T extends com.tailf.maapi.ResultType>
    implements java.util.Iterator<com.tailf.maapi.QueryResult.Entry<T>>
```

Types: [Entry](QueryResult/Entry.md#entry-8f0de475aa8c), [ResultType](ResultType.md#resulttype-1a8a08651698)

## Members

**Constructors**:

- [QueryResultIterator(Maapi, ConfELong)](#queryresultiterator-331ff5362a54)

**Methods**:

- [hasNext()](#hasnext-93a8c9169964)
- [next()](#next-9a4cfa383e59)
- [remove()](#remove-8a10330a964f)
- [value()](QueryResult/Entry.md#value-9e1512d1a0ce) from Entry

## Constructors

### QueryResultIterator(Maapi, ConfELong) <a href="#queryresultiterator-331ff5362a54" id="queryresultiterator-331ff5362a54"></a>

**Package-private**

```java
QueryResultIterator(
    com.tailf.maapi.Maapi maapi,
    com.tailf.proto.ConfELong qh
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [Maapi](Maapi.md#maapi-67bcbe89c42e), [ConfELong](../proto/ConfELong.md#confelong-926979f5365d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `com.tailf.proto.ConfELong qh`


## Methods

### hasNext() <a href="#hasnext-93a8c9169964" id="hasnext-93a8c9169964"></a>

```java
public boolean hasNext()
```

### next() <a href="#next-9a4cfa383e59" id="next-9a4cfa383e59"></a>

```java
public synchronized com.tailf.maapi.QueryResult.Entry<T> next()
```

Types: [Entry](QueryResult/Entry.md#entry-8f0de475aa8c)

### remove() <a href="#remove-8a10330a964f" id="remove-8a10330a964f"></a>

```java
public void remove()
```
