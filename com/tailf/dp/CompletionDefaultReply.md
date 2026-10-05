<a id="s-CompletionDefaultReply"></a>
# CompletionDefaultReply

```java
public class com.tailf.dp.CompletionDefaultReply
    extends com.tailf.dp.Completion
```

Types: [Completion](Completion.md#s-Completion)

Default completion reply for callbacks invoked by a
 tailf:cli-completion-actionpoint or a
 tailf:cli-custom-range-actionpoint directive.

## Members

**Constructors**:

- [CompletionDefaultReply()](#s-CompletionDefaultReply-1)

**Methods**:

- [encode()](#s-encode)
- [newDefaultReply()](Completion.md#s-newDefaultReply) from Completion
- [newRangeEnumReply(int)](Completion.md#s-newRangeEnumReply) from Completion
- [newReply()](Completion.md#s-newReply) from Completion
- [validate()](#s-validate)

## Constructors

<a id="s-CompletionDefaultReply-1"></a>
### CompletionDefaultReply()

```java
protected CompletionDefaultReply()
```


## Methods

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
