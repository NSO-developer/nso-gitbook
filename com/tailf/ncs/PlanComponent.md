<a id="cls-PlanComponent"></a>
# PlanComponent

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

- [PlanComponent(NavuNode, String, String)](#m-plancomponent-1b9624e9dad9)
- [PlanComponent(NavuNode, String, String, ConfObjectRef)](#m-plancomponent-5e61ba53deeb)

**Methods**:

- [appendState(String)](#m-appendstate-45d10d72ab14)
- [appendState(String, String, String)](#m-appendstate-5142e7e1bad6)
- [appendState(String, String, String, String, String)](#m-appendstate-efbc51e6cfd9)
- [backTrack()](#m-backtrack-d3f8df17d7ce)
- [backTrack(boolean)](#m-backtrack-9f47a005ed3f)
- [setFailed(String)](#m-setfailed-c699ca5438a6)
- [setNotReached(String)](#m-setnotreached-9b7c14c0c58a)
- [setReached(String)](#m-setreached-d2df729907ae)

## Constructors

<a id="m-plancomponent-1b9624e9dad9"></a>
### PlanComponent(NavuNode, String, String)

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

<a id="m-plancomponent-5e61ba53deeb"></a>
### PlanComponent(NavuNode, String, String, ConfObjectRef)

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

<a id="m-appendstate-45d10d72ab14"></a>
### appendState(String)

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

<a id="m-appendstate-5142e7e1bad6"></a>
### appendState(String, String, String)

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

<a id="m-appendstate-efbc51e6cfd9"></a>
### appendState(String, String, String, String, String)

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

<a id="m-backtrack-d3f8df17d7ce"></a>
### backTrack()

```java
public com.tailf.ncs.PlanComponent backTrack() throws com.tailf.navu.NavuException
```

Types: [PlanComponent](PlanComponent.md#cls-PlanComponent), [NavuException](../navu/NavuException.md#cls-NavuException)

<a id="m-backtrack-9f47a005ed3f"></a>
### backTrack(boolean)

```java
public com.tailf.ncs.PlanComponent backTrack(
    boolean isBacktracking
)
    throws com.tailf.navu.NavuException
```

Types: [PlanComponent](PlanComponent.md#cls-PlanComponent), [NavuException](../navu/NavuException.md#cls-NavuException)

**Parameters**

- `boolean isBacktracking`

<a id="m-setfailed-c699ca5438a6"></a>
### setFailed(String)

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

<a id="m-setnotreached-9b7c14c0c58a"></a>
### setNotReached(String)

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

<a id="m-setreached-d2df729907ae"></a>
### setReached(String)

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
