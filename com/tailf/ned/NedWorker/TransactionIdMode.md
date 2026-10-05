# TransactionIdMode <a href="#cls-TransactionIdMode" id="cls-TransactionIdMode"></a>

```java
public static enum com.tailf.ned.NedWorker.TransactionIdMode
```

Types: [TransactionIdMode](TransactionIdMode.md#cls-TransactionIdMode)

Indicates the mode of Transaction ID supported by the NED.
 Support for Transaction ID is required for check-sync action.

## Members

**Enum Constants**:

- [NONE](#m-NONE)
- [UNIQUE_STRING](#m-UNIQUE_STRING)

**Methods**:

- [toString()](#m-toString-e9d48c5503ef)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### NONE <a href="#m-NONE" id="m-NONE"></a>

```java
public static final com.tailf.ned.NedWorker.TransactionIdMode NONE;
```

Transaction ID is not supported

### UNIQUE_STRING <a href="#m-UNIQUE_STRING" id="m-UNIQUE_STRING"></a>

```java
public static final com.tailf.ned.NedWorker.TransactionIdMode UNIQUE_STRING;
```

Transaction ID should be a String
 uniquely identifying each transaction


## Methods

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.ned.NedWorker.TransactionIdMode valueOf(String name)
```

Types: [TransactionIdMode](TransactionIdMode.md#cls-TransactionIdMode)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.ned.NedWorker.TransactionIdMode[] values()
```

Types: [TransactionIdMode](TransactionIdMode.md#cls-TransactionIdMode)
