# CompletionDefaultReply <a href="#cls-CompletionDefaultReply" id="cls-CompletionDefaultReply"></a>

```java
public class com.tailf.dp.CompletionDefaultReply
    extends com.tailf.dp.Completion
```

Types: [Completion](Completion.md#cls-Completion)

Default completion reply for callbacks invoked by a
 tailf:cli-completion-actionpoint or a
 tailf:cli-custom-range-actionpoint directive.

## Members

**Constructors**:

- [CompletionDefaultReply()](#m-CompletionDefaultReply-fa43ba8d9700)

**Methods**:

- [encode()](#m-encode-fbae522bba37)
- [newDefaultReply()](Completion.md#m-newDefaultReply-5583906bcd7c) from Completion
- [newRangeEnumReply(int)](Completion.md#m-newRangeEnumReply-5c101dba6437) from Completion
- [newReply()](Completion.md#m-newReply-15892c4ebb44) from Completion
- [validate()](#m-validate-dc7ca5eb97ec)

## Constructors

### CompletionDefaultReply() <a href="#m-CompletionDefaultReply-fa43ba8d9700" id="m-CompletionDefaultReply-fa43ba8d9700"></a>

```java
protected CompletionDefaultReply()
```


## Methods

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
