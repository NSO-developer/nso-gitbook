# HandlerResponse <a href="#cls-HandlerResponse" id="cls-HandlerResponse"></a>

```java
public enum com.tailf.ncs.snmp.snmp4j.HandlerResponse
```

Types: [HandlerResponse](HandlerResponse.md#cls-HandlerResponse)

Response enums controlling the execution of the handler chain

## Members

**Enum Constants**:

- [CONTINUE](#m-CONTINUE)
- [SUPPRESS](#m-SUPPRESS)

**Methods**:

- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### CONTINUE <a href="#m-CONTINUE" id="m-CONTINUE"></a>

```java
public static final com.tailf.ncs.snmp.snmp4j.HandlerResponse CONTINUE;
```

Value indicating that a notification should be passed to
 the next handler in the handler chain

### SUPPRESS <a href="#m-SUPPRESS" id="m-SUPPRESS"></a>

```java
public static final com.tailf.ncs.snmp.snmp4j.HandlerResponse SUPPRESS;
```

Value indicating that processing for this notification
 stop traversing the handler chain.


## Methods

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.ncs.snmp.snmp4j.HandlerResponse valueOf(String name)
```

Types: [HandlerResponse](HandlerResponse.md#cls-HandlerResponse)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.ncs.snmp.snmp4j.HandlerResponse[] values()
```

Types: [HandlerResponse](HandlerResponse.md#cls-HandlerResponse)
