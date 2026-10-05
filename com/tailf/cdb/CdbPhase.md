<a id="s-CdbPhase"></a>
# CdbPhase

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

- [CdbPhase(int, int)](#s-CdbPhase-1)

**Fields**:

- [FLAG_INIT](#s-FLAG_INIT)
- [FLAG_UPGRADE](#s-FLAG_UPGRADE)

**Methods**:

- [getCurrentPhase()](#s-getCurrentPhase)
- [getFlag()](#s-getFlag)
- [toString()](#s-toString)

## Constructors

<a id="s-CdbPhase-1"></a>
### CdbPhase(int, int)

**Package-private**

```java
CdbPhase(int phase, int flag)
```

**Parameters**

- `int phase`
- `int flag`


## Fields

<a id="s-FLAG_INIT"></a>
### FLAG_INIT

```java
public static final int FLAG_INIT = 1;
```

CDB has an init transaction , when phase 0

<a id="s-FLAG_UPGRADE"></a>
### FLAG_UPGRADE

```java
public static final int FLAG_UPGRADE = 2;
```

CDB has an upgrade transaction , when phase 0


## Methods

<a id="s-getCurrentPhase"></a>
### getCurrentPhase()

```java
public int getCurrentPhase()
```

The phase CDB is currently in.

<a id="s-getFlag"></a>
### getFlag()

```java
public int getFlag()
```

The flag is set if CDB is in phase 0 to any of the values:


- `#FLAG_INIT`
   - `#FLAG_UPGRADE`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
