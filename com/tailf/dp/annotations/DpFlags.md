<a id="s-DpFlags"></a>
# DpFlags

```java
@java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy.RUNTIME)
@java.lang.annotation.Target({java.lang.annotation.ElementType.TYPE})
public @interface com.tailf.dp.annotations.DpFlags
```

Annotation class that allows to specify data provider flags to tweak
 the behaviour of the data provider.

 This annotation should be used on the class providing annotated callbacks.

**Since:** 6.5.0

## Members

**Methods**:

- [noDefaults()](#s-noDefaults)

## Methods

<a id="s-noDefaults"></a>
### noDefaults()

```java
public abstract boolean noDefaults()
```

This parameter is used to turn off SET_ELEM and SET_CASE callbacks
 when a leaf or choice gets its default value due to being unset.
