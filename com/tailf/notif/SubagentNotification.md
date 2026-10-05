<a id="s-SubagentNotification"></a>
# SubagentNotification

```java
public class com.tailf.notif.SubagentNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#s-Notification)

Data structure for subagent notifications.

## Members

**Constructors**:

- [SubagentNotification(int, String)](#s-SubagentNotification-1)

**Fields**:

- [SUBAGENT_INFO_DOWN](#s-SUBAGENT_INFO_DOWN)
- [SUBAGENT_INFO_UP](#s-SUBAGENT_INFO_UP)
- [type](Notification.md#s-type) from Notification

**Methods**:

- [getName()](#s-getName)
- [getNotificationType()](Notification.md#s-getNotificationType) from Notification
- [getSubAgentInfoType()](#s-getSubAgentInfoType)
- [toString()](#s-toString)

## Constructors

<a id="s-SubagentNotification-1"></a>
### SubagentNotification(int, String)

```java
public SubagentNotification(int subagentInfoType, String name)
```

**Parameters**

- `int subagentInfoType`
- `String name`


## Fields

<a id="s-SUBAGENT_INFO_DOWN"></a>
### SUBAGENT_INFO_DOWN

```java
public static final int SUBAGENT_INFO_DOWN = 2;
```

<a id="s-SUBAGENT_INFO_UP"></a>
### SUBAGENT_INFO_UP

```java
public static final int SUBAGENT_INFO_UP = 1;
```


## Methods

<a id="s-getName"></a>
### getName()

```java
public String getName()
```

Name of subagent.

<a id="s-getSubAgentInfoType"></a>
### getSubAgentInfoType()

```java
public int getSubAgentInfoType()
```

Subagent information type:


- `#SUBAGENT_INFO_UP`
   - `#SUBAGENT_INFO_DOWN`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
