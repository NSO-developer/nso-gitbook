<a id="cls-Closer"></a>
# Closer

```java
public static final class com.tailf.conf.ConfCleaner.Closer
    implements Runnable, AutoCloseable
```

## Members

**Constructors**:

- [Closer(AutoCloseable[])](#m-closer-dee93e523677)

**Methods**:

- [add(AutoCloseable[])](#m-add-c180b7888b01)
- [close()](#m-close-8107c6dc012b)
- [remove(AutoCloseable)](#m-remove-a78d7d35b531)
- [run()](#m-run-b6dbda048863)

## Constructors

<a id="m-closer-dee93e523677"></a>
### Closer(AutoCloseable[])

```java
public Closer(AutoCloseable[] closeables)
```

**Parameters**

- `AutoCloseable[] closeables`


## Methods

<a id="m-add-c180b7888b01"></a>
### add(AutoCloseable[])

```java
public com.tailf.conf.ConfCleaner.Closer add(AutoCloseable[] closeables)
```

Types: [Closer](Closer.md#cls-Closer)

**Parameters**

- `AutoCloseable[] closeables`

<a id="m-close-8107c6dc012b"></a>
### close()

```java
public void close()
```

<a id="m-remove-a78d7d35b531"></a>
### remove(AutoCloseable)

```java
public com.tailf.conf.ConfCleaner.Closer remove(AutoCloseable closeable)
```

Types: [Closer](Closer.md#cls-Closer)

**Parameters**

- `AutoCloseable closeable`

<a id="m-run-b6dbda048863"></a>
### run()

```java
public void run()
```
