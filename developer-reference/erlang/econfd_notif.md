# Module econfd_notif

An Erlang interface equivalent to the event notifications C-API, (documented in confd_lib_events(3)).


## Types

[notif\_option/0](#notif_option-0)\
[notification/0](#notification-0)

### notif_option/0

```erlang
-type notif_option() ::
          {heartbeat_interval, integer()} |
          {health_check_interval, integer()} |
          {stream_name, atom()} |
          {start_time, econfd:datetime()} |
          {stop_time, econfd:datetime()} |
          {xpath_filter, binary()} |
          {usid, integer()} |
          {verbosity, 0..3}.
```

Related types: [econfd:datetime()](econfd.md#datetime-0)

\-------------------------------------------------------------------- External functions --------------------------------------------------------------------


### notification/0

```erlang
-type notification() ::
          #econfd_notif_audit{} |
          #econfd_notif_syslog{} |
          #econfd_notif_commit_simple{} |
          #econfd_notif_commit_diff{} |
          #econfd_notif_user_session{} |
          #econfd_notif_ha{} |
          #econfd_notif_subagent_info{} |
          #econfd_notif_commit_failed{} |
          #econfd_notif_snmpa{} |
          #econfd_notif_forward_info{} |
          #econfd_notif_confirmed_commit{} |
          #econfd_notif_upgrade{} |
          #econfd_notif_progress{} |
          #econfd_notif_stream_event{} |
          #econfd_notif_confd_compaction{} |
          #econfd_notif_ncs_cq_progress{} |
          #econfd_notif_ncs_audit_network{} |
          confd_heartbeat | confd_health_check | confd_reopen_logs |
          ncs_package_reload.
```

## Functions

[close(Socket)](#close-1)\
[connect(Path, Mask)](#connect-2)\
[connect(Path, Mask, Options)](#connect-3)\
[connect(Address, Port, Mask, Options)](#connect-4)\
[do\_connect(Address, Mask, Options)](#do_connect-3)\
[handle\_notif(Notif)](#handle_notif-1)\
[maybe\_element(N, Tuple)](#maybe_element-2)\
[notification\_done(Socket, Thandle)](#notification_done-2)\
[notification\_done(Socket, Usid, NotifType)](#notification_done-3)\
[recv(Socket)](#recv-1)\
[recv(Socket, Timeout)](#recv-2)\
[unpack\_ha\_node(\_)](#unpack_ha_node-1)

### close/1

```erlang
-spec close(Socket) -> Result
               when
                   Socket :: econfd:socket(),
                   Result :: ok | {error, econfd:error_reason()}.
```

Related types: [econfd:error\_reason()](econfd.md#error_reason-0), [econfd:socket()](econfd.md#socket-0)

Close the event notification connection.


### connect/2

```erlang
-spec connect(Path, Mask) -> econfd:connect_result()
                 when Path :: string(), Mask :: integer();
             (Address, Mask) -> econfd:connect_result()
                 when Address :: econfd:ip(), Mask :: integer().
```

Related types: [econfd:connect\_result()](econfd.md#connect_result-0), [econfd:ip()](econfd.md#ip-0)

### connect/3

```erlang
-spec connect(Path, Mask, Options) -> econfd:connect_result()
                 when
                     Path :: string(),
                     Mask :: integer(),
                     Options :: [notif_option()];
             (Address, Port, Mask) -> econfd:connect_result()
                 when
                     Address :: econfd:ip(),
                     Port :: non_neg_integer(),
                     Mask :: integer().
```

Related types: [notif\_option()](#notif_option-0), [econfd:connect\_result()](econfd.md#connect_result-0), [econfd:ip()](econfd.md#ip-0)

### connect/4

```erlang
connect(Address, Port, Mask, Options)
```

### do_connect/3

```erlang
-spec do_connect(Address, Mask, Options) -> econfd:connect_result()
                    when
                        Address ::
                            #econfd_conn_ip{} | #econfd_conn_local{},
                        Mask :: integer(),
                        Options :: [Option].
```

Related types: [econfd:connect\_result()](econfd.md#connect_result-0)

Connect to the notif server.


### handle_notif/1

```erlang
-spec handle_notif(Notif) -> notification()
                      when Notif :: binary() | term().
```

Related types: [notification()](#notification-0)

Decode the notif message and return corresponding record depending on the type of the message.

It is the resposibility of the application to read data from the notifications socket.


### maybe_element/2

```erlang
maybe_element(N, Tuple)
```

### notification_done/2

```erlang
-spec notification_done(Socket, Thandle) -> Result
                           when
                               Socket :: econfd:socket(),
                               Thandle :: integer(),
                               Result ::
                                   ok | {error, econfd:error_reason()}.
```

Related types: [econfd:error\_reason()](econfd.md#error_reason-0), [econfd:socket()](econfd.md#socket-0)

Indicate that we're done with diff processing.

Whenever we subscribe to ?CONFD_NOTIF_COMMIT_DIFF we must indicate to confd that we're done with the diff processing. The transaction hangs until we've done this.


### notification_done/3

```erlang
-spec notification_done(Socket, Usid, NotifType) -> Result
                           when
                               Socket :: econfd:socket(),
                               Usid :: integer(),
                               NotifType :: audit | audit_network,
                               Result ::
                                   ok | {error, econfd:error_reason()}.
```

Related types: [econfd:error\_reason()](econfd.md#error_reason-0), [econfd:socket()](econfd.md#socket-0)

Indicate that we're done with notif processing.

When we subscribe to ?CONFD_NOTIF_AUDIT with ?CONFD_NOTIF_AUDIT_SYNC or to ?NCS_NOTIF_AUDIT_NETWORK with ?NCS_NOTIF_AUDIT_NETWORK_SYNC, we must indicate that we're done with the notif processing. The user-session hangs until we've done this.


### recv/1

```erlang
recv(Socket)
```

Equivalent to [recv(Socket, infinity)](#recv-2).


### recv/2

```erlang
-spec recv(Socket, Timeout) -> Result
              when
                  Socket :: econfd:socket(),
                  Timeout :: non_neg_integer() | infinity,
                  Result ::
                      {ok, notification()} |
                      {error, econfd:transport_error()} |
                      {error, econfd:error_reason()}.
```

Related types: [notification()](#notification-0), [econfd:error\_reason()](econfd.md#error_reason-0), [econfd:socket()](econfd.md#socket-0), [econfd:transport\_error()](econfd.md#transport_error-0)

Wait for an event notification message and return corresponding record depending on the type of the message.

The logno element in the record is an integer. These integers can be used as an index to the function `econfd_logsyms:get_logsym/1` in order to get a textual description for the event.

When recv/2 returns <tt>\{error, timeout\}</tt> the connection (and its event subscriptions) is still active and the application needs to call recv/2 again. But if recv/2 returns <tt>\{error, Reason\}</tt> the connection to ConfD is closed and all event subscriptions associated with it are cleared.


### unpack_ha_node/1

```erlang
unpack_ha_node(_)
```
