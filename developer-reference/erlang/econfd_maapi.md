# Module econfd_maapi

An Erlang interface equivalent to the MAAPI C-API

This modules implements the Management Agent API. All functions in this module have an equivalent function in the C library. The actual semantics of each of the API functions described here is better described in the man page confd_lib_maapi(3).


## Types

[confd\_user\_identification/0](#confd_user_identification-0)

[confd\_user\_info/0](#confd_user_info-0)

[dbname/0](#dbname-0) - The DB name can be either

[err/0](#err-0) - Errors can be either

[find\_next\_type/0](#find_next_type-0) - The type is used in `find_next/3` can be either

[maapi\_cursor/0](#maapi_cursor-0)

[proto/0](#proto-0) - The protocol to start user session can be either

[read\_ret/0](#read_ret-0)

[template\_type/0](#template_type-0) - The type is used in `ncs_template_variables/3`

[verbosity/0](#verbosity-0) - The type is used in `start_span_th/7` and can be either

[xpath\_eval\_option/0](#xpath_eval_option-0)

### confd_user_identification/0

```erlang
-type confd_user_identification() :: #confd_user_identification{}.
```

### confd_user_info/0

```erlang
-type confd_user_info() :: #confd_user_info{}.
```

### dbname/0

```erlang
-type dbname() :: 0 | 1 | 2 | 3 | 4 | 6 | 7.
```

The DB name can be either

* 0 = CONFD_NO_DB
* 1 = CONFD_CANDIDATE
* 2 = CONFD_RUNNING
* 3 = CONFD_STARTUP
* 4 = CONFD_OPERATIONAL
* 6 = CONFD_PRE_COMMIT_RUNNING
* 7 = CONFD_INTENDED

Check `maapi_start_trans()` in confd_lib_maapi(3) for detailed information.


### err/0

```erlang
-type err() :: {error, {integer(), binary()}} | {error, closed}.
```

Errors can be either

* \{error, Ecode::integer(), Reason::binary()\} where Ecode is one of the error codes defined in econfd_errors.hrl, and Reason is (possibly empty) textual description
* \{error, closed\} if the socket gets closed


### find_next_type/0

```erlang
-type find_next_type() :: 0 | 1.
```

The type is used in `find_next/3` can be either

* 0 = CONFD_FIND_NEXT
* 1 = CONFD_FIND_SAME_OR_NEXT

Check `maapi_find_next()` in confd_lib_maapi(3) for detailed information.


### maapi_cursor/0

```erlang
-type maapi_cursor() :: #maapi_cursor{}.
```

### proto/0

```erlang
-type proto() :: 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9.
```

The protocol to start user session can be either

* 0 = CONFD_PROTO_UNKNOWN
* 1 = CONFD_PROTO_TCP
* 2 = CONFD_PROTO_SSH
* 3 = CONFD_PROTO_SYSTEM
* 4 = CONFD_PROTO_CONSOLE
* 5 = CONFD_PROTO_SSL
* 6 = CONFD_PROTO_HTTP
* 7 = CONFD_PROTO_HTTPS
* 8 = CONFD_PROTO_UDP
* 9 = CONFD_PROTO_TLS


### read_ret/0

```erlang
-type read_ret() ::
          ok |
          {ok, term()} |
          {error, {ErrorCode :: non_neg_integer(), Info :: binary()}} |
          {error, econfd:transport_error()}.
```

Related types: [econfd:transport\_error()](econfd.md#transport_error-0)

### template_type/0

```erlang
-type template_type() :: 0 | 1 | 2.
```

The type is used in `ncs_template_variables/3`

* 0 = DEVICE_TEMPLATE - Designates device template, device template means the specific template configuration name under /ncs:devices/ncs:template.
* 1 = SERVICE_TEMPLATE - Designates service template, service template means the specific template configuration name of template loaded from the directory templates of the package.
* 2 = COMPLIANCE_TEMPLATE - Designates compliance template, compliance template used to verify that the configuration on a device conforms to an expected, predefined configuration, it also means the specific template configuration name under /ncs:compliance/ncs:template


### verbosity/0

```erlang
-type verbosity() :: 0 | 1 | 2 | 3.
```

The type is used in `start_span_th/7` and can be either

* 0 = CONFD_PROGRESS_NORMAL
* 1 = CONFD_PROGRESS_VERBOSE
* 2 = CONFD_PROGRESS_VERY_VERBOSE
* 3 = CONFD_PROGRESS_DEBUG

Check `maapi_start_span_th()` in confd_lib_maapi(3) for detailed information.


### xpath_eval_option/0

```erlang
-type xpath_eval_option() ::
          {tracefun, term()} |
          {context, econfd:ikeypath()} |
          {varbindings,
           [{Name :: string(), ValueExpr :: string() | binary()}]} |
          {root, econfd:ikeypath()}.
```

Related types: [econfd:ikeypath()](econfd.md#ikeypath-0)

## Functions

[aaa\_reload(Socket, Synchronous)](#aaa_reload-2) - Tell AAA to reload external AAA data.


[abort\_trans(Socket, Tid)](#abort_trans-2) - Abort transaction.


[abort\_upgrade(Socket)](#abort_upgrade-1) - Abort in-service upgrade.


[aes256\_key(Aes256Key)](#aes256_key-1)

[aes\_key(AesKey, AesIVec)](#aes_key-2)

[all\_keys(Cursor, Acc)](#all_keys-2)

[all\_keys(Socket, Tid, IKeypath)](#all_keys-3) - Utility function. Return all keys in a list.


[apply\_trans(Socket, Tid, KeepOpen)](#apply_trans-3) - Equivalent to [apply_trans(Socket, Tid, KeepOpen, 0)](#apply_trans-4).


[apply\_trans(Socket, Tid, KeepOpen, Flags)](#apply_trans-4) - Apply all in the transaction.

[attach(Socket, Ns, Tctx)](#attach-3) - Attach to a running transaction.

[attach2(Socket, Ns, USid, Thandle)](#attach2-4) - Attach to a running transaction. Give NameSpace as 0 if it doesn't matter (-1 works too but is deprecated).


[attach\_init(Socket)](#attach_init-1) - Attach to the CDB init/upgrade transaction in phase0.

[authenticate(Socket, User, Pass, Groups)](#authenticate-4) - Autenticate a user using ConfD AAA.


[authenticate2(Socket, User, Pass, SrcIp, SrcPort, Context, Proto, Groups)](#authenticate2-8) - Autenticate a user using ConfD AAA.


[bool2int(\_)](#bool2int-1)

[candidate\_abort\_commit(Socket)](#candidate_abort_commit-1) - Equivalent to [candidate_abort_commit(Socket, <<>>)](#candidate_abort_commit-2).


[candidate\_abort\_commit(Socket, PersistId)](#candidate_abort_commit-2) - Cancel persistent confirmed commit.


[candidate\_commit(Socket)](#candidate_commit-1) - Equivalent to [candidate_commit_info(Socket, undefined, <<>>, <<>>)](#candidate_commit_info-4).

[candidate\_commit(Socket, PersistId)](#candidate_commit-2) - Equivalent to [candidate_commit_info(Socket, PersistId, <<>>, <<>>)](#candidate_commit_info-4).

[candidate\_commit\_info(Socket, Label, Comment)](#candidate_commit_info-3) - Equivalent to [candidate_commit_info(Socket, undefined, Label, Comment)](#candidate_commit_info-4).

[candidate\_commit\_info(Socket, PersistId, Label, Comment)](#candidate_commit_info-4) - Combines `candidate_commit/2` and `candidate_commit_info/3` \- set "Label" and/or "Comment" when confirming a persistent confirmed commit.

[candidate\_confirmed\_commit(Socket, TimeoutSecs)](#candidate_confirmed_commit-2) - Equivalent to [candidate_confirmed_commit_info(Socket, TimeoutSecs, undefined, undefined, <<>>, <<>>)](#candidate_confirmed_commit_info-6).

[candidate\_confirmed\_commit(Socket, TimeoutSecs, Persist, PersistId)](#candidate_confirmed_commit-4) - Equivalent to [candidate_confirmed_commit_info(Socket, TimeoutSecs, Persist, PersistId, <<>>, <<>>)](#candidate_confirmed_commit_info-6).

[candidate\_confirmed\_commit\_info(Socket, TimeoutSecs, Label, Comment)](#candidate_confirmed_commit_info-4) - Equivalent to [candidate_confirmed_commit_info(Socket, TimeoutSecs, undefined, undefined, Label, Comment)](#candidate_confirmed_commit_info-6).

[candidate\_confirmed\_commit\_info(Socket, TimeoutSecs, Persist, PersistId, Label, Comment)](#candidate_confirmed_commit_info-6) - Combines `candidate_confirmed_commit/4` and `candidate_confirmed_commit_info/4` \- set "Label" and/or "Comment" when starting or extending a persistent confirmed commit.

[candidate\_reset(Socket)](#candidate_reset-1) - Copy running into candidate.


[candidate\_validate(Socket)](#candidate_validate-1) - Validate the candidate config.


[cli\_prompt(Socket, USid, Prompt, Echo)](#cli_prompt-4) - Prompt CLI user for a reply.


[cli\_prompt(Socket, USid, Prompt, Echo, Timeout)](#cli_prompt-5) - Prompt CLI user for a reply - return error if no reply is received within Timeout seconds.


[cli\_prompt\_oneof(Socket, USid, Prompt, Choice)](#cli_prompt_oneof-4) - Prompt CLI user for a reply.


[cli\_prompt\_oneof(Socket, USid, Prompt, Choice, Timeout)](#cli_prompt_oneof-5) - Prompt CLI user for a reply - return error if no reply is received within Timeout seconds.


[cli\_read\_eof(Socket, USid, Echo)](#cli_read_eof-3) - Read data from CLI until EOF.


[cli\_read\_eof(Socket, USid, Echo, Timeout)](#cli_read_eof-4) - Read data from CLI until EOF - return error if no reply is received within Timeout seconds.


[cli\_write(Socket, USid, Message)](#cli_write-3) - Write mesage to the CLI.


[close(Socket)](#close-1) - Close socket.


[commit\_trans(Socket, Tid)](#commit_trans-2) - Commit a transaction.


[commit\_upgrade(Socket)](#commit_upgrade-1) - Commit in-service upgrade.


[confirmed\_commit\_in\_progress(Socket)](#confirmed_commit_in_progress-1) - Is a confirmed commit in progress.


[connect(Path)](#connect-1) - Connect a maapi socket to ConfD.


[connect(Address, Port)](#connect-2) - Connect a maapi socket to ConfD.


[copy(Socket, FromTH, ToTH)](#copy-3) - Copy data from one transaction to another.


[copy\_running\_to\_startup(Socket)](#copy_running_to_startup-1) - Copy running to startup.


[copy\_tree(Socket, Tid, FromIKeypath, ToIKeypath)](#copy_tree-4) - Copy an entire subtree in the configuration from one point to another.


[create(Socket, Tid, IKeypath)](#create-3) - Create a new element.


[delete(Socket, Tid, IKeypath)](#delete-3) - Delete an element.


[delete\_config(Socket, DbName)](#delete_config-2) - Delete all data from a data store.


[des\_key(DesKey1, DesKey2, DesKey3, DesIVec)](#des_key-4)

[detach(Socket, Thandle)](#detach-2) - Detach from the transaction.


[diff\_iterate(Sock, Tid, Fun, InitState)](#diff_iterate-4) - Equivalent to [diff_iterate(Sock, Tid, Fun, 0, InitState)](#diff_iterate-5).


[diff\_iterate(Socket, Tid, Fun, Flags, State)](#diff_iterate-5) - Iterate through a diff.

[do\_connect(SockAddr)](#do_connect-1)

[end\_progress\_span(Socket, SpanId1, Annotation)](#end_progress_span-3)

[end\_user\_session(Socket)](#end_user_session-1) - Ends a user session.


[exists(Socket, Tid, IKeypath)](#exists-3) - Check if an element exists.


[find\_next(Cursor, Type, Key)](#find_next-3) - find the list entry matching Type and Key.


[finish\_trans(Socket, Tid)](#finish_trans-2) - Finish a transaction.


[get\_attrs(Socket, Tid, IKeypath, AttrList)](#get_attrs-4) - Get the selected attributes for an element.

[get\_authorization\_info(Socket, USid)](#get_authorization_info-2) - Get authorization info for a user session.


[get\_case(Socket, Tid, IKeypath, Choice)](#get_case-4) - Get the current case for a choice.


[get\_elem(Socket, Tid, IKeypath)](#get_elem-3) - Read an element.


[get\_elem\_no\_defaults(Socket, Tid, IKeypath)](#get_elem_no_defaults-3) - Read an element, but return 'default' instead of the value if the default value is in effect.


[get\_my\_user\_session\_id(Socket)](#get_my_user_session_id-1) - Get my user session id.


[get\_next(Cursor)](#get_next-1) - iterate through the entries of a list.


[get\_object(Socket, Tid, IKeypath)](#get_object-3) - Read all the values in a container or list entry.


[get\_objects(Cursor, NumEntries)](#get_objects-2) - Read all the values for NumEntries list entries, starting at the point given by the cursor C.

[get\_rollback\_id(Socket, Tid)](#get_rollback_id-2) - Get rollback id of commited transaction.


[get\_running\_db\_status(Socket)](#get_running_db_status-1) - Get the "running status".


[get\_user\_session(Socket, USid)](#get_user_session-2) - Get session info for a user session.


[get\_user\_sessions(Socket)](#get_user_sessions-1) - Get all user sessions.


[get\_values(Socket, Tid, IKeypath, Values)](#get_values-4) - Read the values for the leafs that have the "value" 'not_found' in the Values list.

[hide\_group(Socket, Tid, GroupName)](#hide_group-3) - Do hide a hide group.

[hkeypath2ikeypath(Socket, HKeypath)](#hkeypath2ikeypath-2) - Convert a hkeypath to an ikeypath.


[ibool(X)](#ibool-1)

[init\_cursor(Socket, Tid, IKeypath)](#init_cursor-3) - Equivalent to [init_cursor(Socket, Tik, IKeypath, undefined)](#init_cursor-4).


[init\_cursor(Socket, Tid, IKeypath, XPath)](#init_cursor-4) - Initalize a get_next() cursor.


[init\_upgrade(Socket, TimeoutSecs, Flags)](#init_upgrade-3) - Start in-service upgrade.


[insert(Socket, Tid, IKeypath)](#insert-3) - Insert an entry in an integer-keyed list.


[install\_crypto\_keys(Socket)](#install_crypto_keys-1) - Fetch keys for the encrypted data types from the server.

[is\_candidate\_modified(Socket)](#is_candidate_modified-1) - Check if candidate has been modified.


[is\_lock\_set(Socket, DbName)](#is_lock_set-2) - Check if a db is locked or not.

[is\_running\_modified(Socket)](#is_running_modified-1) - Check if running has been modified since the last copy to startup was done.


[iterate(Socket, Tid, IKeypath, Fun, Flags, State)](#iterate-6) - Iterate over all the data in the transaction and the underlying data store.

[iterate\_result(Sock, Fun, \_)](#iterate_result-3)

[keypath\_diff\_iterate(Socket, Tid, IKeypath, Fun, State)](#keypath_diff_iterate-5) - Iterate through a diff.

[keypath\_diff\_iterate(Sock, Tid, IKP, Fun, Flags, InitState)](#keypath_diff_iterate-6)

[kill\_user\_session(Socket, USid)](#kill_user_session-2) - Kill a user session.


[lock(Socket, DbName)](#lock-2) - Lock a database.


[lock\_partial(Socket, DbName, XPath)](#lock_partial-3) - Request a partial lock on a database.

[mk\_uident(UId)](#mk_uident-1)

[move(Socket, Tid, IKeypath, ToKey)](#move-4) - Move (rename) an entry in a list.


[move\_ordered(Socket, Tid, IKeypath, To)](#move_ordered-4) - Move an entry in an "ordered-by user" list.


[ncs\_apply\_template(Socket, Tid, TemplateName, RootIKeypath, Variables, Documents, Shared)](#ncs_apply_template-7) - Apply a template that has been loaded into NCS.

[ncs\_apply\_trans\_params(Socket, Tid, KeepOpen, Params)](#ncs_apply_trans_params-4) - Apply transaction with commit parameters.

[ncs\_get\_trans\_params(Socket, Tid)](#ncs_get_trans_params-2) - Get transaction commit parameters.


[ncs\_template\_variables(Socket, TemplateName)](#ncs_template_variables-2) - Retrieve the variables used in a template.


[ncs\_template\_variables(Socket, TemplateName, Type)](#ncs_template_variables-3) - Retrieve the variables used in a template.


[ncs\_templates(Socket)](#ncs_templates-1) - Retrieve a list of the templates currently loaded into NCS.


[ncs\_write\_service\_log\_entry(Socket, IKeypath, Message, Type, Level)](#ncs_write_service_log_entry-5) - Write a service log entry.


[netconf\_ssh\_call\_home(Socket, Host, Port)](#netconf_ssh_call_home-3)

[netconf\_ssh\_call\_home\_opaque(Socket, Host, Opaque, Port)](#netconf_ssh_call_home_opaque-4)

[num\_instances(Socket, Tid, IKeypath)](#num_instances-3) - Find the number of entries in a list.


[perform\_upgrade(Socket, LoadPathList)](#perform_upgrade-2) - Do in-service upgrade.


[prepare\_trans(Socket, Tid)](#prepare_trans-2) - Equivalent to [prepare_trans(Socket, Tid, 0)](#prepare_trans-3).


[prepare\_trans(Socket, Tid, Flags)](#prepare_trans-3) - Prepare for commit.


[prio\_message(Socket, To, Message)](#prio_message-3) - Write priority message.


[progress\_info(Socket, Verbosity, Msg, SIKP, Attrs, Links)](#progress_info-6)

[progress\_info\_th(Socket, Tid, Verbosity, Msg, SIKP, Attrs, Links)](#progress_info_th-7)

[reload\_config(Socket)](#reload_config-1) - Tell ConfD daemon to reload its configuration.


[request\_action(Socket, Params, IKeypath)](#request_action-3) - Invoke an action defined in the data model.


[request\_action\_th(Socket, Tid, Params, IKeypath)](#request_action_th-4) - Invoke an action defined in the data model using the provided transaction.

[reverse(X)](#reverse-1)

[revert(Socket, Tid)](#revert-2) - Remove all changes in the transaction.


[set\_attr(Socket, Tid, IKeypath, Attr, Value)](#set_attr-5) - Set the an attribute for an element. Value == undefined means that the attribute should be deleted.


[set\_comment(Socket, Tid, Comment)](#set_comment-3) - Set the "Comment" that is stored in the rollback file when a transaction towards running is committed.


[set\_delayed\_when(Socket, Tid, Value)](#set_delayed_when-3) - Enable/disable the "delayed when" mode for a transaction.

[set\_elem(Socket, Tid, IKeypath, Value)](#set_elem-4) - Write an element.


[set\_elem2(Socket, Tid, IKeypath, BinValue)](#set_elem2-4) - Write an element using the textual value representation.


[set\_flags(Socket, Tid, Flags)](#set_flags-3) - Change flag settings for a transaction.

[set\_label(Socket, Tid, Label)](#set_label-3) - Set the "Label" that is stored in the rollback file when a transaction towards running is committed.


[set\_object(Socket, Tid, IKeypath, ValueList)](#set_object-4) - Write an entire object, i.e. YANG list entry or container.


[set\_readonly\_mode(Socket, Mode)](#set_readonly_mode-2) - Control if we can create rw transactions.


[set\_running\_db\_status(Socket, Status)](#set_running_db_status-2) - Set the "running status".


[set\_user\_session(Socket, USid)](#set_user_session-2) - Assign a user session.


[set\_values(Socket, Tid, IKeypath, ValueList)](#set_values-4) - Write a list of tagged values.

[shared\_create(Socket, Tid, IKeypath)](#shared_create-3) - Create a new element, and also set an attribute indicating how many times this element has been created.


[shared\_set\_elem(Socket, Tid, IKeypath, Value)](#shared_set_elem-4) - Write an element from NCS FastMap.


[shared\_set\_elem2(Socket, Tid, IKeypath, BinValue)](#shared_set_elem2-4) - Write an element using the textual value representation from NCS fastmap.


[shared\_set\_values(Socket, Tid, IKeypath, ValueList)](#shared_set_values-4) - Write a list of tagged values from NCS FastMap.


[snmpa\_reload(Socket, Synchronous)](#snmpa_reload-2) - Tell ConfD to reload external SNMP Agent config data.


[start\_phase(Socket, Phase, Synchronous)](#start_phase-3) - Tell ConfD to proceed to next start phase.


[start\_progress\_span(Socket, Verbosity, Msg, SIKP, Attrs, Links)](#start_progress_span-6)

[start\_progress\_span\_th(Socket, Tid, Verbosity, Msg, SIKP, Attrs, Links)](#start_progress_span_th-7)

[start\_trans(Socket, DbName, RwMode)](#start_trans-3) - Start a new transaction.


[start\_trans(Socket, DbName, RwMode, USid)](#start_trans-4) - Start a new transaction within an existing user session.


[start\_trans(Socket, DbName, RwMode, USid, Flags)](#start_trans-5) - Start a new transaction within an existing user session and/or with flags.

[start\_trans(Sock, DbName, RwMode, Usid, Flags, UId)](#start_trans-6)

[start\_trans\_in\_trans(Socket, RwMode, USid, Tid)](#start_trans_in_trans-4) - Start a new transaction with an existing transaction as backend.

[start\_trans\_in\_trans(Socket, RwMode, USid, Tid, Flags)](#start_trans_in_trans-5) - Start a new transaction with an existing transaction as backend.

[start\_user\_session(Socket, UserName, Context, Groups, SrcIp, Proto)](#start_user_session-6) - Equivalent to [start_user_session(Socket, UserName, Context, Groups, SrcIp, 0, Proto)](#start_user_session-7).


[start\_user\_session(Socket, UserName, Context, Groups, SrcIp, SrcPort, Proto)](#start_user_session-7) - Equivalent to [start_user_session(Socket, UserName, Context, Groups, SrcIp, 0, Proto, undefined)](#start_user_session-8).


[start\_user\_session(Socket, UserName, Context, Groups, SrcIp, SrcPort, Proto, UId)](#start_user_session-8) - Initiate a new maapi user session.

[stop(Socket)](#stop-1) - Equivalent to [stop(Sock, true)](#stop-2).

[stop(Socket, Synchronous)](#stop-2) - Tell ConfD daemon to stop, if Synchronous is true won't return until daemon has come to a halt.

[sys\_message(Socket, To, Message)](#sys_message-3) - Write system message.


[unhide\_group(Socket, Tid, GroupName)](#unhide_group-3) - Do unhide a hide group.

[unlock(Socket, DbName)](#unlock-2) - Unlock a database.


[unlock\_partial(Socket, LockId)](#unlock_partial-2) - Remove the partial lock identified by LockId.


[user\_message(Socket, To, From, Message)](#user_message-4) - Write user message.


[validate\_trans(Socket, Tid, UnLock, ForceValidation)](#validate_trans-4) - Validate the transaction.


[wait\_start(Socket)](#wait_start-1) - Equivalent to [wait_start(Socket, 2)](#wait_start-2).

[wait\_start(Socket, Phase)](#wait_start-2) - Wait until ConfD daemon has reached a certain start phase.


[xpath\_eval(Socket, Tid, Expr, ResultFun, State, Options)](#xpath_eval-6) - Evaluate the XPath expression Expr, invoking ResultFun for each node in the resulting node set.

[xpath\_eval(Socket, Tid, Expr, ResultFun, TraceFun, State, Context)](#xpath_eval-7) - Evaluate the XPath expression Expr, invoking ResultFun for each node in the resulting node set.

[xpath\_eval\_expr(Socket, Tid, Expr, Options)](#xpath_eval_expr-4) - Evaluate the XPath expression Expr, returning the result as a string.


[xpath\_eval\_expr(Socket, Tid, Expr, TraceFun, Context)](#xpath_eval_expr-5) - Evaluate the XPath expression Expr, returning the result as a string.


[xpath\_eval\_expr\_loop(Sock, TraceFun)](#xpath_eval_expr_loop-2)

[xpath\_eval\_loop(Sock, ResultFun, TraceFun, State)](#xpath_eval_loop-4)

### aaa_reload/2

```erlang
-spec aaa_reload(Socket, Synchronous) -> ok | err()
                    when
                        Socket :: econfd:socket(),
                        Synchronous :: boolean().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Tell AAA to reload external AAA data.


### abort_trans/2

```erlang
-spec abort_trans(Socket, Tid) -> ok | err()
                     when Socket :: econfd:socket(), Tid :: integer().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Abort transaction.


### abort_upgrade/1

```erlang
-spec abort_upgrade(Socket) -> ok | err() when Socket :: econfd:socket().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Abort in-service upgrade.


### aes256_key/1

```erlang
aes256_key(Aes256Key)
```

### aes_key/2

```erlang
aes_key(AesKey, AesIVec)
```

### all_keys/2

```erlang
all_keys(Cursor, Acc)
```

### all_keys/3

```erlang
-spec all_keys(Socket, Tid, IKeypath) -> Result
                  when
                      Socket :: econfd:socket(),
                      Tid :: integer(),
                      IKeypath :: econfd:ikeypath(),
                      Result :: {ok, [econfd:key()]} | err().
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:key()](econfd.md#key-0), [econfd:socket()](econfd.md#socket-0)

Utility function. Return all keys in a list.


### apply_trans/3

```erlang
-spec apply_trans(Socket, Tid, KeepOpen) -> ok | err()
                     when
                         Socket :: econfd:socket(),
                         Tid :: integer(),
                         KeepOpen :: boolean().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Equivalent to [apply_trans(Socket, Tid, KeepOpen, 0)](#apply_trans-4).


### apply_trans/4

```erlang
-spec apply_trans(Socket, Tid, KeepOpen, Flags) -> ok | err()
                     when
                         Socket :: econfd:socket(),
                         Tid :: integer(),
                         KeepOpen :: boolean(),
                         Flags :: non_neg_integer().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Apply all in the transaction.

This is the combination of validate/prepare/commit done in the right order.


### attach/3

```erlang
-spec attach(Socket, Ns, Tctx) -> ok | err()
                when
                    Socket :: econfd:socket(),
                    Ns :: econfd:namespace() | 0,
                    Tctx :: econfd:confd_trans_ctx().
```

Related types: [err()](#err-0), [econfd:confd\_trans\_ctx()](econfd.md#confd_trans_ctx-0), [econfd:namespace()](econfd.md#namespace-0), [econfd:socket()](econfd.md#socket-0)

Attach to a running transaction.

Give NameSpace as 0 if it doesn't matter (-1 works too but is deprecated).


### attach2/4

```erlang
-spec attach2(Socket, Ns, USid, Thandle) -> ok | err()
                 when
                     Socket :: econfd:socket(),
                     Ns :: econfd:namespace() | 0,
                     USid :: integer(),
                     Thandle :: integer().
```

Related types: [err()](#err-0), [econfd:namespace()](econfd.md#namespace-0), [econfd:socket()](econfd.md#socket-0)

Attach to a running transaction. Give NameSpace as 0 if it doesn't matter (-1 works too but is deprecated).


### attach_init/1

```erlang
-spec attach_init(Socket) -> Result
                     when
                         Socket :: econfd:socket(),
                         Result :: {ok, Thandle} | err().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Attach to the CDB init/upgrade transaction in phase0.

Returns the transaction handle to use in subsequent maapi calls on success.


### authenticate/4

```erlang
-spec authenticate(Socket, User, Pass, Groups) -> ok | err()
                      when
                          Socket :: econfd:socket(),
                          User :: binary(),
                          Pass :: binary(),
                          Groups :: [binary()].
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Autenticate a user using ConfD AAA.


### authenticate2/8

```erlang
-spec authenticate2(Socket, User, Pass, SrcIp, SrcPort, Context, Proto,
                    Groups) ->
                       ok | err()
                       when
                           Socket :: econfd:socket(),
                           User :: binary(),
                           Pass :: binary(),
                           SrcIp :: econfd:ip(),
                           SrcPort :: non_neg_integer(),
                           Context :: binary(),
                           Proto :: integer(),
                           Groups :: [binary()].
```

Related types: [err()](#err-0), [econfd:ip()](econfd.md#ip-0), [econfd:socket()](econfd.md#socket-0)

Autenticate a user using ConfD AAA.


### bool2int/1

```erlang
bool2int(_)
```

### candidate_abort_commit/1

```erlang
-spec candidate_abort_commit(Socket) -> ok | err()
                                when Socket :: econfd:socket().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Equivalent to [candidate_abort_commit(Socket, <<>>)](#candidate_abort_commit-2).


### candidate_abort_commit/2

```erlang
-spec candidate_abort_commit(Socket, PersistId) -> ok | err()
                                when
                                    Socket :: econfd:socket(),
                                    PersistId :: binary().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Cancel persistent confirmed commit.


### candidate_commit/1

```erlang
-spec candidate_commit(Socket) -> ok | err()
                          when Socket :: econfd:socket().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Equivalent to [candidate_commit_info(Socket, undefined, <<>>, <<>>)](#candidate_commit_info-4).

Copies candidate to running or confirms a confirmed commit.


### candidate_commit/2

```erlang
-spec candidate_commit(Socket, PersistId) -> ok | err()
                          when
                              Socket :: econfd:socket(),
                              PersistId :: binary().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Equivalent to [candidate_commit_info(Socket, PersistId, <<>>, <<>>)](#candidate_commit_info-4).

Confirms persistent confirmed commit.


### candidate_commit_info/3

```erlang
-spec candidate_commit_info(Socket, Label, Comment) -> ok | err()
                               when
                                   Socket :: econfd:socket(),
                                   Label :: binary(),
                                   Comment :: binary().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Equivalent to [candidate_commit_info(Socket, undefined, Label, Comment)](#candidate_commit_info-4).

Like `candidate_commit/1`, but set the "Label" and/or "Comment" that is stored in the rollback file when the candidate is committed to running.

To set only the "Label", give Comment as an empty binary, and to set only the "Comment", give Label as an empty binary.

Note: To ensure that the "Label" and/or "Comment" are stored in the rollback file in all cases when doing a confirmed commit, they must be given both with the confirmed commit (using `candidate_confirmed_commit_info/4`) and with the confirming commit (using this function).


### candidate_commit_info/4

```erlang
-spec candidate_commit_info(Socket, PersistId, Label, Comment) ->
                               ok | err()
                               when
                                   Socket :: econfd:socket(),
                                   PersistId :: binary() | undefined,
                                   Label :: binary(),
                                   Comment :: binary().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Combines `candidate_commit/2` and `candidate_commit_info/3` \- set "Label" and/or "Comment" when confirming a persistent confirmed commit.

Note: To ensure that the "Label" and/or "Comment" are stored in the rollback file in all cases when doing a confirmed commit, they must be given both with the confirmed commit (using `candidate_confirmed_commit_info/6`) and with the confirming commit (using this function).


### candidate_confirmed_commit/2

```erlang
-spec candidate_confirmed_commit(Socket, TimeoutSecs) -> ok | err()
                                    when
                                        Socket :: econfd:socket(),
                                        TimeoutSecs :: integer().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Equivalent to [candidate_confirmed_commit_info(Socket, TimeoutSecs, undefined, undefined, <<>>, <<>>)](#candidate_confirmed_commit_info-6).

Copy candidate into running, but rollback if not confirmed by a call of `candidate_commit/1`.


### candidate_confirmed_commit/4

```erlang
-spec candidate_confirmed_commit(Socket, TimeoutSecs, Persist,
                                 PersistId) ->
                                    ok | err()
                                    when
                                        Socket :: econfd:socket(),
                                        TimeoutSecs :: integer(),
                                        Persist :: binary() | undefined,
                                        PersistId ::
                                            binary() | undefined.
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Equivalent to [candidate_confirmed_commit_info(Socket, TimeoutSecs, Persist, PersistId, <<>>, <<>>)](#candidate_confirmed_commit_info-6).

Starts or extends persistent confirmed commit.


### candidate_confirmed_commit_info/4

```erlang
-spec candidate_confirmed_commit_info(Socket, TimeoutSecs, Label,
                                      Comment) ->
                                         ok | err()
                                         when
                                             Socket :: econfd:socket(),
                                             TimeoutSecs :: integer(),
                                             Label :: binary(),
                                             Comment :: binary().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Equivalent to [candidate_confirmed_commit_info(Socket, TimeoutSecs, undefined, undefined, Label, Comment)](#candidate_confirmed_commit_info-6).

Like `candidate_confirmed_commit/2`, but set the "Label" and/or "Comment" that is stored in the rollback file when the candidate is committed to running.

To set only the "Label", give Comment as an empty binary, and to set only the "Comment", give Label as an empty binary.

Note: To ensure that the "Label" and/or "Comment" are stored in the rollback file in all cases when doing a confirmed commit, they must be given both with the confirmed commit (using this function) and with the confirming commit (using `candidate_commit_info/3`).


### candidate_confirmed_commit_info/6

```erlang
-spec candidate_confirmed_commit_info(Socket, TimeoutSecs, Persist,
                                      PersistId, Label, Comment) ->
                                         ok | err()
                                         when
                                             Socket :: econfd:socket(),
                                             TimeoutSecs :: integer(),
                                             Persist ::
                                                 binary() | undefined,
                                             PersistId ::
                                                 binary() | undefined,
                                             Label :: binary(),
                                             Comment :: binary().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Combines `candidate_confirmed_commit/4` and `candidate_confirmed_commit_info/4` \- set "Label" and/or "Comment" when starting or extending a persistent confirmed commit.

Note: To ensure that the "Label" and/or "Comment" are stored in the rollback file in all cases when doing a confirmed commit, they must be given both with the confirmed commit (using this function) and with the confirming commit (using `candidate_commit_info/4`).


### candidate_reset/1

```erlang
-spec candidate_reset(Socket) -> ok | err()
                         when Socket :: econfd:socket().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Copy running into candidate.


### candidate_validate/1

```erlang
-spec candidate_validate(Socket) -> ok | err()
                            when Socket :: econfd:socket().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Validate the candidate config.


### cli_prompt/4

```erlang
-spec cli_prompt(Socket, USid, Prompt, Echo) -> {ok, binary()} | err()
                    when
                        Socket :: econfd:socket(),
                        USid :: integer(),
                        Prompt :: binary(),
                        Echo :: boolean().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Prompt CLI user for a reply.


### cli_prompt/5

```erlang
-spec cli_prompt(Socket, USid, Prompt, Echo, Timeout) ->
                    {ok, binary()} | err()
                    when
                        Socket :: econfd:socket(),
                        USid :: integer(),
                        Prompt :: binary(),
                        Echo :: boolean(),
                        Timeout :: non_neg_integer().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Prompt CLI user for a reply - return error if no reply is received within Timeout seconds.


### cli_prompt_oneof/4

```erlang
-spec cli_prompt_oneof(Socket, USid, Prompt, Choice) ->
                          {ok, binary()} | err()
                          when
                              Socket :: econfd:socket(),
                              USid :: integer(),
                              Prompt :: binary(),
                              Choice :: binary().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Prompt CLI user for a reply.


### cli_prompt_oneof/5

```erlang
-spec cli_prompt_oneof(Socket, USid, Prompt, Choice, Timeout) ->
                          {ok, binary()} | err()
                          when
                              Socket :: econfd:socket(),
                              USid :: integer(),
                              Prompt :: binary(),
                              Choice :: binary(),
                              Timeout :: non_neg_integer().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Prompt CLI user for a reply - return error if no reply is received within Timeout seconds.


### cli_read_eof/3

```erlang
-spec cli_read_eof(Socket, USid, Echo) -> {ok, binary()} | err()
                      when
                          Socket :: econfd:socket(),
                          USid :: integer(),
                          Echo :: boolean().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Read data from CLI until EOF.


### cli_read_eof/4

```erlang
-spec cli_read_eof(Socket, USid, Echo, Timeout) ->
                      {ok, binary()} | err()
                      when
                          Socket :: econfd:socket(),
                          USid :: integer(),
                          Echo :: boolean(),
                          Timeout :: non_neg_integer().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Read data from CLI until EOF - return error if no reply is received within Timeout seconds.


### cli_write/3

```erlang
-spec cli_write(Socket, USid, Message) -> ok | err()
                   when
                       Socket :: econfd:socket(),
                       USid :: integer(),
                       Message :: binary().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Write mesage to the CLI.


### close/1

```erlang
-spec close(Socket) -> Result
               when
                   Socket :: econfd:socket(),
                   Result :: ok | {error, econfd:error_reason()}.
```

Related types: [econfd:error\_reason()](econfd.md#error_reason-0), [econfd:socket()](econfd.md#socket-0)

Close socket.


### commit_trans/2

```erlang
-spec commit_trans(Socket, Tid) -> ok | err()
                      when Socket :: econfd:socket(), Tid :: integer().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Commit a transaction.


### commit_upgrade/1

```erlang
-spec commit_upgrade(Socket) -> ok | err()
                        when Socket :: econfd:socket().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Commit in-service upgrade.


### confirmed_commit_in_progress/1

```erlang
-spec confirmed_commit_in_progress(Socket) -> Result
                                      when
                                          Socket :: econfd:socket(),
                                          Result ::
                                              {ok, boolean()} | err().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Is a confirmed commit in progress.


### connect/1

```erlang
-spec connect(Path) -> econfd:connect_result() when Path :: string().
```

Related types: [econfd:connect\_result()](econfd.md#connect_result-0)

Connect a maapi socket to ConfD.


### connect/2

```erlang
-spec connect(Address, Port) -> econfd:connect_result()
                 when Address :: econfd:ip(), Port :: non_neg_integer().
```

Related types: [econfd:connect\_result()](econfd.md#connect_result-0), [econfd:ip()](econfd.md#ip-0)

Connect a maapi socket to ConfD.


### copy/3

```erlang
-spec copy(Socket, FromTH, ToTH) -> ok | err()
              when
                  Socket :: econfd:socket(),
                  FromTH :: integer(),
                  ToTH :: integer().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Copy data from one transaction to another.


### copy_running_to_startup/1

```erlang
-spec copy_running_to_startup(Socket) -> ok | err()
                                 when Socket :: econfd:socket().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Copy running to startup.


### copy_tree/4

```erlang
-spec copy_tree(Socket, Tid, FromIKeypath, ToIKeypath) -> ok | err()
                   when
                       Socket :: econfd:socket(),
                       Tid :: integer(),
                       FromIKeypath :: econfd:ikeypath(),
                       ToIKeypath :: econfd:ikeypath().
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0)

Copy an entire subtree in the configuration from one point to another.


### create/3

```erlang
-spec create(Socket, Tid, IKeypath) -> ok | err()
                when
                    Socket :: econfd:socket(),
                    Tid :: integer(),
                    IKeypath :: econfd:ikeypath().
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0)

Create a new element.


### delete/3

```erlang
-spec delete(Socket, Tid, IKeypath) -> ok | err()
                when
                    Socket :: econfd:socket(),
                    Tid :: integer(),
                    IKeypath :: econfd:ikeypath().
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0)

Delete an element.


### delete_config/2

```erlang
-spec delete_config(Socket, DbName) -> ok | err()
                       when
                           Socket :: econfd:socket(), DbName :: dbname().
```

Related types: [dbname()](#dbname-0), [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Delete all data from a data store.


### des_key/4

```erlang
des_key(DesKey1, DesKey2, DesKey3, DesIVec)
```

### detach/2

```erlang
-spec detach(Socket, Thandle) -> ok | err()
                when Socket :: econfd:socket(), Thandle :: integer().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Detach from the transaction.


### diff_iterate/4

```erlang
diff_iterate(Sock, Tid, Fun, InitState)
```

Equivalent to [diff_iterate(Sock, Tid, Fun, 0, InitState)](#diff_iterate-5).


### diff_iterate/5

```erlang
-spec diff_iterate(Socket, Tid, Fun, Flags, State) -> Result
                      when
                          Socket :: econfd:socket(),
                          Tid :: integer(),
                          Fun ::
                              fun((IKeypath, Op, OldValue, Value, State) ->
                                      {ok, Ret, State} | {error, term()}),
                          Flags :: non_neg_integer(),
                          State :: term(),
                          Result :: {ok, State} | {error, term()}.
```

Related types: [econfd:socket()](econfd.md#socket-0)

Iterate through a diff.

This function is used in combination with the notifications API where we get a chance to iterate through the diff of a transaction just before it gets commited. The transaction hangs until we have called `econfd_notif:notification_done/2`. The function can also be called from within validate() callbacks to traverse a diff while validating. Currently OldValue is always the atom 'undefined'. When Op == ?MOP_MOVED_AFTER (only for "ordered-by user" list entry), Value == \{\} means that the entry was moved first in the list, otherwise Value is a econfd:key() tuple that identifies the entry it was moved after.


### do_connect/1

```erlang
do_connect(SockAddr)
```

### end_progress_span/3

```erlang
-spec end_progress_span(Socket, SpanId1, Annotation) -> Result
                           when
                               Socket :: econfd:socket(),
                               SpanId1 :: binary(),
                               Annotation :: iolist(),
                               Result ::
                                   {ok,
                                    {SpanId2 :: binary() | undefined,
                                     TraceId :: binary() | undefined}}.
```

Related types: [econfd:socket()](econfd.md#socket-0)

### end_user_session/1

```erlang
-spec end_user_session(Socket) -> ok | err()
                          when Socket :: econfd:socket().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Ends a user session.


### exists/3

```erlang
-spec exists(Socket, Tid, IKeypath) -> Result
                when
                    Socket :: econfd:socket(),
                    Tid :: integer(),
                    IKeypath :: econfd:ikeypath(),
                    Result :: {ok, boolean()} | err().
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0)

Check if an element exists.


### find_next/3

```erlang
-spec find_next(Cursor, Type, Key) -> Result
                   when
                       Cursor :: maapi_cursor(),
                       Type :: find_next_type(),
                       Key :: econfd:key(),
                       Result ::
                           {ok, econfd:key(), Cursor} | done | err().
```

Related types: [err()](#err-0), [find\_next\_type()](#find_next_type-0), [maapi\_cursor()](#maapi_cursor-0), [econfd:key()](econfd.md#key-0)

find the list entry matching Type and Key.


### finish_trans/2

```erlang
-spec finish_trans(Socket, Tid) -> ok | err()
                      when Socket :: econfd:socket(), Tid :: integer().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Finish a transaction.


### get_attrs/4

```erlang
-spec get_attrs(Socket, Tid, IKeypath, AttrList) -> Result
                   when
                       Socket :: econfd:socket(),
                       Tid :: integer(),
                       IKeypath :: econfd:ikeypath(),
                       AttrList :: [Attr],
                       Result :: {ok, [{Attr, Value}]} | err().
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0)

Get the selected attributes for an element.

Calling with an empty attribute list returns all attributes.


### get_authorization_info/2

```erlang
-spec get_authorization_info(Socket, USid) -> Result
                                when
                                    Socket :: econfd:socket(),
                                    USid :: integer(),
                                    Result :: {ok, Info} | err().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Get authorization info for a user session.


### get_case/4

```erlang
-spec get_case(Socket, Tid, IKeypath, Choice) -> Result
                  when
                      Socket :: econfd:socket(),
                      Tid :: integer(),
                      IKeypath :: econfd:ikeypath(),
                      Choice :: econfd:qtag() | [econfd:qtag()],
                      Result :: {ok, Case} | err().
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:qtag()](econfd.md#qtag-0), [econfd:socket()](econfd.md#socket-0)

Get the current case for a choice.


### get_elem/3

```erlang
-spec get_elem(Socket, Tid, IKeypath) -> Result
                  when
                      Socket :: econfd:socket(),
                      Tid :: integer(),
                      IKeypath :: econfd:ikeypath(),
                      Result :: {ok, econfd:value()} | err().
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0), [econfd:value()](econfd.md#value-0)

Read an element.


### get_elem_no_defaults/3

```erlang
-spec get_elem_no_defaults(Socket, Tid, IKeypath) -> Result
                              when
                                  Socket :: econfd:socket(),
                                  Tid :: integer(),
                                  IKeypath :: econfd:ikeypath(),
                                  Result :: {ok, Value} | err().
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0)

Read an element, but return 'default' instead of the value if the default value is in effect.


### get_my_user_session_id/1

```erlang
-spec get_my_user_session_id(Socket) -> Result
                                when
                                    Socket :: econfd:socket(),
                                    Result :: {ok, USid} | err().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Get my user session id.


### get_next/1

```erlang
-spec get_next(Cursor) -> Result
                  when
                      Cursor :: maapi_cursor(),
                      Result ::
                          {ok, econfd:key(), Cursor} | done | err().
```

Related types: [err()](#err-0), [maapi\_cursor()](#maapi_cursor-0), [econfd:key()](econfd.md#key-0)

iterate through the entries of a list.


### get_object/3

```erlang
-spec get_object(Socket, Tid, IKeypath) -> Result
                    when
                        Socket :: econfd:socket(),
                        Tid :: integer(),
                        IKeypath :: econfd:ikeypath(),
                        Result :: {ok, [econfd:value()]} | err().
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0), [econfd:value()](econfd.md#value-0)

Read all the values in a container or list entry.


### get_objects/2

```erlang
-spec get_objects(Cursor, NumEntries) -> Result
                     when
                         Cursor :: maapi_cursor(),
                         NumEntries :: integer(),
                         Result ::
                             {ok, Cursor, Values} |
                             {done, Values} |
                             err().
```

Related types: [err()](#err-0), [maapi\_cursor()](#maapi_cursor-0)

Read all the values for NumEntries list entries, starting at the point given by the cursor C.

The return value has one Erlang list for each YANG list entry, i.e. it is a list of at most NumEntries lists. If we reached the end of the YANG list, \{done, Values\} is returned, and there will be fewer than NumEntries lists in Values - otherwise \{ok, C2, Values\} is returned, where C2 can be used to continue the traversal.


### get_rollback_id/2

```erlang
-spec get_rollback_id(Socket, Tid) -> non_neg_integer() | -1
                         when
                             Socket :: econfd:socket(), Tid :: integer().
```

Related types: [econfd:socket()](econfd.md#socket-0)

Get rollback id of commited transaction.


### get_running_db_status/1

```erlang
-spec get_running_db_status(Socket) -> Result
                               when
                                   Socket :: econfd:socket(),
                                   Result :: {ok, Status} | err().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Get the "running status".


### get_user_session/2

```erlang
-spec get_user_session(Socket, USid) -> Result
                          when
                              Socket :: econfd:socket(),
                              USid :: integer(),
                              Result :: {ok, confd_user_info()} | err().
```

Related types: [confd\_user\_info()](#confd_user_info-0), [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Get session info for a user session.


### get_user_sessions/1

```erlang
-spec get_user_sessions(Socket) -> Result
                           when
                               Socket :: econfd:socket(),
                               Result :: {ok, [USid]} | err().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Get all user sessions.


### get_values/4

```erlang
-spec get_values(Socket, Tid, IKeypath, Values) -> Result
                    when
                        Socket :: econfd:socket(),
                        Tid :: integer(),
                        IKeypath :: econfd:ikeypath(),
                        Values :: [econfd:tagval()],
                        Result :: {ok, [econfd:tagval()]} | err().
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0), [econfd:tagval()](econfd.md#tagval-0)

Read the values for the leafs that have the "value" 'not_found' in the Values list.

This can be used to read an arbitrary set of sub-elements of a container or list entry. The return value is a list of the same length as Values, i.e. the requested leafs are in the same position in the returned list as in the Values argument. The elements in the returned list are always "canonical" though, i.e. of the form [`econfd:tagval()`](econfd.md#tagval-0).


### hide_group/3

```erlang
-spec hide_group(Socket, Tid, GroupName) -> ok | err()
                    when
                        Socket :: econfd:socket(),
                        Tid :: integer(),
                        GroupName :: binary().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Do hide a hide group.

Hide all nodes belonging to a hide group in a transaction that started with flag FLAG_HIDE_ALL_HIDEGROUPS.


### hkeypath2ikeypath/2

```erlang
-spec hkeypath2ikeypath(Socket, HKeypath) -> Result
                           when
                               Socket :: econfd:socket(),
                               HKeypath :: [non_neg_integer()],
                               Result :: {ok, IKeypath} | err().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Convert a hkeypath to an ikeypath.


### ibool/1

```erlang
ibool(X)
```

### init_cursor/3

```erlang
-spec init_cursor(Socket, Tid, IKeypath) -> maapi_cursor()
                     when
                         Socket :: econfd:socket(),
                         Tid :: integer(),
                         IKeypath :: econfd:ikeypath().
```

Related types: [maapi\_cursor()](#maapi_cursor-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0)

Equivalent to [init_cursor(Socket, Tik, IKeypath, undefined)](#init_cursor-4).


### init_cursor/4

```erlang
-spec init_cursor(Socket, Tid, IKeypath, XPath) -> maapi_cursor()
                     when
                         Socket :: econfd:socket(),
                         Tid :: integer(),
                         IKeypath :: econfd:ikeypath(),
                         XPath :: undefined | binary() | string().
```

Related types: [maapi\_cursor()](#maapi_cursor-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0)

Initalize a get_next() cursor.


### init_upgrade/3

```erlang
-spec init_upgrade(Socket, TimeoutSecs, Flags) -> ok | err()
                      when
                          Socket :: econfd:socket(),
                          TimeoutSecs :: integer(),
                          Flags :: non_neg_integer().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Start in-service upgrade.


### insert/3

```erlang
-spec insert(Socket, Tid, IKeypath) -> ok | err()
                when
                    Socket :: econfd:socket(),
                    Tid :: integer(),
                    IKeypath :: econfd:ikeypath().
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0)

Insert an entry in an integer-keyed list.


### install_crypto_keys/1

```erlang
-spec install_crypto_keys(Socket) -> ok | err()
                             when Socket :: econfd:socket().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Fetch keys for the encrypted data types from the server.

Encrypted data type can be tailf:aes-cfb-128-encrypted-string and tailf:aes-256-cfb-128-encrypted-string.


### is_candidate_modified/1

```erlang
-spec is_candidate_modified(Socket) -> Result
                               when
                                   Socket :: econfd:socket(),
                                   Result :: {ok, boolean()} | err().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Check if candidate has been modified.


### is_lock_set/2

```erlang
-spec is_lock_set(Socket, DbName) -> Result
                     when
                         Socket :: econfd:socket(),
                         DbName :: dbname(),
                         Result :: {ok, integer()} | err().
```

Related types: [dbname()](#dbname-0), [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Check if a db is locked or not.

Return 0 or the Usid of the lock owner.


### is_running_modified/1

```erlang
-spec is_running_modified(Socket) -> Result
                             when
                                 Socket :: econfd:socket(),
                                 Result :: {ok, boolean()} | err().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Check if running has been modified since the last copy to startup was done.


### iterate/6

```erlang
-spec iterate(Socket, Tid, IKeypath, Fun, Flags, State) -> Result
                 when
                     Socket :: econfd:socket(),
                     Tid :: integer(),
                     IKeypath :: econfd:ikeypath(),
                     Fun ::
                         fun((IKeypath, Value, Attrs, State) ->
                                 {ok, Ret, State} | {error, term()}),
                     Flags :: non_neg_integer(),
                     State :: term(),
                     Result :: {ok, State} | {error, term()}.
```

Related types: [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0)

Iterate over all the data in the transaction and the underlying data store.

Flags can be given as ?MAAPI_ITER_WANT_ATTR to request that attributes (if any) are passed to the Fun, otherwise it should be 0. The possible values for Ret in the return value for Fun are the same as for `diff_iterate/5`.


### iterate_result/3

```erlang
iterate_result(Sock, Fun, _)
```

### keypath_diff_iterate/5

```erlang
-spec keypath_diff_iterate(Socket, Tid, IKeypath, Fun, State) -> Result
                              when
                                  Socket :: econfd:socket(),
                                  Tid :: integer(),
                                  IKeypath :: econfd:ikeypath(),
                                  Fun ::
                                      fun((IKeypath, Op, OldValue,
                                           Value, State) ->
                                              {ok, Ret, State} |
                                              {error, term()}),
                                  State :: term(),
                                  Result ::
                                      {ok, State} | {error, term()}.
```

Related types: [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0)

Iterate through a diff.

This function behaves like `diff_iterate/5` with the exception that the provided keypath IKP, prunes the tree and only diffs below that path are considered.


### keypath_diff_iterate/6

```erlang
keypath_diff_iterate(Sock, Tid, IKP, Fun, Flags, InitState)
```

### kill_user_session/2

```erlang
-spec kill_user_session(Socket, USid) -> ok | err()
                           when
                               Socket :: econfd:socket(),
                               USid :: integer().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Kill a user session.


### lock/2

```erlang
-spec lock(Socket, DbName) -> ok | err()
              when Socket :: econfd:socket(), DbName :: dbname().
```

Related types: [dbname()](#dbname-0), [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Lock a database.


### lock_partial/3

```erlang
-spec lock_partial(Socket, DbName, XPath) -> Result
                      when
                          Socket :: econfd:socket(),
                          DbName :: dbname(),
                          XPath :: [binary()],
                          Result :: {ok, LockId} | err().
```

Related types: [dbname()](#dbname-0), [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Request a partial lock on a database.

The set of nodes to lock is specified as a list of XPath expressions.


### mk_uident/1

```erlang
mk_uident(UId)
```

### move/4

```erlang
-spec move(Socket, Tid, IKeypath, ToKey) -> ok | err()
              when
                  Socket :: econfd:socket(),
                  Tid :: integer(),
                  IKeypath :: econfd:ikeypath(),
                  ToKey :: econfd:key().
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:key()](econfd.md#key-0), [econfd:socket()](econfd.md#socket-0)

Move (rename) an entry in a list.


### move_ordered/4

```erlang
-spec move_ordered(Socket, Tid, IKeypath, To) -> ok | err()
                      when
                          Socket :: econfd:socket(),
                          Tid :: integer(),
                          IKeypath :: econfd:ikeypath(),
                          To ::
                              first | last |
                              {before | 'after', econfd:key()}.
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:key()](econfd.md#key-0), [econfd:socket()](econfd.md#socket-0)

Move an entry in an "ordered-by user" list.


### ncs_apply_template/7

```erlang
-spec ncs_apply_template(Socket, Tid, TemplateName, RootIKeypath,
                         Variables, Documents, Shared) ->
                            ok | err()
                            when
                                Socket :: econfd:socket(),
                                Tid :: integer(),
                                TemplateName :: binary(),
                                RootIKeypath :: econfd:ikeypath(),
                                Variables :: term(),
                                Documents :: term(),
                                Shared :: boolean().
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0)

Apply a template that has been loaded into NCS.

The TemplateName parameter gives the name of the template. The Variables parameter is a list of variables and names for substitution into the template.


### ncs_apply_trans_params/4

```erlang
-spec ncs_apply_trans_params(Socket, Tid, KeepOpen, Params) -> Result
                                when
                                    Socket :: econfd:socket(),
                                    Tid :: integer(),
                                    KeepOpen :: boolean(),
                                    Params :: [econfd:tagval()],
                                    Result ::
                                        ok |
                                        {ok, [econfd:tagval()]} |
                                        err().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0), [econfd:tagval()](econfd.md#tagval-0)

Apply transaction with commit parameters.

This is a version of apply_trans that takes commit parameters in form of a list of tagged values according to the input parameters for rpc prepare-transaction as defined in tailf-netconf-ncs.yang module. The result of this function may include a list of tagged values according to the output parameters of rpc prepare-transaction or output parameters of rpc commit-transaction as defined in tailf-netconf-ncs.yang module.


### ncs_get_trans_params/2

```erlang
-spec ncs_get_trans_params(Socket, Tid) -> Result
                              when
                                  Socket :: econfd:socket(),
                                  Tid :: integer(),
                                  Result ::
                                      {ok, [econfd:tagval()]} | err().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0), [econfd:tagval()](econfd.md#tagval-0)

Get transaction commit parameters.


### ncs_template_variables/2

```erlang
-spec ncs_template_variables(Socket, TemplateName) ->
                                {ok, binary()} | err()
                                when
                                    Socket :: econfd:socket(),
                                    TemplateName :: binary().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Retrieve the variables used in a template.


### ncs_template_variables/3

```erlang
-spec ncs_template_variables(Socket, TemplateName, Type) ->
                                {ok, binary()} | err()
                                when
                                    Socket :: econfd:socket(),
                                    TemplateName :: string(),
                                    Type :: template_type().
```

Related types: [err()](#err-0), [template\_type()](#template_type-0), [econfd:socket()](econfd.md#socket-0)

Retrieve the variables used in a template.


### ncs_templates/1

```erlang
-spec ncs_templates(Socket) -> {ok, binary()} | err()
                       when Socket :: econfd:socket().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Retrieve a list of the templates currently loaded into NCS.


### ncs_write_service_log_entry/5

```erlang
-spec ncs_write_service_log_entry(Socket, IKeypath, Message, Type,
                                  Level) ->
                                     ok | err()
                                     when
                                         Socket :: econfd:socket(),
                                         IKeypath :: econfd:ikeypath(),
                                         Message :: string(),
                                         Type :: econfd:value(),
                                         Level :: econfd:value().
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0), [econfd:value()](econfd.md#value-0)

Write a service log entry.


### netconf_ssh_call_home/3

```erlang
-spec netconf_ssh_call_home(Socket, Host, Port) -> ok | err()
                               when
                                   Socket :: econfd:socket(),
                                   Host :: econfd:ip() | string(),
                                   Port :: non_neg_integer().
```

Related types: [err()](#err-0), [econfd:ip()](econfd.md#ip-0), [econfd:socket()](econfd.md#socket-0)

### netconf_ssh_call_home_opaque/4

```erlang
-spec netconf_ssh_call_home_opaque(Socket, Host, Opaque, Port) ->
                                      ok | err()
                                      when
                                          Socket :: econfd:socket(),
                                          Host :: econfd:ip() | string(),
                                          Opaque :: string(),
                                          Port :: non_neg_integer().
```

Related types: [err()](#err-0), [econfd:ip()](econfd.md#ip-0), [econfd:socket()](econfd.md#socket-0)

### num_instances/3

```erlang
-spec num_instances(Socket, Tid, IKeypath) -> Result
                       when
                           Socket :: econfd:socket(),
                           Tid :: non_neg_integer(),
                           IKeypath :: econfd:ikeypath(),
                           Result :: {ok, integer()} | err().
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0)

Find the number of entries in a list.


### perform_upgrade/2

```erlang
-spec perform_upgrade(Socket, LoadPathList) -> ok | err()
                         when
                             Socket :: econfd:socket(),
                             LoadPathList :: [binary()].
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Do in-service upgrade.


### prepare_trans/2

```erlang
-spec prepare_trans(Socket, Tid) -> ok | err()
                       when Socket :: econfd:socket(), Tid :: integer().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Equivalent to [prepare_trans(Socket, Tid, 0)](#prepare_trans-3).


### prepare_trans/3

```erlang
-spec prepare_trans(Socket, Tid, Flags) -> ok | err()
                       when
                           Socket :: econfd:socket(),
                           Tid :: integer(),
                           Flags :: non_neg_integer().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Prepare for commit.


### prio_message/3

```erlang
-spec prio_message(Socket, To, Message) -> ok | err()
                      when
                          Socket :: econfd:socket(),
                          To :: binary(),
                          Message :: binary().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Write priority message.


### progress_info/6

```erlang
-spec progress_info(Socket, Verbosity, Msg, SIKP, Attrs, Links) -> ok
                       when
                           Socket :: econfd:socket(),
                           Verbosity :: verbosity(),
                           Msg :: iolist(),
                           SIKP :: econfd:ikeypath(),
                           Attrs ::
                               [{K :: binary(),
                                 V :: binary() | integer()}],
                           Links ::
                               [{TraceId :: binary() | undefined,
                                 SpanId :: binary() | undefined}].
```

Related types: [verbosity()](#verbosity-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0)

### progress_info_th/7

```erlang
-spec progress_info_th(Socket, Tid, Verbosity, Msg, SIKP, Attrs, Links) ->
                          ok
                          when
                              Socket :: econfd:socket(),
                              Tid :: integer(),
                              Verbosity :: verbosity(),
                              Msg :: iolist(),
                              SIKP :: econfd:ikeypath(),
                              Attrs ::
                                  [{K :: binary(),
                                    V :: binary() | integer()}],
                              Links ::
                                  [{TraceId :: binary() | undefined,
                                    SpanId :: binary() | undefined}].
```

Related types: [verbosity()](#verbosity-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0)

### reload_config/1

```erlang
-spec reload_config(Socket) -> ok | err() when Socket :: econfd:socket().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Tell ConfD daemon to reload its configuration.


### request_action/3

```erlang
-spec request_action(Socket, Params, IKeypath) -> Result
                        when
                            Socket :: econfd:socket(),
                            Params :: [econfd:tagval()],
                            IKeypath :: econfd:ikeypath(),
                            Result ::
                                ok | {ok, [econfd:tagval()]} | err().
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0), [econfd:tagval()](econfd.md#tagval-0)

Invoke an action defined in the data model.


### request_action_th/4

```erlang
-spec request_action_th(Socket, Tid, Params, IKeypath) -> Result
                           when
                               Socket :: econfd:socket(),
                               Tid :: integer(),
                               Params :: [econfd:tagval()],
                               IKeypath :: econfd:ikeypath(),
                               Result ::
                                   ok | {ok, [econfd:tagval()]} | err().
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0), [econfd:tagval()](econfd.md#tagval-0)

Invoke an action defined in the data model using the provided transaction.

Does the same thing as request_action/3, but uses the current namespace, the path position, and the user session from the transaction indicated by the 'Tid' handle.


### reverse/1

```erlang
reverse(X)
```

### revert/2

```erlang
-spec revert(Socket, Tid) -> ok | err()
                when Socket :: econfd:socket(), Tid :: integer().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Remove all changes in the transaction.


### set_attr/5

```erlang
-spec set_attr(Socket, Tid, IKeypath, Attr, Value) -> ok | err()
                  when
                      Socket :: econfd:socket(),
                      Tid :: integer(),
                      IKeypath :: econfd:ikeypath(),
                      Attr :: integer(),
                      Value :: econfd:value() | undefined.
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0), [econfd:value()](econfd.md#value-0)

Set the an attribute for an element. Value == undefined means that the attribute should be deleted.


### set_comment/3

```erlang
-spec set_comment(Socket, Tid, Comment) -> ok | err()
                     when
                         Socket :: econfd:socket(),
                         Tid :: integer(),
                         Comment :: binary().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Set the "Comment" that is stored in the rollback file when a transaction towards running is committed.


### set_delayed_when/3

```erlang
-spec set_delayed_when(Socket, Tid, Value) -> Result
                          when
                              Socket :: econfd:socket(),
                              Tid :: integer(),
                              Value :: boolean(),
                              Result :: {ok, OldValue} | err().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Enable/disable the "delayed when" mode for a transaction.

Returns the old setting on success.


### set_elem/4

```erlang
-spec set_elem(Socket, Tid, IKeypath, Value) -> ok | err()
                  when
                      Socket :: econfd:socket(),
                      Tid :: integer(),
                      IKeypath :: econfd:ikeypath(),
                      Value :: econfd:value().
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0), [econfd:value()](econfd.md#value-0)

Write an element.


### set_elem2/4

```erlang
-spec set_elem2(Socket, Tid, IKeypath, BinValue) -> ok | err()
                   when
                       Socket :: econfd:socket(),
                       Tid :: integer(),
                       IKeypath :: econfd:ikeypath(),
                       BinValue :: binary().
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0)

Write an element using the textual value representation.


### set_flags/3

```erlang
-spec set_flags(Socket, Tid, Flags) -> ok | err()
                   when
                       Socket :: econfd:socket(),
                       Tid :: integer(),
                       Flags :: non_neg_integer().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Change flag settings for a transaction.

See ?MAAPI_FLAG_XXX in econfd.hrl for the available flags, however ?MAAPI_FLAG_HIDE_INACTIVE ?MAAPI_FLAG_DELAYED_WHEN and ?MAAPI_FLAG_HIDE_ALL_HIDEGROUPS cannot be changed after transaction start (but see `set_delayed_when/3`).


### set_label/3

```erlang
-spec set_label(Socket, Tid, Label) -> ok | err()
                   when
                       Socket :: econfd:socket(),
                       Tid :: integer(),
                       Label :: binary().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Set the "Label" that is stored in the rollback file when a transaction towards running is committed.


### set_object/4

```erlang
-spec set_object(Socket, Tid, IKeypath, ValueList) -> ok | err()
                    when
                        Socket :: econfd:socket(),
                        Tid :: integer(),
                        IKeypath :: econfd:ikeypath(),
                        ValueList :: [econfd:value()].
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0), [econfd:value()](econfd.md#value-0)

Write an entire object, i.e. YANG list entry or container.


### set_readonly_mode/2

```erlang
-spec set_readonly_mode(Socket, Mode) -> {ok, boolean()} | err()
                           when
                               Socket :: econfd:socket(),
                               Mode :: boolean().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Control if we can create rw transactions.


### set_running_db_status/2

```erlang
-spec set_running_db_status(Socket, Status) -> ok | err()
                               when
                                   Socket :: econfd:socket(),
                                   Status :: Valid | InValid.
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Set the "running status".


### set_user_session/2

```erlang
-spec set_user_session(Socket, USid) -> ok | err()
                          when
                              Socket :: econfd:socket(),
                              USid :: integer().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Assign a user session.


### set_values/4

```erlang
-spec set_values(Socket, Tid, IKeypath, ValueList) -> ok | err()
                    when
                        Socket :: econfd:socket(),
                        Tid :: integer(),
                        IKeypath :: econfd:ikeypath(),
                        ValueList :: [econfd:tagval()].
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0), [econfd:tagval()](econfd.md#tagval-0)

Write a list of tagged values.

This function is an alternative to `set_object/4`, and allows for writing more complex structures (e.g. multiple entries in a list).


### shared_create/3

```erlang
-spec shared_create(Socket, Tid, IKeypath) -> ok | err()
                       when
                           Socket :: econfd:socket(),
                           Tid :: integer(),
                           IKeypath :: econfd:ikeypath().
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0)

Create a new element, and also set an attribute indicating how many times this element has been created.


### shared_set_elem/4

```erlang
-spec shared_set_elem(Socket, Tid, IKeypath, Value) -> ok | err()
                         when
                             Socket :: econfd:socket(),
                             Tid :: integer(),
                             IKeypath :: econfd:ikeypath(),
                             Value :: econfd:value().
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0), [econfd:value()](econfd.md#value-0)

Write an element from NCS FastMap.


### shared_set_elem2/4

```erlang
-spec shared_set_elem2(Socket, Tid, IKeypath, BinValue) -> ok | err()
                          when
                              Socket :: econfd:socket(),
                              Tid :: integer(),
                              IKeypath :: econfd:ikeypath(),
                              BinValue :: binary().
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0)

Write an element using the textual value representation from NCS fastmap.


### shared_set_values/4

```erlang
-spec shared_set_values(Socket, Tid, IKeypath, ValueList) -> ok | err()
                           when
                               Socket :: econfd:socket(),
                               Tid :: integer(),
                               IKeypath :: econfd:ikeypath(),
                               ValueList :: [econfd:tagval()].
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0), [econfd:tagval()](econfd.md#tagval-0)

Write a list of tagged values from NCS FastMap.


### snmpa_reload/2

```erlang
-spec snmpa_reload(Socket, Synchronous) -> ok | err()
                      when
                          Socket :: econfd:socket(),
                          Synchronous :: boolean().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Tell ConfD to reload external SNMP Agent config data.


### start_phase/3

```erlang
-spec start_phase(Socket, Phase, Synchronous) -> ok | err()
                     when
                         Socket :: econfd:socket(),
                         Phase :: 1 | 2,
                         Synchronous :: boolean().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Tell ConfD to proceed to next start phase.


### start_progress_span/6

```erlang
-spec start_progress_span(Socket, Verbosity, Msg, SIKP, Attrs, Links) ->
                             Result
                             when
                                 Socket :: econfd:socket(),
                                 Verbosity :: verbosity(),
                                 Msg :: iolist(),
                                 SIKP :: econfd:ikeypath(),
                                 Attrs ::
                                     [{K :: binary(),
                                       V :: binary() | integer()}],
                                 Links ::
                                     [{TraceId :: binary() | undefined,
                                       SpanId1 :: binary() | undefined}],
                                 Result ::
                                     {ok,
                                      {SpanId2 :: binary() | undefined,
                                       TraceId :: binary() | undefined}}.
```

Related types: [verbosity()](#verbosity-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0)

### start_progress_span_th/7

```erlang
-spec start_progress_span_th(Socket, Tid, Verbosity, Msg, SIKP, Attrs,
                             Links) ->
                                Result
                                when
                                    Socket :: econfd:socket(),
                                    Tid :: integer(),
                                    Verbosity :: verbosity(),
                                    Msg :: iolist(),
                                    SIKP :: econfd:ikeypath(),
                                    Attrs ::
                                        [{K :: binary(),
                                          V :: binary() | integer()}],
                                    Links ::
                                        [{TraceId ::
                                              binary() | undefined,
                                          SpanId1 ::
                                              binary() | undefined}],
                                    Result ::
                                        {ok,
                                         {SpanId2 ::
                                              binary() | undefined,
                                          TraceId ::
                                              binary() | undefined}}.
```

Related types: [verbosity()](#verbosity-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0)

### start_trans/3

```erlang
-spec start_trans(Socket, DbName, RwMode) -> Result
                     when
                         Socket :: econfd:socket(),
                         DbName :: dbname(),
                         RwMode :: integer(),
                         Result :: {ok, integer()} | err().
```

Related types: [dbname()](#dbname-0), [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Start a new transaction.


### start_trans/4

```erlang
-spec start_trans(Socket, DbName, RwMode, USid) -> Result
                     when
                         Socket :: econfd:socket(),
                         DbName :: dbname(),
                         RwMode :: integer(),
                         USid :: integer(),
                         Result :: {ok, integer()} | err().
```

Related types: [dbname()](#dbname-0), [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Start a new transaction within an existing user session.


### start_trans/5

```erlang
-spec start_trans(Socket, DbName, RwMode, USid, Flags) -> Result
                     when
                         Socket :: econfd:socket(),
                         DbName :: dbname(),
                         RwMode :: integer(),
                         USid :: integer(),
                         Flags :: non_neg_integer(),
                         Result :: {ok, integer()} | err().
```

Related types: [dbname()](#dbname-0), [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Start a new transaction within an existing user session and/or with flags.

See ?MAAPI_FLAG_XXX in econfd.hrl for the available flags. To use the existing user session of the socket, give Usid = 0.


### start_trans/6

```erlang
start_trans(Sock, DbName, RwMode, Usid, Flags, UId)
```

### start_trans_in_trans/4

```erlang
-spec start_trans_in_trans(Socket, RwMode, USid, Tid) -> Result
                              when
                                  Socket :: econfd:socket(),
                                  RwMode :: integer(),
                                  USid :: integer(),
                                  Tid :: integer(),
                                  Result :: {ok, integer()} | err().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Start a new transaction with an existing transaction as backend.

To use the existing user session of the socket, give Usid = 0.


### start_trans_in_trans/5

```erlang
-spec start_trans_in_trans(Socket, RwMode, USid, Tid, Flags) -> Result
                              when
                                  Socket :: econfd:socket(),
                                  RwMode :: integer(),
                                  USid :: integer(),
                                  Tid :: integer(),
                                  Flags :: non_neg_integer(),
                                  Result :: {ok, integer()} | err().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Start a new transaction with an existing transaction as backend.

To use the existing user session of the socket, give Usid = 0.


### start_user_session/6

```erlang
-spec start_user_session(Socket, UserName, Context, Groups, SrcIp,
                         Proto) ->
                            ok | err()
                            when
                                Socket :: econfd:socket(),
                                UserName :: binary(),
                                Context :: binary(),
                                Groups :: [binary()],
                                SrcIp :: econfd:ip(),
                                Proto :: proto().
```

Related types: [err()](#err-0), [proto()](#proto-0), [econfd:ip()](econfd.md#ip-0), [econfd:socket()](econfd.md#socket-0)

Equivalent to [start_user_session(Socket, UserName, Context, Groups, SrcIp, 0, Proto)](#start_user_session-7).


### start_user_session/7

```erlang
-spec start_user_session(Socket, UserName, Context, Groups, SrcIp,
                         SrcPort, Proto) ->
                            ok | err()
                            when
                                Socket :: econfd:socket(),
                                UserName :: binary(),
                                Context :: binary(),
                                Groups :: [binary()],
                                SrcIp :: econfd:ip(),
                                SrcPort :: non_neg_integer(),
                                Proto :: proto().
```

Related types: [err()](#err-0), [proto()](#proto-0), [econfd:ip()](econfd.md#ip-0), [econfd:socket()](econfd.md#socket-0)

Equivalent to [start_user_session(Socket, UserName, Context, Groups, SrcIp, 0, Proto, undefined)](#start_user_session-8).


### start_user_session/8

```erlang
-spec start_user_session(Socket, UserName, Context, Groups, SrcIp,
                         SrcPort, Proto, UId) ->
                            ok | err()
                            when
                                Socket :: econfd:socket(),
                                UserName :: binary(),
                                Context :: binary(),
                                Groups :: [binary()],
                                SrcIp :: econfd:ip(),
                                SrcPort :: non_neg_integer(),
                                Proto :: proto(),
                                UId ::
                                    confd_user_identification() |
                                    undefined.
```

Related types: [confd\_user\_identification()](#confd_user_identification-0), [err()](#err-0), [proto()](#proto-0), [econfd:ip()](econfd.md#ip-0), [econfd:socket()](econfd.md#socket-0)

Initiate a new maapi user session.

returns a maapi session id. Before we can execute any maapi functions we must always have an associated user session.


### stop/1

```erlang
-spec stop(Socket) -> ok when Socket :: econfd:socket().
```

Related types: [econfd:socket()](econfd.md#socket-0)

Equivalent to [stop(Sock, true)](#stop-2).

Tell ConfD daemon to stop, returns when daemon has exited.


### stop/2

```erlang
-spec stop(Socket, Synchronous) -> ok
              when Socket :: econfd:socket(), Synchronous :: boolean().
```

Related types: [econfd:socket()](econfd.md#socket-0)

Tell ConfD daemon to stop, if Synchronous is true won't return until daemon has come to a halt.

Note that the socket will most certainly not be possible to use again, since ConfD will close its end when it exits.


### sys_message/3

```erlang
-spec sys_message(Socket, To, Message) -> ok | err()
                     when
                         Socket :: econfd:socket(),
                         To :: binary(),
                         Message :: binary().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Write system message.


### unhide_group/3

```erlang
-spec unhide_group(Socket, Tid, GroupName) -> ok | err()
                      when
                          Socket :: econfd:socket(),
                          Tid :: integer(),
                          GroupName :: binary().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Do unhide a hide group.

Unhide all nodes belonging to a hide group in a transaction that started with flag FLAG_HIDE_ALL_HIDEGROUPS.


### unlock/2

```erlang
-spec unlock(Socket, DbName) -> ok | err()
                when Socket :: econfd:socket(), DbName :: dbname().
```

Related types: [dbname()](#dbname-0), [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Unlock a database.


### unlock_partial/2

```erlang
-spec unlock_partial(Socket, LockId) -> ok | err()
                        when
                            Socket :: econfd:socket(),
                            LockId :: integer().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Remove the partial lock identified by LockId.


### user_message/4

```erlang
-spec user_message(Socket, To, From, Message) -> ok | err()
                      when
                          Socket :: econfd:socket(),
                          To :: binary(),
                          From :: binary(),
                          Message :: binary().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Write user message.


### validate_trans/4

```erlang
-spec validate_trans(Socket, Tid, UnLock, ForceValidation) -> ok | err()
                        when
                            Socket :: econfd:socket(),
                            Tid :: integer(),
                            UnLock :: boolean(),
                            ForceValidation :: boolean().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Validate the transaction.


### wait_start/1

```erlang
-spec wait_start(Socket) -> ok | err() when Socket :: econfd:socket().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Equivalent to [wait_start(Socket, 2)](#wait_start-2).

Wait until ConfD daemon has completely started.


### wait_start/2

```erlang
-spec wait_start(Socket, Phase) -> ok | err()
                    when Socket :: econfd:socket(), Phase :: 1 | 2.
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Wait until ConfD daemon has reached a certain start phase.


### xpath_eval/6

```erlang
-spec xpath_eval(Socket, Tid, Expr, ResultFun, State, Options) -> Result
                    when
                        Socket :: econfd:socket(),
                        Tid :: integer(),
                        Expr :: binary() | {compiled, Source, Compiled},
                        ResultFun ::
                            fun((IKeypath, Value, State) -> {Ret, State}),
                        State :: term(),
                        Options ::
                            [xpath_eval_option() | {initstate, term()}],
                        Result :: {ok, State} | err().
```

Related types: [err()](#err-0), [xpath\_eval\_option()](#xpath_eval_option-0), [econfd:socket()](econfd.md#socket-0)

Evaluate the XPath expression Expr, invoking ResultFun for each node in the resulting node set.

The possible values for Ret in the return value for ResultFun are ?ITER_CONTINUE and ?ITER_STOP.


### xpath_eval/7

```erlang
-spec xpath_eval(Socket, Tid, Expr, ResultFun, TraceFun, State, Context) ->
                    Result
                    when
                        Socket :: econfd:socket(),
                        Tid :: integer(),
                        Expr :: binary(),
                        ResultFun ::
                            fun((IKeypath, Value, State) -> {Ret, State}),
                        TraceFun ::
                            fun((binary()) -> none()) | undefined,
                        State :: term(),
                        Context :: econfd:ikeypath() | [],
                        Result :: {ok, State} | {error, term()}.
```

Related types: [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0)

Evaluate the XPath expression Expr, invoking ResultFun for each node in the resulting node set.

The possible values for Ret in the return value for ResultFun are ?ITER_CONTINUE and ?ITER_STOP.


### xpath_eval_expr/4

```erlang
-spec xpath_eval_expr(Socket, Tid, Expr, Options) -> Result
                         when
                             Socket :: econfd:socket(),
                             Tid :: integer(),
                             Expr ::
                                 binary() | {compiled, Source, Compiled},
                             Options :: [xpath_eval_option()],
                             Result :: {ok, binary()} | err().
```

Related types: [err()](#err-0), [xpath\_eval\_option()](#xpath_eval_option-0), [econfd:socket()](econfd.md#socket-0)

Evaluate the XPath expression Expr, returning the result as a string.


### xpath_eval_expr/5

```erlang
-spec xpath_eval_expr(Socket, Tid, Expr, TraceFun, Context) -> Result
                         when
                             Socket :: econfd:socket(),
                             Tid :: integer(),
                             Expr :: binary(),
                             TraceFun ::
                                 fun((binary()) -> none()) | undefined,
                             Context :: econfd:ikeypath() | [],
                             Result :: {ok, binary()} | err().
```

Related types: [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:socket()](econfd.md#socket-0)

Evaluate the XPath expression Expr, returning the result as a string.


### xpath_eval_expr_loop/2

```erlang
xpath_eval_expr_loop(Sock, TraceFun)
```

### xpath_eval_loop/4

```erlang
xpath_eval_loop(Sock, ResultFun, TraceFun, State)
```
