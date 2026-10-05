<a id="cls-SubagentNotification"></a>
# SubagentNotification

```java
public class com.tailf.notif.SubagentNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for subagent notifications.

## Members

**Constructors**:

- [SubagentNotification(int, String)](#m-subagentnotification-715af773f705)

**Fields**:

- [SUBAGENT_INFO_DOWN](#m-SUBAGENT_INFO_DOWN)
- [SUBAGENT_INFO_UP](#m-SUBAGENT_INFO_UP)
- [type](Notification.md#m-type) from Notification

**Methods**:

- [getName()](#m-getname-2634b18b4a25)
- [getNotificationType()](Notification.md#m-getnotificationtype-f0e32b7b644f) from Notification
- [getSubAgentInfoType()](#m-getsubagentinfotype-43388cfe9ce2)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-subagentnotification-715af773f705"></a>
### SubagentNotification(int, String)

```java
public SubagentNotification(int subagentInfoType, String name)
```

**Parameters**

- `int subagentInfoType`
- `String name`


## Fields

<a id="m-SUBAGENT_INFO_DOWN"></a>
### SUBAGENT_INFO_DOWN

```java
public static final int SUBAGENT_INFO_DOWN = 2;
```

<a id="m-SUBAGENT_INFO_UP"></a>
### SUBAGENT_INFO_UP

```java
public static final int SUBAGENT_INFO_UP = 1;
```


## Methods

<a id="m-getname-2634b18b4a25"></a>
### getName()

```java
public String getName()
```

Name of subagent.

<a id="m-getsubagentinfotype-43388cfe9ce2"></a>
### getSubAgentInfoType()

```java
public int getSubAgentInfoType()
```

Subagent information type:


- `#SUBAGENT_INFO_UP`
   - `#SUBAGENT_INFO_DOWN`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
