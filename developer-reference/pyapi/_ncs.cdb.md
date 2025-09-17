# \_ncs.cdb Module

Low level module for connecting to NCS built-in XML database (CDB).

This module is used to connect to the NCS built-in XML database, CDB. The purpose of this API is to provide a read and subscription API to CDB.

CDB owns and stores the configuration data and the user of the API wants to read that configuration data and also get notified when someone through either NETCONF, SNMP, the CLI, the Web UI or the MAAPI modifies the data so that the application can re-read the configuration data and act accordingly.

CDB can also store operational data, i.e. data which is designated with a "config false" statement in the YANG data model. Operational data can be both read and written by the applications, but NETCONF and the other northbound agents can only read the operational data.

This documentation should be read together with the [confd\_lib\_cdb(3)](../../man/confd_lib_cdb.3.md) man page.

## Functions

### cd

```python
cd(sock, path) -> None
```

Changes the working directory according to the format path. Note that this function can not be used as an existence test.

Keyword arguments:

* sock -- a previously connected CDB socket
* path -- path to cd to

### close

```python
close(sock) -> None
```

Closes the socket. end\_session() should be called before calling this function.

Keyword arguments:

* sock -- a previously connected CDB socket

### connect

```python
connect(sock, type, ip, port, path) -> None
```

The application has to connect to NCS before it can interact. There are two different types of connections identified by the type argument - DATA\_SOCKET and SUBSCRIPTION\_SOCKET.

Keyword arguments:

* sock -- a Python socket instance
* type -- DATA\_SOCKET or SUBSCRIPTION\_SOCKET
* ip -- the ip address if socket is AF\_INET (optional)
* port -- the port if socket is AF\_INET (optional)
* path -- a filename if socket is AF\_UNIX (optional).

### connect\_name

```python
connect_name(sock, type, name, ip, port, path) -> None
```

When we use connect() to create a connection to NCS/CDB, the name argument passed to the library initialization function confd\_init() (see [confd\_lib\_lib(3)](../../man/confd_lib_lib.3.md)) is used to identify the connection in status reports and logs. I we want different names to be used for different connections from the same application process, we can use connect\_name() with the wanted name instead of connect().

Keyword arguments:

* sock -- a Python socket instance
* type -- DATA\_SOCKET or SUBSCRIPTION\_SOCKET
* name -- the name
* ip -- the ip address if socket is AF\_INET (optional)
* port -- the port if socket is AF\_INET (optional)
* path -- a filename if socket is AF\_UNIX (optional).

### create

```python
create(sock, path) -> None
```

Create a new list entry, presence container, or leaf of type empty (unless in a union, if type empty is in a union use set\_elem instead). Note that for list entries and containers, sub-elements will not exist until created or set via some of the other functions, thus doing implicit create via set\_object() or set\_values() may be preferred in this case.

Keyword arguments:

* sock -- a previously connected CDB socket
* path -- item to create (string)

### cs\_node\_cd

```python
cs_node_cd(socket, path) -> Union[_ncs.CsNode, None]
```

Utility function which finds the resulting CsNode given a string keypath.

Does the same thing as \_ncs.cs\_node\_cd(), but can handle paths that are ambiguous due to traversing a mount point, by sending a request to the daemon

Keyword arguments:

* sock -- a previously connected CDB socket
* path -- the path

### delete

```python
delete(sock, path) -> None
```

Delete a list entry, presence container, or leaf of type empty, and all its child elements (if any).

Keyword arguments:

* sock -- a previously connected CDB socket
* path -- item to delete (string)

### diff\_iterate

```python
diff_iterate(sock, subid, iter, flags, initstate) -> int
```

After reading the subscription socket the diff\_iterate() function can be used to iterate over the changes made in CDB data that matched the particular subscription point given by subid.

The user defined function iter() will be called for each element that has been modified and matches the subscription.

This function will return the last return value from the iter() callback.

Keyword arguments:

* sock -- a previously connected CDB socket
* subid -- the subcscription id
* iter -- iterator function (see below)
* initstate -- opaque passed to iter function

The user defined function iter() will be called for each element that has been modified and matches the subscription. It must have the following signature:

```
iter_fn(kp, op, oldv, newv, state) -> int
```

Where arguments are:

