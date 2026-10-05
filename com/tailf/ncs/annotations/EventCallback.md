<a id="cls-EventCallback"></a>
# EventCallback

```java
@java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy.RUNTIME)
@java.lang.annotation.Target({java.lang.annotation.ElementType.METHOD})
public @interface com.tailf.ncs.annotations.EventCallback
```

Annotation class for Event Callbacks Attributes are deviceName,
 SubscriptionName, callType

## Members

**Methods**:

- [callType()](#m-calltype-0d0f9b61a036)
- [deviceName()](#m-devicename-e1bdeb253d0a)
- [subscriptionName()](#m-subscriptionname-2f5dadeb6aba)

## Methods

<a id="m-calltype-0d0f9b61a036"></a>
### callType()

```java
public abstract com.tailf.ncs.proto.EventCBType[] callType()
```

Types: [EventCBType](../proto/EventCBType.md#cls-EventCBType)

<a id="m-devicename-e1bdeb253d0a"></a>
### deviceName()

```java
public abstract String deviceName()
```

<a id="m-subscriptionname-2f5dadeb6aba"></a>
### subscriptionName()

```java
public abstract String subscriptionName()
```
