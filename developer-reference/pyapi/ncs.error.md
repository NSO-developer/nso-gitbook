# Python ncs.error Module

High-level error API for ConfD/NCS.

In this module, the server is ConfD or NSO. A northbound client is the
program that sends a request to the server, for example a NETCONF
client, the CLI, or a Python program that uses maapi or maagic. Your
application is the Python program that implements callbacks, for
example actions and validation points.

The module covers errors in two directions:

* errors that the server reports to your code, as `Error` and its
  subclasses
* errors that your callbacks report to the server, as `CallbackError`.
  The server sends them to the northbound client.

When an API call fails, it raises `Error` or a subclass of `Error`. The
subclass tells you the type of the failure, so you can handle it with an
except clause. You do not have to compare error codes:

    from ncs.error import AlreadyExistsError

    try:
        t.create('/devices/device{ce0}')
    except AlreadyExistsError:
        pass  # Keep the existing device.

The subclasses are `NotFoundError`, `AlreadyExistsError`, `AccessDeniedError`,
`LockedError`, `TransactionConflictError`, `ExternalError`, `ValidationWarning`
and HaRemoteConnectionError. Each subclass is also an `Error`, so an except
clause for `Error` catches all of them. After you import this module, the
low-level API calls also raise these subclasses.

All other failures raise `Error`. To find the cause, read the code
attribute of the error. The code attribute is an `ErrorCode` member, or a
plain integer if no member has that value. Each `ErrorCode` member has a
description:

    from ncs.error import ErrorCode

    ErrorCode.NOEXISTS == 1           # True
    ErrorCode(1)                      # ErrorCode.NOEXISTS
    ErrorCode.NOEXISTS.description    # "item does not exist"

`ncs.error.ErrorCode` also has the codes that only NCS reports, for
example `ErrorCode.DEVICE`.

`ErrorCode` is an `IntEnum`. Its members are equal to their integer values,
so you can use them in place of the integer constants, for example
`_ncs.ERR_NOEXISTS`.

A callback, for example an action callback or a validation callback,
raises `CallbackError` to fail the request. See `CallbackError` for what
the northbound client gets, and for an example.

For NSO, the section "Error Reporting" of the Python API Overview in the
NSO Development guide has more examples.

## Classes

### _class_ **AccessDeniedError**

Access control denied the operation (`ErrorCode.ACCESS_DENIED`).

```python
AccessDeniedError(*args: Any) -> None
```

Base class: ncs.error._CodeError

Members:

<details>

<summary>code</summary>

_Readonly property_

The error code as an ErrorCode enum member.

Falls back to the raw integer `confd_errno` if the value does not
correspond to a known `ErrorCode` member.

</details>

<details>

<summary>format(...)</summary>

Method:

```python
format(self: Any) -> str
```

Format as CODE_NAME: description (details).

This provides a richer format than the default str() representation.
The default str() preserves the original low-level format for
backward compatibility.

Example:

    try:
        maapi.connect(sock, '127.0.0.1', 9999)
    except Error as e:
        print(e.format())  # OS: system call failed (...)

</details>

### _class_ **AlreadyExistsError**

The item already exists (`ErrorCode.ALREADY_EXISTS`).

```python
AlreadyExistsError(*args: Any) -> None
```

Base class: ncs.error._CodeError

Members:

<details>

<summary>code</summary>

_Readonly property_

The error code as an ErrorCode enum member.

Falls back to the raw integer `confd_errno` if the value does not
correspond to a known `ErrorCode` member.

</details>

<details>

<summary>format(...)</summary>

Method:

```python
format(self: Any) -> str
```

Format as CODE_NAME: description (details).

This provides a richer format than the default str() representation.
The default str() preserves the original low-level format for
backward compatibility.

Example:

    try:
        maapi.connect(sock, '127.0.0.1', 9999)
    except Error as e:
        print(e.format())  # OS: system call failed (...)

</details>

### _class_ **CallbackError**

Error that a callback raises to fail with a code and details.

