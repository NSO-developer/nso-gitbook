# QueryResult <a href="#queryresult-6b83e74c93ef" id="queryresult-6b83e74c93ef"></a>

```java
public class com.tailf.maapi.QueryResult<T extends com.tailf.maapi.ResultType>
    implements Iterable<com.tailf.maapi.QueryResult.Entry<T>>
```

Types: [Entry](QueryResult/Entry.md#entry-8f0de475aa8c), [ResultType](ResultType.md#resulttype-1a8a08651698)

Represent a result from a XPath query.

 It is created trough successful invocation of
 `Maapi#queryStart(int,String,String,int,int,List,Class)`
 method. Its purpose is to iterate, stop or reset a XPath Query
 specified from parameters in `queryStart`.


 The `Iterator` that returns from the [`iterator()`](QueryResult.md#iterator-188aa52d1f86) method
 fetches result in chunks from server for local processing as needed and
 is specified by the `chunksize` in `queryStart`
 method when iterating over the result set.

 Iterating trough the result multiple times could be done trough
 a call to [`reset()`](QueryResult.md#reset-6927918ac70a) and retrieval of a new [`iterator()`](QueryResult.md#iterator-188aa52d1f86)
 is required.

 When iteration is done a call to [`stop()`](QueryResult.md#stop-a62ecc446f97) will free up
 resources from the server it is good practice to do so when
 done processing on this object.

## Members

**Constructors**:

- [QueryResult(Maapi, ConfELong)](#queryresult-cfa1327eaddc)

**Methods**:

- [iterator()](#iterator-188aa52d1f86)
- [reset()](#reset-6927918ac70a)
- [reset(int)](#reset-0119ff136490)
- [resultCount()](#resultcount-69149d4d6ac3)
- [stop()](#stop-a62ecc446f97)
- [value()](QueryResult/Entry.md#value-9e1512d1a0ce) from Entry

**Nested Types**:

- [Entry](QueryResult/Entry.md#entry-8f0de475aa8c)

## Constructors

### QueryResult(Maapi, ConfELong) <a href="#queryresult-cfa1327eaddc" id="queryresult-cfa1327eaddc"></a>

**Package-private**

```java
QueryResult(
    com.tailf.maapi.Maapi maapi,
    com.tailf.proto.ConfELong qh
)
    throws com.tailf.conf.ConfException, com.tailf.maapi.MaapiException, java.io.IOException
```

Types: [Maapi](Maapi.md#maapi-67bcbe89c42e), [ConfELong](../proto/ConfELong.md#confelong-926979f5365d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9), [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `com.tailf.proto.ConfELong qh`


## Methods

### iterator() <a href="#iterator-188aa52d1f86" id="iterator-188aa52d1f86"></a>

```java
public java.util.Iterator<com.tailf.maapi.QueryResult.Entry<T>> iterator()
```

Types: [Entry](QueryResult/Entry.md#entry-8f0de475aa8c)

Retrieves an iterator from which one could iterate over the
 result.

**Returns:** a query result iterator

### reset() <a href="#reset-6927918ac70a" id="reset-6927918ac70a"></a>

```java
public void reset() throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Reset/Rewind a running query so that it starts from the
 beginning again. Next call to [`iterator()`](QueryResult.md#iterator-188aa52d1f86)
 will then return the first chunk of
 results.

 The method can be called at any time
 (i.e. both after all results have been returned to essentially
 run the same query again, as well as
 after fetching just one or a couple of results).

### reset(int) <a href="#reset-0119ff136490" id="reset-0119ff136490"></a>

```java
public void reset(int offset) throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Reset/Rewind a running query to a specific offset.

 First element has offset 1.

 Next call to [`iterator()`](QueryResult.md#iterator-188aa52d1f86)
 will then reinitialize with first chunk starting with element at offset.

 The method can be called at any time.

**Parameters**

- `int offset`

### resultCount() <a href="#resultcount-69149d4d6ac3" id="resultcount-69149d4d6ac3"></a>

```java
public long resultCount() throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

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

### stop() <a href="#stop-a62ecc446f97" id="stop-a62ecc446f97"></a>

```java
public void stop() throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Stops the running query and makes the server end
 free up any internal resources associated with the query.


## Nested Types

- [Entry](QueryResult/Entry.md#entry-8f0de475aa8c)
