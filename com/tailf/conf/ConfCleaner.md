<a id="cls-ConfCleaner"></a>
# ConfCleaner

```java
public final class com.tailf.conf.ConfCleaner
```

ConfCleaner manages a set of object references and corresponding
 cleaning actions.

## Members

**Fields**:

- [CLEANER](#m-CLEANER)

**Methods**:

- [register(Object, AutoCloseable, AutoCloseable[])](#m-register-15a1a2f775a2)
- [register(Object, Runnable)](#m-register-2ca26b8e3d14)

**Nested Types**:

- [Closer](ConfCleaner/Closer.md#cls-Closer)

## Fields

<a id="m-CLEANER"></a>
### CLEANER

```java
public static final java.lang.ref.Cleaner CLEANER = null;
```


## Methods

<a id="m-register-15a1a2f775a2"></a>
### register(Object, AutoCloseable, AutoCloseable[])

```java
public static java.lang.ref.Cleaner.Cleanable register(
    Object obj,
    AutoCloseable closeable,
    AutoCloseable[] closeables
)
```

Registers an auto closeable object that will be closed when
 the object becomes phantom reachable.

**Parameters**

- `Object obj` - the object to monitor
- `AutoCloseable closeable`
- `AutoCloseable[] closeables`

**Returns:** a Cleanable instance

<a id="m-register-2ca26b8e3d14"></a>
### register(Object, Runnable)

```java
public static java.lang.ref.Cleaner.Cleanable register(Object obj, Runnable action)
```

Registers an object and a cleaning action to run when the
 object becomes phantom reachable.

**Parameters**

- `Object obj` - the object to monitor
- `Runnable action`

**Returns:** a Cleanable instance


## Nested Types

- [Closer](ConfCleaner/Closer.md#cls-Closer)