* kp - a HKeypathRef or None
* op - the operation
* oldv - the old value or None
* newv - the new value or None
* state - the initstate object

### diff\_iterate\_resume

```python
diff_iterate_resume(sock, reply, iter, resumestate) -> int
```

The application must call this function whenever an iterator function has returned ITER\_SUSPEND to finish up the iteration. If the application does not wish to continue iteration it must at least call diff\_iterate\_resume(sock, ITER\_STOP, None, None) to clean up the state. The reply parameter is what the iterator function would have returned (i.e. normally ITER\_RECURSE or ITER\_CONTINUE) if it hadn't returned ITER\_SUSPEND.

This function will return the last return value from the iter() callback.

Keyword arguments:

* sock -- a previously connected CDB socket
* reply -- the reply value
* iter -- iterator function (see diff\_iterate())
* resumestate -- opaque passed to iter function

### end\_session

```python
end_session(sock) -> None
```

We use connect() to establish a read socket to CDB. When the socket is closed, the read session is ended. We can reuse the same socket for another read session, but we must then end the session and create another session using start\_session().

Keyword arguments:

* sock -- a previously connected CDB socket

### exists

```python
exists(sock, path) -> bool
```

Leafs in the data model may be optional, and presence containers and list entries may or may not exist. This function checks whether a node exists in CDB.

Keyword arguments:

* sock -- a previously connected CDB socket
* path -- path to check for existence

### get

```python
get(sock, path) -> _ncs.Value
```

This reads a a value from the path and returns the result. The path must lead to a leaf element in the XML data tree.

Keyword arguments:

* sock -- a previously connected CDB socket
* path -- path to leaf

### get\_case

```python
get_case(sock, choice, path) -> None
```

When we use the YANG choice statement in the data model, this function can be used to find the currently selected case, avoiding useless get() etc requests for elements that belong to other cases.

Keyword arguments:

* sock -- a previously connected CDB socket
* choice -- the choice (string)
* path -- path to container or list entry where choice is defined (string)

### get\_compaction\_info

```python
get_compaction_info(sock, dbfile) -> dict
```

Returns the compaction information on the given CDB file.

The return value is a dict of the form:

```
{
   'fsize_previous': fsize_previous,
   'fsize_current': fsize_current,
   'last_time': last_time,
   'ntrans': ntrans
}
```

In this dict all values are integers.

Keyword arguments:

* sock -- a previously connected CDB socket
* dbfile -- A\_CDB, O\_CDB or S\_CDB.

### get\_modifications

```python
get_modifications(sock, subid, flags, path) -> list
```

The get\_modifications() function can be called after reception of a subscription notification to retrieve all the changes that caused the subscription notification. The socket sock is the subscription socket. The subscription id must also be provided. Optionally a path can be used to limit what is returned further (only changes below the supplied path will be returned), if this isn't needed path can be set to None.

Keyword arguments:

* sock -- a previously connected CDB socket
* subid -- subscription id
* flags -- the flags
* path -- a path in string format or None

### get\_modifications\_cli

```python
get_modifications_cli(sock, subid, flags) -> str
```

The get\_modifications\_cli() function can be called after reception of a subscription notification to retrieve all the changes that caused the subscription notification as a string in Cisco CLI format. The socket sock is the subscription socket. The subscription id must also be provided.

Keyword arguments:

* sock -- a previously connected CDB socket
* subid -- subscription id
* flags -- the flags

### get\_modifications\_iter

```python
get_modifications_iter(sock, flags) -> list
```

The get\_modifications\_iter() is basically a convenient short-hand of the get\_modifications() function intended to be used from within a iteration function started by diff\_iterate(). In this case no subscription id is needed, and the path is implicitly the current position in the iteration.

Keyword arguments:

* sock -- a previously connected CDB socket
* flags -- the flags

### get\_object

```python
get_object(sock, n, path) -> list
```

This function reads at most n values from the container or list entry specified by the path, and returns them as a list of Value's.

Keyword arguments:

* sock -- a previously connected CDB socket
* n -- max number of values to read
* path -- path to a list entry or a container (string)

### get\_objects

```python
get_objects(sock, n, ix, nobj, path) -> list
```

Similar to get\_object(), but reads multiple entries of a list based on the "instance integer" otherwise given within square brackets in the path - here the path must specify the list without the instance integer. At most n values from each of nobj entries, starting at entry ix, are read and placed in the values array. The return value is a list of objects where each object is represented as a list of Values.

