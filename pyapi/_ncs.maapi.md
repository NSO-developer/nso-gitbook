# Python _ncs.maapi Module

Low level module for connecting to NCS with a read/write interface
inside transactions.

This module is used to connect to the NCS transaction manager.
The API described here has several purposes. We can use MAAPI when we wish
to implement our own proprietary management agent.
We also use MAAPI to attach to already existing NCS transactions, for
example when we wish to implement semantic validation of configuration
data in Python, and also when we wish to implement CLI wizards in Python.

This documentation should be read together with the [confd_lib_maapi(3)](../man/confd_lib_maapi.3.md) man page.

## Functions

### aaa_reload

```python
aaa_reload(sock, synchronous) -> None
```

Start a reload of aaa from external data provider.

Used by external data provider to notify that there is a change to the AAA
data. Calling the function with the argument 'synchronous' set to 1 or True
means that the call will block until the loading is completed.

Keyword arguments:

* sock -- a python socket instance
* synchronous -- if 1, will wait for the loading complete and return when
    the loading is complete; if 0, will only initiate the loading of AAA
    data and return immediately

### aaa_reload_path

```python
aaa_reload_path(sock, synchronous, path) -> None
```

Start a reload of aaa from external data provider.

A variant of _maapi_aaa_reload() that causes only the AAA subtree given by
path to be loaded.

Keyword arguments:

* sock -- a python socket instance
* synchronous -- if 1, will wait for the loading complete and return when
    the loading is complete; if 0, will only initiate the loading of AAA
    data and return immediately
* path -- the subtree to be loaded

### abort_trans

```python
abort_trans(sock, thandle) -> None
```

Final phase of a two phase transaction, aborting the trans.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle

### abort_upgrade

```python
abort_upgrade(sock) -> None
```

Can be called before committing upgrade in order to abort it.

Final step in an upgrade.

Keyword arguments:

* sock -- a python socket instance

### apply_template

```python
apply_template(sock, thandle, template, variables, flags, rootpath) -> None
```

Apply a template that has been loaded into NCS. The template parameter gives
the name of the template. This is NOT a FASTMAP function, for that use
shared_ncs_apply_template instead.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* template -- template name
* variables -- None or a list of variables in the form of tuples
* flags -- should be 0
* rootpath -- in what context to apply the template

### apply_trans

```python
apply_trans(sock, thandle, keepopen) -> None
```

Apply a transaction.

Validates, prepares and eventually commits or aborts the transaction. If
the validation fails and the 'keep_open' argument is set to 1 or True, the
transaction is left open and the developer can react upon the validation
errors.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* keepopen -- if true, transaction is not discarded if validation fails

### apply_trans_flags

```python
apply_trans_flags(sock, thandle, keepopen, flags) -> None
```

A variant of apply_trans() that takes an additional 'flags' argument.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* keepopen -- if true, transaction is not discarded if validation fails
* flags -- flags to set in the transaction

### apply_trans_params

```python
apply_trans_params(sock, thandle, keepopen, params) -> list
```

A variant of apply_trans() that takes commit parameters in form of a list ofTagValue objects and returns a list of TagValue objects depending on theparameters passed in.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* keepopen -- if true, transaction is not discarded if validation fails
* params -- list of TagValue objects

### attach

```python
attach(sock, hashed_ns, ctx) -> None
```

Attach to a existing transaction.

Keyword arguments:

* sock -- a python socket instance
* hashed_ns -- the namespace to use
* ctx -- transaction context

### attach2

```python
attach2(sock, hashed_ns, usid, thandle) -> None
```

Used when there is no transaction context beforehand, to attach to a
existing transaction.

Keyword arguments:

* sock -- a python socket instance
* hashed_ns -- the namespace to use
* usid -- user session id, can be set to 0 to use the owner of the transaction
* thandle -- transaction handle

### attach_init

```python
attach_init(sock) -> int
```

Attach the _MAAPI socket to the special transaction available during phase0.
Returns the thandle as an integer.

Keyword arguments:

* sock -- a python socket instance

### authenticate

```python
authenticate(sock, user, password, n) -> tuple
```

Authenticate a user session. Use the 'n' to get a list of n-1 groups that
the user is a member of. Use n=1 if the function is used in a context
where the group names are not needed. Returns 1 if accepted without groups.
If the authentication failed or was accepted a tuple with first element
status code, 0 for rejection and 1 for accepted is returned. The second
element either contains the reason for the rejection as a string OR a list
groupnames.

Keyword arguments:

* sock -- a python socket instance
* user -- username
* pass -- password
* n -- number of groups to return

### authenticate2

```python
authenticate2(sock, user, password, src_addr, src_port, context, prot, n) -> tuple
```

This function does the same thing as maapi.authenticate(), but allows for
passing of the additional parameters src_addr, src_port, context, and prot,
which otherwise are passed only to maapi_start_user_session()/
maapi_start_user_session2(). The parameters are passed on to an external
authentication executable.
Keyword arguments:

* sock -- a python socket instance
* user -- username
* pass -- password
* src_addr -- ip address
* src_port -- port number
* context -- context for the session
* prot -- the protocol used by the client for connecting
* n -- number of groups to return

### candidate_abort_commit

```python
candidate_abort_commit(sock) -> None
```

Cancel an ongoing confirmed commit.

Keyword arguments:

* sock -- a python socket instance

### candidate_abort_commit_persistent

```python
candidate_abort_commit_persistent(sock, persist_id) -> None
```

Cancel an ongoing confirmed commit with the cookie given by persist_id.

Keyword arguments:

* sock -- a python socket instance
* persist_id -- gives the cookie for an already ongoing persistent                 confirmed commit

### candidate_commit

```python
candidate_commit(sock) -> None
```

This function copies the candidate to running.

Keyword arguments:

* sock -- a python socket instance

### candidate_commit_info

```python
candidate_commit_info(sock, persist_id, label, comment) -> None
```

Commit the candidate to running, or confirm an ongoing confirmed commit,
and set the Label and/or Comment that is stored in the rollback file when
the candidate is committed to running.

Note:
>    To ensure the Label and/or Comment are stored in the rollback file in
>    all cases when doing a confirmed commit, they must be given with both,
>    the confirmed commit (using maapi_candidate_confirmed_commit_info())
>    and the confirming commit (using this function).

Keyword arguments:

* sock -- a python socket instance
* persist_id -- gives the cookie for an already ongoing persistent                 confirmed commit
* label -- the Label
* comment -- the Comment

### candidate_commit_persistent

```python
candidate_commit_persistent(sock, persist_id) -> None
```

Confirm an ongoing persistent commit with the cookie given by persist_id.

Keyword arguments:

* sock -- a python socket instance
* persist_id -- gives the cookie for an already ongoing persistent                 confirmed commit

### candidate_confirmed_commit

```python
candidate_confirmed_commit(sock, timeoutsecs) -> None
```

This function also copies the candidate into running. However if a call to
maapi_candidate_commit() is not done within timeoutsecs an automatic
rollback will occur.

Keyword arguments:

* sock -- a python socket instance
* timeoutsecs -- timeout in seconds

### candidate_confirmed_commit_info

```python
candidate_confirmed_commit_info(sock, timeoutsecs, persist, persist_id, label, comment) -> None
```

Like candidate_confirmed_commit_persistent, but also allows for setting the
Label and/or Comment that is stored in the rollback file when the candidate
is committed to running.

Note:
>    To ensure the Label and/or Comment are stored in the rollback file in
>    all cases when doing a confirmed commit, they must be given with both,
>    the confirmed commit (using this function) and the confirming commit
>    (using candidate_commit_info()).

