# Module econfd_ha

An Erlang interface equivalent to the HA C-API (documented in confd_lib_ha(3)).


## Types

### ha_node/0

```erlang
-type ha_node() :: #ha_node{}.
```

## Functions

### bemaster/2

```erlang
-spec bemaster(Socket, NodeId) -> Result
                  when
                      Socket :: econfd:socket(),
                      NodeId :: econfd:value(),
                      Result :: ok | {error, econfd:error_reason()}.
```

Related types: [econfd:error\_reason()](econfd.md#error_reason-0), [econfd:socket()](econfd.md#socket-0), [econfd:value()](econfd.md#value-0)

Instruct a HA node to be primary in the cluster.


### benone/1

```erlang
-spec benone(Socket) -> Result
                when
                    Socket :: econfd:socket(),
                    Result :: ok | {error, econfd:error_reason()}.
```

Related types: [econfd:error\_reason()](econfd.md#error_reason-0), [econfd:socket()](econfd.md#socket-0)

Instruct a HA node to be nothing in the cluster.


### beprimary/2

```erlang
-spec beprimary(Socket, NodeId) -> Result
                   when
                       Socket :: econfd:socket(),
                       NodeId :: econfd:value(),
                       Result :: ok | {error, econfd:error_reason()}.
```

Related types: [econfd:error\_reason()](econfd.md#error_reason-0), [econfd:socket()](econfd.md#socket-0), [econfd:value()](econfd.md#value-0)

Instruct a HA node to be primary in the cluster.


### berelay/1

```erlang
-spec berelay(Socket) -> Result
                 when
                     Socket :: econfd:socket(),
                     Result :: ok | {error, econfd:error_reason()}.
```

Related types: [econfd:error\_reason()](econfd.md#error_reason-0), [econfd:socket()](econfd.md#socket-0)

Instruct a HA secondary to be a relay for other secondaries.


### besecondary/4

```erlang
-spec besecondary(Socket, NodeId, PrimaryNodeId, WaitReplyBool) ->
                     Result
                     when
                         Socket :: econfd:socket(),
                         NodeId :: econfd:value(),
                         PrimaryNodeId :: ha_node(),
                         WaitReplyBool :: integer(),
                         Result :: ok | {error, econfd:error_reason()}.
```

Related types: [ha\_node()](#ha_node-0), [econfd:error\_reason()](econfd.md#error_reason-0), [econfd:socket()](econfd.md#socket-0), [econfd:value()](econfd.md#value-0)

Instruct a HA node to be secondary in the cluster where PrimaryNodeId is primary.


### beslave/4

```erlang
-spec beslave(Socket, NodeId, PrimaryNodeId, WaitReplyBool) -> Result
                 when
                     Socket :: econfd:socket(),
                     NodeId :: econfd:value(),
                     PrimaryNodeId :: ha_node(),
                     WaitReplyBool :: integer(),
                     Result :: ok | {error, econfd:error_reason()}.
```

Related types: [ha\_node()](#ha_node-0), [econfd:error\_reason()](econfd.md#error_reason-0), [econfd:socket()](econfd.md#socket-0), [econfd:value()](econfd.md#value-0)

Instruct a HA node to be secondary in the cluster where PrimaryNodeId is primary.


### close/1

```erlang
-spec close(Socket) -> Result
               when
                   Socket :: econfd:socket(),
                   Result :: ok | {error, econfd:error_reason()}.
```

Related types: [econfd:error\_reason()](econfd.md#error_reason-0), [econfd:socket()](econfd.md#socket-0)

Close the HA connection.


### connect/2

```erlang
-spec connect(Path, Token) -> econfd:connect_result()
                 when Path :: string(), Token :: binary();
             (Address, Token) -> econfd:connect_result()
                 when Address :: econfd:ip(), Token :: binary().
```

Related types: [econfd:connect\_result()](econfd.md#connect_result-0), [econfd:ip()](econfd.md#ip-0)

### connect/3

```erlang
connect(Address, Port, Token)
```

### do_connect/2

```erlang
-spec do_connect(Address, Token) -> econfd:connect_result()
                    when
                        Address ::
                            #econfd_conn_ip{} | #econfd_conn_local{},
                        Token :: binary().
```

Related types: [econfd:connect\_result()](econfd.md#connect_result-0)

Connect to the HA subsystem.

If the port is changed it must also be changed in confd.conf To close a HA socket, use `close/1`.


### getstatus/1

```erlang
-spec getstatus(Socket) -> Result
                   when
                       Socket :: econfd:socket(),
                       Result :: ok | {error, econfd:error_reason()}.
```

Related types: [econfd:error\_reason()](econfd.md#error_reason-0), [econfd:socket()](econfd.md#socket-0)

Request status from a HA node.


### secondary_dead/2

```erlang
-spec secondary_dead(Socket, NodeId) -> Result
                        when
                            Socket :: econfd:socket(),
                            NodeId :: econfd:value(),
                            Result ::
                                ok | {error, econfd:error_reason()}.
```

Related types: [econfd:error\_reason()](econfd.md#error_reason-0), [econfd:socket()](econfd.md#socket-0), [econfd:value()](econfd.md#value-0)

Instruct ConfD that another node is dead.


### slave_dead/2

```erlang
-spec slave_dead(Socket, NodeId) -> Result
                    when
                        Socket :: econfd:socket(),
                        NodeId :: econfd:value(),
                        Result :: ok | {error, econfd:error_reason()}.
```

Related types: [econfd:error\_reason()](econfd.md#error_reason-0), [econfd:socket()](econfd.md#socket-0), [econfd:value()](econfd.md#value-0)

Instruct ConfD that another node is dead.

