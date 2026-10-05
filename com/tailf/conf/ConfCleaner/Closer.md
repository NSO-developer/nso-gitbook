# Closer <a href="#closer-4586af715fa1" id="closer-4586af715fa1"></a>

```java
public static final class com.tailf.conf.ConfCleaner.Closer
    implements Runnable, AutoCloseable
```

## Members

**Constructors**:

- [Closer(AutoCloseable[])](#closer-dee93e523677)

**Methods**:

- [add(AutoCloseable[])](#add-c180b7888b01)
- [close()](#close-8107c6dc012b)
- [remove(AutoCloseable)](#remove-a78d7d35b531)
- [run()](#run-b6dbda048863)

## Constructors

### Closer(AutoCloseable[]) <a href="#closer-dee93e523677" id="closer-dee93e523677"></a>

```java
public Closer(AutoCloseable[] closeables)
```

**Parameters**

- `AutoCloseable[] closeables`


## Methods

### add(AutoCloseable[]) <a href="#add-c180b7888b01" id="add-c180b7888b01"></a>

```java
public com.tailf.conf.ConfCleaner.Closer add(AutoCloseable[] closeables)
```

Types: [Closer](Closer.md#closer-4586af715fa1)

**Parameters**

- `AutoCloseable[] closeables`

### close() <a href="#close-8107c6dc012b" id="close-8107c6dc012b"></a>

```java
public void close()
```

### remove(AutoCloseable) <a href="#remove-a78d7d35b531" id="remove-a78d7d35b531"></a>

```java
public com.tailf.conf.ConfCleaner.Closer remove(AutoCloseable closeable)
```

Types: [Closer](Closer.md#closer-4586af715fa1)

**Parameters**

- `AutoCloseable closeable`

### run() <a href="#run-b6dbda048863" id="run-b6dbda048863"></a>

```java
public void run()
```