Keyword arguments:

* sock -- a python socket instance
* timeoutsecs -- timeout in seconds
* persist -- sets the cookie for the persistent confirmed commit
* persist_id -- gives the cookie for an already ongoing persistent                 confirmed commit
* label -- the Label
* comment -- the Comment

### candidate_confirmed_commit_persistent

```python
candidate_confirmed_commit_persistent(sock, timeoutsecs, persist, persist_id) -> None
```

Start or extend a confirmed commit using persist id.

Keyword arguments:

* sock -- a python socket instance
* timeoutsecs -- timeout in seconds
* persist -- sets the cookie for the persistent confirmed commit
* persist_id -- gives the cookie for an already ongoing persistent                 confirmed commit

### candidate_reset

```python
candidate_reset(sock) -> None
```

Copy running into candidate.

Keyword arguments:

* sock -- a python socket instance

### candidate_validate

```python
candidate_validate(sock) -> None
```

This function validates the candidate.

Keyword arguments:

* sock -- a python socket instance

### cd

```python
cd(sock, thandle, path) -> None
```

Change current position in the tree.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* path -- position to change to

### clear_opcache

```python
clear_opcache(sock, path) -> None
```

Clearing of operational data cache.

Keyword arguments:

* sock -- a python socket instance
* path -- the path to the subtree to clear

### cli_accounting

```python
cli_accounting(sock, user, usid, cmdstr) -> None
```

Generates an audit log entry in the CLI audit log.

Keyword arguments:

* sock -- a python socket instance
* user -- user to generate the entry for
* thandle -- transaction handle

### cli_cmd

```python
cli_cmd(sock, usess, buf) -> None
```

Execute CLI command in the ongoing CLI session.

Keyword arguments:

* sock -- a python socket instance
* usess -- user session
* buf -- string to write

### cli_cmd2

```python
cli_cmd2(sock, usess, buf, flags) -> None
```

Execute CLI command in a ongoing CLI session. With flags:
CMD_NO_FULLPATH - Do not perform the fullpath check on show commands.
CMD_NO_HIDDEN - Allows execution of hidden CLI commands.

Keyword arguments:

* sock -- a python socket instance
* usess -- user session
* buf -- string to write
* flags -- as above

### cli_cmd3

```python
cli_cmd3(sock, usess, buf, flags, unhide) -> None
```

Execute CLI command in a ongoing CLI session.

Keyword arguments:

* sock -- a python socket instance
* usess -- user session
* buf -- string to write
* flags -- as above
* unhide -- The unhide parameter is used for passing a hide group which is
    unhidden during the execution of the command.

### cli_cmd4

```python
cli_cmd4(sock, usess, buf, flags, unhide) -> None
```

Execute CLI command in a ongoing CLI session.

Keyword arguments:

* sock -- a python socket instance
* usess -- user session
* buf -- string to write
* flags -- as above
* unhide -- The unhide parameter is used for passing a hide group which is
    unhidden during the execution of the command.

### cli_cmd_to_path

```python
cli_cmd_to_path(sock, line, nsize, psize) -> tuple
```

Returns string of the C/I namespaced CLI path that can be associated with
the given command. Returns a tuple ns and path. 

Keyword arguments:

* sock -- a python socket instance
* line -- data model path as string
* nsize -- limit length of namespace
* psize -- limit length of path

### cli_cmd_to_path2

```python
cli_cmd_to_path2(sock, thandle, line, nsize, psize) -> tuple
```

Returns string of the C/I namespaced CLI path that can be associated with
the given command. In the context of the provided transaction handle.
Returns a tuple ns and path.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* line -- data model path as string
* nsize -- limit length of namespace
* psize -- limit length of path

### cli_diff_cmd

```python
cli_diff_cmd(sock, thandle, thandle_old, flags, path, size) -> str
```

Get the diff between two sessions as a series C/I cli commands. Returns a
string. If no changes exist between the two sessions for the given path a
_ncs.error.Error will be thrown with the error set to ERR_BADPATH

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* thandle_old -- transaction handle
* flags -- as for cli_path_cmd
* path -- as for cli_path_cmd
* size -- limit diff

### cli_get

```python
cli_get(sock, usess, opt, size) -> str
```

Read CLI session parameter or attribute.

Keyword arguments:

* sock -- a python socket instance
* usess -- user session
* opt -- option to get
* size -- maximum response size (optional, default 1024)

### cli_path_cmd

```python
cli_path_cmd(sock, thandle, flags, path, size) -> str
```

Returns string of the C/I CLI command that can be associated with the given
path. The flags can be given as FLAG_EMIT_PARENTS to enable the commands to
reach the submode for the path to be emitted. The flags can be given as
FLAG_DELETE to emit the command to delete the given path. The flags can be
given as FLAG_NON_RECURSIVE to prevent that  all children to a container or
list item are displayed.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* flags -- as above
* path -- the path for the cmd
* size -- limit cmd

### cli_prompt

```python
cli_prompt(sock, usess, prompt, echo, size) -> str
```

Prompt user for a string.

Keyword arguments:

* sock -- a python socket instance
* usess -- user session
* prompt -- string to show the user
* echo -- determines wether to control if the input should be echoed or not.
    ECHO shows the input, NOECHO does not
* size -- maximum response size (optional, default 1024)

### cli_set

```python
cli_set(sock, usess, opt, value) -> None
```

Set CLI session parameter.

Keyword arguments:

* sock -- a python socket instance
* usess -- user session
* opt -- option to set
* value -- the new value of the session parameter

### cli_write

```python
cli_write(sock, usess, buf) -> None
```

Write to the cli.

Keyword arguments:

* sock -- a python socket instance
* usess -- user session
* buf -- string to write

### close

```python
close(sock) -> None
```

Ends session and closes socket.

Keyword arguments:

* sock -- a python socket instance

### commit_trans

```python
commit_trans(sock, thandle) -> None
```

Final phase of a two phase transaction, committing the trans.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle

### commit_upgrade

```python
commit_upgrade(sock) -> None
```

Final step in an upgrade.

Keyword arguments:

* sock -- a python socket instance

### confirmed_commit_in_progress

```python
confirmed_commit_in_progress(sock) -> int
```

Checks whether a confirmed commit is ongoing. Returns a positive integer
being the usid of confirmed commit operation in progress or 0 if no
confirmed commit is in progress.

Keyword arguments:

* sock -- a python socket instance

### connect

```python
connect(sock, ip, port, path) -> None
```

Connect to the system daemon.

Keyword arguments:

* sock -- a python socket instance
* ip -- the ip address
* port -- the port
* path -- the path if socket is AF_UNIX (optional)

### copy

```python
copy(sock, from_thandle, to_thandle) -> None
```

Copy all data from one data store to another.

Keyword arguments:

* sock -- a python socket instance
* from_thandle -- transaction handle
* to_thandle -- transaction handle

### copy_path

```python
copy_path(sock, from_thandle, to_thandle, path) -> None
```

Copy subtree rooted at path from one data store to another.

Keyword arguments:

* sock -- a python socket instance
* from_thandle -- transaction handle
* to_thandle -- transaction handle
* path -- the subtree rooted at path is copied

### copy_running_to_startup

```python
copy_running_to_startup(sock) -> None
```

Copies running to startup.

Keyword arguments:

* sock -- a python socket instance

### copy_tree

```python
copy_tree(sock, thandle, frompath, topath) -> None
```

Copy subtree rooted at frompath to topath.

Keyword arguments:

* sock -- a python socket instance
* frompath -- the subtree rooted at path is copied
* topath -- to which path the subtree is copied

