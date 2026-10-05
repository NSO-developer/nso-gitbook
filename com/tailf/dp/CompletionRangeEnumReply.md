<a id="cls-CompletionRangeEnumReply"></a>
# CompletionRangeEnumReply

```java
public class com.tailf.dp.CompletionRangeEnumReply
    extends com.tailf.dp.Completion
```

Types: [Completion](Completion.md#cls-Completion)

Reply structure container for completion callbacks invoked by a
 tailf:cli-custom-range-enumerator directive.

 This reply class is used to assemble list instance key completions.

## Members

**Constructors**:

- [CompletionRangeEnumReply(int)](#m-completionrangeenumreply-0e71c3d85b9e)

**Methods**:

- [addEntryKeyValues(List<String>)](#m-addentrykeyvalues-50f532a0c6fd)
- [addEntryKeyValues(String[])](#m-addentrykeyvalues-863ff2f2eb03)
- [encode()](#m-encode-fbae522bba37)
- [newDefaultReply()](Completion.md#m-newdefaultreply-5583906bcd7c) from Completion
- [newRangeEnumReply(int)](Completion.md#m-newrangeenumreply-5c101dba6437) from Completion
- [newReply()](Completion.md#m-newreply-15892c4ebb44) from Completion
- [validate()](#m-validate-dc7ca5eb97ec)

## Constructors

<a id="m-completionrangeenumreply-0e71c3d85b9e"></a>
### CompletionRangeEnumReply(int)

```java
protected CompletionRangeEnumReply(int keySize)
```

**Parameters**

- `int keySize`


## Methods

<a id="m-addentrykeyvalues-50f532a0c6fd"></a>
### addEntryKeyValues(List<String>)

```java
public void addEntryKeyValues(
    java.util.List<String> keyList
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

Add keys for a list entry.
 The number of keys was specified in
 the instantiation using [`Completion#newRangeEnumReply(int)`](Completion.md#m-newrangeenumreply-5c101dba6437)
 The keyList parameter list size()  be of length keySize or
 an exception is thrown.

**Parameters**

- `java.util.List<String> keyList` - `List<String>` of keys for an entry,
                must be of size keySize

**Throws**

- `DpCallbackException`

<a id="m-addentrykeyvalues-863ff2f2eb03"></a>
### addEntryKeyValues(String[])

```java
public void addEntryKeyValues(String[] keyValues) throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

Add keys for a list entry.
 The number of keys was specified in
 the instantiation using [`Completion#newRangeEnumReply(int)`](Completion.md#m-newrangeenumreply-5c101dba6437)
 The keyValues parameter array length must be of length keySize or
 an exception is thrown.

**Parameters**

- `String[] keyValues` - String[] of keys for this list entry,
                  must be of keySize length

<a id="m-encode-fbae522bba37"></a>
### encode()

```java
protected com.tailf.proto.ConfEList encode()
```

Types: [ConfEList](../proto/ConfEList.md#cls-ConfEList)

<a id="m-validate-dc7ca5eb97ec"></a>
### validate()

```java
protected void validate() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)
