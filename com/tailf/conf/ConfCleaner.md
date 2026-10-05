# ConfCleaner <a href="#cls-ConfCleaner" id="cls-ConfCleaner"></a>

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

### CLEANER <a href="#m-CLEANER" id="m-CLEANER"></a>

```java
public static final java.lang.ref.Cleaner CLEANER = null;
```


## Methods

### register(Object, AutoCloseable, AutoCloseable[]) <a href="#m-register-15a1a2f775a2" id="m-register-15a1a2f775a2"></a>

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

### register(Object, Runnable) <a href="#m-register-2ca26b8e3d14" id="m-register-2ca26b8e3d14"></a>

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
