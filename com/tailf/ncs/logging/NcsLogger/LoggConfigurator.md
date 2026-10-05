<a id="cls-LoggConfigurator"></a>
# LoggConfigurator

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

- [LoggConfigurator(SocketAddress)](#m-loggconfigurator-6207ae38aa39)

**Methods**:

- [getLog4jLevel(ConfEnumeration)](#m-getlog4jlevel-31ba1eec0be7)
- [loadLog4JConfig()](#m-loadlog4jconfig-bb849cf7c185)
- [printLoggerStatus()](#m-printloggerstatus-e55794ea0a00)

## Constructors

<a id="m-loggconfigurator-6207ae38aa39"></a>
### LoggConfigurator(SocketAddress)

**Package-private**

```java
LoggConfigurator(java.net.SocketAddress address)
```

**Parameters**

- `java.net.SocketAddress address`


## Methods

<a id="m-getlog4jlevel-31ba1eec0be7"></a>
### getLog4jLevel(ConfEnumeration)

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

<a id="m-loadlog4jconfig-bb849cf7c185"></a>
### loadLog4JConfig()

**Package-private**

```java
void loadLog4JConfig()
```

Uses parts of the log4j2 core API.
 When upgrading log4j2 check that LoggerContext, doesn't
 contain changes that break this method.

<a id="m-printloggerstatus-e55794ea0a00"></a>
### printLoggerStatus()

**Package-private**

```java
void printLoggerStatus()
```
