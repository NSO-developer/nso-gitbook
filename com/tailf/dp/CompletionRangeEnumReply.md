<a id="s-CompletionRangeEnumReply"></a>
# CompletionRangeEnumReply

```java
public class com.tailf.dp.CompletionRangeEnumReply
    extends com.tailf.dp.Completion
```

Types: [Completion](Completion.md#s-Completion)

Reply structure container for completion callbacks invoked by a
 tailf:cli-custom-range-enumerator directive.

 This reply class is used to assemble list instance key completions.

## Members

**Constructors**:

- [CompletionRangeEnumReply(int)](#s-CompletionRangeEnumReply-1)

**Methods**:

- [addEntryKeyValues(List<String>)](#s-addEntryKeyValues)
- [addEntryKeyValues(String[])](#s-addEntryKeyValues-1)
- [encode()](#s-encode)
- [newDefaultReply()](Completion.md#s-newDefaultReply) from Completion
- [newRangeEnumReply(int)](Completion.md#s-newRangeEnumReply) from Completion
- [newReply()](Completion.md#s-newReply) from Completion
- [validate()](#s-validate)

## Constructors

<a id="s-CompletionRangeEnumReply-1"></a>
### CompletionRangeEnumReply(int)

```java
protected CompletionRangeEnumReply(int keySize)
```

**Parameters**

- `int keySize`


## Methods

<a id="s-addEntryKeyValues"></a>
### addEntryKeyValues(List<String>)

```java
public void addEntryKeyValues(
    java.util.List<String> keyList
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

Add keys for a list entry.
 The number of keys was specified in
 the instantiation using [`Completion`](Completion.md#s-Completion)
 The keyList parameter list size()  be of length keySize or
 an exception is thrown.

**Parameters**

- `java.util.List<String> keyList` - `List<String>` of keys for an entry,
                must be of size keySize

**Throws**

- `DpCallbackException`

<a id="s-addEntryKeyValues-1"></a>
### addEntryKeyValues(String[])

```java
public void addEntryKeyValues(String[] keyValues) throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#s-DpCallbackException)

Add keys for a list entry.
 The number of keys was specified in
 the instantiation using [`Completion`](Completion.md#s-Completion)
 The keyValues parameter array length must be of length keySize or
 an exception is thrown.

**Parameters**

- `String[] keyValues` - String[] of keys for this list entry,
                  must be of keySize length

<a id="s-encode"></a>
### encode()

```java
protected com.tailf.proto.ConfEList encode()
```

Types: [ConfEList](../proto/ConfEList.md#s-ConfEList)

<a id="s-validate"></a>
### validate()

```java
protected void validate() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#s-DpCallbackException)
