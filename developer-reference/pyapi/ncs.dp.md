# Python ncs.dp Module

Callback module for connecting data providers to ConfD/NCS.

## Functions

### return_worker_socket

```python
return_worker_socket(state, key)
```

Return worker socket associated with a worker thread from Daemon/state.

Return worker socket to pool.

### take_worker_socket

```python
take_worker_socket(state, name, key=None)
```

Take worker socket associated with a worker thread from Daemon/state.

Take worker socket from pool, must be returned with
dp.return_worker_socket after use.


## Classes

### _class_ **Action**

Action callback.

This class makes it easy to create and register action callbacks by
sub-classing it and implementing cb_action in the derived class.

```python
Action(daemon, actionpoint, log=None, init_args=None)
```

Initialize this object.

The 'daemon' argument should be a Daemon instance. 'actionpoint'
is the name of the tailf:actionpoint to manage. 'log' can be any
log object, and if not set the Daemon logger will be used.
'init_args' may be any object that will be passed into init()
when this object is constructed. Lastly, the low-level function
dp.register_action_cbs() will be called.

When using this class together with ncs.application.Application
there is no need to manually initialize this object as it is
done by the Application.register_action() method.

Arguments:

* daemon -- Daemon instance (dp.Daemon)
* actionpoint -- actionpoint name (str)
* log -- logging object (optional)
* init_args -- additional arguments (optional)

Members:

<details>

<summary>action(...)</summary>

Static method:

```python
action(fn)
```

Decorator for the cb_action callback.

Only use this decorator for actions of tailf:action type.

Using this decorator alters the signature of the cb_action callback
and passes in maagic.Node objects for input and output action data.

Example of a decorated cb_action:

    @Action.action
    def cb_action(self, uinfo, name, kp, input, output, trans):
        pass

Callback arguments:

* uinfo -- a UserInfo object
* name -- the tailf:action name (string)
* kp -- the keypath of the action (HKeypathRef)
* input -- input node (maagic.Node)
* output -- output node (maagic.Node)
* trans -- read only transaction, same as action transaction if
           executed with an action context (maapi.Transaction)

</details>

<details>

<summary>cb_init(...)</summary>

Method:

```python
cb_init(self, uinfo)
```

The cb_init callback must always be implemented.

This default implementation will associate a new worker socket
with this callback.

</details>

<details>

<summary>init(...)</summary>

Method:

```python
init(self, init_args)
```

Custom initialization.

When registering an action using ncs.application.Application this
method will be called with the 'init_args' passed into the
register_action() function.

</details>

<details>

<summary>rpc(...)</summary>

Static method:

```python
rpc(fn)
```

Decorator for the cb_action callback.

Only use this decorator for rpc:s.

Using this decorator alters the signature of the cb_action callback
and passes in maagic.Node objects for input and output action data.

Example of a decorated cb_action:

    @Action.rpc
    def cb_action(self, uinfo, name, input, output):
        pass

Callback arguments:

* uinfo -- a UserInfo object
* name -- the rpc name (string)
* input -- input node (maagic.Node)
* output -- output node (maagic.Node)

</details>

<details>

<summary>start(...)</summary>

Method:

```python
start(self)
```

Custom actionpoint start triggered when Python VM starts up.

</details>

<details>

<summary>stop(...)</summary>

Method:

```python
stop(self)
```

Custom actionpoint stop triggered when Python VM shuts down.

</details>

### _class_ **Daemon**

Manage a data provider connection towards ConfD/NCS.

```python
Daemon(name, log=None, ip='127.0.0.1', port=4569, path=None, state_mgr=None)
```

Initialize a Daemon object.

The 'name' argument should be unique. It will show up in the
CLI and in error messages. All other arguments are optional.
Argument 'log' can be any log object, and if not set the standard
logging mechanism will be used. Set 'ip' and 'port' to
where your Confd/NCS server is. 'path' is a filename to a unix
domain socket to be used in place of 'ip' and 'port'. If 'path'
is provided, 'ip' and 'port' arguments are ignored.

Daemon supports automatic restarting in case of error if a
state manager is provided using the state_mgr parameter.

Members:

<details>

<summary>INIT_RETRY_INTERVAL_S</summary>

```python
INIT_RETRY_INTERVAL_S = 1
```


</details>

<details>

<summary>ctx(...)</summary>

Method:

```python
ctx(self)
```

Return the daemon context.

