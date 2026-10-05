# ErrorCode <a href="#errorcode-65263de08890" id="errorcode-65263de08890"></a>

```java
public enum com.tailf.conf.ErrorCode
```

Error codes for all errors delivered over the protocol.

## Members

**Enum Constants**:

- [ERR\_ABORTED](#err_aborted-59af9eb1388d)
- [ERR\_ACCESS\_DENIED](#err_access_denied-3d74c0cc0099)
- [ERR\_ALREADY\_EXISTS](#err_already_exists-79abf22f339e)
- [ERR\_APPLICATION\_INTERNAL](#err_application_internal-4ec94997d394)
- [ERR\_BAD\_CONFIG](#err_bad_config-af65f433ca30)
- [ERR\_BAD\_KEYREF](#err_bad_keyref-916390e7763a)
- [ERR\_BADPATH](#err_badpath-62910b5387e5)
- [ERR\_BADSTATE](#err_badstate-a94d084add09)
- [ERR\_BADTYPE](#err_badtype-85dc2e59850d)
- [ERR\_CLI\_CMD](#err_cli_cmd-debeb391decb)
- [ERR\_CONNECTION\_CLOSED](#err_connection_closed-1c9df1dc3d1b)
- [ERR\_CONNECTION\_REFUSED](#err_connection_refused-43846ec29c60)
- [ERR\_CONNECTION\_TIMEOUT](#err_connection_timeout-55102f344f20)
- [ERR\_DATA\_MISSING](#err_data_missing-be0502af4ca1)
- [ERR\_DEVICE](#err_device-de3fc2c6a40b)
- [ERR\_EOF](#err_eof-0a99dea0efc2)
- [ERR\_EXTERNAL](#err_external-5d87cf443f12)
- [ERR\_HA\_BADCONFIG](#err_ha_badconfig-5af4bc4515ba)
- [ERR\_HA\_BADFXS](#err_ha_badfxs-c269d14c8f36)
- [ERR\_HA\_BADNAME](#err_ha_badname-a344a853a984)
- [ERR\_HA\_BADTOKEN](#err_ha_badtoken-27327dd9e013)
- [ERR\_HA\_BADVSN](#err_ha_badvsn-2be612cfe7a9)
- [ERR\_HA\_BIND](#err_ha_bind-99f960a65f07)
- [ERR\_HA\_CLOSED](#err_ha_closed-7e938f995bc2)
- [ERR\_HA\_CONNECT](#err_ha_connect-3ca6e401ab55)
- [ERR\_HA\_NOTICK](#err_ha_notick-6141203cdf0e)
- [ERR\_HA\_WITH\_UPGRADE](#err_ha_with_upgrade-e5223eaf7303)
- [ERR\_INCONSISTENT\_VALUE](#err_inconsistent_value-45bc9f1e3ac5)
- [ERR\_INTERNAL](#err_internal-93d454233638)
- [ERR\_INUSE](#err_inuse-f18f95d4310b)
- [ERR\_INVALID\_INSTANCE](#err_invalid_instance-447310fffd70)
- [ERR\_LIB\_NOT\_INITIALIZED](#err_lib_not_initialized-ee212297182a)
- [ERR\_LOCKED](#err_locked-a910781d5e4b)
- [ERR\_MALLOC](#err_malloc-e00f14d72909)
- [ERR\_MISSING\_INSTANCE](#err_missing_instance-cd45cdce3afa)
- [ERR\_MUST\_FAILED](#err_must_failed-76031cce7f47)
- [ERR\_NOEXISTS](#err_noexists-b9683d93f5f0)
- [ERR\_NON\_UNIQUE](#err_non_unique-aaedacf6d673)
- [ERR\_NOSESSION](#err_nosession-c5f9af55ca3c)
- [ERR\_NOSTACK](#err_nostack-d4fc70919ff0)
- [ERR\_NOT\_IMPLEMENTED](#err_not_implemented-5addae1bdfda)
- [ERR\_NOT\_WRITABLE](#err_not_writable-e353124bd10b)
- [ERR\_NOTCREATABLE](#err_notcreatable-f352e0876059)
- [ERR\_NOTDELETABLE](#err_notdeletable-7e9394f8e846)
- [ERR\_NOTMOVABLE](#err_notmovable-6f92b540ab97)
- [ERR\_NOTRANS](#err_notrans-97fbae34c99e)
- [ERR\_NOTSET](#err_notset-4c3ba3d3134d)
- [ERR\_OS](#err_os-e7bf1ce95abe)
- [ERR\_POLICY\_COMPILATION\_FAILED](#err_policy_compilation_failed-741afabf4438)
- [ERR\_POLICY\_EVALUATION\_FAILED](#err_policy_evaluation_failed-f2ed8dd12366)
- [ERR\_POLICY\_FAILED](#err_policy_failed-14a70f3aebc5)
- [ERR\_PROTOUSAGE](#err_protousage-c8b4021021d3)
- [ERR\_RESOURCE\_DENIED](#err_resource_denied-a579d2920c66)
- [ERR\_SERVICE\_CONFLICT](#err_service_conflict-f63b4aa86282)
- [ERR\_STALE\_INSTANCE](#err_stale_instance-e505bcc6bf2f)
- [ERR\_START\_FAILED](#err_start_failed-9510c21b2376)
- [ERR\_SUBAGENT\_DOWN](#err_subagent_down-6295b3a0af34)
- [ERR\_TEMPLATE](#err_template-d1e24aaddc7a)
- [ERR\_TIMEOUT](#err_timeout-30a7d91b826c)
- [ERR\_TOO\_FEW\_ELEMS](#err_too_few_elems-08fe6234d470)
- [ERR\_TOO\_MANY\_ELEMS](#err_too_many_elems-81a565f7f9cf)
- [ERR\_TOO\_MANY\_SESSIONS](#err_too_many_sessions-59e0facb10a1)
- [ERR\_TOOMANYTRANS](#err_toomanytrans-e0a2a282c3d7)
- [ERR\_TRANSACTION\_CONFLICT](#err_transaction_conflict-11c72e47338e)
- [ERR\_UNAVAILABLE](#err_unavailable-f31c95a95fb3)
- [ERR\_UNSET\_CHOICE](#err_unset_choice-98f827bdb409)
- [ERR\_UPGRADE\_IN\_PROGRESS](#err_upgrade_in_progress-8b3c6da1d215)
- [ERR\_VALIDATION\_WARNING](#err_validation_warning-f9a5c6fa6582)
- [ERR\_XPATH](#err_xpath-08392d8d0592)
- [UNDEFINED](#undefined-bb3064335a5e)

**Methods**:

- [equalsTo\(int\)](#equalsto-426f9980372b)
- [getValue\(\)](#getvalue-d93864668c40)
- [stringValue\(\)](#stringvalue-a6efca13ec08)
- [valueOf\(int\)](#valueof-c0d46d25fc67)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### ERR_ABORTED <a href="#err_aborted-59af9eb1388d" id="err_aborted-59af9eb1388d"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_ABORTED;
```

An operation was aborted

### ERR_ACCESS_DENIED <a href="#err_access_denied-3d74c0cc0099" id="err_access_denied-3d74c0cc0099"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_ACCESS_DENIED;
```

Access to an object was denied due to AAA authorization rules

### ERR_ALREADY_EXISTS <a href="#err_already_exists-79abf22f339e" id="err_already_exists-79abf22f339e"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_ALREADY_EXISTS;
```

We tried to create something which already exists

### ERR_APPLICATION_INTERNAL <a href="#err_application_internal-4ec94997d394" id="err_application_internal-4ec94997d394"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_APPLICATION_INTERNAL;
```

A data provider callback returned CONFD_ERRCODE_APPLICATION_INTERNAL

### ERR_BAD_CONFIG <a href="#err_bad_config-af65f433ca30" id="err_bad_config-af65f433ca30"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_BAD_CONFIG;
```

An error in a configuration

### ERR_BAD_KEYREF <a href="#err_bad_keyref-916390e7763a" id="err_bad_keyref-916390e7763a"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_BAD_KEYREF;
```

Dangling pointer

### ERR_BADPATH <a href="#err_badpath-62910b5387e5" id="err_badpath-62910b5387e5"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_BADPATH;
```

We provided a bad path

### ERR_BADSTATE <a href="#err_badstate-a94d084add09" id="err_badstate-a94d084add09"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_BADSTATE;
```

Some function, such as the MAAPI commit functions that require
 several functions to be called in a specific order, was called out
 of order

### ERR_BADTYPE <a href="#err_badtype-85dc2e59850d" id="err_badtype-85dc2e59850d"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_BADTYPE;
```

We tried to create or write an object which is specified to have
 another type than the one we provided

### ERR_CLI_CMD <a href="#err_cli_cmd-debeb391decb" id="err_cli_cmd-debeb391decb"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_CLI_CMD;
```

Execution of a CLI command failed

### ERR_CONNECTION_CLOSED <a href="#err_connection_closed-1c9df1dc3d1b" id="err_connection_closed-1c9df1dc3d1b"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_CONNECTION_CLOSED;
```

Connection closed

### ERR_CONNECTION_REFUSED <a href="#err_connection_refused-43846ec29c60" id="err_connection_refused-43846ec29c60"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_CONNECTION_REFUSED;
```

Connection was refused

### ERR_CONNECTION_TIMEOUT <a href="#err_connection_timeout-55102f344f20" id="err_connection_timeout-55102f344f20"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_CONNECTION_TIMEOUT;
```

Connection timed out

### ERR_DATA_MISSING <a href="#err_data_missing-be0502af4ca1" id="err_data_missing-be0502af4ca1"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_DATA_MISSING;
```

A data provider callback returned ERRCODE_DATA_MISSING

### ERR_DEVICE <a href="#err_device-de3fc2c6a40b" id="err_device-de3fc2c6a40b"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_DEVICE;
```

An error occurred on the device

### ERR_EOF <a href="#err_eof-0a99dea0efc2" id="err_eof-0a99dea0efc2"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_EOF;
```

This value is used when a function returns EOF. Thus it is
 not strictly necessary to check whether the return value is
 an error or eof - if the function should return OK on
 success, but the return value is something else, the reason can
 always be found via errno

### ERR_EXTERNAL <a href="#err_external-5d87cf443f12" id="err_external-5d87cf443f12"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_EXTERNAL;
```

All errors that originate in user code

### ERR_HA_BADCONFIG <a href="#err_ha_badconfig-5af4bc4515ba" id="err_ha_badconfig-5af4bc4515ba"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_HA_BADCONFIG;
```

A remote HA node has bad configuration

### ERR_HA_BADFXS <a href="#err_ha_badfxs-c269d14c8f36" id="err_ha_badfxs-c269d14c8f36"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_HA_BADFXS;
```

A remote HA node had a different set of fxs files compared to us.
 It could also be that the set is the same, but the version of some
 fxs file is different

### ERR_HA_BADNAME <a href="#err_ha_badname-a344a853a984" id="err_ha_badname-a344a853a984"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_HA_BADNAME;
```

A remote ha node has a different name than the name we think it has

### ERR_HA_BADTOKEN <a href="#err_ha_badtoken-27327dd9e013" id="err_ha_badtoken-27327dd9e013"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_HA_BADTOKEN;
```

A remote HA node has a different token than us

### ERR_HA_BADVSN <a href="#err_ha_badvsn-2be612cfe7a9" id="err_ha_badvsn-2be612cfe7a9"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_HA_BADVSN;
```

A remote HA node had an incompatible protocol version

### ERR_HA_BIND <a href="#err_ha_bind-99f960a65f07" id="err_ha_bind-99f960a65f07"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_HA_BIND;
```

Failed to bind the ha socket for incoming HA connects

### ERR_HA_CLOSED <a href="#err_ha_closed-7e938f995bc2" id="err_ha_closed-7e938f995bc2"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_HA_CLOSED;
```

A remote HA node closed its connection to us, or there was a
 timeout waiting for a sync response from the primary during a call
 of HA.beSecondary()

### ERR_HA_CONNECT <a href="#err_ha_connect-3ca6e401ab55" id="err_ha_connect-3ca6e401ab55"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_HA_CONNECT;
```

Failed to connect to a remote HA node

### ERR_HA_NOTICK <a href="#err_ha_notick-6141203cdf0e" id="err_ha_notick-6141203cdf0e"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_HA_NOTICK;
```

A remote HA node failed to produce the interval live ticks

### ERR_HA_WITH_UPGRADE <a href="#err_ha_with_upgrade-e5223eaf7303" id="err_ha_with_upgrade-e5223eaf7303"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_HA_WITH_UPGRADE;
```

We tried to perform an in-service data model upgrade on a HA node
 that was either a primary with secondaries or a secondary, or we tried
 to make the node a HA secondary while an in-service data model upgrade
 was in progress

### ERR_INCONSISTENT_VALUE <a href="#err_inconsistent_value-45bc9f1e3ac5" id="err_inconsistent_value-45bc9f1e3ac5"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_INCONSISTENT_VALUE;
```

A data provider callback returned ERRCODE_INCONSISTENT_VALUE

### ERR_INTERNAL <a href="#err_internal-93d454233638" id="err_internal-93d454233638"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_INTERNAL;
```

An internal error. This normally indicates a bug in ConfD/NCS or
 libconfd (if nothing else the lack of a better error code), please
 report it to Tail-f support

### ERR_INUSE <a href="#err_inuse-f18f95d4310b" id="err_inuse-f18f95d4310b"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_INUSE;
```

We tried to commit while someone else holds a lock

### ERR_INVALID_INSTANCE <a href="#err_invalid_instance-447310fffd70" id="err_invalid_instance-447310fffd70"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_INVALID_INSTANCE;
```

The value of an instance-identifier leaf does not conform to the
  specified path filters

### ERR_LIB_NOT_INITIALIZED <a href="#err_lib_not_initialized-ee212297182a" id="err_lib_not_initialized-ee212297182a"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_LIB_NOT_INITIALIZED;
```

The confd has not been properly initialized

### ERR_LOCKED <a href="#err_locked-a910781d5e4b" id="err_locked-a910781d5e4b"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_LOCKED;
```

We tried to lock something which is already locked

### ERR_MALLOC <a href="#err_malloc-e00f14d72909" id="err_malloc-e00f14d72909"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_MALLOC;
```

Failed to allocate memory

### ERR_MISSING_INSTANCE <a href="#err_missing_instance-cd45cdce3afa" id="err_missing_instance-cd45cdce3afa"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_MISSING_INSTANCE;
```

The value of an instance-identifier leaf with require-instance true
 does not specify an existing instance

### ERR_MUST_FAILED <a href="#err_must_failed-76031cce7f47" id="err_must_failed-76031cce7f47"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_MUST_FAILED;
```

A must constraint is not satisfied

### ERR_NOEXISTS <a href="#err_noexists-b9683d93f5f0" id="err_noexists-b9683d93f5f0"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_NOEXISTS;
```

Typically we tried to read a value through CDB or MAAPI
  which does not exist

### ERR_NON_UNIQUE <a href="#err_non_unique-aaedacf6d673" id="err_non_unique-aaedacf6d673"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_NON_UNIQUE;
```

A group of leafs specified with the unique statement are not unique

### ERR_NOSESSION <a href="#err_nosession-c5f9af55ca3c" id="err_nosession-c5f9af55ca3c"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_NOSESSION;
```

A session must be established prior to executing the function

### ERR_NOSTACK <a href="#err_nostack-d4fc70919ff0" id="err_nostack-d4fc70919ff0"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_NOSTACK;
```

We tried to pop without a preceding push

### ERR_NOT_IMPLEMENTED <a href="#err_not_implemented-5addae1bdfda" id="err_not_implemented-5addae1bdfda"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_NOT_IMPLEMENTED;
```

A request was made for an operation that was not implemented. This
 will typically occur if an application uses a version of ConfD/NCS
 that is more recent than the version of the Java daemon, and a CDB
 or MAAPI function is used that is only implemented in the library
 version

### ERR_NOT_WRITABLE <a href="#err_not_writable-e353124bd10b" id="err_not_writable-e353124bd10b"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_NOT_WRITABLE;
```

We tried to write an object which is not writable

### ERR_NOTCREATABLE <a href="#err_notcreatable-f352e0876059" id="err_notcreatable-f352e0876059"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_NOTCREATABLE;
```

We tried to create an object which is not possible to create

### ERR_NOTDELETABLE <a href="#err_notdeletable-7e9394f8e846" id="err_notdeletable-7e9394f8e846"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_NOTDELETABLE;
```

We tried to delete an object which is not possible to delete

### ERR_NOTMOVABLE <a href="#err_notmovable-6f92b540ab97" id="err_notmovable-6f92b540ab97"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_NOTMOVABLE;
```

We tried to move an object which is not possible to move

### ERR_NOTRANS <a href="#err_notrans-97fbae34c99e" id="err_notrans-97fbae34c99e"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_NOTRANS;
```

An invalid transaction handle (tid) was passed to a Maapi method

### ERR_NOTSET <a href="#err_notset-4c3ba3d3134d" id="err_notset-4c3ba3d3134d"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_NOTSET;
```

A mandatory leaf does not have a value, either because it has been
 deleted, or not set after a create

### ERR_OS <a href="#err_os-e7bf1ce95abe" id="err_os-e7bf1ce95abe"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_OS;
```

An error occurred in a call to some operating system function, such
 as write(). The proper errno from libc should then be read and used
 as failure indicator

### ERR_POLICY_COMPILATION_FAILED <a href="#err_policy_compilation_failed-741afabf4438" id="err_policy_compilation_failed-741afabf4438"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_POLICY_COMPILATION_FAILED;
```

A user-defined policy XPath expression could not be compiled

### ERR_POLICY_EVALUATION_FAILED <a href="#err_policy_evaluation_failed-f2ed8dd12366" id="err_policy_evaluation_failed-f2ed8dd12366"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_POLICY_EVALUATION_FAILED;
```

A user-defined policy expression failed XPath evaluation

### ERR_POLICY_FAILED <a href="#err_policy_failed-14a70f3aebc5" id="err_policy_failed-14a70f3aebc5"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_POLICY_FAILED;
```

A user-defined policy expression evaluated to false

### ERR_PROTOUSAGE <a href="#err_protousage-c8b4021021d3" id="err_protousage-c8b4021021d3"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_PROTOUSAGE;
```

Usage of API functions or callbacks was wrong. It typically means
 that we invoke a function when we should not

### ERR_RESOURCE_DENIED <a href="#err_resource_denied-a579d2920c66" id="err_resource_denied-a579d2920c66"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_RESOURCE_DENIED;
```

A data provider callback returned ERRCODE_RESOURCE_DENIED

### ERR_SERVICE_CONFLICT <a href="#err_service_conflict-f63b4aa86282" id="err_service_conflict-f63b4aa86282"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_SERVICE_CONFLICT;
```

Conflict between NCS services

### ERR_STALE_INSTANCE <a href="#err_stale_instance-e505bcc6bf2f" id="err_stale_instance-e505bcc6bf2f"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_STALE_INSTANCE;
```

An instance-identifier has stale data after upgrading

### ERR_START_FAILED <a href="#err_start_failed-9510c21b2376" id="err_start_failed-9510c21b2376"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_START_FAILED;
```

Daemon failed to proceed to next start-phase

### ERR_SUBAGENT_DOWN <a href="#err_subagent_down-6295b3a0af34" id="err_subagent_down-6295b3a0af34"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_SUBAGENT_DOWN;
```

An operation towards a mounted NETCONF subagent failed due to the
 subagent not being up

### ERR_TEMPLATE <a href="#err_template-d1e24aaddc7a" id="err_template-d1e24aaddc7a"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_TEMPLATE;
```

A template operation failed

### ERR_TIMEOUT <a href="#err_timeout-30a7d91b826c" id="err_timeout-30a7d91b826c"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_TIMEOUT;
```

An operation did not complete within the specified timeout

### ERR_TOO_FEW_ELEMS <a href="#err_too_few_elems-08fe6234d470" id="err_too_few_elems-08fe6234d470"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_TOO_FEW_ELEMS;
```

A min-elements violation. A node has fewer elements or entries than
 specified with min-elements

### ERR_TOO_MANY_ELEMS <a href="#err_too_many_elems-81a565f7f9cf" id="err_too_many_elems-81a565f7f9cf"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_TOO_MANY_ELEMS;
```

A max-elements violation. A node has fewer elements or entries than
 specified with max-elements

### ERR_TOO_MANY_SESSIONS <a href="#err_too_many_sessions-59e0facb10a1" id="err_too_many_sessions-59e0facb10a1"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_TOO_MANY_SESSIONS;
```

Maximum number of sessions reached

### ERR_TOOMANYTRANS <a href="#err_toomanytrans-e0a2a282c3d7" id="err_toomanytrans-e0a2a282c3d7"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_TOOMANYTRANS;
```

A new MAAPI transaction was rejected since the transaction limit
 threshold was reached

### ERR_TRANSACTION_CONFLICT <a href="#err_transaction_conflict-11c72e47338e" id="err_transaction_conflict-11c72e47338e"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_TRANSACTION_CONFLICT;
```

A transaction conflict was detected

### ERR_UNAVAILABLE <a href="#err_unavailable-f31c95a95fb3" id="err_unavailable-f31c95a95fb3"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_UNAVAILABLE;
```

We tried to use some unavailable functionality, e.g. get/set
 attributes on an operational data element

### ERR_UNSET_CHOICE <a href="#err_unset_choice-98f827bdb409" id="err_unset_choice-98f827bdb409"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_UNSET_CHOICE;
```

No case has been selected for a mandatory choice statement

### ERR_UPGRADE_IN_PROGRESS <a href="#err_upgrade_in_progress-8b3c6da1d215" id="err_upgrade_in_progress-8b3c6da1d215"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_UPGRADE_IN_PROGRESS;
```

A request was made for an operation that is not allowed
  when in-service data model upgrade is in progress

### ERR_VALIDATION_WARNING <a href="#err_validation_warning-f9a5c6fa6582" id="err_validation_warning-f9a5c6fa6582"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_VALIDATION_WARNING;
```

Maapi.validateTrans() returned warnings

### ERR_XPATH <a href="#err_xpath-08392d8d0592" id="err_xpath-08392d8d0592"></a>

```java
public static final com.tailf.conf.ErrorCode ERR_XPATH;
```

Compilation or evaluation of an XPath expression failed

### UNDEFINED <a href="#undefined-bb3064335a5e" id="undefined-bb3064335a5e"></a>

```java
public static final com.tailf.conf.ErrorCode UNDEFINED;
```

Error with undefined error code


## Methods

### equalsTo(int) <a href="#equalsto-426f9980372b" id="equalsto-426f9980372b"></a>

```java
public boolean equalsTo(int i)
```

**Parameters**

- `int i`

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

### stringValue() <a href="#stringvalue-a6efca13ec08" id="stringvalue-a6efca13ec08"></a>

```java
public String stringValue()
```

### valueOf(int) <a href="#valueof-c0d46d25fc67" id="valueof-c0d46d25fc67"></a>

```java
public static com.tailf.conf.ErrorCode valueOf(int i)
```

Types: [ErrorCode](ErrorCode.md#errorcode-65263de08890)

**Parameters**

- `int i`

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.conf.ErrorCode valueOf(String name)
```

Types: [ErrorCode](ErrorCode.md#errorcode-65263de08890)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.conf.ErrorCode[] values()
```

Types: [ErrorCode](ErrorCode.md#errorcode-65263de08890)
