# CompletionRangeEnumReply <a href="#cls-CompletionRangeEnumReply" id="cls-CompletionRangeEnumReply"></a>

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

- [CompletionRangeEnumReply(int)](#m-CompletionRangeEnumReply-0e71c3d85b9e)

**Methods**:

- [addEntryKeyValues(List<String>)](#m-addEntryKeyValues-50f532a0c6fd)
- [addEntryKeyValues(String[])](#m-addEntryKeyValues-863ff2f2eb03)
- [encode()](#m-encode-fbae522bba37)
- [newDefaultReply()](Completion.md#m-newDefaultReply-5583906bcd7c) from Completion
- [newRangeEnumReply(int)](Completion.md#m-newRangeEnumReply-5c101dba6437) from Completion
- [newReply()](Completion.md#m-newReply-15892c4ebb44) from Completion
- [validate()](#m-validate-dc7ca5eb97ec)

## Constructors

### CompletionRangeEnumReply(int) <a href="#m-CompletionRangeEnumReply-0e71c3d85b9e" id="m-CompletionRangeEnumReply-0e71c3d85b9e"></a>

```java
protected CompletionRangeEnumReply(int keySize)
```

**Parameters**

- `int keySize`


## Methods

### addEntryKeyValues(List<String>) <a href="#m-addEntryKeyValues-50f532a0c6fd" id="m-addEntryKeyValues-50f532a0c6fd"></a>

```java
public void addEntryKeyValues(
    java.util.List<String> keyList
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

Add keys for a list entry.
 The number of keys was specified in
 the instantiation using [`Completion#newRangeEnumReply(int)`](Completion.md#m-newRangeEnumReply-5c101dba6437)
 The keyList parameter list size()  be of length keySize or
 an exception is thrown.

**Parameters**

- `java.util.List<String> keyList` - `List<String>` of keys for an entry,
                must be of size keySize

**Throws**

- `DpCallbackException`

### addEntryKeyValues(String[]) <a href="#m-addEntryKeyValues-863ff2f2eb03" id="m-addEntryKeyValues-863ff2f2eb03"></a>

```java
public void addEntryKeyValues(String[] keyValues) throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)

Add keys for a list entry.
 The number of keys was specified in
 the instantiation using [`Completion#newRangeEnumReply(int)`](Completion.md#m-newRangeEnumReply-5c101dba6437)
 The keyValues parameter array length must be of length keySize or
 an exception is thrown.

**Parameters**

- `String[] keyValues` - String[] of keys for this list entry,
                  must be of keySize length

### encode() <a href="#m-encode-fbae522bba37" id="m-encode-fbae522bba37"></a>

```java
protected com.tailf.proto.ConfEList encode()
```

Types: [ConfEList](../proto/ConfEList.md#cls-ConfEList)

### validate() <a href="#m-validate-dc7ca5eb97ec" id="m-validate-dc7ca5eb97ec"></a>

```java
protected void validate() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)
