# \_ncs.dp Module

Low level callback module for connecting data providers to NCS.

This module is used to connect to the NCS Data Provider API. The purpose of this API is to provide callback hooks so that user-written data providers can provide data stored externally to NCS. NCS needs this information in order to drive its northbound agents.

The module is also used to populate items in the data model which are not data or configuration items, such as statistics items from the device.

The module consists of a number of API functions whose purpose is to install different callback functions at different points in the data model tree which is the representation of the device configuration. Read more about callpoints in tailf\_yang\_extensions(5). Read more about how to use the module in the User Guide chapters on Operational data and External data.

This documentation should be read together with the [confd\_lib\_dp(3)](../../resources/man/confd_lib_dp.3.md) man page.

## Functions

### aaa\_reload

```python
aaa_reload(tctx) -> None
```

When the ConfD AAA tree is populated by an external data provider (see the AAA chapter in the User Guide), this function can be used by the data provider to notify ConfD when there is a change to the AAA data.

Keyword arguments:

* tctx -- a transaction context

### access\_reply\_result

```python
access_reply_result(actx, result) -> None
```

The callbacks must call this function to report the result of the access check to ConfD, and should normally return CONFD\_OK. If any other value is returned, it will cause the access check to be rejected.

Keyword arguments:

* actx -- the authorization context
* result -- the result (ACCESS\_RESULT\_xxx)

### action\_delayed\_reply\_error

```python
action_delayed_reply_error(uinfo, errstr) -> None
```

If we use the CONFD\_DELAYED\_RESPONSE as a return value from the action callback, we must later asynchronously reply. This function is used to reply with error.

Keyword arguments:

* uinfo -- a user info context
* errstr -- an error string

### action\_delayed\_reply\_ok

```python
action_delayed_reply_ok(uinfo) -> None
```

If we use the CONFD\_DELAYED\_RESPONSE as a return value from the action callback, we must later asynchronously reply. This function is used to reply with success.

Keyword arguments:

* uinfo -- a user info context

### action\_reply\_command

```python
action_reply_command(uinfo, values) -> None
```

If a CLI callback command should return data, it must invoke this function in response to the cb\_command() callback.

Keyword arguments:

* uinfo -- a user info context
* values -- a list of strings or None

### action\_reply\_completion

```python
action_reply_completion(uinfo, values) -> None
```

This function must normally be called in response to the cb\_completion() callback.

Keyword arguments:

* uinfo -- a user info context
* values -- a list of 3-tuples or None (see below)

The values argument must be None or a list of 3-tuples where each tuple is built up like:

```
(type::int, value::string, extra::string)
```

The third item of the tuple (extra) may be set to None.

### action\_reply\_range\_enum

```python
action_reply_range_enum(uinfo, values, keysize) -> None
```

This function must be called in response to the cb\_completion() callback when it is invoked via a tailf:cli-custom-range-enumerator statement in the data model.

Keyword arguments:

* uinfo -- a user info context
* values -- a list of keys as strings or None
* keysize -- number of keys for the list in the data model

The values argument is a flat list of keys. If the list in the data model specifies multiple keys this list is still flat. The keysize argument tells us how many keys to use for each list element. So the size of values should be a multiple of keysize.

### action\_reply\_rewrite

```python
action_reply_rewrite(uinfo, values, unhides) -> None
```

This function can be called instead of action\_reply\_command() as a response to a show path rewrite callback invocation.

Keyword arguments:

* uinfo -- a user info context
* values -- a list of strings or None
* unhides -- a list of strings or None

### action\_reply\_rewrite2

```python
action_reply_rewrite2(uinfo, values, unhides, selects) -> None
```

This function can be called instead of action\_reply\_command() as a response to a show path rewrite callback invocation.

Keyword arguments:

* uinfo -- a user info context
* values -- a list of strings or None
* unhides -- a list of strings or None
* selects -- a list of strings or None

### action\_reply\_values

```python
action_reply_values(uinfo, values) -> None
```

If the action definition specifies that the action should return data, it must invoke this function in response to the cb\_action() callback.

Keyword arguments:

* uinfo -- a user info context
* values -- a list of \_lib.TagValue instances or None

### action\_set\_fd

```python
action_set_fd(uinfo, sock) -> None
```

Associate a worker socket with the action. This function must be called in the action cb\_init() callback.

Keyword arguments:

* uinfo -- a user info context
* sock -- a previously connected worker socket

A typical implementation of an action cb\_init() callback looks like:

```
class ActionCallbacks(object):
    def __init__(self, workersock):
        self.workersock = workersock

    def cb_init(self, uinfo):
        dp.action_set_fd(uinfo, self.workersock)
```

### action\_set\_timeout

```python
action_set_timeout(uinfo, timeout_secs) -> None
```

Some action callbacks may require a significantly longer execution time than others, and this time may not even be possible to determine statically (e.g. a file download). In such cases the /confdConfig/capi/queryTimeout setting in confd.conf may be insufficient, and this function can be used to extend (or shorten) the timeout for the current callback invocation. The timeout is given in seconds from the point in time when the function is called.

Keyword arguments:

