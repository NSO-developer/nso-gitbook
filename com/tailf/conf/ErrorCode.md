<a id="s-ErrorCode"></a>
# ErrorCode

```java
public enum com.tailf.conf.ErrorCode
```

Types: [ErrorCode](ErrorCode.md#s-ErrorCode)

Error codes for all errors delivered over the protocol.

**Related classes**

- [ErrorCode](ErrorCode.md#s-ErrorCode)

## Members

**Enum Constants**:

- [ERR_ABORTED](#s-ERR_ABORTED)
- [ERR_ACCESS_DENIED](#s-ERR_ACCESS_DENIED)
- [ERR_ALREADY_EXISTS](#s-ERR_ALREADY_EXISTS)
- [ERR_APPLICATION_INTERNAL](#s-ERR_APPLICATION_INTERNAL)
- [ERR_BAD_CONFIG](#s-ERR_BAD_CONFIG)
- [ERR_BAD_KEYREF](#s-ERR_BAD_KEYREF)
- [ERR_BADPATH](#s-ERR_BADPATH)
- [ERR_BADSTATE](#s-ERR_BADSTATE)
- [ERR_BADTYPE](#s-ERR_BADTYPE)
- [ERR_CLI_CMD](#s-ERR_CLI_CMD)
- [ERR_CONNECTION_CLOSED](#s-ERR_CONNECTION_CLOSED)
- [ERR_CONNECTION_REFUSED](#s-ERR_CONNECTION_REFUSED)
- [ERR_CONNECTION_TIMEOUT](#s-ERR_CONNECTION_TIMEOUT)
- [ERR_DATA_MISSING](#s-ERR_DATA_MISSING)
- [ERR_DEVICE](#s-ERR_DEVICE)
- [ERR_EOF](#s-ERR_EOF)
- [ERR_EXTERNAL](#s-ERR_EXTERNAL)
- [ERR_HA_BADCONFIG](#s-ERR_HA_BADCONFIG)
- [ERR_HA_BADFXS](#s-ERR_HA_BADFXS)
- [ERR_HA_BADNAME](#s-ERR_HA_BADNAME)
- [ERR_HA_BADTOKEN](#s-ERR_HA_BADTOKEN)
- [ERR_HA_BADVSN](#s-ERR_HA_BADVSN)
- [ERR_HA_BIND](#s-ERR_HA_BIND)
- [ERR_HA_CLOSED](#s-ERR_HA_CLOSED)
- [ERR_HA_CONNECT](#s-ERR_HA_CONNECT)
- [ERR_HA_NOTICK](#s-ERR_HA_NOTICK)
- [ERR_HA_WITH_UPGRADE](#s-ERR_HA_WITH_UPGRADE)
- [ERR_INCONSISTENT_VALUE](#s-ERR_INCONSISTENT_VALUE)
- [ERR_INTERNAL](#s-ERR_INTERNAL)
- [ERR_INUSE](#s-ERR_INUSE)
- [ERR_INVALID_INSTANCE](#s-ERR_INVALID_INSTANCE)
- [ERR_LIB_NOT_INITIALIZED](#s-ERR_LIB_NOT_INITIALIZED)
- [ERR_LOCKED](#s-ERR_LOCKED)
- [ERR_MALLOC](#s-ERR_MALLOC)
- [ERR_MISSING_INSTANCE](#s-ERR_MISSING_INSTANCE)
- [ERR_MUST_FAILED](#s-ERR_MUST_FAILED)
- [ERR_NOEXISTS](#s-ERR_NOEXISTS)
- [ERR_NON_UNIQUE](#s-ERR_NON_UNIQUE)
- [ERR_NOSESSION](#s-ERR_NOSESSION)
- [ERR_NOSTACK](#s-ERR_NOSTACK)
- [ERR_NOT_IMPLEMENTED](#s-ERR_NOT_IMPLEMENTED)
- [ERR_NOT_WRITABLE](#s-ERR_NOT_WRITABLE)
- [ERR_NOTCREATABLE](#s-ERR_NOTCREATABLE)
- [ERR_NOTDELETABLE](#s-ERR_NOTDELETABLE)
- [ERR_NOTMOVABLE](#s-ERR_NOTMOVABLE)
- [ERR_NOTRANS](#s-ERR_NOTRANS)
- [ERR_NOTSET](#s-ERR_NOTSET)
- [ERR_OS](#s-ERR_OS)
- [ERR_POLICY_COMPILATION_FAILED](#s-ERR_POLICY_COMPILATION_FAILED)
- [ERR_POLICY_EVALUATION_FAILED](#s-ERR_POLICY_EVALUATION_FAILED)
- [ERR_POLICY_FAILED](#s-ERR_POLICY_FAILED)
- [ERR_PROTOUSAGE](#s-ERR_PROTOUSAGE)
- [ERR_RESOURCE_DENIED](#s-ERR_RESOURCE_DENIED)
- [ERR_SERVICE_CONFLICT](#s-ERR_SERVICE_CONFLICT)
- [ERR_STALE_INSTANCE](#s-ERR_STALE_INSTANCE)
- [ERR_START_FAILED](#s-ERR_START_FAILED)
- [ERR_SUBAGENT_DOWN](#s-ERR_SUBAGENT_DOWN)
- [ERR_TEMPLATE](#s-ERR_TEMPLATE)
- [ERR_TIMEOUT](#s-ERR_TIMEOUT)
- [ERR_TOO_FEW_ELEMS](#s-ERR_TOO_FEW_ELEMS)
- [ERR_TOO_MANY_ELEMS](#s-ERR_TOO_MANY_ELEMS)
- [ERR_TOO_MANY_SESSIONS](#s-ERR_TOO_MANY_SESSIONS)
- [ERR_TOOMANYTRANS](#s-ERR_TOOMANYTRANS)
- [ERR_TRANSACTION_CONFLICT](#s-ERR_TRANSACTION_CONFLICT)
- [ERR_UNAVAILABLE](#s-ERR_UNAVAILABLE)
- [ERR_UNSET_CHOICE](#s-ERR_UNSET_CHOICE)
- [ERR_UPGRADE_IN_PROGRESS](#s-ERR_UPGRADE_IN_PROGRESS)
- [ERR_VALIDATION_WARNING](#s-ERR_VALIDATION_WARNING)
- [ERR_XPATH](#s-ERR_XPATH)
- [UNDEFINED](#s-UNDEFINED)

**Methods**:

- [equalsTo(int)](#s-equalsTo)
- [getValue()](#s-getValue)
- [stringValue()](#s-stringValue)
- [valueOf(int)](#s-valueOf)
- [valueOf(String)](#s-valueOf-1)
- [values()](#s-values)

## Enum Constants

<a id="s-ERR_ABORTED"></a>
### ERR_ABORTED

```java
public static final com.tailf.conf.ErrorCode ERR_ABORTED;
```

An operation was aborted

<a id="s-ERR_ACCESS_DENIED"></a>
### ERR_ACCESS_DENIED

```java
public static final com.tailf.conf.ErrorCode ERR_ACCESS_DENIED;
```

Access to an object was denied due to AAA authorization rules

<a id="s-ERR_ALREADY_EXISTS"></a>
### ERR_ALREADY_EXISTS

```java
public static final com.tailf.conf.ErrorCode ERR_ALREADY_EXISTS;
```

We tried to create something which already exists

<a id="s-ERR_APPLICATION_INTERNAL"></a>
### ERR_APPLICATION_INTERNAL

```java
public static final com.tailf.conf.ErrorCode ERR_APPLICATION_INTERNAL;
```

A data provider callback returned CONFD_ERRCODE_APPLICATION_INTERNAL

<a id="s-ERR_BAD_CONFIG"></a>
### ERR_BAD_CONFIG

```java
public static final com.tailf.conf.ErrorCode ERR_BAD_CONFIG;
```

An error in a configuration

<a id="s-ERR_BAD_KEYREF"></a>
### ERR_BAD_KEYREF

```java
public static final com.tailf.conf.ErrorCode ERR_BAD_KEYREF;
```

Dangling pointer

<a id="s-ERR_BADPATH"></a>
### ERR_BADPATH

```java
public static final com.tailf.conf.ErrorCode ERR_BADPATH;
```

We provided a bad path

<a id="s-ERR_BADSTATE"></a>
### ERR_BADSTATE

```java
public static final com.tailf.conf.ErrorCode ERR_BADSTATE;
```

Some function, such as the MAAPI commit functions that require
 several functions to be called in a specific order, was called out
 of order

<a id="s-ERR_BADTYPE"></a>
### ERR_BADTYPE

```java
public static final com.tailf.conf.ErrorCode ERR_BADTYPE;
```

We tried to create or write an object which is specified to have
 another type than the one we provided

<a id="s-ERR_CLI_CMD"></a>
### ERR_CLI_CMD

```java
public static final com.tailf.conf.ErrorCode ERR_CLI_CMD;
```

Execution of a CLI command failed

<a id="s-ERR_CONNECTION_CLOSED"></a>
### ERR_CONNECTION_CLOSED

```java
public static final com.tailf.conf.ErrorCode ERR_CONNECTION_CLOSED;
```

Connection closed

<a id="s-ERR_CONNECTION_REFUSED"></a>
### ERR_CONNECTION_REFUSED

```java
public static final com.tailf.conf.ErrorCode ERR_CONNECTION_REFUSED;
```

Connection was refused

<a id="s-ERR_CONNECTION_TIMEOUT"></a>
### ERR_CONNECTION_TIMEOUT

```java
public static final com.tailf.conf.ErrorCode ERR_CONNECTION_TIMEOUT;
```

Connection timed out

<a id="s-ERR_DATA_MISSING"></a>
### ERR_DATA_MISSING

```java
public static final com.tailf.conf.ErrorCode ERR_DATA_MISSING;
```

A data provider callback returned ERRCODE_DATA_MISSING

<a id="s-ERR_DEVICE"></a>
### ERR_DEVICE

```java
public static final com.tailf.conf.ErrorCode ERR_DEVICE;
```

An error occurred on the device

<a id="s-ERR_EOF"></a>
### ERR_EOF

```java
public static final com.tailf.conf.ErrorCode ERR_EOF;
```

This value is used when a function returns EOF. Thus it is
 not strictly necessary to check whether the return value is
 an error or eof - if the function should return OK on
 success, but the return value is something else, the reason can
 always be found via errno

<a id="s-ERR_EXTERNAL"></a>
### ERR_EXTERNAL

```java
public static final com.tailf.conf.ErrorCode ERR_EXTERNAL;
```

All errors that originate in user code

<a id="s-ERR_HA_BADCONFIG"></a>
### ERR_HA_BADCONFIG

```java
public static final com.tailf.conf.ErrorCode ERR_HA_BADCONFIG;
```

A remote HA node has bad configuration

<a id="s-ERR_HA_BADFXS"></a>
### ERR_HA_BADFXS

```java
public static final com.tailf.conf.ErrorCode ERR_HA_BADFXS;
```

A remote HA node had a different set of fxs files compared to us.
 It could also be that the set is the same, but the version of some
 fxs file is different

<a id="s-ERR_HA_BADNAME"></a>
### ERR_HA_BADNAME

```java
public static final com.tailf.conf.ErrorCode ERR_HA_BADNAME;
```

A remote ha node has a different name than the name we think it has

<a id="s-ERR_HA_BADTOKEN"></a>
### ERR_HA_BADTOKEN

```java
public static final com.tailf.conf.ErrorCode ERR_HA_BADTOKEN;
```

A remote HA node has a different token than us

<a id="s-ERR_HA_BADVSN"></a>
### ERR_HA_BADVSN

```java
public static final com.tailf.conf.ErrorCode ERR_HA_BADVSN;
```

A remote HA node had an incompatible protocol version

<a id="s-ERR_HA_BIND"></a>
### ERR_HA_BIND

```java
public static final com.tailf.conf.ErrorCode ERR_HA_BIND;
```

Failed to bind the ha socket for incoming HA connects

<a id="s-ERR_HA_CLOSED"></a>
### ERR_HA_CLOSED

```java
public static final com.tailf.conf.ErrorCode ERR_HA_CLOSED;
```

A remote HA node closed its connection to us, or there was a
 timeout waiting for a sync response from the primary during a call
 of HA.beSecondary()

<a id="s-ERR_HA_CONNECT"></a>
### ERR_HA_CONNECT

```java
public static final com.tailf.conf.ErrorCode ERR_HA_CONNECT;
```

Failed to connect to a remote HA node

<a id="s-ERR_HA_NOTICK"></a>
### ERR_HA_NOTICK

```java
public static final com.tailf.conf.ErrorCode ERR_HA_NOTICK;
```

A remote HA node failed to produce the interval live ticks

<a id="s-ERR_HA_WITH_UPGRADE"></a>
### ERR_HA_WITH_UPGRADE

```java
public static final com.tailf.conf.ErrorCode ERR_HA_WITH_UPGRADE;
```

We tried to perform an in-service data model upgrade on a HA node
 that was either a primary with secondaries or a secondary, or we tried
 to make the node a HA secondary while an in-service data model upgrade
 was in progress

<a id="s-ERR_INCONSISTENT_VALUE"></a>
### ERR_INCONSISTENT_VALUE

```java
public static final com.tailf.conf.ErrorCode ERR_INCONSISTENT_VALUE;
```

A data provider callback returned ERRCODE_INCONSISTENT_VALUE

<a id="s-ERR_INTERNAL"></a>
### ERR_INTERNAL

```java
public static final com.tailf.conf.ErrorCode ERR_INTERNAL;
```

An internal error. This normally indicates a bug in ConfD/NCS or
 libconfd (if nothing else the lack of a better error code), please
 report it to Tail-f support

<a id="s-ERR_INUSE"></a>
### ERR_INUSE

```java
public static final com.tailf.conf.ErrorCode ERR_INUSE;
```

We tried to commit while someone else holds a lock

<a id="s-ERR_INVALID_INSTANCE"></a>
### ERR_INVALID_INSTANCE

```java
public static final com.tailf.conf.ErrorCode ERR_INVALID_INSTANCE;
```

The value of an instance-identifier leaf does not conform to the
  specified path filters

<a id="s-ERR_LIB_NOT_INITIALIZED"></a>
### ERR_LIB_NOT_INITIALIZED

```java
public static final com.tailf.conf.ErrorCode ERR_LIB_NOT_INITIALIZED;
```

The confd has not been properly initialized

<a id="s-ERR_LOCKED"></a>
### ERR_LOCKED

```java
public static final com.tailf.conf.ErrorCode ERR_LOCKED;
```

We tried to lock something which is already locked

<a id="s-ERR_MALLOC"></a>
### ERR_MALLOC

```java
public static final com.tailf.conf.ErrorCode ERR_MALLOC;
```

Failed to allocate memory

<a id="s-ERR_MISSING_INSTANCE"></a>
### ERR_MISSING_INSTANCE

```java
public static final com.tailf.conf.ErrorCode ERR_MISSING_INSTANCE;
```

The value of an instance-identifier leaf with require-instance true
 does not specify an existing instance

<a id="s-ERR_MUST_FAILED"></a>
### ERR_MUST_FAILED

```java
public static final com.tailf.conf.ErrorCode ERR_MUST_FAILED;
```

A must constraint is not satisfied

<a id="s-ERR_NOEXISTS"></a>
### ERR_NOEXISTS

```java
public static final com.tailf.conf.ErrorCode ERR_NOEXISTS;
```

Typically we tried to read a value through CDB or MAAPI
  which does not exist

<a id="s-ERR_NON_UNIQUE"></a>
### ERR_NON_UNIQUE

```java
public static final com.tailf.conf.ErrorCode ERR_NON_UNIQUE;
```

A group of leafs specified with the unique statement are not unique

<a id="s-ERR_NOSESSION"></a>
### ERR_NOSESSION

```java
public static final com.tailf.conf.ErrorCode ERR_NOSESSION;
```

A session must be established prior to executing the function

<a id="s-ERR_NOSTACK"></a>
### ERR_NOSTACK

```java
public static final com.tailf.conf.ErrorCode ERR_NOSTACK;
```

We tried to pop without a preceding push

<a id="s-ERR_NOT_IMPLEMENTED"></a>
### ERR_NOT_IMPLEMENTED

```java
public static final com.tailf.conf.ErrorCode ERR_NOT_IMPLEMENTED;
```

A request was made for an operation that was not implemented. This
 will typically occur if an application uses a version of ConfD/NCS
 that is more recent than the version of the Java daemon, and a CDB
 or MAAPI function is used that is only implemented in the library
 version

<a id="s-ERR_NOT_WRITABLE"></a>
### ERR_NOT_WRITABLE

```java
public static final com.tailf.conf.ErrorCode ERR_NOT_WRITABLE;
```

We tried to write an object which is not writable

<a id="s-ERR_NOTCREATABLE"></a>
### ERR_NOTCREATABLE

```java
public static final com.tailf.conf.ErrorCode ERR_NOTCREATABLE;
```

We tried to create an object which is not possible to create

<a id="s-ERR_NOTDELETABLE"></a>
### ERR_NOTDELETABLE

```java
public static final com.tailf.conf.ErrorCode ERR_NOTDELETABLE;
```

We tried to delete an object which is not possible to delete

<a id="s-ERR_NOTMOVABLE"></a>
### ERR_NOTMOVABLE

```java
public static final com.tailf.conf.ErrorCode ERR_NOTMOVABLE;
```

We tried to move an object which is not possible to move

<a id="s-ERR_NOTRANS"></a>
### ERR_NOTRANS

```java
public static final com.tailf.conf.ErrorCode ERR_NOTRANS;
```

An invalid transaction handle (tid) was passed to a Maapi method

<a id="s-ERR_NOTSET"></a>
### ERR_NOTSET

```java
public static final com.tailf.conf.ErrorCode ERR_NOTSET;
```

A mandatory leaf does not have a value, either because it has been
 deleted, or not set after a create

<a id="s-ERR_OS"></a>
### ERR_OS

```java
public static final com.tailf.conf.ErrorCode ERR_OS;
```

An error occurred in a call to some operating system function, such
 as write(). The proper errno from libc should then be read and used
 as failure indicator

<a id="s-ERR_POLICY_COMPILATION_FAILED"></a>
### ERR_POLICY_COMPILATION_FAILED

```java
public static final com.tailf.conf.ErrorCode ERR_POLICY_COMPILATION_FAILED;
```

A user-defined policy XPath expression could not be compiled

<a id="s-ERR_POLICY_EVALUATION_FAILED"></a>
### ERR_POLICY_EVALUATION_FAILED

```java
public static final com.tailf.conf.ErrorCode ERR_POLICY_EVALUATION_FAILED;
```

A user-defined policy expression failed XPath evaluation

<a id="s-ERR_POLICY_FAILED"></a>
### ERR_POLICY_FAILED

```java
public static final com.tailf.conf.ErrorCode ERR_POLICY_FAILED;
```

A user-defined policy expression evaluated to false

<a id="s-ERR_PROTOUSAGE"></a>
### ERR_PROTOUSAGE

```java
public static final com.tailf.conf.ErrorCode ERR_PROTOUSAGE;
```

Usage of API functions or callbacks was wrong. It typically means
 that we invoke a function when we should not

<a id="s-ERR_RESOURCE_DENIED"></a>
### ERR_RESOURCE_DENIED

```java
public static final com.tailf.conf.ErrorCode ERR_RESOURCE_DENIED;
```

A data provider callback returned ERRCODE_RESOURCE_DENIED

<a id="s-ERR_SERVICE_CONFLICT"></a>
### ERR_SERVICE_CONFLICT

```java
public static final com.tailf.conf.ErrorCode ERR_SERVICE_CONFLICT;
```

Conflict between NCS services

<a id="s-ERR_STALE_INSTANCE"></a>
### ERR_STALE_INSTANCE

```java
public static final com.tailf.conf.ErrorCode ERR_STALE_INSTANCE;
```

An instance-identifier has stale data after upgrading

<a id="s-ERR_START_FAILED"></a>
### ERR_START_FAILED

```java
public static final com.tailf.conf.ErrorCode ERR_START_FAILED;
```

Daemon failed to proceed to next start-phase

<a id="s-ERR_SUBAGENT_DOWN"></a>
### ERR_SUBAGENT_DOWN

```java
public static final com.tailf.conf.ErrorCode ERR_SUBAGENT_DOWN;
```

An operation towards a mounted NETCONF subagent failed due to the
 subagent not being up

<a id="s-ERR_TEMPLATE"></a>
### ERR_TEMPLATE

```java
public static final com.tailf.conf.ErrorCode ERR_TEMPLATE;
```

A template operation failed

<a id="s-ERR_TIMEOUT"></a>
### ERR_TIMEOUT

```java
public static final com.tailf.conf.ErrorCode ERR_TIMEOUT;
```

An operation did not complete within the specified timeout

<a id="s-ERR_TOO_FEW_ELEMS"></a>
### ERR_TOO_FEW_ELEMS

```java
public static final com.tailf.conf.ErrorCode ERR_TOO_FEW_ELEMS;
```

A min-elements violation. A node has fewer elements or entries than
 specified with min-elements

<a id="s-ERR_TOO_MANY_ELEMS"></a>
### ERR_TOO_MANY_ELEMS

```java
public static final com.tailf.conf.ErrorCode ERR_TOO_MANY_ELEMS;
```

A max-elements violation. A node has fewer elements or entries than
 specified with max-elements

<a id="s-ERR_TOO_MANY_SESSIONS"></a>
### ERR_TOO_MANY_SESSIONS

```java
public static final com.tailf.conf.ErrorCode ERR_TOO_MANY_SESSIONS;
```

Maximum number of sessions reached

<a id="s-ERR_TOOMANYTRANS"></a>
### ERR_TOOMANYTRANS

```java
public static final com.tailf.conf.ErrorCode ERR_TOOMANYTRANS;
```

A new MAAPI transaction was rejected since the transaction limit
 threshold was reached

<a id="s-ERR_TRANSACTION_CONFLICT"></a>
### ERR_TRANSACTION_CONFLICT

```java
public static final com.tailf.conf.ErrorCode ERR_TRANSACTION_CONFLICT;
```

A transaction conflict was detected

<a id="s-ERR_UNAVAILABLE"></a>
### ERR_UNAVAILABLE

```java
public static final com.tailf.conf.ErrorCode ERR_UNAVAILABLE;
```

We tried to use some unavailable functionality, e.g. get/set
 attributes on an operational data element

<a id="s-ERR_UNSET_CHOICE"></a>
### ERR_UNSET_CHOICE

```java
public static final com.tailf.conf.ErrorCode ERR_UNSET_CHOICE;
```

No case has been selected for a mandatory choice statement

<a id="s-ERR_UPGRADE_IN_PROGRESS"></a>
### ERR_UPGRADE_IN_PROGRESS

```java
public static final com.tailf.conf.ErrorCode ERR_UPGRADE_IN_PROGRESS;
```

A request was made for an operation that is not allowed
  when in-service data model upgrade is in progress

<a id="s-ERR_VALIDATION_WARNING"></a>
### ERR_VALIDATION_WARNING

```java
public static final com.tailf.conf.ErrorCode ERR_VALIDATION_WARNING;
```

Maapi.validateTrans() returned warnings

<a id="s-ERR_XPATH"></a>
### ERR_XPATH

```java
public static final com.tailf.conf.ErrorCode ERR_XPATH;
```

Compilation or evaluation of an XPath expression failed

<a id="s-UNDEFINED"></a>
### UNDEFINED

```java
public static final com.tailf.conf.ErrorCode UNDEFINED;
```

Error with undefined error code


## Methods

<a id="s-equalsTo"></a>
### equalsTo(int)

```java
public boolean equalsTo(int i)
```

**Parameters**

- `int i`

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

<a id="s-stringValue"></a>
### stringValue()

```java
public String stringValue()
```

<a id="s-valueOf"></a>
### valueOf(int)

```java
public static com.tailf.conf.ErrorCode valueOf(int i)
```

Types: [ErrorCode](ErrorCode.md#s-ErrorCode)

**Parameters**

- `int i`

<a id="s-valueOf-1"></a>
### valueOf(String)

```java
public static com.tailf.conf.ErrorCode valueOf(String name)
```

Types: [ErrorCode](ErrorCode.md#s-ErrorCode)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.conf.ErrorCode[] values()
```

Types: [ErrorCode](ErrorCode.md#s-ErrorCode)
