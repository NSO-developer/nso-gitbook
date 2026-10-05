<a id="s-DpDbContext"></a>
# DpDbContext

```java
public class com.tailf.dp.DpDbContext
```

Database context. Given as argument to many of the DpDbCallback methods.

## Members

**Constructors**:

- [DpDbContext(int, int, int, DpUserInfo)](#s-DpDbContext-1)

**Methods**:

- [getDId()](#s-getDId)
- [getLastOp()](#s-getLastOp)
- [getQRef()](#s-getQRef)
- [getUserInfo()](#s-getUserInfo)

## Constructors

<a id="s-DpDbContext-1"></a>
### DpDbContext(int, int, int, DpUserInfo)

```java
public DpDbContext(int qref, int did, int op, com.tailf.dp.DpUserInfo uinfo)
```

Types: [DpUserInfo](DpUserInfo.md#s-DpUserInfo)

**Parameters**

- `int qref`
- `int did`
- `int op`
- `com.tailf.dp.DpUserInfo uinfo`


## Methods

<a id="s-getDId"></a>
### getDId()

```java
public int getDId()
```

<a id="s-getLastOp"></a>
### getLastOp()

```java
public int getLastOp()
```

<a id="s-getQRef"></a>
### getQRef()

```java
public int getQRef()
```

<a id="s-getUserInfo"></a>
### getUserInfo()

```java
public com.tailf.dp.DpUserInfo getUserInfo()
```

Types: [DpUserInfo](DpUserInfo.md#s-DpUserInfo)
