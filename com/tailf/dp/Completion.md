# Completion <a href="#cls-Completion" id="cls-Completion"></a>

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

- [CompletionDefaultReply](CompletionDefaultReply.md#cls-CompletionDefaultReply)
- [CompletionRangeEnumReply](CompletionRangeEnumReply.md#cls-CompletionRangeEnumReply)
- [CompletionReply](CompletionReply.md#cls-CompletionReply)

## Members

**Constructors**:

- [Completion()](#m-Completion-b01cd1890a7a)

**Methods**:

- [encode()](#m-encode-fbae522bba37)
- [newDefaultReply()](#m-newDefaultReply-5583906bcd7c)
- [newRangeEnumReply(int)](#m-newRangeEnumReply-5c101dba6437)
- [newReply()](#m-newReply-15892c4ebb44)
- [validate()](#m-validate-dc7ca5eb97ec)

## Constructors

### Completion() <a href="#m-Completion-b01cd1890a7a" id="m-Completion-b01cd1890a7a"></a>

```java
public Completion()
```


## Methods

### encode() <a href="#m-encode-fbae522bba37" id="m-encode-fbae522bba37"></a>

```java
protected abstract com.tailf.proto.ConfEList encode()
```

Types: [ConfEList](../proto/ConfEList.md#cls-ConfEList)

### newDefaultReply() <a href="#m-newDefaultReply-5583906bcd7c" id="m-newDefaultReply-5583906bcd7c"></a>

```java
public static com.tailf.dp.CompletionDefaultReply newDefaultReply()
```

Types: [CompletionDefaultReply](CompletionDefaultReply.md#cls-CompletionDefaultReply)

The [`CompletionDefaultReply`](CompletionDefaultReply.md#cls-CompletionDefaultReply) instance is the possible response
 for a tailf:cli-completion-actionpoint or a
 tailf:cli-custom-range-actionpoint directive.

 Its use is to signal that the default completion mechanism should be
 used instead of any assembling of this invocation.

 As such, no further processing of this instance is needed, instead this
 instance can be directly passed as a response to the invocation.

**Returns:** CompletionDefaultReply

### newRangeEnumReply(int) <a href="#m-newRangeEnumReply-5c101dba6437" id="m-newRangeEnumReply-5c101dba6437"></a>

```java
public static com.tailf.dp.CompletionRangeEnumReply newRangeEnumReply(int keySize)
```

Types: [CompletionRangeEnumReply](CompletionRangeEnumReply.md#cls-CompletionRangeEnumReply)

The [`CompletionRangeEnumReply`](CompletionRangeEnumReply.md#cls-CompletionRangeEnumReply) instance is the expected response
 for a tailf:cli-custom-range-enumerator actionpoint.

 The instantiated reply needs to be assembled using its class
 helper methods before it can be sent as a response.

 Its use is in YANG model lists where a range completion is of interest.
 The number of keys in the list needs to be supplied in this call.

**Parameters**

- `int keySize` - number of keys in the list

**Returns:** CompletionRangeEnumReply

### newReply() <a href="#m-newReply-15892c4ebb44" id="m-newReply-15892c4ebb44"></a>

```java
public static com.tailf.dp.CompletionReply newReply()
```

Types: [CompletionReply](CompletionReply.md#cls-CompletionReply)

The [`CompletionReply`](CompletionReply.md#cls-CompletionReply) instance is the possible response for a
 tailf:cli-completion-actionpoint or a
 tailf:cli-custom-range-actionpoint directive.

 The instantiated reply needs to be assembled using its class
 helper methods before it can be sent as a response.

**Returns:** CompletionReply

### validate() <a href="#m-validate-dc7ca5eb97ec" id="m-validate-dc7ca5eb97ec"></a>

**Package-private**

```java
abstract void validate() throws com.tailf.dp.DpCallbackException
```

Types: [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)