</details>

<details>

<summary>daemon</summary>

A boolean value indicating whether this thread is a daemon thread.

This must be set before start() is called, otherwise RuntimeError is
raised. Its initial value is inherited from the creating thread; the
main thread is not a daemon thread and therefore all threads created in
the main thread default to daemon = False.

The entire Python program exits when only daemon threads are left.

</details>

<details>

<summary>finish(...)</summary>

Method:

```python
finish(self)
```

Stop the daemon thread.

</details>

<details>

<summary>getName(...)</summary>

Method:

```python
getName(self)
```

Return a string used for identification purposes only.

This method is deprecated, use the name attribute instead.

</details>

<details>

<summary>ident</summary>

_Readonly property_

Thread identifier of this thread or None if it has not been started.

This is a nonzero integer. See the get_ident() function. Thread
identifiers may be recycled when a thread exits and another thread is
created. The identifier is available even after the thread has exited.

</details>

<details>

<summary>ip(...)</summary>

Method:

```python
ip(self)
```

Return the ip address.

</details>

<details>

<summary>isDaemon(...)</summary>

Method:

```python
isDaemon(self)
```

Return whether this thread is a daemon.

This method is deprecated, use the daemon attribute instead.

</details>

<details>

<summary>is_alive(...)</summary>

Method:

```python
is_alive(self)
```

Return whether the thread is alive.

This method returns True just before the run() method starts until just
after the run() method terminates. See also the module function
enumerate().

</details>

<details>

<summary>join(...)</summary>

Method:

```python
join(self, timeout=None)
```

Wait until the thread terminates.

This blocks the calling thread until the thread whose join() method is
called terminates -- either normally or through an unhandled exception
or until the optional timeout occurs.

When the timeout argument is present and not None, it should be a
floating-point number specifying a timeout for the operation in seconds
(or fractions thereof). As join() always returns None, you must call
is_alive() after join() to decide whether a timeout happened -- if the
thread is still alive, the join() call timed out.

When the timeout argument is not present or None, the operation will
block until the thread terminates.

A thread can be join()ed many times.

join() raises a RuntimeError if an attempt is made to join the current
thread as that would cause a deadlock. It is also an error to join() a
thread before it has been started and attempts to do so raises the same
exception.

</details>

<details>

<summary>load_schemas(...)</summary>

Method:

```python
load_schemas(self)
```

Load schema information into the process memory.

</details>

<details>

<summary>name</summary>

A string used for identification purposes only.

It has no semantics. Multiple threads may be given the same name. The
initial name is set by the constructor.

</details>

<details>

<summary>native_id</summary>

_Readonly property_

Native integral thread ID of this thread, or None if it has not been started.

This is a non-negative integer. See the get_native_id() function.
This represents the Thread ID as reported by the kernel.

</details>

<details>

<summary>path(...)</summary>

Method:

```python
path(self)
```

Return the unix domain socket path.

</details>

<details>

<summary>port(...)</summary>

Method:

```python
port(self)
```

Return the port.

</details>

<details>

<summary>register_trans_cb(...)</summary>

Method:

```python
register_trans_cb(self, trans_cb_cls=<class 'ncs.dp.TransactionCallback'>)
```

Register a transaction callback class.

It's not necessary to call this method. Only do that if a custom
transaction callback will be used.

</details>

<details>

<summary>register_trans_validate_cb(...)</summary>

Method:

```python
register_trans_validate_cb(self, trans_validate_cb_cls=<class 'ncs.dp.TransValidateCallback'>)
```

Register a transaction validation callback class.

It's not necessary to call this method. Only do that if a custom
transaction callback will be used.

</details>

<details>

<summary>run(...)</summary>

Method:

```python
run(self)
```

Daemon thread processing loop.

Don't call this method explicitly. It handles reading of control
and worker sockets and notifying ConfD/NCS that it should continue
processing by calling the low-level function dp.fd_ready().
If the connection towards ConfD/NCS is broken or if finish() is
explicitly called, this function (and the thread) will end.

</details>

<details>

<summary>setDaemon(...)</summary>

Method:

```python
setDaemon(self, daemonic)
```

Set whether this thread is a daemon.

This method is deprecated, use the .daemon property instead.

</details>

<details>

<summary>setName(...)</summary>

Method:

```python
setName(self, name)
```

Set the name string for this thread.

This method is deprecated, use the name attribute instead.

</details>

