# NavuNodeType <a href="#navunodetype-6744525a3747" id="navunodetype-6744525a3747"></a>

```java
protected static enum com.tailf.navu.NavuNodeInfo.NavuNodeType
```

## Members

**Enum Constants**:

- [CS\_NODE\_IS\_ACTION](#cs_node_is_action-3107f62fdc87)
- [CS\_NODE\_IS\_CASE](#cs_node_is_case-6e5ef2b25aa6)
- [CS\_NODE\_IS\_CDB](#cs_node_is_cdb-f0d0e75e76fd)
- [CS\_NODE\_IS\_CONTAINER](#cs_node_is_container-40402b656490)
- [CS\_NODE\_IS\_LIST](#cs_node_is_list-1cd0e7e67223)
- [CS\_NODE\_IS\_NOTIF](#cs_node_is_notif-7d1c1ba1de3c)
- [CS\_NODE\_IS\_PARAM](#cs_node_is_param-b51a4d7d5766)
- [CS\_NODE\_IS\_RESULT](#cs_node_is_result-d1516b1dc1b1)
- [CS\_NODE\_IS\_WRITE](#cs_node_is_write-1cbe36076711)
- [CS\_NODE\_IS\_WRITE\_ALL](#cs_node_is_write_all-8b0efda2263d)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### CS_NODE_IS_ACTION <a href="#cs_node_is_action-3107f62fdc87" id="cs_node_is_action-3107f62fdc87"></a>

```java
CS_NODE_IS_ACTION(1 << 3);
```

### CS_NODE_IS_CASE <a href="#cs_node_is_case-6e5ef2b25aa6" id="cs_node_is_case-6e5ef2b25aa6"></a>

```java
CS_NODE_IS_CASE(1 << 7);
```

### CS_NODE_IS_CDB <a href="#cs_node_is_cdb-f0d0e75e76fd" id="cs_node_is_cdb-f0d0e75e76fd"></a>

```java
CS_NODE_IS_CDB(1 << 2);
```

### CS_NODE_IS_CONTAINER <a href="#cs_node_is_container-40402b656490" id="cs_node_is_container-40402b656490"></a>

```java
CS_NODE_IS_CONTAINER(1 << 8);
```

### CS_NODE_IS_LIST <a href="#cs_node_is_list-1cd0e7e67223" id="cs_node_is_list-1cd0e7e67223"></a>

```java
CS_NODE_IS_LIST(1 << 0);
```

### CS_NODE_IS_NOTIF <a href="#cs_node_is_notif-7d1c1ba1de3c" id="cs_node_is_notif-7d1c1ba1de3c"></a>

```java
CS_NODE_IS_NOTIF(1 << 6);
```

### CS_NODE_IS_PARAM <a href="#cs_node_is_param-b51a4d7d5766" id="cs_node_is_param-b51a4d7d5766"></a>

```java
CS_NODE_IS_PARAM(1 << 4);
```

### CS_NODE_IS_RESULT <a href="#cs_node_is_result-d1516b1dc1b1" id="cs_node_is_result-d1516b1dc1b1"></a>

```java
CS_NODE_IS_RESULT(1 << 5);
```

### CS_NODE_IS_WRITE <a href="#cs_node_is_write-1cbe36076711" id="cs_node_is_write-1cbe36076711"></a>

```java
CS_NODE_IS_WRITE(1 << 1);
```

### CS_NODE_IS_WRITE_ALL <a href="#cs_node_is_write_all-8b0efda2263d" id="cs_node_is_write_all-8b0efda2263d"></a>

```java
CS_NODE_IS_WRITE_ALL(1 << 12);
```


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

**Returns:** the integer value of the enum.

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.navu.NavuNodeInfo.NavuNodeType valueOf(String name)
```

Types: [NavuNodeType](NavuNodeType.md#navunodetype-6744525a3747)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.navu.NavuNodeInfo.NavuNodeType[] values()
```

Types: [NavuNodeType](NavuNodeType.md#navunodetype-6744525a3747)
