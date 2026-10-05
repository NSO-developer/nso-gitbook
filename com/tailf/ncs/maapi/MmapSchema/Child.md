# Child <a href="#child-3362e9a5c263" id="child-3362e9a5c263"></a>

```java
public class com.tailf.ncs.maapi.MmapSchema.Child
```

Child entry, stored in a continuous area of memory after a level record.
 Used to lookup a given child from a level.

 Entries are sorted in ns, tag order.

## Members

**Constructors**:

- [Child\(\)](#child-7aab3b03a8c5)
- [Child\(Source, int, int\)](#child-ad55798fd08a)

**Methods**:

- [getIdx\(\)](#getidx-97576e8cb221)
- [getLevelOff\(\)](#getleveloff-56218c3aecdf)
- [getNs\(\)](#getns-59b97eae2a4a)
- [getOff\(\)](#getoff-578b9943fd00)
- [getTag\(\)](#gettag-315f45956d6f)
- [read\(Source, int\)](#read-c048381a08bd)

## Constructors

### Child() <a href="#child-7aab3b03a8c5" id="child-7aab3b03a8c5"></a>

**Package-private**

```java
Child()
```

### Child(Source, int, int) <a href="#child-ad55798fd08a" id="child-ad55798fd08a"></a>

**Package-private**

```java
Child(com.tailf.ncs.maapi.MmapSchema.Source src, int pos, int idx)
```

Types: [Source](Source.md#source-12fbee2b6a88)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos`
- `int idx`


## Methods

### getIdx() <a href="#getidx-97576e8cb221" id="getidx-97576e8cb221"></a>

```java
public int getIdx()
```

### getLevelOff() <a href="#getleveloff-56218c3aecdf" id="getleveloff-56218c3aecdf"></a>

```java
public int getLevelOff()
```

### getNs() <a href="#getns-59b97eae2a4a" id="getns-59b97eae2a4a"></a>

```java
public int getNs()
```

### getOff() <a href="#getoff-578b9943fd00" id="getoff-578b9943fd00"></a>

```java
public int getOff()
```

### getTag() <a href="#gettag-315f45956d6f" id="gettag-315f45956d6f"></a>

```java
public int getTag()
```

### read(Source, int) <a href="#read-c048381a08bd" id="read-c048381a08bd"></a>

**Package-private**

```java
final void read(com.tailf.ncs.maapi.MmapSchema.Source src, int pos)
```

Types: [Source](Source.md#source-12fbee2b6a88)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos`
