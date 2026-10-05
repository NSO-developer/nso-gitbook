# CdbPhase <a href="#cls-CdbPhase" id="cls-CdbPhase"></a>

```java
public class com.tailf.cdb.CdbPhase
```

Represents the start-phase CDB is currently in.


 If CDB is in phase 0 and has initiated an
 init transaction (to load any init files) the static
 flag `CdbPhase.FLAG_INIT` is set in the
 flags field and correspondingly if an upgrade session is started the
 `CdbPhase.FLAG_UPGRADE` is set.

## Members

**Constructors**:

- [CdbPhase(int, int)](#m-CdbPhase-5f54e2f87484)

**Fields**:

- [FLAG_INIT](#m-FLAG_INIT)
- [FLAG_UPGRADE](#m-FLAG_UPGRADE)

**Methods**:

- [getCurrentPhase()](#m-getCurrentPhase-32ff5b066755)
- [getFlag()](#m-getFlag-9cd662045dd4)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### CdbPhase(int, int) <a href="#m-CdbPhase-5f54e2f87484" id="m-CdbPhase-5f54e2f87484"></a>

**Package-private**

```java
CdbPhase(int phase, int flag)
```

**Parameters**

- `int phase`
- `int flag`


## Fields

### FLAG_INIT <a href="#m-FLAG_INIT" id="m-FLAG_INIT"></a>

```java
public static final int FLAG_INIT = 1;
```

CDB has an init transaction , when phase 0

### FLAG_UPGRADE <a href="#m-FLAG_UPGRADE" id="m-FLAG_UPGRADE"></a>

```java
public static final int FLAG_UPGRADE = 2;
```

CDB has an upgrade transaction , when phase 0


## Methods

### getCurrentPhase() <a href="#m-getCurrentPhase-32ff5b066755" id="m-getCurrentPhase-32ff5b066755"></a>

```java
public int getCurrentPhase()
```

The phase CDB is currently in.

### getFlag() <a href="#m-getFlag-9cd662045dd4" id="m-getFlag-9cd662045dd4"></a>

```java
public int getFlag()
```

The flag is set if CDB is in phase 0 to any of the values:


- [`FLAG_INIT`](CdbPhase.md#m-FLAG_INIT)
   - [`FLAG_UPGRADE`](CdbPhase.md#m-FLAG_UPGRADE)

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
