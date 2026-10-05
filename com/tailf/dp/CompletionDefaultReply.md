<a id="cls-CompletionDefaultReply"></a>
# CompletionDefaultReply

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

- [CompletionDefaultReply()](#m-completiondefaultreply-fa43ba8d9700)

**Methods**:

- [encode()](#m-encode-fbae522bba37)
- [newDefaultReply()](Completion.md#m-newdefaultreply-5583906bcd7c) from Completion
- [newRangeEnumReply(int)](Completion.md#m-newrangeenumreply-5c101dba6437) from Completion
- [newReply()](Completion.md#m-newreply-15892c4ebb44) from Completion
- [validate()](#m-validate-dc7ca5eb97ec)

## Constructors

<a id="m-completiondefaultreply-fa43ba8d9700"></a>
### CompletionDefaultReply()

```java
protected CompletionDefaultReply()
```


## Methods

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