Keyword arguments:

* sock -- a previously connected CDB socket
* n -- max number of values to read from each object
* ix -- start index
* nobj -- number of objects to read
* path -- path to a list entry or a container (string)

### get\_phase

```python
get_phase(sock) -> dict
```

Returns the start-phase that CDB is currently in. The return value is a dict of the form:

```
{
   'phase': phase,
   'flags': flags,
   'init': init,
   'upgrade': upgrade
}
```

In this dict 'phase' and 'flags' are integers, while 'init' and 'upgrade' are booleans.

Keyword arguments:

* sock -- a previously connected CDB socket

### get\_replay\_txids

```python
get_replay_txids(sock) -> List[Tuple]
```

When the subscriptionReplay functionality is enabled in confd.conf this function returns the list of available transactions that CDB can replay. The current transaction id will be the first in the list, the second at txid\[1] and so on. In case there are no replay transactions available (the feature isn't enabled or there hasn't been any transactions yet) only one (the current) transaction id is returned.

The returned list contains tuples with the form (s1, s2, s3, primary) where s1, s2 and s3 are unsigned integers and primary is either a string or None.

Keyword arguments:

* sock -- a previously connected CDB socket

### get\_transaction\_handle

```python
get_transaction_handle(sock) -> int
```

Returns the transaction handle for the transaction that triggered the current subscription notification. This function uses a subscription socket, and can only be called when a subscription notification for configuration data has been received on that socket, before sync\_subscription\_socket() has been called. Additionally, it is not possible to call this function from the iter() function passed to diff\_iterate().

Note:

> A CDB client is not expected to access the ConfD transaction store directly - this function should only be used for logging or debugging purposes.

Note:

> When the ConfD High Availability functionality is used, the transaction information is not available on secondary nodes.

Keyword arguments:

* sock -- a previously connected CDB socket

### get\_txid

```python
get_txid(sock) -> tuple
```

Read the last transaction id from CDB. This function can be used if we are forced to reconnect to CDB. If the transaction id we read is identical to the last id we had prior to loosing the CDB sockets we don't have to reload our managed object data. See the User Guide for full explanation.

The returned tuple has the form (s1, s2, s3, primary) where s1, s2 and s3 are unsigned integers and primary is either a string or None.

Keyword arguments:

* sock -- a previously connected CDB socket

### get\_user\_session

```python
get_user_session(sock) -> int
```

Returns the user session id for the transaction that triggered the current subscription notification. This function uses a subscription socket, and can only be called when a subscription notification for configuration data has been received on that socket, before sync\_subscription\_socket() has been called. Additionally, it is not possible to call this function from the iter() function passed to diff\_iterate(). To retrieve full information about the user session, use \_maapi.get\_user\_session() (see [confd\_lib\_maapi(3)](../../man/confd_lib_maapi.3.md)).

Note:

> When the ConfD High Availability functionality is used, the user session information is not available on secondary nodes.

Keyword arguments:

* sock -- a previously connected CDB socket

### get\_values

```python
get_values(sock, values, path) -> list
```

Read an arbitrary set of sub-elements of a container or list entry. The values list must be pre-populated with a number of TagValue instances.

TagValues passed in the values list will be updated with the corresponding values read and a new values list will be returned.

Keyword arguments:

* sock -- a previously connected CDB socket
* values -- a list of TagValue instances
* path -- path to a list entry or a container (string)

### getcwd

```python
getcwd(sock) -> str
```

Returns the current position as previously set by cd(), pushd(), or popd() as a string path. Note that what is returned is a pretty-printed version of the internal representation of the current position. It will be the shortest unique way to print the path but it might not exactly match the string given to cd().

Keyword arguments:

* sock -- a previously connected CDB socket

### getcwd\_kpath

```python
getcwd_kpath(sock) -> _ncs.HKeypathRef
```

Returns the current position like getcwd(), but as a HKeypathRef instead of as a string.

Keyword arguments:

* sock -- a previously connected CDB socket

### index

```python
index(sock, path) -> int
```

Given a path to a list entry index() returns its position (starting from 0).

Keyword arguments:

* sock -- a previously connected CDB socket
* path -- path to list entry

