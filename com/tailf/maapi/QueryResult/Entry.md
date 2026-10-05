<a id="s-Entry"></a>
# Entry

```java
public static class com.tailf.maapi.QueryResult.Entry<E extends com.tailf.maapi.ResultType>
```

Types: [ResultType](../ResultType.md#s-ResultType)

Represent result entry in a XPath query.

 Each XPath query result contains multiple entries.


 A entry contains a `ListE` of the result type
 `E` (is the same type `T` specified
 in the last parameter of
 [`Maapi`](../Maapi.md#s-Maapi)).


 Each entry in the `ListE` is the
 evaluating XPath result from the `selects` (ListT)
 parameter in `queryStart`.

## Members

**Constructors**:

- [Entry(List<E>)](#s-Entry-1)

**Methods**:

- [value()](#s-value)

## Constructors

<a id="s-Entry-1"></a>
### Entry(List<E>)

**Package-private**

```java
Entry(java.util.List<E> list)
```

**Parameters**

- `java.util.List<E> list`


## Methods

<a id="s-value"></a>
### value()

```java
public java.util.List<E> value()
```

Retrieves the value from this entry