* uinfo -- a user info context
* timeout\_secs -- timeout value

### action\_seterr

```python
action_seterr(uinfo, errstr) -> None
```

If action callback encounters fatal problems that can not be expressed via the reply function, it may call this function with an appropriate message and return CONFD\_ERR instead of CONFD\_OK.

Keyword arguments:

* uinfo -- a user info context
* errstr -- an error message string

### action\_seterr\_extended

```python
action_seterr_extended(uninfo, code, apptag_ns, apptag_tag, errstr) -> None
```

This function can be used to provide more structured error information from an action callback.

Keyword arguments:

* uinfo -- a user info context
* code -- an error code
* apptag\_ns -- namespace - should be set to 0
* apptag\_tag -- either 0 or the hash value for a data model node
* errstr -- an error message string

### action\_seterr\_extended\_info

```python
action_seterr_extended_info(uinfo, code, apptag_ns, apptag_tag,
                            error_info, errstr) -> None
```

This function can be used to provide structured error information in the same way as action\_seterr\_extended(), and additionally provide contents for the NETCONF element.

Keyword arguments:

* uinfo -- a user info context
* code -- an error code
* apptag\_ns -- namespace - should be set to 0
* apptag\_tag -- either 0 or the hash value for a data model node
* error\_info -- a list of \_lib.TagValue instances
* errstr -- an error message string

### auth\_seterr

```python
auth_seterr(actx, errstr) -> None
```

This function is used by the application to set an error string.

This function can be used to provide a text message when the callback returns CONFD\_ERR. If used when rejecting a successful authentication, the message will be logged in ConfD's audit log (otherwise a generic "rejected by application callback" message is logged).

Keyword arguments:

* actx -- the auth context
* errstr -- an error message string

### authorization\_set\_timeout

```python
authorization_set_timeout(actx, timeout_secs) -> None
```

The authorization callbacks are invoked on the daemon control socket, and as such are expected to complete quickly. However in case they send requests to a remote server, and such a request needs to be retried, this function can be used to extend the timeout for the current callback invocation. The timeout is given in seconds from the point in time when the function is called.

Keyword arguments:

* actx -- the authorization context
* timeout\_secs -- timeout value

### connect

```python
connect(dx, sock, type, ip, port, path) -> None
```

Connects to the ConfD daemon. The socket instance provided via the 'sock' argument must be kept alive during the lifetime of the daemon context.

Keyword arguments:

* dx -- a daemon context acquired through a call to init\_daemon()
* sock -- a Python socket instance
* type -- the socket type (CONTROL\_SOCKET or WORKER\_SOCKET)
* ip -- the ip address if socket is AF\_INET (optional)
* port -- the port if socket is AF\_INET (optional)
* path -- a filename if socket is AF\_UNIX (optional).

### data\_get\_list\_filter

```python
data_get_list_filter(tctx) -> ListFilter
```

Get list filter from transaction context.

Keyword arguments:

* tctx -- a transaction context

### data\_reply\_attrs

```python
data_reply_attrs(tctx, attrs) -> None
```

This function is used by the cb\_get\_attrs() callback to return the requested attribute values.

Keyword arguments:

* tctx -- a transaction context
* attrs -- a list of \_lib.AttrValue instances

### data\_reply\_found

```python
data_reply_found(tctx) -> None
```

This function is used by the cb\_exists\_optional() callback to indicate to ConfD that a node does exist.

Keyword arguments:

* tctx -- a transaction context

### data\_reply\_next\_key

```python
data_reply_next_key(tctx, keys, next) -> None
```

This function is used by the cb\_get\_next() and cb\_find\_next() callbacks to return the next key.

Keyword arguments:

* tctx -- a transaction context
* keys -- a list of keys of \_lib.Value for a list item (se below)
* next -- int value passed to the next invocation of cb\_get\_next() callback

A list may have mutiple key leafs specified in the data model. This is why the keys argument must be a list.

### data\_reply\_next\_object\_array

```python
data_reply_next_object_array(tctx, v, next) -> None
```

This function is used by the optional cb\_get\_next\_object() and cb\_find\_next\_object() callbacks to return an entire object including its keys. It combines the functions of data\_reply\_next\_key() and data\_reply\_value\_array().

Keyword arguments:

* tctx -- a transaction context
* v -- a list of \_lib.Value instances
* next -- int value passed to the next invocation of cb\_get\_next() callback

### data\_reply\_next\_object\_arrays

```python
data_reply_next_object_arrays(tctx, objs, timeout_millisecs) -> None
```

This function is used by the optional cb\_get\_next\_object() and cb\_find\_next\_object() callbacks to return multiple objects including their keys, in \_lib.Value form.

Keyword arguments:

* tctx -- a transaction context
* objs -- a list of tuples or None (see below)
* timeout\_millisecs -- timeout value for ConfD's caching of returned data

The format of argument objs is list(tuple(list(\_lib.Value), long)), or None to indicate end of list. Another way to indicate end of list is to include None as the first item in the 2-tuple last in the list.

E.g.:

