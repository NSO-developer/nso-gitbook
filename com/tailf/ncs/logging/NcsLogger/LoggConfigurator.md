# LoggConfigurator <a href="#loggconfigurator-94c239f258ab" id="loggconfigurator-94c239f258ab"></a>

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

- [LoggConfigurator(SocketAddress)](#loggconfigurator-6207ae38aa39)

**Methods**:

- [getLog4jLevel(ConfEnumeration)](#getlog4jlevel-31ba1eec0be7)
- [loadLog4JConfig()](#loadlog4jconfig-bb849cf7c185)
- [printLoggerStatus()](#printloggerstatus-e55794ea0a00)

## Constructors

### LoggConfigurator(SocketAddress) <a href="#loggconfigurator-6207ae38aa39" id="loggconfigurator-6207ae38aa39"></a>

**Package-private**

```java
LoggConfigurator(java.net.SocketAddress address)
```

**Parameters**

- `java.net.SocketAddress address`


## Methods

### getLog4jLevel(ConfEnumeration) <a href="#getlog4jlevel-31ba1eec0be7" id="getlog4jlevel-31ba1eec0be7"></a>

**Package-private**

```java
org.apache.logging.log4j.Level getLog4jLevel(com.tailf.conf.ConfEnumeration level)
```

Types: [ConfEnumeration](../../../conf/ConfEnumeration.md#confenumeration-c8557b4aeb53)

Maps all the Ncs YANG log-level-types to a log4j corresponding
 Level.

**Parameters**

- `com.tailf.conf.ConfEnumeration level` - - log-level-type type

**Returns:** Corresponding log4j Level

### loadLog4JConfig() <a href="#loadlog4jconfig-bb849cf7c185" id="loadlog4jconfig-bb849cf7c185"></a>

**Package-private**

```java
void loadLog4JConfig()
```

Uses parts of the log4j2 core API.
 When upgrading log4j2 check that LoggerContext, doesn't
 contain changes that break this method.

### printLoggerStatus() <a href="#printloggerstatus-e55794ea0a00" id="printloggerstatus-e55794ea0a00"></a>

**Package-private**

```java
void printLoggerStatus()
```
