<a id="cls-Child"></a>
# Child

```java
public class com.tailf.ncs.maapi.MmapSchema.Child
```

Child entry, stored in a continuous area of memory after a level record.
 Used to lookup a given child from a level.

 Entries are sorted in ns, tag order.

## Members

**Constructors**:

- [Child()](#m-child-7aab3b03a8c5)
- [Child(Source, int, int)](#m-child-ad55798fd08a)

**Methods**:

- [getIdx()](#m-getidx-97576e8cb221)
- [getLevelOff()](#m-getleveloff-56218c3aecdf)
- [getNs()](#m-getns-59b97eae2a4a)
- [getOff()](#m-getoff-578b9943fd00)
- [getTag()](#m-gettag-315f45956d6f)
- [read(Source, int)](#m-read-c048381a08bd)

## Constructors

<a id="m-child-7aab3b03a8c5"></a>
### Child()

**Package-private**

```java
Child()
```

<a id="m-child-ad55798fd08a"></a>
### Child(Source, int, int)

**Package-private**

```java
Child(com.tailf.ncs.maapi.MmapSchema.Source src, int pos, int idx)
```

Types: [Source](Source.md#cls-Source)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos`
- `int idx`


## Methods

<a id="m-getidx-97576e8cb221"></a>
### getIdx()

```java
public int getIdx()
```

<a id="m-getleveloff-56218c3aecdf"></a>
### getLevelOff()

```java
public int getLevelOff()
```

<a id="m-getns-59b97eae2a4a"></a>
### getNs()

```java
public int getNs()
```

<a id="m-getoff-578b9943fd00"></a>
### getOff()

```java
public int getOff()
```

<a id="m-gettag-315f45956d6f"></a>
### getTag()

```java
public int getTag()
```

<a id="m-read-c048381a08bd"></a>
### read(Source, int)

**Package-private**

```java
final void read(com.tailf.ncs.maapi.MmapSchema.Source src, int pos)
```

Types: [Source](Source.md#cls-Source)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos`