Raise `CallbackError` from a callback to fail the request. Your
application reports the error to the server, and the server sends it
to the northbound client that made the request. You do not report
the error yourself, the callback class does it for you.

Example: the check action of /ex:top fails when the input size is
too large.

    from ncs.dp import Action
    from ncs.error import CallbackError

    class CheckAction(Action):
        @Action.action
        def cb_action(self, uinfo, name, kp, input, output, trans):
            if input.size > 100:
                raise CallbackError(
                    "Quota exceeded",
                    CallbackError.Code.RESOURCE_DENIED,
                    apptag="ex:quota",
                    error_info={"ex:severity": "critical"})
            output.result = "ok"

A NETCONF client that invokes the action gets the code, the message,
the apptag and the error_info in the rpc-error:

    <rpc-error>
      <error-type>application</error-type>
      <error-tag>resource-denied</error-tag>
      <error-severity>error</error-severity>
      <error-app-tag>quota</error-app-tag>
      ...
      <error-message>resource denied: Quota exceeded</error-message>
      <error-info>
        ...
        <severity xmlns="http://example.com/ex">critical</severity>
      </error-info>
    </rpc-error>

A Python program that invokes the action with maagic gets an Error
with the code and the message. It does not get the `apptag` and the
`error_info`:

    from ncs import maagic, maapi
    from ncs.error import Error

    with maapi.single_read_trans('admin', 'system') as t:
        check = maagic.get_root(t).top.check
        inp = check.get_input()
        inp.size = 200
        try:
            check(inp)
        except Error as e:
            print(e.code.name)  # RESOURCE_DENIED
            print(e.format())   # RESOURCE_DENIED: Data provider denied
                                # a resource (resource denied: Quota
                                # exceeded)

Attributes:

* message -- the error message for the northbound client (str)
* code -- the category of the error, `CallbackError.Code.APPLICATION`
          by default (`CallbackError.Code`). The codes are listed
          below.
* apptag -- the NETCONF error-app-tag as "prefix:name", or None
            (str). prefix is the prefix of a loaded module, and name
            must be defined in that module, for example as a node of
            the module. If the module does not define the name, the
            server drops the apptag without an error. A NETCONF
            client gets the name, for example quota. A RESTCONF
            client gets module:name, for example hl-error:quota.
* error_info -- the content of the NETCONF `error-info` element, or
                None (dict). Each key is the "prefix:name" of a leaf
                directly under tailf:error-info of one module, and all
                keys must have the same prefix. If a key does not name
                such a leaf, the server drops the whole error-info
                without an error. Each value is the value of that leaf
                (str). The value is sent as a string, so the leaf must
                have a string type. For other types, nested containers
                or lists, use the low-level functions
                `trans_seterr_extended_info()`,
                `action_seterr_extended_info()` and
                `db_seterr_extended_info()` in the dp module of
                _ncs or _confd.

The `apptag` and the `error_info` keys are resolved when you create the
`CallbackError`. The constructor raises `ValueError` if a name does not
have the form "prefix:name", if no loaded module or more than one has
the prefix, if the name is not in any loaded schema, or if the
`error_info` keys have different prefixes. It does not make sure that
the module with the prefix defines the name. If no schemas are loaded,
the constructor loads them with a `maapi.Maapi()` to the default
address. If your application connects to another address, call
`Daemon.load_schemas()` first. Without `apptag` and `error_info`, a
`CallbackError` does not need the schemas.

The constructor raises `TypeError` if the `apptag` is not a str or
None, or if the `error_info` is not a dict of str keys and str values
or None.

The code must be a `CallbackError.Code` member. Any other value raises
`TypeError`, also an int or the `ErrorCode` of a caught `Error`.
`CallbackError.Code` is a plain Enum, so a member is never equal to an
`ErrorCode` or an int. The members are listed below, each with the
NETCONF error-tag and the `Error` that a MAAPI or maagic caller gets:

* `IN_USE` -- a data store could not be locked, because it was
            already locked. The error-tag is in-use. The caller gets
            `LockedError`.