### create

```python
create(sock, thandle, path) -> None
```

Create a new list entry, a presence container or a leaf of type empty
(unless in a union, if type empty is in a union
use set_elem instead) in the data tree.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* path -- path of item to create

### cs_node_cd

```python
cs_node_cd(socket, thandle, path) -> Union[_ncs.CsNode, None]
```

Utility function which finds the resulting CsNode given a string keypath.

Does the same thing as _ncs.cs_node_cd(), but can handle paths that are 
ambiguous due to traversing a mount point, by sending a request to the
daemon

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* path -- the keypath

### cs_node_children

```python
cs_node_children(sock, thandle, mount_point, path) -> List[_ncs.CsNode]
```

Retrieve a list of the children nodes of the node given by mount_point
that are valid for path. The mount_point node must be a mount point
(i.e. mount_point.is_mount_point() == True), and the path must lead to
a specific instance of this node (including the final keys if mount_point
is a list node). The thandle parameter is optional, i.e. it can be given
as -1 if a transaction is not available.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* mount_point -- a CsNode instance
* path -- the path to the instance of the node

### delete

```python
delete(sock, thandle, path) -> None
```

Delete an existing list entry, a presence container or a leaf of type empty
from the data tree.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* path -- path of item to delete

### delete_all

```python
delete_all(sock, thandle, how) -> None
```

Delete all data within a transaction.

The how argument specifies how to delete:
    DEL_SAFE - Delete everything except namespaces that were exported with
               tailf:export none. Top-level nodes that cannot be deleted
               due to AAA rules are left in place (descendant nodes may be
               deleted if the rules allow it).
   DEL_EXPORTED - As DEL_SAFE, but AAA rules are ignored.
   DEL_ALL - Delete everything, AAA rules are ignored.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* how -- DEL_SAFE, DEL_EXPORTED or DEL_ALL

### delete_config

```python
delete_config(sock, name) -> None
```

Empties a datastore.

Keyword arguments:

* sock -- a python socket instance
* name -- name of the datastore to empty

### destroy_cursor

```python
destroy_cursor(mc) -> None
```

Deallocates memory which is associated with the cursor.

Keyword arguments:

* mc -- maapiCursor

### detach

```python
detach(sock, ctx) -> None
```

Detaches an attached _MAAPI socket.

Keyword arguments:

* sock -- a python socket instance
* ctx -- transaction context

### detach2

```python
detach2(sock, thandle) -> None
```

Detaches an attached _MAAPI socket when we do not have a transaction context
available.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle

### diff_iterate

```python
diff_iterate(sock, thandle, iter, flags) -> None
```

Iterate through a transaction diff.

For each diff in the transaction the callback function 'iter' will be
called. The iter function needs to have the following signature:

    def iter(keypath, operation, oldvalue, newvalue)

Where arguments are:

* keypath - the affected path (HKeypathRef)
* operation - one of MOP_CREATED, MOP_DELETED, MOP_MODIFIED, MOP_VALUE_SET,
              MOP_MOVED_AFTER, or MOP_ATTR_SET
* oldvalue - always None
* newvalue - see below

The 'newvalue' argument may be set for operation MOP_VALUE_SET and is a
Value object in that case. For MOP_MOVED_AFTER it may be set to a list of
key values identifying an entry in the list - if it's None the list entry
has been moved to the beginning of the list. For MOP_ATTR_SET it will be
set to a 2-tuple of Value's where the first Value is the attribute set
and the second Value is the value the attribute was set to. If the
attribute has been deleted the second value is of type C_NOEXISTS

The iter function should return one of:

* ITER_STOP - Stop further iteration
* ITER_RECURSE - Recurse further down the node children
* ITER_CONTINUE - Ignore node children and continue with the node's siblings

One could also define a class implementing the call function as:

    class DiffIterator(object):
        def __init__(self):
            self.count = 0

        def __call__(self, kp, op, oldv, newv):
            print('kp={0}, op={1}, oldv={2}, newv={3}'.format(
                str(kp), str(op), str(oldv), str(newv)))
            self.count += 1
            return _confd.ITER_RECURSE

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* iter -- iterator function, will be called for every diff in the transaction
* flags -- bitmask of ITER_WANT_ATTR and ITER_WANT_P_CONTAINER

### disconnect_remote

```python
disconnect_remote(sock, address) -> None
```

Disconnect all remote connections to 'address' except HA connections.

Keyword arguments:

* sock -- a python socket instance
* address -- ip address (string)

### disconnect_sockets

```python
disconnect_sockets(sock, sockets) -> None
```

Disconnect 'sockets' which is a list of sockets (fileno).

Keyword arguments:

* sock -- a python socket instance
* sockets -- list of sockets (int)

### do_display

```python
do_display(sock, thandle, path) -> int
```

If the data model uses the YANG when or tailf:display-when statement, this
function can be used to determine if the item given by 'path' should
be displayed or not.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* path -- path to the 'display-when' statement

### end_progress_span

```python
end_progress_span(sock, span, annotation) -> int
```

Ends a progress span started from start_progress_span() or
start_progress_span_th().

Keyword arguments:
* sock -- a python socket instance
* span -- span_id (string) or dict with key 'span_id'
* annotation -- metadata about the event, indicating error, explains latency
    or shows result etc

### end_user_session

```python
end_user_session(sock) -> None
```

End the MAAPI user session associated with the socket

Keyword arguments:

* sock -- a python socket instance

### exists

```python
exists(sock, thandle, path) -> bool
```

Check wether a node in the data tree exists. Returns boolean.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* path -- position to check

### find_next

```python
find_next(mc, type, inkeys) -> Union[List[_ncs.Value], bool]
```

Update the cursor mc with the key(s) for the list entry designated by the
type and inkeys parameters. This function may be used to start a traversal
from an arbitrary entry in a list. Keys for subsequent entries may be
retrieved with the get_next() function. When no more keys are found, False
is returned.

The strategy to use is defined by type:

    FIND_NEXT - The keys for the first list entry after the one
                indicated by the inkeys argument.
    FIND_SAME_OR_NEXT - If the values in the inkeys array completely
                identifies an actual existing list entry, the keys for
                this entry are requested. Otherwise the same logic as
                for FIND_NEXT above.

Keyword arguments:

* mc -- maapiCursor
* type -- CONFD_FIND_NEXT or CONFD_FIND_SAME_OR_NEXT
* inkeys -- where to start finding

### finish_trans

```python
finish_trans(sock, thandle) -> None
```

Finish a transaction.

If the transaction is implemented by an external database, this will invoke
the finish() callback.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle

### get_attrs

```python
get_attrs(sock, thandle, attrs, keypath) -> list
```

Get attributes for a node. Returns a list of attributes.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* attrs -- list of type of attributes to get
* keypath -- path to choice

### get_authorization_info

```python
get_authorization_info(sock, usessid) -> _ncs.AuthorizationInfo
```

This function retrieves authorization info for a user session,i.e. the groups that the user has been assigned to.

Keyword arguments:

* sock -- a python socket instance
* usessid -- user session id

### get_case

```python
get_case(sock, thandle, choice, keypath) -> _ncs.Value
```

Get the case from a YANG choice statement.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* choice -- choice name
* keypath -- path to choice

### get_elem

```python
get_elem(sock, thandle, path) -> _ncs.Value
```

Path must be a valid leaf node in the data tree. Returns a Value object.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* path -- position of elem

### get_my_user_session_id

```python
get_my_user_session_id(sock) -> int
```

Returns user session id

Keyword arguments:

* sock -- a python socket instance

