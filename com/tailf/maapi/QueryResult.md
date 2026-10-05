<a id="cls-QueryResult"></a>
# QueryResult

```java
public class com.tailf.maapi.QueryResult<T extends com.tailf.maapi.ResultType>
    implements Iterable<com.tailf.maapi.QueryResult.Entry<T>>
```

Types: [Entry](QueryResult/Entry.md#cls-Entry), [ResultType](ResultType.md#cls-ResultType)

Represent a result from a XPath query.

 It is created trough successful invocation of
 `Maapi#queryStart(int,String,String,int,int,List,Class)`
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

- [QueryResult(Maapi, ConfELong)](#m-queryresult-cfa1327eaddc)

**Methods**:

- [iterator()](#m-iterator-188aa52d1f86)
- [reset()](#m-reset-6927918ac70a)
- [reset(int)](#m-reset-0119ff136490)
- [resultCount()](#m-resultcount-69149d4d6ac3)
- [stop()](#m-stop-a62ecc446f97)
- [value()](QueryResult/Entry.md#m-value-9e1512d1a0ce) from Entry

**Nested Types**:

- [Entry](QueryResult/Entry.md#cls-Entry)

## Constructors

<a id="m-queryresult-cfa1327eaddc"></a>
### QueryResult(Maapi, ConfELong)

**Package-private**

```java
QueryResult(
    com.tailf.maapi.Maapi maapi,
    com.tailf.proto.ConfELong qh
)
    throws com.tailf.conf.ConfException, com.tailf.maapi.MaapiException, java.io.IOException
```

Types: [Maapi](Maapi.md#cls-Maapi), [ConfELong](../proto/ConfELong.md#cls-ConfELong), [ConfException](../conf/ConfException.md#cls-ConfException), [MaapiException](MaapiException.md#cls-MaapiException)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `com.tailf.proto.ConfELong qh`


## Methods

<a id="m-iterator-188aa52d1f86"></a>
### iterator()

```java
public java.util.Iterator<com.tailf.maapi.QueryResult.Entry<T>> iterator()
```

Types: [Entry](QueryResult/Entry.md#cls-Entry)

Retrieves an iterator from which one could iterate over the
 result.

**Returns:** a query result iterator

<a id="m-reset-6927918ac70a"></a>
### reset()

```java
public void reset() throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Reset/Rewind a running query so that it starts from the
 beginning again. Next call to `#iterator()`
 will then return the first chunk of
 results.

 The method can be called at any time
 (i.e. both after all results have been returned to essentially
 run the same query again, as well as
 after fetching just one or a couple of results).

<a id="m-reset-0119ff136490"></a>
### reset(int)

```java
public void reset(int offset) throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Reset/Rewind a running query to a specific offset.

 First element has offset 1.

 Next call to `#iterator()`
 will then reinitialize with first chunk starting with element at offset.

 The method can be called at any time.

**Parameters**

- `int offset`

<a id="m-resultcount-69149d4d6ac3"></a>
### resultCount()

```java
public long resultCount() throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

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

<a id="m-stop-a62ecc446f97"></a>
### stop()

```java
public void stop() throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Stops the running query and makes the server end
 free up any internal resources associated with the query.


## Nested Types

- [Entry](QueryResult/Entry.md#cls-Entry)