* `RESOURCE_DENIED` -- a resource is not available, for example there
                     is not enough memory. The error-tag is
                     resource-denied. The caller gets `Error` with
                     `ErrorCode.RESOURCE_DENIED`.
* `INCONSISTENT_VALUE` -- a request parameter has a value that is not
                        valid. The error-tag is invalid-value. The
                        caller gets `Error` with
                        `ErrorCode.INCONSISTENT_VALUE`.
* `ACCESS_DENIED` -- authorization does not allow the request. The
                   northbound client gets no other error
                   information. The error-tag is access-denied. The
                   caller gets `AccessDeniedError`.
* `APPLICATION` -- an error with no specific category. This is the
                 default. The error-tag is operation-failed. The
                 caller gets `ExternalError`.
* `APPLICATION_INTERNAL` -- the same as `APPLICATION`, but the message is
                          only logged. The northbound client does
                          not get it. The error-tag is
                          operation-failed. The caller gets `Error`
                          with `ErrorCode.APPLICATION_INTERNAL`.
* `DATA_MISSING` -- the request cannot complete, because the data
                  that it needs does not exist. The error-tag is
                  data-missing. The caller gets `Error` with
                  `ErrorCode.DATA_MISSING`.
* `INTERRUPT` -- the user interrupted the request. The error-tag is
               operation-failed. The caller gets `Error` with
               `ErrorCode.INTERNAL`.

You can raise CallbackError in these callbacks:

* dp.Action callbacks
* dp.ValidationPoint callbacks and TransactionCallback.init()
* dp.DbCallback callbacks. `DbCallbackContext.seterr()` also takes a
  `CallbackError`, for a callback that then returns ERR.
* the prepare callback of `cdb.TwoPhaseSubscriber`. The transaction is
  aborted.
* `application.Service` and `application.NanoService` callbacks, NSO
  only. NSO sends the code and the message to the northbound client
  as one plain message. It drops the `apptag` and the `error_info`, and
  logs a warning when they are set.

In other callbacks, `CallbackError` fails the callback like any other
exception.

`CallbackError` is not a subclass of `Error`. `Error` is for errors that
the server reports. `CallbackError` is for errors that your callback
reports.

For NSO, the section "Errors That Callbacks Report" of the Python API
Overview in the NSO Development guide has examples for an action, a
validation callback, a CDB subscriber and a service.

```python
CallbackError(message: str, code: ncs.error.CallbackError.Code = <Code.APPLICATION: 4>, *, apptag: Optional[str] = None, error_info: Optional[Dict[str, str]] = None) -> None
```

Base class: builtins.Exception

Members:

### _class_ **EOF**

This exception will be thrown from an API function that, from a C perspective,
would result in a CONFD_EOF return value.

Base class: builtins.Exception

Members:

_None_

### _class_ **Error**

This exception will be thrown from an API function that, from a C perspective,
would result in a CONFD_ERR return value.

When the high-level `ncs.error` module is imported, which importing
 ncs does, a failure raises a subclass of this class for some error
codes, for example `ncs.error.NotFoundError`. The module also adds the
code attribute and the format() method to this class.

Available attributes:

* confd_errno -- the underlying error number
* confd_strerror -- string representation of the confd_errno
* confd_lasterr -- string with additional textual information
* strerror -- os error string (available if confd_errno is CONFD_ERR_OS)

Base class: _ncs.error.Error

Members:

<details>

<summary>code</summary>

_Readonly property_

The error code as an ErrorCode enum member.

Falls back to the raw integer `confd_errno` if the value does not
correspond to a known `ErrorCode` member.

</details>

<details>

<summary>format(...)</summary>

Method:

```python
format(self: Any) -> str
```

Format as CODE_NAME: description (details).

This provides a richer format than the default str() representation.
The default str() preserves the original low-level format for
backward compatibility.

Example:

    try:
        maapi.connect(sock, '127.0.0.1', 9999)
    except Error as e:
        print(e.format())  # OS: system call failed (...)

</details>

### _class_ **ErrorCode**

Error code of an Error, as reported by Error.code.