```
V = _lib.Value
objs = [
         ( [ V(1), V(2) ], next1 ),
         ( [ V(3), V(4) ], next2 ),
         ( None, -1 )
       ]
```

### data\_reply\_next\_object\_tag\_value\_array

```python
data_reply_next_object_tag_value_array(tctx, tvs, next) -> None
```

This function is used by the optional cb\_get\_next\_object() and cb\_find\_next\_object() callbacks to return an entire object including its keys

Keyword arguments:

* tctx -- a transaction context
* tvs -- a list of \_lib.TagValue instances or None
* next -- int value passed to the next invocation of cb\_get\_next\_object() callback

### data\_reply\_next\_object\_tag\_value\_arrays

```python
data_reply_next_object_tag_value_arrays(tctx, objs, timeout_millisecs) -> None
```

This function is used by the optional cb\_get\_next\_object() and cb\_find\_next\_object() callbacks to return multiple objects including their keys.

Keyword arguments:

* tctx -- a transaction context
* objs -- a list of tuples or None (see below)
* timeout\_millisecs -- timeout value for ConfD's caching of returned data

The format of argument objs is list(tuple(list(\_lib.TagValue), long)) or None to indicate end of list. Another way to indicate end of list is to include None as the first item in the 2-tuple last in the list.

E.g.:

```
objs = [
         ( [ tagval1, tagval2 ], next1 ),
         ( [ tagval3, tagval4, tagval5 ], next2 ),
         ( None, -1 )
       ]
```

### data\_reply\_not\_found

```python
data_reply_not_found(tctx) -> None
```

This function is used by the cb\_get\_elem() and cb\_exists\_optional() callbacks to indicate to ConfD that a list entry or node does not exist.

Keyword arguments:

* tctx -- a transaction context

### data\_reply\_tag\_value\_array

```python
data_reply_tag_value_array(tctx, tvs) -> None
```

This function is used to return an array of values, corresponding to a complete list entry, to ConfD. It can be used by the optional cb\_get\_object() callback.

Keyword arguments:

* tctx -- a transaction context
* tvs -- a list of \_lib.TagValue instances or None

### data\_reply\_value

```python
data_reply_value(tctx, v) -> None
```

This function is used to return a single data item to ConfD.

Keyword arguments:

* tctx -- a transaction context
* v -- a \_lib.Value instance

### data\_reply\_value\_array

```python
data_reply_value_array(tctx, vs) -> None
```

This function is used to return an array of values, corresponding to a complete list entry, to ConfD. It can be used by the optional cb\_get\_object() callback.

Keyword arguments:

* tctx -- a transaction context
* vs -- a list of \_lib.Value instances

### data\_set\_timeout

```python
data_set_timeout(tctx, timeout_secs) -> None
```

A data callback should normally complete quickly, since e.g. the execution of a 'show' command in the CLI may require many data callback invocations. In some rare cases it may still be necessary for a data callback to have a longer execution time, and then this function can be used to extend (or shorten) the timeout for the current callback invocation. The timeout is given in seconds from the point in time when the function is called.

Keyword arguments:

* tctx -- a transaction context
* timeout\_secs -- timeout value

### db\_set\_timeout

```python
db_set_timeout(dbx, timeout_secs) -> None
```

Some of the DB callbacks registered via register\_db\_cb(), e.g. cb\_copy\_running\_to\_startup(), may require a longer execution time than others. This function can be used to extend the timeout for the current callback invocation. The timeout is given in seconds from the point in time when the function is called.

Keyword arguments:

* dbx -- a db context of DbCtxRef
* timeout\_secs -- timeout value

### db\_seterr

```python
db_seterr(dbx, errstr) -> None
```

This function is used by the application to set an error string.

Keyword arguments:

* dbx -- a db context
* errstr -- an error message string

### db\_seterr\_extended

```python
db_seterr_extended(dbx, code, apptag_ns, apptag_tag, errstr) -> None
```

This function can be used to provide more structured error information from a db callback.

Keyword arguments:

* dbx -- a db context
* code -- an error code
* apptag\_ns -- namespace - should be set to 0
* apptag\_tag -- either 0 or the hash value for a data model node
* errstr -- an error message string

### db\_seterr\_extended\_info

```python
db_seterr_extended_info(dbx, code, apptag_ns, apptag_tag,
                        error_info, errstr) -> None
```

This function can be used to provide structured error information in the same way as db\_seterr\_extended(), and additionally provide contents for the NETCONF element.

Keyword arguments:

* dbx -- a db context
* code -- an error code
* apptag\_ns -- namespace - should be set to 0
* apptag\_tag -- either 0 or the hash value for a data model node
* error\_info -- a list of \_lib.TagValue instances
* errstr -- an error message string

### delayed\_reply\_error

```python
delayed_reply_error(tctx, errstr) -> None
```

This function must be used to return an error when tha actual callback returned CONFD\_DELAYED\_RESPONSE.

Keyword arguments:

* tctx -- a transaction context
* errstr -- an error message string

### delayed\_reply\_ok

```python
delayed_reply_ok(tctx) -> None
```

This function must be used to return the equivalent of CONFD\_OK when the actual callback returned CONFD\_DELAYED\_RESPONSE.

