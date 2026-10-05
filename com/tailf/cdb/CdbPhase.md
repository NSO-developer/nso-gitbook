<a id="cls-CdbPhase"></a>
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

- [CdbPhase(int, int)](#m-cdbphase-5f54e2f87484)

**Fields**:

- [FLAG_INIT](#m-FLAG_INIT)
- [FLAG_UPGRADE](#m-FLAG_UPGRADE)

**Methods**:

- [getCurrentPhase()](#m-getcurrentphase-32ff5b066755)
- [getFlag()](#m-getflag-9cd662045dd4)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-cdbphase-5f54e2f87484"></a>
### CdbPhase(int, int)

**Package-private**

```java
CdbPhase(int phase, int flag)
```

**Parameters**

- `int phase`
- `int flag`


## Fields

<a id="m-FLAG_INIT"></a>
### FLAG_INIT

```java
public static final int FLAG_INIT = 1;
```

CDB has an init transaction , when phase 0

<a id="m-FLAG_UPGRADE"></a>
### FLAG_UPGRADE

```java
public static final int FLAG_UPGRADE = 2;
```

CDB has an upgrade transaction , when phase 0


## Methods

<a id="m-getcurrentphase-32ff5b066755"></a>
### getCurrentPhase()

```java
public int getCurrentPhase()
```

The phase CDB is currently in.

<a id="m-getflag-9cd662045dd4"></a>
### getFlag()

```java
public int getFlag()
```

The flag is set if CDB is in phase 0 to any of the values:


- `#FLAG_INIT`
   - `#FLAG_UPGRADE`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