### initiate\_journal\_compaction

```python
initiate_journal_compaction(sock) -> None
```

Normally CDB handles journal compaction of the config datastore automatically. If this has been turned off (in the configuration file) then the A.cdb file will grow indefinitely unless this API function is called periodically to initiate compaction. This function initiates a compaction and returns immediately (if the datastore is locked, the compaction will be delayed, but eventually compaction will take place). Calling this function when journal compaction is configured to be automatic has no effect.

Keyword arguments:

* sock -- a previously connected CDB socket

### initiate\_journal\_dbfile\_compaction

```python
initiate_journal_dbfile_compaction(sock, dbfile) -> None
```

Similar to initiate\_journal\_compaction() but initiates the compaction on the given CDB file instead of all CDB files.

Keyword arguments:

* sock -- a previously connected CDB socket
* dbfile -- A\_CDB, O\_CDB or S\_CDB.

### is\_default

```python
is_default(sock, path) -> bool
```

This function returns True for a leaf which has a default value defined in the data model when no value has been set, i.e. when the default value is in effect. It returns False for other existing leafs. There is normally no need to call this function, since CDB automatically provides the default value as needed when get() etc is called.

Keyword arguments:

* sock -- a previously connected CDB socket
* path -- path to leaf

### mandatory\_subscriber

```python
mandatory_subscriber(sock, name) -> None
```

Attaches a mandatory attribute and a mandatory name to the subscriber identified by sock. The name argument is distinct from the name argument in connect\_name().

Keyword arguments:

* sock -- a previously connected CDB socket
* name -- the name

### next\_index

```python
next_index(sock, path) -> int
```

Given a path to a list entry next\_index() returns the position (starting from 0) of the next entry (regardless of whether the path exists or not).

Keyword arguments:

* sock -- a previously connected CDB socket
* path -- path to list entry

### num\_instances

```python
num_instances(sock, path) -> int
```

Returns the number of instances in a list.

Keyword arguments:

* sock -- a previously connected CDB socket
* path -- path to list node

### oper\_subscribe

```python
oper_subscribe(sock, nspace, path) -> int
```

Sets up a CDB subscription for changes in the operational database. Similar to the subscriptions for configuration data, we can be notified of changes to the operational data stored in CDB. Note that there are several differences from the subscriptions for configuration data.

Keyword arguments:

* sock -- a previously connected CDB socket
* nspace -- the namespace hash
* path -- path to node

### popd

```python
popd(sock) -> None
```

Pops the top element from the directory stack and changes directory to previous directory.

Keyword arguments:

* sock -- a previously connected CDB socket

### pushd

```python
pushd(sock, path) -> None
```

Similar to cd() but pushes the previous current directory on a stack.

Keyword arguments:

* sock -- a previously connected CDB socket
* path -- path to cd to

### read\_subscription\_socket

```python
read_subscription_socket(sock) -> list
```

This call will return a list of integer values containing subscription points earlier acquired through calls to subscribe().

Keyword arguments:

* sock -- a previously connected CDB socket

### read\_subscription\_socket2

```python
read_subscription_socket2(sock) -> tuple
```

Another version of read\_subscription\_socket() which will return a 3-tuple in the form (type, flags, subpoints).

Keyword arguments:

* sock -- a previously connected CDB socket

### replay\_subscriptions

```python
replay_subscriptions(sock, txid, sub_points) -> None
```

This function makes it possible to replay the subscription events for the last configuration change to some or all CDB subscribers. This call is useful in a number of recovery scenarios, where some CDB subscribers lost connection to ConfD before having received all the changes in a transaction. The replay functionality is only available if it has been enabled in confd.conf.

Keyword arguments:

* sock -- a previously connected CDB socket
* txid -- a 4-tuple of the form (s1, s2, s3, primary)
* sub\_points -- a list of subscription points

### set\_case

```python
set_case(sock, choice, scase, path) -> None
```

When we use the YANG choice statement in the data model, this function can be used to select the current case.

Keyword arguments:

* sock -- a previously connected CDB socket
* choice -- the choice (string)
* scase -- the case (string)
* path -- path to container or list entry where choice is defined (string)

### set\_elem

```python
set_elem(sock, value, path) -> None
```

Set the value of a single leaf. The value may be either a Value instance or a string.

