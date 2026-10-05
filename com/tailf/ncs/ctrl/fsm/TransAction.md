<a id="s-TransAction"></a>
# TransAction

```java
public interface com.tailf.ncs.ctrl.fsm.TransAction
```

Transition action callback

## Members

**Methods**:

- [execute(String, String, Object)](#s-execute)

## Methods

<a id="s-execute"></a>
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
