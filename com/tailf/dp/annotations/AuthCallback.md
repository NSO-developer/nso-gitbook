<a id="cls-AuthCallback"></a>
# AuthCallback

```java
@java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy.RUNTIME)
@java.lang.annotation.Target({java.lang.annotation.ElementType.METHOD})
public @interface com.tailf.dp.annotations.AuthCallback
```

Annotation class for Auth Callbacks Attribute are callType

## Members

**Methods**:

- [callType()](#m-calltype-0d0f9b61a036)

## Methods

<a id="m-calltype-0d0f9b61a036"></a>
### callType()

```java
public abstract com.tailf.dp.proto.AuthCBType[] callType()
```

Types: [AuthCBType](../proto/AuthCBType.md#cls-AuthCBType)

Specifies the types of authentication callbacks this method should
 handle.

 This attribute defines when the annotated method should be invoked by
 the authentication framework. Multiple callback types can be specified
 if the same method should handle different types of authentication
 events.

**Returns:** an array of [`AuthCBType`](../proto/AuthCBType.md#cls-AuthCBType) values indicating the
         authentication callback types that this method should handle
