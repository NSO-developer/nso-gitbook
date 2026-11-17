# Entry <a href="#entry-8f0de475aa8c" id="entry-8f0de475aa8c"></a>

```java
public static class com.tailf.maapi.QueryResult.Entry<E extends com.tailf.maapi.ResultType>
```

Types: [ResultType](../ResultType.md#resulttype-1a8a08651698)

Represent result entry in a XPath query.

Each XPath query result contains multiple entries.

A entry contains a `List<E>` of the result type
 `E` (is the same type `T` specified
 in the last parameter of
 [`Maapi#queryStart(int,String,String,int,int,List,Class)`](../Maapi.md#querystart-87abe9e2ad2a)).

Each entry in the `List<E>` is the
 evaluating XPath result from the `selects` (List\<T\>)
 parameter in `queryStart`.

## Members

**Methods**:

- [value\(\)](#value-9e1512d1a0ce)

## Methods

### value() <a href="#value-9e1512d1a0ce" id="value-9e1512d1a0ce"></a>

```java
public java.util.List<E> value()
```

Retrieves the value from this entry
