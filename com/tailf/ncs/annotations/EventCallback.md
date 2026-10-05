# EventCallback <a href="#eventcallback-db4e4246d0c8" id="eventcallback-db4e4246d0c8"></a>

```java
@java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy.RUNTIME)
@java.lang.annotation.Target({java.lang.annotation.ElementType.METHOD})
public @interface com.tailf.ncs.annotations.EventCallback
```

Annotation class for Event Callbacks Attributes are deviceName,
 SubscriptionName, callType

## Members

**Methods**:

- [callType()](#calltype-0d0f9b61a036)
- [deviceName()](#devicename-e1bdeb253d0a)
- [subscriptionName()](#subscriptionname-2f5dadeb6aba)

## Methods

### callType() <a href="#calltype-0d0f9b61a036" id="calltype-0d0f9b61a036"></a>

```java
public abstract com.tailf.ncs.proto.EventCBType[] callType()
```

Types: [EventCBType](../proto/EventCBType.md#eventcbtype-2b91d6aed05c)

### deviceName() <a href="#devicename-e1bdeb253d0a" id="devicename-e1bdeb253d0a"></a>

```java
public abstract String deviceName()
```

### subscriptionName() <a href="#subscriptionname-2f5dadeb6aba" id="subscriptionname-2f5dadeb6aba"></a>

```java
public abstract String subscriptionName()
```