Keyword arguments:

* tctx -- a transaction context

### delayed\_reply\_validation\_warn

```python
delayed_reply_validation_warn(tctx) -> None
```

This function must be used to return the equivalent of CONFD\_VALIDATION\_WARN when the cb\_validate() callback returned CONFD\_DELAYED\_RESPONSE.

Keyword arguments:

* tctx -- a transaction context

### error\_seterr

```python
error_seterr(uinfo, errstr) -> None
```

This function must be called by format\_error() (above) to provide a replacement for the default error message. If format\_error() is called without calling error\_seterr() the default message will be used.

Keyword arguments:

* uinfo -- a user info context
* errstr -- an string describing the error

### fd\_ready

```python
fd_ready(dx, sock) -> None
```

The database application owns all data provider sockets to ConfD and is responsible for the polling of these sockets. When one of the ConfD sockets has I/O ready to read, the application must invoke fd\_ready() on the socket.

Keyword arguments:

* dx -- a daemon context acquired through a call to init\_daemon()
* sock -- the socket

### init\_daemon

```python
init_daemon(name) -> DaemonCtxRef
```

Initializes and returns a new daemon context.

Keyword arguments:

* name -- a string used to uniquely identify the daemon

### install\_crypto\_keys

```python
install_crypto_keys(dtx) -> None
```

It is possible to define AES keys inside confd.conf. These keys are used by ConfD to encrypt data which is entered into the system. The supported types are tailf:aes-cfb-128-encrypted-string and tailf:aes-256-cfb-128-encrypted-string. This function will copy those keys from ConfD (which reads confd.conf) into memory in the library.

This function must be called before register\_done() is called.

Keyword arguments:

* dtx -- a daemon context wich is connected through a call to connect()

### nano\_service\_reply\_proplist

```python
nano_service_reply_proplist(tctx, proplist) -> None
```

This function must be called with the new property list, immediately prior to returning from the callback, if the stored property list should be updated. If a callback returns without calling nano\_service\_reply\_proplist(), the previous property list is retained. To completely delete the property list, call this function with the proplist argument set to an empty list or None.

The proplist argument should be a list of 2-tuples built up like this: list( (name, value), (name, value), ... ) In a 2-tuple both 'name' and 'value' must be strings.

Keyword arguments:

* tctx -- a transaction context
* proplist -- a list of properties or None

### notification\_flush

```python
notification_flush(nctx) -> None
```

Notifications are sent asynchronously, i.e. normally without blocking the caller of the send functions described above. This means that in some cases ConfD's sending of the notifications on the northbound interfaces may lag behind the send calls. This function can be used to make sure that the notifications have actually been sent out.

Keyword arguments:

* nctx -- notification context returned from register\_notification\_stream()

### notification\_replay\_complete

```python
notification_replay_complete(nctx) -> None
```

The application calls this function to notify ConfD that the replay is complete

Keyword arguments:

* nctx -- notification context returned from register\_notification\_stream()

### notification\_replay\_failed

```python
notification_replay_failed(nctx) -> None
```

In case the application fails to complete the replay as requested (e.g. the log gets overwritten while the replay is in progress), the application should call this function instead of notification\_replay\_complete(). An error message describing the reason for the failure can be supplied by first calling notification\_seterr() or notification\_seterr\_extended().

Keyword arguments:

* nctx -- notification context returned from register\_notification\_stream()

### notification\_reply\_log\_times

```python
notification_reply_log_times(nctx, creation, aged) -> None
```

Reply function for use in the cb\_get\_log\_times() callback invocation. If no notifications have been aged out of the log, give None for the aged argument.

Keyword arguments:

* nctx -- notification context returned from register\_notification\_stream()
* creation -- a \_lib.DateTime instance
* aged -- a \_lib.DateTime instance or None

### notification\_send

```python
notification_send(nctx, time, values) -> None
```

This function is called by the application to send a notification defined at the top level of a YANG module, whether "live" or replay.

Keyword arguments:

* nctx -- notification context returned from register\_notification\_stream()
* time -- a \_lib.DateTime instance
* values -- a list of \_lib.TagValue instances or None

### notification\_send\_path

```python
notification_send_path(nctx, time, values, path) -> None
```

This function is called by the application to send a notification defined as a child of a container or list in a YANG 1.1 module, whether "live" or replay.

Keyword arguments:

* nctx -- notification context returned from register\_notification\_stream()
* time -- a \_lib.DateTime instance
* values -- a list of \_lib.TagValue instances or None
* path -- path to the parent of the notification in the data tree

### notification\_send\_snmp

```python
notification_send_snmp(nctx, notification, varbinds) -> None
```

Sends the SNMP notification specified by 'notification', without requesting inform-request delivery information. This is equivalent to calling notification\_send\_snmp\_inform() with None as the cb\_id argument. I.e. if the common arguments are the same, the two functions will send the exact same set of traps and inform-requests.

Keyword arguments:

* nctx -- notification context returned from register\_snmp\_notification()
* notification -- the notification string
* varbinds -- a list of \_lib.SnmpVarbind instances or None

