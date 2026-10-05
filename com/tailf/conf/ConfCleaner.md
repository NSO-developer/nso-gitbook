# ConfCleaner <a href="#confcleaner-57a771480d75" id="confcleaner-57a771480d75"></a>

```java
public final class com.tailf.conf.ConfCleaner
```

ConfCleaner manages a set of object references and corresponding
 cleaning actions.

## Members

**Fields**:

- [CLEANER](#cleaner-c7d3b501b7a6)

**Methods**:

- [register(Object, AutoCloseable, AutoCloseable[])](#register-15a1a2f775a2)
- [register(Object, Runnable)](#register-2ca26b8e3d14)

**Nested Types**:

- [Closer](ConfCleaner/Closer.md#closer-4586af715fa1)

## Fields

### CLEANER <a href="#cleaner-c7d3b501b7a6" id="cleaner-c7d3b501b7a6"></a>

```java
public static final java.lang.ref.Cleaner CLEANER = null;
```


## Methods

### register(Object, AutoCloseable, AutoCloseable[]) <a href="#register-15a1a2f775a2" id="register-15a1a2f775a2"></a>

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

### register(Object, Runnable) <a href="#register-2ca26b8e3d14" id="register-2ca26b8e3d14"></a>

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

- [Closer](ConfCleaner/Closer.md#closer-4586af715fa1)
