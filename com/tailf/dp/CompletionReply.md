<a id="s-CompletionReply"></a>
# CompletionReply

```java
public class com.tailf.dp.CompletionReply
    extends com.tailf.dp.Completion
```

Types: [Completion](Completion.md#s-Completion)

Reply structure container for completion callbacks invoked by a
 tailf:cli-completion-actionpoint or a
 tailf:cli-custom-range-actionpoint directive.

## Members

**Constructors**:

- [CompletionReply()](#s-CompletionReply-1)

**Methods**:

- [addCompletion(String, String)](#s-addCompletion)
- [encode()](#s-encode)
- [newDefaultReply()](Completion.md#s-newDefaultReply) from Completion
- [newRangeEnumReply(int)](Completion.md#s-newRangeEnumReply) from Completion
- [newReply()](Completion.md#s-newReply) from Completion
- [setCompletionDesc(String)](#s-setCompletionDesc)
- [setCompletionInfo(String)](#s-setCompletionInfo)
- [validate()](#s-validate)

## Constructors

<a id="s-CompletionReply-1"></a>
### CompletionReply()

```java
protected CompletionReply()
```


## Methods

<a id="s-addCompletion"></a>
### addCompletion(String, String)

```java
public void addCompletion(String completion, String extra)
```

Adding one of possibly many completions as the reply for a
 callback invocation

**Parameters**

- `String completion` - String representing a completion
- `String extra` - currently not used

<a id="s-encode"></a>
### encode()

```java
protected com.tailf.proto.ConfEList encode()
```

Types: [ConfEList](../proto/ConfEList.md#s-ConfEList)

<a id="s-setCompletionDesc"></a>
### setCompletionDesc(String)

```java
public void setCompletionDesc(String desc)
```

Set the completion description field for this reply

**Parameters**

- `String desc` - String representing the description field

<a id="s-setCompletionInfo"></a>
### setCompletionInfo(String)

```java
public void setCompletionInfo(String info)
```

Set the completion info field for this reply

**Parameters**

- `String info` - String representing the info field

<a id="s-validate"></a>
### validate()

**Package-private**

```java
void validate() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#s-DpCallbackException)
