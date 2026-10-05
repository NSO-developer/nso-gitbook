<a id="cls-CompletionReply"></a>
# CompletionReply

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

- [CompletionReply()](#m-completionreply-c343da72c278)

**Methods**:

- [addCompletion(String, String)](#m-addcompletion-a74d991bf023)
- [encode()](#m-encode-fbae522bba37)
- [newDefaultReply()](Completion.md#m-newdefaultreply-5583906bcd7c) from Completion
- [newRangeEnumReply(int)](Completion.md#m-newrangeenumreply-5c101dba6437) from Completion
- [newReply()](Completion.md#m-newreply-15892c4ebb44) from Completion
- [setCompletionDesc(String)](#m-setcompletiondesc-e675fbf83e8d)
- [setCompletionInfo(String)](#m-setcompletioninfo-e4b2cbdfc598)
- [validate()](#m-validate-dc7ca5eb97ec)

## Constructors

<a id="m-completionreply-c343da72c278"></a>
### CompletionReply()

```java
protected CompletionReply()
```


## Methods

<a id="m-addcompletion-a74d991bf023"></a>
### addCompletion(String, String)

```java
public void addCompletion(String completion, String extra)
```

Adding one of possibly many completions as the reply for a
 callback invocation

**Parameters**

- `String completion` - String representing a completion
- `String extra` - currently not used

<a id="m-encode-fbae522bba37"></a>
### encode()

```java
protected com.tailf.proto.ConfEList encode()
```

Types: [ConfEList](../proto/ConfEList.md#cls-ConfEList)

<a id="m-setcompletiondesc-e675fbf83e8d"></a>
### setCompletionDesc(String)

```java
public void setCompletionDesc(String desc)
```

Set the completion description field for this reply

**Parameters**

- `String desc` - String representing the description field

<a id="m-setcompletioninfo-e4b2cbdfc598"></a>
### setCompletionInfo(String)

```java
public void setCompletionInfo(String info)
```

Set the completion info field for this reply

**Parameters**

- `String info` - String representing the info field

<a id="m-validate-dc7ca5eb97ec"></a>
### validate()

**Package-private**

```java
void validate() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)