Each member carries a human-readable description:

    ErrorCode.NOEXISTS.description    # "item does not exist"

```python
ErrorCode(*values)
```

Base class: enum.IntEnum

Members:

<details>

<summary>ABORTED</summary>

```python
ABORTED = 49
```


</details>

<details>

<summary>ACCESS_DENIED</summary>

```python
ACCESS_DENIED = 3
```


</details>

<details>

<summary>ALREADY_EXISTS</summary>

```python
ALREADY_EXISTS = 2
```


</details>

<details>

<summary>APPLICATION_INTERNAL</summary>

```python
APPLICATION_INTERNAL = 39
```


</details>

<details>

<summary>BADPATH</summary>

```python
BADPATH = 8
```


</details>

<details>

<summary>BADSTATE</summary>

```python
BADSTATE = 17
```


</details>

<details>

<summary>BADTYPE</summary>

```python
BADTYPE = 5
```


</details>

<details>

<summary>BAD_CONFIG</summary>

```python
BAD_CONFIG = 36
```


</details>

<details>

<summary>BAD_KEYREF</summary>

```python
BAD_KEYREF = 14
```


</details>

<details>

<summary>BAD_PAYLOAD</summary>

```python
BAD_PAYLOAD = 72
```


</details>

<details>

<summary>CHECKSUM_MISMATCH</summary>

```python
CHECKSUM_MISMATCH = 73
```


</details>

<details>

<summary>CLI_CMD</summary>

```python
CLI_CMD = 59
```


</details>

<details>

<summary>CONNECTION_CLOSED</summary>

```python
CONNECTION_CLOSED = 64
```


</details>

<details>

<summary>CONNECTION_REFUSED</summary>

```python
CONNECTION_REFUSED = 56
```


</details>

<details>

<summary>CONNECTION_TIMEOUT</summary>

```python
CONNECTION_TIMEOUT = 63
```


</details>

<details>

<summary>DATA_MISSING</summary>

```python
DATA_MISSING = 58
```


</details>

<details>

<summary>DEVICE</summary>

```python
DEVICE = 65
```


</details>

<details>

<summary>EOF</summary>

```python
EOF = 45
```


</details>

<details>

<summary>EXTERNAL</summary>

```python
EXTERNAL = 19
```


</details>

<details>

<summary>HA_ABORT</summary>

```python
HA_ABORT = 71
```


</details>

<details>

<summary>HA_BADCONFIG</summary>

```python
HA_BADCONFIG = 69
```


</details>

<details>

<summary>HA_BADFXS</summary>

```python
HA_BADFXS = 27
```


</details>

<details>

<summary>HA_BADNAME</summary>

```python
HA_BADNAME = 29
```


</details>

<details>

<summary>HA_BADTOKEN</summary>

```python
HA_BADTOKEN = 28
```


</details>

<details>

<summary>HA_BADVSN</summary>

```python
HA_BADVSN = 52
```


</details>

<details>

<summary>HA_BIND</summary>

```python
HA_BIND = 30
```


</details>

<details>

<summary>HA_CLOSED</summary>

```python
HA_CLOSED = 26
```


</details>

<details>

<summary>HA_CONNECT</summary>

```python
HA_CONNECT = 25
```


</details>

<details>

<summary>HA_NOTICK</summary>

```python
HA_NOTICK = 31
```


</details>

<details>

<summary>HA_WITH_UPGRADE</summary>

```python
HA_WITH_UPGRADE = 47
```


</details>

<details>

<summary>INCONSISTENT_VALUE</summary>

```python
INCONSISTENT_VALUE = 38
```


</details>

<details>

<summary>INTERNAL</summary>

```python
INTERNAL = 18
```


</details>

<details>

<summary>INVALID_INSTANCE</summary>

```python
INVALID_INSTANCE = 43
```


</details>

<details>

<summary>IN_USE</summary>

```python
IN_USE = 11
```


</details>

<details>

<summary>LIB_NOT_INITIALIZED</summary>

```python
LIB_NOT_INITIALIZED = 34
```


