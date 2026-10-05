<a id="s-HandlerResponse"></a>
# HandlerResponse

```java
public enum com.tailf.ncs.snmp.snmp4j.HandlerResponse
```

Types: [HandlerResponse](HandlerResponse.md#s-HandlerResponse)

Response enums controlling the execution of the handler chain

**Related classes**

- [HandlerResponse](HandlerResponse.md#s-HandlerResponse)

## Members

**Enum Constants**:

- [CONTINUE](#s-CONTINUE)
- [SUPPRESS](#s-SUPPRESS)

**Methods**:

- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-CONTINUE"></a>
### CONTINUE

```java
public static final com.tailf.ncs.snmp.snmp4j.HandlerResponse CONTINUE;
```

Value indicating that a notification should be passed to
 the next handler in the handler chain

<a id="s-SUPPRESS"></a>
### SUPPRESS

```java
public static final com.tailf.ncs.snmp.snmp4j.HandlerResponse SUPPRESS;
```

Value indicating that processing for this notification
 stop traversing the handler chain.


## Methods

<a id="s-valueOf"></a>
### valueOf(String)

```java
public static com.tailf.ncs.snmp.snmp4j.HandlerResponse valueOf(String name)
```

Types: [HandlerResponse](HandlerResponse.md#s-HandlerResponse)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.ncs.snmp.snmp4j.HandlerResponse[] values()
```

Types: [HandlerResponse](HandlerResponse.md#s-HandlerResponse)
