# PlanComponent <a href="#cls-PlanComponent" id="cls-PlanComponent"></a>

```java
public class com.tailf.ncs.PlanComponent
```

This class represents a plan component with its states.

 The usage of this class in in conjunction with a service that
 uses a reactive fastmap pattern.
 With a plan the service states can be tracked and controlled.

 A service plan can consist of one or many PlanComponents.
 This is operational data that is stored together with the service config.

## Members

**Constructors**:

- [PlanComponent(NavuNode, String, String)](#m-PlanComponent-1b9624e9dad9)
- [PlanComponent(NavuNode, String, String, ConfObjectRef)](#m-PlanComponent-5e61ba53deeb)

**Methods**:

- [appendState(String)](#m-appendState-45d10d72ab14)
- [appendState(String, String, String)](#m-appendState-5142e7e1bad6)
- [appendState(String, String, String, String, String)](#m-appendState-efbc51e6cfd9)
- [backTrack()](#m-backTrack-d3f8df17d7ce)
- [backTrack(boolean)](#m-backTrack-9f47a005ed3f)
- [setFailed(String)](#m-setFailed-c699ca5438a6)
- [setNotReached(String)](#m-setNotReached-9b7c14c0c58a)
- [setReached(String)](#m-setReached-d2df729907ae)

## Constructors

### PlanComponent(NavuNode, String, String) <a href="#m-PlanComponent-1b9624e9dad9" id="m-PlanComponent-1b9624e9dad9"></a>

```java
public PlanComponent(
    com.tailf.navu.NavuNode service,
    String name,
    String componentType
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](../navu/NavuNode.md#cls-NavuNode), [NavuException](../navu/NavuException.md#cls-NavuException)

Creation of a plan component.
 It uses a NavuNode pointing to the service. This is normally the same
 NavuNode as supplied as an argument to the service create() method.

**Parameters**

- `com.tailf.navu.NavuNode service`
- `String name`
- `String componentType`

**Throws**

- `NavuException`

### PlanComponent(NavuNode, String, String, ConfObjectRef) <a href="#m-PlanComponent-5e61ba53deeb" id="m-PlanComponent-5e61ba53deeb"></a>

```java
public PlanComponent(
    com.tailf.navu.NavuNode service,
    String name,
    String componentType,
    com.tailf.conf.ConfObjectRef serviceReference
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](../navu/NavuNode.md#cls-NavuNode), [ConfObjectRef](../conf/ConfObjectRef.md#cls-ConfObjectRef), [NavuException](../navu/NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode service`
- `String name`
- `String componentType`
- `com.tailf.conf.ConfObjectRef serviceReference`


## Methods

### appendState(String) <a href="#m-appendState-45d10d72ab14" id="m-appendState-45d10d72ab14"></a>

```java
public com.tailf.ncs.PlanComponent appendState(String stateName) throws com.tailf.navu.NavuException
```

Types: [PlanComponent](PlanComponent.md#cls-PlanComponent), [NavuException](../navu/NavuException.md#cls-NavuException)

This method supplies a state to the specific component.
 The initial status for this state can be ncs:reached or ncs:not-reached
 and is indicated by setting the reached boolean to true or false
 respectively

**Parameters**

- `String stateName`

**Returns:** PlanComponent

**Throws**

- `NavuException`

### appendState(String, String, String) <a href="#m-appendState-5142e7e1bad6" id="m-appendState-5142e7e1bad6"></a>

```java
public com.tailf.ncs.PlanComponent appendState(
    String stateName,
    String createMonitor,
    String createTriggerExpr
)
    throws com.tailf.navu.NavuException
```

Types: [PlanComponent](PlanComponent.md#cls-PlanComponent), [NavuException](../navu/NavuException.md#cls-NavuException)

**Parameters**

- `String stateName`
- `String createMonitor`
- `String createTriggerExpr`

### appendState(String, String, String, String, String) <a href="#m-appendState-efbc51e6cfd9" id="m-appendState-efbc51e6cfd9"></a>

```java
public com.tailf.ncs.PlanComponent appendState(
    String stateName,
    String createMonitor,
    String createTriggerExpr,
    String deleteMonitor,
    String deleteTriggerExpr
)
    throws com.tailf.navu.NavuException
```

Types: [PlanComponent](PlanComponent.md#cls-PlanComponent), [NavuException](../navu/NavuException.md#cls-NavuException)

**Parameters**

- `String stateName`
- `String createMonitor`
- `String createTriggerExpr`
- `String deleteMonitor`
- `String deleteTriggerExpr`

### backTrack() <a href="#m-backTrack-d3f8df17d7ce" id="m-backTrack-d3f8df17d7ce"></a>

```java
public com.tailf.ncs.PlanComponent backTrack() throws com.tailf.navu.NavuException
```

Types: [PlanComponent](PlanComponent.md#cls-PlanComponent), [NavuException](../navu/NavuException.md#cls-NavuException)

### backTrack(boolean) <a href="#m-backTrack-9f47a005ed3f" id="m-backTrack-9f47a005ed3f"></a>

```java
public com.tailf.ncs.PlanComponent backTrack(
    boolean isBacktracking
)
    throws com.tailf.navu.NavuException
```

Types: [PlanComponent](PlanComponent.md#cls-PlanComponent), [NavuException](../navu/NavuException.md#cls-NavuException)

**Parameters**

- `boolean isBacktracking`

### setFailed(String) <a href="#m-setFailed-c699ca5438a6" id="m-setFailed-c699ca5438a6"></a>

```java
public com.tailf.ncs.PlanComponent setFailed(String stateName) throws com.tailf.navu.NavuException
```

Types: [PlanComponent](PlanComponent.md#cls-PlanComponent), [NavuException](../navu/NavuException.md#cls-NavuException)

Setting status to ncs:failed for a specific state in the plan component

**Parameters**

- `String stateName`

**Returns:** PlanComponent

**Throws**

- `NavuException`

### setNotReached(String) <a href="#m-setNotReached-9b7c14c0c58a" id="m-setNotReached-9b7c14c0c58a"></a>

```java
public com.tailf.ncs.PlanComponent setNotReached(
    String stateName
)
    throws com.tailf.navu.NavuException
```

Types: [PlanComponent](PlanComponent.md#cls-PlanComponent), [NavuException](../navu/NavuException.md#cls-NavuException)

Setting status to ncs:not-reached for a specific state in the
 plan component

**Parameters**

- `String stateName`

**Returns:** PlanComponent

**Throws**

- `NavuException`

### setReached(String) <a href="#m-setReached-d2df729907ae" id="m-setReached-d2df729907ae"></a>

```java
public com.tailf.ncs.PlanComponent setReached(String stateName) throws com.tailf.navu.NavuException
```

Types: [PlanComponent](PlanComponent.md#cls-PlanComponent), [NavuException](../navu/NavuException.md#cls-NavuException)

Setting status to ncs:reached for a specific state in the plan component

**Parameters**

- `String stateName`

**Returns:** PlanComponent

**Throws**

- `NavuException`
