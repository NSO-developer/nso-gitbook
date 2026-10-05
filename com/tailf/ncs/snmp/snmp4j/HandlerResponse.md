<a id="cls-HandlerResponse"></a>
# HandlerResponse

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

- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-CONTINUE"></a>
### CONTINUE

```java
public static final com.tailf.ncs.snmp.snmp4j.HandlerResponse CONTINUE;
```

Value indicating that a notification should be passed to
 the next handler in the handler chain

<a id="m-SUPPRESS"></a>
### SUPPRESS

```java
public static final com.tailf.ncs.snmp.snmp4j.HandlerResponse SUPPRESS;
```

Value indicating that processing for this notification
 stop traversing the handler chain.


## Methods

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.ncs.snmp.snmp4j.HandlerResponse valueOf(String name)
```

Types: [HandlerResponse](HandlerResponse.md#cls-HandlerResponse)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.ncs.snmp.snmp4j.HandlerResponse[] values()
```

Types: [HandlerResponse](HandlerResponse.md#cls-HandlerResponse)