### get_next

```python
get_next(mc) -> Union[List[_ncs.Value], bool]
```

Iterates and gets the keys for the next entry in a list. When no more keys
are found, False is returned.

Keyword arguments:

* mc -- maapiCursor

### get_object

```python
get_object(sock, thandle, n, keypath) -> List[_ncs.Value]
```

Read at most n values from keypath in a list.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* path -- position of list entry

### get_objects

```python
get_objects(mc, n, nobj) -> List[_ncs.Value]
```

Read at most n values from each nobj lists starting at Cursor mc.
Returns a list of Value's.

Keyword arguments:

* mc -- maapiCursor
* n -- at most n values will be read
* nobj -- number of nobj lists which n elements will be taken from

### get_rollback_id

```python
get_rollback_id(sock, thandle) -> int
```

Get rollback id from a committed transaction. Returns int with fixed id,
where -1 indicates an error or no rollback id available.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle

### get_running_db_status

```python
get_running_db_status(sock) -> int
```

If a transaction fails in the commit() phase, the configuration database is
in in a possibly inconsistent state. This function queries ConfD on the
consistency state. Returns 1 if the configuration is consistent and 0
otherwise.

Keyword arguments:

* sock -- a python socket instance

### get_schema_file_path

```python
get_schema_file_path(sock) -> str
```

If shared memory schema support has been enabled, this function will
return the pathname of the file used for the shared memory mapping,
which can then be passed to the mmap_schemas() function>

If creation of the schema file is in progress when the function
is called, the call will block until the creation has completed.

Keyword arguments:

* sock -- a python socket instance

### get_stream_progress

```python
get_stream_progress(sock, id) -> int
```

Used in conjunction with a maapi stream to see how much data has been
consumed.

This function allows us to limit the amount of data 'in flight' between the
application and the system. The sock parameter must be the maapi socket
used for a function call that required a stream socket for writing
(currently the only such function is load_config_stream()), and the id
parameter is the id returned by that function.

Keyword arguments:

* sock -- a python socket instance
* id -- the id returned from load_config_stream()

### get_templates

```python
get_templates(sock) -> list
```

Get the defined templates.

Keyword arguments:

* sock -- a python socket instance

### get_trans_params

```python
get_trans_params(sock, thandle) -> list
```

Get the commit parameters for a transaction. The commit parameters are
returned as a list of TagValue objects.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle

### get_user_session

```python
get_user_session(sock, usessid) -> _ncs.UserInfo
```

Return user info.

Keyword arguments:

* sock -- a python socket instance
* usessid -- session id

### get_user_session_identification

```python
get_user_session_identification(sock, usessid) -> dict
```

Get user session identification data.

Get the user identification data related to a user session provided by the
'usessid' argument. The function returns a dict with the user
identification data.

Keyword arguments:

* sock -- a python socket instance
* usessid -- user session id

### get_user_session_opaque

```python
get_user_session_opaque(sock, usessid) -> str
```

Returns a string containing additional 'opaque' information, if additional
'opaque' information is available.

Keyword arguments:

* sock -- a python socket instance
* usessid -- user session id

### get_user_sessions

```python
get_user_sessions(sock) -> list
```

Return a list of session ids.

Keyword arguments:

* sock -- a python socket instance

### get_values

```python
get_values(sock, thandle, values, keypath) -> list
```

Get values from keypath based on the Tag Value array values.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* values -- list of tagValues

### getcwd

```python
getcwd(sock, thandle) -> str
```

Get the current position in the tree as a string.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle

### getcwd_kpath

```python
getcwd_kpath(sock, thandle) -> _ncs.HKeypathRef
```

Get the current position in the tree as a HKeypathRef.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle

### hide_group

```python
hide_group(sock, thandle, group_name) -> None
```

Hide all nodes belonging to a hide group in a transaction that started 
with flag FLAG_HIDE_ALL_HIDEGROUPS.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* group_name -- the group name

### init_cursor

```python
init_cursor(sock, thandle, path) -> maapi.Cursor
```

Whenever we wish to iterate over the entries in a list in the data tree, we
must first initialize a cursor.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* path -- position of elem
* secondary_index -- name of secondary index to use (optional)
* xpath_expr -- xpath expression used to filter results (optional)

### init_upgrade

```python
init_upgrade(sock, timeoutsecs, flags) -> None
```

First step in an upgrade, initializes the upgrade procedure.

Keyword arguments:

* sock -- a python socket instance
* timeoutsecs -- maximum time to wait for user to voluntarily exit from
    'configuration' mode
