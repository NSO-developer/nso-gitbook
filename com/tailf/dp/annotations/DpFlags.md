# DpFlags <a href="#cls-DpFlags" id="cls-DpFlags"></a>

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

- [noDefaults()](#m-noDefaults-fa4b3f614c22)

## Methods

### noDefaults() <a href="#m-noDefaults-fa4b3f614c22" id="m-noDefaults-fa4b3f614c22"></a>

```java
public abstract boolean noDefaults()
```

This parameter is used to turn off SET_ELEM and SET_CASE callbacks
 when a leaf or choice gets its default value due to being unset.
