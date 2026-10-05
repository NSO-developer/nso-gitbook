# SubagentNotification <a href="#subagentnotification-d8adb6073ef3" id="subagentnotification-d8adb6073ef3"></a>

```java
public class com.tailf.notif.SubagentNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#notification-b2e7d82d4215)

Data structure for subagent notifications.

## Members

**Constructors**:

- [SubagentNotification\(int, String\)](#subagentnotification-715af773f705)

**Fields**:

- [SUBAGENT\_INFO\_DOWN](#subagent_info_down-cf76d2628896)
- [SUBAGENT\_INFO\_UP](#subagent_info_up-ce217614ea1e)
- [type](Notification.md#type-6ebb3673fbb6) from Notification

**Methods**:

- [getName\(\)](#getname-2634b18b4a25)
- [getNotificationType\(\)](Notification.md#getnotificationtype-f0e32b7b644f) from Notification
- [getSubAgentInfoType\(\)](#getsubagentinfotype-43388cfe9ce2)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### SubagentNotification(int, String) <a href="#subagentnotification-715af773f705" id="subagentnotification-715af773f705"></a>

```java
public SubagentNotification(int subagentInfoType, String name)
```

**Parameters**

- `int subagentInfoType`
- `String name`


## Fields

### SUBAGENT_INFO_DOWN <a href="#subagent_info_down-cf76d2628896" id="subagent_info_down-cf76d2628896"></a>

```java
public static final int SUBAGENT_INFO_DOWN = 2;
```

### SUBAGENT_INFO_UP <a href="#subagent_info_up-ce217614ea1e" id="subagent_info_up-ce217614ea1e"></a>

```java
public static final int SUBAGENT_INFO_UP = 1;
```


## Methods

### getName() <a href="#getname-2634b18b4a25" id="getname-2634b18b4a25"></a>

```java
public String getName()
```

Name of subagent.

### getSubAgentInfoType() <a href="#getsubagentinfotype-43388cfe9ce2" id="getsubagentinfotype-43388cfe9ce2"></a>

```java
public int getSubAgentInfoType()
```

Subagent information type:


- [`SUBAGENT_INFO_UP`](SubagentNotification.md#subagent_info_up-ce217614ea1e)
   - [`SUBAGENT_INFO_DOWN`](SubagentNotification.md#subagent_info_down-cf76d2628896)

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
