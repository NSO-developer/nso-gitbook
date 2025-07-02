# Python ncs.maapi Module

MAAPI high level module.

This module defines a high level interface to the low-level maapi functions.

The 'Maapi' class encapsulates a MAAPI connection which upon constructing,
sets up a connection towards ConfD/NCS. An example of setting up a transaction
and manipulating data::

    import ncs

    m = ncs.maapi.Maapi()
    m.start_user_session('admin', 'test_context')
    t = m.start_write_trans()
    t.get_elem('/model/data{one}/str')
    t.set_elem('testing', '/model/data{one}/str')
    t.apply()

Another way is to use context managers, which will handle all cleanup
related to transactions, user sessions and socket connections::

    with ncs.maapi.Maapi() as m:
        with ncs.maapi.Session(m, 'admin', 'test_context'):
            with m.start_write_trans() as t:
                t.get_elem('/model/data{one}/str')
                t.set_elem('testing', '/model/data{one}/str')
                t.apply()

Finally, a really compact way of doing this:

Exampled:

    with ncs.maapi.single_write_trans('admin', 'test_context') as t:
        t.get_elem('/model/data{one}/str')
        t.set_elem('testing', '/model/data{one}/str')
        t.apply()

## Functions

### connect

```python
connect(ip='127.0.0.1', port=4569, path=None)
```

Convenience function for connecting to ConfD/NCS.

The 'ip' and 'port' arguments are ignored if path is specified.

Arguments:

* ip -- ConfD/NCS instance ip address (str)
* port -- ConfD/NCS instance port (int)
* path -- ConfD/NCS instance location path (str)

Returns:

* socket (Python socket)

### retry_on_conflict

```python
retry_on_conflict(retries=10, log=None)
```

Function/method decorator to retry a transaction in case of conflicts.

When executing multiple concurrent transactions against the NCS RUNNING
datastore, read-write conflicts are resolved by rejecting transactions
having potentially stale data with ERR_TRANSACTION_CONFLICT.

This decorator restarts a function, should it run into a conflict, giving
it multiple attempts to apply. The decorated function must start its own
transaction because a conflicting transaction must be thrown away entirely
and a new one started.

Example usage:

    @retry_on_conflict()
    def do_work():
        with ncs.maapi.single_write_trans('admin', 'python') as t:
            root = ncs.maagic.get_root(t)
            root.some_value = str(root.some_other_value)
            t.apply()

Arguments:

* retries -- number of times to retry (int)
* log -- optional log object for logging conflict details

### single_read_trans

```python
single_read_trans(user, context, groups=[], db=2, ip='127.0.0.1', port=4569, path=None, src_ip='127.0.0.1', src_port=0, proto=1, vendor=None, product=None, version=None, client_id=None, load_schemas=True, flags=0)
```

Context manager for a single READ transaction.

This function connects to ConfD/NCS, starts a user session and finally
starts a new READ transaction.

Function signature:

    def single_read_trans(user, context, groups=[],
                          db=RUNNING, ip=<CONFD-OR-NCS-ADDR>,
                          port=<CONFD-OR-NCS-PORT>, path=None,
                          src_ip=<CONFD-OR-NCS-ADDR>, src_port=0,
                          proto=PROTO_TCP,
                          vendor=None, product=None, version=None,
                          client_id=_mk_client_id(),
                          load_schemas=LOAD_SCHEMAS_LOAD, flags=0):

For argument db, flags see Maapi.start_trans(). For arguments user,
context, groups, src_ip, src_port, proto, vendor, product, version and
client_id see Maapi.start_user_session().
For arguments ip, port and path see connect().
For argument load_schemas see __init__().

Arguments:

* user - username (str)
* context - context for the session (str)
* groups - groups (list)
* db -- database (int)
* ip -- ConfD/NCS instance ip address (str)
* port -- ConfD/NCS instance port (int)
* path -- ConfD/NCS instance location path (str)
* src_ip - source ip address (str)
* src_port - source port (int)
* proto - protocol used by for connecting (i.e. ncs.PROTO_TCP)
* vendor -- lock error information (str, optional)
* product -- lock error information (str, optional)
* version -- lock error information (str, optional)
* client_id -- lock error information (str, optional)
* load_schemas - passed on to Maapi.__init__()
* flags -- additional transaction flags (int)

Returns:

* read transaction object (maapi.Transaction)

### single_write_trans

```python
single_write_trans(user, context, groups=[], db=2, ip='127.0.0.1', port=4569, path=None, src_ip='127.0.0.1', src_port=0, proto=1, vendor=None, product=None, version=None, client_id=None, load_schemas=True, flags=0)
```

Context manager for a single READ/WRITE transaction.

This function connects to ConfD/NCS, starts a user session and finally
starts a new READ/WRITE transaction.

Function signature:

    def single_write_trans(user, context, groups=[],
                           db=RUNNING, ip=<CONFD-OR-NCS-ADDR>,
                           port=<CONFD-OR-NCS-PORT>, path=None,
                           src_ip=<CONFD-OR-NCS-ADDR>, src_port=0,
                           proto=PROTO_TCP,
                           vendor=None, product=None, version=None,
                           client_id=_mk_client_id(),
                           load_schemas=LOAD_SCHEMAS_LOAD, flags=0):

For argument db, flags see Maapi.start_trans(). For arguments user,
context, groups, src_ip, src_port, proto, vendor, product, version and
client_id see Maapi.start_user_session().
For arguments ip, port and path see connect().
For argument load_schemas see __init__().

Arguments:

* user - username (str)
* context - context for the session (str)
* groups - groups (list)
* db -- database (int)
* ip -- ConfD/NCS instance ip address (str)
* port -- ConfD/NCS instance port (int)
* path -- ConfD/NCS instance location path (str)
* src_ip - source ip address (str)
* src_port - source port (int)
* proto - protocol used by the client for connecting (int)
* vendor -- lock error information (str, optional)
* product -- lock error information (str, optional)
* version -- lock error information (str, optional)
* client_id -- lock error information (str, optional)
* load_schemas - passed on to Maapi.__init__()
* flags -- additional transaction flags (int)

Returns:

* write transaction object (maapi.Transaction)


## Classes

### _class_ **CommitParams**

Class representing NSO commit parameters.

Start with creating an empty instance of this class and set commit
parameters using helper methods.

CommitParams(result=None)

Members:

<details>

<summary>comment(...)</summary>

Method:

```python
comment(self, comment)
```

Set comment.

</details>

<details>

<summary>commit_queue_async(...)</summary>

Method:

```python
commit_queue_async(self)
```

Set commit queue asynchronous mode of operation.

