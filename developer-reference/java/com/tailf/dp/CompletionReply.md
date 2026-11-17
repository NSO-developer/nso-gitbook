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

**Methods**:

- [addCompletion\(String, String\)](#addcompletion-a74d991bf023)
- [newDefaultReply\(\)](Completion.md#newdefaultreply-5583906bcd7c) from Completion
- [newRangeEnumReply\(int\)](Completion.md#newrangeenumreply-5c101dba6437) from Completion
- [newReply\(\)](Completion.md#newreply-15892c4ebb44) from Completion
- [setCompletionDesc\(String\)](#setcompletiondesc-e675fbf83e8d)
- [setCompletionInfo\(String\)](#setcompletioninfo-e4b2cbdfc598)

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
