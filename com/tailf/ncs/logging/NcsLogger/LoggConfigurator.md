# LoggConfigurator <a href="#cls-LoggConfigurator" id="cls-LoggConfigurator"></a>

**Package-private**

```java
static class com.tailf.ncs.logging.NcsLogger.LoggConfigurator
```

Helper class to map the Ncs YANG enumeration type log-level- type to
 org.apache.logging.log4j.Levels.

 The config(host) creates a subscriber that listen for changes in loggers
 levels at runtime. One can change a loggers level at runtime by setting a
 level for a specific logger.

 The class could also do a synchronization of configuration in NCS to all
 log4j Loggers.

## Members

**Constructors**:

- [LoggConfigurator(SocketAddress)](#m-LoggConfigurator-6207ae38aa39)

**Methods**:

- [getLog4jLevel(ConfEnumeration)](#m-getLog4jLevel-31ba1eec0be7)
- [loadLog4JConfig()](#m-loadLog4JConfig-bb849cf7c185)
- [printLoggerStatus()](#m-printLoggerStatus-e55794ea0a00)

## Constructors

### LoggConfigurator(SocketAddress) <a href="#m-LoggConfigurator-6207ae38aa39" id="m-LoggConfigurator-6207ae38aa39"></a>

**Package-private**

```java
LoggConfigurator(java.net.SocketAddress address)
```

**Parameters**

- `java.net.SocketAddress address`


## Methods

### getLog4jLevel(ConfEnumeration) <a href="#m-getLog4jLevel-31ba1eec0be7" id="m-getLog4jLevel-31ba1eec0be7"></a>

**Package-private**

```java
org.apache.logging.log4j.Level getLog4jLevel(com.tailf.conf.ConfEnumeration level)
```

Types: [ConfEnumeration](../../../conf/ConfEnumeration.md#cls-ConfEnumeration)

Maps all the Ncs YANG log-level-types to a log4j corresponding
 Level.

**Parameters**

- `com.tailf.conf.ConfEnumeration level` - - log-level-type type

**Returns:** Corresponding log4j Level

### loadLog4JConfig() <a href="#m-loadLog4JConfig-bb849cf7c185" id="m-loadLog4JConfig-bb849cf7c185"></a>

**Package-private**

```java
void loadLog4JConfig()
```

Uses parts of the log4j2 core API.
 When upgrading log4j2 check that LoggerContext, doesn't
 contain changes that break this method.

### printLoggerStatus() <a href="#m-printLoggerStatus-e55794ea0a00" id="m-printLoggerStatus-e55794ea0a00"></a>

**Package-private**

```java
void printLoggerStatus()
```