</details>

<details>

<summary>commit_queue_atomic(...)</summary>

Method:

```python
commit_queue_atomic(self)
```

Make the commit queue item atomic.

</details>

<details>

<summary>commit_queue_block_others(...)</summary>

Method:

```python
commit_queue_block_others(self)
```

Make the commit queue item block other commit queue items for
this device.

</details>

<details>

<summary>commit_queue_bypass(...)</summary>

Method:

```python
commit_queue_bypass(self)
```

Make the commit transactional even if commit queue is
configured by default.

</details>

<details>

<summary>commit_queue_error_option(...)</summary>

Method:

```python
commit_queue_error_option(self, error_option)
```

Set commit queue item behaviour on error.

</details>

<details>

<summary>commit_queue_lock(...)</summary>

Method:

```python
commit_queue_lock(self)
```

Make the commit queue item locked.

</details>

<details>

<summary>commit_queue_non_atomic(...)</summary>

Method:

```python
commit_queue_non_atomic(self)
```

Make the commit queue item non-atomic.

</details>

<details>

<summary>commit_queue_sync(...)</summary>

Method:

```python
commit_queue_sync(self, timeout=None)
```

Set commit queue synchronous mode of operation.

</details>

<details>

<summary>commit_queue_tag(...)</summary>

Method:

```python
commit_queue_tag(self, tag)
```

Set commit-queue tag. Implicitly enabled commit queue commit.

This function is deprecated and will be removed in a future release.
Use label() instead.

</details>

<details>

<summary>confirm_network_state(...)</summary>

Method:

```python
confirm_network_state(self)
```

Check that the parts of the device configuration read and/or
modified are up-to-date in CDB before pushing the configuration
change to the device.

</details>

<details>

<summary>confirm_network_state_re_evaluate_policies(...)</summary>

Method:

```python
confirm_network_state_re_evaluate_policies(self)
```

Check that the parts of the device configuration read and/or
modified are up-to-date in CDB before pushing the configuration
change to the device and re-evaluate policies of effected
services.

</details>

<details>

<summary>dry_run_cli(...)</summary>

Method:

```python
dry_run_cli(self)
```

Dry-run commit outformat CLI.

</details>

<details>

<summary>dry_run_cli_c(...)</summary>

Method:

```python
dry_run_cli_c(self)
```

Dry-run commit outformat cli-c.

</details>

<details>

<summary>dry_run_cli_c_reverse(...)</summary>

Method:

```python
dry_run_cli_c_reverse(self)
```

Dry-run commit outformat cli-c reverse.

</details>

<details>

<summary>dry_run_native(...)</summary>

Method:

```python
dry_run_native(self)
```

Dry-run commit outformat native.

</details>

<details>

<summary>dry_run_native_reverse(...)</summary>

Method:

```python
dry_run_native_reverse(self)
```

Dry-run commit outformat native reverse.

</details>

<details>

<summary>dry_run_xml(...)</summary>

Method:

```python
dry_run_xml(self)
```

Dry-run commit outformat XML.

</details>

<details>

<summary>get_comment(...)</summary>

Method:

```python
get_comment(self)
```

Get comment.

</details>

<details>

<summary>get_commit_queue_error_option(...)</summary>

Method:

```python
get_commit_queue_error_option(self)
```

Get commit queue item behaviour on error.

</details>

<details>

<summary>get_commit_queue_sync_timeout(...)</summary>

Method:

```python
get_commit_queue_sync_timeout(self)
```

Get commit queue synchronous mode of operation timeout.

</details>

<details>

<summary>get_commit_queue_tag(...)</summary>

Method:

```python
get_commit_queue_tag(self)
```

Get commit-queue tag.

This function is deprecated and will be removed in a future release.

</details>

<details>

<summary>get_dry_run_outformat(...)</summary>

Method:

```python
get_dry_run_outformat(self)
```

Get dry-run outformat

</details>

<details>

<summary>get_label(...)</summary>

Method:

```python
get_label(self)
```

Get label.

</details>

<details>

<summary>get_no_overwrite_scope(...)</summary>

Method:

```python
get_no_overwrite_scope(self)
```

Get no-overwrite scope

</details>

<details>

<summary>get_trace_id(...)</summary>

Method:

```python
get_trace_id(self)
```

Get trace id.

</details>

<details>

<summary>is_commit_queue_async(...)</summary>

Method:

```python
is_commit_queue_async(self)
```

Get commit queue asynchronous mode of operation.

</details>

<details>

<summary>is_commit_queue_atomic(...)</summary>

Method:

```python
is_commit_queue_atomic(self)
```

Check if the commit queue item should be atomic.

</details>

<details>

<summary>is_commit_queue_block_others(...)</summary>

Method:

```python
is_commit_queue_block_others(self)
```

Check if the the commit queue item should block other commit
queue items for this device.

</details>

<details>

<summary>is_commit_queue_bypass(...)</summary>

Method:

```python
is_commit_queue_bypass(self)
```

Check if the commit is transactional even if commit queue is
configured by default.

</details>

<details>

<summary>is_commit_queue_lock(...)</summary>

Method:

```python
is_commit_queue_lock(self)
```

Check if the commit queue item should be locked.

</details>

<details>

<summary>is_commit_queue_non_atomic(...)</summary>

Method:

```python
is_commit_queue_non_atomic(self)
```

Check if the commit queue item should be non-atomic.

</details>

<details>

<summary>is_commit_queue_sync(...)</summary>

Method:

```python
is_commit_queue_sync(self)
```

Get commit queue synchronous mode of operation.

</details>

<details>

<summary>is_confirm_network_state(...)</summary>

Method:

```python
is_confirm_network_state(self)
```

Should a check be done that the parts of the device configuration
read and/or modified are up-to-date in CDB before pushing the
configuration change to the device.

</details>

<details>

<summary>is_confirm_network_state_re_evaluate_policies(...)</summary>

Method:

```python
is_confirm_network_state_re_evaluate_policies(self)
```

Is confirm-network-state with re-evaluate-policies enabled.

</details>

<details>

<summary>is_dry_run(...)</summary>

Method:

```python
is_dry_run(self)
```

Is dry-run enabled

</details>

<details>

<summary>is_dry_run_reverse(...)</summary>

Method:

```python
is_dry_run_reverse(self)
```

Is dry-run reverse enabled.

</details>

<details>

<summary>is_no_deploy(...)</summary>

Method:

```python
is_no_deploy(self)
```

Should service create method be invoked or not.

</details>

<details>

<summary>is_no_lsa(...)</summary>

Method:

```python
is_no_lsa(self)
```

Get no-lsa commit parameter.

