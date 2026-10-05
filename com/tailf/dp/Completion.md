<a id="s-Completion"></a>
# Completion

```java
public abstract class com.tailf.dp.Completion
```

Reply structure container for completion callbacks.
  This is an abstract class its implementation subclasses are instantiated
  via one of its static newXXXReply methods.

  Which one to use depend on the actionpoint and the specific invocation.

  An example of the usage of this class is as follows:

  Having a YANG model snippet like the following:


```
  container application {
    leaf file-name {
      type string;
      tailf:cli-completion-actionpoint "file-complete" {
        tailf:cli-completion-id "path";
      }
    }
  }
```


  The corresponding completion action is as follows:



```
  ActionCallback(callPoint = "file-complete",
                 callType = ActionCBType.COMPLETION)
  public Completion completion(DpActionTrans actx, char cliStyle,
                               String token, char completionChar,
                               ConfObject[] kp, String cmdPath,
                               String cmdParamId, ConfQname simpleType,
                               String extra) throws DpCallbackException {
     ....
     // User processing of the completion
     ....
     CompletionReply reply = Completion.newReply();
     reply.addCompletion("completion-entry1", null);
     ...
     reply.addCompletion("completion-entryN", null);
     reply.setCompletionInfo("my-info");
     reply.setCompletionDesc("my-description");
     return reply;
  }
```

**Related classes**

- [CompletionDefaultReply](CompletionDefaultReply.md#s-CompletionDefaultReply)
- [CompletionRangeEnumReply](CompletionRangeEnumReply.md#s-CompletionRangeEnumReply)
- [CompletionReply](CompletionReply.md#s-CompletionReply)

## Members

**Constructors**:

- [Completion()](#s-Completion-1)

**Methods**:

- [encode()](#s-encode)
- [newDefaultReply()](#s-newDefaultReply)
- [newRangeEnumReply(int)](#s-newRangeEnumReply)
- [newReply()](#s-newReply)
- [validate()](#s-validate)

## Constructors

<a id="s-Completion-1"></a>
### Completion()

```java
public Completion()
```


## Methods

<a id="s-encode"></a>
### encode()

```java
protected abstract com.tailf.proto.ConfEList encode()
```

Types: [ConfEList](../proto/ConfEList.md#s-ConfEList)

<a id="s-newDefaultReply"></a>
### newDefaultReply()

```java
public static com.tailf.dp.CompletionDefaultReply newDefaultReply()
```

Types: [CompletionDefaultReply](CompletionDefaultReply.md#s-CompletionDefaultReply)

The [`CompletionDefaultReply`](CompletionDefaultReply.md#s-CompletionDefaultReply) instance is the possible response
 for a tailf:cli-completion-actionpoint or a
 tailf:cli-custom-range-actionpoint directive.

 Its use is to signal that the default completion mechanism should be
 used instead of any assembling of this invocation.

 As such, no further processing of this instance is needed, instead this
 instance can be directly passed as a response to the invocation.

**Returns:** CompletionDefaultReply

<a id="s-newRangeEnumReply"></a>
### newRangeEnumReply(int)

```java
public static com.tailf.dp.CompletionRangeEnumReply newRangeEnumReply(int keySize)
```

Types: [CompletionRangeEnumReply](CompletionRangeEnumReply.md#s-CompletionRangeEnumReply)

The [`CompletionRangeEnumReply`](CompletionRangeEnumReply.md#s-CompletionRangeEnumReply) instance is the expected response
 for a tailf:cli-custom-range-enumerator actionpoint.

 The instantiated reply needs to be assembled using its class
 helper methods before it can be sent as a response.

 Its use is in YANG model lists where a range completion is of interest.
 The number of keys in the list needs to be supplied in this call.

**Parameters**

- `int keySize` - number of keys in the list

**Returns:** CompletionRangeEnumReply

<a id="s-newReply"></a>
### newReply()

```java
public static com.tailf.dp.CompletionReply newReply()
```

Types: [CompletionReply](CompletionReply.md#s-CompletionReply)

The [`CompletionReply`](CompletionReply.md#s-CompletionReply) instance is the possible response for a
 tailf:cli-completion-actionpoint or a
 tailf:cli-custom-range-actionpoint directive.

 The instantiated reply needs to be assembled using its class
 helper methods before it can be sent as a response.

**Returns:** CompletionReply

<a id="s-validate"></a>
### validate()

**Package-private**

```java
abstract void validate() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#s-DpCallbackException)
