# HandlerResponse <a href="#handlerresponse-651c4aa97197" id="handlerresponse-651c4aa97197"></a>

```java
public enum com.tailf.ncs.snmp.snmp4j.HandlerResponse
```

Response enums controlling the execution of the handler chain

## Members

**Enum Constants**:

- [CONTINUE](#continue-5e783bfcaf54)
- [SUPPRESS](#suppress-e5b01e73cf35)

**Methods**:

- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### CONTINUE <a href="#continue-5e783bfcaf54" id="continue-5e783bfcaf54"></a>

```java
public static final com.tailf.ncs.snmp.snmp4j.HandlerResponse CONTINUE;
```

Value indicating that a notification should be passed to
 the next handler in the handler chain

### SUPPRESS <a href="#suppress-e5b01e73cf35" id="suppress-e5b01e73cf35"></a>

```java
public static final com.tailf.ncs.snmp.snmp4j.HandlerResponse SUPPRESS;
```

Value indicating that processing for this notification
 stop traversing the handler chain.


## Methods

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.ncs.snmp.snmp4j.HandlerResponse valueOf(String name)
```

Types: [HandlerResponse](HandlerResponse.md#handlerresponse-651c4aa97197)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.ncs.snmp.snmp4j.HandlerResponse[] values()
```

Types: [HandlerResponse](HandlerResponse.md#handlerresponse-651c4aa97197)
