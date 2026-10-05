# NcsCtrlException <a href="#ncsctrlexception-5ca72987a4d7" id="ncsctrlexception-5ca72987a4d7"></a>

```java
public class com.tailf.ncs.ctrl.NcsCtrlException
    extends com.tailf.ncs.NcsException
```

Types: [NcsException](../NcsException.md#ncsexception-d2b40ca98ea5)

Ncs exception capable of storing multiple exception causes.

## Members

**Constructors**:

- [NcsCtrlException\(String\)](#ncsctrlexception-221a6565f48e)

**Methods**:

- [addCause\(Throwable\)](#addcause-351e6181965d)
- [getCauseList\(\)](#getcauselist-b2e766c8dc20)
- [getErrorCode\(\)](../../conf/ConfException.md#geterrorcode-812152fc083a) from ConfException
- [getMessage\(\)](#getmessage-77b7dae8469e)
- [getOpaque\(\)](../../conf/ConfException.md#getopaque-92e4945ec92d) from ConfException
- [mk\(ConfResponse\)](../../conf/ConfException.md#mk-de1cedfc6ea8) from ConfException
- [mk\(ConfResponse, ConfPath\)](../../conf/ConfException.md#mk-79e69ffbc022) from ConfException

## Constructors

### NcsCtrlException(String) <a href="#ncsctrlexception-221a6565f48e" id="ncsctrlexception-221a6565f48e"></a>

```java
public NcsCtrlException(String msg)
```

**Parameters**

- `String msg`


## Methods

### addCause(Throwable) <a href="#addcause-351e6181965d" id="addcause-351e6181965d"></a>

```java
public void addCause(Throwable e)
```

**Parameters**

- `Throwable e`

### getCauseList() <a href="#getcauselist-b2e766c8dc20" id="getcauselist-b2e766c8dc20"></a>

```java
public java.util.List<Throwable> getCauseList()
```

### getMessage() <a href="#getmessage-77b7dae8469e" id="getmessage-77b7dae8469e"></a>

```java
public String getMessage()
```
