# NcsCtrlException <a href="#cls-NcsCtrlException" id="cls-NcsCtrlException"></a>

```java
public class com.tailf.ncs.ctrl.NcsCtrlException
    extends com.tailf.ncs.NcsException
```

Types: [NcsException](../NcsException.md#cls-NcsException)

Ncs exception capable of storing multiple exception causes.

## Members

**Constructors**:

- [NcsCtrlException(String)](#m-NcsCtrlException-221a6565f48e)

**Methods**:

- [addCause(Throwable)](#m-addCause-351e6181965d)
- [getCauseList()](#m-getCauseList-b2e766c8dc20)
- [getErrorCode()](../../conf/ConfException.md#m-getErrorCode-812152fc083a) from ConfException
- [getMessage()](#m-getMessage-77b7dae8469e)
- [getOpaque()](../../conf/ConfException.md#m-getOpaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](../../conf/ConfException.md#m-mk-de1cedfc6ea8) from ConfException
- [mk(ConfResponse, ConfPath)](../../conf/ConfException.md#m-mk-79e69ffbc022) from ConfException

## Constructors

### NcsCtrlException(String) <a href="#m-NcsCtrlException-221a6565f48e" id="m-NcsCtrlException-221a6565f48e"></a>

```java
public NcsCtrlException(String msg)
```

**Parameters**

- `String msg`


## Methods

### addCause(Throwable) <a href="#m-addCause-351e6181965d" id="m-addCause-351e6181965d"></a>

```java
public void addCause(Throwable e)
```

**Parameters**

- `Throwable e`

### getCauseList() <a href="#m-getCauseList-b2e766c8dc20" id="m-getCauseList-b2e766c8dc20"></a>

```java
public java.util.List<Throwable> getCauseList()
```

### getMessage() <a href="#m-getMessage-77b7dae8469e" id="m-getMessage-77b7dae8469e"></a>

```java
public String getMessage()
```
