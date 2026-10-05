<a id="s-TransactionIdMode"></a>
# TransactionIdMode

```java
public static enum com.tailf.ned.NedWorker.TransactionIdMode
```

Types: [TransactionIdMode](TransactionIdMode.md#s-TransactionIdMode)

Indicates the mode of Transaction ID supported by the NED.
 Support for Transaction ID is required for check-sync action.

**Related classes**

- [TransactionIdMode](TransactionIdMode.md#s-TransactionIdMode)

## Members

**Enum Constants**:

- [NONE](#s-NONE)
- [UNIQUE_STRING](#s-UNIQUE_STRING)

**Methods**:

- [toString()](#s-toString)
- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-NONE"></a>
### NONE

```java
public static final com.tailf.ned.NedWorker.TransactionIdMode NONE;
```

Transaction ID is not supported

<a id="s-UNIQUE_STRING"></a>
### UNIQUE_STRING

```java
public static final com.tailf.ned.NedWorker.TransactionIdMode UNIQUE_STRING;
```

Transaction ID should be a String
 uniquely identifying each transaction


## Methods

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

<a id="s-valueOf"></a>
### valueOf(String)

```java
public static com.tailf.ned.NedWorker.TransactionIdMode valueOf(String name)
```

Types: [TransactionIdMode](TransactionIdMode.md#s-TransactionIdMode)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.ned.NedWorker.TransactionIdMode[] values()
```

Types: [TransactionIdMode](TransactionIdMode.md#s-TransactionIdMode)