</details>

<details>

<summary>is_no_networking(...)</summary>

Method:

```python
is_no_networking(self)
```

Check if the the configuration should only be written to CDB and
not actually pushed to the device.

</details>

<details>

<summary>is_no_out_of_sync_check(...)</summary>

Method:

```python
is_no_out_of_sync_check(self)
```

Do not check device sync state before pushing the configuration
change.

</details>

<details>

<summary>is_no_overwrite(...)</summary>

Method:

```python
is_no_overwrite(self)
```

Should a check be done that the parts of the device configuration
to be modified are up-to-date in CDB before pushing the
configuration change to the device.

</details>

<details>

<summary>is_no_revision_drop(...)</summary>

Method:

```python
is_no_revision_drop(self)
```

Get no-revision-drop commit parameter.

</details>

<details>

<summary>is_reconcile_attach_non_service_config(...)</summary>

Method:

```python
is_reconcile_attach_non_service_config(self)
```

Get reconcile commit parameter with attach-non-service-config
behaviour.

</details>

<details>

<summary>is_reconcile_detach_non_service_config(...)</summary>

Method:

```python
is_reconcile_detach_non_service_config(self)
```

Get reconcile commit parameter with detach-non-service-config
behaviour.

</details>

<details>

<summary>is_reconcile_discard_non_service_config(...)</summary>

Method:

```python
is_reconcile_discard_non_service_config(self)
```

Get reconcile commit parameter with discard-non-service-config
behaviour.

</details>

<details>

<summary>is_reconcile_keep_non_service_config(...)</summary>

Method:

```python
is_reconcile_keep_non_service_config(self)
```

Get reconcile commit parameter with keep-non-service-config
behaviour.

</details>

<details>

<summary>is_use_lsa(...)</summary>

Method:

```python
is_use_lsa(self)
```

Get use-lsa commit parameter.

</details>

<details>

<summary>label(...)</summary>

Method:

```python
label(self, label)
```

Set label.

</details>

<details>

<summary>no_deploy(...)</summary>

Method:

```python
no_deploy(self)
```

Do not invoke service's create method.

</details>

<details>

<summary>no_lsa(...)</summary>

Method:

```python
no_lsa(self)
```

Set no-lsa commit parameter.

</details>

<details>

<summary>no_networking(...)</summary>

Method:

```python
no_networking(self)
```

Only write the configuration to CDB, do not actually push it to
the device.

</details>

<details>

<summary>no_out_of_sync_check(...)</summary>

Method:

```python
no_out_of_sync_check(self)
```

Do not check device sync state before pushing the configuration
change.

</details>

<details>

<summary>no_overwrite(...)</summary>

Method:

```python
no_overwrite(self, scope)
```

Check that the parts of the device configuration to be modified
are up-to-date in CDB before pushing the configuration change to the
device.

</details>

<details>

<summary>no_revision_drop(...)</summary>

Method:

```python
no_revision_drop(self)
```

Set no-revision-drop commit parameter.

</details>

<details>

<summary>reconcile_attach_non_service_config(...)</summary>

Method:

```python
reconcile_attach_non_service_config(self)
```

Set reconcile commit parameter with attach-non-service-config
behaviour.

</details>

<details>

<summary>reconcile_detach_non_service_config(...)</summary>

Method:

```python
reconcile_detach_non_service_config(self)
```

Set reconcile commit parameter with detach-non-service-config
behaviour.

</details>

<details>

<summary>reconcile_discard_non_service_config(...)</summary>

Method:

```python
reconcile_discard_non_service_config(self)
```

Set reconcile commit parameter with discard-non-service-config
behaviour.

</details>

<details>

<summary>reconcile_keep_non_service_config(...)</summary>

Method:

```python
reconcile_keep_non_service_config(self)
```

Set reconcile commit parameter with keep-non-service-config
behaviour.

</details>

<details>

<summary>set_dry_run_outformat(...)</summary>

Method:

```python
set_dry_run_outformat(self, outformat)
```

Set dry-run outformat

</details>

<details>

<summary>trace_id(...)</summary>

Method:

```python
trace_id(self, trace_id)
```

Set trace id.

</details>

<details>

<summary>use_lsa(...)</summary>

Method:

```python
use_lsa(self)
```

Set use-lsa commit parameter.

</details>

### _class_ **DryRunOutformat**

Enumeration for dry run formats:
XML    = 1
CLI    = 2
NATIVE = 3
CLI_C  = 4

DryRunOutformat(*values)

Members:

<details>

<summary>CLI</summary>

```python
CLI = 2
```


</details>

<details>

<summary>CLI_C</summary>

```python
CLI_C = 4
```


</details>

<details>

<summary>NATIVE</summary>

```python
NATIVE = 3
```


</details>

<details>

<summary>XML</summary>

```python
XML = 1
```


</details>

<details>

<summary>name</summary>

The name of the Enum member.

</details>

<details>

<summary>value</summary>

The value of the Enum member.

</details>

### _class_ **Key**

Key string encapsulation and helper.

Key(key, enum_cs_nodes=None)

Initialize a key.

'key' may be a string or a list of strings.

Members:

_None_

### _class_ **Maapi**

Class encapsulating a MAAPI connection.

Maapi(ip='127.0.0.1', port=4569, path=None, load_schemas=True, msock=None)

Create a Maapi instance.

Arguments:

* ip -- ConfD/NCS instance ip address (str, optional)
* port -- ConfD/NCS instance port (int, optional)
* path -- ConfD/NCS instance location path (str, optional)
* msock -- already connected MAAPI socket (socket.socket, optional)
           (ip, port and path ignored)
* load_schemas -- whether schemas should be loaded/reloaded or not
                  LOAD_SCHEMAS_LOAD = load schemas unless already loaded
                  LOAD_SCHEMAS_SKIP = do not load schemas
                  LOAD_SCHEMAS_RELOAD = force reload of schemas

The option LOAD_SCHEMAS_RELOAD can be used to force a reload of
schemas, for example when connecting to a different ConfD/NSO node.
Note that previously constructed maagic objects will be invalid and
using them will lead to undefined behavior. Use this option with care,
for example in a small script querying a list of running nodes.

Members:

<details>

<summary>apply_template(...)</summary>

Method:

```python
apply_template(self, th, name, path, vars=None, flags=0)
```

Apply a template.

</details>

<details>

<summary>attach(...)</summary>

Method:

```python
attach(self, ctx_or_th, hashed_ns=0, usid=0)
```

Attach to an existing transaction.

