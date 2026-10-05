# NavuEventCallback <a href="#cls-NavuEventCallback" id="cls-NavuEventCallback"></a>

```java
public interface com.tailf.ncs.NavuEventCallback
```

NavuEventCallback interface is used to implement callback methods to be used
 my the NavuEventHandler.

 The callback method will be invoked for received cdb notifications.

## Members

**Methods**:

- [notifReceived(NavuContainer)](#m-notifReceived-df06be623526)

## Methods

### notifReceived(NavuContainer) <a href="#m-notifReceived-df06be623526" id="m-notifReceived-df06be623526"></a>

```java
public abstract void notifReceived(
    com.tailf.navu.NavuContainer event
)
    throws com.tailf.ncs.NcsException
```

Types: [NavuContainer](../navu/NavuContainer.md#cls-NavuContainer), [NcsException](NcsException.md#cls-NcsException)

This callback method is received to each cdb notification that correspond
 to the annotated deviceName and subscription name. Note, that a "*" as
 name implies wildcard - that any name will match.

 The method get as parameter the event in a NavuContainer

**Parameters**

- `com.tailf.navu.NavuContainer event`

**Throws**

- `NcsException`
