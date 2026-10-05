# CompletionRangeEnumReply <a href="#completionrangeenumreply-ce8621e14f9a" id="completionrangeenumreply-ce8621e14f9a"></a>

```java
public class com.tailf.dp.CompletionRangeEnumReply
    extends com.tailf.dp.Completion
```

Types: [Completion](Completion.md#completion-86b0b2e96c7f)

Reply structure container for completion callbacks invoked by a
 tailf:cli-custom-range-enumerator directive.

 This reply class is used to assemble list instance key completions.

## Members

**Constructors**:

- [CompletionRangeEnumReply(int)](#completionrangeenumreply-0e71c3d85b9e)

**Methods**:

- [addEntryKeyValues(List<String>)](#addentrykeyvalues-50f532a0c6fd)
- [addEntryKeyValues(String[])](#addentrykeyvalues-863ff2f2eb03)
- [encode()](#encode-fbae522bba37)
- [newDefaultReply()](Completion.md#newdefaultreply-5583906bcd7c) from Completion
- [newRangeEnumReply(int)](Completion.md#newrangeenumreply-5c101dba6437) from Completion
- [newReply()](Completion.md#newreply-15892c4ebb44) from Completion
- [validate()](#validate-dc7ca5eb97ec)

## Constructors

### CompletionRangeEnumReply(int) <a href="#completionrangeenumreply-0e71c3d85b9e" id="completionrangeenumreply-0e71c3d85b9e"></a>

```java
protected CompletionRangeEnumReply(int keySize)
```

**Parameters**

- `int keySize`


## Methods

### addEntryKeyValues(List&lt;String&gt;) <a href="#addentrykeyvalues-50f532a0c6fd" id="addentrykeyvalues-50f532a0c6fd"></a>

```java
public void addEntryKeyValues(
    java.util.List<String> keyList
)
    throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

Add keys for a list entry.
 The number of keys was specified in
 the instantiation using [`Completion#newRangeEnumReply(int)`](Completion.md#newrangeenumreply-5c101dba6437)
 The keyList parameter list size()  be of length keySize or
 an exception is thrown.

**Parameters**

- `java.util.List<String> keyList` - `List<String>` of keys for an entry,
                must be of size keySize

**Throws**

- `DpCallbackException`

### addEntryKeyValues(String[]) <a href="#addentrykeyvalues-863ff2f2eb03" id="addentrykeyvalues-863ff2f2eb03"></a>

```java
public void addEntryKeyValues(String[] keyValues) throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)

Add keys for a list entry.
 The number of keys was specified in
 the instantiation using [`Completion#newRangeEnumReply(int)`](Completion.md#newrangeenumreply-5c101dba6437)
 The keyValues parameter array length must be of length keySize or
 an exception is thrown.

**Parameters**

- `String[] keyValues` - String[] of keys for this list entry,
                  must be of keySize length

### encode() <a href="#encode-fbae522bba37" id="encode-fbae522bba37"></a>

```java
protected com.tailf.proto.ConfEList encode()
```

Types: [ConfEList](../proto/ConfEList.md#confelist-78fa4ba3b3a8)

### validate() <a href="#validate-dc7ca5eb97ec" id="validate-dc7ca5eb97ec"></a>

```java
protected void validate() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)
