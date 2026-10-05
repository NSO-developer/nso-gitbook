<a id="s-AuthorizationCallback"></a>
# AuthorizationCallback

```java
@java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy.RUNTIME)
@java.lang.annotation.Target({java.lang.annotation.ElementType.METHOD})
public @interface com.tailf.dp.annotations.AuthorizationCallback
```

Annotation class for Authorization Callbacks Attribute are callType

## Members

**Methods**:

- [callType()](#s-callType)

## Methods

<a id="s-callType"></a>
### callType()

```java
public abstract com.tailf.dp.proto.AuthorizationCBType[] callType()
```

Types: [AuthorizationCBType](../proto/AuthorizationCBType.md#s-AuthorizationCBType)

Specifies the types of authorization callbacks this method should handle.

**Returns:** an array of [`AuthorizationCBType`](../proto/AuthorizationCBType.md#s-AuthorizationCBType) values indicating the
         authorization callback types that this method should handle
