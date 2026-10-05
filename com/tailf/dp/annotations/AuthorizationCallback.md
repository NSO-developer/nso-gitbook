# AuthorizationCallback <a href="#authorizationcallback-dcd1f5b5e54e" id="authorizationcallback-dcd1f5b5e54e"></a>

```java
@java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy.RUNTIME)
@java.lang.annotation.Target({java.lang.annotation.ElementType.METHOD})
public @interface com.tailf.dp.annotations.AuthorizationCallback
```

Annotation class for Authorization Callbacks Attribute are callType

## Members

**Methods**:

- [callType()](#calltype-0d0f9b61a036)

## Methods

### callType() <a href="#calltype-0d0f9b61a036" id="calltype-0d0f9b61a036"></a>

```java
public abstract com.tailf.dp.proto.AuthorizationCBType[] callType()
```

Types: [AuthorizationCBType](../proto/AuthorizationCBType.md#authorizationcbtype-53c148cac4cd)

Specifies the types of authorization callbacks this method should handle.

**Returns:** an array of [`AuthorizationCBType`](../proto/AuthorizationCBType.md#authorizationcbtype-53c148cac4cd) values indicating the
         authorization callback types that this method should handle
