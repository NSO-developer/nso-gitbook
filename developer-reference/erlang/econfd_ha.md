# Module econfd_ha

An Erlang interface equivalent to the HA C-API (documented in confd_lib_ha(3)).


## Types

[ha\_node/0](#ha_node0)

### ha_node/0

```erlang
-type ha_node() :: #ha_node{}.
```

## Functions

[bemaster(Socket, NodeId)](#bemaster2) - Instruct a HA node to be primary in the cluster.


[benone(Socket)](#benone1) - Instruct a HA node to be nothing in the cluster.


[beprimary(Socket, NodeId)](#beprimary2) - Instruct a HA node to be primary in the cluster.


[berelay(Socket)](#berelay1) - Instruct a HA secondary to be a relay for other secondaries.


[besecondary(Socket, NodeId, PrimaryNodeId, WaitReplyBool)](#besecondary4) - Instruct a HA node to be secondary in the cluster where PrimaryNodeId is primary.


[beslave(Socket, NodeId, PrimaryNodeId, WaitReplyBool)](#beslave4) - Instruct a HA node to be secondary in the cluster where PrimaryNodeId is primary.


[close(Socket)](#close1) - Close the HA connection.


[connect(Path, Token)](#connect2)

[connect(Address, Port, Token)](#connect3)

[do\_connect(Address, Token)](#do_connect2) - Connect to the HA subsystem.

[getstatus(Socket)](#getstatus1) - Request status from a HA node.


[secondary\_dead(Socket, NodeId)](#secondary_dead2) - Instruct ConfD that another node is dead.


[slave\_dead(Socket, NodeId)](#slave_dead2) - Instruct ConfD that another node is dead.


### bemaster/2

```erlang
-spec bemaster(Socket, NodeId) -> Result
                  when
                      Socket :: econfd:socket(),
                      NodeId :: econfd:value(),
                      Result :: ok | {error, econfd:error_reason()}.
```

Related types: [econfd:error\_reason()](econfd.md#error_reason0), [econfd:socket()](econfd.md#socket0), [econfd:value()](econfd.md#value0)

Instruct a HA node to be primary in the cluster.


### benone/1

```erlang
-spec benone(Socket) -> Result
                when
                    Socket :: econfd:socket(),
                    Result :: ok | {error, econfd:error_reason()}.
```

Related types: [econfd:error\_reason()](econfd.md#error_reason0), [econfd:socket()](econfd.md#socket0)

Instruct a HA node to be nothing in the cluster.


### beprimary/2

```erlang
-spec beprimary(Socket, NodeId) -> Result
                   when
                       Socket :: econfd:socket(),
                       NodeId :: econfd:value(),
                       Result :: ok | {error, econfd:error_reason()}.
```

Related types: [econfd:error\_reason()](econfd.md#error_reason0), [econfd:socket()](econfd.md#socket0), [econfd:value()](econfd.md#value0)

Instruct a HA node to be primary in the cluster.


### berelay/1

```erlang
-spec berelay(Socket) -> Result
                 when
                     Socket :: econfd:socket(),
                     Result :: ok | {error, econfd:error_reason()}.
```

Related types: [econfd:error\_reason()](econfd.md#error_reason0), [econfd:socket()](econfd.md#socket0)

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

Related types: [ha\_node()](#ha_node0), [econfd:error\_reason()](econfd.md#error_reason0), [econfd:socket()](econfd.md#socket0), [econfd:value()](econfd.md#value0)

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

Related types: [ha\_node()](#ha_node0), [econfd:error\_reason()](econfd.md#error_reason0), [econfd:socket()](econfd.md#socket0), [econfd:value()](econfd.md#value0)

Instruct a HA node to be secondary in the cluster where PrimaryNodeId is primary.


### close/1

```erlang
-spec close(Socket) -> Result
               when
                   Socket :: econfd:socket(),
                   Result :: ok | {error, econfd:error_reason()}.
```

Related types: [econfd:error\_reason()](econfd.md#error_reason0), [econfd:socket()](econfd.md#socket0)

Close the HA connection.


### connect/2

```erlang
-spec connect(Path, Token) -> econfd:connect_result()
                 when Path :: string(), Token :: binary();
             (Address, Token) -> econfd:connect_result()
                 when Address :: econfd:ip(), Token :: binary().
```

Related types: [econfd:connect\_result()](econfd.md#connect_result0), [econfd:ip()](econfd.md#ip0)

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

Related types: [econfd:connect\_result()](econfd.md#connect_result0)

Connect to the HA subsystem.

If the port is changed it must also be changed in confd.conf To close a HA socket, use `close/1`.


### getstatus/1

```erlang
-spec getstatus(Socket) -> Result
                   when
                       Socket :: econfd:socket(),
                       Result :: ok | {error, econfd:error_reason()}.
```

Related types: [econfd:error\_reason()](econfd.md#error_reason0), [econfd:socket()](econfd.md#socket0)

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

Related types: [econfd:error\_reason()](econfd.md#error_reason0), [econfd:socket()](econfd.md#socket0), [econfd:value()](econfd.md#value0)

Instruct ConfD that another node is dead.


### slave_dead/2

```erlang
-spec slave_dead(Socket, NodeId) -> Result
                    when
                        Socket :: econfd:socket(),
                        NodeId :: econfd:value(),
                        Result :: ok | {error, econfd:error_reason()}.
```

Related types: [econfd:error\_reason()](econfd.md#error_reason0), [econfd:socket()](econfd.md#socket0), [econfd:value()](econfd.md#value0)

Instruct ConfD that another node is dead.

