# TransactionIdMode <a href="#transactionidmode-469080668075" id="transactionidmode-469080668075"></a>

```java
public static enum com.tailf.ned.NedWorker.TransactionIdMode
```

Indicates the mode of Transaction ID supported by the NED.
 Support for Transaction ID is required for check-sync action.

## Members

**Enum Constants**:

- [NONE](#none-f29411358a7b)
- [UNIQUE\_STRING](#unique_string-f175645841dd)

**Methods**:

- [toString\(\)](#tostring-e9d48c5503ef)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### NONE <a href="#none-f29411358a7b" id="none-f29411358a7b"></a>

Transaction ID is not supported

### UNIQUE_STRING <a href="#unique_string-f175645841dd" id="unique_string-f175645841dd"></a>

Transaction ID should be a String
 uniquely identifying each transaction


## Methods

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.ned.NedWorker.TransactionIdMode valueOf(String name)
```

Types: [TransactionIdMode](TransactionIdMode.md#transactionidmode-469080668075)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.ned.NedWorker.TransactionIdMode[] values()
```

Types: [TransactionIdMode](TransactionIdMode.md#transactionidmode-469080668075)
