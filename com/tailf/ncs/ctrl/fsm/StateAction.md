<a id="s-StateAction"></a>
# StateAction

```java
public interface com.tailf.ncs.ctrl.fsm.StateAction
```

State action callback interface

## Members

**Methods**:

- [enterState(String, Object)](#s-enterState)
- [leaveState(String, Object)](#s-leaveState)

## Methods

<a id="s-enterState"></a>
### enterState(String, Object)

```java
public abstract void enterState(String transitionName, Object opaque) throws Exception
```

Method called each time this state is entered

**Parameters**

- `String transitionName` - name of current transition event
- `Object opaque` - optional object passed with the event

**Throws**

- `Exception`

<a id="s-leaveState"></a>
### leaveState(String, Object)

```java
public abstract void leaveState(String transitionName, Object opaque) throws Exception
```

Method called each time this state is left

**Parameters**

- `String transitionName` - name of current transition event
- `Object opaque` - optional object passed with the event

**Throws**

- `Exception`
