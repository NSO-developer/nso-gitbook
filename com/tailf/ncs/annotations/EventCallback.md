<a id="s-EventCallback"></a>
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

- [callType()](#s-callType)
- [deviceName()](#s-deviceName)
- [subscriptionName()](#s-subscriptionName)

## Methods

<a id="s-callType"></a>
### callType()

```java
public abstract com.tailf.ncs.proto.EventCBType[] callType()
```

Types: [EventCBType](../proto/EventCBType.md#s-EventCBType)

<a id="s-deviceName"></a>
### deviceName()

```java
public abstract String deviceName()
```

<a id="s-subscriptionName"></a>
### subscriptionName()

```java
public abstract String subscriptionName()
```