### notification\_send\_snmp\_inform

```python
notification_send_snmp_inform(nctx, notification, varbinds, cb_id, ref) ->None
```

Sends the SNMP notification specified by notification. If cb\_id is not None the callbacks registered for cb\_id will be invoked with the ref argument.

Keyword arguments:

* nctx -- notification context returned from register\_snmp\_notification()
* notification -- the notification string
* varbinds -- a list of \_lib.SnmpVarbind instances or None
* cb\_id -- callback id
* ref -- argument send to callbacks

### notification\_set\_fd

```python
notification_set_fd(nctx, sock) -> None
```

This function may optionally be called by the cb\_replay() callback to request that the worker socket given by 'sock' should be used for the replay. Otherwise the socket specified in register\_notification\_stream() will be used.

Keyword arguments:

* nctx -- notification context returned from register\_notification\_stream()
* sock -- a previously connected worker socket

### notification\_set\_snmp\_notify\_name

```python
notification_set_snmp_notify_name(nctx, notify_name) -> None
```

This function can be used to change the snmpNotifyName (notify\_name) for the nctx context.

Keyword arguments:

* nctx -- notification context returned from register\_snmp\_notification()
* notify\_name -- the snmpNotifyName

### notification\_set\_snmp\_src\_addr

```python
notification_set_snmp_src_addr(nctx, family, src_addr) -> None
```

By default, the source address for the SNMP notifications that are sent by the above functions is chosen by the IP stack of the OS. This function may be used to select a specific source address, given by src\_addr, for the SNMP notifications subsequently sent using the nctx context. The default can be restored by calling the function with family set to AF\_UNSPEC.

Keyword arguments:

* nctx -- notification context returned from register\_snmp\_notification()
* family -- AF\_INET, AF\_INET6 or AF\_UNSPEC
* src\_addr -- the source address in string format

### notification\_seterr

```python
notification_seterr(nctx, errstr) -> None
```

In some cases the callbacks may be unable to carry out the requested actions, e.g. the capacity for simultaneous replays might be exceeded, and they can then return CONFD\_ERR. This function allows the callback to associate an error message with the failure. It can also be used to supply an error message before calling notification\_replay\_failed().

Keyword arguments:

* nctx -- notification context returned from register\_notification\_stream()
* errstr -- an error message string

### notification\_seterr\_extended

```python
notification_seterr_extended(nctx, code, apptag_ns, apptag_tag, errstr) ->None
```

This function can be used to provide more structured error information from a notification callback.

Keyword arguments:

* nctx -- notification context returned from register\_notification\_stream()
* code -- an error code
* apptag\_ns -- namespace - should be set to 0
* apptag\_tag -- either 0 or the hash value for a data model node
* errstr -- an error message string

### notification\_seterr\_extended\_info

```python
notification_seterr_extended_info(nctx, code, apptag_ns, apptag_tag,
                                  error_info, errstr) -> None
```

This function can be used to provide structured error information in the same way as notification\_seterr\_extended(), and additionally provide contents for the NETCONF element.

Keyword arguments:

* nctx -- notification context returned from register\_notification\_stream()
* code -- an error code
* apptag\_ns -- namespace - should be set to 0
* apptag\_tag -- either 0 or the hash value for a data model node
* error\_info -- a list of \_lib.TagValue instances
* errstr -- an error message string

### register\_action\_cbs

```python
register_action_cbs(dx, actionpoint, acb) -> None
```

This function registers up to five callback functions, two of which will be called in sequence when an action is invoked.

Keyword arguments:

* dx -- a daemon context acquired through a call to init\_daemon()
* actionpoint -- the name of the action point
* vcb -- the callback instance (see below)

The acb argument should be an instance of a class with callback methods. E.g.:

```
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
```

Notes about some of the callbacks:

cb\_action() The params argument is a list of \_lib.TagValue instances.

cb\_command() The argv argument is a list of strings.

### register\_auth\_cb

```python
register_auth_cb(dx, acb) -> None
```

Registers the authentication callback.

Keyword arguments:

* dx -- a daemon context acquired through a call to init\_daemon()
* abc -- the callback instance (see below)

E.g.:

```
class AuthCallbacks(object):
    def cb_auth(self, actx):
        pass

acb = AuthCallbacks()
dp.register_auth_cb(dx, acb)
```

### register\_authorization\_cb

```python
register_authorization_cb(dx, acb, cmd_filter, data_filter) -> None
```

Keyword arguments:

* dx -- a daemon context acquired through a call to init\_daemon()
* abc -- the callback instance (see below)
* cmd\_filter -- set to 0 for no filtering
* data\_filter -- set to 0 for no filtering

E.g.:

```
class AuthorizationCallbacks(object):
    def cb_chk_cmd_access(self, actx, cmdtokens, cmdop):
        pass

    def cb_chk_data_access(self, actx, hashed_ns, hkp, dataop, how):
        pass

acb = AuthCallbacks()
dp.register_authorization_cb(dx, acb)
```

### register\_data\_cb

```python
register_data_cb(dx, callpoint, data, flags) -> None
```

