<a id="cls-AuthorizationCallback"></a>
# AuthorizationCallback

```java
@java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy.RUNTIME)
@java.lang.annotation.Target({java.lang.annotation.ElementType.METHOD})
public @interface com.tailf.dp.annotations.AuthorizationCallback
```

Annotation class for Authorization Callbacks Attribute are callType

## Members

**Methods**:

- [callType()](#m-calltype-0d0f9b61a036)

## Methods

<a id="m-calltype-0d0f9b61a036"></a>
### callType()

```java
public abstract com.tailf.dp.proto.AuthorizationCBType[] callType()
```

Types: [AuthorizationCBType](../proto/AuthorizationCBType.md#cls-AuthorizationCBType)

Specifies the types of authorization callbacks this method should handle.

**Returns:** an array of [`AuthorizationCBType`](../proto/AuthorizationCBType.md#cls-AuthorizationCBType) values indicating the
         authorization callback types that this method should handle