'ctx_or_th' may be either a TransCtxRef or a transaction handle.
The 'hashed_ns' argument is basically just there to save a call to
set_namespace(). 'usid' is only used if 'ctx_or_th' is a transaction
handle and if set to 0 the user session id that is the owner of the
transaction will be used.

Arguments:

* ctx_or_th (TransCtxRef or transaction handle)
* hashed_ns (int)
* usid (int)

Returns:

* transaction object (maapi.Transaction)

</details>

<details>

<summary>attach_init(...)</summary>

Method:

```python
attach_init(self)
```

Attach to phase0 for CDB initialization and upgrade.

</details>

<details>

<summary>authenticate(...)</summary>

Method:

```python
authenticate(self, user, password, n, src_addr=None, src_port=None, context=None, prot=None)
```

Authenticate a user using the AAA configuration.

Use src_addr, src_port, context and prot to use an external
authentication executable.
Use the 'n' to get a list of n-1 groups that the user is a member of.
Use n=1 if the function is used in a context where the group names
are not needed.

Returns 1 if accepted without groups. If the authentication failed
or was accepted a tuple with first element status code, 0 for
rejection and 1 for accepted is returned. The second element either
contains the reason for the rejection as a string OR a list groupnames.

Arguments:

* user - username (str)
* password - passwor d (str)
* n - number of groups to return (int)
* src_addr - source ip address (str)
* src_port - source port (int)
* context - context for the session (str)
* prot - protocol used by the client for connecting (int)

Returns:

* status (int or tuple)

</details>

<details>

<summary>close(...)</summary>

Method:

```python
close(self)
```

Ends session and closes socket.

</details>

<details>

<summary>cursor(...)</summary>

Method:

```python
cursor(self, th, path, enum_cs_nodes=None, want_values=False, secondary_index=None, xpath_expr=None)
```

Get an iterable list cursor.

</details>

<details>

<summary>destroy_cursor(...)</summary>

Method:

```python
destroy_cursor(self, mc)
```

Destroy cursor.

Arguments:

* cursor (maapi.Cursor)

</details>

<details>

<summary>detach(...)</summary>

Method:

```python
detach(self, ctx_or_th)
```

Detach the underlying MAAPI socket.

Arguments:

* ctx_or_th (TransCtxRef or transaction handle)

</details>

<details>

<summary>do_display(...)</summary>

Method:

```python
do_display(self, th, path)
```

Do display.

If the data model uses the YANG when or tailf:display-when
statement, this function can be used to determine if the item
given by the path should be displayed or not.

Arguments:

* th -- transaction handle
* path -- path to the 'display-when' statement (str)

Returns

* boolean

</details>

<details>

<summary>end_progress_span(...)</summary>

Method:

```python
end_progress_span(self, *args)
```

Don't call this function.

Call instance.end() on the progress.Span instance created from
start_progress_span() instead.

</details>

<details>

<summary>exists(...)</summary>

Method:

```python
exists(self, th, path)
```

Check if path exists.

Arguments:

* th -- transaction handle
* path -- path to the node in the data tree (str)

Returns:

* boolean

</details>

<details>

<summary>find_next(...)</summary>

Method:

```python
find_next(self, mc, type, inkeys)
```

Find next.

Update the cursor 'mc' with the key(s) for the list entry designated
by the 'type' and 'inkeys' arguments. This function may be used to
start a traversal from an arbitrary entry in a list. Keys for
subsequent entries may be retrieved with the get_next() function.
When no more keys are found, False is returned.

The strategy to use is defined by 'type':

    FIND_NEXT - The keys for the first list entry after the one
                indicated by the 'inkeys' argument.
    FIND_SAME_OR_NEXT - If the values in the 'inkeys' array completely
                identifies an actual existing list entry, the keys for
                this entry are requested. Otherwise the same logic as
                for FIND_NEXT above.

</details>

<details>

<summary>get_next(...)</summary>

Method:

```python
get_next(self, mc)
```

Iterate and get the keys for the next entry in a list.

When no more keys are found, False is returned

Arguments:

* cursor (maapi.Cursor)

Returns:

* keys (list or boolean)

</details>

<details>

<summary>get_objects(...)</summary>

Method:

```python
get_objects(self, mc, n, nobj)
```

Get objects.

Read at most n values from each nobj lists starting at cursor mc.
Returns a list of Value's.

Arguments:

* mc (maapi.Cursor)
* n -- at most n values will be read (int)
* nobj -- number of nobj lists which n elements will be taken from (int)

Returns:

* list of values (list)

</details>

<details>

<summary>get_running_db_status(...)</summary>

Method:

```python
get_running_db_status(self)
```

Get running db status.

Gets the status of the running db. Returns True if consistent and
False otherwise.

Returns:

* boolean

</details>

<details>

<summary>ip</summary>

_Readonly property_

Return address to connect to the IPC port

</details>

<details>

<summary>load_schemas(...)</summary>

Method:

```python
load_schemas(self, use_maapi_socket=False)
```

Load the schemas to Python (using shared memory if enabled).

If 'use_maapi_socket' is set to True, the schmeas are loaded through
the NSO daemon via a MAAPI socket.

</details>

<details>

<summary>netconf_ssh_call_home(...)</summary>

Method:

```python
netconf_ssh_call_home(self, host, port=4334)
```

Initiate NETCONF SSH Call Home.

</details>

<details>

<summary>netconf_ssh_call_home_opaque(...)</summary>

Method:

```python
netconf_ssh_call_home_opaque(self, host, opaque, port=4334)
```

Initiate NETCONF SSH Call Home w. opaque data.

</details>

<details>

<summary>path</summary>

_Readonly property_

Return path to connect to the IPC port

</details>

<details>

<summary>port</summary>

_Readonly property_

Return port to connect to the IPC port

</details>

<details>

<summary>progress_info(...)</summary>

Method:

```python
progress_info(self, msg, verbosity=0, attrs=None, links=None, path=None)
```

While spans represents a pair of data points: start and stop; info
events are instead singular events, one point in time. Call
progress_info() to write a progress span info event to the progress
trace. The info event will have the same span-id as the start and stop
events of the currently ongoing progress span in the active user session
or transaction. See help for start_progress_span() for more information.

Arguments:

* msg - message to report (str)
* verbosity - ncs.VERBOSITY_*, VERBOSITY_NORMAL is default (optional)
* attrs - user defined attributes (optional)
* links - list of ncs.progress.Span or dict (optional)
* path - keypath to an action/leaf/service/etc (str, optional)

</details>

<details>

<summary>query_free_result(...)</summary>

Method:

```python
query_free_result(self, qrs)
```

Deallocate QueryResult memory.