</details>

<details>

<summary>LOCKED</summary>

```python
LOCKED = 10
```


</details>

<details>

<summary>MALLOC</summary>

```python
MALLOC = 20
```


</details>

<details>

<summary>MISSING_INSTANCE</summary>

```python
MISSING_INSTANCE = 42
```


</details>

<details>

<summary>MUST_FAILED</summary>

```python
MUST_FAILED = 41
```


</details>

<details>

<summary>NOEXISTS</summary>

```python
NOEXISTS = 1
```


</details>

<details>

<summary>NON_UNIQUE</summary>

```python
NON_UNIQUE = 13
```


</details>

<details>

<summary>NOSESSION</summary>

```python
NOSESSION = 22
```


</details>

<details>

<summary>NOSTACK</summary>

```python
NOSTACK = 9
```


</details>

<details>

<summary>NOTCREATABLE</summary>

```python
NOTCREATABLE = 6
```


</details>

<details>

<summary>NOTDELETABLE</summary>

```python
NOTDELETABLE = 7
```


</details>

<details>

<summary>NOTMOVABLE</summary>

```python
NOTMOVABLE = 46
```


</details>

<details>

<summary>NOTRANS</summary>

```python
NOTRANS = 61
```


</details>

<details>

<summary>NOTSET</summary>

```python
NOTSET = 12
```


</details>

<details>

<summary>NOT_IMPLEMENTED</summary>

```python
NOT_IMPLEMENTED = 51
```


</details>

<details>

<summary>NOT_WRITABLE</summary>

```python
NOT_WRITABLE = 4
```


</details>

<details>

<summary>NO_MOUNT_ID</summary>

```python
NO_MOUNT_ID = 67
```


</details>

<details>

<summary>OS</summary>

```python
OS = 24
```


</details>

<details>

<summary>POLICY_COMPILATION_FAILED</summary>

```python
POLICY_COMPILATION_FAILED = 54
```


</details>

<details>

<summary>POLICY_EVALUATION_FAILED</summary>

```python
POLICY_EVALUATION_FAILED = 55
```


</details>

<details>

<summary>POLICY_FAILED</summary>

```python
POLICY_FAILED = 53
```


</details>

<details>

<summary>PROTO_USAGE</summary>

```python
PROTO_USAGE = 21
```


</details>

<details>

<summary>RESOURCE_DENIED</summary>

```python
RESOURCE_DENIED = 37
```


</details>

<details>

<summary>SERVICE_CONFLICT</summary>

```python
SERVICE_CONFLICT = 62
```


</details>

<details>

<summary>STALE_INSTANCE</summary>

```python
STALE_INSTANCE = 68
```


</details>

<details>

<summary>START_FAILED</summary>

```python
START_FAILED = 57
```


</details>

<details>

<summary>SUBAGENT_DOWN</summary>

```python
SUBAGENT_DOWN = 33
```


</details>

<details>

<summary>TEMPLATE</summary>

```python
TEMPLATE = 66
```


</details>

<details>

<summary>TIMEOUT</summary>

```python
TIMEOUT = 48
```


</details>

<details>

<summary>TOOMANYTRANS</summary>

```python
TOOMANYTRANS = 23
```


</details>

<details>

<summary>TOO_FEW_ELEMS</summary>

```python
TOO_FEW_ELEMS = 15
```


</details>

<details>

<summary>TOO_MANY_ELEMS</summary>

```python
TOO_MANY_ELEMS = 16
```


</details>

<details>

<summary>TOO_MANY_SESSIONS</summary>

```python
TOO_MANY_SESSIONS = 35
```


</details>

<details>

<summary>TRANSACTION_CONFLICT</summary>

```python
TRANSACTION_CONFLICT = 70
```


</details>

<details>

<summary>UNAVAILABLE</summary>

```python
UNAVAILABLE = 44
```


</details>

<details>

<summary>UNSET_CHOICE</summary>

```python
UNSET_CHOICE = 40
```


</details>

<details>

