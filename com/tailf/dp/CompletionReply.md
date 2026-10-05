# CompletionReply <a href="#cls-CompletionReply" id="cls-CompletionReply"></a>

```java
public class com.tailf.dp.CompletionReply
    extends com.tailf.dp.Completion
```

Types: [Completion](Completion.md#cls-Completion)

Reply structure container for completion callbacks invoked by a
 tailf:cli-completion-actionpoint or a
 tailf:cli-custom-range-actionpoint directive.

## Members

**Constructors**:

- [CompletionReply()](#m-CompletionReply-c343da72c278)

**Methods**:

- [addCompletion(String, String)](#m-addCompletion-a74d991bf023)
- [encode()](#m-encode-fbae522bba37)
- [newDefaultReply()](Completion.md#m-newDefaultReply-5583906bcd7c) from Completion
- [newRangeEnumReply(int)](Completion.md#m-newRangeEnumReply-5c101dba6437) from Completion
- [newReply()](Completion.md#m-newReply-15892c4ebb44) from Completion
- [setCompletionDesc(String)](#m-setCompletionDesc-e675fbf83e8d)
- [setCompletionInfo(String)](#m-setCompletionInfo-e4b2cbdfc598)
- [validate()](#m-validate-dc7ca5eb97ec)

## Constructors

### CompletionReply() <a href="#m-CompletionReply-c343da72c278" id="m-CompletionReply-c343da72c278"></a>

```java
protected CompletionReply()
```


## Methods

### addCompletion(String, String) <a href="#m-addCompletion-a74d991bf023" id="m-addCompletion-a74d991bf023"></a>

```java
public void addCompletion(String completion, String extra)
```

Adding one of possibly many completions as the reply for a
 callback invocation

**Parameters**

- `String completion` - String representing a completion
- `String extra` - currently not used

### encode() <a href="#m-encode-fbae522bba37" id="m-encode-fbae522bba37"></a>

```java
protected com.tailf.proto.ConfEList encode()
```

Types: [ConfEList](../proto/ConfEList.md#cls-ConfEList)

### setCompletionDesc(String) <a href="#m-setCompletionDesc-e675fbf83e8d" id="m-setCompletionDesc-e675fbf83e8d"></a>

```java
public void setCompletionDesc(String desc)
```

Set the completion description field for this reply

**Parameters**

- `String desc` - String representing the description field

### setCompletionInfo(String) <a href="#m-setCompletionInfo-e4b2cbdfc598" id="m-setCompletionInfo-e4b2cbdfc598"></a>

```java
public void setCompletionInfo(String info)
```

Set the completion info field for this reply

**Parameters**

- `String info` - String representing the info field

### validate() <a href="#m-validate-dc7ca5eb97ec" id="m-validate-dc7ca5eb97ec"></a>

**Package-private**

```java
void validate() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)