<details>

<summary>start(...)</summary>

Method:

```python
start(self)
```

Start daemon work thread.

After registering any callbacks (action, services and such), call
this function to start processing. The low-level function
dp.register_done() will be called before the thread is started.

</details>

<details>

<summary>wsock</summary>

_Readonly property_


</details>

### _class_ **StateManager**

Base class for state managers used with Daemon

```python
StateManager(log)
```

Members:

<details>

<summary>setup(...)</summary>

Method:

```python
setup(self, state, previous_state)
```

Not Implemented.

</details>

<details>

<summary>teardown(...)</summary>

Method:

```python
teardown(self, state, finished)
```

Not Implemented.

</details>

### _class_ **TransValidateCallback**

Default transaction validation callback implementation class.

When registering validation points in ConfD/NCS a transaction
validation callback handler must be provided. This class is a
generic implementation of such a handler. It implements the
required callbacks 'cb_init' and 'cb_stop'.

```python
TransValidateCallback(state)
```

Initialize a TransValidateCallback object.

The argument 'state' is the dict representation of a daemon.

Members:

<details>

<summary>cb_init(...)</summary>

Method:

```python
cb_init(self, tctx)
```

The cb_init callback must always be implemented.

It is required to prepare for future validation
callbacks. This default implementation allocates a worker
thread and socket pair and associates it with the transaction.

</details>

<details>

<summary>cb_stop(...)</summary>

Method:

```python
cb_stop(self, tctx)
```

The cb_stop callback must always be implemented.

Clean up resources previously allocated in the cb_init
callback. This default implementation returnes the worker
thread and socket pair to the pool of workers.

</details>

### _class_ **TransactionCallback**

Default transaction callback implementation class.

When connecting data providers to ConfD/NCS a transaction callback
handler must be provided. This class is a generic implementation of
such a handler. It implements the only required callback 'cb_init'.

```python
TransactionCallback(state)
```

Initialize a TransactionCallback object.

The argument 'wsock' is the connected worker socket and 'log'
is a log object.

Members:

<details>

<summary>cb_finish(...)</summary>

Method:

```python
cb_finish(self, tctx)
```

The cb_finish callback of TransactionCallback.

This implementation returns worker socket associated with a
worker thread from Daemon/state.

</details>

<details>

<summary>cb_init(...)</summary>

Method:

```python
cb_init(self, tctx)
```

The cb_init callback must always be implemented.

It is required to prepare for future read/write operations towards
the data source. This default implementation associates a worker
socket with a transaction.

</details>

### _class_ **ValidationError**

Exception raised to indicate a failed validation
    

```python
ValidationError(message)
```

Members:

<details>

<summary>add_note(...)</summary>

Method:

Exception.add_note(note) --
add a note to the exception

</details>

<details>

<summary>args</summary>


</details>

<details>

<summary>with_traceback(...)</summary>

Method:

Exception.with_traceback(tb) --
set self.__traceback__ to tb and return self.

</details>

### _class_ **ValidationPoint**

Validation Point callback.

This class makes it easy to create and register validation point
callbacks by subclassing it and implementing cb_validate with the
@validate or @validate_with_trans decorator.

```python
ValidationPoint(daemon, validationpoint, log=None, init_args=None)
```

Members:

<details>

<summary>init(...)</summary>

Method:

```python
init(self, init_args)
```

Custom initialization.

When registering a validation point using
ncs.application.Application this method will be called with
the 'init_args' passed into the register_validation()
function.

</details>

<details>

<summary>start(...)</summary>

Method:

```python
start(self)
```

Start ValidationPoint

</details>

<details>

<summary>stop(...)</summary>

Method:

```python
stop(self)
```

Stop ValidationPoint

</details>

<details>

<summary>validate(...)</summary>

Static method:

```python
validate(fn)
```

Decorator for the cb_validate callback.

Using this decorator alters the signature of the cb_validate
callback and passes in the validationpoint as the last
argument.

In addition it logs unhandled exceptions, handles
ValidationError exception setting the transaction error and
returns _tm.CONFD_ERR.

Example of a decorated cb_validate:

    @ValidationPoint.validate
    def cb_validate(self, tctx, keypath, value, validationpoint):
        pass

Callback arguments:

* tctx - transaction context (TransCtxRef)
* kp -- path to the node being validated (HKeypathRef)
* value -- new value of keypath (Value)
* validationpoint - name of the validation point (str)