Registers data manipulation callback functions.

Keyword arguments:

* dx -- a daemon context acquired through a call to init\_daemon()
* callpoint -- name of a tailf:callpoint in the data model
* data -- the callback instance (see below)
* flags -- data callbacks flags, dp.DATA\_\* (optional)

The data argument should be an instance of a class with callback methods. E.g.:

```
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
```

### register\_db\_cb

```python
register_db_cb(dx, dbcbs) -> None
```

This function is used to set callback functions which span over several ConfD transactions.

Keyword arguments:

* dx -- a daemon context acquired through a call to init\_daemon()
* dbcbs -- the callback instance (see below)

The dbcbs argument should be an instance of a class with callback methods. E.g.:

```
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
```

### register\_done

```python
register_done(dx) -> None
```

When we have registered all the callbacks for a daemon (including the other types described below if we have them), we must call this function to synchronize with ConfD. No callbacks will be invoked until it has been called, and after the call, no further registrations are allowed.

Keyword arguments:

* dx -- a daemon context acquired through a call to init\_daemon()

### register\_error\_cb

```python
register_error_cb(dx, errortypes, ecbs) -> None
```

This funciton can be used to register error callbacks that are invoked for internally generated errors.

Keyword arguments:

* dx -- a daemon context acquired through a call to init\_daemon()
* errortypes -- logical OR of the error types that the ecbs should handle
* ecbs -- the callback instance (see below)

E.g.:

```
class ErrorCallbacks(object):
    def cb_format_error(self, uinfo, errinfo_dict, default_msg):
        dp.error_seterr(uinfo, default_msg)
ecbs = ErrorCallbacks()
dp.register_error_cb(ctx,
                     dp.ERRTYPE_BAD_VALUE |
                     dp.ERRTYPE_MISC, ecbs)
dp.register_done(ctx)
```

### register\_nano\_service\_cb

```python
register_nano_service_cb(dx,servicepoint,componenttype,state,nscb) -> None
```

This function registers the nano service callbacks.

Keyword arguments:

* dx -- a daemon context acquired through a call to init\_daemon()
* servicepoint -- name of the service point (string)
* componenttype -- name of the plan component for the nano service (string)
* state -- name of component state for the nano service (string)
* nscb -- the nano callback instance (see below)

E.g:

```
class NanoServiceCallbacks(object):
    def cb_nano_create(self, tctx, root, service, plan,
                       component, state, proplist, compproplist):
        pass

    def cb_nano_delete(self, tctx, root, service, plan,
                       component, state, proplist, compproplist):
        pass

nscb = NanoServiceCallbacks()
dp.register_nano_service_cb(dx, 'service-point-1', 'comp', 'state', nscb)
```

### register\_notification\_snmp\_inform\_cb

```python
register_notification_snmp_inform_cb(dx, cb_id, cbs) -> None
```

If we want to receive information about the delivery of SNMP inform-requests, we must register two callbacks for this.

Keyword arguments:

* dx -- a daemon context acquired through a call to init\_daemon()
* cb\_id -- the callback identifier
* cbs -- the callback instance (see below)

E.g.:

```
class NotifySnmpCallbacks(object):
    def cb_targets(self, nctx, ref, targets):
        pass

    def cb_result(self, nctx, ref, target, got_response):
        pass

cbs = NotifySnmpCallbacks()
dp.register_notification_snmp_inform_cb(dx, 'callback-id-1', cbs)
```

### register\_notification\_stream

```python
register_notification_stream(dx, ncbs, sock, streamname) -> NotificationCtxRef
```

This function registers the notification stream and optionally two callback functions used for the replay functionality.

The returned notification context must be used by the application for the sending of live notifications via notification\_send() or notification\_send\_path().

Keyword arguments:

* dx -- a daemon context acquired through a call to init\_daemon()
* ncbs -- the callback instance (see below)
* sock -- a previously connected worker socket
* streamname -- the name of the notification stream

E.g.:

```
class NotificationCallbacks(object):
    def cb_get_log_times(self, nctx):
        pass

    def cb_replay(self, nctx, start, stop):
        pass

ncbs = NotificationCallbacks()
livectx = dp.register_notification_stream(dx, ncbs, workersock,
'streamname')
```

### register\_notification\_sub\_snmp\_cb

```python
register_notification_sub_snmp_cb(dx, sub_id, cbs) -> None
```

Registers a callback function to be called when an SNMP notification is received by the SNMP gateway.

Keyword arguments:

* dx -- a daemon context acquired through a call to init\_daemon()
* sub\_id -- the subscription id for the notifications
* cbs -- the callback instance (see below)

E.g.:

```
class NotifySubSnmpCallbacks(object):
    def cb_recv(self, nctx, notification, varbinds, src_addr, port):
        pass

cbs = NotifySubSnmpCallbacks()
dp.register_notification_sub_snmp_cb(dx, 'sub-id-1', cbs)
```

### register\_range\_action\_cbs

```python
register_range_action_cbs(dx, actionpoint, acb, lower, upper, path) -> None
```

