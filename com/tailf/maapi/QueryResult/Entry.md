# Entry <a href="#cls-Entry" id="cls-Entry"></a>

```java
public static class com.tailf.maapi.QueryResult.Entry<E extends com.tailf.maapi.ResultType>
```

Types: [ResultType](../ResultType.md#cls-ResultType)

Represent result entry in a XPath query.

 Each XPath query result contains multiple entries.


 A entry contains a `ListE` of the result type
 `E` (is the same type `T` specified
 in the last parameter of
 `Maapi#queryStart(int,String,String,int,int,List,Class)`).


 Each entry in the `ListE` is the
 evaluating XPath result from the `selects` (ListT)
 parameter in `queryStart`.

## Members

**Constructors**:

- [Entry(List<E>)](#m-Entry-3c15f85e762c)

**Methods**:

- [value()](#m-value-9e1512d1a0ce)

## Constructors

### Entry(List<E>) <a href="#m-Entry-3c15f85e762c" id="m-Entry-3c15f85e762c"></a>

**Package-private**

```java
Entry(java.util.List<E> list)
```

**Parameters**

- `java.util.List<E> list`


## Methods

### value() <a href="#m-value-9e1512d1a0ce" id="m-value-9e1512d1a0ce"></a>

```java
public java.util.List<E> value()
```

Retrieves the value from this entry
