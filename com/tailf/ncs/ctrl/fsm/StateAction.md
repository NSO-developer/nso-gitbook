# StateAction <a href="#stateaction-dc8dd9a18a65" id="stateaction-dc8dd9a18a65"></a>

```java
public interface com.tailf.ncs.ctrl.fsm.StateAction
```

State action callback interface

## Members

**Methods**:

- [enterState\(String, Object\)](#enterstate-ec1380c664b4)
- [leaveState\(String, Object\)](#leavestate-8aeeca64138e)

## Methods

### enterState(String, Object) <a href="#enterstate-ec1380c664b4" id="enterstate-ec1380c664b4"></a>

```java
public abstract void enterState(String transitionName, Object opaque) throws Exception
```

Method called each time this state is entered

**Parameters**

- `String transitionName` - name of current transition event
- `Object opaque` - optional object passed with the event

**Throws**

- `Exception`

### leaveState(String, Object) <a href="#leavestate-8aeeca64138e" id="leavestate-8aeeca64138e"></a>

```java
public abstract void leaveState(String transitionName, Object opaque) throws Exception
```

Method called each time this state is left

**Parameters**

- `String transitionName` - name of current transition event
- `Object opaque` - optional object passed with the event

**Throws**

- `Exception`