Keyword arguments:

* sock -- a previously connected CDB socket
* value -- the value to set
* path -- a string pointing to a single leaf

### set\_namespace

```python
set_namespace(sock, hashed_ns) -> None
```

If we want to access data in CDB where the toplevel element name is not unique, we need to set the namespace. We are reading data related to a specific .fxs file. confdc can be used to generate a .py file with a class for the namespace, by the flag --emit-python to confdc (see confdc(1)).

Keyword arguments:

* sock -- a previously connected CDB socket
* hashed\_ns -- the namespace hash

### set\_object

```python
set_object(sock, values, path) -> None
```

Set all elements corresponding to the complete contents of a container or list entry, except for sub-lists.

Keyword arguments:

* sock -- a previously connected CDB socket
* values -- a list of Value:s
* path -- path to container or list entry (string)

### set\_timeout

```python
set_timeout(sock, timeout_secs) -> None
```

A timeout for client actions can be specified via /confdConfig/cdb/clientTimeout in confd.conf, see the confd.conf(5) manual page. This function can be used to dynamically extend (or shorten) the timeout for the current action. Thus it is possible to configure a restrictive timeout in confd.conf, but still allow specific actions to have a longer execution time.

Keyword arguments:

* sock -- a previously connected CDB socket
* timeout\_secs -- timeout in seconds

### set\_values

```python
set_values(sock, values, path) -> None
```

Set arbitrary sub-elements of a container or list entry.

Keyword arguments:

* sock -- a previously connected CDB socket
* values -- a list of TagValue:s
* path -- path to container or list entry (string)

### start\_session

```python
start_session(sock, db) -> None
```

Starts a new session on an already established socket to CDB. The db parameter should be one of RUNNING, PRE\_COMMIT\_RUNNING, STARTUP and OPERATIONAL.

Keyword arguments:

* sock -- a previously connected CDB socket
* db -- the database

### start\_session2

```python
start_session2(sock, db, flags) -> None
```

This function may be used instead of start\_session() if it is considered necessary to have more detailed control over some aspects of the CDB session - if in doubt, use start\_session() instead. The sock and db arguments are the same as for start\_session(), and these values can be used for flags (ORed together if more than one).

Keyword arguments:

* sock -- a previously connected CDB socket
* db -- the database
* flags -- the flags

### sub\_abort\_trans

```python
sub_abort_trans(sock, code, apptag_ns, apptag_tag, reason) -> None
```

This function is to be called instead of sync\_subscription\_socket() when the subscriber wishes to abort the current transaction. It is only valid to call after read\_subscription\_socket2() has returned with type set to CDB\_SUB\_PREPARE. The arguments after sock are the same as to X\_seterr\_extended() and give the caller a way of indicating the reason for the failure.

Keyword arguments:

* sock -- a previously connected CDB socket
* code -- the error code
* apptag\_ns -- the namespace hash
* apptag\_tag -- the tag hash
* reason -- reason string

### sub\_abort\_trans\_info

```python
sub_abort_trans_info(sock, code, apptag_ns, apptag_tag, error_info, reason) -> None
```

Same a sub\_abort\_trans() but also fills in the NETCONF element.

Keyword arguments:

* sock -- a previously connected CDB socket
* code -- the error code
* apptag\_ns -- the namespace hash
* apptag\_tag -- the tag hash
* error\_info -- a list of TagValue instances
* reason -- reason string

### sub\_progress

```python
sub_progress(sock, msg) -> None
```

After receiving a subscription notification (using read\_subscription\_socket()) but before acknowledging it (or aborting, in the case of prepare subscriptions), it is possible to send progress reports back to ConfD using the sub\_progress() function.

Keyword arguments:

* sock -- a previously connected CDB socket
* msg -- the message

### subscribe

```python
subscribe(sock, prio, nspace, path) -> int
```

Sets up a CDB subscription so that we are notified when CDB configuration data changes. There can be multiple subscription points from different sources, that is a single client daemon can have many subscriptions and there can be many client daemons. The return value is a subscription point used to identify this particular subscription.

Keyword arguments:

* sock -- a previously connected CDB socket
* prio -- priority
* nspace -- the namespace hash
* path -- path to node

### subscribe2

```python
subscribe2(sock, type, flags, prio, nspace, path) -> int
```

