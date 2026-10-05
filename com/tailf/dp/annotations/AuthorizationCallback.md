# AuthorizationCallback <a href="#cls-AuthorizationCallback" id="cls-AuthorizationCallback"></a>

```java
@java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy.RUNTIME)
@java.lang.annotation.Target({java.lang.annotation.ElementType.METHOD})
public @interface com.tailf.dp.annotations.AuthorizationCallback
```

Annotation class for Authorization Callbacks Attribute are callType

## Members

**Methods**:

- [callType()](#m-callType-0d0f9b61a036)

## Methods

### callType() <a href="#m-callType-0d0f9b61a036" id="m-callType-0d0f9b61a036"></a>

```java
public abstract com.tailf.dp.proto.AuthorizationCBType[] callType()
```

Types: [AuthorizationCBType](../proto/AuthorizationCBType.md#cls-AuthorizationCBType)

Specifies the types of authorization callbacks this method should handle.

**Returns:** an array of [`AuthorizationCBType`](../proto/AuthorizationCBType.md#cls-AuthorizationCBType) values indicating the
         authorization callback types that this method should handle
