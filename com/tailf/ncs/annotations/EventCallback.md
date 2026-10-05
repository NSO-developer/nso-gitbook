# EventCallback <a href="#cls-EventCallback" id="cls-EventCallback"></a>

```java
@java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy.RUNTIME)
@java.lang.annotation.Target({java.lang.annotation.ElementType.METHOD})
public @interface com.tailf.ncs.annotations.EventCallback
```

Annotation class for Event Callbacks Attributes are deviceName,
 SubscriptionName, callType

## Members

**Methods**:

- [callType()](#m-callType-0d0f9b61a036)
- [deviceName()](#m-deviceName-e1bdeb253d0a)
- [subscriptionName()](#m-subscriptionName-2f5dadeb6aba)

## Methods

### callType() <a href="#m-callType-0d0f9b61a036" id="m-callType-0d0f9b61a036"></a>

```java
public abstract com.tailf.ncs.proto.EventCBType[] callType()
```

Types: [EventCBType](../proto/EventCBType.md#cls-EventCBType)

### deviceName() <a href="#m-deviceName-e1bdeb253d0a" id="m-deviceName-e1bdeb253d0a"></a>

```java
public abstract String deviceName()
```

### subscriptionName() <a href="#m-subscriptionName-2f5dadeb6aba" id="m-subscriptionName-2f5dadeb6aba"></a>

```java
public abstract String subscriptionName()
```
