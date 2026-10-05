<a id="s-ConfCleaner"></a>
# ConfCleaner

```java
public final class com.tailf.conf.ConfCleaner
```

ConfCleaner manages a set of object references and corresponding
 cleaning actions.

## Members

**Fields**:

- [CLEANER](#s-CLEANER)

**Methods**:

- [register(Object, AutoCloseable, AutoCloseable[])](#s-register)
- [register(Object, Runnable)](#s-register-1)

**Nested Types**:

- [Closer](ConfCleaner/Closer.md#s-Closer)

## Fields

<a id="s-CLEANER"></a>
### CLEANER

```java
public static final java.lang.ref.Cleaner CLEANER = null;
```


## Methods

<a id="s-register"></a>
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

<a id="s-register-1"></a>
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

- [Closer](ConfCleaner/Closer.md)
