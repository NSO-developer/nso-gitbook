<a id="s-Child"></a>
# Child

```java
public class com.tailf.ncs.maapi.MmapSchema.Child
```

Child entry, stored in a continuous area of memory after a level record.
 Used to lookup a given child from a level.

 Entries are sorted in ns, tag order.

## Members

**Constructors**:

- [Child()](#s-Child-1)
- [Child(Source, int, int)](#s-Child-2)

**Methods**:

- [getIdx()](#s-getIdx)
- [getLevelOff()](#s-getLevelOff)
- [getNs()](#s-getNs)
- [getOff()](#s-getOff)
- [getTag()](#s-getTag)
- [read(Source, int)](#s-read)

## Constructors

<a id="s-Child-1"></a>
### Child()

**Package-private**

```java
Child()
```

<a id="s-Child-2"></a>
### Child(Source, int, int)

**Package-private**

```java
Child(com.tailf.ncs.maapi.MmapSchema.Source src, int pos, int idx)
```

Types: [Source](Source.md#s-Source)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos`
- `int idx`


## Methods

<a id="s-getIdx"></a>
### getIdx()

```java
public int getIdx()
```

<a id="s-getLevelOff"></a>
### getLevelOff()

```java
public int getLevelOff()
```

<a id="s-getNs"></a>
### getNs()

```java
public int getNs()
```

<a id="s-getOff"></a>
### getOff()

```java
public int getOff()
```

<a id="s-getTag"></a>
### getTag()

```java
public int getTag()
```

<a id="s-read"></a>
### read(Source, int)

**Package-private**

```java
final void read(com.tailf.ncs.maapi.MmapSchema.Source src, int pos)
```

Types: [Source](Source.md#s-Source)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos`