Deallocated memory inside the QueryResult object 'qrs' returned from
query_result(). It is not necessary to call this method as deallocation
will be done when the Python library garbage collects the QueryResult
object.

Arguments:

* qrs -- the query result structure to free

</details>

<details>

<summary>report_progress(...)</summary>

Method:

```python
report_progress(self, th, verbosity, msg, package=None)
```

Report transaction/action progress.

The 'package' argument is only available to NCS.

This function is deprecated and will be removed in a future release.
Use progress_info() instead.

</details>

<details>

<summary>report_progress_start(...)</summary>

Method:

```python
report_progress_start(self, th, verbosity, msg, package=None)
```

Report transaction/action progress.

Used for calculation of the duration between two events. The method
returns a _Progress object to be passed to report_progress_stop()
once the event has finished.

The 'package' argument is only available to NCS.

This function is deprecated and will be removed in a future release.
Use start_progress_span() instead.

</details>

<details>

<summary>report_progress_stop(...)</summary>

Method:

```python
report_progress_stop(self, th, progress, annotation=None)
```

Report transaction/action progress.

Used for calculation of the duration between two events. The method
takes a _Progress object returned from report_progress_start().

This function is deprecated and will be removed in a future release.
Use end_progress_span() instead.

</details>

<details>

<summary>report_service_progress(...)</summary>

Method:

```python
report_service_progress(self, th, verbosity, msg, path, package=None)
```

Report transaction progress for a FASTMAP service.

This function is deprecated and will be removed in a future release.
Use progress_info() instead.

</details>

<details>

<summary>report_service_progress_start(...)</summary>

Method:

```python
report_service_progress_start(self, th, verbosity, msg, path, package=None)
```

Report transaction progress for a FASTMAP service.

Used for calculation of the duration between two events. The method
returns a _Progress object to be passed to
report_service_progress_stop() once the event has finished.

This function is deprecated and will be removed in a future release.
Use start_progress_span() instead.

</details>

<details>

<summary>report_service_progress_stop(...)</summary>

Method:

```python
report_service_progress_stop(self, th, progress, annotation=None)
```

Report transaction progress for a FASTMAP service.

Used for calculation of the duration between two events. The method
takes a _Progress object returned from report_service_progress_start().

This function is deprecated and will be removed in a future release.
Use end_progress_span() instead.

</details>

<details>

<summary>run_with_retry(...)</summary>

Method:

```python
run_with_retry(self, fun, max_num_retries=10, commit_params=None, usid=0, flags=0, vendor=None, product=None, version=None, client_id=None)
```

Run fun with a new read-write transaction against RUNNING.

The transaction is applied if fun returns True. The fun is
only retried in case of transaction conflicts. Each retry is
run using a new transaction.

The last conflict error.Error is thrown in case of max number of
retries is reached.

Arguments:

* fun - work fun (fun(maapi.Transaction) -> bool)
* usid - user id (int)
* max_num_retries - maximum number of retries (int)

Returns:

* bool True if transation was applied, else False.

</details>

<details>

<summary>safe_create(...)</summary>

Method:

```python
safe_create(self, th, path)
```

Safe version of create.

Create a new list entry, a presence container, or a leaf of
type empty in the data tree - if it doesn't already exist.

Arguments:

* th -- transaction handle
* path -- path to the new element (str)

</details>

<details>

<summary>safe_delete(...)</summary>

Method:

```python
safe_delete(self, th, path)
```

Safe version of delete.

Delete an existing list entry, a presence container, or an
optional leaf and all its children (if any) from the data
tree. If it exists.

Arguments:

* th -- transaction handle
* path -- path to the element (str)

</details>

<details>

<summary>safe_get_elem(...)</summary>

Method:

```python
safe_get_elem(self, th, path)
```

Safe version of get_elem.

Read the element at 'path', returns 'None' if it doesn't
exist.

Arguments:

* th -- transaction handle
* path -- path to the element (str)

Returns:

* configuration element

</details>

<details>

<summary>safe_get_object(...)</summary>

Method:

```python
safe_get_object(self, th, n, path)
```

Safe version of get_object.

This function reads at most 'n' values from the list entry or
container specified by the 'path'. Returns 'None' the path is
empty.

Arguments:

* th -- transaction handle
* n -- at most n values (int)
* path -- path to the object (str)

Returns:

* configuration object

</details>

<details>

<summary>set_elem(...)</summary>

Method:

```python
set_elem(self, th, value, path)
```

Set the node at 'path' to 'value'.

If 'value' is not of type Value it will be converted to a string
before calling set_elem2() under the hood.

Arguments:

* th -- transaction handle
* value -- element value (Value or str)
* path -- path to the element (str)

</details>

<details>

<summary>shared_apply_template(...)</summary>

Method:

```python
shared_apply_template(self, th, name, path, vars=None, flags=0)
```

FASTMAP version of apply_template().

</details>

<details>

<summary>shared_copy_tree(...)</summary>

Method:

```python
shared_copy_tree(self, th, from_path, to_path, flags=0)
```

FASTMAP version of copy_tree().

</details>

<details>

<summary>shared_create(...)</summary>

Method:

```python
shared_create(self, th, path, flags=0)
```

FASTMAP version of create().

</details>

<details>

<summary>shared_insert(...)</summary>

Method:

```python
shared_insert(self, th, path, flags=0)
```

FASTMAP version of insert().

</details>

<details>

<summary>shared_set_elem(...)</summary>

Method:

```python
shared_set_elem(self, th, value, path, flags=0)
```

FASTMAP version of set_elem().

If 'value' is not of type Value it will be converted to a string
before calling shared_set_elem2() under the hood.

</details>

<details>

<summary>shared_set_values(...)</summary>

Method:

```python
shared_set_values(self, th, values, path, flags=0)
```

FASTMAP version of set_values().

</details>

<details>

<summary>start_progress_span(...)</summary>

Method:

```python
start_progress_span(self, msg, verbosity=0, attrs=None, links=None, path=None)
```

Starts a progress span. Progress spans are trace messages written to
the progress trace and the developer log. A progress span consists of a
start and a stop event which can be used to calculate the duration
between the two. Those events can be identified with unique span-ids.
Inside the span it is possible to start new spans, which will then
become child spans, the parent-span-id is set to the previous spans'
span-id. A child span can be used to calculate the duration of a sub
task, and is started from consecutive maapi_start_progress_span() calls,
and is ended with maapi_end_progress_span().

The concepts of traces, trace-id and spans are highly influenced by
https://opentelemetry.io/docs/concepts/signals/traces/#spans


Call help(ncs.progress) or help(confd.progress) for examples.

Arguments:

