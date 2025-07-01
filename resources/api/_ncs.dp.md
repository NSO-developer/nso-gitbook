# Python _ncs.dp Module

Low level callback module for connecting data providers to NCS.

This module is used to connect to the NCS Data Provider
API. The purpose of this API is to provide callback hooks so that
user-written data providers can provide data stored externally to NCS.
NCS needs this information in order to drive its northbound agents.

The module is also used to populate items in the data model which are not
data or configuration items, such as statistics items from the device.

The module consists of a number of API functions whose purpose is to
install different callback functions at different points in the data model
tree which is the representation of the device configuration. Read more
about callpoints in tailf_yang_extensions(5). Read more about how to use
the module in the User Guide chapters on Operational data and External
data.

This documentation should be read together with the [confd_lib_dp(3)](../man/section3.md#confd_lib_dp) man page.

## Functions

### aaa_reload

```python
aaa_reload(tctx) -> None
```

When the ConfD AAA tree is populated by an external data provider (see the
AAA chapter in the User Guide), this function can be used by the data
provider to notify ConfD when there is a change to the AAA data.

Keyword arguments:

* tctx -- a transaction context

### access_reply_result

```python
access_reply_result(actx, result) -> None
```

The callbacks must call this function to report the result of the access
check to ConfD, and should normally return CONFD_OK. If any other value is
returned, it will cause the access check to be rejected.

Keyword arguments:

* actx -- the authorization context
* result -- the result (ACCESS_RESULT_xxx)

### action_delayed_reply_error

```python
action_delayed_reply_error(uinfo, errstr) -> None
```

If we use the CONFD_DELAYED_RESPONSE as a return value from the action
callback, we must later asynchronously reply. This function is used to
reply with error.

Keyword arguments:

* uinfo -- a user info context
* errstr -- an error string

### action_delayed_reply_ok

```python
action_delayed_reply_ok(uinfo) -> None
```

If we use the CONFD_DELAYED_RESPONSE as a return value from the action
callback, we must later asynchronously reply. This function is used to
reply with success.

Keyword arguments:

* uinfo -- a user info context

### action_reply_command

```python
action_reply_command(uinfo, values) -> None
```

If a CLI callback command should return data, it must invoke this function
in response to the cb_command() callback.

Keyword arguments:

* uinfo -- a user info context
* values -- a list of strings or None

### action_reply_completion

```python
action_reply_completion(uinfo, values) -> None
```

This function must normally be called in response to the cb_completion()
callback.

Keyword arguments:

* uinfo -- a user info context
* values -- a list of 3-tuples or None (see below)

The values argument must be None or a list of 3-tuples where each tuple is
built up like:

    (type::int, value::string, extra::string)

The third item of the tuple (extra) may be set to None.

### action_reply_range_enum

```python
action_reply_range_enum(uinfo, values, keysize) -> None
```

This function must be called in response to the cb_completion() callback
when it is invoked via a tailf:cli-custom-range-enumerator statement in the
data model.

Keyword arguments:

* uinfo -- a user info context
* values -- a list of keys as strings or None
* keysize -- number of keys for the list in the data model

The values argument is a flat list of keys. If the list in the data model
specifies multiple keys this list is still flat. The keysize argument
tells us how many keys to use for each list element. So the size of values
should be a multiple of keysize.

### action_reply_rewrite

```python
action_reply_rewrite(uinfo, values, unhides) -> None
```

This function can be called instead of action_reply_command() as a
response to a show path rewrite callback invocation.

Keyword arguments:

* uinfo -- a user info context
* values -- a list of strings or None
* unhides -- a list of strings or None

### action_reply_rewrite2

```python
action_reply_rewrite2(uinfo, values, unhides, selects) -> None
```

This function can be called instead of action_reply_command() as a
response to a show path rewrite callback invocation.

Keyword arguments:

* uinfo -- a user info context
* values -- a list of strings or None
* unhides -- a list of strings or None
* selects -- a list of strings or None

### action_reply_values

```python
action_reply_values(uinfo, values) -> None
```

If the action definition specifies that the action should return data, it
must invoke this function in response to the cb_action() callback.

Keyword arguments:

* uinfo -- a user info context
* values -- a list of _lib.TagValue instances or None

### action_set_fd

```python
action_set_fd(uinfo, sock) -> None
```

Associate a worker socket with the action. This function must be called in
the action cb_init() callback.

Keyword arguments:

* uinfo -- a user info context
* sock -- a previously connected worker socket

A typical implementation of an action cb_init() callback looks like:

    class ActionCallbacks(object):
        def __init__(self, workersock):
            self.workersock = workersock

        def cb_init(self, uinfo):
            dp.action_set_fd(uinfo, self.workersock)

### action_set_timeout

```python
action_set_timeout(uinfo, timeout_secs) -> None
```

Some action callbacks may require a significantly longer execution time
than others, and this time may not even be possible to determine statically
(e.g. a file download). In such cases the /confdConfig/capi/queryTimeout
setting in confd.conf may be insufficient, and this function can be used to
extend (or shorten) the timeout for the current callback invocation. The
timeout is given in seconds from the point in time when the function is
called.

Keyword arguments:

* uinfo -- a user info context
* timeout_secs -- timeout value

### action_seterr

```python
action_seterr(uinfo, errstr) -> None
```

If action callback encounters fatal problems that can not be expressed via
the reply function, it may call this function with an appropriate message
and return CONFD_ERR instead of CONFD_OK.

Keyword arguments:

* uinfo -- a user info context
* errstr -- an error message string

### action_seterr_extended

```python
action_seterr_extended(uninfo, code, apptag_ns, apptag_tag, errstr) -> None
```

This function can be used to provide more structured error information
from an action callback.

Keyword arguments:

* uinfo -- a user info context
* code -- an error code
* apptag_ns -- namespace - should be set to 0
* apptag_tag -- either 0 or the hash value for a data model node
* errstr -- an error message string

### action_seterr_extended_info

```python

```

action_seterr_extended_info(uinfo, code, apptag_ns, apptag_tag,
                            error_info, errstr) -> None

This function can be used to provide structured error information in the
same way as action_seterr_extended(), and additionally provide contents for
the NETCONF <error-info> element.

Keyword arguments:

* uinfo -- a user info context
* code -- an error code
* apptag_ns -- namespace - should be set to 0
* apptag_tag -- either 0 or the hash value for a data model node
* error_info -- a list of _lib.TagValue instances
* errstr -- an error message string

### auth_seterr

```python
auth_seterr(actx, errstr) -> None
```

This function is used by the application to set an error string.

This function can be used to provide a text message when the callback
returns CONFD_ERR. If used when rejecting a successful authentication, the
message will be logged in ConfD's audit log (otherwise a generic "rejected
by application callback" message is logged).

Keyword arguments:

* actx -- the auth context
* errstr -- an error message string

### authorization_set_timeout

```python
authorization_set_timeout(actx, timeout_secs) -> None
```

The authorization callbacks are invoked on the daemon control socket, and
as such are expected to complete quickly. However in case they send requests
to a remote server, and such a request needs to be retried, this function
can be used to extend the timeout for the current callback invocation. The
timeout is given in seconds from the point in time when the function is
called.

Keyword arguments:

* actx -- the authorization context
* timeout_secs -- timeout value

### connect

```python
connect(dx, sock, type, ip, port, path) -> None
```

Connects to the ConfD daemon. The socket instance provided via the 'sock'
argument must be kept alive during the lifetime of the daemon context.

Keyword arguments:

* dx -- a daemon context acquired through a call to init_daemon()
* sock -- a Python socket instance
* type -- the socket type (CONTROL_SOCKET or WORKER_SOCKET)
* ip -- the ip address if socket is AF_INET (optional)
* port -- the port if socket is AF_INET (optional)
* path -- a filename if socket is AF_UNIX (optional).

### data_get_list_filter

```python
data_get_list_filter(tctx) -> ListFilter
```

Get list filter from transaction context.

Keyword arguments:

* tctx -- a transaction context

### data_reply_attrs

```python
data_reply_attrs(tctx, attrs) -> None
```

This function is used by the cb_get_attrs() callback to return the
requested attribute values.

Keyword arguments:

* tctx -- a transaction context
* attrs -- a list of _lib.AttrValue instances

### data_reply_found

```python
data_reply_found(tctx) -> None
```

This function is used by the cb_exists_optional() callback to indicate to
ConfD that a node does exist.

Keyword arguments:

* tctx -- a transaction context

### data_reply_next_key

```python
data_reply_next_key(tctx, keys, next) -> None
```

This function is used by the cb_get_next() and cb_find_next() callbacks to
return the next key.

Keyword arguments:

* tctx -- a transaction context
* keys -- a list of keys of _lib.Value for a list item (se below)
* next -- int value passed to the next invocation of cb_get_next() callback

A list may have mutiple key leafs specified in the data model. This is why
the keys argument must be a list.

### data_reply_next_object_array

```python
data_reply_next_object_array(tctx, v, next) -> None
```

This function is used by the optional cb_get_next_object() and
cb_find_next_object() callbacks to return an entire object including its keys.
It combines the functions of data_reply_next_key() and
data_reply_value_array().

Keyword arguments:

* tctx -- a transaction context
* v -- a list of _lib.Value instances
* next -- int value passed to the next invocation of cb_get_next() callback

### data_reply_next_object_arrays

```python
data_reply_next_object_arrays(tctx, objs, timeout_millisecs) -> None
```

This function is used by the optional cb_get_next_object() and
cb_find_next_object() callbacks to return multiple objects including their
keys, in _lib.Value form.

Keyword arguments:

* tctx -- a transaction context
* objs -- a list of tuples or None (see below)
* timeout_millisecs -- timeout value for ConfD's caching of returned data

The format of argument objs is list(tuple(list(_lib.Value), long)), or
None to indicate end of list. Another way to indicate end of list is to
include None as the first item in the 2-tuple last in the list.

E.g.:

    V = _lib.Value
    objs = [
             ( [ V(1), V(2) ], next1 ),
             ( [ V(3), V(4) ], next2 ),
             ( None, -1 )
           ]

### data_reply_next_object_tag_value_array

```python
data_reply_next_object_tag_value_array(tctx, tvs, next) -> None
```

This function is used by the optional cb_get_next_object() and
cb_find_next_object() callbacks to return an entire object including its keys

Keyword arguments:

* tctx -- a transaction context
* tvs -- a list of _lib.TagValue instances or None
* next -- int value passed to the next invocation of cb_get_next_object()
          callback

### data_reply_next_object_tag_value_arrays

```python
data_reply_next_object_tag_value_arrays(tctx, objs, timeout_millisecs) -> None
```

This function is used by the optional cb_get_next_object() and
cb_find_next_object() callbacks to return multiple objects including their
keys.

Keyword arguments:

* tctx -- a transaction context
* objs -- a list of tuples or None (see below)
* timeout_millisecs -- timeout value for ConfD's caching of returned data

The format of argument objs is list(tuple(list(_lib.TagValue), long)) or
None to indicate end of list. Another way to indicate end of list is to
include None as the first item in the 2-tuple last in the list.

E.g.:

    objs = [
             ( [ tagval1, tagval2 ], next1 ),
             ( [ tagval3, tagval4, tagval5 ], next2 ),
             ( None, -1 )
           ]

### data_reply_not_found

```python
data_reply_not_found(tctx) -> None
```

This function is used by the cb_get_elem() and cb_exists_optional()
callbacks to indicate to ConfD that a list entry or node does not exist.

Keyword arguments:

* tctx -- a transaction context

### data_reply_tag_value_array

```python
data_reply_tag_value_array(tctx, tvs) -> None
```

This function is used to return an array of values, corresponding to a
complete list entry, to ConfD. It can be used by the optional
cb_get_object() callback.

Keyword arguments:

* tctx -- a transaction context
* tvs -- a list of _lib.TagValue instances or None

### data_reply_value

```python
data_reply_value(tctx, v) -> None
```

This function is used to return a single data item to ConfD.

Keyword arguments:

* tctx -- a transaction context
* v -- a _lib.Value instance

### data_reply_value_array

```python
data_reply_value_array(tctx, vs) -> None
```

This function is used to return an array of values, corresponding to a
complete list entry, to ConfD. It can be used by the optional
cb_get_object() callback.

Keyword arguments:

* tctx -- a transaction context
* vs -- a list of _lib.Value instances

### data_set_timeout

```python
data_set_timeout(tctx, timeout_secs) -> None
```

A data callback should normally complete quickly, since e.g. the
execution of a 'show' command in the CLI may require many data callback
invocations. In some rare cases it may still be necessary for a data
callback to have a longer execution time, and then this function can be
used to extend (or shorten) the timeout for the current callback invocation.
The timeout is given in seconds from the point in time when the function is
called.

Keyword arguments:

* tctx -- a transaction context
* timeout_secs -- timeout value

### db_set_timeout

```python
db_set_timeout(dbx, timeout_secs) -> None
```

Some of the DB callbacks registered via register_db_cb(), e.g.
cb_copy_running_to_startup(), may require a longer execution time than
others. This function can be used to extend the timeout for the current
callback invocation. The timeout is given in seconds from the point in
time when the function is called.

Keyword arguments:

* dbx -- a db context of DbCtxRef
* timeout_secs -- timeout value

### db_seterr

```python
db_seterr(dbx, errstr) -> None
```

This function is used by the application to set an error string.

Keyword arguments:

* dbx -- a db context
* errstr -- an error message string

### db_seterr_extended

```python
db_seterr_extended(dbx, code, apptag_ns, apptag_tag, errstr) -> None
```

This function can be used to provide more structured error information
from a db callback.

Keyword arguments:

* dbx -- a db context
* code -- an error code
* apptag_ns -- namespace - should be set to 0
* apptag_tag -- either 0 or the hash value for a data model node
* errstr -- an error message string

### db_seterr_extended_info

```python

```

db_seterr_extended_info(dbx, code, apptag_ns, apptag_tag,
                        error_info, errstr) -> None

This function can be used to provide structured error information in the
same way as db_seterr_extended(), and additionally provide contents for
the NETCONF <error-info> element.

Keyword arguments:

* dbx -- a db context
* code -- an error code
* apptag_ns -- namespace - should be set to 0
* apptag_tag -- either 0 or the hash value for a data model node
* error_info -- a list of _lib.TagValue instances
* errstr -- an error message string

### delayed_reply_error

```python
delayed_reply_error(tctx, errstr) -> None
```

This function must be used to return an error when tha actual callback
returned CONFD_DELAYED_RESPONSE.

Keyword arguments:

* tctx -- a transaction context
* errstr -- an error message string

### delayed_reply_ok

```python
delayed_reply_ok(tctx) -> None
```

This function must be used to return the equivalent of CONFD_OK when the
actual callback returned CONFD_DELAYED_RESPONSE.

Keyword arguments:

* tctx -- a transaction context

### delayed_reply_validation_warn

```python
delayed_reply_validation_warn(tctx) -> None
```

This function must be used to return the equivalent of CONFD_VALIDATION_WARN
when the cb_validate() callback returned CONFD_DELAYED_RESPONSE.

Keyword arguments:

* tctx -- a transaction context

### error_seterr

```python
error_seterr(uinfo, errstr) -> None
```

This function must be called by format_error() (above) to provide a
 replacement for the default error message. If format_error() is called
 without calling error_seterr() the default message will be used.

Keyword arguments:

* uinfo -- a user info context
* errstr -- an string describing the error

### fd_ready

```python
fd_ready(dx, sock) -> None
```

The database application owns all data provider sockets to ConfD and is
responsible for the polling of these sockets. When one of the ConfD
sockets has I/O ready to read, the application must invoke fd_ready() on
the socket.

Keyword arguments:

* dx -- a daemon context acquired through a call to init_daemon()
* sock -- the socket

### init_daemon

```python
init_daemon(name) -> DaemonCtxRef
```

Initializes and returns a new daemon context.

Keyword arguments:

* name -- a string used to uniquely identify the daemon

### install_crypto_keys

```python
install_crypto_keys(dtx) -> None
```

It is possible to define AES keys inside confd.conf. These keys
are used by ConfD to encrypt data which is entered into the system.
The supported types are tailf:aes-cfb-128-encrypted-string and
tailf:aes-256-cfb-128-encrypted-string.
This function will copy those keys from ConfD (which reads confd.conf) into
memory in the library.

This function must be called before register_done() is called.

Keyword arguments:

* dtx -- a daemon context wich is connected through a call to connect()

### nano_service_reply_proplist

```python
nano_service_reply_proplist(tctx, proplist) -> None
```

This function must be called with the new property list, immediately prior
to returning from the callback, if the stored property list should be
updated. If a callback returns without calling nano_service_reply_proplist(),
the previous property list is retained. To completely delete the property
list, call this function with the proplist argument set to an empty list or
None.

The proplist argument should be a list of 2-tuples built up like this:
  list( (name, value), (name, value), ... )
In a 2-tuple both 'name' and 'value' must be strings.

Keyword arguments:

* tctx -- a transaction context
* proplist -- a list of properties or None

### notification_flush

```python
notification_flush(nctx) -> None
```

Notifications are sent asynchronously, i.e. normally without blocking the
caller of the send functions described above. This means that in some cases
ConfD's sending of the notifications on the northbound interfaces may lag
behind the send calls. This function can be used  to make sure that the
notifications have actually been sent out.

Keyword arguments:

* nctx -- notification context returned from register_notification_stream()

### notification_replay_complete

```python
notification_replay_complete(nctx) -> None
```

The application calls this function to notify ConfD that the replay is
complete

Keyword arguments:

* nctx -- notification context returned from register_notification_stream()

### notification_replay_failed

```python
notification_replay_failed(nctx) -> None
```

In case the application fails to complete the replay as requested (e.g. the
log gets overwritten while the replay is in progress), the application
should call this function instead of notification_replay_complete(). An
error message describing the reason for the failure can be supplied by
first calling notification_seterr() or notification_seterr_extended().

Keyword arguments:

* nctx -- notification context returned from register_notification_stream()

### notification_reply_log_times

```python
notification_reply_log_times(nctx, creation, aged) -> None
```

Reply function for use in the cb_get_log_times() callback invocation. If no
notifications have been aged out of the log, give None for the aged argument.

Keyword arguments:

* nctx -- notification context returned from register_notification_stream()
* creation -- a _lib.DateTime instance
* aged -- a _lib.DateTime instance or None

### notification_send

```python
notification_send(nctx, time, values) -> None
```

This function is called by the application to send a notification defined
at the top level of a YANG module, whether "live" or replay.

Keyword arguments:

* nctx -- notification context returned from register_notification_stream()
* time -- a _lib.DateTime instance
* values -- a list of _lib.TagValue instances or None

### notification_send_path

```python
notification_send_path(nctx, time, values, path) -> None
```

This function is called by the application to send a notification defined
as a child of a container or list in a YANG 1.1 module, whether "live" or
replay.

Keyword arguments:

* nctx -- notification context returned from register_notification_stream()
* time -- a _lib.DateTime instance
* values -- a list of _lib.TagValue instances or None
* path -- path to the parent of the notification in the data tree

### notification_send_snmp

```python
notification_send_snmp(nctx, notification, varbinds) -> None
```

Sends the SNMP notification specified by 'notification', without requesting
inform-request delivery information. This is equivalent to calling
notification_send_snmp_inform() with None as the cb_id argument. I.e. if
the common arguments are the same, the two functions will send the exact
same set of traps and inform-requests.

Keyword arguments:

* nctx -- notification context returned from register_snmp_notification()
* notification -- the notification string
* varbinds -- a list of _lib.SnmpVarbind instances or None

### notification_send_snmp_inform

```python
notification_send_snmp_inform(nctx, notification, varbinds, cb_id, ref) ->None
```

Sends the SNMP notification specified by notification. If cb_id is not None
the callbacks registered for cb_id will be invoked with the ref argument.

Keyword arguments:

* nctx -- notification context returned from register_snmp_notification()
* notification -- the notification string
* varbinds -- a list of _lib.SnmpVarbind instances or None
* cb_id -- callback id
* ref -- argument send to callbacks

### notification_set_fd

```python
notification_set_fd(nctx, sock) -> None
```

This function may optionally be called by the cb_replay() callback to
request that the worker socket given by 'sock' should be used for the
replay. Otherwise the socket specified in register_notification_stream()
will be used.

Keyword arguments:

* nctx -- notification context returned from register_notification_stream()
* sock -- a previously connected worker socket

### notification_set_snmp_notify_name

```python
notification_set_snmp_notify_name(nctx, notify_name) -> None
```

This function can be used to change the snmpNotifyName (notify_name) for
the nctx context.

Keyword arguments:

* nctx -- notification context returned from register_snmp_notification()
* notify_name -- the snmpNotifyName

### notification_set_snmp_src_addr

```python
notification_set_snmp_src_addr(nctx, family, src_addr) -> None
```

By default, the source address for the SNMP notifications that are sent by
the above functions is chosen by the IP stack of the OS. This function may
be used to select a specific source address, given by src_addr, for the
SNMP notifications subsequently sent using the nctx context. The default
can be restored by calling the function with family set to AF_UNSPEC.

Keyword arguments:

* nctx -- notification context returned from register_snmp_notification()
* family -- AF_INET, AF_INET6 or AF_UNSPEC
* src_addr -- the source address in string format

### notification_seterr

```python
notification_seterr(nctx, errstr) -> None
```

In some cases the callbacks may be unable to carry out the requested
actions, e.g. the capacity for simultaneous replays might be exceeded, and
they can then return CONFD_ERR. This function allows the callback to
associate an error message with the failure. It can also be used to supply
an error message before calling notification_replay_failed().

Keyword arguments:

* nctx -- notification context returned from register_notification_stream()
* errstr -- an error message string

### notification_seterr_extended

```python
notification_seterr_extended(nctx, code, apptag_ns, apptag_tag, errstr) ->None
```

This function can be used to provide more structured error information
from a notification callback.

Keyword arguments:

* nctx -- notification context returned from register_notification_stream()
* code -- an error code
* apptag_ns -- namespace - should be set to 0
* apptag_tag -- either 0 or the hash value for a data model node
* errstr -- an error message string

### notification_seterr_extended_info

```python

```

notification_seterr_extended_info(nctx, code, apptag_ns, apptag_tag,
                                  error_info, errstr) -> None

This function can be used to provide structured error information in the
same way as notification_seterr_extended(), and additionally provide
contents for the NETCONF <error-info> element.

Keyword arguments:

* nctx -- notification context returned from register_notification_stream()
* code -- an error code
* apptag_ns -- namespace - should be set to 0
* apptag_tag -- either 0 or the hash value for a data model node
* error_info -- a list of _lib.TagValue instances
* errstr -- an error message string

### register_action_cbs

```python
register_action_cbs(dx, actionpoint, acb) -> None
```

This function registers up to five callback functions, two of which will
be called in sequence when an action is invoked.

Keyword arguments:

* dx -- a daemon context acquired through a call to init_daemon()
* actionpoint -- the name of the action point
* vcb -- the callback instance (see below)

The acb argument should be an instance of a class with callback methods.
E.g.:

    class ActionCallbacks(object):
        def cb_init(self, uinfo):
            pass

        def cb_abort(self, uinfo):
            pass

        def cb_action(self, uinfo, name, kp, params):
            pass

        def cb_command(self, uinfo, path, argv):
            pass

        def cb_completion(self, uinfo, cli_style, token, completion_char,
                          kp, cmdpath, cmdparam_id, simpleType, extra):
            pass

    acb = ActionCallbacks()
    dp.register_action_cbs(dx, 'actionpoint-1', acb)

Notes about some of the callbacks:

cb_action()
    The params argument is a list of _lib.TagValue instances.

cb_command()
    The argv argument is a list of strings.

### register_auth_cb

```python
register_auth_cb(dx, acb) -> None
```

Registers the authentication callback.

Keyword arguments:

* dx -- a daemon context acquired through a call to init_daemon()
* abc -- the callback instance (see below)

E.g.:

    class AuthCallbacks(object):
        def cb_auth(self, actx):
            pass

    acb = AuthCallbacks()
    dp.register_auth_cb(dx, acb)

### register_authorization_cb

```python
register_authorization_cb(dx, acb, cmd_filter, data_filter) -> None
```

Keyword arguments:

* dx -- a daemon context acquired through a call to init_daemon()
* abc -- the callback instance (see below)
* cmd_filter -- set to 0 for no filtering
* data_filter -- set to 0 for no filtering

E.g.:

    class AuthorizationCallbacks(object):
        def cb_chk_cmd_access(self, actx, cmdtokens, cmdop):
            pass

        def cb_chk_data_access(self, actx, hashed_ns, hkp, dataop, how):
            pass

    acb = AuthCallbacks()
    dp.register_authorization_cb(dx, acb)

### register_data_cb

```python
register_data_cb(dx, callpoint, data, flags) -> None
```

Registers data manipulation callback functions.

Keyword arguments:

* dx -- a daemon context acquired through a call to init_daemon()
* callpoint -- name of a tailf:callpoint in the data model
* data -- the callback instance (see below)
* flags -- data callbacks flags, dp.DATA_* (optional)

The data argument should be an instance of a class with callback methods.
E.g.:

    class DataCallbacks(object):
        def cb_exists_optional(self, tctx, kp):
            pass

        def cb_get_elem(self, tctx, kp):
            pass

        def cb_get_next(self, tctx, kp, next):
            pass

        def cb_set_elem(self, tctx, kp, newval):
            pass

        def cb_create(self, tctx, kp):
            pass

        def cb_remove(self, tctx, kp):
            pass

        def cb_find_next(self, tctx, kp, type, keys):
            pass

        def cb_num_instances(self, tctx, kp):
            pass

        def cb_get_object(self, tctx, kp):
            pass

        def cb_get_next_object(self, tctx, kp, next):
            pass

        def cb_find_next_object(self, tctx, kp, type, keys):
            pass

        def cb_get_case(self, tctx, kp, choice):
            pass

        def cb_set_case(self, tctx, kp, choice, caseval):
            pass

        def cb_get_attrs(self, tctx, kp, attrs):
            pass

        def cb_set_attr(self, tctx, kp, attr, v):
            pass

        def cb_move_after(self, tctx, kp, prevkeys):
            pass

        def cb_write_all(self, tctx, kp):
            pass

    dcb = DataCallbacks()
    dp.register_data_cb(dx, 'example-callpoint-1', dcb)

### register_db_cb

```python
register_db_cb(dx, dbcbs) -> None
```

This function is used to set callback functions which span over several
ConfD transactions.

Keyword arguments:

* dx -- a daemon context acquired through a call to init_daemon()
* dbcbs -- the callback instance (see below)

The dbcbs argument should be an instance of a class with callback methods.
E.g.:

    class DbCallbacks(object):
        def cb_candidate_commit(self, dbx, timeout):
            pass

        def cb_candidate_confirming_commit(self, dbx):
            pass

        def cb_candidate_reset(self, dbx):
            pass

        def cb_candidate_chk_not_modified(self, dbx):
            pass

        def cb_candidate_rollback_running(self, dbx):
            pass

        def cb_candidate_validate(self, dbx):
            pass

        def cb_add_checkpoint_running(self, dbx):
            pass

        def cb_del_checkpoint_running(self, dbx):
            pass

        def cb_activate_checkpoint_running(self, dbx):
            pass

        def cb_copy_running_to_startup(self, dbx):
            pass

        def cb_running_chk_not_modified(self, dbx):
            pass

        def cb_lock(self, dbx, dbname):
            pass

        def cb_unlock(self, dbx, dbname):
            pass

        def cb_lock_partial(self, dbx, dbname, lockid, paths):
            pass

        def cb_ulock_partial(self, dbx, dbname, lockid):
            pass

        def cb_delete_confid(self, dbx, dbname):
            pass

    dbcbs = DbCallbacks()
    dp.register_db_cb(dx, dbcbs)

### register_done

```python
register_done(dx) -> None
```

When we have registered all the callbacks for a daemon (including the other
types described below if we have them), we must call this function to
synchronize with ConfD. No callbacks will be invoked until it has been
called, and after the call, no further registrations are allowed.

Keyword arguments:

* dx -- a daemon context acquired through a call to init_daemon()

### register_error_cb

```python
register_error_cb(dx, errortypes, ecbs) -> None
```

This funciton can be used to register error callbacks that are
invoked for internally generated errors.

Keyword arguments:

* dx -- a daemon context acquired through a call to init_daemon()
* errortypes -- logical OR of the error types that the ecbs should handle
* ecbs -- the callback instance (see below)

E.g.:

    class ErrorCallbacks(object):
        def cb_format_error(self, uinfo, errinfo_dict, default_msg):
            dp.error_seterr(uinfo, default_msg)
    ecbs = ErrorCallbacks()
    dp.register_error_cb(ctx,
                         dp.ERRTYPE_BAD_VALUE |
                         dp.ERRTYPE_MISC, ecbs)
    dp.register_done(ctx)

### register_nano_service_cb

```python
register_nano_service_cb(dx,servicepoint,componenttype,state,nscb) -> None
```

This function registers the nano service callbacks.

Keyword arguments:

* dx -- a daemon context acquired through a call to init_daemon()
* servicepoint -- name of the service point (string)
* componenttype -- name of the plan component for the nano service (string)
* state -- name of component state for the nano service (string)
* nscb -- the nano callback instance (see below)

E.g:

    class NanoServiceCallbacks(object):
        def cb_nano_create(self, tctx, root, service, plan,
                           component, state, proplist, compproplist):
            pass

        def cb_nano_delete(self, tctx, root, service, plan,
                           component, state, proplist, compproplist):
            pass

    nscb = NanoServiceCallbacks()
    dp.register_nano_service_cb(dx, 'service-point-1', 'comp', 'state', nscb)

### register_notification_snmp_inform_cb

```python
register_notification_snmp_inform_cb(dx, cb_id, cbs) -> None
```

If we want to receive information about the delivery of SNMP
inform-requests, we must register two callbacks for this.

Keyword arguments:

* dx -- a daemon context acquired through a call to init_daemon()
* cb_id -- the callback identifier
* cbs -- the callback instance (see below)

E.g.:

    class NotifySnmpCallbacks(object):
        def cb_targets(self, nctx, ref, targets):
            pass

        def cb_result(self, nctx, ref, target, got_response):
            pass

    cbs = NotifySnmpCallbacks()
    dp.register_notification_snmp_inform_cb(dx, 'callback-id-1', cbs)

### register_notification_stream

```python
register_notification_stream(dx, ncbs, sock, streamname) -> NotificationCtxRef
```

This function registers the notification stream and optionally two callback
functions used for the replay functionality.

The returned notification context must be used by the application for the
sending of live notifications via notification_send() or
notification_send_path().

Keyword arguments:

* dx -- a daemon context acquired through a call to init_daemon()
* ncbs -- the callback instance (see below)
* sock -- a previously connected worker socket
* streamname -- the name of the notification stream

E.g.:

    class NotificationCallbacks(object):
        def cb_get_log_times(self, nctx):
            pass

        def cb_replay(self, nctx, start, stop):
            pass

    ncbs = NotificationCallbacks()
    livectx = dp.register_notification_stream(dx, ncbs, workersock,
    'streamname')

### register_notification_sub_snmp_cb

```python
register_notification_sub_snmp_cb(dx, sub_id, cbs) -> None
```

Registers a callback function to be called when an SNMP notification is
received by the SNMP gateway.

Keyword arguments:

* dx -- a daemon context acquired through a call to init_daemon()
* sub_id -- the subscription id for the notifications
* cbs -- the callback instance (see below)

E.g.:

    class NotifySubSnmpCallbacks(object):
        def cb_recv(self, nctx, notification, varbinds, src_addr, port):
            pass

    cbs = NotifySubSnmpCallbacks()
    dp.register_notification_sub_snmp_cb(dx, 'sub-id-1', cbs)

### register_range_action_cbs

```python
register_range_action_cbs(dx, actionpoint, acb, lower, upper, path) -> None
```

A variant of register_action_cbs() which registers action callbacks for a
range of key values. The lower, upper, and path arguments are the same as
for register_range_data_cb().

Keyword arguments:

* dx -- a daemon context acquired through a call to init_daemon()
* actionpoint -- the name of the action point
* data -- the callback instance (see register_action_cbs())
* lower -- a list of Value's or None
* upper -- a list of Value's or None
* path -- path for the list (string)

### register_range_data_cb

```python

```

register_range_data_cb(dx, callpoint, data, lower, upper, path,
                       flags) -> None

This is a variant of register_data_cb() which registers a set of callbacks
for a range of list entries.

Keyword arguments:

* dx -- a daemon context acquired through a call to init_daemon()
* callpoint -- name of a tailf:callpoint in the data model
* data -- the callback instance (see register_data_cb())
* lower -- a list of Value's or None
* upper -- a list of Value's or None
* path -- path for the list (string)
* flags -- data callbacks flags, dp.DATA_* (optional)

### register_range_valpoint_cb

```python
register_range_valpoint_cb(dx, valpoint, vcb, lower, upper, path) -> None
```

A variant of register_valpoint_cb() which registers a validation function
for a range of key values. The lower, upper and path arguments are the same
as for register_range_data_cb().

Keyword arguments:

* dx -- a daemon context acquired through a call to init_daemon()
* valpoint -- name of a validation point
* data -- the callback instance (see register_valpoint_cb())
* lower -- a list of Value's or None
* upper -- a list of Value's or None
* path -- path for the list (string)

### register_service_cb

```python
register_service_cb(dx, servicepoint, scb) -> None
```

This function registers the service callbacks.

Keyword arguments:

* dx -- a daemon context acquired through a call to init_daemon()
* servicepoint -- name of the service point (string)
* scb -- the callback instance (see below)

E.g:

    class ServiceCallbacks(object):
        def cb_create(self, tctx, kp, proplist, fastmap_thandle):
            pass

        def cb_pre_modification(self, tctx, op, kp, proplist):
            pass

        def cb_post_modification(self, tctx, op, kp, proplist):
            pass

    scb = ServiceCallbacks()
    dp.register_service_cb(dx, 'service-point-1', scb)

### register_snmp_notification

```python
register_snmp_notification(dx, sock, notify_name, ctx_name) -> NotificationCtxRef
```

SNMP notifications can also be sent via the notification framework, however
most aspects of the stream concept do not apply for SNMP. This function is
used to register a worker socket, the snmpNotifyName (notify_name), and
SNMP context (ctx_name) to be used for the notifications.

Keyword arguments:

* dx -- a daemon context acquired through a call to init_daemon()
* sock -- a previously connected worker socket
* notify_name -- the snmpNotifyName
* ctx_name -- the SNMP context

### register_trans_cb

```python
register_trans_cb(dx, trans) -> None
```

Registers transaction callback functions.

Keyword arguments:

* dx -- a daemon context acquired through a call to init_daemon()
* trans -- the callback instance (see below)

The trans argument should be an instance of a class with callback methods.
E.g.:

    class TransCallbacks(object):
        def cb_init(self, tctx):
            pass

        def cb_trans_lock(self, tctx):
            pass

        def cb_trans_unlock(self, tctx):
            pass

        def cb_write_start(self, tctx):
            pass

        def cb_prepare(self, tctx):
            pass

        def cb_abort(self, tctx):
            pass

        def cb_commit(self, tctx):
            pass

        def cb_finish(self, tctx):
            pass

        def cb_interrupt(self, tctx):
            pass

    tcb = TransCallbacks()
    dp.register_trans_cb(dx, tcb)

### register_trans_validate_cb

```python
register_trans_validate_cb(dx, vcbs) -> None
```

This function installs two callback functions for the daemon context. One
function that gets called when the validation phase starts in a transaction
and one when the validation phase stops in a transaction.

Keyword arguments:

* dx -- a daemon context acquired through a call to init_daemon()
* vcbs -- the callback instance (see below)

The vcbs argument should be an instance of a class with callback methods.
E.g.:

    class TransValidateCallbacks(object):
        def cb_init(self, tctx):
            pass

        def cb_stop(self, tctx):
            pass

    vcbs = TransValidateCallbacks()
    dp.register_trans_validate_cb(dx, vcbs)

### register_usess_cb

```python
register_usess_cb(dx, ucb) -> None
```

This function can be used to register information callbacks that are
invoked for user session start and stop.

Keyword arguments:

* dx -- a daemon context acquired through a call to init_daemon()
* ucb -- the callback instance (see below)

E.g.:

    class UserSessionCallbacks(object):
        def cb_start(self, dx, uinfo):
            pass

        def cb_stop(self, dx, uinfo):
            pass

    ucb = UserSessionCallbacks()
    dp.register_usess_cb(dx, acb)

### register_valpoint_cb

```python
register_valpoint_cb(dx, valpoint, vcb) -> None
```

We must also install an actual validation function for each validation
point, i.e. for each tailf:validate statement in the YANG data model.

Keyword arguments:

* dx -- a daemon context acquired through a call to init_daemon()
* valpoint -- the name of the validation point
* vcb -- the callback instance (see below)

The vcb argument should be an instance of a class with a callback method.
E.g.:

    class ValpointCallback(object):
        def cb_validate(self, tctx, kp, newval):
            pass

    vcb = ValpointCallback()
    dp.register_valpoint_cb(dx, 'valpoint-1', vcb)

### release_daemon

```python
release_daemon(dx) -> None
```

Releases all memory that has been allocated by init_daemon() and other
functions for the daemon context. The control socket as well as all the
worker sockets must be closed by the application (before or after
release_daemon() has been called).

Keyword arguments:

* dx -- a daemon context acquired through a call to init_daemon()

### service_reply_proplist

```python
service_reply_proplist(tctx, proplist) -> None
```

This function must be called with the new property list, immediately prior
to returning from the callback, if the stored property list should be
updated. If a callback returns without calling service_reply_proplist(),
the previous property list is retained. To completely delete the property
list, call this function with the proplist argument set to an empty list or
None.

The proplist argument should be a list of 2-tuples built up like this:
  list( (name, value), (name, value), ... )
In a 2-tuple both 'name' and 'value' must be strings.

Keyword arguments:

* tctx -- a transaction context
* proplist -- a list of properties or None

### set_daemon_flags

```python
set_daemon_flags(dx, flags) -> None
```

Modifies the API behaviour according to the flags ORed into the flags
argument.

Keyword arguments:

* dx -- a daemon context acquired through a call to init_daemon()
* flags -- the flags to set

### trans_set_fd

```python
trans_set_fd(tctx, sock) -> None
```

Associate a worker socket with the transaction, or validation phase. This
function must be called in the transaction and validation cb_init()
callbacks.

Keyword arguments:

* tctx -- a transaction context
* sock -- a previously connected worker socket

A minimal implementation of a transaction cb_init() callback looks like:

    class TransCb(object):
        def __init__(self, workersock):
            self.workersock = workersock

        def cb_init(self, tctx):
            dp.trans_set_fd(tctx, self.workersock)

### trans_seterr

```python
trans_seterr(tctx, errstr) -> None
```

This function is used by the application to set an error string.

Keyword arguments:

* tctx -- a transaction context
* errstr -- an error message string

### trans_seterr_extended

```python
trans_seterr_extended(tctx, code, apptag_ns, apptag_tag, errstr) -> None
```

This function can be used to provide more structured error information
from a transaction or data callback.

Keyword arguments:

* tctx -- a transaction context
* code -- an error code
* apptag_ns -- namespace - should be set to 0
* apptag_tag -- either 0 or the hash value for a data model node
* errstr -- an error message string

### trans_seterr_extended_info

```python

```

trans_seterr_extended_info(tctx, code, apptag_ns, apptag_tag,
                           error_info, errstr) -> None

This function can be used to provide structured error information in the
same way as trans_seterr_extended(), and additionally provide contents for
the NETCONF <error-info> element.

Keyword arguments:

* tctx -- a transaction context
* code -- an error code
* apptag_ns -- namespace - should be set to 0
* apptag_tag -- either 0 or the hash value for a data model node
* error_info -- a list of _lib.TagValue instances
* errstr -- an error message string


## Classes

### _class_ **AuthCtxRef**

This type represents the c-type struct confd_auth_ctx.

Available attributes:

* uinfo -- the user info (UserInfo)
* method -- the method (string)
* success -- success or failure (bool)
* groups -- authorization groups if success is True (list of strings)
* logno -- log number if success is False (int)
* reason -- error reason if success is False (string)

AuthCtxRef cannot be directly instantiated from Python.

Members:

_None_

### _class_ **AuthorizationCtxRef**

This type represents the c-type struct confd_authorization_ctx.

Available attributes:

* uinfo -- the user info (UserInfo) or None
* groups -- authorization groups (list of strings) or None

AuthorizationCtxRef cannot be directly instantiated from Python.

Members:

_None_

### _class_ **DaemonCtxRef**

struct confd_daemon_ctx references object

Members:

_None_

### _class_ **DbCtxRef**

This type represents the c-type struct confd_db_ctx.

DbCtxRef cannot be directly instantiated from Python.

Members:

<details>

<summary>did(...)</summary>

Method:

```python
did() -> int
```


</details>

<details>

<summary>dx(...)</summary>

Method:

```python
dx() -> DaemonCtxRef
```


</details>

<details>

<summary>lastop(...)</summary>

Method:

```python
lastop() -> int
```


</details>

<details>

<summary>qref(...)</summary>

Method:

```python
qref() -> int
```


</details>

<details>

<summary>uinfo(...)</summary>

Method:

```python
uinfo() -> _ncs.UserInfo
```


</details>

### _class_ **ListFilter**

This type represents the c-type struct confd_list_filter.

Available attributes:

* type -- filter type, LF_*
* expr1 -- OR, AND, NOT expression
* expr2 -- OR, AND expression
* op -- operation, CMP_* and EXEC_*
* node -- filter tagpath
* val -- filter value

ListFilter cannot be directly instantiated from Python.

Members:

_None_

### _class_ **NotificationCtxRef**

This type represents the c-type struct confd_notification_ctx.

Available attributes:

* name -- stream name or snmp notify name (string or None)
* ctx_name -- for snmp only (string or None)
* fd -- worker socket (int)
* dx -- the daemon context (DaemonCtxRef)

NotificationCtxRef cannot be directly instantiated from Python.

Members:

_None_

### _class_ **TrItemRef**

This type represents the c-type confd_tr_item.

Available attributes:

* callpoint -- the callpoint (string)
* op -- operation, one of C_SET_ELEM, C_CREATE, C_REMOVE, C_SET_CASE,
        C_SET_ATTR or C_MOVE_AFTER (int)
* hkp -- the keypath (HKeypathRef)
* val -- the value (Value or None)
* choice -- the choice, only for C_SET_CASE (Value or None)
* attr -- attribute, only for C_SET_ATTR (int or None)
* next -- the next TrItemRef object in the linked list or None if no more
          items are found

TrItemRef cannot be directly instantiated from Python.

Members:

_None_

