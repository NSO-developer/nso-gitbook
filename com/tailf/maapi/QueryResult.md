<a id="s-QueryResult"></a>
# QueryResult

```java
public class com.tailf.maapi.QueryResult<T extends com.tailf.maapi.ResultType>
    implements Iterable<com.tailf.maapi.QueryResult.Entry<T>>
```

Types: [Entry](QueryResult/Entry.md#s-Entry), [ResultType](ResultType.md#s-ResultType)

Represent a result from a XPath query.

 It is created trough successful invocation of
 [`Maapi`](Maapi.md#s-Maapi)
 method. Its purpose is to iterate, stop or reset a XPath Query
 specified from parameters in `queryStart`.


 The `Iterator` that returns from the `#iterator()` method
 fetches result in chunks from server for local processing as needed and
 is specified by the `chunksize` in `queryStart`
 method when iterating over the result set.

 Iterating trough the result multiple times could be done trough
 a call to `#reset()` and retrieval of a new `#iterator()`
 is required.

 When iteration is done a call to `#stop()` will free up
 resources from the server it is good practice to do so when
 done processing on this object.

## Members

**Constructors**:

- [QueryResult(Maapi, ConfELong)](#s-QueryResult-1)

**Methods**:

- [iterator()](#s-iterator)
- [reset()](#s-reset)
- [reset(int)](#s-reset-1)
- [resultCount()](#s-resultCount)
- [stop()](#s-stop)
- [value()](QueryResult/Entry.md#s-value) from Entry

**Nested Types**:

- [Entry](QueryResult/Entry.md#s-Entry)

## Constructors

<a id="s-QueryResult-1"></a>
### QueryResult(Maapi, ConfELong)

**Package-private**

```java
QueryResult(
    com.tailf.maapi.Maapi maapi,
    com.tailf.proto.ConfELong qh
)
    throws com.tailf.conf.ConfException, com.tailf.maapi.MaapiException, java.io.IOException
```

Types: [Maapi](Maapi.md#s-Maapi), [ConfELong](../proto/ConfELong.md#s-ConfELong), [ConfException](../conf/ConfException.md#s-ConfException), [MaapiException](MaapiException.md#s-MaapiException)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `com.tailf.proto.ConfELong qh`


## Methods

<a id="s-iterator"></a>
### iterator()

```java
public java.util.Iterator<com.tailf.maapi.QueryResult.Entry<T>> iterator()
```

Types: [Entry](QueryResult/Entry.md#s-Entry)

Retrieves an iterator from which one could iterate over the
 result.

**Returns:** a query result iterator

<a id="s-reset"></a>
### reset()

```java
public void reset() throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Reset/Rewind a running query so that it starts from the
 beginning again. Next call to `#iterator()`
 will then return the first chunk of
 results.

 The method can be called at any time
 (i.e. both after all results have been returned to essentially
 run the same query again, as well as
 after fetching just one or a couple of results).

<a id="s-reset-1"></a>
### reset(int)

```java
public void reset(int offset) throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Reset/Rewind a running query to a specific offset.

 First element has offset 1.

 Next call to `#iterator()`
 will then reinitialize with first chunk starting with element at offset.

 The method can be called at any time.

**Parameters**

- `int offset`

<a id="s-resultCount"></a>
### resultCount()

```java
public long resultCount() throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Get number of elements in the result.

 Note, internally to get this information the expression must be
 evaluated and the result counted and afterwards the query reset.
 From a performance point of view this is the same as using the iterator
 and count the number of hits.

 Note also, that there is no guarantee that the elements addressed by the
 expression will not change between this call and the actual iteration,
 which then will lead to a difference in count.

**Returns:** long number of elements in the result

**Throws**

- `ConfException`
- `IOException`

<a id="s-stop"></a>
### stop()

```java
public void stop() throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Stops the running query and makes the server end
 free up any internal resources associated with the query.


## Nested Types

- [Entry](QueryResult/Entry.md)