* msg - message to report (str)
* verbosity - ncs.VERBOSITY_*, VERBOSITY_NORMAL is default (optional)
* attrs - user defined attributes (optional)
* links - list of ncs.progress.Span or dict (optional)
* path - keypath to an action/leaf/service/etc (str, optional)

Returns:

* trace span (ncs.progress.Span)

</details>

<details>

<summary>start_read_trans(...)</summary>

Method:

```python
start_read_trans(self, db=2, usid=0, flags=0, vendor=None, product=None, version=None, client_id=None)
```

Start a read transaction.

For details see start_trans().

</details>

<details>

<summary>start_trans(...)</summary>

Method:

```python
start_trans(self, rw, db=2, usid=0, flags=0, vendor=None, product=None, version=None, client_id=None)
```

Start a transaction towards the 'db'.

This function starts a new a new transaction towards the given
data store.

Arguments:

* rw -- Either READ or READ_WRITE flag (ncs)
* db -- Either CANDIDATE, RUNNING or STARTUP flag (cdb)
* usid -- user id (int)
* flags -- additional transaction flags (int)
* vendor -- lock error information (str, optional)
* product -- lock error information (str, optional)
* version -- lock error information (str, optional)
* client_id -- lock error information (str, optional)

Returns:

* transaction (maapi.Transaction)

Flags (maapi):

* FLAG_HINT_BULK
* FLAG_NO_DEFAULTS
* FLAG_CONFIG_ONLY
* FLAG_HIDE_INACTIVE
* FLAG_DELAYED_WHEN
* FLAG_NO_CONFIG_CACHE
* FLAG_CONFIG_CACHE_ONLY
* FLAG_HIDE_ALL_HIDEGROUPS
* FLAG_SKIP_SUBSCRIBERS

</details>

<details>

<summary>start_trans_in_trans(...)</summary>

Method:

```python
start_trans_in_trans(self, th, readwrite, usid=0)
```

Start a new transaction within a transaction.

This function makes it possible to start a transaction with another
transaction as backend, instead of an actual data store. This can be
useful if we want to make a set of related changes, and then either
apply or discard them all based on some criterion, while other changes
remain unaffected. The thandle identifies the backend transaction to
use. If 'usid' is 0, the transaction will be started within the user
session associated with the MAAPI socket, otherwise it will be started
within the user session given by usid. If we call apply() on this
"transaction in a transaction" object, the changes (if any) will be
applied to the backend transaction. To discard the changes, call
finish() without calling apply() first.

Arguments:

* th -- transaction handle
* readwrite -- Either READ or READ_WRITE flag (ncs)
* usid -- user id (int)

Returns:

* transaction (maapi.Transaction)

</details>

<details>

<summary>start_user_session(...)</summary>

Method:

```python
start_user_session(self, user, context, groups=[], src_ip='127.0.0.1', src_port=0, proto=1, vendor=None, product=None, version=None, client_id=None, path=None)
```

Start a new user session.

This method gives some resonable defaults.

Arguments:

* user - username (str)
* context - context for the session (str)
* groups - groups (list)
* src_ip - source ip address (str), ignored for NSO
* src_port - source port (int), ignored for NSO
* proto - protocol used by for connecting (i.e. ncs.PROTO_TCP)
* vendor -- lock error information (str, optional)
* product -- lock error information (str, optional)
* version -- lock error information (str, optional)
* client_id -- lock error information (str, optional)
* path  -- path to Unix-domain socket (only for NSO)

Protocol flags (ncs):

* PROTO_CONSOLE
* PROTO_HTTP
* PROTO_HTTPS
* PROTO_SSH
* PROTO_SSL
* PROTO_SYSTEM
* PROTO_TCP
* PROTO_TLS
* PROTO_TRACE
* PROTO_UDP

Example use:

    maapi.start_user_session(
          sock_maapi,
          'admin',
          'python',
          [],
          _ncs.ADDR,
          _ncs.PROTO_TCP)

</details>

<details>

<summary>start_write_trans(...)</summary>

Method:

```python
start_write_trans(self, db=2, usid=0, flags=0, vendor=None, product=None, version=None, client_id=None)
```

Start a write transaction.

For details see start_trans().

</details>

<details>

<summary>write_service_log_entry(...)</summary>

Method:

```python
write_service_log_entry(self, path, msg, type, level)
```

Write service log entries.

This function makes it possible to write service log entries from
FASTMAP code.

</details>

### _class_ **NoOverwriteScope**

Enumeration for no-overwrite scopes:
WRITE_SET_ONLY             = 1
WRITE_AND_FULL_READ_SET    = 2
WRITE_AND_SERVICE_READ_SET = 3

NoOverwriteScope(*values)

Members:

<details>

<summary>WRITE_AND_FULL_READ_SET</summary>

```python
WRITE_AND_FULL_READ_SET = 2
```


</details>

<details>

<summary>WRITE_AND_SERVICE_READ_SET</summary>

```python
WRITE_AND_SERVICE_READ_SET = 3
```


</details>

<details>

<summary>WRITE_SET_ONLY</summary>

```python
WRITE_SET_ONLY = 1
```


</details>

<details>

<summary>name</summary>

The name of the Enum member.

</details>

<details>

<summary>value</summary>

The value of the Enum member.

</details>

### _class_ **Session**

Encapsulate a MAAPI user session.

Context manager for user sessions. This class makes it easy to use
a single Maapi connection and switch user session along the way.
For example:

    with Maapi() as m:
        for user, context, device in devlist:
            with Session(m, user, context):
                with m.start_write_trans() as t:
                    # ...
                    # do something using the correct user session
                    # ...
                    t.apply()

Session(maapi, user, context, groups=[], src_ip='127.0.0.1', src_port=0, proto=1, vendor=None, product=None, version=None, client_id=None, path=None)

Initialize a Session object via start_user_session().

Arguments:

* maapi -- maapi object (maapi.Maapi)
* for all other arguments see start_user_session()

Members:

<details>

<summary>close(...)</summary>

Method:

```python
close(self)
```

Close the user session.

</details>

### _class_ **Transaction**

Class that corresponds to a single MAAPI transaction.

Transaction(maapi, th=None, rw=None, db=2, vendor=None, product=None, version=None, client_id=None)

Initialize a Transaction object.

When created one may access the maapi and th arguments like this:

    trans = Transaction(mymaapi, th=myth)
    trans.maapi # the Maapi object
    trans.th # the transaction handle

An instance of this class is also a context manager:

    with Transaction(mymaapi, th=myth) as trans:
        # do something here...

When exiting the with statement, finish() will be called.

If 'th' is left out (or None) a new transaction is started using
the 'db' and 'rw' arguments, otherwise 'db' and 'rw' are ignored.

