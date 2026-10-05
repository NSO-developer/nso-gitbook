<a id="cls-TransAction"></a>
# TransAction

```java
public interface com.tailf.ncs.ctrl.fsm.TransAction
```

Transition action callback

## Members

**Methods**:

- [execute(String, String, Object)](#m-execute-4f9764c84c43)

## Methods

<a id="m-execute-4f9764c84c43"></a>
### execute(String, String, Object)

```java
public abstract void execute(String currentState, String newState, Object opaque) throws Exception
```

Method called when a specific transition event occur

**Parameters**

- `String currentState` - Name of From state before transition
- `String newState` - Name of To state after transition
- `Object opaque` - optional object passed with the event

**Throws**

- `Exception`
