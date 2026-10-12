# InternalEventCB <a href="#internaleventcb-abf2cc138ac7" id="internaleventcb-abf2cc138ac7"></a>

```java
protected class com.tailf.ncs.NavuEventHandler.InternalEventCB
    implements com.tailf.ncs.NavuEventCallback
```

Types: [NavuEventCallback](../NavuEventCallback.md#navueventcallback-f83ce6fd0d42)

## Members

**Constructors**:

- [InternalEventCB\(String\)](#internaleventcb-e17ccfc19f93)

**Methods**:

- [notifReceived\(NavuContainer\)](#notifreceived-df06be623526)

## Constructors

### InternalEventCB(String) <a href="#internaleventcb-e17ccfc19f93" id="internaleventcb-e17ccfc19f93"></a>

```java
public InternalEventCB(String logString)
```

**Parameters**

- `String logString`


## Methods

### notifReceived(NavuContainer) <a href="#notifreceived-df06be623526" id="notifreceived-df06be623526"></a>

```java
public void notifReceived(com.tailf.navu.NavuContainer event) throws com.tailf.ncs.NcsException
```

Types: [NavuContainer](../../navu/NavuContainer.md#navucontainer-8e321756755f), [NcsException](../NcsException.md#ncsexception-d2b40ca98ea5)

*Description from* [`NavuEventCallback.notifReceived(com.tailf.navu.NavuContainer)`](../NavuEventCallback.md#notifreceived-df06be623526)

This callback method is received to each cdb notification that correspond
 to the annotated deviceName and subscription name. Note, that a "\*" as
 name implies wildcard - that any name will match.

 The method get as parameter the event in a NavuContainer

**Parameters**

- `com.tailf.navu.NavuContainer event`