This function supersedes the current subscribe() and oper\_subscribe() as well as makes it possible to use the new two phase subscription method. Operational and configuration subscriptions can be done on the same socket, but in that case the notifications may be arbitrarily interleaved, including operational notifications arriving between different configuration notifications for the same transaction. If this is a problem, use separate sockets for operational and configuration subscriptions.

Keyword arguments:

* sock -- a previously connected CDB socket
* type -- subscription type
* flags -- flags
* prio -- priority
* nspace -- the namespace hash
* path -- path to node

### subscribe\_done

```python
subscribe_done(sock) -> None
```

When a client is done registering all its subscriptions on a particular subscription socket it must call subscribe\_done(). No notifications will be delivered until then.

Keyword arguments:

* sock -- a previously connected CDB socket

### sync\_subscription\_socket

```python
sync_subscription_socket(sock, st) -> None
```

Once we have read the subscription notification through a call to read\_subscription\_socket() and optionally used the diff\_iterate() to iterate through the changes as well as acted on the changes to CDB, we must synchronize with CDB so that CDB can continue and deliver further subscription messages to subscribers with higher priority numbers.

Keyword arguments:

* sock -- a previously connected CDB socket
* st -- sync type (int)

### trigger\_oper\_subscriptions

```python
trigger_oper_subscriptions(sock, sub_points, flags) -> None
```

This function works like trigger\_subscriptions(), but for CDB subscriptions to operational data. The caller will trigger all subscription points passed in the sub\_points list (or all operational data subscribers if the list is empty), and the call will not return until the last subscriber has called sync\_subscription\_socket().

Keyword arguments:

* sock -- a previously connected CDB socket
* sub\_points -- a list of subscription points
* flags -- the flags

### trigger\_subscriptions

```python
trigger_subscriptions(sock, sub_points) -> None
```

This function makes it possible to trigger CDB subscriptions for configuration data even though the configuration has not been modified. The caller will trigger all subscription points passed in the sub\_points list (or all subscribers if the list is empty) in priority order, and the call will not return until the last subscriber has called sync\_subscription\_socket().

Keyword arguments:

* sock -- a previously connected CDB socket
* sub\_points -- a list of subscription points

### wait\_start

```python
wait_start(sock) -> None
```

This call waits until CDB has completed start-phase 1 and is available, when it is CONFD\_OK is returned. If CDB already is available (i.e. start-phase >= 1) the call returns immediately. This can be used by a CDB client who is not synchronously started and only wants to wait until it can read its configuration. The call can be used after connect().

Keyword arguments:

* sock -- a previously connected CDB socket

## Predefined Values

```python

A_CDB = 1
DATA_SOCKET = 2
DONE_OPERATIONAL = 4
DONE_PRIORITY = 1
DONE_SOCKET = 2
DONE_TRANSACTION = 3
FLAG_INIT = 1
FLAG_UPGRADE = 2
GET_MODS_CLI_NO_BACKQUOTES = 8
GET_MODS_INCLUDE_LISTS = 1
GET_MODS_INCLUDE_MOVES = 16
GET_MODS_REVERSE = 2
GET_MODS_SUPPRESS_DEFAULTS = 4
GET_MODS_WANT_ANCESTOR_DELETE = 32
LOCK_PARTIAL = 8
LOCK_REQUEST = 4
LOCK_SESSION = 2
LOCK_WAIT = 1
OPERATIONAL = 3
O_CDB = 2
PRE_COMMIT_RUNNING = 4
READ_COMMITTED = 16
READ_SOCKET = 0
RUNNING = 1
STARTUP = 2
SUBSCRIPTION_SOCKET = 1
SUB_ABORT = 3
SUB_COMMIT = 2
SUB_FLAG_HA_IS_SECONDARY = 16
SUB_FLAG_HA_IS_SLAVE = 16
SUB_FLAG_HA_SYNC = 8
SUB_FLAG_IS_LAST = 1
SUB_FLAG_REVERT = 4
SUB_FLAG_TRIGGER = 2
SUB_OPER = 4
SUB_OPERATIONAL = 3
SUB_PREPARE = 1
SUB_RUNNING = 1
SUB_RUNNING_TWOPHASE = 2
SUB_WANT_ABORT_ON_ABORT = 1
S_CDB = 3
```