<summary>UPGRADE_IN_PROGRESS</summary>

```python
UPGRADE_IN_PROGRESS = 60
```


</details>

<details>

<summary>VALIDATION_WARNING</summary>

```python
VALIDATION_WARNING = 32
```


</details>

<details>

<summary>XPATH</summary>

```python
XPATH = 50
```


</details>

### _class_ **ExternalError**

A callback of an application failed (`ErrorCode.EXTERNAL`).

A northbound client, for example a program that uses `maapi.Maapi`,
gets this error when a data provider, validation or action callback
raises `CallbackError` with `CallbackError.Code.APPLICATION` (the
default), fails without an error code, or does not reply in time.

In the process of the application, the low-level `dp.fd_ready()` also
raises this error after the failed callback reported its error to
the server. `dp.Daemon` ignores it and continues to serve requests.
Only an application with its own low-level `fd_ready()` loop must
catch it.

```python
ExternalError(*args: Any) -> None
```

Base class: ncs.error._CodeError

Members:

<details>

<summary>code</summary>

_Readonly property_

The error code as an ErrorCode enum member.

Falls back to the raw integer `confd_errno` if the value does not
correspond to a known `ErrorCode` member.

</details>

<details>

<summary>format(...)</summary>

Method:

```python
format(self: Any) -> str
```

Format as CODE_NAME: description (details).

This provides a richer format than the default str() representation.
The default str() preserves the original low-level format for
backward compatibility.

Example:

    try:
        maapi.connect(sock, '127.0.0.1', 9999)
    except Error as e:
        print(e.format())  # OS: system call failed (...)

</details>

### _class_ **HaRemoteConnectionError**

The HA connection between this node and a remote HA node failed.

This node could not connect to the remote HA node
(`ErrorCode.HA_CONNECT`), or the remote node closed the connection
(`ErrorCode.HA_CLOSED`). A retry can succeed when the remote node is
reachable again. A failure to connect to the local node is not this
error: it is an `Error`, for example with `ErrorCode.OS`.

```python
HaRemoteConnectionError(*args: Any) -> None
```

Base class: ncs.error._CodeError

Members:

<details>

<summary>code</summary>

_Readonly property_

The error code as an ErrorCode enum member.

Falls back to the raw integer `confd_errno` if the value does not
correspond to a known `ErrorCode` member.

</details>

<details>

<summary>format(...)</summary>

Method:

```python
format(self: Any) -> str
```

Format as CODE_NAME: description (details).

This provides a richer format than the default str() representation.
The default str() preserves the original low-level format for
backward compatibility.

Example:

    try:
        maapi.connect(sock, '127.0.0.1', 9999)
    except Error as e:
        print(e.format())  # OS: system call failed (...)

</details>

### _class_ **LockedError**

A lock held by someone else prevented the operation.

Raised when taking a lock that is already held (`ErrorCode.LOCKED`),
and when committing while another session holds a lock
(`ErrorCode.IN_USE`). Retrying later may succeed.

```python
LockedError(*args: Any) -> None
```

Base class: ncs.error._CodeError

Members:

<details>

<summary>code</summary>

_Readonly property_

The error code as an ErrorCode enum member.

Falls back to the raw integer `confd_errno` if the value does not
correspond to a known `ErrorCode` member.

</details>

<details>

<summary>format(...)</summary>

Method:

```python
format(self: Any) -> str
```

Format as CODE_NAME: description (details).

This provides a richer format than the default str() representation.
The default str() preserves the original low-level format for
backward compatibility.

Example:

    try:
        maapi.connect(sock, '127.0.0.1', 9999)
    except Error as e:
        print(e.format())  # OS: system call failed (...)

</details>

### _class_ **NotFoundError**

The item does not exist (`ErrorCode.NOEXISTS`).

```python
NotFoundError(*args: Any) -> None
```

Base class: ncs.error._CodeError

Members:

<details>

<summary>code</summary>

_Readonly property_

The error code as an ErrorCode enum member.

Falls back to the raw integer `confd_errno` if the value does not
correspond to a known `ErrorCode` member.

