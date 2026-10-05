# DpDbContext <a href="#cls-DpDbContext" id="cls-DpDbContext"></a>

```java
public class com.tailf.dp.DpDbContext
```

Database context. Given as argument to many of the DpDbCallback methods.

## Members

**Constructors**:

- [DpDbContext(int, int, int, DpUserInfo)](#m-DpDbContext-36dd5cf5f227)

**Methods**:

- [getDId()](#m-getDId-0727cf9e0fd9)
- [getLastOp()](#m-getLastOp-8d68ee764339)
- [getQRef()](#m-getQRef-ee1c8f107982)
- [getUserInfo()](#m-getUserInfo-3ecef1f24d3d)

## Constructors

### DpDbContext(int, int, int, DpUserInfo) <a href="#m-DpDbContext-36dd5cf5f227" id="m-DpDbContext-36dd5cf5f227"></a>

```java
public DpDbContext(int qref, int did, int op, com.tailf.dp.DpUserInfo uinfo)
```

Types: [DpUserInfo](DpUserInfo.md#cls-DpUserInfo)

**Parameters**

- `int qref`
- `int did`
- `int op`
- `com.tailf.dp.DpUserInfo uinfo`


## Methods

### getDId() <a href="#m-getDId-0727cf9e0fd9" id="m-getDId-0727cf9e0fd9"></a>

```java
public int getDId()
```

### getLastOp() <a href="#m-getLastOp-8d68ee764339" id="m-getLastOp-8d68ee764339"></a>

```java
public int getLastOp()
```

### getQRef() <a href="#m-getQRef-ee1c8f107982" id="m-getQRef-ee1c8f107982"></a>

```java
public int getQRef()
```

### getUserInfo() <a href="#m-getUserInfo-3ecef1f24d3d" id="m-getUserInfo-3ecef1f24d3d"></a>

```java
public com.tailf.dp.DpUserInfo getUserInfo()
```

Types: [DpUserInfo](DpUserInfo.md#cls-DpUserInfo)
