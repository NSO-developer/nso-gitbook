# CdbPhase <a href="#cdbphase-a1a97094371f" id="cdbphase-a1a97094371f"></a>

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

- [CdbPhase\(int, int\)](#cdbphase-5f54e2f87484)

**Fields**:

- [FLAG\_INIT](#flag_init-fb43c5f6fc84)
- [FLAG\_UPGRADE](#flag_upgrade-4218f2511062)

**Methods**:

- [getCurrentPhase\(\)](#getcurrentphase-32ff5b066755)
- [getFlag\(\)](#getflag-9cd662045dd4)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### CdbPhase(int, int) <a href="#cdbphase-5f54e2f87484" id="cdbphase-5f54e2f87484"></a>

**Package-private**

```java
CdbPhase(int phase, int flag)
```

**Parameters**

- `int phase`
- `int flag`


## Fields

### FLAG_INIT <a href="#flag_init-fb43c5f6fc84" id="flag_init-fb43c5f6fc84"></a>

```java
public static final int FLAG_INIT = 1;
```

CDB has an init transaction , when phase 0

### FLAG_UPGRADE <a href="#flag_upgrade-4218f2511062" id="flag_upgrade-4218f2511062"></a>

```java
public static final int FLAG_UPGRADE = 2;
```

CDB has an upgrade transaction , when phase 0


## Methods

### getCurrentPhase() <a href="#getcurrentphase-32ff5b066755" id="getcurrentphase-32ff5b066755"></a>

```java
public int getCurrentPhase()
```

The phase CDB is currently in.

### getFlag() <a href="#getflag-9cd662045dd4" id="getflag-9cd662045dd4"></a>

```java
public int getFlag()
```

The flag is set if CDB is in phase 0 to any of the values:


- [`FLAG_INIT`](CdbPhase.md#flag_init-fb43c5f6fc84)
   - [`FLAG_UPGRADE`](CdbPhase.md#flag_upgrade-4218f2511062)

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
