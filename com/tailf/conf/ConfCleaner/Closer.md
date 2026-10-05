# Closer <a href="#cls-Closer" id="cls-Closer"></a>

```java
public static final class com.tailf.conf.ConfCleaner.Closer
    implements Runnable, AutoCloseable
```

## Members

**Constructors**:

- [Closer(AutoCloseable[])](#m-Closer-dee93e523677)

**Methods**:

- [add(AutoCloseable[])](#m-add-c180b7888b01)
- [close()](#m-close-8107c6dc012b)
- [remove(AutoCloseable)](#m-remove-a78d7d35b531)
- [run()](#m-run-b6dbda048863)

## Constructors

### Closer(AutoCloseable[]) <a href="#m-Closer-dee93e523677" id="m-Closer-dee93e523677"></a>

```java
public Closer(AutoCloseable[] closeables)
```

**Parameters**

- `AutoCloseable[] closeables`


## Methods

### add(AutoCloseable[]) <a href="#m-add-c180b7888b01" id="m-add-c180b7888b01"></a>

```java
public com.tailf.conf.ConfCleaner.Closer add(AutoCloseable[] closeables)
```

Types: [Closer](Closer.md#cls-Closer)

**Parameters**

- `AutoCloseable[] closeables`

### close() <a href="#m-close-8107c6dc012b" id="m-close-8107c6dc012b"></a>

```java
public void close()
```

### remove(AutoCloseable) <a href="#m-remove-a78d7d35b531" id="m-remove-a78d7d35b531"></a>

```java
public com.tailf.conf.ConfCleaner.Closer remove(AutoCloseable closeable)
```

Types: [Closer](Closer.md#cls-Closer)

**Parameters**

- `AutoCloseable closeable`

### run() <a href="#m-run-b6dbda048863" id="m-run-b6dbda048863"></a>

```java
public void run()
```