</details>

<details>

<summary>format(...)</summary>

Method:

```python
format(self: Any) -> str
```

Format as CODE_NAME: description (details).

This provides a richer format than the default str() representation.
The default str() preserves the original low-level format for
backward compatibility.

Example:

    try:
        maapi.connect(sock, '127.0.0.1', 9999)
    except Error as e:
        print(e.format())  # OS: system call failed (...)

</details>

### _class_ **TransactionConflictError**

The transaction conflicted with a concurrent transaction.

`ErrorCode.TRANSACTION_CONFLICT`. Retrying in a new transaction may
succeed, decorate the function that starts the transaction with
`maapi.retry_on_conflict()` to do that.

```python
TransactionConflictError(*args: Any) -> None
```

Base class: ncs.error._CodeError

Members:

<details>

<summary>code</summary>

_Readonly property_

The error code as an ErrorCode enum member.

Falls back to the raw integer `confd_errno` if the value does not
correspond to a known `ErrorCode` member.

</details>

<details>

<summary>format(...)</summary>

Method:

```python
format(self: Any) -> str
```

Format as CODE_NAME: description (details).

This provides a richer format than the default str() representation.
The default str() preserves the original low-level format for
backward compatibility.

Example:

    try:
        maapi.connect(sock, '127.0.0.1', 9999)
    except Error as e:
        print(e.format())  # OS: system call failed (...)

</details>

### _class_ **ValidationWarning**

`ValidationWarning` reported warnings, so the operation did not complete.

``maapi.Transaction.validate()`` raises `ValidationWarning` when the server
reports warnings and no errors. For example, the server reports a
warning when a validation callback returns a warning instead of an
error.

`apply()` does not raise `ValidationWarning`. It accepts the warnings and
commits the transaction. To see the warnings before the commit, call
`validate(unlock=True)` first, and then `apply()`. `unlock=True` keeps
the transaction open for `apply()`.

A validation callback cannot raise `ValidationWarning` to return a
warning. The validation then fails. To accept a value with a warning,
raise `dp.AcceptWithWarning` from a callback decorated with
`ValidationPoint.validate` or `ValidationPoint.validate_with_trans`.

`ValidationWarning` is an exception. It is not a category for the
warnings module. It is a subclass of `Error`, so an except clause for
`Error` also catches it. Put the except clause for `ValidationWarning`
first.

Attributes:

* `warnings` -- one `ValidationWarning.Entry` for each warning that the
              server reported (list). Each entry has a path and a
              message, see below.
* `code` -- `ErrorCode.VALIDATION_WARNING`, inherited from `Error`
          (`ErrorCode`)

`ValidationWarning.Entry` has these attributes:

* `path` -- the keypath of the node that the warning is about, for
          example `/ncs:devices/device{ce0}/address` (str). It is a
          keypath, not an XPath expression.
* `message` -- the text of the warning (str)

Example:

    from ncs.error import Error, ValidationWarning

    try:
        t.validate(unlock=True)
    except ValidationWarning as e:
        for w in e.warnings:
            print(f"  {w.path}: {w.message}")
    except Error as e:
        print(f"Hard error: {e.code}")

```python
ValidationWarning(*, warnings: Optional[list[ncs.error.ValidationWarning.Entry]] = None, message: Optional[str] = None) -> None
```

Base class: _ncs.error.Error

Members:

<details>

<summary>code</summary>

_Readonly property_

The error code as an ErrorCode enum member.

Falls back to the raw integer `confd_errno` if the value does not
correspond to a known `ErrorCode` member.

</details>

<details>

<summary>format(...)</summary>

Method:

```python
format(self) -> str
```

Format as VALIDATION_WARNING: followed by all the warnings.

</details>

<details>

<summary>warnings</summary>

_Readonly property_

The reported warnings, as ValidationWarning.Entry instances.

</details>

## Predefined Values

```python

__annotations__ = {'_ERROR_CLASSES': dict[ncs.error.ErrorCode, type[_ncs.error.Error]]}
```