</details>

<details>

<summary>validate_with_trans(...)</summary>

Static method:

```python
validate_with_trans(fn)
```

Decorator for the cb_validate callback.

Using this decorator alters the signature of the cb_validate
callback and passes in root node attached to the transaction
being validated and the validationpoint as the last argument.

In addition it logs unhandled exceptions, handles
ValidationError exception setting the transaction error and
returns _tm.CONFD_ERR.

Example of a decorated cb_validate:

    @ValidationPoint.validate_with_trans
    def cb_validate(self, tctx, root, kp, value, validationpoint):
        pass

Callback arguments:

* tctx - transaction context (TransCtxRef)
* root -- root node (maagic.Root)
* kp -- path to the node being validated (HKeypathRef)
* value -- new value of keypath (Value)
* validationpoint - name of the validation point (str)

</details>

## Predefined Values

```python

ACCESS_CHK_DESCENDANT = 1024
ACCESS_CHK_FINAL = 512
ACCESS_CHK_INTERMEDIATE = 256
ACCESS_OP_CREATE = 4
ACCESS_OP_DELETE = 16
ACCESS_OP_EXECUTE = 2
ACCESS_OP_READ = 1
ACCESS_OP_UPDATE = 8
ACCESS_OP_WRITE = 32
ACCESS_RESULT_ACCEPT = 0
ACCESS_RESULT_CONTINUE = 2
ACCESS_RESULT_DEFAULT = 3
ACCESS_RESULT_REJECT = 1
BAD_VALUE_BAD_KEY_TAG = 32
BAD_VALUE_BAD_LEXICAL = 19
BAD_VALUE_BAD_TAG = 21
BAD_VALUE_BAD_VALUE = 20
BAD_VALUE_CUSTOM_FACET_ERROR_MESSAGE = 16
BAD_VALUE_ENUMERATION = 11
BAD_VALUE_FRACTION_DIGITS = 3
BAD_VALUE_INVALID_FACET = 18
BAD_VALUE_INVALID_REGEX = 9
BAD_VALUE_INVALID_TYPE_NAME = 23
BAD_VALUE_INVALID_UTF8 = 38
BAD_VALUE_INVALID_XPATH = 34
BAD_VALUE_INVALID_XPATH_AT_TAG = 40
BAD_VALUE_INVALID_XPATH_PATH = 39
BAD_VALUE_LENGTH = 15
BAD_VALUE_MAX_EXCLUSIVE = 5
BAD_VALUE_MAX_INCLUSIVE = 6
BAD_VALUE_MAX_LENGTH = 14
BAD_VALUE_MIN_EXCLUSIVE = 7
BAD_VALUE_MIN_INCLUSIVE = 8
BAD_VALUE_MIN_LENGTH = 13
BAD_VALUE_MISSING_KEY = 37
BAD_VALUE_MISSING_NAMESPACE = 27
BAD_VALUE_NOT_RESTRICTED_XPATH = 35
BAD_VALUE_NO_DEFAULT_NAMESPACE = 24
BAD_VALUE_PATTERN = 12
BAD_VALUE_POP_TOO_FAR = 31
BAD_VALUE_RANGE = 29
BAD_VALUE_STRING_FUN = 1
BAD_VALUE_SYMLINK_BAD_KEY_REFERENCE = 33
BAD_VALUE_TOTAL_DIGITS = 4
BAD_VALUE_UNIQUELIST = 10
BAD_VALUE_UNKNOWN_BIT_LABEL = 22
BAD_VALUE_UNKNOWN_NAMESPACE = 26
BAD_VALUE_UNKNOWN_NAMESPACE_PREFIX = 25
BAD_VALUE_USER_ERROR = 17
BAD_VALUE_VALUE2VALUE_FUN = 28
BAD_VALUE_WRONG_DECIMAL64_FRACTION_DIGITS = 2
BAD_VALUE_WRONG_NUMBER_IDENTIFIERS = 30
BAD_VALUE_XPATH_ERROR = 36
CLI_ACTION_NOT_FOUND = 13
CLI_AMBIGUOUS_COMMAND = 63
CLI_BAD_ACTION_RESPONSE = 16
CLI_BAD_LEAF_VALUE = 6
CLI_CDM_NOT_SUPPORTED = 74
CLI_COMMAND_ABORTED = 2
CLI_COMMAND_ERROR = 1
CLI_COMMAND_FAILED = 3
CLI_CONFIRMED_NOT_SUPPORTED = 39
CLI_COPY_CONFIG_FAILED = 32
CLI_COPY_FAILED = 31
CLI_COPY_PATH_IDENTICAL = 33
CLI_CREATE_PATH = 23
CLI_CUSTOM_ERROR = 4
CLI_DELETE_ALL_FAILED = 10
CLI_DELETE_ERROR = 12
CLI_DELETE_FAILED = 11
CLI_ELEMENT_DOES_NOT_EXIST = 66
CLI_ELEMENT_MANDATORY = 75
CLI_ELEMENT_NOT_FOUND = 14
CLI_ELEM_NOT_WRITABLE = 7
CLI_EXPECTED_BOL = 56
CLI_EXPECTED_EOL = 57
CLI_FAILED_COPY_RUNNING = 38
CLI_FAILED_CREATE_CONTEXT = 37
CLI_FAILED_OPEN_STARTUP = 41
CLI_FAILED_OPEN_STARTUP_CONFIG = 42
CLI_FAILED_TERM_REDIRECT = 49
CLI_ILLEGAL_DIRECTORY_NAME = 52
CLI_ILLEGAL_FILENAME = 53
CLI_INCOMPLETE_CMD_PATH = 67
CLI_INCOMPLETE_COMMAND = 9
CLI_INCOMPLETE_PATH = 8
CLI_INCOMPLETE_PATTERN = 64
CLI_INVALID_PARAMETER = 54
CLI_INVALID_PASSWORD = 21
CLI_INVALID_PATH = 58
CLI_INVALID_ROLLBACK_NR = 15
CLI_INVALID_SELECT = 59
CLI_MESSAGE_TOO_LARGE = 48
CLI_MISSING_ACTION_PARAM = 17
CLI_MISSING_ACTION_PARAM_VALUE = 18
CLI_MISSING_ARGUMENT = 69
CLI_MISSING_DISPLAY_GROUP = 55
CLI_MISSING_ELEMENT = 65
CLI_MISSING_VALUE = 68
CLI_MOVE_FAILED = 30
CLI_MUST_BE_AN_INTEGER = 70
CLI_MUST_BE_INTEGER = 43
CLI_MUST_BE_TRUE_OR_FALSE = 71
CLI_NOT_ALLOWED = 5
CLI_NOT_A_DIRECTORY = 50
CLI_NOT_A_FILE = 51
CLI_NOT_FOUND = 28
CLI_NOT_SUPPORTED = 34
CLI_NOT_WRITABLE = 27
CLI_NO_SUCH_ELEMENT = 45
CLI_NO_SUCH_SESSION = 44
CLI_NO_SUCH_USER = 47
CLI_ON_LINE = 25
CLI_ON_LINE_DESC = 26
CLI_OPEN_FILE = 20
CLI_READ_ERROR = 19
CLI_REALLOCATE = 24
CLI_SENSITIVE_DATA = 73
CLI_SET_FAILED = 29
CLI_START_REPLAY_FAILED = 72
CLI_TARGET_EXISTS = 35
CLI_UNKNOWN_ARGUMENT = 61
CLI_UNKNOWN_COMMAND = 62
CLI_UNKNOWN_ELEMENT = 60
CLI_UNKNOWN_HIDEGROUP = 22
CLI_UNKNOWN_MODE = 36
CLI_WILDCARD_NOT_ALLOWED = 46
CLI_WRITE_CONFIG_FAILED = 40
COMPLETION = 0
COMPLETION_DEFAULT = 3
COMPLETION_DESC = 2
COMPLETION_INFO = 1
CONTROL_SOCKET = 0
C_CREATE = 2
C_MOVE_AFTER = 6
C_REMOVE = 3
C_SET_ATTR = 5
C_SET_CASE = 4
C_SET_ELEM = 1
DAEMON_FLAG_BULK_GET_CONTAINER = 128
DAEMON_FLAG_NO_DEFAULTS = 4
DAEMON_FLAG_PREFER_BULK_GET = 64
DAEMON_FLAG_REG_DONE = 65536
DAEMON_FLAG_REG_REPLACE_DISCONNECT = 16
DAEMON_FLAG_SEND_IKP = 1
DAEMON_FLAG_STRINGSONLY = 2
DATA_AFTER = 1
DATA_BEFORE = 0
DATA_CREATE = 0
DATA_DELETE = 1
DATA_FIRST = 2
DATA_INSERT = 2
DATA_LAST = 3
DATA_MERGE = 3
DATA_MOVE = 4
DATA_REMOVE = 6
DATA_REPLACE = 5
DATA_WANT_FILTER = 1
ERRTYPE_BAD_VALUE = 2
ERRTYPE_CLI = 4
ERRTYPE_MISC = 8
ERRTYPE_NCS = 16
ERRTYPE_OPERATION = 32
ERRTYPE_VALIDATION = 1
MISC_ACCESS_DENIED = 5
MISC_APPLICATION = 19
MISC_APPLICATION_INTERNAL = 20
MISC_BAD_PERSIST_ID = 16
MISC_CANDIDATE_ABORT_BAD_USID = 17
MISC_CDB_OPER_UNAVAILABLE = 37
MISC_DATA_MISSING = 44
MISC_EXTERNAL = 22
MISC_EXTERNAL_TIMEOUT = 45
MISC_FILE_ACCESS_PATH = 33
MISC_FILE_BAD_PATH = 34
MISC_FILE_BAD_VALUE = 35
MISC_FILE_CORRUPT = 52
MISC_FILE_CREATE_PATH = 29
MISC_FILE_DELETE_PATH = 32
MISC_FILE_EOF = 36
MISC_FILE_MOVE_PATH = 30
MISC_FILE_OPEN_ERROR = 27
MISC_FILE_SET_PATH = 31
MISC_FILE_SYNTAX_ERROR = 28
MISC_FILE_SYNTAX_ERROR_1 = 26
MISC_HA_ABORT = 55
MISC_INCONSISTENT_VALUE = 7
MISC_INDEXED_VIEW_LIST_HOLE = 46
MISC_INDEXED_VIEW_LIST_TOO_BIG = 18
MISC_INTERNAL = 21
MISC_INTERRUPT = 10
MISC_IN_USE = 3
MISC_LOCKED_BY = 4
MISC_MISSING_INSTANCE = 8
MISC_NODE_IS_READONLY = 13
MISC_NODE_WAS_READONLY = 14
MISC_NOT_IMPLEMENTED = 43
MISC_NO_SUCH_FILE = 2
MISC_OPERATION_NOT_SUPPORTED = 38
MISC_PROTO_USAGE = 23
MISC_REACHED_MAX_RETRIES = 56
MISC_RESOLVE_NEEDED = 53
MISC_RESOURCE_DENIED = 6
MISC_ROLLBACK_DISABLED = 1
MISC_ROTATE_LIST_KEY = 58
MISC_SNMP_BAD_INDEX = 42
MISC_SNMP_BAD_VALUE = 41
MISC_SNMP_ERROR = 39
MISC_SNMP_TIMEOUT = 40
MISC_SUBAGENT_DOWN = 24
MISC_SUBAGENT_ERROR = 25
MISC_TOO_MANY_SESSIONS = 11
MISC_TOO_MANY_TRANSACTIONS = 12
MISC_TRANSACTION_CONFLICT = 54
MISC_UNSUPPORTED_XML_ENCODING = 57
MISC_UPGRADE_IN_PROGRESS = 15
MISC_WHEN_FAILED = 9
MISC_XPATH_COMPILE = 51
NCS_BAD_AUTHGROUP_CALLBACK_RESPONSE = 104
NCS_BAD_CAPAS = 14
NCS_CALL_HOME = 107
NCS_CLI_LOAD = 19
NCS_COMMIT_QUEUED = 20
NCS_COMMIT_QUEUED_AND_DELETED = 113
NCS_COMMIT_QUEUE_DISABLED = 111
NCS_COMMIT_QUEUE_HAS_OVERLAPPING = 103
NCS_COMMIT_QUEUE_HAS_SENTINEL = 75
NCS_CONFIG_LOCKED = 84
NCS_CONFLICTING_INTENT = 125
NCS_CONNECTION_CLOSED = 10
NCS_CONNECTION_REFUSED = 5
NCS_CONNECTION_TIMEOUT = 8
NCS_CQ_BLOCK_OTHERS = 21
NCS_CQ_REMOTE_NOT_ENABLED = 22
NCS_DEV_AUTH_FAILED = 1
NCS_DEV_IN_USE = 81
NCS_HOST_LOOKUP = 12
NCS_LOCKED = 3
NCS_NCS_ACTION_NO_TRANSACTION = 67
NCS_NCS_ALREADY_EXISTS = 82
NCS_NCS_CLUSTER_AUTH_FAILED = 74
NCS_NCS_DEV_ERROR = 69
NCS_NCS_ERROR = 68
NCS_NCS_ERROR_IKP = 70
NCS_NCS_LOAD_TEMPLATE_COPY_TREE_CROSS_NS = 96
NCS_NCS_LOAD_TEMPLATE_DUPLICATE_MACRO = 119
NCS_NCS_LOAD_TEMPLATE_EOF_XML = 33
NCS_NCS_LOAD_TEMPLATE_EXTRA_MACRO_VARS = 118
NCS_NCS_LOAD_TEMPLATE_INVALID_CBTYPE = 128
NCS_NCS_LOAD_TEMPLATE_INVALID_PI_REGEX = 122
NCS_NCS_LOAD_TEMPLATE_INVALID_PI_SYNTAX = 86
NCS_NCS_LOAD_TEMPLATE_INVALID_VALUE_XML = 30
NCS_NCS_LOAD_TEMPLATE_MISPLACED_IF_NED_ID_MATCH_XML = 121
NCS_NCS_LOAD_TEMPLATE_MISPLACED_IF_NED_ID_XML = 110
NCS_NCS_LOAD_TEMPLATE_MISSING_ELEMENT2_XML = 98
NCS_NCS_LOAD_TEMPLATE_MISSING_ELEMENT_XML = 29
NCS_NCS_LOAD_TEMPLATE_MISSING_MACRO_VARS = 117
NCS_NCS_LOAD_TEMPLATE_MULTIPLE_ELEMENTS_XML = 38
NCS_NCS_LOAD_TEMPLATE_MULTIPLE_KEY_LEAFS_XML = 77
NCS_NCS_LOAD_TEMPLATE_MULTIPLE_SP_XML = 35
NCS_NCS_LOAD_TEMPLATE_SHADOWED_NED_ID_XML = 109
NCS_NCS_LOAD_TEMPLATE_TAG_AMBIGUOUS_XML = 102
NCS_NCS_LOAD_TEMPLATE_TRAILING_XML = 32
NCS_NCS_LOAD_TEMPLATE_UNCLOSED_PI = 88
NCS_NCS_LOAD_TEMPLATE_UNEXPECTED_PI = 89
NCS_NCS_LOAD_TEMPLATE_UNKNOWN_ATTRIBUTE_XML = 31
NCS_NCS_LOAD_TEMPLATE_UNKNOWN_ELEMENT2_XML = 97
NCS_NCS_LOAD_TEMPLATE_UNKNOWN_ELEMENT_XML = 36
NCS_NCS_LOAD_TEMPLATE_UNKNOWN_MACRO = 116
NCS_NCS_LOAD_TEMPLATE_UNKNOWN_NED_ID_XML = 99
NCS_NCS_LOAD_TEMPLATE_UNKNOWN_NS_XML = 37
NCS_NCS_LOAD_TEMPLATE_UNKNOWN_PI = 85
NCS_NCS_LOAD_TEMPLATE_UNKNOWN_SP_XML = 34
NCS_NCS_LOAD_TEMPLATE_UNMATCHED_PI = 87
NCS_NCS_LOAD_TEMPLATE_UNSUPPORTED_NED_ID_AT_TAG_XML = 101
NCS_NCS_LOAD_TEMPLATE_UNSUPPORTED_NED_ID_XML = 100
NCS_NCS_LOAD_TEMPLATE_UNSUPPORTED_NETCONF_YANG_ATTRIBUTES = 126
NCS_NCS_MISSING_CLUSTER_AUTH = 73
NCS_NCS_MISSING_VARIABLES = 52
NCS_NCS_NED_MULTI_ERROR = 76
NCS_NCS_NO_CAPABILITIES = 64
NCS_NCS_NO_DIFF = 71
NCS_NCS_NO_FORWARD_DIFF = 72
NCS_NCS_NO_NAMESPACE = 65
NCS_NCS_NO_SP_TEMPLATE = 48
NCS_NCS_NO_TEMPLATE = 47
NCS_NCS_NO_TEMPLATE_XML = 23
NCS_NCS_NO_WRITE_TRANSACTION = 66
NCS_NCS_OPERATION_LOCKED = 83
NCS_NCS_PACKAGE_SYNC_MISMATCHED_LOAD_PATH = 123
NCS_NCS_SERVICE_CONFLICT = 78
NCS_NCS_TEMPLATE_CONTEXT_NODE_NOEXISTS = 90
NCS_NCS_TEMPLATE_COPY_TREE_BAD_OP = 94
NCS_NCS_TEMPLATE_FOREACH = 51
NCS_NCS_TEMPLATE_FOREACH_XML = 28
NCS_NCS_TEMPLATE_GUARD_LENGTH = 59
NCS_NCS_TEMPLATE_GUARD_LENGTH_XML = 44
NCS_NCS_TEMPLATE_INSERT = 55
NCS_NCS_TEMPLATE_INSERT_XML = 40
NCS_NCS_TEMPLATE_LONE_GUARD = 57
NCS_NCS_TEMPLATE_LONE_GUARD_XML = 42
NCS_NCS_TEMPLATE_LOOP_PREVENTION = 95
NCS_NCS_TEMPLATE_MISSING_VALUE = 56
NCS_NCS_TEMPLATE_MISSING_VALUE_XML = 41
NCS_NCS_TEMPLATE_MOVE = 60
NCS_NCS_TEMPLATE_MOVE_XML = 45
NCS_NCS_TEMPLATE_MULTIPLE_CONTEXT_NODES = 92
NCS_NCS_TEMPLATE_NOT_CREATED = 80
NCS_NCS_TEMPLATE_NOT_CREATED_XML = 79
NCS_NCS_TEMPLATE_ORDERED_LIST = 54
NCS_NCS_TEMPLATE_ORDERED_LIST_XML = 39
NCS_NCS_TEMPLATE_ROOT_LEAF_LIST = 93
NCS_NCS_TEMPLATE_SAVED_CONTEXT_NOEXISTS = 91
NCS_NCS_TEMPLATE_STR2VAL = 61
NCS_NCS_TEMPLATE_STR2VAL_XML = 46
NCS_NCS_TEMPLATE_UNSUPPORTED_NED_ID = 112
NCS_NCS_TEMPLATE_VALUE_LENGTH = 58
NCS_NCS_TEMPLATE_VALUE_LENGTH_XML = 43
NCS_NCS_TEMPLATE_WHEN = 50
NCS_NCS_TEMPLATE_WHEN_KEY_XML = 27
NCS_NCS_TEMPLATE_WHEN_XML = 26
NCS_NCS_XPATH = 53
NCS_NCS_XPATH_COMPILE = 49
NCS_NCS_XPATH_COMPILE_XML = 24
NCS_NCS_XPATH_VARBIND = 63
NCS_NCS_XPATH_XML = 25
NCS_NED_EXTERNAL_ERROR = 6
NCS_NED_INTERNAL_ERROR = 7
NCS_NED_OFFLINE_UNAVAILABLE = 108
NCS_NED_OUT_OF_SYNC = 18
NCS_NONED = 15
NCS_NO_EXISTS = 2
NCS_NO_TEMPLATE = 62
NCS_NO_YANG_MODULES = 16
NCS_NS_SUPPORT = 13
NCS_OVERLAPPING_PRESENCE_AND_ABSENCE_ASSERTION_COMPLIANCE_TEMPLATE = 127
NCS_OVERLAPPING_STRICT_ASSERTION_COMPLIANCE_TEMPLATE = 129
NCS_PLAN_LOCATION = 120
NCS_REVDROP = 17
NCS_RPC_ERROR = 9
NCS_SERVICE_CREATE = 0
NCS_SERVICE_DELETE = 2
NCS_SERVICE_UPDATE = 1
NCS_SESSION_LIMIT_EXCEEDED = 115
NCS_SOUTHBOUND_LOCKED = 4
NCS_UNKNOWN_NED_ID = 105
NCS_UNKNOWN_NED_IDS_COMPLIANCE_TEMPLATE = 124
NCS_UNKNOWN_NED_ID_DEVICE_TEMPLATE = 106
NCS_XML_PARSE = 11
NCS_YANGLIB_NO_SCHEMA_FOR_RUNNING = 114
PATCH_FLAG_AAA_CHECKED = 8
PATCH_FLAG_BUFFER_DAMPENED = 2
PATCH_FLAG_FILTER = 4
PATCH_FLAG_INCOMPLETE = 1
WORKER_SOCKET = 1
```
