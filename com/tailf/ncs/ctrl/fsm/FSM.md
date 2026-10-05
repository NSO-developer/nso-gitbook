<a id="cls-FSM"></a>
# FSM

```java
public class com.tailf.ncs.ctrl.fsm.FSM
```

Generic finite state machine
 The FSM is setup by a String array of FromState-Event-ToState
 String triplets.

 For example as
 FSM fsm = new FSM(new String[][] {
                   {"BIRTH",     null,          null},
                   {"BIRTH",     "HELLO_EVENT", "GREETINGS"},
                   {"GREETINGS", "HELLO_EVENT", "GREETINGS"},
                   {"GREETINGS", "BYE_EVENT",   "GOODBYE"}});

  The first FromState-Event-ToState triplet is the initial state
  for the FSM and no event or to-state needs to be defined for this state

  Events are passed to the FSM using event(...) method and
  the state transitions take place.
  Each state has an enter and an leave action callback.
  Also each event transition has an action callback.

  This way the FSM can start acting on events and state transitions
  The execution order of callbacks when an event occur is the following
  First the leaveState method in the FromState is executed.
  Second the execute method of the transition is executed.
  Third and last the enterState method of the ToState is executed.
  Undefined methods are skipped.

## Members

**Constructors**:

- [FSM(String[][], String)](#m-fsm-a5e2325c2c06)

**Methods**:

- [addStateAction(String, StateAction)](#m-addstateaction-c7b6b5eb5062)
- [addTransAction(String, TransAction)](#m-addtransaction-fb3cf361b773)
- [event(String)](#m-event-35c2a3878e07)
- [event(String, Object)](#m-event-c2c97f01bc7c)
- [getCurrentStateName()](#m-getcurrentstatename-ca0e5e591731)
- [isState(String[])](#m-isstate-fb89c494ed4d)
- [main(String[])](#m-main-1503518a8568)

## Constructors

<a id="m-fsm-a5e2325c2c06"></a>
### FSM(String[][], String)

```java
public FSM(String[][] transitions, String name)
```

Constructor for the FSM

**Parameters**

- `String[][] transitions` - String array of FromState-Event-ToState
 String triplets
- `String name`


## Methods

<a id="m-addstateaction-c7b6b5eb5062"></a>
### addStateAction(String, StateAction)

```java
public void addStateAction(String stateName, com.tailf.ncs.ctrl.fsm.StateAction action)
```

Types: [StateAction](StateAction.md#cls-StateAction)

Add state action callback

**Parameters**

- `String stateName` - name of the state for the callback
- `com.tailf.ncs.ctrl.fsm.StateAction action` - callback interface instance

<a id="m-addtransaction-fb3cf361b773"></a>
### addTransAction(String, TransAction)

```java
public void addTransAction(String transName, com.tailf.ncs.ctrl.fsm.TransAction action)
```

Types: [TransAction](TransAction.md#cls-TransAction)

Add transition event callback

**Parameters**

- `String transName` - name of the transition event
- `com.tailf.ncs.ctrl.fsm.TransAction action` - callback interface instance

<a id="m-event-35c2a3878e07"></a>
### event(String)

```java
public boolean event(String transName) throws Exception
```

Sent an transition event to the FSM

**Parameters**

- `String transName` - name of the transition event

**Returns:** true if the state transition was successful

**Throws**

- `Exception`

<a id="m-event-c2c97f01bc7c"></a>
### event(String, Object)

```java
public boolean event(String transName, Object opaque) throws Exception
```

Sent an transition event to the FSM
 This method also passes an arbitrary opaque object to the callbacks
 which are executed in the state transition

**Parameters**

- `String transName` - name of the transition event
- `Object opaque` - object passed to the executing callbacks

**Returns:** true if the state transition was successful

**Throws**

- `Exception`

<a id="m-getcurrentstatename-ca0e5e591731"></a>
### getCurrentStateName()

```java
public String getCurrentStateName()
```

Get current state

**Returns:** current stateName

<a id="m-isstate-fb89c494ed4d"></a>
### isState(String[])

```java
public boolean isState(String[] state)
```

Check if current state is one of named states

**Parameters**

- `String[] state` - variable number if stateName to check equality

**Returns:** true if current state is one of named states

<a id="m-main-1503518a8568"></a>
### main(String[])

```java
public static void main(String[] args) throws Exception
```

**Parameters**

- `String[] args`
