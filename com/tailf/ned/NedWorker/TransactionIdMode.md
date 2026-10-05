<a id="cls-TransactionIdMode"></a>
# TransactionIdMode

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

- [toString()](#m-tostring-e9d48c5503ef)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-NONE"></a>
### NONE

```java
public static final com.tailf.ned.NedWorker.TransactionIdMode NONE;
```

Transaction ID is not supported

<a id="m-UNIQUE_STRING"></a>
### UNIQUE_STRING

```java
public static final com.tailf.ned.NedWorker.TransactionIdMode UNIQUE_STRING;
```

Transaction ID should be a String
 uniquely identifying each transaction


## Methods

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.ned.NedWorker.TransactionIdMode valueOf(String name)
```

Types: [TransactionIdMode](TransactionIdMode.md#cls-TransactionIdMode)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.ned.NedWorker.TransactionIdMode[] values()
```

Types: [TransactionIdMode](TransactionIdMode.md#cls-TransactionIdMode)
