# Module econfd

An Erlang interface equivalent to the confd_lib_dp C-API (documented in confd_lib_dp(3)).

This module is used to connect to ConfD and provide callback functions so that ConfD can populate its northbound agent interfaces with external data. Thus the library consists of a number of API functions whose purpose is to install different callback functions at different points in the XML tree which is the representation of the device configuration. Read more about callpoints in the ConfD User Guide.


## Types

### address/0

```erlang
-type address() :: #econfd_conn_ip{} | #econfd_conn_local{}.
```

### cb_action/0

```erlang
-type cb_action() ::
          cb_action_act() | cb_action_cmd() | cb_action_init().
```

Related types: [cb\_action\_act()](#cb_action_act-0), [cb\_action\_cmd()](#cb_action_cmd-0), [cb\_action\_init()](#cb_action_init-0)

It is the callback for #confd_action_cb.action


### cb_action_act/0

```erlang
-type cb_action_act() ::
          fun((U :: #confd_user_info{},
               Name :: qtag(),
               KP :: ikeypath(),
               [Param :: tagval()]) ->
                  ok |
                  {ok, [Result :: tagval()]} |
                  {error, error_reason()}).
```

Related types: [error\_reason()](#error_reason-0), [ikeypath()](#ikeypath-0), [qtag()](#qtag-0), [tagval()](#tagval-0)

It is the callback for #confd_action_cb.action when invoked as an action request. If a new worker socket was setup in the cb_action_init that socket will be closed when the callback returns.


### cb_action_cmd/0

```erlang
-type cb_action_cmd() ::
          fun((U :: #confd_user_info{},
               Name :: binary(),
               Path :: binary(),
               [Arg :: binary()]) ->
                  ok |
                  {ok, [Result :: binary()]} |
                  {error, error_reason()}).
```

Related types: [error\_reason()](#error_reason-0)

It is the callback for #confd_action_cb.action when invoked as a CLI command callback.


### cb_action_init/0

```erlang
-type cb_action_init() ::
          fun((U :: #confd_user_info{}, EconfdOpaque :: term()) ->
                  ok |
                  {ok, #confd_user_info{}} |
                  {error, error_reason()}).
```

Related types: [error\_reason()](#error_reason-0)

It is the callback for #confd_action_cb.init If the action should be done in a separate socket, the call to econfd:new_worker_socket/3 must be done here. The worker and its socket will be closed after the cb_action() returns.


### cb_authentication/0

```erlang
-type cb_authentication() ::
          fun((#confd_authentication_ctx{}) ->
                  ok | error | {error, binary()}).
```

The callback for #confd_authentication_cb.auth


### cb_candidate_commit/0

```erlang
-type cb_candidate_commit() ::
          fun((#confd_db_ctx{}, Timeout :: integer()) ->
                  ok | {error, error_reason()}).
```

Related types: [error\_reason()](#error_reason-0)

The callback for #confd_db_cbs.candidate_commit


### cb_completion_action/0

```erlang
-type cb_completion_action() ::
          fun((U :: #confd_user_info{},
               CliStyle :: integer(),
               Token :: binary(),
               CompletionChar :: integer(),
               IKP :: ikeypath(),
               CmdPath :: binary(),
               Id :: binary(),
               TP :: term(),
               Extra :: term()) ->
                  [string() |
                   {info, string()} |
                   {desc, string()} |
                   default]).
```

Related types: [ikeypath()](#ikeypath-0)

It is the callback for #confd_action_cb.action when invoked as a CLI command completion.


### cb_create/0

```erlang
-type cb_create() ::
          fun((T :: confd_trans_ctx(), KP :: ikeypath()) ->
                  ok |
                  {ok, confd_trans_ctx()} |
                  {error, error_reason()} |
                  delayed_response).
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0), [error\_reason()](#error_reason-0), [ikeypath()](#ikeypath-0)

It is the callback for #confd_data_cbs.create. Only used when we use external database config data, e.g. not for statistics.


### cb_ctx/0

```erlang
-type cb_ctx() ::
          fun((confd_trans_ctx()) ->
                  ok | {ok, confd_trans_ctx()} | {error, error_reason()}).
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0), [error\_reason()](#error_reason-0)

The callback for #confd_trans_validate_cbs.init and #confd_trans_cbs.init as well as several other callbacks in #confd_trans_cbs\{\}


### cb_db/0

```erlang
-type cb_db() ::
          fun((#confd_db_ctx{}, DbName :: integer()) ->
                  ok | {error, error_reason()}).
```

Related types: [error\_reason()](#error_reason-0)

The callback for #confd_db_cbs.lock, #confd_db_cbs.unlock, and #confd_db_cbs.delete_config


### cb_exists_optional/0

```erlang
-type cb_exists_optional() ::
          fun((T :: confd_trans_ctx(), KP :: ikeypath()) ->
                  {ok, cb_exists_optional_reply()} |
                  {ok, cb_exists_optional_reply(), confd_trans_ctx()} |
                  {error, error_reason()} |
                  delayed_response).
```

Related types: [cb\_exists\_optional\_reply()](#cb_exists_optional_reply-0), [confd\_trans\_ctx()](#confd_trans_ctx-0), [error\_reason()](#error_reason-0), [ikeypath()](#ikeypath-0)

This is the callback for #confd_data_cbs.exists_optional. The exists_optional callback must be present if our YANG model has presence containers or leafs of type empty outside of unions.

If type empty leafs are in unions, then cb_get_elem() is used instead.


### cb_exists_optional_reply/0

```erlang
-type cb_exists_optional_reply() :: boolean().
```

### cb_find_next/0

```erlang
-type cb_find_next() ::
          fun((T :: confd_trans_ctx(),
               KP :: ikeypath(),
               FindNextType :: integer(),
               PrevKey :: key()) ->
                  {ok, cb_find_next_reply()} |
                  {ok, cb_find_next_reply(), confd_trans_ctx()} |
                  {error, error_reason()} |
                  delayed_response).
```

Related types: [cb\_find\_next\_reply()](#cb_find_next_reply-0), [confd\_trans\_ctx()](#confd_trans_ctx-0), [error\_reason()](#error_reason-0), [ikeypath()](#ikeypath-0), [key()](#key-0)

This is the callback for #confd_data_cbs.find_next.


### cb_find_next_object/0

```erlang
-type cb_find_next_object() ::
          fun((T :: confd_trans_ctx(),
               KP :: ikeypath(),
               FindNextType :: integer(),
               PrevKey :: key()) ->
                  {ok, cb_find_next_object_reply()} |
                  {ok, cb_find_next_object_reply(), confd_trans_ctx()} |
                  {ok, objects(), TimeoutMillisecs :: integer()} |
                  {ok,
                   objects(),
                   TimeoutMillisecs :: integer(),
                   confd_trans_ctx()} |
                  {error, error_reason()} |
                  delayed_response).
```

Related types: [cb\_find\_next\_object\_reply()](#cb_find_next_object_reply-0), [confd\_trans\_ctx()](#confd_trans_ctx-0), [error\_reason()](#error_reason-0), [ikeypath()](#ikeypath-0), [key()](#key-0), [objects()](#objects-0)

Optional callback which combines the functionality of find_next() and get_object(), and adds the possibility to return multiple objects. It is the callback for #confd_data_cbs.find_next_object. For a detailed description of the two forms of the value list, please refer to the "Value Array" and "Tag Value Array" specifications, respectively, in the XML STRUCTURES section of the confd_types(3) manual page.


### cb_find_next_object_reply/0

```erlang
-type cb_find_next_object_reply() ::
          vals_next() | tag_val_object_next() | {false, undefined}.
```

Related types: [tag\_val\_object\_next()](#tag_val_object_next-0), [vals\_next()](#vals_next-0)

### cb_find_next_reply/0

```erlang
-type cb_find_next_reply() ::
          {Key :: key(), Next :: term()} | {false, undefined}.
```

Related types: [key()](#key-0)

### cb_get_attrs/0

```erlang
-type cb_get_attrs() ::
          fun((T :: confd_trans_ctx(),
               KP :: ikeypath(),
               [Attr :: integer()]) ->
                  {ok, cb_get_attrs_reply()} |
                  {ok, cb_get_attrs_reply(), confd_trans_ctx()} |
                  {error, error_reason()} |
                  delayed_response).
```

Related types: [cb\_get\_attrs\_reply()](#cb_get_attrs_reply-0), [confd\_trans\_ctx()](#confd_trans_ctx-0), [error\_reason()](#error_reason-0), [ikeypath()](#ikeypath-0)

This is the callback for #confd_data_cbs.get_attrs.


### cb_get_attrs_reply/0

```erlang
-type cb_get_attrs_reply() ::
          [{Attr :: integer(), V :: value()}] | not_found.
```

Related types: [value()](#value-0)

### cb_get_case/0

```erlang
-type cb_get_case() ::
          fun((T :: confd_trans_ctx(),
               KP :: ikeypath(),
               ChoicePath :: [qtag()]) ->
                  {ok, cb_get_case_reply()} |
                  {ok, cb_get_case_reply(), confd_trans_ctx()} |
                  {error, error_reason()} |
                  delayed_response).
```

Related types: [cb\_get\_case\_reply()](#cb_get_case_reply-0), [confd\_trans\_ctx()](#confd_trans_ctx-0), [error\_reason()](#error_reason-0), [ikeypath()](#ikeypath-0), [qtag()](#qtag-0)

This is the callback for #confd_data_cbs.get_case. Only used when we use 'choice' in the data model. Normally ChoicePath is just a single element with the name of the choice, but if we have nested choices without intermediate data nodes, it will be similar to an ikeypath, i.e. a reversed list of choice and case names giving the path through the nested choices.


### cb_get_case_reply/0

```erlang
-type cb_get_case_reply() :: Case :: qtag() | not_found.
```

Related types: [qtag()](#qtag-0)

### cb_get_elem/0

```erlang
-type cb_get_elem() ::
          fun((T :: confd_trans_ctx(), KP :: ikeypath()) ->
                  {ok, cb_get_elem_reply()} |
                  {ok, cb_get_elem_reply(), confd_trans_ctx()} |
                  {error, error_reason()} |
                  delayed_response).
```

Related types: [cb\_get\_elem\_reply()](#cb_get_elem_reply-0), [confd\_trans\_ctx()](#confd_trans_ctx-0), [error\_reason()](#error_reason-0), [ikeypath()](#ikeypath-0)

This is the callback for #confd_data_cbs.get_elem.


### cb_get_elem_reply/0

```erlang
-type cb_get_elem_reply() :: value() | not_found.
```

Related types: [value()](#value-0)

### cb_get_log_times/0

```erlang
-type cb_get_log_times() ::
          fun((#confd_notification_ctx{}) ->
                  {ok,
                   {Created :: datetime(),
                    Aged :: datetime() | not_found}} |
                  {error, error_reason()}).
```

Related types: [datetime()](#datetime-0), [error\_reason()](#error_reason-0)

The callback for #confd_notification_stream_cbs.get_log_times


### cb_get_next/0

```erlang
-type cb_get_next() ::
          fun((T :: confd_trans_ctx(), KP :: ikeypath(), Prev :: term()) ->
                  {ok, cb_get_next_reply()} |
                  {ok, cb_get_next_reply(), confd_trans_ctx()} |
                  {error, error_reason()} |
                  delayed_response).
```

Related types: [cb\_get\_next\_reply()](#cb_get_next_reply-0), [confd\_trans\_ctx()](#confd_trans_ctx-0), [error\_reason()](#error_reason-0), [ikeypath()](#ikeypath-0)

This is the callback for #confd_data_cbs.get_next. Prev is the integer -1 on the first call.


### cb_get_next_object/0

```erlang
-type cb_get_next_object() ::
          fun((T :: confd_trans_ctx(), KP :: ikeypath(), Prev :: term()) ->
                  {ok, cb_get_next_object_reply()} |
                  {ok, cb_get_next_object_reply(), confd_trans_ctx()} |
                  {ok, objects(), TimeoutMillisecs :: integer()} |
                  {ok,
                   objects(),
                   TimeoutMillisecs :: integer(),
                   confd_trans_ctx()} |
                  {error, error_reason()} |
                  delayed_response).
```

Related types: [cb\_get\_next\_object\_reply()](#cb_get_next_object_reply-0), [confd\_trans\_ctx()](#confd_trans_ctx-0), [error\_reason()](#error_reason-0), [ikeypath()](#ikeypath-0), [objects()](#objects-0)

Optional callback which combines the functionality of get_next() and get_object(), and adds the possibility to return multiple objects. It is the callback for #confd_data_cbs.get_next_object. For a detailed description of the two forms of the value list, please refer to the "Value Array" and "Tag Value Array" specifications, respectively, in the XML STRUCTURES section of the confd_types(3) manual page.


### cb_get_next_object_reply/0

```erlang
-type cb_get_next_object_reply() ::
          vals_next() | tag_val_object_next() | {false, undefined}.
```

Related types: [tag\_val\_object\_next()](#tag_val_object_next-0), [vals\_next()](#vals_next-0)

### cb_get_next_reply/0

```erlang
-type cb_get_next_reply() ::
          {Key :: key(), Next :: term()} | {false, undefined}.
```

Related types: [key()](#key-0)

### cb_get_object/0

```erlang
-type cb_get_object() ::
          fun((T :: confd_trans_ctx(), KP :: ikeypath()) ->
                  {ok, cb_get_object_reply()} |
                  {ok, cb_get_object_reply(), confd_trans_ctx()} |
                  {error, error_reason()} |
                  delayed_response).
```

Related types: [cb\_get\_object\_reply()](#cb_get_object_reply-0), [confd\_trans\_ctx()](#confd_trans_ctx-0), [error\_reason()](#error_reason-0), [ikeypath()](#ikeypath-0)

Optional callback which is used to return an entire object. It is the callback for #confd_data_cbs.get_object. For a detailed description of the two forms of the value list, please refer to the "Value Array" and "Tag Value Array" specifications, respectively, in the XML STRUCTURES section of the confd_types(3) manual page.


### cb_get_object_reply/0

```erlang
-type cb_get_object_reply() :: vals() | tag_val_object() | not_found.
```

Related types: [tag\_val\_object()](#tag_val_object-0), [vals()](#vals-0)

### cb_lock_partial/0

```erlang
-type cb_lock_partial() ::
          fun((#confd_db_ctx{},
               DbName :: integer(),
               LockId :: integer(),
               [ikeypath()]) ->
                  ok | {error, error_reason()}).
```

Related types: [error\_reason()](#error_reason-0), [ikeypath()](#ikeypath-0)

The callback for #confd_db_cbs.lock_partial


### cb_move_after/0

```erlang
-type cb_move_after() ::
          fun((T :: confd_trans_ctx(),
               KP :: ikeypath(),
               PrevKeys :: {value()}) ->
                  ok |
                  {ok, confd_trans_ctx()} |
                  {error, error_reason()} |
                  delayed_response).
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0), [error\_reason()](#error_reason-0), [ikeypath()](#ikeypath-0), [value()](#value-0)

This is the callback for #confd_data_cbs.move_after. PrevKeys == \{\} means that the list entry should become the first one.


### cb_num_instances/0

```erlang
-type cb_num_instances() ::
          fun((T :: confd_trans_ctx(), KP :: ikeypath()) ->
                  {ok, cb_num_instances_reply()} |
                  {ok, cb_num_instances_reply(), confd_trans_ctx()} |
                  {error, error_reason()} |
                  delayed_response).
```

Related types: [cb\_num\_instances\_reply()](#cb_num_instances_reply-0), [confd\_trans\_ctx()](#confd_trans_ctx-0), [error\_reason()](#error_reason-0), [ikeypath()](#ikeypath-0)

Optional callback, if it doesn't exist it will be emulated by consecutive calls to get_next(). It is the callback for #confd_data_cbs.num_instances.


### cb_num_instances_reply/0

```erlang
-type cb_num_instances_reply() :: integer().
```

### cb_ok/0

```erlang
-type cb_ok() ::
          fun((confd_trans_ctx()) -> ok | {error, error_reason()}).
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0), [error\_reason()](#error_reason-0)

The callback for #confd_trans_cbs.finish and #confd_trans_validate_cbs.stop


### cb_ok_db/0

```erlang
-type cb_ok_db() ::
          fun((#confd_db_ctx{}) -> ok | {error, error_reason()}).
```

Related types: [error\_reason()](#error_reason-0)

The callback for #confd_db_cbs.candidate_confirming_commit and several other callbacks in #confd_db_cbs\{\}


### cb_remove/0

```erlang
-type cb_remove() ::
          fun((T :: confd_trans_ctx(), KP :: ikeypath()) ->
                  ok |
                  {ok, confd_trans_ctx()} |
                  {error, error_reason()} |
                  delayed_response).
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0), [error\_reason()](#error_reason-0), [ikeypath()](#ikeypath-0)

It is the callback for #confd_data_cbs.remove. Only used when we use external database config data, e.g. not for statistics.


### cb_replay/0

```erlang
-type cb_replay() ::
          fun((#confd_notification_ctx{},
               Start :: datetime(),
               Stop :: datetime() | undefined) ->
                  ok | {error, error_reason()}).
```

Related types: [datetime()](#datetime-0), [error\_reason()](#error_reason-0)

The callback for #confd_notification_stream_cbs.replay


### cb_set_attr/0

```erlang
-type cb_set_attr() ::
          fun((T :: confd_trans_ctx(),
               KP :: ikeypath(),
               Attr :: integer(),
               cb_set_attr_value()) ->
                  ok |
                  {ok, confd_trans_ctx()} |
                  {error, error_reason()} |
                  delayed_response).
```

Related types: [cb\_set\_attr\_value()](#cb_set_attr_value-0), [confd\_trans\_ctx()](#confd_trans_ctx-0), [error\_reason()](#error_reason-0), [ikeypath()](#ikeypath-0)

This is the callback for #confd_data_cbs.set_attr. Value == undefined means that the attribute should be deleted.


### cb_set_attr_value/0

```erlang
-type cb_set_attr_value() :: value() | undefined.
```

Related types: [value()](#value-0)

### cb_set_case/0

```erlang
-type cb_set_case() ::
          fun((T :: confd_trans_ctx(),
               KP :: ikeypath(),
               ChoicePath :: [qtag()],
               Case :: qtag() | '$none') ->
                  ok |
                  {ok, confd_trans_ctx()} |
                  {error, error_reason()} |
                  delayed_response).
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0), [error\_reason()](#error_reason-0), [ikeypath()](#ikeypath-0), [qtag()](#qtag-0)

This is the callback for #confd_data_cbs.set_case. Only used when we use 'choice' in the data model. Case == '$none' means that no case is chosen (i.e. all have been deleted). Normally ChoicePath is just a single element with the name of the choice, but if we have nested choices without intermediate data nodes, it will be similar to an ikeypath, i.e. a reversed list of choice and case names giving the path through the nested choices.


### cb_set_elem/0

```erlang
-type cb_set_elem() ::
          fun((T :: confd_trans_ctx(),
               KP :: ikeypath(),
               Value :: value()) ->
                  ok |
                  {ok, confd_trans_ctx()} |
                  {error, error_reason()} |
                  delayed_response).
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0), [error\_reason()](#error_reason-0), [ikeypath()](#ikeypath-0), [value()](#value-0)

It is the callback for #confd_data_cbs.set_elem. Only used when we use external database config data, e.g. not for statistics.


### cb_str_to_val/0

```erlang
-type cb_str_to_val() ::
          fun((TypeCtx :: term(), String :: string()) ->
                  {ok, Value :: value()} |
                  error |
                  {error, Reason :: binary()} |
                  none()).
```

Related types: [value()](#value-0)

The callback for #confd_type_cbs.str_to_val. The TypeCtx argument is currently unused (passed as 'undefined'). The function may fail - this is equivalent to returning 'error'.


### cb_trans_lock/0

```erlang
-type cb_trans_lock() ::
          fun((confd_trans_ctx()) ->
                  ok |
                  {ok, confd_trans_ctx()} |
                  {error, error_reason()} |
                  confd_already_locked).
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0), [error\_reason()](#error_reason-0)

The callback for #confd_trans_cbs.trans_lock. The confd_already_locked return value is equivalent to \{error, #confd_error\{ code = in_use \}\}.


### cb_unlock_partial/0

```erlang
-type cb_unlock_partial() ::
          fun((#confd_db_ctx{},
               DbName :: integer(),
               LockId :: integer()) ->
                  ok | {error, error_reason()}).
```

Related types: [error\_reason()](#error_reason-0)

The callback for #confd_db_cbs.unlock_partial


### cb_val_to_str/0

```erlang
-type cb_val_to_str() ::
          fun((TypeCtx :: term(), Value :: value()) ->
                  {ok, String :: string()} |
                  error |
                  {error, Reason :: binary()} |
                  none()).
```

Related types: [value()](#value-0)

The callback for #confd_type_cbs.val_to_str. The TypeCtx argument is currently unused (passed as 'undefined'). The function may fail - this is equivalent to returning 'error'.


### cb_validate/0

```erlang
-type cb_validate() ::
          fun((T :: confd_trans_ctx(),
               KP :: ikeypath(),
               Newval :: value()) ->
                  ok |
                  {ok, confd_trans_ctx()} |
                  {validation_warn, Reason :: binary()} |
                  {error, error_reason()}).
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0), [error\_reason()](#error_reason-0), [ikeypath()](#ikeypath-0), [value()](#value-0)

It is the callback for #confd_valpoint_cb.validate.


### cb_validate_value/0

```erlang
-type cb_validate_value() ::
          fun((TypeCtx :: term(), Value :: value()) ->
                  ok | error | {error, Reason :: binary()} | none()).
```

Related types: [value()](#value-0)

The callback for #confd_type_cbs.validate. The TypeCtx argument is currently unused (passed as 'undefined'). The function may fail - this is equivalent to returning 'error'.


### cb_write/0

```erlang
-type cb_write() ::
          fun((confd_trans_ctx()) ->
                  ok |
                  {ok, confd_trans_ctx()} |
                  {error, error_reason()} |
                  confd_in_use).
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0), [error\_reason()](#error_reason-0)

The callback for #confd_trans_cbs.write_start and #confd_trans_cbs.prepare. The confd_in_use return value is equivalent to \{error, #confd_error\{ code = in_use \}\}.


### cb_write_all/0

```erlang
-type cb_write_all() ::
          fun((T :: confd_trans_ctx(), KP :: ikeypath()) ->
                  ok |
                  {ok, confd_trans_ctx()} |
                  {error, error_reason()} |
                  delayed_response).
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0), [error\_reason()](#error_reason-0), [ikeypath()](#ikeypath-0)

This is the callback for #confd_data_cbs.write_all. The KP argument is currently always [], since the callback does not pertain to any particular data node.


### cmp_op/0

```erlang
-type cmp_op() :: 0 | 1 | 2 | 3 | 4 | 5 | 6.
```

### confd_trans_ctx/0

```erlang
-type confd_trans_ctx() :: #confd_trans_ctx{}.
```

### connect_result/0

```erlang
-type connect_result() ::
          {ok, socket()} | {error, error_reason()} | {error, atom()}.
```

Related types: [error\_reason()](#error_reason-0), [socket()](#socket-0)

This is the return type of connect() function.


### datetime/0

```erlang
-type datetime() :: {C_DATETIME :: integer(), datetime_date_and_time()}.
```

Related types: [datetime\_date\_and\_time()](#datetime_date_and_time-0)

The value representation for yang:date-and-time, also used in the API functions for notification streams.


### datetime_date_and_time/0

```erlang
-type datetime_date_and_time() ::
          {Year :: integer(),
           Month :: integer(),
           Day :: integer(),
           Hour :: integer(),
           Minute :: integer(),
           Second :: integer(),
           MicroSecond :: integer(),
           TZ :: integer(),
           TZMinutes :: integer()}.
```

### error_reason/0

```erlang
-type error_reason() :: binary() | #confd_error{} | tuple().
```

The callback functions may return errors either as a plain string or via a #confd_error\{\} record - see econfd.hrl and the section EXTENDED ERROR REPORTING in confd_lib_lib(3) (tuple() is only for internal ConfD/NCS use). \{error, String\} is equivalent to \{error, #confd_error\{ code = application, str = String \}\}.


### exec_op/0

```erlang
-type exec_op() :: 7 | 8 | 9 | 10 | 11 | 13 | 12.
```

### ikeypath/0

```erlang
-type ikeypath() :: [qtag() | key()].
```

Related types: [key()](#key-0), [qtag()](#qtag-0)

An ikeypath() is a list describing a path down into the data tree. The Ikeypaths are used to denote specific objects in the XML instance document. The list is in backwards order, thus the head of the list is the leaf element. All the data callbacks defined in #confd_data_cbs\{\} receive ikeypath() lists as an argument. The last (top) element of the list is a pair `[NS|XmlTag]` where NS is the atom defining the XML namespace of the XmlTag and XmlTag is an XmlTag::atom() denoting the toplevel XML element. Elements in the list that have a different namespace than their parent are also qualified through such a pair with the element's namespace, but all other elements are represented by their unqualified tag() atom. Thus an ikeypath() uniquely addresses an instance of an element in the configuration XML tree. List entries are identified by an element in the ikeypath() list expressed as \{Key\} or, when we are using CDB, as \[Integer]. During an individual CDB session all the elements are implictly numbered, thus we can through a call to econfd_cdb:num_instances/2 retrieve how many entries (N) for a given list that we have, and then retrieve those entries (0 - (N-1)) inserting \[I] as the key.


### ip/0

```erlang
-type ip() :: ipv4() | ipv6().
```

Related types: [ipv4()](#ipv4-0), [ipv6()](#ipv6-0)

### ipv4/0

```erlang
-type ipv4() :: {0..255, 0..255, 0..255, 0..255}.
```

### ipv6/0

```erlang
-type ipv6() ::
          {0..65535,
           0..65535,
           0..65535,
           0..65535,
           0..65535,
           0..65535,
           0..65535,
           0..65535}.
```

### key/0

```erlang
-type key() :: {value()} | [Index :: integer()].
```

Related types: [value()](#value-0)

Keys are parts of ikeypath(). In the YANG data model we define how many keys a list node has. If we have 1 key, the key is an arity-1 tuple, 2 keys - an arity-2 tuple and so forth. The \[Index] notation is only valid for keys in ikeypaths when we use CDB.


### list_filter_op/0

```erlang
-type list_filter_op() :: cmp_op() | exec_op().
```

Related types: [cmp\_op()](#cmp_op-0), [exec\_op()](#exec_op-0)

### list_filter_type/0

```erlang
-type list_filter_type() :: 0 | 1 | 2 | 3 | 4 | 5 | 6.
```

### namespace/0

```erlang
-type namespace() :: atom().
```

### objects/0

```erlang
-type objects() :: [vals_next() | tag_val_object_next() | false].
```

Related types: [tag\_val\_object\_next()](#tag_val_object_next-0), [vals\_next()](#vals_next-0)

### qtag/0

```erlang
-type qtag() :: tag() | tag_cons(namespace(), tag()).
```

Related types: [namespace()](#namespace-0), [tag()](#tag-0), [tag\_cons()](#tag_cons-2)

A "qualified tag" is either a single tag or a pair of a namespace and a tag. An example could be 'interface' or \['http://example.com/ns/interfaces/2.1' | interface]


### socket/0

```erlang
-type socket() ::
          {gen_tcp, gen_tcp:socket()} |
          {local_ipc, socket:socket()} |
          int_ipc:sock().
```

### tag/0

```erlang
-type tag() :: atom().
```

### tag_cons/2

```erlang
-type tag_cons(T1, T2) :: nonempty_improper_list(T1, T2).
```

### tag_val_object/0

```erlang
-type tag_val_object() :: {exml, [TV :: tagval()]}.
```

Related types: [tagval()](#tagval-0)

### tag_val_object_next/0

```erlang
-type tag_val_object_next() :: {tag_val_object(), Next :: term()}.
```

Related types: [tag\_val\_object()](#tag_val_object-0)

### tagpath/0

```erlang
-type tagpath() :: [qtag()].
```

Related types: [qtag()](#qtag-0)

A tagpath() is a list describing a path down into the schema tree. I.e. as opposed to an ikeypath(), it has no instance information. Additionally the last (top) element is not `[NS|XmlTag]` as in ikeypath(), but only `XmlTag` \- i.e. it needs to be combined with a namespace to uniquely identify a schema node. The other elements in the path are qualified - or not - exactly as for ikeypath().


### tagval/0

```erlang
-type tagval() ::
          {qtag(),
           value() |
           start |
           {start, Index :: integer()} |
           stop | leaf | delete}.
```

Related types: [qtag()](#qtag-0), [value()](#value-0)

This is used to represent XML elements together with their values, typically in a list representing an XML subtree as in the arguments and result of the 'action' callback. Typeless elements have the special "values":

* `start` \- opening container or list element.
* `{start, Index :: integer()}` \- opening list element with CDB Index instead of key value(s) - only valid for CDB access.
* `stop` \- closing container or list element.
* `leaf` \- leaf with type "empty".
* `delete` \- delete list entry.

The qtag() tuple element may have the namespace()-less form (i.e. tag()) for XML elements in the "current" namespace. For a detailed description of how to represent XML as a list of tagval() elements, please refer to the "Tagged Value Array" specification in the XML STRUCTURES section of the confd_types(3) manual page.


### transport_error/0

```erlang
-type transport_error() :: timeout | closed.
```

### type/0

```erlang
-type type() :: term().
```

Identifies a type definition in the schema.


### vals/0

```erlang
-type vals() :: [V :: value()].
```

Related types: [value()](#value-0)

### vals_next/0

```erlang
-type vals_next() :: {vals(), Next :: term()}.
```

Related types: [vals()](#vals-0)

### value/0

```erlang
-type value() ::
          binary() |
          tuple() |
          float() |
          boolean() |
          integer() |
          qtag() |
          {Tag :: integer(), Value :: term()} |
          [value()] |
          not_found | default.
```

Related types: [qtag()](#qtag-0), [value()](#value-0)

This type is central for this library. Values are returned from the CDB functions, they are used to read and write in the MAAPI module and they are also used as keys in ikeypath().

We have the following value representation for the data model types

* string - Always represented as a single binary.
* int32 - This is represented as a single integer.
* int8 - \{?C_INT8, Val\}
* int16 - \{?C_INT16, Val\}
* int64 - \{?C_INT64, Val\}
* uint8 - \{?C_UINT8, Val\}
* uint16 - \{?C_UINT16, Val\}
* uint32 - \{?C_UINT32, Val\}
* uint64 - \{?C_UINT64, Val\}
* inet:ipv4-address - 4-tuple
* inet:ipv4-address-no-zone - 4-tuple
* inet:ipv6-address - 8-tuple
* inet:ipv6-address-no-zone - 8-tuple
* boolean - The atoms 'true' or 'false'
* xs:float() and xs:double() - Erlang floats
* leaf-list - An erlang list of values.
* binary, yang:hex-string, tailf:hex-list (etc) - \{?C_BINARY, binary()\}
* yang:date-and-time - \{?C_DATETIME, datetime_date_and_time()\}
* xs:duration - \{?C_DURATION, \{Y,M,D,H,M,S,Mcr\}\}
* instance-identifier - \{?C_OBJECTREF, econfd:ikeypath()\}
* yang:object-identifier - \{?C_OID, Int32Binary\}, where Int32Binary is a binary with OID compontents as 32-bit integers in the default big endianness.
* yang:dotted-quad - \{?C_DQUAD, binary()\}
* yang:hex-string - \{?C_HEXSTR, binary()\}
* inet:ipv4-prefix - \{?C_IPV4PREFIX, \{\{A,B,C,D\}, PrefixLen\}\}
* inet:ipv6-prefix - \{?C_IPV6PREFIX, \{\{A,B,C,D,E,F,G,H\}, PrefixLen\}\}
* tailf:ipv4-address-and-prefix-length - \{?C_IPV4_AND_PLEN, \{\{A,B,C,D\}, PrefixLen\}\}
* tailf:ipv6-address-and-prefix-length - \{?C_IPV6_AND_PLEN, \{\{A,B,C,D,E,F,G,H\}, PrefixLen\}\}
* decimal64 - \{?C_DECIMAL64, \{Int64, FractionDigits\}\}
* identityref - \{?C_IDENTITYREF, \{NsHash, IdentityHash\}\}
* bits - \{?C_BIT32, Bits::integer()\}, \{?C_BIT64, Bits::integer()\}, or \{?C_BITBIG, Bits:binary()\} depending on the highest bit position assigned
* enumeration - \{?C_ENUM_VALUE, IntVal\}, where IntVal is the integer value for a given "enum" statement according to the YANG specification. When we have compiled a YANG module into a .fxs file, we can use the --emit-hrl option to confdc(1) to create a .hrl file with macro definitions for the enum values.
* empty - \{?C_EMPTY, 0\}. This is applicable for type empty in union, and type empty on list keys. Type empty on a leaf without a union is not represented by a value, only existence checks can be done.

There is also a "pseudo type" that indicates a non-existing value, which is represented as the atom 'not_found'. Finally there is a "pseudo type" to indicate that a leaf with a default value defined in the data model does not have a value set - this is represented as the atom 'default'.

For all of the abovementioned (non-"pseudo") types we have the corresponding macro in econfd.hrl. We strongly suggest that the ?CONFD_xxx macros are used whenever we either want to construct a value or match towards a value: Thus we write code as:

```text
   case econfd_cdb:get_elem(...) of
       {ok, ?CONFD_INT64(42)} ->
           foo;
 
  or
   econfd_cdb:set_elem(... ?CONFD_INT64(777), ...)
 
  or
   {ok, ?CONFD_INT64(I)} = econfd_cdb:get_elem(...)
 
 
```


## Functions

### action_set_timeout/2

```erlang
-spec action_set_timeout(Uinfo :: #confd_user_info{},
                         Seconds :: integer()) ->
                            ok | {error, Reason :: term()}.
```

Extend (or shorten) the timeout for the current action callback invocation. The timeout is given in seconds from the point in time when the function is called.


### bitbig_bin2bm/1

```erlang
bitbig_bin2bm(Binary)
```

### bitbig_bit_is_set/2

```erlang
-spec bitbig_bit_is_set(Binary :: binary(), Position :: integer()) ->
                           boolean().
```

Test a bit in a C_BITBIG binary.


### bitbig_bm2bin/1

```erlang
bitbig_bm2bin(Bitmask)
```

### bitbig_clr_bit/2

```erlang
-spec bitbig_clr_bit(Binary :: binary(), Position :: integer()) ->
                        binary().
```

Clear a bit in a C_BITBIG binary.


### bitbig_pad/2

```erlang
bitbig_pad(Binary, Size)
```

### bitbig_set_bit/2

```erlang
-spec bitbig_set_bit(Binary :: binary(), Position :: integer()) ->
                        binary().
```

Set a bit in a C_BITBIG binary.


### controlling_process/2

```erlang
-spec controlling_process(Socket :: term(), Pid :: pid()) ->
                             ok | {error, Reason :: term()}.
```

Assigns a new controlling process Pid to Socket


### data_get_list_filter/1

```erlang
-spec data_get_list_filter(Tctx :: confd_trans_ctx()) ->
                              undefined | #confd_list_filter{}.
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0)

Return list filter for the current operation if any.


### data_is_filtered/1

```erlang
-spec data_is_filtered(Tctx :: confd_trans_ctx()) -> boolean().
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0)

Return true if the filtered flag is set on the transaction.


### data_reply_error/2

```erlang
-spec data_reply_error(Tctx :: confd_trans_ctx(),
                       Error :: error_reason()) ->
                          ok | {error, Reason :: term()}.
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0), [error\_reason()](#error_reason-0)

Reply an error for delayed_response. Like data_reply_value() - only used in combination with delayed_response.


### data_reply_found/1

```erlang
-spec data_reply_found(Tctx :: confd_trans_ctx()) ->
                          ok | {error, Reason :: term()}.
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0)

Reply 'found' for delayed_response. Like data_reply_value() - only used in combination with delayed_response.


### data_reply_next_key/3

```erlang
-spec data_reply_next_key(Tctx :: confd_trans_ctx(),
                          Key :: key() | false,
                          Next :: term()) ->
                             ok | {error, Reason :: term()}.
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0), [key()](#key-0)

Reply with next key for delayed_response. Like data_reply_value() - only used in combination with delayed_response.


### data_reply_next_object_tag_value_array/3

```erlang
-spec data_reply_next_object_tag_value_array(Tctx :: confd_trans_ctx(),
                                             Values :: [TV :: tagval()],
                                             Next :: term()) ->
                                                ok |
                                                {error,
                                                 Reason :: term()}.
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0), [tagval()](#tagval-0)

Reply with tagged values and next key for delayed_response. Like data_reply_value() - only used in combination with delayed_response, and get_next_object() callback.


### data_reply_next_object_value_array/3

```erlang
-spec data_reply_next_object_value_array(Tctx :: confd_trans_ctx(),
                                         Values ::
                                             vals() |
                                             tag_val_object() |
                                             false,
                                         Next :: term()) ->
                                            ok |
                                            {error, Reason :: term()}.
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0), [tag\_val\_object()](#tag_val_object-0), [vals()](#vals-0)

Reply with values and next key for delayed_response. Like data_reply_value() - only used in combination with delayed_response, and get_next_object() callback.


### data_reply_next_object_value_arrays/3

```erlang
-spec data_reply_next_object_value_arrays(Tctx :: confd_trans_ctx(),
                                          Objects :: objects(),
                                          TimeoutMillisecs :: integer()) ->
                                             ok |
                                             {error, Reason :: term()}.
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0), [objects()](#objects-0)

Reply with multiple objects, each with values and next key, plus cache timeout, for delayed_response. Like data_reply_value() - only used in combination with delayed_response, and get_next_object() callback.


### data_reply_not_found/1

```erlang
-spec data_reply_not_found(Tctx :: confd_trans_ctx()) ->
                              ok | {error, Reason :: term()}.
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0)

Reply 'not found' for delayed_response. Like data_reply_value() - only used in combination with delayed_response.


### data_reply_ok/1

```erlang
-spec data_reply_ok(Tctx :: confd_trans_ctx()) ->
                       ok | {error, Reason :: term()}.
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0)

Reply 'ok' for delayed_response. This function can be used explicitly by the erlang application if a data callback returns the atom delayed_response. In that case it is the responsibility of the application to later invoke one of the data_reply_xxx() functions. If delayed_response is not used, none of the explicit data replying functions need to be used.


### data_reply_tag_value_array/2

```erlang
-spec data_reply_tag_value_array(Tctx :: confd_trans_ctx(),
                                 TagVals :: [tagval()]) ->
                                    ok | {error, Reason :: term()}.
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0), [tagval()](#tagval-0)

Reply a list of tagged values for delayed_response. Like data_reply_value() - only used in combination with delayed_response, and get_object() callback.


### data_reply_value/2

```erlang
-spec data_reply_value(Tctx :: confd_trans_ctx(), V :: value()) ->
                          ok | {error, Reason :: term()}.
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0), [value()](#value-0)

Reply a value for delayed_response. This function can be used explicitly by the erlang application if a data callback returns the atom delayed_response. In that case it is the responsibility of the application to later invoke one of the data_reply_xxx() functions. If delayed_response is not used, none of the explicit data replying functions need to be used.


### data_reply_value_array/2

```erlang
-spec data_reply_value_array(Tctx :: confd_trans_ctx(),
                             Values :: vals() | tag_val_object() | false) ->
                                ok | {error, Reason :: term()}.
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0), [tag\_val\_object()](#tag_val_object-0), [vals()](#vals-0)

Reply a list of values for delayed_response. Like data_reply_value() - only used in combination with delayed_response, and get_object() callback.


### data_set_filtered/2

```erlang
-spec data_set_filtered(Tctx :: confd_trans_ctx(),
                        IsFiltered :: boolean()) ->
                           confd_trans_ctx().
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0)

Set filtered flag on transaction context in the first callback call of a list traversal. This signals that all list entries returned by the data provider for this list traversal match the filter.


### data_set_timeout/2

```erlang
-spec data_set_timeout(Tctx :: confd_trans_ctx(), Seconds :: integer()) ->
                          ok | {error, Reason :: term()}.
```

Related types: [confd\_trans\_ctx()](#confd_trans_ctx-0)

Extend (or shorten) the timeout for the current callback invocation. The timeout is given in seconds from the point in time when the function is called.


### decrypt/1

```erlang
-spec decrypt(_ :: binary()) ->
                 {ok, binary()} |
                 {error, {Ecode :: integer(), Reason :: binary()}}.
```

Decrypts a value of type tailf:aes-256-cfb-128-encrypted-string or tailf:aes-cfb-128-encrypted-string. Requires that econfd_maapi:install_crypto_keys/1 has been called in the node.


### init_daemon/5

```erlang
-spec init_daemon(Name :: atom(),
                  DebugLevel :: integer(),
                  Estream :: io:device(),
                  Dopaque :: term(),
                  Path :: string()) ->
                     {ok, Pid :: pid()} | {error, Reason :: term()}.
```

Starts and links to a gen_server which connects to ConfD. This gen_server holds two sockets to ConfD, one so called control socket and one worker socket (See confd_lib_dp(3) for an explanation of those sockets.)

To avoid blocking control socket callback requests due to long-running worker socket callbacks, the control socket callbacks are run in the gen_server, while the worker socket callbacks are run in a separate process that is spawned by the gen_server. This means that applications must not share e.g. MAAPI sockets between transactions, since this could result in simultaneous use of a socket by the gen_server and the spawned process.

The gen_server is used to install sets of callback Funs. The gen_server state is a #confd_daemon_ctx\{\}. This structure is passed to all the callback functions.

The daemon context includes a d_opaque element holding the Dopaque term - this can be used by the application to pass application specific data into the callback functions.

The Name::atom() parameter is used in various debug printouts and is also used to uniquely identify the daemon.

The DebugLevel parameter is used to control the debug level. The following levels are available:

* ?CONFD_SILENT No debug printouts whatsoever are produced by the library.
* ?CONFD_DEBUG Various printouts will occur for various error conditions.
* ?CONFD_TRACE The execution of callback functions will be traced.

The Estream parameter is used by all printouts from the library.


### init_daemon/6

```erlang
-spec init_daemon(Name :: atom(),
                  DebugLevel :: integer(),
                  Estream :: io:device(),
                  Dopaque :: term(),
                  Ip :: ip(),
                  Port :: integer()) ->
                     {ok, Pid :: pid()} | {error, Reason :: term()}.
```

Related types: [ip()](#ip-0)

### log/2

```erlang
-spec log(Level :: integer(), Fmt :: string()) -> ok.
```

Logs Fmt to devel.log if running internal, otherwise to standard out. Level can be one of ?CONFD_LEVEL_ERROR | ?CONFD_LEVEL_INFO | ?CONFD_LEVEL_TRACE


### log/3

```erlang
-spec log(Level :: integer(), Fmt :: string(), Args :: list()) -> ok.
```

Logs Fmt with Args to devel.log if running internal, otherwise to standard out. Level can be one of ?CONFD_LEVEL_ERROR | ?CONFD_LEVEL_INFO | ?CONFD_LEVEL_TRACE


### log/4

```erlang
-spec log(IoDevice :: io:device(),
          Level :: integer(),
          Fmt :: string(),
          Args :: list()) ->
             ok.
```

Logs Fmt with Args to devel.log if running internal, otherwise to IoDevice. Level can be one of ?CONFD_LEVEL_ERROR | ?CONFD_LEVEL_INFO | ?CONFD_LEVEL_TRACE


### mk_filtered_next/2

```erlang
mk_filtered_next(Tctx, Next)
```

### new_worker_socket/2

```erlang
-spec new_worker_socket(UserInfo :: #confd_user_info{},
                        SockId :: integer()) ->
                           {socket(), #confd_user_info{}} |
                           {error,
                            timeout | closed | not_owner | badarg |
                            inet:posix() |
                            any()}.
```

Related types: [socket()](#socket-0)

Create a new worker socket to be used for an action invocation. When the action invocation ends remove_worker_socket/1 should be called.


### notification_replay_complete/1

```erlang
-spec notification_replay_complete(Nctx :: #confd_notification_ctx{}) ->
                                      ok | {error, Reason :: term()}.
```

Call this function when replay is done


### notification_replay_failed/2

```erlang
-spec notification_replay_failed(Nctx :: #confd_notification_ctx{},
                                 ErrorString :: binary()) ->
                                    ok | {error, Reason :: term()}.
```

Call this function when replay has failed for some reason


### notification_send/3

```erlang
-spec notification_send(Nctx :: #confd_notification_ctx{},
                        DateTime :: datetime(),
                        TagVals :: [tagval()]) ->
                           ok | {error, Reason :: term()}.
```

Related types: [datetime()](#datetime-0), [tagval()](#tagval-0)

Send a notification defined at the top level of a YANG module.


### notification_send/4

```erlang
-spec notification_send(Nctx :: #confd_notification_ctx{},
                        DateTime :: datetime(),
                        TagVals :: [tagval()],
                        IKP :: ikeypath()) ->
                           ok | {error, Reason :: term()}.
```

Related types: [datetime()](#datetime-0), [ikeypath()](#ikeypath-0), [tagval()](#tagval-0)

Send a notification defined as a child of a container or list in a YANG 1.1 module. IKP is the fully instantiated path for the parent of the notification in the data tree.


### pp_kpath/1

```erlang
-spec pp_kpath(IKP :: ikeypath()) -> iolist().
```

Related types: [ikeypath()](#ikeypath-0)

Pretty print an ikeypath.


### pp_kpath2/1

```erlang
pp_kpath2(Vs)
```

### pp_path_value/1

```erlang
pp_path_value(Val)
```

### pp_value/1

```erlang
-spec pp_value(V :: value()) -> iolist().
```

Related types: [value()](#value-0)

Pretty print a value.


### process_next_objects/5

```erlang
process_next_objects(Rest, Ints0, TH, TraversalId, NextFun)
```

### register_action_cb/2

```erlang
-spec register_action_cb(Daemon :: pid(),
                         ActionCbs :: #confd_action_cb{}) ->
                            ok | {error, Reason :: term()}.
```

Register action callback on an actionpoint


### register_authentication_cb/2

```erlang
-spec register_authentication_cb(Daemon :: pid(),
                                 AuthenticationCb ::
                                     #confd_authentication_cb{}) ->
                                    ok | {error, Reason :: term()}.
```

Register authentication callback. Note, this can not be used to *perform* the authentication.


### register_data_cb/2

```erlang
-spec register_data_cb(Daemon :: pid(), DbCbs :: #confd_data_cbs{}) ->
                          ok | {error, Reason :: term()}.
```

Register the data callbacks.


### register_data_cb/3

```erlang
-spec register_data_cb(Daemon :: pid(),
                       DbCbs :: #confd_data_cbs{},
                       Flags :: non_neg_integer()) ->
                          ok | {error, Reason :: term()}.
```

Register the data callbacks.


### register_db_cbs/2

```erlang
-spec register_db_cbs(Daemon :: pid(), DbCbs :: #confd_db_cbs{}) ->
                         ok | {error, Reason :: term()}.
```

Register extern db callbacks.


### register_done/1

```erlang
-spec register_done(Daemon :: pid()) -> ok | {error, Reason :: term()}.
```

This function must be called when all callback registrations are done.


### register_notification_stream/2

```erlang
-spec register_notification_stream(Daemon :: pid(),
                                   NotifCbs ::
                                       #confd_notification_stream_cbs{}) ->
                                      {ok, #confd_notification_ctx{}} |
                                      {error, Reason :: term()}.
```

Register notif callbacks on an streamname


### register_range_data_cb/5

```erlang
-spec register_range_data_cb(Daemon :: pid(),
                             DataCbs :: #confd_data_cbs{},
                             Lower :: [Lower :: value()],
                             Higher :: [Higher :: value()],
                             IKP :: ikeypath()) ->
                                ok | {error, Reason :: term()}.
```

Related types: [ikeypath()](#ikeypath-0), [value()](#value-0)

Register data callbacks for a range of keys.


### register_trans_cb/2

```erlang
-spec register_trans_cb(Daemon :: pid(), TransCbs :: #confd_trans_cbs{}) ->
                           ok | {error, Reason :: term()}.
```

Register transaction phase callbacks. See confd_lib_dp(3) for a thorough description of the transaction phases. The record #confd_trans_cbs\{\} contains callbacks for all of the phases for a transaction. If we use this external data api only for statistics data only the init() and the finish() callbacks should be used. The init() callback must return 'ok', \{error, String\}, or \{ok, Tctx\} where Tctx is the same #confd_trans_ctx that was supplied to the init callback but possibly with the opaque field filled in. This field is meant to be used by the user to manage user data.


### register_trans_validate_cb/2

```erlang
-spec register_trans_validate_cb(Daemon :: pid(),
                                 ValidateCbs ::
                                     #confd_trans_validate_cbs{}) ->
                                    ok | {error, Reason :: term()}.
```

Register validation transaction callback. This function maps an init and a finish function for validations. See seme function in confd_lib_dp(3) The init() callback must return 'ok', \{error, String\}, or \{ok, Tctx\} where Tctx is the same #confd_trans_ctx that was supplied to the init callback but possibly with the opaque field filled in.


### register_valpoint_cb/2

```erlang
-spec register_valpoint_cb(Daemon :: pid(),
                           ValpointCbs :: #confd_valpoint_cb{}) ->
                              ok | {error, Reason :: term()}.
```

Register validation callback on a valpoint


### set_daemon_d_opaque/2

```erlang
-spec set_daemon_d_opaque(Daemon :: pid(), Dopaque :: term()) -> ok.
```

Set the d_opaque field in the daemon which is typically used by the callbacks


### set_daemon_flags/2

```erlang
-spec set_daemon_flags(Daemon, Flags) -> ok
                          when
                              Daemon :: pid(),
                              Flags :: non_neg_integer().
```

Change the flag settings for a daemon. See ?CONFD_DAEMON_FLAG_XXX in econfd.hrl for the available flags. This function should be called immediately after creating the daemon context with init_daemon/6.


### set_debug/3

```erlang
-spec set_debug(Daemon :: pid(),
                DebugLevel :: integer(),
                Estream :: io:device()) ->
                   ok.
```

Change the DebugLevel and/or Estream for a running daemon


### start/0

```erlang
-spec start() -> ok | {error, Reason :: term()}.
```

Starts the econfd application.


### stop_daemon/1

```erlang
-spec stop_daemon(Daemon :: pid()) -> ok.
```

Silently stop a daemon


### unpad/1

```erlang
unpad(_)
```
