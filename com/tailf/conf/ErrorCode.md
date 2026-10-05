<a id="cls-ErrorCode"></a>
# ErrorCode

```java
public enum com.tailf.conf.ErrorCode
```

Types: [ErrorCode](ErrorCode.md#cls-ErrorCode)

Error codes for all errors delivered over the protocol.

## Members

**Enum Constants**:

- [ERR_ABORTED](#m-ERR_ABORTED)
- [ERR_ACCESS_DENIED](#m-ERR_ACCESS_DENIED)
- [ERR_ALREADY_EXISTS](#m-ERR_ALREADY_EXISTS)
- [ERR_APPLICATION_INTERNAL](#m-ERR_APPLICATION_INTERNAL)
- [ERR_BAD_CONFIG](#m-ERR_BAD_CONFIG)
- [ERR_BAD_KEYREF](#m-ERR_BAD_KEYREF)
- [ERR_BADPATH](#m-ERR_BADPATH)
- [ERR_BADSTATE](#m-ERR_BADSTATE)
- [ERR_BADTYPE](#m-ERR_BADTYPE)
- [ERR_CLI_CMD](#m-ERR_CLI_CMD)
- [ERR_CONNECTION_CLOSED](#m-ERR_CONNECTION_CLOSED)
- [ERR_CONNECTION_REFUSED](#m-ERR_CONNECTION_REFUSED)
- [ERR_CONNECTION_TIMEOUT](#m-ERR_CONNECTION_TIMEOUT)
- [ERR_DATA_MISSING](#m-ERR_DATA_MISSING)
- [ERR_DEVICE](#m-ERR_DEVICE)
- [ERR_EOF](#m-ERR_EOF)
- [ERR_EXTERNAL](#m-ERR_EXTERNAL)
- [ERR_HA_BADCONFIG](#m-ERR_HA_BADCONFIG)
- [ERR_HA_BADFXS](#m-ERR_HA_BADFXS)
- [ERR_HA_BADNAME](#m-ERR_HA_BADNAME)
- [ERR_HA_BADTOKEN](#m-ERR_HA_BADTOKEN)
- [ERR_HA_BADVSN](#m-ERR_HA_BADVSN)
- [ERR_HA_BIND](#m-ERR_HA_BIND)
- [ERR_HA_CLOSED](#m-ERR_HA_CLOSED)
- [ERR_HA_CONNECT](#m-ERR_HA_CONNECT)
- [ERR_HA_NOTICK](#m-ERR_HA_NOTICK)
- [ERR_HA_WITH_UPGRADE](#m-ERR_HA_WITH_UPGRADE)
- [ERR_INCONSISTENT_VALUE](#m-ERR_INCONSISTENT_VALUE)
- [ERR_INTERNAL](#m-ERR_INTERNAL)
- [ERR_INUSE](#m-ERR_INUSE)
- [ERR_INVALID_INSTANCE](#m-ERR_INVALID_INSTANCE)
- [ERR_LIB_NOT_INITIALIZED](#m-ERR_LIB_NOT_INITIALIZED)
- [ERR_LOCKED](#m-ERR_LOCKED)
- [ERR_MALLOC](#m-ERR_MALLOC)
- [ERR_MISSING_INSTANCE](#m-ERR_MISSING_INSTANCE)
- [ERR_MUST_FAILED](#m-ERR_MUST_FAILED)
- [ERR_NOEXISTS](#m-ERR_NOEXISTS)
- [ERR_NON_UNIQUE](#m-ERR_NON_UNIQUE)
- [ERR_NOSESSION](#m-ERR_NOSESSION)
- [ERR_NOSTACK](#m-ERR_NOSTACK)
- [ERR_NOT_IMPLEMENTED](#m-ERR_NOT_IMPLEMENTED)
- [ERR_NOT_WRITABLE](#m-ERR_NOT_WRITABLE)
- [ERR_NOTCREATABLE](#m-ERR_NOTCREATABLE)
- [ERR_NOTDELETABLE](#m-ERR_NOTDELETABLE)
- [ERR_NOTMOVABLE](#m-ERR_NOTMOVABLE)
- [ERR_NOTRANS](#m-ERR_NOTRANS)
- [ERR_NOTSET](#m-ERR_NOTSET)
- [ERR_OS](#m-ERR_OS)
- [ERR_POLICY_COMPILATION_FAILED](#m-ERR_POLICY_COMPILATION_FAILED)
- [ERR_POLICY_EVALUATION_FAILED](#m-ERR_POLICY_EVALUATION_FAILED)
- [ERR_POLICY_FAILED](#m-ERR_POLICY_FAILED)
- [ERR_PROTOUSAGE](#m-ERR_PROTOUSAGE)
- [ERR_RESOURCE_DENIED](#m-ERR_RESOURCE_DENIED)
- [ERR_SERVICE_CONFLICT](#m-ERR_SERVICE_CONFLICT)
- [ERR_STALE_INSTANCE](#m-ERR_STALE_INSTANCE)
- [ERR_START_FAILED](#m-ERR_START_FAILED)
- [ERR_SUBAGENT_DOWN](#m-ERR_SUBAGENT_DOWN)
- [ERR_TEMPLATE](#m-ERR_TEMPLATE)
- [ERR_TIMEOUT](#m-ERR_TIMEOUT)
- [ERR_TOO_FEW_ELEMS](#m-ERR_TOO_FEW_ELEMS)
- [ERR_TOO_MANY_ELEMS](#m-ERR_TOO_MANY_ELEMS)
- [ERR_TOO_MANY_SESSIONS](#m-ERR_TOO_MANY_SESSIONS)
- [ERR_TOOMANYTRANS](#m-ERR_TOOMANYTRANS)
- [ERR_TRANSACTION_CONFLICT](#m-ERR_TRANSACTION_CONFLICT)
- [ERR_UNAVAILABLE](#m-ERR_UNAVAILABLE)
- [ERR_UNSET_CHOICE](#m-ERR_UNSET_CHOICE)
- [ERR_UPGRADE_IN_PROGRESS](#m-ERR_UPGRADE_IN_PROGRESS)
- [ERR_VALIDATION_WARNING](#m-ERR_VALIDATION_WARNING)
- [ERR_XPATH](#m-ERR_XPATH)
- [UNDEFINED](#m-UNDEFINED)

**Methods**:

- [equalsTo(int)](#m-equalsto-426f9980372b)
- [getValue()](#m-getvalue-d93864668c40)
- [stringValue()](#m-stringvalue-a6efca13ec08)
- [valueOf(int)](#m-valueof-c0d46d25fc67)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-ERR_ABORTED"></a>
### ERR_ABORTED

```java
public static final com.tailf.conf.ErrorCode ERR_ABORTED;
```

An operation was aborted

<a id="m-ERR_ACCESS_DENIED"></a>
### ERR_ACCESS_DENIED

```java
public static final com.tailf.conf.ErrorCode ERR_ACCESS_DENIED;
```

Access to an object was denied due to AAA authorization rules

<a id="m-ERR_ALREADY_EXISTS"></a>
### ERR_ALREADY_EXISTS

```java
public static final com.tailf.conf.ErrorCode ERR_ALREADY_EXISTS;
```

We tried to create something which already exists

<a id="m-ERR_APPLICATION_INTERNAL"></a>
### ERR_APPLICATION_INTERNAL

```java
public static final com.tailf.conf.ErrorCode ERR_APPLICATION_INTERNAL;
```

A data provider callback returned CONFD_ERRCODE_APPLICATION_INTERNAL

<a id="m-ERR_BAD_CONFIG"></a>
### ERR_BAD_CONFIG

```java
public static final com.tailf.conf.ErrorCode ERR_BAD_CONFIG;
```

An error in a configuration

<a id="m-ERR_BAD_KEYREF"></a>
### ERR_BAD_KEYREF

```java
public static final com.tailf.conf.ErrorCode ERR_BAD_KEYREF;
```

Dangling pointer

<a id="m-ERR_BADPATH"></a>
### ERR_BADPATH

```java
public static final com.tailf.conf.ErrorCode ERR_BADPATH;
```

We provided a bad path

<a id="m-ERR_BADSTATE"></a>
### ERR_BADSTATE

```java
public static final com.tailf.conf.ErrorCode ERR_BADSTATE;
```

Some function, such as the MAAPI commit functions that require
 several functions to be called in a specific order, was called out
 of order

<a id="m-ERR_BADTYPE"></a>
### ERR_BADTYPE

```java
public static final com.tailf.conf.ErrorCode ERR_BADTYPE;
```

We tried to create or write an object which is specified to have
 another type than the one we provided

<a id="m-ERR_CLI_CMD"></a>
### ERR_CLI_CMD

```java
public static final com.tailf.conf.ErrorCode ERR_CLI_CMD;
```

Execution of a CLI command failed

<a id="m-ERR_CONNECTION_CLOSED"></a>
### ERR_CONNECTION_CLOSED

```java
public static final com.tailf.conf.ErrorCode ERR_CONNECTION_CLOSED;
```

Connection closed

<a id="m-ERR_CONNECTION_REFUSED"></a>
### ERR_CONNECTION_REFUSED

```java
public static final com.tailf.conf.ErrorCode ERR_CONNECTION_REFUSED;
```

Connection was refused

<a id="m-ERR_CONNECTION_TIMEOUT"></a>
### ERR_CONNECTION_TIMEOUT

```java
public static final com.tailf.conf.ErrorCode ERR_CONNECTION_TIMEOUT;
```

Connection timed out

<a id="m-ERR_DATA_MISSING"></a>
### ERR_DATA_MISSING

```java
public static final com.tailf.conf.ErrorCode ERR_DATA_MISSING;
```

A data provider callback returned ERRCODE_DATA_MISSING

<a id="m-ERR_DEVICE"></a>
### ERR_DEVICE

```java
public static final com.tailf.conf.ErrorCode ERR_DEVICE;
```

An error occurred on the device

<a id="m-ERR_EOF"></a>
### ERR_EOF

```java
public static final com.tailf.conf.ErrorCode ERR_EOF;
```

This value is used when a function returns EOF. Thus it is
 not strictly necessary to check whether the return value is
 an error or eof - if the function should return OK on
 success, but the return value is something else, the reason can
 always be found via errno

<a id="m-ERR_EXTERNAL"></a>
### ERR_EXTERNAL

```java
public static final com.tailf.conf.ErrorCode ERR_EXTERNAL;
```

All errors that originate in user code

<a id="m-ERR_HA_BADCONFIG"></a>
### ERR_HA_BADCONFIG

```java
public static final com.tailf.conf.ErrorCode ERR_HA_BADCONFIG;
```

A remote HA node has bad configuration

<a id="m-ERR_HA_BADFXS"></a>
### ERR_HA_BADFXS

```java
public static final com.tailf.conf.ErrorCode ERR_HA_BADFXS;
```

A remote HA node had a different set of fxs files compared to us.
 It could also be that the set is the same, but the version of some
 fxs file is different

<a id="m-ERR_HA_BADNAME"></a>
### ERR_HA_BADNAME

```java
public static final com.tailf.conf.ErrorCode ERR_HA_BADNAME;
```

A remote ha node has a different name than the name we think it has

<a id="m-ERR_HA_BADTOKEN"></a>
### ERR_HA_BADTOKEN

```java
public static final com.tailf.conf.ErrorCode ERR_HA_BADTOKEN;
```

A remote HA node has a different token than us

<a id="m-ERR_HA_BADVSN"></a>
### ERR_HA_BADVSN

```java
public static final com.tailf.conf.ErrorCode ERR_HA_BADVSN;
```

A remote HA node had an incompatible protocol version

<a id="m-ERR_HA_BIND"></a>
### ERR_HA_BIND

```java
public static final com.tailf.conf.ErrorCode ERR_HA_BIND;
```

Failed to bind the ha socket for incoming HA connects

<a id="m-ERR_HA_CLOSED"></a>
### ERR_HA_CLOSED

```java
public static final com.tailf.conf.ErrorCode ERR_HA_CLOSED;
```

A remote HA node closed its connection to us, or there was a
 timeout waiting for a sync response from the primary during a call
 of HA.beSecondary()

<a id="m-ERR_HA_CONNECT"></a>
### ERR_HA_CONNECT

```java
public static final com.tailf.conf.ErrorCode ERR_HA_CONNECT;
```

Failed to connect to a remote HA node

<a id="m-ERR_HA_NOTICK"></a>
### ERR_HA_NOTICK

```java
public static final com.tailf.conf.ErrorCode ERR_HA_NOTICK;
```

A remote HA node failed to produce the interval live ticks

<a id="m-ERR_HA_WITH_UPGRADE"></a>
### ERR_HA_WITH_UPGRADE

```java
public static final com.tailf.conf.ErrorCode ERR_HA_WITH_UPGRADE;
```

We tried to perform an in-service data model upgrade on a HA node
 that was either a primary with secondaries or a secondary, or we tried
 to make the node a HA secondary while an in-service data model upgrade
 was in progress

<a id="m-ERR_INCONSISTENT_VALUE"></a>
### ERR_INCONSISTENT_VALUE

```java
public static final com.tailf.conf.ErrorCode ERR_INCONSISTENT_VALUE;
```

A data provider callback returned ERRCODE_INCONSISTENT_VALUE

<a id="m-ERR_INTERNAL"></a>
### ERR_INTERNAL

```java
public static final com.tailf.conf.ErrorCode ERR_INTERNAL;
```

An internal error. This normally indicates a bug in ConfD/NCS or
 libconfd (if nothing else the lack of a better error code), please
 report it to Tail-f support

<a id="m-ERR_INUSE"></a>
### ERR_INUSE

```java
public static final com.tailf.conf.ErrorCode ERR_INUSE;
```

We tried to commit while someone else holds a lock

<a id="m-ERR_INVALID_INSTANCE"></a>
### ERR_INVALID_INSTANCE

```java
public static final com.tailf.conf.ErrorCode ERR_INVALID_INSTANCE;
```

The value of an instance-identifier leaf does not conform to the
  specified path filters

<a id="m-ERR_LIB_NOT_INITIALIZED"></a>
### ERR_LIB_NOT_INITIALIZED

```java
public static final com.tailf.conf.ErrorCode ERR_LIB_NOT_INITIALIZED;
```

The confd has not been properly initialized

<a id="m-ERR_LOCKED"></a>
### ERR_LOCKED

```java
public static final com.tailf.conf.ErrorCode ERR_LOCKED;
```

We tried to lock something which is already locked

<a id="m-ERR_MALLOC"></a>
### ERR_MALLOC

```java
public static final com.tailf.conf.ErrorCode ERR_MALLOC;
```

Failed to allocate memory

<a id="m-ERR_MISSING_INSTANCE"></a>
### ERR_MISSING_INSTANCE

```java
public static final com.tailf.conf.ErrorCode ERR_MISSING_INSTANCE;
```

The value of an instance-identifier leaf with require-instance true
 does not specify an existing instance

<a id="m-ERR_MUST_FAILED"></a>
### ERR_MUST_FAILED

```java
public static final com.tailf.conf.ErrorCode ERR_MUST_FAILED;
```

A must constraint is not satisfied

<a id="m-ERR_NOEXISTS"></a>
### ERR_NOEXISTS

```java
public static final com.tailf.conf.ErrorCode ERR_NOEXISTS;
```

Typically we tried to read a value through CDB or MAAPI
  which does not exist

<a id="m-ERR_NON_UNIQUE"></a>
### ERR_NON_UNIQUE

```java
public static final com.tailf.conf.ErrorCode ERR_NON_UNIQUE;
```

A group of leafs specified with the unique statement are not unique

<a id="m-ERR_NOSESSION"></a>
### ERR_NOSESSION

```java
public static final com.tailf.conf.ErrorCode ERR_NOSESSION;
```

A session must be established prior to executing the function

<a id="m-ERR_NOSTACK"></a>
### ERR_NOSTACK

```java
public static final com.tailf.conf.ErrorCode ERR_NOSTACK;
```

We tried to pop without a preceding push

<a id="m-ERR_NOT_IMPLEMENTED"></a>
### ERR_NOT_IMPLEMENTED

```java
public static final com.tailf.conf.ErrorCode ERR_NOT_IMPLEMENTED;
```

A request was made for an operation that was not implemented. This
 will typically occur if an application uses a version of ConfD/NCS
 that is more recent than the version of the Java daemon, and a CDB
 or MAAPI function is used that is only implemented in the library
 version

<a id="m-ERR_NOT_WRITABLE"></a>
### ERR_NOT_WRITABLE

```java
public static final com.tailf.conf.ErrorCode ERR_NOT_WRITABLE;
```

We tried to write an object which is not writable

<a id="m-ERR_NOTCREATABLE"></a>
### ERR_NOTCREATABLE

```java
public static final com.tailf.conf.ErrorCode ERR_NOTCREATABLE;
```

We tried to create an object which is not possible to create

<a id="m-ERR_NOTDELETABLE"></a>
### ERR_NOTDELETABLE

```java
public static final com.tailf.conf.ErrorCode ERR_NOTDELETABLE;
```

We tried to delete an object which is not possible to delete

<a id="m-ERR_NOTMOVABLE"></a>
### ERR_NOTMOVABLE

```java
public static final com.tailf.conf.ErrorCode ERR_NOTMOVABLE;
```

We tried to move an object which is not possible to move

<a id="m-ERR_NOTRANS"></a>
### ERR_NOTRANS

```java
public static final com.tailf.conf.ErrorCode ERR_NOTRANS;
```

An invalid transaction handle (tid) was passed to a Maapi method

<a id="m-ERR_NOTSET"></a>
### ERR_NOTSET

```java
public static final com.tailf.conf.ErrorCode ERR_NOTSET;
```

A mandatory leaf does not have a value, either because it has been
 deleted, or not set after a create

<a id="m-ERR_OS"></a>
### ERR_OS

```java
public static final com.tailf.conf.ErrorCode ERR_OS;
```

An error occurred in a call to some operating system function, such
 as write(). The proper errno from libc should then be read and used
 as failure indicator

<a id="m-ERR_POLICY_COMPILATION_FAILED"></a>
### ERR_POLICY_COMPILATION_FAILED

```java
public static final com.tailf.conf.ErrorCode ERR_POLICY_COMPILATION_FAILED;
```

A user-defined policy XPath expression could not be compiled

<a id="m-ERR_POLICY_EVALUATION_FAILED"></a>
### ERR_POLICY_EVALUATION_FAILED

```java
public static final com.tailf.conf.ErrorCode ERR_POLICY_EVALUATION_FAILED;
```

A user-defined policy expression failed XPath evaluation

<a id="m-ERR_POLICY_FAILED"></a>
### ERR_POLICY_FAILED

```java
public static final com.tailf.conf.ErrorCode ERR_POLICY_FAILED;
```

A user-defined policy expression evaluated to false

<a id="m-ERR_PROTOUSAGE"></a>
### ERR_PROTOUSAGE

```java
public static final com.tailf.conf.ErrorCode ERR_PROTOUSAGE;
```

Usage of API functions or callbacks was wrong. It typically means
 that we invoke a function when we should not

<a id="m-ERR_RESOURCE_DENIED"></a>
### ERR_RESOURCE_DENIED

```java
public static final com.tailf.conf.ErrorCode ERR_RESOURCE_DENIED;
```

A data provider callback returned ERRCODE_RESOURCE_DENIED

<a id="m-ERR_SERVICE_CONFLICT"></a>
### ERR_SERVICE_CONFLICT

```java
public static final com.tailf.conf.ErrorCode ERR_SERVICE_CONFLICT;
```

Conflict between NCS services

<a id="m-ERR_STALE_INSTANCE"></a>
### ERR_STALE_INSTANCE

```java
public static final com.tailf.conf.ErrorCode ERR_STALE_INSTANCE;
```

An instance-identifier has stale data after upgrading

<a id="m-ERR_START_FAILED"></a>
### ERR_START_FAILED

```java
public static final com.tailf.conf.ErrorCode ERR_START_FAILED;
```

Daemon failed to proceed to next start-phase

<a id="m-ERR_SUBAGENT_DOWN"></a>
### ERR_SUBAGENT_DOWN

```java
public static final com.tailf.conf.ErrorCode ERR_SUBAGENT_DOWN;
```

An operation towards a mounted NETCONF subagent failed due to the
 subagent not being up

<a id="m-ERR_TEMPLATE"></a>
### ERR_TEMPLATE

```java
public static final com.tailf.conf.ErrorCode ERR_TEMPLATE;
```

A template operation failed

<a id="m-ERR_TIMEOUT"></a>
### ERR_TIMEOUT

```java
public static final com.tailf.conf.ErrorCode ERR_TIMEOUT;
```

An operation did not complete within the specified timeout

<a id="m-ERR_TOO_FEW_ELEMS"></a>
### ERR_TOO_FEW_ELEMS

```java
public static final com.tailf.conf.ErrorCode ERR_TOO_FEW_ELEMS;
```

A min-elements violation. A node has fewer elements or entries than
 specified with min-elements

<a id="m-ERR_TOO_MANY_ELEMS"></a>
### ERR_TOO_MANY_ELEMS

```java
public static final com.tailf.conf.ErrorCode ERR_TOO_MANY_ELEMS;
```

A max-elements violation. A node has fewer elements or entries than
 specified with max-elements

<a id="m-ERR_TOO_MANY_SESSIONS"></a>
### ERR_TOO_MANY_SESSIONS

```java
public static final com.tailf.conf.ErrorCode ERR_TOO_MANY_SESSIONS;
```

Maximum number of sessions reached

<a id="m-ERR_TOOMANYTRANS"></a>
### ERR_TOOMANYTRANS

```java
public static final com.tailf.conf.ErrorCode ERR_TOOMANYTRANS;
```

A new MAAPI transaction was rejected since the transaction limit
 threshold was reached

<a id="m-ERR_TRANSACTION_CONFLICT"></a>
### ERR_TRANSACTION_CONFLICT

```java
public static final com.tailf.conf.ErrorCode ERR_TRANSACTION_CONFLICT;
```

A transaction conflict was detected

<a id="m-ERR_UNAVAILABLE"></a>
### ERR_UNAVAILABLE

```java
public static final com.tailf.conf.ErrorCode ERR_UNAVAILABLE;
```

We tried to use some unavailable functionality, e.g. get/set
 attributes on an operational data element

<a id="m-ERR_UNSET_CHOICE"></a>
### ERR_UNSET_CHOICE

```java
public static final com.tailf.conf.ErrorCode ERR_UNSET_CHOICE;
```

No case has been selected for a mandatory choice statement

<a id="m-ERR_UPGRADE_IN_PROGRESS"></a>
### ERR_UPGRADE_IN_PROGRESS

```java
public static final com.tailf.conf.ErrorCode ERR_UPGRADE_IN_PROGRESS;
```

A request was made for an operation that is not allowed
  when in-service data model upgrade is in progress

<a id="m-ERR_VALIDATION_WARNING"></a>
### ERR_VALIDATION_WARNING

```java
public static final com.tailf.conf.ErrorCode ERR_VALIDATION_WARNING;
```

Maapi.validateTrans() returned warnings

<a id="m-ERR_XPATH"></a>
### ERR_XPATH

```java
public static final com.tailf.conf.ErrorCode ERR_XPATH;
```

Compilation or evaluation of an XPath expression failed

<a id="m-UNDEFINED"></a>
### UNDEFINED

```java
public static final com.tailf.conf.ErrorCode UNDEFINED;
```

Error with undefined error code


## Methods

<a id="m-equalsto-426f9980372b"></a>
### equalsTo(int)

```java
public boolean equalsTo(int i)
```

**Parameters**

- `int i`

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

<a id="m-stringvalue-a6efca13ec08"></a>
### stringValue()

```java
public String stringValue()
```

<a id="m-valueof-c0d46d25fc67"></a>
### valueOf(int)

```java
public static com.tailf.conf.ErrorCode valueOf(int i)
```

Types: [ErrorCode](ErrorCode.md#cls-ErrorCode)

**Parameters**

- `int i`

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.conf.ErrorCode valueOf(String name)
```

Types: [ErrorCode](ErrorCode.md#cls-ErrorCode)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.conf.ErrorCode[] values()
```

Types: [ErrorCode](ErrorCode.md#cls-ErrorCode)
