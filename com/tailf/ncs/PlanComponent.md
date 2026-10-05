<a id="s-PlanComponent"></a>
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

- [PlanComponent(NavuNode, String, String)](#s-PlanComponent-1)
- [PlanComponent(NavuNode, String, String, ConfObjectRef)](#s-PlanComponent-2)

**Methods**:

- [appendState(String)](#s-appendState)
- [appendState(String, String, String)](#s-appendState-1)
- [appendState(String, String, String, String, String)](#s-appendState-2)
- [backTrack()](#s-backTrack)
- [backTrack(boolean)](#s-backTrack-1)
- [setFailed(String)](#s-setFailed)
- [setNotReached(String)](#s-setNotReached)
- [setReached(String)](#s-setReached)

## Constructors

<a id="s-PlanComponent-1"></a>
### PlanComponent(NavuNode, String, String)

```java
public PlanComponent(
    com.tailf.navu.NavuNode service,
    String name,
    String componentType
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](../navu/NavuNode.md#s-NavuNode), [NavuException](../navu/NavuException.md#s-NavuException)

Creation of a plan component.
 It uses a NavuNode pointing to the service. This is normally the same
 NavuNode as supplied as an argument to the service create() method.

**Parameters**

- `com.tailf.navu.NavuNode service`
- `String name`
- `String componentType`

**Throws**

- `NavuException`

<a id="s-PlanComponent-2"></a>
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

Types: [NavuNode](../navu/NavuNode.md#s-NavuNode), [ConfObjectRef](../conf/ConfObjectRef.md#s-ConfObjectRef), [NavuException](../navu/NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode service`
- `String name`
- `String componentType`
- `com.tailf.conf.ConfObjectRef serviceReference`


## Methods

<a id="s-appendState"></a>
### appendState(String)

```java
public com.tailf.ncs.PlanComponent appendState(String stateName) throws com.tailf.navu.NavuException
```

Types: [PlanComponent](PlanComponent.md#s-PlanComponent), [NavuException](../navu/NavuException.md#s-NavuException)

This method supplies a state to the specific component.
 The initial status for this state can be ncs:reached or ncs:not-reached
 and is indicated by setting the reached boolean to true or false
 respectively

**Parameters**

- `String stateName`

**Returns:** PlanComponent

**Throws**

- `NavuException`

<a id="s-appendState-1"></a>
### appendState(String, String, String)

```java
public com.tailf.ncs.PlanComponent appendState(
    String stateName,
    String createMonitor,
    String createTriggerExpr
)
    throws com.tailf.navu.NavuException
```

Types: [PlanComponent](PlanComponent.md#s-PlanComponent), [NavuException](../navu/NavuException.md#s-NavuException)

**Parameters**

- `String stateName`
- `String createMonitor`
- `String createTriggerExpr`

<a id="s-appendState-2"></a>
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

Types: [PlanComponent](PlanComponent.md#s-PlanComponent), [NavuException](../navu/NavuException.md#s-NavuException)

**Parameters**

- `String stateName`
- `String createMonitor`
- `String createTriggerExpr`
- `String deleteMonitor`
- `String deleteTriggerExpr`

<a id="s-backTrack"></a>
### backTrack()

```java
public com.tailf.ncs.PlanComponent backTrack() throws com.tailf.navu.NavuException
```

Types: [PlanComponent](PlanComponent.md#s-PlanComponent), [NavuException](../navu/NavuException.md#s-NavuException)

<a id="s-backTrack-1"></a>
### backTrack(boolean)

```java
public com.tailf.ncs.PlanComponent backTrack(
    boolean isBacktracking
)
    throws com.tailf.navu.NavuException
```

Types: [PlanComponent](PlanComponent.md#s-PlanComponent), [NavuException](../navu/NavuException.md#s-NavuException)

**Parameters**

- `boolean isBacktracking`

<a id="s-setFailed"></a>
### setFailed(String)

```java
public com.tailf.ncs.PlanComponent setFailed(String stateName) throws com.tailf.navu.NavuException
```

Types: [PlanComponent](PlanComponent.md#s-PlanComponent), [NavuException](../navu/NavuException.md#s-NavuException)

Setting status to ncs:failed for a specific state in the plan component

**Parameters**

- `String stateName`

**Returns:** PlanComponent

**Throws**

- `NavuException`

<a id="s-setNotReached"></a>
### setNotReached(String)

```java
public com.tailf.ncs.PlanComponent setNotReached(
    String stateName
)
    throws com.tailf.navu.NavuException
```

Types: [PlanComponent](PlanComponent.md#s-PlanComponent), [NavuException](../navu/NavuException.md#s-NavuException)

Setting status to ncs:not-reached for a specific state in the
 plan component

**Parameters**

- `String stateName`

**Returns:** PlanComponent

**Throws**

- `NavuException`

<a id="s-setReached"></a>
### setReached(String)

```java
public com.tailf.ncs.PlanComponent setReached(String stateName) throws com.tailf.navu.NavuException
```

Types: [PlanComponent](PlanComponent.md#s-PlanComponent), [NavuException](../navu/NavuException.md#s-NavuException)

Setting status to ncs:reached for a specific state in the plan component

**Parameters**

- `String stateName`

**Returns:** PlanComponent

**Throws**

- `NavuException`
