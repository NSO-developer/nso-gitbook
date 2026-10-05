<a id="s-Closer"></a>
# Closer

```java
public static final class com.tailf.conf.ConfCleaner.Closer
    implements Runnable, AutoCloseable
```

## Members

**Constructors**:

- [Closer(AutoCloseable[])](#s-Closer-1)

**Methods**:

- [add(AutoCloseable[])](#s-add)
- [close()](#s-close)
- [remove(AutoCloseable)](#s-remove)
- [run()](#s-run)

## Constructors

<a id="s-Closer-1"></a>
### Closer(AutoCloseable[])

```java
public Closer(AutoCloseable[] closeables)
```

**Parameters**

- `AutoCloseable[] closeables`


## Methods

<a id="s-add"></a>
### add(AutoCloseable[])

```java
public com.tailf.conf.ConfCleaner.Closer add(AutoCloseable[] closeables)
```

Types: [Closer](Closer.md#s-Closer)

**Parameters**

- `AutoCloseable[] closeables`

<a id="s-close"></a>
### close()

```java
public void close()
```

<a id="s-remove"></a>
### remove(AutoCloseable)

```java
public com.tailf.conf.ConfCleaner.Closer remove(AutoCloseable closeable)
```

Types: [Closer](Closer.md#s-Closer)

**Parameters**

- `AutoCloseable closeable`

<a id="s-run"></a>
### run()

```java
public void run()
```
