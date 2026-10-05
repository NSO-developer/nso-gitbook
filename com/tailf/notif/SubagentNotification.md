# SubagentNotification <a href="#cls-SubagentNotification" id="cls-SubagentNotification"></a>

```java
public class com.tailf.notif.SubagentNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for subagent notifications.

## Members

**Constructors**:

- [SubagentNotification(int, String)](#m-SubagentNotification-715af773f705)

**Fields**:

- [SUBAGENT_INFO_DOWN](#m-SUBAGENT_INFO_DOWN)
- [SUBAGENT_INFO_UP](#m-SUBAGENT_INFO_UP)
- [type](Notification.md#m-type) from Notification

**Methods**:

- [getName()](#m-getName-2634b18b4a25)
- [getNotificationType()](Notification.md#m-getNotificationType-f0e32b7b644f) from Notification
- [getSubAgentInfoType()](#m-getSubAgentInfoType-43388cfe9ce2)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### SubagentNotification(int, String) <a href="#m-SubagentNotification-715af773f705" id="m-SubagentNotification-715af773f705"></a>

```java
public SubagentNotification(int subagentInfoType, String name)
```

**Parameters**

- `int subagentInfoType`
- `String name`


## Fields

### SUBAGENT_INFO_DOWN <a href="#m-SUBAGENT_INFO_DOWN" id="m-SUBAGENT_INFO_DOWN"></a>

```java
public static final int SUBAGENT_INFO_DOWN = 2;
```

### SUBAGENT_INFO_UP <a href="#m-SUBAGENT_INFO_UP" id="m-SUBAGENT_INFO_UP"></a>

```java
public static final int SUBAGENT_INFO_UP = 1;
```


## Methods

### getName() <a href="#m-getName-2634b18b4a25" id="m-getName-2634b18b4a25"></a>

```java
public String getName()
```

Name of subagent.

### getSubAgentInfoType() <a href="#m-getSubAgentInfoType-43388cfe9ce2" id="m-getSubAgentInfoType-43388cfe9ce2"></a>

```java
public int getSubAgentInfoType()
```

Subagent information type:


- [`SUBAGENT_INFO_UP`](SubagentNotification.md#m-SUBAGENT_INFO_UP)
   - [`SUBAGENT_INFO_DOWN`](SubagentNotification.md#m-SUBAGENT_INFO_DOWN)

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
