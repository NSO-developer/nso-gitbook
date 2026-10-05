# CompletionDefaultReply <a href="#completiondefaultreply-0777c6672e09" id="completiondefaultreply-0777c6672e09"></a>

```java
public class com.tailf.dp.CompletionDefaultReply
    extends com.tailf.dp.Completion
```

Types: [Completion](Completion.md#completion-86b0b2e96c7f)

Default completion reply for callbacks invoked by a
 tailf:cli-completion-actionpoint or a
 tailf:cli-custom-range-actionpoint directive.

## Members

**Constructors**:

- [CompletionDefaultReply()](#completiondefaultreply-fa43ba8d9700)

**Methods**:

- [encode()](#encode-fbae522bba37)
- [newDefaultReply()](Completion.md#newdefaultreply-5583906bcd7c) from Completion
- [newRangeEnumReply(int)](Completion.md#newrangeenumreply-5c101dba6437) from Completion
- [newReply()](Completion.md#newreply-15892c4ebb44) from Completion
- [validate()](#validate-dc7ca5eb97ec)

## Constructors

### CompletionDefaultReply() <a href="#completiondefaultreply-fa43ba8d9700" id="completiondefaultreply-fa43ba8d9700"></a>

```java
protected CompletionDefaultReply()
```


## Methods

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
