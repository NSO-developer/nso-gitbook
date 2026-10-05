# QueryResultIterator <a href="#cls-QueryResultIterator" id="cls-QueryResultIterator"></a>

**Package-private**

```java
class com.tailf.maapi.QueryResultIterator<T extends com.tailf.maapi.ResultType>
    implements java.util.Iterator<com.tailf.maapi.QueryResult.Entry<T>>
```

Types: [Entry](QueryResult/Entry.md#cls-Entry), [ResultType](ResultType.md#cls-ResultType)

## Members

**Constructors**:

- [QueryResultIterator(Maapi, ConfELong)](#m-QueryResultIterator-331ff5362a54)

**Methods**:

- [hasNext()](#m-hasNext-93a8c9169964)
- [next()](#m-next-9a4cfa383e59)
- [remove()](#m-remove-8a10330a964f)
- [value()](QueryResult/Entry.md#m-value-9e1512d1a0ce) from Entry

## Constructors

### QueryResultIterator(Maapi, ConfELong) <a href="#m-QueryResultIterator-331ff5362a54" id="m-QueryResultIterator-331ff5362a54"></a>

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

### hasNext() <a href="#m-hasNext-93a8c9169964" id="m-hasNext-93a8c9169964"></a>

```java
public boolean hasNext()
```

### next() <a href="#m-next-9a4cfa383e59" id="m-next-9a4cfa383e59"></a>

```java
public synchronized com.tailf.maapi.QueryResult.Entry<T> next()
```

Types: [Entry](QueryResult/Entry.md#cls-Entry)

### remove() <a href="#m-remove-8a10330a964f" id="m-remove-8a10330a964f"></a>

```java
public void remove()
```