* flags -- 0 or 'UPGRADE_KILL_ON_TIMEOUT' (will terminate all ongoing
    transactions

### insert

```python
insert(sock, thandle, path) -> None
```

Insert a new entry in a list, the key of the list must be a integer.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* path -- the subtree rooted at path is copied

### install_crypto_keys

```python
install_crypto_keys(sock) -> None
```

Copy configured AES keys into the memory in the library.

Keyword arguments:

* sock -- a python socket instance

### is_candidate_modified

```python
is_candidate_modified(sock) -> bool
```

Checks if candidate is modified.

Keyword arguments:

* sock -- a python socket instance

### is_lock_set

```python
is_lock_set(sock, name) -> int
```

Check if db name is locked. Return the 'usid' of the user holding the lock
or 0 if not locked.

Keyword arguments:

* sock -- a python socket instance

### is_running_modified

```python
is_running_modified(sock) -> bool
```

Checks if running is modified.

Keyword arguments:

* sock -- a python socket instance

### iterate

```python
iterate(sock, thandle, iter, flags, path) -> None
```

Used to iterate over all the data in a transaction and the underlying data
store as opposed to only iterate over changes like diff_iterate.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* iter -- iterator function, will be called for every diff in the transaction
* flags -- ITER_WANT_ATTR or 0
* path -- receive only changes from this path and below

The iter callback function should have the following signature:

    def my_iterator(kp, v, attr_vals)

### keypath_diff_iterate

```python
keypath_diff_iterate(sock, thandle, iter, flags, path) -> None
```

Like diff_iterate but takes an additional path argument.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* iter -- iterator function, will be called for every diff in the transaction
* flags -- bitmask of ITER_WANT_ATTR and ITER_WANT_P_CONTAINER
* path -- receive only changes from this path and below

### kill_user_session

```python
kill_user_session(sock, usessid) -> None
```

Kill MAAPI user session with session id.

Keyword arguments:

* sock -- a python socket instance
* usessid -- the MAAPI session id to be killed

### load_config

```python
load_config(sock, thandle, flags, filename) -> None
```

Loads configuration from 'filename'.
The caller of the function has to indicate which format the file has by
using one of the following flags:

        CONFIG_XML -- XML format
        CONFIG_J -- Juniper curly bracket style
        CONFIG_C -- Cisco XR style
        CONFIG_TURBO_C -- A faster version of CONFIG_C
        CONFIG_C_IOS -- Cisco IOS style

Keyword arguments:

* sock -- a python socket instance
* thandle -- a transaction handle
* flags -- as above
* filename -- to read the configuration from

### load_config_cmds

```python
load_config_cmds(sock, thandle, flags, cmds, path) -> None
```

Loads configuration from the string 'cmds'

Keyword arguments:

* sock -- a python socket instance
* thandle -- a transaction handle
* cmds -- a string of cmds
* flags -- as above

### load_config_stream

```python
load_config_stream(sock, th, flags) -> int
```

Loads configuration from the stream socket. The th and flags parameters are
the same as for load_config(). Returns and id.

Keyword arguments:

* sock -- a python socket instance
* thandle -- a transaction handle
* flags -- as for load_config()

### load_config_stream_result

```python
load_config_stream_result(sock, id) -> int
```

We use this function to verify that the configuration we wrote on the
stream socket was successfully loaded.

Keyword arguments:

* sock -- a python socket instance
* id -- the id returned from load_config_stream()

### load_schemas

```python
load_schemas(sock) -> None
```

Loads all schema information into the lib.

Keyword arguments:

* sock -- a python socket instance

### load_schemas_list

```python
load_schemas_list(sock, flags, nshash, nsflags) -> None
```

Loads selected schema information into the lib.

Keyword arguments:

* sock -- a python socket instance
* flags -- the flags to set
* nshash -- the listed namespaces that schema information should be loaded for
* nsflags -- namespace specific flags

### lock

```python
lock(sock, name) -> None
```

Lock database with name.

Keyword arguments:

* sock -- a python socket instance
* name -- name of the database to lock

### lock_partial

```python
lock_partial(sock, name, xpaths) -> int
```

Lock a subset (xpaths) of database name. Returns lockid.

Keyword arguments:

* sock -- a python socket instance
* xpaths -- a list of strings

### move

```python
move(sock, thandle, tokey, path) -> None
```

Moves an existing list entry, i.e. renames the entry using the tokey
parameter.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* tokey -- confdValue list
* path -- the subtree rooted at path is copied

### move_ordered

```python
move_ordered(sock, thandle, where, tokey, path) -> None
```

Moves an entry in an 'ordered-by user' statement to a new position.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* where -- FIRST, LAST, BEFORE or AFTER
* tokey -- confdValue list
* path -- the subtree rooted at path is copied

### netconf_ssh_call_home

```python
netconf_ssh_call_home(sock, host, port) -> None
```

Initiates a NETCONF SSH Call Home connection.

Keyword arguments:

sock -- a python socket instance
host -- an ipv4 addres, ipv6 address, or host name
port -- the port to connect to

### netconf_ssh_call_home_opaque

```python
netconf_ssh_call_home_opaque(sock, host, opaque, port) -> None
```

Initiates a NETCONF SSH Call Home connection.

Keyword arguments:
sock -- a python socket instance
host -- an ipv4 addres, ipv6 address, or host name
opaque -- opaque string passed to an external call home session
port -- the port to connect to

### num_instances

```python
num_instances(sock, thandle, path) -> int
```

Return the number of instances in a list in the tree.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* path -- position to check

### perform_upgrade

```python
perform_upgrade(sock, loadpathdirs) -> None
```

Second step in an upgrade. Loads new data model files.

Keyword arguments:

* sock -- a python socket instance
* loadpathdirs -- list of directories that are searched for CDB 'init' files

### popd

```python
popd(sock, thandle) -> None
```

Return to earlier saved (pushd) position in the tree.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle

### prepare_trans

```python
prepare_trans(sock, thandle) -> None
```

First phase of a two-phase trans.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle

### prepare_trans_flags

```python
prepare_trans_flags(sock, thandle, flags) -> None
```

First phase of a two-phase trans with flags.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* flags -- flags to set in the transaction

### prio_message

```python
prio_message(sock, to, message) -> None
```

Like sys_message but will be output directly instead of delivered when the
receiver terminates any ongoing command.

Keyword arguments:

* sock -- a python socket instance
* to -- user to send message to or 'all' to send to all users
* message -- the message

### progress_info

```python
progress_info(sock, msg, verbosity, attrs, links, path) -> None
```

While spans represents a pair of data points: start and stop; info events
are instead singular events, one point in time. Call progress_info() to
write a progress span info event to the progress trace. The info event
will have the same span-id as the start and stop events of the currently
ongoing progress span in the active user session or transaction. See
start_progress_span() for more information.

Keyword arguments:

* sock -- a python socket instance
* msg -- message to report
* verbosity -- VERBOSITY_*, default: VERBOSITY_NORMAL (optional)
* attrs -- user defined attributes (dict)
* links -- to existing traces or spans [{'trace_id':'...', 'span_id':'...'}]
* path -- keypath to an action/leaf/service

### progress_info_th

```python
progress_info_th(sock, thandle, msg, verbosity, attrs, links, path) ->
                 None
```

While spans represents a pair of data points: start and stop; info events
are instead singular events, one point in time. Call progress_info() to
write a progress span info event to the progress trace. The info event
will have the same span-id as the start and stop events of the currently
ongoing progress span in the active user session or transaction. See
start_progress_span() for more information.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* msg -- message to report
* verbosity -- VERBOSITY_*, default: VERBOSITY_NORMAL (optional)
* attrs -- user defined attributes (dict)
* links -- to existing traces or spans [{'trace_id':'...', 'span_id':'...'}]
* path -- keypath to an action/leaf/service

### pushd

```python
pushd(sock, thandle, path) -> None
```

Like cd, but saves the previous position in the tree. This can later be used
by popd to return.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* path -- position to change to

### query_free_result

```python
query_free_result(qrs) -> None
```

Deallocates the struct returned by 'query_result()'.

Keyword arguments:

* qrs -- the query result structure to free

### query_reset

```python
query_reset(sock, qh) -> None
```

Reset the query to the beginning again.

Keyword arguments:

* sock -- a python socket instance
* qh -- query handle

### query_reset_to

```python
query_reset_to(sock, qh, offset) -> None
```

Reset the query to offset.

Keyword arguments:

* sock -- a python socket instance
* qh -- query handle
* offset -- offset counted from the beginning

### query_result

```python
query_result(sock, qh) -> _ncs.QueryResult
```

Fetches the next available chunk of results associated with query handle
qh.

Keyword arguments:

* sock -- a python socket instance
* qh -- query handle

### query_result_count

```python
query_result_count(sock, qh) -> int
```

Counts the number of query results

Keyword arguments:

* sock -- a python socket instance
* qh -- query handle

### query_start

```python
query_start(sock, thandle, expr, context_node, chunk_size, initial_offset,
            result_as, select, sort) -> int
```

Starts a new query attached to the transaction given in 'th'.
Returns a query handle.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* expr -- the XPath Path expression to evaluate
* context_node -- The context node (an ikeypath) for the primary expression,
    or None (which means that the context node will be /).
* chunk_size --  How many results to return at a time. If set to 0,
    a default number will be used.
* initial_offset -- Which result in line to begin with (1 means to start
    from the beginning).
* result_as -- The format the results will be returned in.
* select -- An array of XPath 'select' expressions.
* sort -- An array of XPath expressions which will be used for sorting

### query_stop

```python
query_stop(sock, qh) -> None
```

Stop the running query.

Keyword arguments:

* sock -- a python socket instance
* qh -- query handle

### rebind_listener

```python
rebind_listener(sock, listener) -> None
```

Request that the subsystems specified by 'listeners' rebinds its listener
socket(s).

Keyword arguments:

* sock -- a python socket instance
* listener -- One of the following parameters (ORed together if more than one)

        LISTENER_IPC  
        LISTENER_NETCONF
        LISTENER_SNMP
        LISTENER_CLI
        LISTENER_WEBUI

### reload_config

```python
reload_config(sock) -> None
```

Request that the system reloads its configuration files.

Keyword arguments:

* sock -- a python socket instance

### reopen_logs

```python
reopen_logs(sock) -> None
```

Request that the system closes and re-opens its log files.

Keyword arguments:

* sock -- a python socket instance

### report_progress

```python
report_progress(sock, verbosity, msg) -> None
```

Report progress events.

This function makes it possible to report transaction/action progress
from user code.

This function is deprecated and will be removed in a future release.
Use progress_info() instead.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* verbosity -- at which verbosity level the message should be reported
* msg -- message to report

### report_progress2

```python
report_progress2(sock, verbosity, msg, package) -> None
```

Report progress events.

This function makes it possible to report transaction/action progress
from user code.

This function is deprecated and will be removed in a future release.
Use progress_info() instead.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* verbosity -- at which verbosity level the message should be reported
* msg -- message to report
* package -- from what package the message is reported

### report_progress_start

```python
report_progress_start(sock, verbosity, msg, package) -> int
```

Report progress events.
Used for calculation of the duration between two events.

This function makes it possible to report transaction/action progress
from user code.

This function is deprecated and will be removed in a future release.
Use start_progress_span() instead.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* verbosity -- at which verbosity level the message should be reported
* msg -- message to report
* package -- from what package the message is reported (only NCS)

### report_progress_stop

```python
report_progress_stop(sock, verbosity, msg, annotation,
                     package, timestamp) -> int
```

Report progress events.
Used for calculation of the duration between two events.

This function makes it possible to report transaction/action progress
from user code.

This function is deprecated and will be removed in a future release.
Use end_progress_span() instead.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* verbosity -- at which verbosity level the message should be reported
* msg -- message to report
* annotation -- metadata about the event, indicating error, explains latency
    or shows result etc
* package -- from what package the message is reported (only NCS)
* timestamp -- start of the event

### report_service_progress

```python
report_service_progress(sock, verbosity, msg, path) -> None
```

Report progress events for a service.

This function makes it possible to report transaction progress
from FASTMAP code.

This function is deprecated and will be removed in a future release.
Use progress_info() instead.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* verbosity -- at which verbosity level the message should be reported
* msg -- message to report
* path -- service instance path

### report_service_progress2

```python
report_service_progress2(sock, verbosity, msg, package, path) -> None
```

Report progress events for a service.

This function makes it possible to report transaction progress
from FASTMAP code.

This function is deprecated and will be removed in a future release.
Use progress_info() instead.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* verbosity -- at which verbosity level the message should be reported
* msg -- message to report
* package -- from what package the message is reported
* path -- service instance path

### report_service_progress_start

```python
report_service_progress_start(sock, verbosity, msg, package, path) -> int
```

Report progress events for a service.
Used for calculation of the duration between two events.

This function makes it possible to report transaction progress
from FASTMAP code.

This function is deprecated and will be removed in a future release.
Use start_progress_span() instead.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* verbosity -- at which verbosity level the message should be reported
* msg -- message to report
* package -- from what package the message is reported
* path -- service instance path

### report_service_progress_stop

```python
report_service_progress_stop(sock, verbosity, msg, annotation,
                             package, path) -> None
```

Report progress events for a service.
Used for calculation of the duration between two events.

This function makes it possible to report transaction progress
from FASTMAP code.

This function is deprecated and will be removed in a future release.
Use end_progress_span() instead.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* verbosity -- at which verbosity level the message should be reported
* msg -- message to report
* annotation -- metadata about the event, indicating error, explains latency
    or shows result etc
* package -- from what package the message is reported
* path -- service instance path
* timestamp -- start of the event

### request_action

```python
request_action(sock, params, hashed_ns, path) -> list
```

Invoke an action defined in the data model. Returns a list oftagValues.

Keyword arguments:

* sock -- a python socket instance
* params -- tagValue parameters for the action
* hashed_ns -- namespace
* path -- path to action

### request_action_str_th

```python
request_action_str_th(sock, thandle, cmd, path) -> str
```

The same as request_action_th but takes the parameters as a string and
returns the result as a string.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* cmd -- string parameters
* path -- path to action

### request_action_th

```python
request_action_th(sock, thandle, params, path) -> list
```

Same as for request_action() but uses the current namespace.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* params -- tagValue parameters for the action
* path -- path to action

### revert

```python
revert(sock, thandle) -> None
```

Removes all changes done to the transaction.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle

### roll_config

```python
roll_config(sock, thandle, path) -> int
```

This function can be used to save the equivalent of a rollback file for a
given configuration before it is committed (or a subtree thereof) in curly
bracket format. Returns an id

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* path -- tree for which to save the rollback configuration

### roll_config_result

```python
roll_config_result(sock, id) -> int
```

We use this function to assert that we received the entire rollback
configuration over a stream socket.

Keyword arguments:

* sock -- a python socket instance
* id -- the id returned from roll_config()

### save_config

```python
save_config(sock, thandle, flags, path) -> int
```

Save the config, returns an id.
The flags parameter controls the saving as follows. The value is a bitmask.

        CONFIG_XML -- The configuration format is XML.
        CONFIG_XML_PRETTY -- The configuration format is pretty printed XML.
        CONFIG_JSON -- The configuration is in JSON format.
        CONFIG_J -- The configuration is in curly bracket Juniper CLI
            format.
        CONFIG_C -- The configuration is in Cisco XR style format.
        CONFIG_TURBO_C -- The configuration is in Cisco XR style format.
            A faster parser than the normal CLI will be used.
        CONFIG_C_IOS -- The configuration is in Cisco IOS style format.
        CONFIG_XPATH -- The path gives an XPath filter instead of a
            keypath. Can only be used with CONFIG_XML and
            CONFIG_XML_PRETTY.
        CONFIG_WITH_DEFAULTS -- Default values are part of the
            configuration dump.
        CONFIG_SHOW_DEFAULTS -- Default values are also shown next to
            the real configuration value. Applies only to the CLI formats.
        CONFIG_WITH_OPER -- Include operational data in the dump.
        CONFIG_HIDE_ALL -- Hide all hidden nodes.
        CONFIG_UNHIDE_ALL -- Unhide all hidden nodes.
        CONFIG_WITH_SERVICE_META -- Include NCS service-meta-data
            attributes(refcounter, backpointer, out-of-band and
            original-value) in the dump.
        CONFIG_NO_PARENTS -- When a path is provided its parent nodes are by
            default included. With this option the output will begin
            immediately at path - skipping any parents.
        CONFIG_OPER_ONLY -- Include only operational data, and ancestors to
            operational data nodes, in the dump.
        CONFIG_NO_BACKQUOTE -- This option can only be used together with
            CONFIG_C and CONFIG_C_IOS. When set backslash will not be quoted
            in strings.
        CONFIG_CDB_ONLY -- Include only data stored in CDB in the dump. By
            default only configuration data is included, but the flag can be
            combined with either CONFIG_WITH_OPER or CONFIG_OPER_ONLY to
            save both configuration and operational data, or only
            operational data, respectively.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* flags -- as above
* path -- save only configuration below path

### save_config_result

```python
save_config_result(sock, id) -> None
```

Verify that we received the entire configuration over the stream socket.

Keyword arguments:

* sock -- a python socket instance
* id -- the id returned from save_config

### set_attr

```python
set_attr(sock, thandle, attr, v, keypath) -> None
```

Set attributes for a node.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* attr -- attributes to set
* v -- value to set the attribute to
* keypath -- path to choice

### set_comment

```python
set_comment(sock, thandle, comment) -> None
```

Set the Comment that is stored in the rollback file when a transaction
towards running is committed.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* comment -- the Comment

### set_delayed_when

```python
set_delayed_when(sock, thandle, on) -> None
```

This function enables (on non-zero) or disables (on == 0) the 'delayed when'
mode of a transaction.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* on -- disables when on=0, enables for all other n

### set_elem

```python
set_elem(sock, thandle, v, path) -> None
```

Set element to confdValue.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* v -- confdValue
* path -- position of elem

### set_elem2

```python
set_elem2(sock, thandle, strval, path) -> None
```

Set element to string.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* strval -- confdValue
* path -- position of elem

### set_flags

```python
set_flags(sock, thandle, flags) -> None
```

Modify read/write session aspect. See MAAPI_FLAG_xyz.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* flags -- flags to set

### set_label

```python
set_label(sock, thandle, label) -> None
```

Set the Label that is stored in the rollback file when a transaction
towards running is committed.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* label -- the Label

### set_namespace

```python
set_namespace(sock, thandle, hashed_ns) -> None
```

Indicate which namespace to use in case of ambiguities.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* hashed_ns -- the namespace to use

### set_next_user_session_id

```python
set_next_user_session_id(sock, usessid) -> None
```

Set the user session id that will be assigned to the next user session
started. The given value is silently forced to be in the range 100 .. 2^31-1.
This function can be used to ensure that session ids for user sessions
started by northbound agents or via MAAPI are unique across a restart.

Keyword arguments:

* sock -- a python socket instance
* usessid -- user session id

### set_object

```python
set_object(sock, thandle, values, keypath) -> None
```

Set leafs at path to object.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* values -- list of values
* keypath -- path to set

### set_readonly_mode

```python
set_readonly_mode(sock, flag) -> None
```

Control if northbound agents should be able to write or not.

Keyword arguments:

* sock -- a python socket instance
* flag -- non-zero means read-only mode

### set_running_db_status

```python
set_running_db_status(sock, status) -> None
```

Sets the notion of consistent state of the running db.

Keyword arguments:

* sock -- a python socket instance
* status -- integer status to set

### set_user_session

```python
set_user_session(sock, usessid) -> None
```

Associate a socket with an already existing user session.

Keyword arguments:

* sock -- a python socket instance
* usessid -- user session id

### set_values

```python
set_values(sock, thandle, values, keypath) -> None
```

Set leafs at path to values.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* values -- list of tagValues
* keypath -- path to set

### shared_apply_template

```python
shared_apply_template(sock, thandle, template, variables,flags, rootpath) -> None
```

FASTMAP version of ncs_apply_template.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* template -- template name
* variables -- None or a list of variables in the form of tuples
* flags -- Must be set as 0
* rootpath -- in what context to apply the template

### shared_copy_tree

```python
shared_copy_tree(sock, thandle, flags, frompath, topath) -> None
```

FASTMAP version of copy_tree.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* flags -- Must be set as 0
* frompath -- the path to copy the tree from
* topath -- the path to copy the tree to

### shared_create

```python
shared_create(sock, thandle, flags, path) -> None
```

FASTMAP version of create.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* flags -- Must be set as 0

### shared_insert

```python
shared_insert(sock, thandle, flags, path) -> None
```

FASTMAP version of insert.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* flags -- Must be set as 0
* path -- the path to the list to insert a new entry into

### shared_set_elem

```python
shared_set_elem(sock, thandle, v, flags, path) -> None
```

FASTMAP version of set_elem.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* v -- the value to set
* flags -- should be 0
* path -- the path to the element to set

### shared_set_elem2

```python
shared_set_elem2(sock, thandle, strval, flags, path) -> None
```

FASTMAP version of set_elem2.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* strval -- the value to se
* flags -- should be 0
* path -- the path to the element to set

### shared_set_values

```python
shared_set_values(sock, thandle, values, flags, keypath) -> None
```

FASTMAP version of set_values.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* values -- list of tagValues
* flags -- should be 0
* keypath -- path to set

### snmpa_reload

```python
snmpa_reload(sock, synchronous) -> None
```

Start a reload of SNMP Agent config from external data provider.

Used by external data provider to notify that there is a change to the SNMP
Agent config data. Calling the function with the argument 'synchronous' set
to 1 or True means that the call will block until the loading is completed.

Keyword arguments:

* sock -- a python socket instance
* synchronous -- if 1, will wait for the loading complete and return when
    the loading is complete; if 0, will only initiate the loading and return
    immediately

### start_phase

```python
start_phase(sock, phase, synchronous) -> None
```

When the system has been started in phase0, this function tells the system
to proceed to start phase 1 or 2.

Keyword arguments:

* sock -- a python socket instance
* phase -- phase to start, 1 or 2
* synchronous -- if 1, will wait for the loading complete and return when
    the loading is complete; if 0, will only initiate the loading of AAA
    data and return immediately

### start_progress_span

```python
start_progress_span(sock, msg, verbosity, attrs, links, path) -> dict
```

Starts a progress span. Progress spans are trace messages written to the
progress trace and the developer log. A progress span consists of a start
and a stop event which can be used to calculate the duration between the
two. Those events can be identified with unique span-ids. Inside the span
it is possible to start new spans, which will then become child spans,
the parent-span-id is set to the previous spans' span-id. A child span
can be used to calculate the duration of a sub task, and is started from
consecutive maapi_start_progress_span() calls, and is ended with
maapi_end_progress_span().

The concepts of traces, trace-id and spans are highly influenced by
https://opentelemetry.io/docs/concepts/signals/traces/#spans

Keyword arguments:

* sock -- a python socket instance
* msg -- message to report
* verbosity -- VERBOSITY_*, default: VERBOSITY_NORMAL (optional)
* attrs -- user defined attributes (dict)
* links -- to existing traces or spans [{'trace_id':'...', 'span_id':'...'}]
* path -- keypath to an action/leaf/service

### start_progress_span_th

```python
start_progress_span_th(sock, thandle, msg, verbosity,
                       attrs, links, path) -> dict
```

Starts a progress span. Progress spans are trace messages written to the
progress trace and the developer log. A progress span consists of a start
and a stop event which can be used to calculate the duration between the
two. Those events can be identified with unique span-ids. Inside the span
it is possible to start new spans, which will then become child spans,
the parent-span-id is set to the previous spans' span-id. A child span
can be used to calculate the duration of a sub task, and is started from
consecutive maapi_start_progress_span() calls, and is ended with
maapi_end_progress_span().

The concepts of traces, trace-id and spans are highly influenced by
https://opentelemetry.io/docs/concepts/signals/traces/#spans

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* msg -- message to report
* verbosity -- VERBOSITY_*, default: VERBOSITY_NORMAL (optional)
* attrs -- user defined attributes (dict)
* links -- to existing traces or spans [{'trace_id':'...', 'span_id':'...'}]
* path -- keypath to an action/leaf/service

### start_trans

```python
start_trans(sock, name, readwrite) -> int
```

Creates a new transaction towards the data store specified by name, which
can be one of CONFD_CANDIDATE, CONFD_RUNNING, or CONFD_STARTUP (however
updating the startup data store is better done via
maapi_copy_running_to_startup()). The readwrite parameter can be either
CONFD_READ, to start a readonly transaction, or CONFD_READ_WRITE, to start
a read-write transaction. The function returns the transaction id.

Keyword arguments:

* sock -- a python socket instance
* name -- name of the database
* readwrite -- CONFD_READ or CONFD_WRITE

### start_trans2

```python
start_trans2(sock, name, readwrite, usid) -> int
```

Start a transaction within an existing user session, returns the transaction
id.

Keyword arguments:

* sock -- a python socket instance
* name -- name of the database
* readwrite -- CONFD_READ or CONFD_WRITE
* usid -- user session id

### start_trans_flags

```python
start_trans_flags(sock, name, readwrite, usid) -> int
```

The same as start_trans2, but can also set the same flags that 'set_flags'
can set.

Keyword arguments:

* sock -- a python socket instance
* name -- name of the database
* readwrite -- CONFD_READ or CONFD_WRITE
* usid -- user session id
* flags -- same as for 'set_flags'

### start_trans_flags2

```python
start_trans_flags2(sock, name, readwrite, usid, vendor, product, version,
 client_id) -> int
```

This function does the same as start_trans_flags() but allows for
additional information to be passed to ConfD/NCS.

Keyword arguments:

* sock -- a python socket instance
* name -- name of the database
* readwrite -- CONFD_READ or CONFD_WRITE
* usid -- user session id
* flags -- same as for 'set_flags'
* vendor -- vendor string (may be None)
* product -- product string (may be None)
* version -- version string (may be None)
* client_id -- client identification string (may be None)

### start_trans_in_trans

```python
start_trans_in_trans(sock, readwrite, usid, thandle) -> int
```

Start a transaction within an existing transaction, using the started
transaction as backend instead of an actual data store. Returns the
transaction id as an integer.

Keyword arguments:

* sock -- a python socket instance
* readwrite -- CONFD_READ or CONFD_WRITE
* usid -- user session id
* thandle -- identifies the backend transaction to use

### start_user_session

```python
start_user_session(sock, username, context, groups, src_addr, prot) -> None
```

Establish a user session on the socket.

Keyword arguments:

* sock -- a python socket instance
* username -- the user for the session
* context -- context for the session
* groups -- groups
* src-addr -- src address of e.g. the client connecting
* prot -- the protocol used by the client for connecting

### start_user_session2

```python
start_user_session2(sock, username, context, groups, src_addr, src_port, prot) -> None
```

Establish a user session on the socket.

Keyword arguments:

* sock -- a python socket instance
* username -- the user for the session
* context -- context for the session
* groups -- groups
* src-addr -- src address of e.g. the client connecting
* src-port -- src port of e.g. the client connecting
* prot -- the protocol used by the client for connecting

### start_user_session3

```python
start_user_session3(sock, username, context, groups, src_addr, src_port, prot, vendor, product, version, client_id) -> None
```

Establish a user session on the socket.

This function does the same as start_user_session2() but allows for
additional information to be passed to ConfD/NCS.

Keyword arguments:

* sock -- a python socket instance
* username -- the user for the session
* context -- context for the session
* groups -- groups
* src-addr -- src address of e.g. the client connecting
* src-port -- src port of e.g. the client connecting
* prot -- the protocol used by the client for connecting
* vendor -- vendor string (may be None)
* product -- product string (may be None)
* version -- version string (may be None)
* client_id -- client identification string (may be None)

### start_user_session_gen

```python
start_user_session_gen(sock, username, context, groups,  vendor, product, version, client_id) -> None
```

Establish a user session on the socket.

This function does the same as start_user_session3() but
it takes the source address of the supplied socket from the OS.

Keyword arguments:

* sock -- a python socket instance
* username -- the user for the session
* context -- context for the session
* groups -- groups
* vendor -- vendor string (may be None)
* product -- product string (may be None)
* version -- version string (may be None)
* client_id -- client identification string (may be None)

### stop

```python
stop(sock) -> None
```

Request that the system stops.

Keyword arguments:

* sock -- a python socket instance

### sys_message

```python
sys_message(sock, to, message) -> None
```

Send a message to a specific user, a specific session or all user depending
on the 'to' parameter. 'all', <session-id> or <user-name> can be used.

Keyword arguments:

* sock -- a python socket instance
* to -- user to send message to or 'all' to send to all users
* message -- the message

### unhide_group

```python
unhide_group(sock, thandle, group_name) -> None
```

Unhide all nodes belonging to a hide group in a transaction that started 
with flag FLAG_HIDE_ALL_HIDEGROUPS.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* group_name -- the group name

### unlock

```python
unlock(sock, name) -> None
```

Unlock database with name.

Keyword arguments:

* sock -- a python socket instance
* name -- name of the database to unlock

### unlock_partial

```python
unlock_partial(sock, lockid) -> None
```

Unlock a subset of a database which is locked by lockid.

Keyword arguments:

* sock -- a python socket instance
* lockid -- id of the lock

### user_message

```python
user_message(sock, to, message, sender) -> None
```

Send a message to a specific user.

Keyword arguments:

* sock -- a python socket instance
* to -- user to send message to or 'all' to send to all users
* message -- the message
* sender -- send as

### validate_trans

```python
validate_trans(sock, thandle, unlock, forcevalidation) -> None
```

Validates all data written in a transaction.

If unlock is 1 (or True), the transaction is open for further editing even
if validation succeeds. If unlock is 0 (or False) and the function returns
CONFD_OK, the next function to be called MUST be maapi_prepare_trans() or
maapi_finish_trans().

unlock = 1 can be used to implement a 'validate' command which can be
given in the middle of an editing session. The first thing that happens is
that a lock is set. If unlock == 1, the lock is released on success. The
lock is always released on failure.

The forcevalidation argument should normally be 0 (or False). It has no
effect for a transaction towards the running or startup data stores,
validation is always performed. For a transaction towards the candidate
data store, validation will not be done unless forcevalidation is non-zero.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* unlock -- int or bool
* forcevalidation -- int or bool

### wait_start

```python
wait_start(sock, phase) -> None
```

Wait for the system to reach a certain start phase (0,1 or 2).

Keyword arguments:

* sock -- a python socket instance
* phase -- phase to wait for, 0, 1 or 2

### write_service_log_entry

```python
write_service_log_entry(sock, path, msg, type, level) -> None
```

Write service log entries.

This function makes it possible to write service log entries from
FASTMAP code.

Keyword arguments:

* sock -- a python socket instance
* path -- service instance path
* msg -- message to log
* type -- log entry type
* level -- log entry level

### xpath2kpath

```python
xpath2kpath(sock, xpath) -> _ncs.HKeypathRef
```

Convert an xpath to a hashed keypath.

Keyword arguments:

* sock -- a python socket instance
* xpath -- to convert

### xpath2kpath_th

```python
xpath2kpath_th(sock, thandle, xpath) -> _ncs.HKeypathRef
```

Convert an xpath to a hashed keypath.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* xpath -- to convert

### xpath_eval

```python
xpath_eval(sock, thandle, expr, result, trace, path) -> None
```

Evaluate the xpath expression in 'expr'. For each node in the  resulting
node the function 'result' is called with the keypath to the resulting
node as the first argument and, if the node is a leaf and has a value. the
value of that node as the second argument. For each invocation of 'result'
the function should return ITER_CONTINUE to tell the XPath evaluator to
continue or ITER_STOP to stop the evaluation. A trace function, 'pytrace',
could be supplied and will be called with a single string as an argument.
'None' can be used if no trace is needed. Unless a 'path' is given the
root node will be used as a context for the evaluations.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* expr -- the XPath Path expression to evaluate
* result -- the result function
* trace -- a trace function that takes a string as a parameter
* path -- the context node

### xpath_eval_expr

```python
xpath_eval_expr(sock, thandle, expr, trace, path) -> str
```

Like xpath_eval but returns a string.

Keyword arguments:

* sock -- a python socket instance
* thandle -- transaction handle
* expr -- the XPath Path expression to evaluate
* trace -- a trace function that takes a string as a parameter
* path -- the context node


## Classes

### _class_ **Cursor**

struct maapi_cursor object

Members:

_None_

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
MOVE_AFTER = 3
MOVE_BEFORE = 2
MOVE_FIRST = 1
MOVE_LAST = 4
NOECHO = 0
PRODUCT = 'NCS'
UPGRADE_KILL_ON_TIMEOUT = 1
```
