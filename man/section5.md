<!-- Test documentation master file, created by
sphinx-quickstart on Wed May 28 11:52:41 2025.
You can adapt this file completely to your liking, but it should at least
contain the root `toctree` directive. -->

# Test documentation

Add your content using `reStructuredText` syntax. See the
[reStructuredText](https://www.sphinx-doc.org/en/master/usage/restructuredtext/index.html)
documentation for details.

<a id="module-ncs.maapi"></a>

MAAPI high level module.

This module defines a high level interface to the low-level maapi functions.

The ‘Maapi’ class encapsulates a MAAPI connection which upon constructing,
sets up a connection towards ConfD/NCS. An example of setting up a transaction
and manipulating data:

> import ncs

> m = ncs.maapi.Maapi()
> m.start_user_session(‘admin’, ‘test_context’)
> t = m.start_write_trans()
> t.get_elem(‘/model/data{one}/str’)
> t.set_elem(‘testing’, ‘/model/data{one}/str’)
> t.apply()

Another way is to use context managers, which will handle all cleanup
related to transactions, user sessions and socket connections:

> with ncs.maapi.Maapi() as m:
> : with ncs.maapi.Session(m, ‘admin’, ‘test_context’):
>   : with m.start_write_trans() as t:
>     : t.get_elem(‘/model/data{one}/str’)
>       t.set_elem(‘testing’, ‘/model/data{one}/str’)
>       t.apply()

Finally, a really compact way of doing this:

> with ncs.maapi.single_write_trans(‘admin’, ‘test_context’) as t:
> : t.get_elem(‘/model/data{one}/str’)
>   t.set_elem(‘testing’, ‘/model/data{one}/str’)
>   t.apply()

### ncs.maapi.CommitParams(result=None)

Class representing NSO commit parameters.

Start with creating an empty instance of this class and set commit
parameters using helper methods.

### *class* ncs.maapi.Cursor

struct maapi_cursor object

#### \_\_init_\_(\*args, \*\*kwargs)

#### *classmethod* \_\_new_\_(\*args, \*\*kwargs)

#### \_\_repr_\_()

Return repr(self).

#### \_\_str_\_()

Return str(self).

### ncs.maapi.DryRunOutformat(\*values)

Enumeration for dry run formats:
XML    = 1
CLI    = 2
NATIVE = 3
CLI_C  = 4

### *class* ncs.maapi.Key(key, enum_cs_nodes=None)

Key string encapsulation and helper.

#### \_\_getitem_\_(key)

Get key at index ‘key’.

#### \_\_init_\_(key, enum_cs_nodes=None)

Initialize a key.

‘key’ may be a string or a list of strings.

#### \_\_iter_\_()

Return a key iterator object.

#### \_\_len_\_()

Get number of keys.

#### \_\_repr_\_()

Get internal representation.

#### \_\_str_\_()

Get string representation.

#### \_\_weakref_\_

list of weak references to the object

### *class* ncs.maapi.Maapi(ip='127.0.0.1', port=4569, path=None, load_schemas=True, msock=None)

Class encapsulating a MAAPI connection.

#### \_\_dir_\_()

Return a list of all available methods in Maapi.

#### \_\_enter_\_()

Python magic method.

#### \_\_exit_\_(exc_type, exc_value, tb)

Python magic method.

#### \_\_getattr_\_(name)

Python magic method.

This method will be called whenever an attribute not present here
is accessed. It will try to find a corresponding attribute in the
low-level maapi module which takes a maapi socket as the first
arument and forward the call there.

Example (pseudo code):

> import ncs     # high-level module
> import \_ncs    # low-level module

> maapi = ncs.maapi.Maapi()

> Now, these two calls are equal:
> : 1. maapi.install_crypto_keys()
>   1. \_ncs.maapi.install_crypto_keys(maapi.msock)

#### \_\_init_\_(ip='127.0.0.1', port=4569, path=None, load_schemas=True, msock=None)

Create a Maapi instance.

Arguments:

* ip – ConfD/NCS instance ip address (str, optional)
* port – ConfD/NCS instance port (int, optional)
* path – ConfD/NCS instance location path (str, optional)
* msock – already connected MAAPI socket (socket.socket, optional)
  : (ip, port and path ignored)
* load_schemas – whether schemas should be loaded/reloaded or not
  : LOAD_SCHEMAS_LOAD = load schemas unless already loaded
    LOAD_SCHEMAS_SKIP = do not load schemas
    LOAD_SCHEMAS_RELOAD = force reload of schemas

The option LOAD_SCHEMAS_RELOAD can be used to force a reload of
schemas, for example when connecting to a different ConfD/NSO node.
Note that previously constructed maagic objects will be invalid and
using them will lead to undefined behavior. Use this option with care,
for example in a small script querying a list of running nodes.

#### \_\_repr_\_()

Get internal representation.

#### \_\_weakref_\_

list of weak references to the object

#### apply_template(th, name, path, vars=None, flags=0)

Apply a template.

#### attach(ctx_or_th, hashed_ns=0, usid=0)

Attach to an existing transaction.

‘ctx_or_th’ may be either a TransCtxRef or a transaction handle.
The ‘hashed_ns’ argument is basically just there to save a call to
set_namespace(). ‘usid’ is only used if ‘ctx_or_th’ is a transaction
handle and if set to 0 the user session id that is the owner of the
transaction will be used.

Arguments:

* ctx_or_th (TransCtxRef or transaction handle)
* hashed_ns (int)
* usid (int)

Returns:

* transaction object (maapi.Transaction)

#### attach_init()

Attach to phase0 for CDB initialization and upgrade.

#### authenticate(user, password, n, src_addr=None, src_port=None, context=None, prot=None)

Authenticate a user using the AAA configuration.

Use src_addr, src_port, context and prot to use an external
authentication executable.
Use the ‘n’ to get a list of n-1 groups that the user is a member of.
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

#### close()

Ends session and closes socket.

#### cursor(th, path, enum_cs_nodes=None, want_values=False, secondary_index=None, xpath_expr=None)

Get an iterable list cursor.

#### destroy_cursor(mc)

Destroy cursor.

Arguments:

* cursor (maapi.Cursor)

#### detach(ctx_or_th)

Detach the underlying MAAPI socket.

Arguments:

* ctx_or_th (TransCtxRef or transaction handle)

#### do_display(th, path)

Do display.

If the data model uses the YANG when or tailf:display-when
statement, this function can be used to determine if the item
given by the path should be displayed or not.

Arguments:

* th – transaction handle
* path – path to the ‘display-when’ statement (str)

Returns

* boolean

#### end_progress_span(\*args)

Don’t call this function.

Call instance.end() on the progress.Span instance created from
start_progress_span() instead.

#### exists(th, path)

Check if path exists.

Arguments:

* th – transaction handle
* path – path to the node in the data tree (str)

Returns:

* boolean

#### find_next(mc, type, inkeys)

Find next.

Update the cursor ‘mc’ with the key(s) for the list entry designated
by the ‘type’ and ‘inkeys’ arguments. This function may be used to
start a traversal from an arbitrary entry in a list. Keys for
subsequent entries may be retrieved with the get_next() function.
When no more keys are found, False is returned.

The strategy to use is defined by ‘type’:

> FIND_NEXT - The keys for the first list entry after the one
> : indicated by the ‘inkeys’ argument.

> FIND_SAME_OR_NEXT - If the values in the ‘inkeys’ array completely
> : identifies an actual existing list entry, the keys for
>   this entry are requested. Otherwise the same logic as
>   for FIND_NEXT above.

#### get_next(mc)

Iterate and get the keys for the next entry in a list.

When no more keys are found, False is returned

Arguments:

* cursor (maapi.Cursor)

Returns:

* keys (list or boolean)

#### get_objects(mc, n, nobj)

Get objects.

Read at most n values from each nobj lists starting at cursor mc.
Returns a list of Value’s.

Arguments:

* mc (maapi.Cursor)
* n – at most n values will be read (int)
* nobj – number of nobj lists which n elements will be taken from (int)

Returns:

* list of values (list)

#### get_running_db_status()

Get running db status.

Gets the status of the running db. Returns True if consistent and
False otherwise.

Returns:

* boolean

#### *property* ip

Return address to connect to the IPC port

#### load_schemas(use_maapi_socket=False)

Load the schemas to Python (using shared memory if enabled).

If ‘use_maapi_socket’ is set to True, the schmeas are loaded through
the NSO daemon via a MAAPI socket.

#### netconf_ssh_call_home(host, port=4334)

Initiate NETCONF SSH Call Home.

#### netconf_ssh_call_home_opaque(host, opaque, port=4334)

Initiate NETCONF SSH Call Home w. opaque data.

#### *property* path

Return path to connect to the IPC port

#### *property* port

Return port to connect to the IPC port

#### progress_info(msg, verbosity=0, attrs=None, links=None, path=None)

While spans represents a pair of data points: start and stop; info
events are instead singular events, one point in time. Call
progress_info() to write a progress span info event to the progress
trace. The info event will have the same span-id as the start and stop
events of the currently ongoing progress span in the active user session
or transaction. See help for start_progress_span() for more information.

Arguments:

* msg - message to report (str)
* verbosity - ncs.VERBOSITY_\*, VERBOSITY_NORMAL is default (optional)
* attrs - user defined attributes (optional)
* links - list of ncs.progress.Span or dict (optional)
* path - keypath to an action/leaf/service/etc (str, optional)

#### query_free_result(qrs)

Deallocate QueryResult memory.

Deallocated memory inside the QueryResult object ‘qrs’ returned from
query_result(). It is not necessary to call this method as deallocation
will be done when the Python library garbage collects the QueryResult
object.

Arguments:

* qrs – the query result structure to free

#### report_progress(th, verbosity, msg, package=None)

Report transaction/action progress.

The ‘package’ argument is only available to NCS.

This function is deprecated and will be removed in a future release.
Use progress_info() instead.

#### report_progress_start(th, verbosity, msg, package=None)

Report transaction/action progress.

Used for calculation of the duration between two events. The method
returns a \_Progress object to be passed to report_progress_stop()
once the event has finished.

The ‘package’ argument is only available to NCS.

This function is deprecated and will be removed in a future release.
Use start_progress_span() instead.

#### report_progress_stop(th, progress, annotation=None)

Report transaction/action progress.

Used for calculation of the duration between two events. The method
takes a \_Progress object returned from report_progress_start().

This function is deprecated and will be removed in a future release.
Use end_progress_span() instead.

#### report_service_progress(th, verbosity, msg, path, package=None)

Report transaction progress for a FASTMAP service.

This function is deprecated and will be removed in a future release.
Use progress_info() instead.

#### report_service_progress_start(th, verbosity, msg, path, package=None)

Report transaction progress for a FASTMAP service.

Used for calculation of the duration between two events. The method
returns a \_Progress object to be passed to
report_service_progress_stop() once the event has finished.

This function is deprecated and will be removed in a future release.
Use start_progress_span() instead.

#### report_service_progress_stop(th, progress, annotation=None)

Report transaction progress for a FASTMAP service.

Used for calculation of the duration between two events. The method
takes a \_Progress object returned from report_service_progress_start().

This function is deprecated and will be removed in a future release.
Use end_progress_span() instead.

#### run_with_retry(fun, max_num_retries=10, commit_params=None, usid=0, flags=0, vendor=None, product=None, version=None, client_id=None)

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

#### safe_create(th, path)

Safe version of create.

Create a new list entry, a presence container, or a leaf of
type empty in the data tree - if it doesn’t already exist.

Arguments:

* th – transaction handle
* path – path to the new element (str)

#### safe_delete(th, path)

Safe version of delete.

Delete an existing list entry, a presence container, or an
optional leaf and all its children (if any) from the data
tree. If it exists.

Arguments:

* th – transaction handle
* path – path to the element (str)

#### safe_get_elem(th, path)

Safe version of get_elem.

Read the element at ‘path’, returns ‘None’ if it doesn’t
exist.

Arguments:

* th – transaction handle
* path – path to the element (str)

Returns:

* configuration element

#### safe_get_object(th, n, path)

Safe version of get_object.

This function reads at most ‘n’ values from the list entry or
container specified by the ‘path’. Returns ‘None’ the path is
empty.

Arguments:

* th – transaction handle
* n – at most n values (int)
* path – path to the object (str)

Returns:

* configuration object

#### set_elem(th, value, path)

Set the node at ‘path’ to ‘value’.

If ‘value’ is not of type Value it will be converted to a string
before calling set_elem2() under the hood.

Arguments:

* th – transaction handle
* value – element value (Value or str)
* path – path to the element (str)

#### shared_apply_template(th, name, path, vars=None, flags=0)

FASTMAP version of apply_template().

#### shared_copy_tree(th, from_path, to_path, flags=0)

FASTMAP version of copy_tree().

#### shared_create(th, path, flags=0)

FASTMAP version of create().

#### shared_insert(th, path, flags=0)

FASTMAP version of insert().

#### shared_set_elem(th, value, path, flags=0)

FASTMAP version of set_elem().

If ‘value’ is not of type Value it will be converted to a string
before calling shared_set_elem2() under the hood.

#### shared_set_values(th, values, path, flags=0)

FASTMAP version of set_values().

#### start_progress_span(msg, verbosity=0, attrs=None, links=None, path=None)

Starts a progress span. Progress spans are trace messages written to
the progress trace and the developer log. A progress span consists of a
start and a stop event which can be used to calculate the duration
between the two. Those events can be identified with unique span-ids.
Inside the span it is possible to start new spans, which will then
become child spans, the parent-span-id is set to the previous spans’
span-id. A child span can be used to calculate the duration of a sub
task, and is started from consecutive maapi_start_progress_span() calls,
and is ended with maapi_end_progress_span().

The concepts of traces, trace-id and spans are highly influenced by
[https://opentelemetry.io/docs/concepts/signals/traces/#spans](https://opentelemetry.io/docs/concepts/signals/traces/#spans)

Call help(ncs.progress) or help(confd.progress) for examples.

Arguments:

* msg - message to report (str)
* verbosity - ncs.VERBOSITY_\*, VERBOSITY_NORMAL is default (optional)
* attrs - user defined attributes (optional)
* links - list of ncs.progress.Span or dict (optional)
* path - keypath to an action/leaf/service/etc (str, optional)

Returns:

* trace span (ncs.progress.Span)

#### start_read_trans(db=2, usid=0, flags=0, vendor=None, product=None, version=None, client_id=None)

Start a read transaction.

For details see start_trans().

#### start_trans(rw, db=2, usid=0, flags=0, vendor=None, product=None, version=None, client_id=None)

Start a transaction towards the ‘db’.

This function starts a new a new transaction towards the given
data store.

Arguments:

* rw – Either READ or READ_WRITE flag (ncs)
* db – Either CANDIDATE, RUNNING or STARTUP flag (cdb)
* usid – user id (int)
* flags – additional transaction flags (int)
* vendor – lock error information (str, optional)
* product – lock error information (str, optional)
* version – lock error information (str, optional)
* client_id – lock error information (str, optional)

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

#### start_trans_in_trans(th, readwrite, usid=0)

Start a new transaction within a transaction.

This function makes it possible to start a transaction with another
transaction as backend, instead of an actual data store. This can be
useful if we want to make a set of related changes, and then either
apply or discard them all based on some criterion, while other changes
remain unaffected. The thandle identifies the backend transaction to
use. If ‘usid’ is 0, the transaction will be started within the user
session associated with the MAAPI socket, otherwise it will be started
within the user session given by usid. If we call apply() on this
“transaction in a transaction” object, the changes (if any) will be
applied to the backend transaction. To discard the changes, call
finish() without calling apply() first.

Arguments:

* th – transaction handle
* readwrite – Either READ or READ_WRITE flag (ncs)
* usid – user id (int)

Returns:

* transaction (maapi.Transaction)

#### start_user_session(user, context, groups=[], src_ip='127.0.0.1', src_port=0, proto=1, vendor=None, product=None, version=None, client_id=None, path=None)

Start a new user session.

This method gives some resonable defaults.

Arguments:

* user - username (str)
* context - context for the session (str)
* groups - groups (list)
* src_ip - source ip address (str)
* src_port - source port (int)
* proto - protocol used by for connecting (i.e. ncs.PROTO_TCP)
* vendor – lock error information (str, optional)
* product – lock error information (str, optional)
* version – lock error information (str, optional)
* client_id – lock error information (str, optional)
* path  – path to Unix-domain socket (only for NSO)

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

> maapi.start_user_session(
> : sock_maapi,
>   ‘admin’,
>   ‘python’,
>   [],
>   \_ncs.ADDR,
>   \_ncs.PROTO_TCP)

#### start_write_trans(db=2, usid=0, flags=0, vendor=None, product=None, version=None, client_id=None)

Start a write transaction.

For details see start_trans().

#### write_service_log_entry(path, msg, type, level)

Write service log entries.

This function makes it possible to write service log entries from
FASTMAP code.

### ncs.maapi.NoOverwriteScope(\*values)

Enumeration for no-overwrite scopes:
WRITE_SET_ONLY             = 1
WRITE_AND_FULL_READ_SET    = 2
WRITE_AND_SERVICE_READ_SET = 3

### *class* ncs.maapi.Session(maapi, user, context, groups=[], src_ip='127.0.0.1', src_port=0, proto=1, vendor=None, product=None, version=None, client_id=None, path=None)

Encapsulate a MAAPI user session.

Context manager for user sessions. This class makes it easy to use
a single Maapi connection and switch user session along the way.
For example:

> with Maapi() as m:
> : for user, context, device in devlist:
>   : with Session(m, user, context):
>     : with m.start_write_trans() as t:
>       : # …
>         # do something using the correct user session
>         # …
>         t.apply()

#### \_\_enter_\_()

Python magic method.

#### \_\_exit_\_(exc_type, exc_value, tb)

Python magic method.

#### \_\_init_\_(maapi, user, context, groups=[], src_ip='127.0.0.1', src_port=0, proto=1, vendor=None, product=None, version=None, client_id=None, path=None)

Initialize a Session object via start_user_session().

Arguments:

* maapi – maapi object (maapi.Maapi)
* for all other arguments see start_user_session()

#### \_\_weakref_\_

list of weak references to the object

#### close()

Close the user session.

### *class* ncs.maapi.StringIO(initial_value='', newline='\\n')

Text I/O implementation using an in-memory buffer.

The initial_value argument sets the value of object.  The newline
argument is like the one of TextIOWrapper’s constructor.

#### \_\_getstate_\_()

Helper for pickle.

#### \_\_init_\_(\*args, \*\*kwargs)

#### *classmethod* \_\_new_\_(\*args, \*\*kwargs)

#### \_\_next_\_()

Implement next(self).

#### close()

Close the IO object.

Attempting any further operation after the object is closed
will raise a ValueError.

This method has no effect if the file is already closed.

#### getvalue()

Retrieve the entire contents of the object.

#### newlines

#### read(size=-1,)

Read at most size characters, returned as a string.

If the argument is negative or omitted, read until EOF
is reached. Return an empty string at EOF.

#### readable()

Returns True if the IO object can be read.

#### readline(size=-1,)

Read until newline or EOF.

Returns an empty string if EOF is hit immediately.

#### seek(pos, whence=0,)

Change stream position.

Seek to character offset pos relative to position indicated by whence:
: 0  Start of stream (the default).  pos should be >= 0;
  1  Current position - pos must be 0;
  2  End of stream - pos must be 0.

Returns the new absolute position.

#### seekable()

Returns True if the IO object can be seeked.

#### tell()

Tell the current file position.

#### truncate(pos=None,)

Truncate size to pos.

The pos argument defaults to the current file position, as
returned by tell().  The current file position is unchanged.
Returns the new absolute position.

#### writable()

Returns True if the IO object can be written.

#### write(s,)

Write string to file.

Returns the number of characters written, which is always equal to
the length of the string.

### *class* ncs.maapi.Transaction(maapi, th=None, rw=None, db=2, vendor=None, product=None, version=None, client_id=None)

Class that corresponds to a single MAAPI transaction.

#### \_\_dir_\_()

Return a list of all available methods in Transaction.

#### \_\_enter_\_()

Python magic method.

#### \_\_exit_\_(exc_type, exc_value, tb)

Python magic method.

#### \_\_getattr_\_(name)

Python magic method.

This method will be called whenever an attribute not present here
is accessed. It will try to find a corresponding attribute in the Maapi
object which takes a transaction handle as the second argument and
forward the call there.

Example (pseudo code):

> import ncs     # high-level module
> import \_ncs    # low-level module

> maapi = ncs.maapi.Maapi()
> trans = maapi.start_read_trans()

> Now, these three calls are equal:
> : 1. trans.get_elem(‘/path/to/leaf’)
>   2. maapi.get_elem(trans.th, ‘/path/to/leaf’)
>   3. \_ncs.maapi.get_elem(maapi.msock, trans.th, ‘/path/to/leaf’)

#### \_\_init_\_(maapi, th=None, rw=None, db=2, vendor=None, product=None, version=None, client_id=None)

Initialize a Transaction object.

When created one may access the maapi and th arguments like this:

> trans = Transaction(mymaapi, th=myth)
> trans.maapi # the Maapi object
> trans.th # the transaction handle

An instance of this class is also a context manager:

> with Transaction(mymaapi, th=myth) as trans:
> : # do something here…

When exiting the with statement, finish() will be called.

If ‘th’ is left out (or None) a new transaction is started using
the ‘db’ and ‘rw’ arguments, otherwise ‘db’ and ‘rw’ are ignored.

Arguments:

* maapi – a Maapi object (maapi.Maapi)
* th – a transaction handle or None
* rw – Either READ or READ_WRITE flag (ncs)
* db – Either CANDIDATE, RUNNING or STARTUP flag (cdb)
* vendor – lock error information (optional)
* product – lock error information (optional)
* version – lock error information (optional)
* client_id – lock error information (optional)

#### \_\_repr_\_()

Get internal representation.

#### \_\_weakref_\_

list of weak references to the object

#### abort()

Abort the transaction.

#### apply(keep_open=True, flags=0)

Apply the transaction.

Validates, prepares and eventually commits or aborts the
transaction. If the validation fails and the ‘keep_open’
argument is set to True (default), the transaction is left
open and the developer can react upon the validation errors.

Arguments:

* keep_open – keep transaction open (boolean)
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

#### apply_params(keep_open=True, params=None)

Apply the transaction and return the result in form of dict().

Validates, prepares and eventually commits or aborts the
transaction. If the validation fails and the ‘keep_open’
argument is set to True (default), the transaction is left
open and the developer can react upon the validation errors.

The ‘params’ argument represent commit parameters. See CommitParams
class for available commit parameters.

The result is a dictionary representing the result of applying
transaction. If dry-run was requested, then the resulting dictionary
will have ‘dry-run’ key set along with the actual results. If commit
through commit queue was requested, then the resulting dictionary
will have ‘commit-queue’ key set. Otherwise the dictionary will
be empty.

Arguments:

* keep_open – keep transaction open (boolean)
* params – list of commit parameters (maapi.CommitParams)

Returns:

* dict (see above)

Example use:

> with ncs.maapi.single_write_trans(‘admin’, ‘python’) as t:
> : root = ncs.maagic.get_root(t)
>   dns_list = root.devices.device[‘ex1’].config.sys.dns.server
>   dns_list.create(‘192.0.2.1’)
>   params = t.get_params()
>   params.dry_run_native()
>   result = t.apply_params(True, params)
>   print(result[‘device’][‘ex1’])
>   t.apply_params(True, t.get_params())

#### commit()

Commit the transaction.

#### end_progress_span(\*args)

Don’t call this function.

Call instance.end() on the progress.Span instance created from
start_progress_span() instead.

#### finish()

Finish the transaction.

This will finish the transaction. If the transaction is implemented
by an external database, this will invoke the finish() callback.

#### get_params()

Get the current commit parameters for the transaction.

The result is an instance of the CommitParams class.

#### hide_group(group_name)

Do hide a hide group.

Hide all nodes belonging to a hide group in a transaction that started
with flag FLAG_HIDE_ALL_HIDEGROUPS.

#### prepare(flags=0)

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

#### progress_info(msg, verbosity=0, attrs=None, links=None, path=None)

While spans represents a pair of data points: start and stop; info
events are instead singular events, one point in time. Call
progress_info() to write a progress span info event to the progress
trace. The info event will have the same span-id as the start and stop
events of the currently ongoing progress span in the active user session
or transaction. See help for start_progress_span() for more information.

Arguments:

* msg - message to report (str)
* verbosity - ncs.VERBOSITY_\*, VERBOSITY_NORMAL is default (optional)
* attrs - user defined attributes (optional)
* links - list of ncs.progress.Span or dict (optional)
* path - keypath to an action/leaf/service/etc (str, optional)

#### start_progress_span(msg, verbosity=0, attrs=None, links=None, path=None)

Starts a progress span. Progress spans are trace messages written to
the progress trace and the developer log. A progress span consists of a
start and a stop event which can be used to calculate the duration
between the two. Those events can be identified with unique span-id.
Inside the span it is possible to start new spans, which will then
become child spans, the parent-span-id is set to the previous spans’
span-id. A child span can be used to calculate the duration of a sub
task, and is started from consecutive maapi_start_progress_span() calls,
and is ended with maapi_end_progress_span().

The function returns a Span object which either stops the span by
invoking span.end() or by exiting a ‘with’ context. Messages are
written to the progress trace which can be directed to a file, oper
data or as notifications.

Call help(ncs.progress) or help(confd.progress) for examples.

Arguments:

* msg - message to report (str)
* verbosity - ncs.VERBOSITY_\*, VERBOSITY_NORMAL is default (optional)
* attrs - user defined attributes (optional)
* links - list of ncs.progress.Span or dict (optional)
* path - keypath to an action/leaf/service/etc (str, optional)

Returns:

* trace span (ncs.progress.Span)

#### unhide_group(group_name)

Do unhide a hide group.

Unhide all nodes belonging to a hide group in a transaction that started
with flag FLAG_HIDE_ALL_HIDEGROUPS.

#### validate(unlock, forcevalidation=False)

Validate the transaction.

This function validates all data written in the transaction. This
includes all data model constraints and all defined semantic
validation, i.e. user programs that have registered functions under
validation points.

If ‘unlock’ is True, the transaction is open for further editing even
if validation succeeds. If ‘unlock’ is False and the function succeeds
next function to be called MUST be prepare() or finish().

‘unlock = True’ can be used to implement a ‘validate’ command which
can be given in the middle of an editing session. The first thing that
happens is that a lock is set. If ‘unlock’ == False, the lock is
released on success. The lock is always released on failure.

The ‘forcevalidation’ argument should normally be False. It has no
effect for a transaction towards the running or startup data stores,
validation is always performed. For a transaction towards the
candidate data store, validation will not be done unless
‘forcevalidation’ is True. Avoiding this validation is preferable if
we are going to commit the candidate to running, since otherwise the
validation will be done twice. However if we are implementing a
‘validate’ command, we should give a True value for ‘forcevalidation’.

Arguments:

* unlock (boolean)
* forcevalidation (boolean)

### ncs.maapi.connect(ip='127.0.0.1', port=4569, path=None)

Convenience function for connecting to ConfD/NCS.

The ‘ip’ and ‘port’ arguments are ignored if path is specified.

Arguments:

* ip – ConfD/NCS instance ip address (str)
* port – ConfD/NCS instance port (int)
* path – ConfD/NCS instance location path (str)

Returns:

* socket (Python socket)

### ncs.maapi.retry_on_conflict(retries=10, log=None)

Function/method decorator to retry a transaction in case of conflicts.

When executing multiple concurrent transactions against the NCS RUNNING
datastore, read-write conflicts are resolved by rejecting transactions
having potentially stale data with ERR_TRANSACTION_CONFLICT.

This decorator restarts a function, should it run into a conflict, giving
it multiple attempts to apply. The decorated function must start its own
transaction because a conflicting transaction must be thrown away entirely
and a new one started.

Example usage:

> @retry_on_conflict()
> def do_work():

> > with ncs.maapi.single_write_trans(‘admin’, ‘python’) as t:
> > : root = ncs.maagic.get_root(t)
> >   root.some_value = str(root.some_other_value)
> >   t.apply()

Arguments:

* retries – number of times to retry (int)
* log – optional log object for logging conflict details

### ncs.maapi.single_read_trans(user, context, groups=[], db=2, ip='127.0.0.1', port=4569, path=None, src_ip='127.0.0.1', src_port=0, proto=1, vendor=None, product=None, version=None, client_id=None, load_schemas=True, flags=0)

Context manager for a single READ transaction.

This function connects to ConfD/NCS, starts a user session and finally
starts a new READ transaction.

Function signature:

> def single_read_trans(user, context, groups=[],
> : db=RUNNING, ip=<CONFD-OR-NCS-ADDR>,
>   port=<CONFD-OR-NCS-PORT>, path=None,
>   src_ip=<CONFD-OR-NCS-ADDR>, src_port=0,
>   proto=PROTO_TCP,
>   vendor=None, product=None, version=None,
>   client_id=_mk_client_id(),
>   load_schemas=LOAD_SCHEMAS_LOAD, flags=0):

For argument db, flags see Maapi.start_trans(). For arguments user,
context, groups, src_ip, src_port, proto, vendor, product, version and
client_id see Maapi.start_user_session().
For arguments ip, port and path see connect().
For argument load_schemas see \_\_init_\_().

Arguments:

* user - username (str)
* context - context for the session (str)
* groups - groups (list)
* db – database (int)
* ip – ConfD/NCS instance ip address (str)
* port – ConfD/NCS instance port (int)
* path – ConfD/NCS instance location path (str)
* src_ip - source ip address (str)
* src_port - source port (int)
* proto - protocol used by for connecting (i.e. ncs.PROTO_TCP)
* vendor – lock error information (str, optional)
* product – lock error information (str, optional)
* version – lock error information (str, optional)
* client_id – lock error information (str, optional)
* load_schemas - passed on to Maapi._\_init_\_()
* flags – additional transaction flags (int)

Returns:

* read transaction object (maapi.Transaction)

### ncs.maapi.single_write_trans(user, context, groups=[], db=2, ip='127.0.0.1', port=4569, path=None, src_ip='127.0.0.1', src_port=0, proto=1, vendor=None, product=None, version=None, client_id=None, load_schemas=True, flags=0)

Context manager for a single READ/WRITE transaction.

This function connects to ConfD/NCS, starts a user session and finally
starts a new READ/WRITE transaction.

Function signature:

> def single_write_trans(user, context, groups=[],
> : db=RUNNING, ip=<CONFD-OR-NCS-ADDR>,
>   port=<CONFD-OR-NCS-PORT>, path=None,
>   src_ip=<CONFD-OR-NCS-ADDR>, src_port=0,
>   proto=PROTO_TCP,
>   vendor=None, product=None, version=None,
>   client_id=_mk_client_id(),
>   load_schemas=LOAD_SCHEMAS_LOAD, flags=0):

For argument db, flags see Maapi.start_trans(). For arguments user,
context, groups, src_ip, src_port, proto, vendor, product, version and
client_id see Maapi.start_user_session().
For arguments ip, port and path see connect().
For argument load_schemas see \_\_init_\_().

Arguments:

* user - username (str)
* context - context for the session (str)
* groups - groups (list)
* db – database (int)
* ip – ConfD/NCS instance ip address (str)
* port – ConfD/NCS instance port (int)
* path – ConfD/NCS instance location path (str)
* src_ip - source ip address (str)
* src_port - source port (int)
* proto - protocol used by the client for connecting (int)
* vendor – lock error information (str, optional)
* product – lock error information (str, optional)
* version – lock error information (str, optional)
* client_id – lock error information (str, optional)
* load_schemas - passed on to Maapi._\_init_\_()
* flags – additional transaction flags (int)

Returns:

* write transaction object (maapi.Transaction)

<a id="module-ncs.alarm"></a>

NCS Alarm Manager module.

### *class* ncs.alarm.Alarm(managed_device, managed_object, alarm_type, specific_problem, severity, alarm_text, impacted_objects=None, related_alarms=None, root_cause_objects=None, time_stamp=None, custom_attributes=None)

Class representing an alarm.

#### \_\_init_\_(managed_device, managed_object, alarm_type, specific_problem, severity, alarm_text, impacted_objects=None, related_alarms=None, root_cause_objects=None, time_stamp=None, custom_attributes=None)

Create an Alarm object.

Arguments:
managed_device

> The managed device this alarm is associated with. Plain string
> which identifies the device.

managed_object
: The managed object this alarm is associated with. Also referred
  to as the “Alarming Object”. This object may not be referred to
  in the root_cause_objects parameter. If an NCS Service
  generates an alarm based on an error state in a device used by
  that service, managed_object should be the service Id and the
  device should be included in the root_cause_objects list. This
  parameter must be a ncs.Value object. Use one of the methods
  managed_object_string(), managed_object_oid() or
  managed_object_instance() to create the value.

alarm_type
: Type of alarm. This is a YANG identity. Alarm types are defined
  by the YANG developer and should be designed to be as specific
  as possible.

specific_problem
: If the alarm_type isn’t enough to describe the alarm, this
  field can be used in combination. Keep in mind that when
  dynamically adding a specific problem, there is no way for the
  operator to know in advance which alarms can be raised.

severity
: State of the alarm; cleared, indeterminate, critical, major,
  minor, warning (enum).

alarm_text
: A human readable description of this problem.

impacted_objects
: A list of Managed Objects that may no longer function due to
  this alarm. Typically these point to NCS Services that are
  dependent on the objects on the device that reported the
  problem. In NCS 2.3 and later there is a backpointer attribute
  available on objects in the device tree that has been created by
  a Service. These backpointers are instance reference pointers
  that should be set in this list. Use one of the methods
  managed_object_string(), managed_object_oid() or
  managed_object_instance() to create the instances to populate
  this list.

related_alarms
: References to other alarms that have been generated as a
  consequence of this alarm, or that has some other relationship
  to this alarm. Should be a list of AlarmId instances.

root_cause_objects
: A list of Managed Objects that are likely to be the root cause
  of this alarm. This is different from the “Alarming Object”. See
  managed_object above for details. Use one of the methods
  managed_object_string(), managed_object_oid() or
  managed_object_instance() to create the instances to populate
  this list.

time_stamp
: A date-and-time when this alarm was generated.

custom_attributes
: A list of custom leafs augmented into the alarm list.

#### add_attribute(prefix, tag, value)

Add or update custom attribute

#### add_status_attribute(prefix, tag, value)

Add or update custom status change attribute

#### alarm_id()

Get the unique Id of this alarm as an AlarmId instance.

#### get_key()

Get alarm list key.

#### *property* key

Get alarm list key.

### *class* ncs.alarm.AlarmId(alarm_type, managed_device, managed_object, specific_problem=None)

Represents the unique Id of an Alarm.

#### \_\_init_\_(alarm_type, managed_device, managed_object, specific_problem=None)

Create an AlarmId.

### *class* ncs.alarm.CustomAttribute(prefix, tag, value)

Class representing a custom attribute set on an alarm.

#### \_\_init_\_(prefix, tag, value)

### *class* ncs.alarm.CustomStatusAttribute(prefix, tag, value)

Class representing a custom attribute set on an alarm.

#### \_\_init_\_(prefix, tag, value)

### ncs.alarm.clear_alarm(alarm)

Clear an alarm.

Arguments:
: alarm – An instance of Alarm.

### ncs.alarm.managed_object_instance(instanceval)

Create a managed object of type instance-identifier.

Arguments:
: instanceval – The instance-identifier (string or HKeypathRef)

### ncs.alarm.managed_object_oid(oidval)

Create a managed object of type yang:object-identifier.

Arguments:
: oidval – The OID (string)

### ncs.alarm.managed_object_string(strval)

Create a managed object of type string.

Arguments:
: strval — The string value

### ncs.alarm.raise_alarm(alarm)

Raise an alarm.

Arguments:
: alarm – An instance of Alarm.
