# Child <a href="#cls-Child" id="cls-Child"></a>

```java
public class com.tailf.ncs.maapi.MmapSchema.Child
```

Child entry, stored in a continuous area of memory after a level record.
 Used to lookup a given child from a level.

 Entries are sorted in ns, tag order.

## Members

**Constructors**:

- [Child()](#m-Child-7aab3b03a8c5)
- [Child(Source, int, int)](#m-Child-ad55798fd08a)

**Methods**:

- [getIdx()](#m-getIdx-97576e8cb221)
- [getLevelOff()](#m-getLevelOff-56218c3aecdf)
- [getNs()](#m-getNs-59b97eae2a4a)
- [getOff()](#m-getOff-578b9943fd00)
- [getTag()](#m-getTag-315f45956d6f)
- [read(Source, int)](#m-read-c048381a08bd)

## Constructors

### Child() <a href="#m-Child-7aab3b03a8c5" id="m-Child-7aab3b03a8c5"></a>

**Package-private**

```java
Child()
```

### Child(Source, int, int) <a href="#m-Child-ad55798fd08a" id="m-Child-ad55798fd08a"></a>

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

### getIdx() <a href="#m-getIdx-97576e8cb221" id="m-getIdx-97576e8cb221"></a>

```java
public int getIdx()
```

### getLevelOff() <a href="#m-getLevelOff-56218c3aecdf" id="m-getLevelOff-56218c3aecdf"></a>

```java
public int getLevelOff()
```

### getNs() <a href="#m-getNs-59b97eae2a4a" id="m-getNs-59b97eae2a4a"></a>

```java
public int getNs()
```

### getOff() <a href="#m-getOff-578b9943fd00" id="m-getOff-578b9943fd00"></a>

```java
public int getOff()
```

### getTag() <a href="#m-getTag-315f45956d6f" id="m-getTag-315f45956d6f"></a>

```java
public int getTag()
```

### read(Source, int) <a href="#m-read-c048381a08bd" id="m-read-c048381a08bd"></a>

**Package-private**

```java
final void read(com.tailf.ncs.maapi.MmapSchema.Source src, int pos)
```

Types: [Source](Source.md#cls-Source)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos`