A variant of register\_action\_cbs() which registers action callbacks for a range of key values. The lower, upper, and path arguments are the same as for register\_range\_data\_cb().

Keyword arguments:

* dx -- a daemon context acquired through a call to init\_daemon()
* actionpoint -- the name of the action point
* data -- the callback instance (see register\_action\_cbs())
* lower -- a list of Value's or None
* upper -- a list of Value's or None
* path -- path for the list (string)

### register\_range\_data\_cb

```python
register_range_data_cb(dx, callpoint, data, lower, upper, path,
                       flags) -> None
```

This is a variant of register\_data\_cb() which registers a set of callbacks for a range of list entries.

Keyword arguments:

* dx -- a daemon context acquired through a call to init\_daemon()
* callpoint -- name of a tailf:callpoint in the data model
* data -- the callback instance (see register\_data\_cb())
* lower -- a list of Value's or None
* upper -- a list of Value's or None
* path -- path for the list (string)
* flags -- data callbacks flags, dp.DATA\_\* (optional)

### register\_range\_valpoint\_cb

```python
register_range_valpoint_cb(dx, valpoint, vcb, lower, upper, path) -> None
```

A variant of register\_valpoint\_cb() which registers a validation function for a range of key values. The lower, upper and path arguments are the same as for register\_range\_data\_cb().

Keyword arguments:

* dx -- a daemon context acquired through a call to init\_daemon()
* valpoint -- name of a validation point
* data -- the callback instance (see register\_valpoint\_cb())
* lower -- a list of Value's or None
* upper -- a list of Value's or None
* path -- path for the list (string)

### register\_service\_cb

```python
register_service_cb(dx, servicepoint, scb) -> None
```

This function registers the service callbacks.

Keyword arguments:

* dx -- a daemon context acquired through a call to init\_daemon()
* servicepoint -- name of the service point (string)
* scb -- the callback instance (see below)

E.g:

```
class ServiceCallbacks(object):
    def cb_create(self, tctx, kp, proplist, fastmap_thandle):
        pass

    def cb_pre_modification(self, tctx, op, kp, proplist):
        pass

    def cb_post_modification(self, tctx, op, kp, proplist):
        pass

scb = ServiceCallbacks()
dp.register_service_cb(dx, 'service-point-1', scb)
```

### register\_snmp\_notification

```python
register_snmp_notification(dx, sock, notify_name, ctx_name) -> NotificationCtxRef
```

SNMP notifications can also be sent via the notification framework, however most aspects of the stream concept do not apply for SNMP. This function is used to register a worker socket, the snmpNotifyName (notify\_name), and SNMP context (ctx\_name) to be used for the notifications.

Keyword arguments:

* dx -- a daemon context acquired through a call to init\_daemon()
* sock -- a previously connected worker socket
* notify\_name -- the snmpNotifyName
* ctx\_name -- the SNMP context

### register\_trans\_cb

```python
register_trans_cb(dx, trans) -> None
```

Registers transaction callback functions.

Keyword arguments:

* dx -- a daemon context acquired through a call to init\_daemon()
* trans -- the callback instance (see below)

The trans argument should be an instance of a class with callback methods. E.g.:

```
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
```

### register\_trans\_validate\_cb

```python
register_trans_validate_cb(dx, vcbs) -> None
```

This function installs two callback functions for the daemon context. One function that gets called when the validation phase starts in a transaction and one when the validation phase stops in a transaction.

Keyword arguments:

* dx -- a daemon context acquired through a call to init\_daemon()
* vcbs -- the callback instance (see below)

The vcbs argument should be an instance of a class with callback methods. E.g.:

```
class TransValidateCallbacks(object):
    def cb_init(self, tctx):
        pass

    def cb_stop(self, tctx):
        pass

vcbs = TransValidateCallbacks()
dp.register_trans_validate_cb(dx, vcbs)
```

### register\_usess\_cb

```python
register_usess_cb(dx, ucb) -> None
```

This function can be used to register information callbacks that are invoked for user session start and stop.

Keyword arguments:

* dx -- a daemon context acquired through a call to init\_daemon()
* ucb -- the callback instance (see below)

E.g.:

```
class UserSessionCallbacks(object):
    def cb_start(self, dx, uinfo):
        pass

    def cb_stop(self, dx, uinfo):
        pass

ucb = UserSessionCallbacks()
dp.register_usess_cb(dx, acb)
```

### register\_valpoint\_cb

```python
register_valpoint_cb(dx, valpoint, vcb) -> None
```

We must also install an actual validation function for each validation point, i.e. for each tailf:validate statement in the YANG data model.

Keyword arguments:

* dx -- a daemon context acquired through a call to init\_daemon()
* valpoint -- the name of the validation point
* vcb -- the callback instance (see below)

The vcb argument should be an instance of a class with a callback method. E.g.:

```
class ValpointCallback(object):
    def cb_validate(self, tctx, kp, newval):
        pass

vcb = ValpointCallback()
dp.register_valpoint_cb(dx, 'valpoint-1', vcb)
```

### release\_daemon

```python
release_daemon(dx) -> None
```

