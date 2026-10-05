<a id="cls-StateAction"></a>
# StateAction

```java
public interface com.tailf.ncs.ctrl.fsm.StateAction
```

State action callback interface

## Members

**Methods**:

- [enterState(String, Object)](#m-enterstate-ec1380c664b4)
- [leaveState(String, Object)](#m-leavestate-8aeeca64138e)

## Methods

<a id="m-enterstate-ec1380c664b4"></a>
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

<a id="m-leavestate-8aeeca64138e"></a>
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