Arguments:

* maapi -- a Maapi object (maapi.Maapi)
* th -- a transaction handle or None
* rw -- Either READ or READ_WRITE flag (ncs)
* db -- Either CANDIDATE, RUNNING or STARTUP flag (cdb)
* vendor -- lock error information (optional)
* product -- lock error information (optional)
* version -- lock error information (optional)
* client_id -- lock error information (optional)

Members:

<details>

<summary>abort(...)</summary>

Method:

```python
abort(self)
```

Abort the transaction.

</details>

<details>

<summary>apply(...)</summary>

Method:

```python
apply(self, keep_open=True, flags=0)
```

Apply the transaction.

Validates, prepares and eventually commits or aborts the
transaction. If the validation fails and the 'keep_open'
argument is set to True (default), the transaction is left
open and the developer can react upon the validation errors.

Arguments:

* keep_open -- keep transaction open (boolean)
* flags - additional transaction flags (int)

Flags (maapi):

* COMMIT_NCS_NO_REVISION_DROP
* COMMIT_NCS_NO_DEPLOY
* COMMIT_NCS_NO_NETWORKING
* COMMIT_NCS_NO_OUT_OF_SYNC_CHECK
* COMMIT_NCS_NO_OVERWRITE_WRITE_SET_ONLY
* COMMIT_NCS_NO_OVERWRITE_WRITE_AND_FULL_READ_SET
* COMMIT_NCS_NO_OVERWRITE_WRITE_AND_FULL_SERVICE_SET
* COMMIT_NCS_USE_LSA
* COMMIT_NCS_NO_LSA
* COMMIT_NCS_RECONCILE_KEEP_NON_SERVICE_CONFIG
* COMMIT_NCS_RECONCILE_DISCARD_NON_SERVICE_CONFIG
* COMMIT_NCS_RECONCILE_ATTACH_NON_SERVICE_CONFIG
* COMMIT_NCS_RECONCILE_DETACH_NON_SERVICE_CONFIG
* COMMIT_NCS_CONFIRM_NETWORK_STATE
* COMMIT_NCS_CONFIRM_NETWORK_STATE_RE_EVALUATE_POLICIES

</details>

<details>

<summary>apply_params(...)</summary>

Method:

```python
apply_params(self, keep_open=True, params=None)
```

Apply the transaction and return the result in form of dict().

Validates, prepares and eventually commits or aborts the
transaction. If the validation fails and the 'keep_open'
argument is set to True (default), the transaction is left
open and the developer can react upon the validation errors.

The 'params' argument represent commit parameters. See CommitParams
class for available commit parameters.

The result is a dictionary representing the result of applying
transaction. If dry-run was requested, then the resulting dictionary
will have 'dry-run' key set along with the actual results. If commit
through commit queue was requested, then the resulting dictionary
will have 'commit-queue' key set. Otherwise the dictionary will
be empty.

Arguments:

* keep_open -- keep transaction open (boolean)
* params -- list of commit parameters (maapi.CommitParams)

Returns:

* dict (see above)

Example use:

    with ncs.maapi.single_write_trans('admin', 'python') as t:
        root = ncs.maagic.get_root(t)
        dns_list = root.devices.device['ex1'].config.sys.dns.server
        dns_list.create('192.0.2.1')
        params = t.get_params()
        params.dry_run_native()
        result = t.apply_params(True, params)
        print(result['device']['ex1'])
        t.apply_params(True, t.get_params())

</details>

<details>

<summary>commit(...)</summary>

Method:

```python
commit(self)
```

Commit the transaction.

</details>

<details>

<summary>end_progress_span(...)</summary>

Method:

```python
end_progress_span(self, *args)
```

Don't call this function.

Call instance.end() on the progress.Span instance created from
start_progress_span() instead.

</details>

<details>

<summary>finish(...)</summary>

Method:

```python
finish(self)
```

Finish the transaction.

This will finish the transaction. If the transaction is implemented
by an external database, this will invoke the finish() callback.

</details>

<details>

<summary>get_params(...)</summary>

Method:

```python
get_params(self)
```

Get the current commit parameters for the transaction.

The result is an instance of the CommitParams class.

</details>

<details>

<summary>hide_group(...)</summary>

Method:

```python
hide_group(self, group_name)
```

Do hide a hide group.

Hide all nodes belonging to a hide group in a transaction that started
with flag FLAG_HIDE_ALL_HIDEGROUPS.

</details>

<details>

<summary>prepare(...)</summary>

Method:

```python
prepare(self, flags=0)
```

Prepare transaction.

This function must be called as first part of two-phase commit. After
this function has been called, commit() or abort() must be called.

It will invoke the prepare callback in all participants in the
transaction. If all participants reply with OK, the second phase of
the two-phase commit procedure is commenced.

Arguments:

* flags - additional transaction flags (int)

Flags (maapi):

* COMMIT_NCS_NO_REVISION_DROP
* COMMIT_NCS_NO_DEPLOY
* COMMIT_NCS_NO_NETWORKING
* COMMIT_NCS_NO_OUT_OF_SYNC_CHECK
* COMMIT_NCS_NO_OVERWRITE_WRITE_SET_ONLY
* COMMIT_NCS_NO_OVERWRITE_WRITE_AND_FULL_READ_SET
* COMMIT_NCS_NO_OVERWRITE_WRITE_AND_SERVICE_READ_SET
* COMMIT_NCS_USE_LSA
* COMMIT_NCS_NO_LSA
* COMMIT_NCS_RECONCILE_KEEP_NON_SERVICE_CONFIG
* COMMIT_NCS_RECONCILE_DISCARD_NON_SERVICE_CONFIG
* COMMIT_NCS_RECONCILE_ATTACH_NON_SERVICE_CONFIG
* COMMIT_NCS_RECONCILE_DETACH_NON_SERVICE_CONFIG
* COMMIT_NCS_CONFIRM_NETWORK_STATE
* COMMIT_NCS_CONFIRM_NETWORK_STATE_RE_EVALUATE_POLICIES

</details>

<details>

<summary>progress_info(...)</summary>

Method:

```python
progress_info(self, msg, verbosity=0, attrs=None, links=None, path=None)
```

While spans represents a pair of data points: start and stop; info
events are instead singular events, one point in time. Call
progress_info() to write a progress span info event to the progress
trace. The info event will have the same span-id as the start and stop
events of the currently ongoing progress span in the active user session
or transaction. See help for start_progress_span() for more information.

Arguments:

