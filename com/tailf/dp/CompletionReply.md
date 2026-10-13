# CompletionReply <a href="#completionreply-21386c591079" id="completionreply-21386c591079"></a>

```java
public class com.tailf.dp.CompletionReply
    extends com.tailf.dp.Completion
```

Types: [Completion](Completion.md#completion-86b0b2e96c7f)

Reply structure container for completion callbacks invoked by a
 tailf:cli-completion-actionpoint or a
 tailf:cli-custom-range-actionpoint directive.

## Members

**Constructors**:

- [CompletionReply\(\)](#completionreply-c343da72c278)

**Methods**:

- [addCompletion\(String, String\)](#addcompletion-a74d991bf023)
- [encode\(\)](#encode-fbae522bba37)
- [newDefaultReply\(\)](Completion.md#newdefaultreply-5583906bcd7c) from Completion
- [newRangeEnumReply\(int\)](Completion.md#newrangeenumreply-5c101dba6437) from Completion
- [newReply\(\)](Completion.md#newreply-15892c4ebb44) from Completion
- [setCompletionDesc\(String\)](#setcompletiondesc-e675fbf83e8d)
- [setCompletionInfo\(String\)](#setcompletioninfo-e4b2cbdfc598)
- [validate\(\)](#validate-dc7ca5eb97ec)

## Constructors

### CompletionReply() <a href="#completionreply-c343da72c278" id="completionreply-c343da72c278"></a>

```java
protected CompletionReply()
```


## Methods

### addCompletion(String, String) <a href="#addcompletion-a74d991bf023" id="addcompletion-a74d991bf023"></a>

```java
public void addCompletion(String completion, String extra)
```

Adding one of possibly many completions as the reply for a
 callback invocation

**Parameters**

- `String completion` - String representing a completion
- `String extra` - currently not used

### encode() <a href="#encode-fbae522bba37" id="encode-fbae522bba37"></a>

```java
protected com.tailf.proto.ConfEList encode()
```

Types: [ConfEList](../proto/ConfEList.md#confelist-78fa4ba3b3a8)

### setCompletionDesc(String) <a href="#setcompletiondesc-e675fbf83e8d" id="setcompletiondesc-e675fbf83e8d"></a>

```java
public void setCompletionDesc(String desc)
```

Set the completion description field for this reply

**Parameters**

- `String desc` - String representing the description field

### setCompletionInfo(String) <a href="#setcompletioninfo-e4b2cbdfc598" id="setcompletioninfo-e4b2cbdfc598"></a>

```java
public void setCompletionInfo(String info)
```

Set the completion info field for this reply

**Parameters**

- `String info` - String representing the info field

### validate() <a href="#validate-dc7ca5eb97ec" id="validate-dc7ca5eb97ec"></a>

**Package-private**

```java
void validate() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)