Releases all memory that has been allocated by init\_daemon() and other functions for the daemon context. The control socket as well as all the worker sockets must be closed by the application (before or after release\_daemon() has been called).

Keyword arguments:

* dx -- a daemon context acquired through a call to init\_daemon()

### service\_reply\_proplist

```python
service_reply_proplist(tctx, proplist) -> None
```

This function must be called with the new property list, immediately prior to returning from the callback, if the stored property list should be updated. If a callback returns without calling service\_reply\_proplist(), the previous property list is retained. To completely delete the property list, call this function with the proplist argument set to an empty list or None.

The proplist argument should be a list of 2-tuples built up like this: list( (name, value), (name, value), ... ) In a 2-tuple both 'name' and 'value' must be strings.

Keyword arguments:

* tctx -- a transaction context
* proplist -- a list of properties or None

### set\_daemon\_flags

```python
set_daemon_flags(dx, flags) -> None
```

Modifies the API behaviour according to the flags ORed into the flags argument.

Keyword arguments:

* dx -- a daemon context acquired through a call to init\_daemon()
* flags -- the flags to set

### trans\_set\_fd

```python
trans_set_fd(tctx, sock) -> None
```

Associate a worker socket with the transaction, or validation phase. This function must be called in the transaction and validation cb\_init() callbacks.

Keyword arguments:

* tctx -- a transaction context
* sock -- a previously connected worker socket

A minimal implementation of a transaction cb\_init() callback looks like:

```
class TransCb(object):
    def __init__(self, workersock):
        self.workersock = workersock

    def cb_init(self, tctx):
        dp.trans_set_fd(tctx, self.workersock)
```

### trans\_seterr

```python
trans_seterr(tctx, errstr) -> None
```

This function is used by the application to set an error string.

Keyword arguments:

* tctx -- a transaction context
* errstr -- an error message string

### trans\_seterr\_extended

```python
trans_seterr_extended(tctx, code, apptag_ns, apptag_tag, errstr) -> None
```

This function can be used to provide more structured error information from a transaction or data callback.

Keyword arguments:

* tctx -- a transaction context
* code -- an error code
* apptag\_ns -- namespace - should be set to 0
* apptag\_tag -- either 0 or the hash value for a data model node
* errstr -- an error message string

### trans\_seterr\_extended\_info

```python
trans_seterr_extended_info(tctx, code, apptag_ns, apptag_tag,
                           error_info, errstr) -> None
```

This function can be used to provide structured error information in the same way as trans\_seterr\_extended(), and additionally provide contents for the NETCONF element.

Keyword arguments:

* tctx -- a transaction context
* code -- an error code
* apptag\_ns -- namespace - should be set to 0
* apptag\_tag -- either 0 or the hash value for a data model node
* error\_info -- a list of \_lib.TagValue instances
* errstr -- an error message string

## Classes

### _class_ **AuthCtxRef**

This type represents the c-type struct confd\_auth\_ctx.

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

This type represents the c-type struct confd\_authorization\_ctx.

Available attributes:

* uinfo -- the user info (UserInfo) or None
* groups -- authorization groups (list of strings) or None

AuthorizationCtxRef cannot be directly instantiated from Python.

Members:

_None_

### _class_ **DaemonCtxRef**

struct confd\_daemon\_ctx references object

Members:

_None_

### _class_ **DbCtxRef**

This type represents the c-type struct confd\_db\_ctx.

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

This type represents the c-type struct confd\_list\_filter.

Available attributes:

* type -- filter type, LF\_\*
* expr1 -- OR, AND, NOT expression
* expr2 -- OR, AND expression
* op -- operation, CMP\_\* and EXEC\_\*
* node -- filter tagpath
* val -- filter value

ListFilter cannot be directly instantiated from Python.

Members:

_None_

### _class_ **NotificationCtxRef**

This type represents the c-type struct confd\_notification\_ctx.

Available attributes:

* name -- stream name or snmp notify name (string or None)
* ctx\_name -- for snmp only (string or None)
* fd -- worker socket (int)
* dx -- the daemon context (DaemonCtxRef)

NotificationCtxRef cannot be directly instantiated from Python.

Members:

_None_

### _class_ **TrItemRef**

This type represents the c-type confd\_tr\_item.

Available attributes:

* callpoint -- the callpoint (string)
* op -- operation, one of C\_SET\_ELEM, C\_CREATE, C\_REMOVE, C\_SET\_CASE, C\_SET\_ATTR or C\_MOVE\_AFTER (int)
* hkp -- the keypath (HKeypathRef)
* val -- the value (Value or None)
* choice -- the choice, only for C\_SET\_CASE (Value or None)
* attr -- attribute, only for C\_SET\_ATTR (int or None)
* next -- the next TrItemRef object in the linked list or None if no more items are found

TrItemRef cannot be directly instantiated from Python.

Members:

_None_

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
OPERATION_CASE_EXISTS = 13
PATCH_FLAG_AAA_CHECKED = 8
PATCH_FLAG_BUFFER_DAMPENED = 2
PATCH_FLAG_FILTER = 4
PATCH_FLAG_INCOMPLETE = 1
WORKER_SOCKET = 1
```