* msg - message to report (str)
* verbosity - ncs.VERBOSITY_*, VERBOSITY_NORMAL is default (optional)
* attrs - user defined attributes (optional)
* links - list of ncs.progress.Span or dict (optional)
* path - keypath to an action/leaf/service/etc (str, optional)

</details>

<details>

<summary>start_progress_span(...)</summary>

Method:

```python
start_progress_span(self, msg, verbosity=0, attrs=None, links=None, path=None)
```

Starts a progress span. Progress spans are trace messages written to
the progress trace and the developer log. A progress span consists of a
start and a stop event which can be used to calculate the duration
between the two. Those events can be identified with unique span-id.
Inside the span it is possible to start new spans, which will then
become child spans, the parent-span-id is set to the previous spans'
span-id. A child span can be used to calculate the duration of a sub
task, and is started from consecutive maapi_start_progress_span() calls,
and is ended with maapi_end_progress_span().

The function returns a Span object which either stops the span by
invoking span.end() or by exiting a 'with' context. Messages are
written to the progress trace which can be directed to a file, oper
data or as notifications.

Call help(ncs.progress) or help(confd.progress) for examples.

Arguments:

* msg - message to report (str)
* verbosity - ncs.VERBOSITY_*, VERBOSITY_NORMAL is default (optional)
* attrs - user defined attributes (optional)
* links - list of ncs.progress.Span or dict (optional)
* path - keypath to an action/leaf/service/etc (str, optional)

Returns:

* trace span (ncs.progress.Span)

</details>

<details>

<summary>unhide_group(...)</summary>

Method:

```python
unhide_group(self, group_name)
```

Do unhide a hide group.

Unhide all nodes belonging to a hide group in a transaction that started
with flag FLAG_HIDE_ALL_HIDEGROUPS.

</details>

<details>

<summary>validate(...)</summary>

Method:

```python
validate(self, unlock, forcevalidation=False)
```

Validate the transaction.

This function validates all data written in the transaction. This
includes all data model constraints and all defined semantic
validation, i.e. user programs that have registered functions under
validation points.

If 'unlock' is True, the transaction is open for further editing even
if validation succeeds. If 'unlock' is False and the function succeeds
next function to be called MUST be prepare() or finish().

'unlock = True' can be used to implement a 'validate' command which
can be given in the middle of an editing session. The first thing that
happens is that a lock is set. If 'unlock' == False, the lock is
released on success. The lock is always released on failure.

The 'forcevalidation' argument should normally be False. It has no
effect for a transaction towards the running or startup data stores,
validation is always performed. For a transaction towards the
candidate data store, validation will not be done unless
'forcevalidation' is True. Avoiding this validation is preferable if
we are going to commit the candidate to running, since otherwise the
validation will be done twice. However if we are implementing a
'validate' command, we should give a True value for 'forcevalidation'.

Arguments:

* unlock (boolean)
* forcevalidation (boolean)

</details>

## Predefined Values

```python

CMD_KEEP_PIPE = 8
CMD_NO_AAA = 4
CMD_NO_FULLPATH = 1
CMD_NO_HIDDEN = 2
COMMIT_NCS_ASYNC_COMMIT_QUEUE = 256
COMMIT_NCS_BYPASS_COMMIT_QUEUE = 64
COMMIT_NCS_CONFIRM_NETWORK_STATE = 268435456
COMMIT_NCS_CONFIRM_NETWORK_STATE_RE_EVALUATE_POLICIES = 536870912
COMMIT_NCS_NO_DEPLOY = 8
COMMIT_NCS_NO_FASTMAP = 8
COMMIT_NCS_NO_LSA = 1048576
COMMIT_NCS_NO_NETWORKING = 16
COMMIT_NCS_NO_OUT_OF_SYNC_CHECK = 32
COMMIT_NCS_NO_OVERWRITE = 1024
COMMIT_NCS_NO_REVISION_DROP = 4
COMMIT_NCS_RECONCILE_ATTACH_NON_SERVICE_CONFIG = 67108864
COMMIT_NCS_RECONCILE_DETACH_NON_SERVICE_CONFIG = 134217728
COMMIT_NCS_RECONCILE_DISCARD_NON_SERVICE_CONFIG = 33554432
COMMIT_NCS_RECONCILE_KEEP_NON_SERVICE_CONFIG = 16777216
COMMIT_NCS_SYNC_COMMIT_QUEUE = 512
COMMIT_NCS_USE_LSA = 524288
CONFIG_AUTOCOMMIT = 8192
CONFIG_C = 4
CONFIG_CDB_ONLY = 4194304
CONFIG_CONTINUE_ON_ERROR = 16384
CONFIG_C_IOS = 32
CONFIG_HIDE_ALL = 2048
CONFIG_J = 2
CONFIG_JSON = 131072
CONFIG_MERGE = 64
CONFIG_NO_BACKQUOTE = 2097152
CONFIG_NO_PARENTS = 524288
CONFIG_OPER_ONLY = 1048576
CONFIG_READ_WRITE_ACCESS_ONLY = 33554432
CONFIG_REPLACE = 1024
CONFIG_SHOW_DEFAULTS = 16
CONFIG_SUPPRESS_ERRORS = 32768
CONFIG_TURBO_C = 8388608
CONFIG_UNHIDE_ALL = 4096
CONFIG_WITH_DEFAULTS = 8
CONFIG_WITH_OPER = 128
CONFIG_WITH_SERVICE_META = 262144
CONFIG_XML = 1
CONFIG_XML_LOAD_LAX = 65536
CONFIG_XML_PRETTY = 512
CONFIG_XPATH = 256
DEL_ALL = 2
DEL_EXPORTED = 3
DEL_SAFE = 1
ECHO = 1
FLAG_CONFIG_CACHE_ONLY = 32
FLAG_CONFIG_ONLY = 4
FLAG_DELAYED_WHEN = 64
FLAG_DELETE = 2
FLAG_EMIT_PARENTS = 1
FLAG_HIDE_ALL_HIDEGROUPS = 256
FLAG_HIDE_INACTIVE = 8
FLAG_HINT_BULK = 1
FLAG_NON_RECURSIVE = 4
FLAG_NO_CONFIG_CACHE = 16
FLAG_NO_DEFAULTS = 2
FLAG_SKIP_SUBSCRIBERS = 512
LOAD_SCHEMAS_LOAD = True
LOAD_SCHEMAS_RELOAD = 2
LOAD_SCHEMAS_SKIP = False
MOVE_AFTER = 3
MOVE_BEFORE = 2
MOVE_FIRST = 1
MOVE_LAST = 4
NOECHO = 0
PRODUCT = 'NCS'
UPGRADE_KILL_ON_TIMEOUT = 1
```
