<a id="s-QueryResultIterator"></a>
# QueryResultIterator

**Package-private**

```java
class com.tailf.maapi.QueryResultIterator<T extends com.tailf.maapi.ResultType>
    implements java.util.Iterator<com.tailf.maapi.QueryResult.Entry<T>>
```

Types: [Entry](QueryResult/Entry.md#s-Entry), [ResultType](ResultType.md#s-ResultType)

## Members

**Constructors**:

- [QueryResultIterator(Maapi, ConfELong)](#s-QueryResultIterator-1)

**Methods**:

- [hasNext()](#s-hasNext)
- [next()](#s-next)
- [remove()](#s-remove)
- [value()](QueryResult/Entry.md#s-value) from Entry

## Constructors

<a id="s-QueryResultIterator-1"></a>
### QueryResultIterator(Maapi, ConfELong)

**Package-private**

```java
QueryResultIterator(
    com.tailf.maapi.Maapi maapi,
    com.tailf.proto.ConfELong qh
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [Maapi](Maapi.md#s-Maapi), [ConfELong](../proto/ConfELong.md#s-ConfELong), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `com.tailf.proto.ConfELong qh`


## Methods

<a id="s-hasNext"></a>
### hasNext()

```java
public boolean hasNext()
```

<a id="s-next"></a>
### next()

```java
public synchronized com.tailf.maapi.QueryResult.Entry<T> next()
```

Types: [Entry](QueryResult/Entry.md#s-Entry)

<a id="s-remove"></a>
### remove()

```java
public void remove()
```
