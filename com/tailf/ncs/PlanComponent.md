# PlanComponent <a href="#plancomponent-31a3de0591ef" id="plancomponent-31a3de0591ef"></a>

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

- [PlanComponent\(NavuNode, String, String\)](#plancomponent-1b9624e9dad9)
- [PlanComponent\(NavuNode, String, String, ConfObjectRef\)](#plancomponent-5e61ba53deeb)

**Methods**:

- [appendState\(String\)](#appendstate-45d10d72ab14)
- [appendState\(String, String, String\)](#appendstate-5142e7e1bad6)
- [appendState\(String, String, String, String, String\)](#appendstate-efbc51e6cfd9)
- [backTrack\(\)](#backtrack-d3f8df17d7ce)
- [backTrack\(boolean\)](#backtrack-9f47a005ed3f)
- [setFailed\(String\)](#setfailed-c699ca5438a6)
- [setNotReached\(String\)](#setnotreached-9b7c14c0c58a)
- [setReached\(String\)](#setreached-d2df729907ae)

## Constructors

### PlanComponent(NavuNode, String, String) <a href="#plancomponent-1b9624e9dad9" id="plancomponent-1b9624e9dad9"></a>

```java
public PlanComponent(
    com.tailf.navu.NavuNode service,
    String name,
    String componentType
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](../navu/NavuNode.md#navunode-73944820c8db), [NavuException](../navu/NavuException.md#navuexception-d80fa0cb4f3f)

Creation of a plan component.
 It uses a NavuNode pointing to the service. This is normally the same
 NavuNode as supplied as an argument to the service create() method.

**Parameters**

- `com.tailf.navu.NavuNode service`
- `String name`
- `String componentType`

**Throws**

- `NavuException`

### PlanComponent(NavuNode, String, String, ConfObjectRef) <a href="#plancomponent-5e61ba53deeb" id="plancomponent-5e61ba53deeb"></a>

```java
public PlanComponent(
    com.tailf.navu.NavuNode service,
    String name,
    String componentType,
    com.tailf.conf.ConfObjectRef serviceReference
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](../navu/NavuNode.md#navunode-73944820c8db), [ConfObjectRef](../conf/ConfObjectRef.md#confobjectref-6b7c225d0d3d), [NavuException](../navu/NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.navu.NavuNode service`
- `String name`
- `String componentType`
- `com.tailf.conf.ConfObjectRef serviceReference`


## Methods

### appendState(String) <a href="#appendstate-45d10d72ab14" id="appendstate-45d10d72ab14"></a>

```java
public com.tailf.ncs.PlanComponent appendState(String stateName) throws com.tailf.navu.NavuException
```

Types: [PlanComponent](PlanComponent.md#plancomponent-31a3de0591ef), [NavuException](../navu/NavuException.md#navuexception-d80fa0cb4f3f)

This method supplies a state to the specific component.
 The initial status for this state can be ncs:reached or ncs:not-reached
 and is indicated by setting the reached boolean to true or false
 respectively

**Parameters**

- `String stateName`

**Returns:** PlanComponent

**Throws**

- `NavuException`

### appendState(String, String, String) <a href="#appendstate-5142e7e1bad6" id="appendstate-5142e7e1bad6"></a>

```java
public com.tailf.ncs.PlanComponent appendState(
    String stateName,
    String createMonitor,
    String createTriggerExpr
)
    throws com.tailf.navu.NavuException
```

Types: [PlanComponent](PlanComponent.md#plancomponent-31a3de0591ef), [NavuException](../navu/NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `String stateName`
- `String createMonitor`
- `String createTriggerExpr`

### appendState(String, String, String, String, String) <a href="#appendstate-efbc51e6cfd9" id="appendstate-efbc51e6cfd9"></a>

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

Types: [PlanComponent](PlanComponent.md#plancomponent-31a3de0591ef), [NavuException](../navu/NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `String stateName`
- `String createMonitor`
- `String createTriggerExpr`
- `String deleteMonitor`
- `String deleteTriggerExpr`

### backTrack() <a href="#backtrack-d3f8df17d7ce" id="backtrack-d3f8df17d7ce"></a>

```java
public com.tailf.ncs.PlanComponent backTrack() throws com.tailf.navu.NavuException
```

Types: [PlanComponent](PlanComponent.md#plancomponent-31a3de0591ef), [NavuException](../navu/NavuException.md#navuexception-d80fa0cb4f3f)

### backTrack(boolean) <a href="#backtrack-9f47a005ed3f" id="backtrack-9f47a005ed3f"></a>

```java
public com.tailf.ncs.PlanComponent backTrack(
    boolean isBacktracking
)
    throws com.tailf.navu.NavuException
```

Types: [PlanComponent](PlanComponent.md#plancomponent-31a3de0591ef), [NavuException](../navu/NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `boolean isBacktracking`

### setFailed(String) <a href="#setfailed-c699ca5438a6" id="setfailed-c699ca5438a6"></a>

```java
public com.tailf.ncs.PlanComponent setFailed(String stateName) throws com.tailf.navu.NavuException
```

Types: [PlanComponent](PlanComponent.md#plancomponent-31a3de0591ef), [NavuException](../navu/NavuException.md#navuexception-d80fa0cb4f3f)

Setting status to ncs:failed for a specific state in the plan component

**Parameters**

- `String stateName`

**Returns:** PlanComponent

**Throws**

- `NavuException`

### setNotReached(String) <a href="#setnotreached-9b7c14c0c58a" id="setnotreached-9b7c14c0c58a"></a>

```java
public com.tailf.ncs.PlanComponent setNotReached(
    String stateName
)
    throws com.tailf.navu.NavuException
```

Types: [PlanComponent](PlanComponent.md#plancomponent-31a3de0591ef), [NavuException](../navu/NavuException.md#navuexception-d80fa0cb4f3f)

Setting status to ncs:not-reached for a specific state in the
 plan component

**Parameters**

- `String stateName`

**Returns:** PlanComponent

**Throws**

- `NavuException`

### setReached(String) <a href="#setreached-d2df729907ae" id="setreached-d2df729907ae"></a>

```java
public com.tailf.ncs.PlanComponent setReached(String stateName) throws com.tailf.navu.NavuException
```

Types: [PlanComponent](PlanComponent.md#plancomponent-31a3de0591ef), [NavuException](../navu/NavuException.md#navuexception-d80fa0cb4f3f)

Setting status to ncs:reached for a specific state in the plan component

**Parameters**

- `String stateName`

**Returns:** PlanComponent

**Throws**

- `NavuException`
