# Module econfd_cdb

An Erlang interface equivalent to the CDB C-API (documented in confd_lib_cdb(3)).

The econfd_cdb library is used to connect to the ConfD built in XML database, CDB. The purpose of this API to provide a read and subscription API to CDB.

CDB owns and stores the configuration data and the user of the API wants to read that configuration data and also get notified when someone through either NETCONF, the CLI, the Web UI, or MAAPI modifies the data so that the application can re-read the configuration data and act accordingly.

### Paths

In the C lib a path is a string. Assume the following YANG fragment:

```text
         container hosts {
           list host {
             key name;
             leaf name {
               type string;
             }
             leaf domain {
               type string;
             }
             leaf defgw {
               type inet:ip-address;
             }
             container interfaces {
               list interface {
                 key name;
                 leaf name {
                   type string;
                 }
                 leaf ip {
                   type inet:ip-address;
                 }
                 leaf mask {
                   type inet:ip-address;
                 }
                 leaf enabled {
                   type boolean;
                 }
               }
             }
           }
         }
```

Furthermore assume the database is populated with the following data

```text
             <hosts xmlns="http://acme.com/ns/hst/1.0">
                <host>
                  <name>buzz</name>
                  <domain>tail-f.com</domain>
                  <defgw>192.168.1.1</defgw>
                  <interfaces>
                    <interface>
                      <name>eth0</name>
                      <ip>192.168.1.61</ip>
                      <mask>255.255.255.0</mask>
                      <enabled>true</enabled>
                    </interface>
                    <interface>
                      <name>eth1</name>
                      <ip>10.77.1.44</ip>
                      <mask>255.255.0.0</mask>
                      <enabled>false</enabled>
                    </interface>
                  </interfaces>
                </host>
              </hosts>
```

The format path "/hosts/host\{buzz\}/defgw" refers to the leaf element called defgw of the host whose key (name element) is buzz.

The format path "/hosts/host\{buzz\}/interfaces/interface\{eth0\}/ip" refers to the leaf element called "ip" in the "eth0" interface of the host called "buzz".

In the Erlang CDB and MAAPI interfaces we use ikeypath() lists instead to address individual objects in the XML tree. The IkeyPath is backwards, thus the two above paths are expressed as

```text
   [defgw, {<<"buzz">>}, host, [NS|hosts]]
   [ip, {<<"eth0">>}, interface, interfaces, {<<"buzz">>}, host, [NS|hosts]]
```

It is possible loop through all entries in a list as in:

```text
   N = econfd_cdb:num_instances(CDB, [host,[NS|hosts]]),
   lists:map(fun(I) ->
               econfd_cdb:get_elem(CDB, [defgw,[I],host,[NS|hosts]]), .......
             end, lists:seq(0, N-1))
   
```

Thus in the list with length N \[Index] is an implicit key during the life of a CDB read session.


## Types

[cdb\_sess/0](#cdb_sess-0)\
[compaction\_dbfile/0](#compaction_dbfile-0)\
[compaction\_info/0](#compaction_info-0)\
[dbtype/0](#dbtype-0)\
[err/0](#err-0)\
[sub\_ns/0](#sub_ns-0)\
[sub\_type/0](#sub_type-0)\
[subscription\_sync\_type/0](#subscription_sync_type-0)

### cdb_sess/0

```erlang
-type cdb_sess() :: #cdb_session{}.
```

A datastructure which is used as a handle to all the of the access functions


### compaction_dbfile/0

```erlang
-type compaction_dbfile() :: 1 | 2 | 3.
```

CDB files used for compaction. CDB file can be either

* 1 = A.cdb
* 2 = O.cdb
* 3 = S.cdb


### compaction_info/0

```erlang
-type compaction_info() :: #compaction_info{}.
```

A datastructure to handle compaction information


### dbtype/0

```erlang
-type dbtype() :: 1 | 2 | 3 | 4.
```

When we open CDB sessions we must choose which database to read or write from/to. These ints are defined in econfd.hrl


### err/0

```erlang
-type err() :: {error, {integer(), binary()}} | {error, closed}.
```

Errors can be either

* \{error, Ecode::integer(), Reason::binary()\} where Ecode is one of the error codes defined in econfd_errors.hrl, and Reason is (possibly empty) textual description
* \{error, closed\} if the socket gets closed


### sub_ns/0

```erlang
-type sub_ns() :: econfd:namespace() | ''.
```

Related types: [econfd:namespace()](econfd.md#namespace-0)

A namespace or use '' as wildcard (any namespace)


### sub_type/0

```erlang
-type sub_type() :: 1 | 2 | 3.
```

Subscription type

* ?CDB_SUB_RUNNING - commit subscription.
* ?CDB_SUB_RUNNING_TWOPHASE - two phase subscription, i.e. notification will be received for prepare, commit, and possibly abort.
* ?CDB_SUB_OPERATIONAL - subscription for changes to CDB operational data.


### subscription_sync_type/0

```erlang
-type subscription_sync_type() :: 1 | 2 | 3 | 4.
```

Return value from the fun passed to wait/3, indicating what to do with further notifications coming from this transaction. These ints are defined in econfd.hrl


## Functions

[cd(CDB, IKeypath)](#cd-2)\
[close(Cdb\_session)](#close-1)\
[collect\_until(T, Stop, Sofar)](#collect_until-3)\
[connect()](#connect-0)\
[connect(Path)](#connect-1)\
[connect(Path, ClientName)](#connect-2)\
[connect(Address, Port, ClientName)](#connect-3)\
[create(CDB, IKeypath)](#create-2)\
[delete(CDB, IKeypath)](#delete-2)\
[diff\_iterate(CDB, SubPoint, Fun, Flags, State)](#diff_iterate-5)\
[do\_connect(Address, ClientName)](#do_connect-2)\
[end\_session(CDB)](#end_session-1)\
[exists(CDB, IKeypath)](#exists-2)\
[get\_case(CDB, IKeypath, Choice)](#get_case-3)\
[get\_compaction\_info(Socket, Dbfile)](#get_compaction_info-2)\
[get\_elem(CDB, IKeypath)](#get_elem-2)\
[get\_modifications\_cli(CDB, SubPoint)](#get_modifications_cli-2)\
[get\_modifications\_cli(CDB, SubPoint, Flags)](#get_modifications_cli-3)\
[get\_object(CDB, IKeypath)](#get_object-2)\
[get\_objects(CDB, IKeypath, StartIndex, NumEntries)](#get_objects-4)\
[get\_phase(Socket)](#get_phase-1)\
[get\_txid(Socket)](#get_txid-1)\
[get\_values(CDB, IKeypath, Values)](#get_values-3)\
[ibool(X)](#ibool-1)\
[index(CDB, IKeypath)](#index-2)\
[initiate\_journal\_compaction(Socket)](#initiate_journal_compaction-1)\
[initiate\_journal\_dbfile\_compaction(Socket, Dbfile)](#initiate_journal_dbfile_compaction-2)\
[mk\_elem(List)](#mk_elem-1)\
[new\_session(Socket, Db)](#new_session-2)\
[new\_session(Socket, Db, Flags)](#new_session-3)\
[next\_index(CDB, IKeypath)](#next_index-2)\
[num\_instances(CDB, IKeypath)](#num_instances-2)\
[parse\_keystring0(Str)](#parse_keystring0-1)\
[request(CDB, Op)](#request-2)\
[request(CDB, Op, Arg)](#request-3)\
[set\_case(CDB, IKeypath, Choice, Case)](#set_case-4)\
[set\_elem(CDB, Value, IKeypath)](#set_elem-3)\
[set\_elem2(CDB, ValueBin, IKeypath)](#set_elem2-3)\
[set\_object(CDB, ValueList, IKeypath)](#set_object-3)\
[set\_values(CDB, ValueList, IKeypath)](#set_values-3)\
[subscribe(CDB, Priority, MatchKeyString)](#subscribe-3)\
[subscribe(CDB, Priority, Ns, MatchKeyString)](#subscribe-4)\
[subscribe(CDB, Type, Priority, Ns, MatchKeyString)](#subscribe-5)\
[subscribe(CDB, Type, Flags, Priority, Ns, MatchKeyString)](#subscribe-6)\
[subscribe\_done(CDB)](#subscribe_done-1)\
[subscribe\_session(Socket)](#subscribe_session-1)\
[sync\_subscription\_socket(CDB, SyncType, TimeOut, Fun)](#sync_subscription_socket-4)\
[trigger\_oper\_subscriptions(Socket)](#trigger_oper_subscriptions-1)\
[trigger\_oper\_subscriptions(Socket, SubPoints)](#trigger_oper_subscriptions-2)\
[trigger\_oper\_subscriptions(Socket, SubPoints, Flags)](#trigger_oper_subscriptions-3)\
[trigger\_subscriptions(Socket)](#trigger_subscriptions-1)\
[trigger\_subscriptions(Socket, SubPoints)](#trigger_subscriptions-2)\
[wait(CDB, TimeOut, Fun)](#wait-3)\
[wait\_start(Socket)](#wait_start-1)\
[xx(Str, Acc)](#xx-2)\
[xx(T, Sofar, Acc)](#xx-3)\
[yy(Str)](#yy-1)\
[yy(T, Sofar)](#yy-2)

### cd/2

```erlang
-spec cd(CDB, IKeypath) -> Result
            when
                CDB :: cdb_sess(),
                IKeypath :: econfd:ikeypath(),
                Result :: ok | err().
```

Related types: [cdb\_sess()](#cdb_sess-0), [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0)

Change the context node of the session.

Note that this function can not be used as an existence test.


### close/1

```erlang
-spec close(Cdb_session) -> Result
               when
                   Cdb_session :: Socket | CDB,
                   Result :: ok | {error, econfd:error_reason()}.
```

Related types: [econfd:error\_reason()](econfd.md#error_reason-0)

End the session and close the socket.


### collect_until/3

```erlang
collect_until(T, Stop, Sofar)
```

### connect/0

```erlang
-spec connect() -> econfd:connect_result().
```

Related types: [econfd:connect\_result()](econfd.md#connect_result-0)

Equivalent to [connect(\{127, 0, 0, 1\})](#connect-1).


### connect/1

```erlang
-spec connect(Path) -> econfd:connect_result() when Path :: string();
             (Address) -> econfd:connect_result()
                 when Address :: econfd:ip().
```

Related types: [econfd:connect\_result()](econfd.md#connect_result-0), [econfd:ip()](econfd.md#ip-0)

### connect/2

```erlang
-spec connect(Path, ClientName) -> econfd:connect_result()
                 when Path :: string(), ClientName :: binary();
             (Address, Port) -> econfd:connect_result()
                 when Address :: econfd:ip(), Port :: non_neg_integer().
```

Related types: [econfd:connect\_result()](econfd.md#connect_result-0), [econfd:ip()](econfd.md#ip-0)

### connect/3

```erlang
-spec connect(Address, Port, ClientName) -> econfd:connect_result()
                 when
                     Address :: econfd:ip(),
                     Port :: non_neg_integer(),
                     ClientName :: binary().
```

Related types: [econfd:connect\_result()](econfd.md#connect_result-0), [econfd:ip()](econfd.md#ip-0)

### create/2

```erlang
-spec create(CDB, IKeypath) -> ok | err()
                when CDB :: cdb_sess(), IKeypath :: econfd:ikeypath().
```

Related types: [cdb\_sess()](#cdb_sess-0), [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0)

Only for CDB operational data: Create the element denoted by IKP.


### delete/2

```erlang
-spec delete(CDB, IKeypath) -> ok | err()
                when CDB :: cdb_sess(), IKeypath :: econfd:ikeypath().
```

Related types: [cdb\_sess()](#cdb_sess-0), [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0)

Only for CDB operational data: Delete the element denoted by IKP.


### diff_iterate/5

```erlang
-spec diff_iterate(CDB, SubPoint, Fun, Flags, State) -> Result
                      when
                          CDB :: cdb_sess(),
                          SubPoint :: pos_integer(),
                          Fun ::
                              fun((IKeypath, Op, OldValue, Value, State) ->
                                      {ok, Ret, State} | {error, term()}),
                          Flags :: non_neg_integer(),
                          State :: term(),
                          Result :: {ok, State} | {error, term()}.
```

Related types: [cdb\_sess()](#cdb_sess-0)

Iterate over changes in CDB after a subscription triggers.

This function can be called from within the fun passed to wait/3. When called it will invoke Fun for each change that matched the Point. If Flags is ?CDB_ITER_WANT_PREV, OldValue will be the previous value (if available). When OldValue or Value is not available (or requested) they will be the atom 'undefined'. When Op == ?MOP_MOVED_AFTER (only for "ordered-by user" list entry), Value == \{\} means that the entry was moved first in the list, otherwise Value is a econfd:key() tuple that identifies the entry it was moved after.


### do_connect/2

```erlang
-spec do_connect(Address, ClientName) -> econfd:connect_result()
                    when
                        Address ::
                            #econfd_conn_ip{} | #econfd_conn_local{},
                        ClientName :: binary().
```

Related types: [econfd:connect\_result()](econfd.md#connect_result-0)

Connect to CDB.

If the port is changed it must also be changed in confd.conf A call to cdb_connect() is typically followed by a call to either new_session() for a reading session or a call to subscribe_session() for a subscription socket or calls to any of the write API functions for a data socket. ClientName is a string which confd will use as an identifier when e.g. reporting status.


### end_session/1

```erlang
-spec end_session(CDB) -> {ok, econfd:socket()} when CDB :: cdb_sess().
```

Related types: [cdb\_sess()](#cdb_sess-0), [econfd:socket()](econfd.md#socket-0)

Terminate the session.

This releases the lock on CDB which is active during a read session. Returns a socket that can be re-used in new_session/2 We use connect() to establish a read socket to CDB. When the socket is closed, the read session is ended. We can reuse the same socket for another read session, but we must then end the session and create another session using new_session/2. %% While we have a live CDB read session, CDB is locked for writing. Thus all external entities trying to modify CDB are blocked as long as we have an open CDB read session. It is very important that we remember to either end_session() or close() once we have read what we wish to read.


### exists/2

```erlang
-spec exists(CDB, IKeypath) -> Result
                when
                    CDB :: cdb_sess(),
                    IKeypath :: econfd:ikeypath(),
                    Result :: {ok, boolean()} | err().
```

Related types: [cdb\_sess()](#cdb_sess-0), [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0)

Checks existense of an object.

Leafs in the data model may be optional, and presence containers and list entries may or may not exist. This function checks whether a node exists in CDB, returning Int == 1 if it exists, Int == 0 if not.


### get_case/3

```erlang
-spec get_case(CDB, IKeypath, Choice) -> Result
                  when
                      CDB :: cdb_sess(),
                      IKeypath :: econfd:ikeypath(),
                      Choice :: econfd:qtag() | [econfd:qtag()],
                      Result :: {ok, econfd:qtag()} | err().
```

Related types: [cdb\_sess()](#cdb_sess-0), [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:qtag()](econfd.md#qtag-0)

Returns the current case for a choice.


### get_compaction_info/2

```erlang
-spec get_compaction_info(Socket, Dbfile) -> Result
                             when
                                 Socket :: econfd:socket(),
                                 Dbfile :: compaction_dbfile(),
                                 Result ::
                                     {ok, Info} |
                                     {error, econfd:error_reason()}.
```

Related types: [compaction\_dbfile()](#compaction_dbfile-0), [econfd:error\_reason()](econfd.md#error_reason-0), [econfd:socket()](econfd.md#socket-0)

Retrieves compaction info on Dbfile.


### get_elem/2

```erlang
-spec get_elem(CDB, IKeypath) -> Result
                  when
                      CDB :: cdb_sess(),
                      IKeypath :: econfd:ikeypath(),
                      Result :: {ok, econfd:value()} | err().
```

Related types: [cdb\_sess()](#cdb_sess-0), [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:value()](econfd.md#value-0)

Read an element.

Note, the C interface has separate get functions for different types.


### get_modifications_cli/2

```erlang
-spec get_modifications_cli(CDB, SubPoint) -> Result
                               when
                                   CDB :: cdb_sess(),
                                   SubPoint :: pos_integer(),
                                   Result ::
                                       {ok, CliString} |
                                       {error, econfd:error_reason()}.
```

Related types: [cdb\_sess()](#cdb_sess-0), [econfd:error\_reason()](econfd.md#error_reason-0)

Equivalent to [get_modifications_cli(CDB, Point, 0)](#get_modifications_cli-3).


### get_modifications_cli/3

```erlang
-spec get_modifications_cli(CDB, SubPoint, Flags) -> Result
                               when
                                   CDB :: cdb_sess(),
                                   SubPoint :: pos_integer(),
                                   Flags :: non_neg_integer(),
                                   Result ::
                                       {ok, CliString} |
                                       {error, econfd:error_reason()}.
```

Related types: [cdb\_sess()](#cdb_sess-0), [econfd:error\_reason()](econfd.md#error_reason-0)

Return Return a string with the CLI commands that corresponds to the changes that triggered subscription.


### get_object/2

```erlang
-spec get_object(CDB, IKeypath) -> Result
                    when
                        CDB :: cdb_sess(),
                        IKeypath :: econfd:ikeypath(),
                        Result :: {ok, [econfd:value()]} | err().
```

Related types: [cdb\_sess()](#cdb_sess-0), [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:value()](econfd.md#value-0)

Returns all the values in a container or list entry.


### get_objects/4

```erlang
-spec get_objects(CDB, IKeypath, StartIndex, NumEntries) -> Result
                     when
                         CDB :: cdb_sess(),
                         IKeypath :: econfd:ikeypath(),
                         StartIndex :: integer(),
                         NumEntries :: integer(),
                         Result :: {ok, [[econfd:value()]]} | err().
```

Related types: [cdb\_sess()](#cdb_sess-0), [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:value()](econfd.md#value-0)

Returns all the values for NumEntries list entries.

Starting at index StartIndex. The return value has one Erlang list for each YANG list entry, i.e. it is a list of NumEntries lists.


### get_phase/1

```erlang
-spec get_phase(Socket) -> Result
                   when
                       Socket :: econfd:socket(),
                       Result :: {ok, {Phase, Type}} | err().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Get CDB start-phase.


### get_txid/1

```erlang
-spec get_txid(Socket) -> Result
                  when
                      Socket :: econfd:socket(),
                      Result :: {ok, PrimaryNode, Now} | {ok, Now}.
```

Related types: [econfd:socket()](econfd.md#socket-0)

Get CDB transaction id.

When we are a cdb client, and ConfD restarts, we can use this function to retrieve the last CDB transaction id. If it the same as earlier we don't need re-read the CDB data. This is also useful when we're a CDB client in a HA setup.


### get_values/3

```erlang
-spec get_values(CDB, IKeypath, Values) -> Result
                    when
                        CDB :: cdb_sess(),
                        IKeypath :: econfd:ikeypath(),
                        Values :: [econfd:tagval()],
                        Result :: {ok, [econfd:tagval()]} | err().
```

Related types: [cdb\_sess()](#cdb_sess-0), [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:tagval()](econfd.md#tagval-0)

Returns the values for the leafs that have the "value" 'not_found' in the Values list.

This can be used to read an arbitrary set of sub-elements of a container or list entry. The return value is a list of the same length as Values, i.e. the requested leafs are in the same position in the returned list as in the Values argument. The elements in the returned list are always "canonical" though, i.e. of the form [`econfd:tagval()`](econfd.md#tagval-0).


### ibool/1

```erlang
ibool(X)
```

### index/2

```erlang
-spec index(CDB, IKeypath) -> Result
               when
                   CDB :: cdb_sess(),
                   IKeypath :: econfd:ikeypath(),
                   Result :: {ok, integer()} | err().
```

Related types: [cdb\_sess()](#cdb_sess-0), [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0)

Returns the position (starting at 0) of the list entry in path.


### initiate_journal_compaction/1

```erlang
-spec initiate_journal_compaction(Socket) -> Result
                                     when
                                         Socket :: econfd:socket(),
                                         Result :: ok.
```

Related types: [econfd:socket()](econfd.md#socket-0)

Initiates a journal compaction on all CDB files.


### initiate_journal_dbfile_compaction/2

```erlang
-spec initiate_journal_dbfile_compaction(Socket, Dbfile) -> Result
                                            when
                                                Socket ::
                                                    econfd:socket(),
                                                Dbfile ::
                                                    compaction_dbfile(),
                                                Result ::
                                                    ok |
                                                    {error,
                                                     econfd:error_reason()}.
```

Related types: [compaction\_dbfile()](#compaction_dbfile-0), [econfd:error\_reason()](econfd.md#error_reason-0), [econfd:socket()](econfd.md#socket-0)

Initiates a journal compaction on Dbfile.


### mk_elem/1

```erlang
mk_elem(List)
```

### new_session/2

```erlang
-spec new_session(Socket, Db) -> Result
                     when
                         Socket :: econfd:socket(),
                         Db :: dbtype(),
                         Result :: {ok, cdb_sess()} | err().
```

Related types: [cdb\_sess()](#cdb_sess-0), [dbtype()](#dbtype-0), [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Initiate a new session using the socket returned by connect().


### new_session/3

```erlang
-spec new_session(Socket, Db, Flags) -> Result
                     when
                         Socket :: econfd:socket(),
                         Db :: dbtype(),
                         Flags :: non_neg_integer(),
                         Result :: {ok, cdb_sess()} | err().
```

Related types: [cdb\_sess()](#cdb_sess-0), [dbtype()](#dbtype-0), [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Initiate a new session using the socket returned by connect(), with detailed control via the Flags argument.


### next_index/2

```erlang
-spec next_index(CDB, IKeypath) -> Result
                    when
                        CDB :: cdb_sess(),
                        IKeypath :: econfd:ikeypath(),
                        Result :: {ok, integer()} | err().
```

Related types: [cdb\_sess()](#cdb_sess-0), [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0)

Returns the position (starting at 0) of the list entry after the given path (which can be non-existing, and if multiple keys the last keys can be '*').


### num_instances/2

```erlang
-spec num_instances(CDB, IKeypath) -> Result
                       when
                           CDB :: cdb_sess(),
                           IKeypath :: econfd:ikeypath(),
                           Result :: {ok, non_neg_integer()} | err().
```

Related types: [cdb\_sess()](#cdb_sess-0), [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0)

Returns the number of entries in a list.


### parse_keystring0/1

```erlang
parse_keystring0(Str)
```

### request/2

```erlang
request(CDB, Op)
```

### request/3

```erlang
request(CDB, Op, Arg)
```

### set_case/4

```erlang
-spec set_case(CDB, IKeypath, Choice, Case) -> ok | err()
                  when
                      CDB :: cdb_sess(),
                      IKeypath :: econfd:ikeypath(),
                      Choice :: econfd:qtag() | [econfd:qtag()],
                      Case :: econfd:qtag().
```

Related types: [cdb\_sess()](#cdb_sess-0), [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:qtag()](econfd.md#qtag-0)

Only for CDB operational data: Set the case for a choice.


### set_elem/3

```erlang
-spec set_elem(CDB, Value, IKeypath) -> ok | err()
                  when
                      CDB :: cdb_sess(),
                      Value :: econfd:value(),
                      IKeypath :: econfd:ikeypath().
```

Related types: [cdb\_sess()](#cdb_sess-0), [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:value()](econfd.md#value-0)

Only for CDB operational data: Write Value into CDB.


### set_elem2/3

```erlang
-spec set_elem2(CDB, ValueBin, IKeypath) -> ok | err()
                   when
                       CDB :: cdb_sess(),
                       ValueBin :: binary(),
                       IKeypath :: econfd:ikeypath().
```

Related types: [cdb\_sess()](#cdb_sess-0), [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0)

Only for CDB operational data: Write ValueBin into CDB. ValueBin is the textual value representation.


### set_object/3

```erlang
-spec set_object(CDB, ValueList, IKeypath) -> ok | err()
                    when
                        CDB :: cdb_sess(),
                        ValueList :: [econfd:value()],
                        IKeypath :: econfd:ikeypath().
```

Related types: [cdb\_sess()](#cdb_sess-0), [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:value()](econfd.md#value-0)

Only for CDB operational data: Write an entire object, i.e. YANG list entry or container.


### set_values/3

```erlang
-spec set_values(CDB, ValueList, IKeypath) -> ok | err()
                    when
                        CDB :: cdb_sess(),
                        ValueList :: [econfd:tagval()],
                        IKeypath :: econfd:ikeypath().
```

Related types: [cdb\_sess()](#cdb_sess-0), [err()](#err-0), [econfd:ikeypath()](econfd.md#ikeypath-0), [econfd:tagval()](econfd.md#tagval-0)

Only for CDB operational data: Write a list of tagged values.

This function is an alternative to set_object/3, and allows for writing more complex structures (e.g. multiple entries in a list).


### subscribe/3

```erlang
-spec subscribe(CDB, Priority, MatchKeyString) -> Result
                   when
                       CDB :: cdb_sess(),
                       Priority :: integer(),
                       MatchKeyString :: string(),
                       Result :: {ok, SubPoint} | err().
```

Related types: [cdb\_sess()](#cdb_sess-0), [err()](#err-0)

Equivalent to [subscribe(CDB, Prio, '', MatchKeyString)](#subscribe-4).


### subscribe/4

```erlang
-spec subscribe(CDB, Priority, Ns, MatchKeyString) -> Result
                   when
                       CDB :: cdb_sess(),
                       Priority :: integer(),
                       Ns :: sub_ns(),
                       MatchKeyString :: string(),
                       Result :: {ok, SubPoint} | err().
```

Related types: [cdb\_sess()](#cdb_sess-0), [err()](#err-0), [sub\_ns()](#sub_ns-0)

Set up a CDB configuration subscription.

A CDB subscription means that we are notified when CDB changes. We can have multiple subscription points. Each subscription point is defined through a path corresponding to the paths we use for read operations, however they are in string form and allow formats that aren't possible in a proper ikeypath(). It is possible to indicate namespaces in the path with a prefix notation (see last example) - this is only necessary if there are multiple elements with the same name (in different namespaces) at some level in the path, though.

We can subscribe either to specific leaf elements or entire subtrees. Subscribing to list entries can be done using fully qualified paths, or tagpaths to match multiple entries. A path which isn't a leaf element automatically matches the subtree below that path. When specifying keys to a list entry it is possible to use the wildcard character * which will match any key value.

Some examples:

* /hosts

  Means that we subscribe to any changes in the subtree - rooted at "/hosts". This includes additions or removals of "host" entries as well as changes to already existing "host" entries.
* /hosts/host\{www\}/interfaces/interface\{eth0\}/ip

  Means we are notified when host "www" changes its IP address on "eth0".
* /hosts/host/interfaces/interface/ip

  Means we are notified when any host changes any of its IP addresses.
* /hosts/host/interfaces

  Means we are notified when either an interface is added/removed or when an individual leaf element in an existing interface is changed.
* /hosts/host/types:data

  Means we are notified when any host changes the contents of its "data" element, where "data" is an element from a namespace with the prefix "types". The prefix is normally not necessary, see above.

The priority value is an integer. When CDB is changed, the change is performed inside a transaction. Either a commit operation from the CLI or a candidate-commit operation in NETCONF means that the running database is changed. These changes occur inside a ConfD transaction. CDB will handle the subscriptions in lock-step priority order. First all subscribers at the lowest priority are handled, once they all have synchronized via the return value from the fun passed to wait/3, the next set - at the next priority level - is handled by CDB.

Operational and configuration subscriptions can be done on the same socket, but in that case the notifications may be arbitrarily interleaved, including operational notifications arriving between different configuration notifications for the same transaction. If this is a problem, use separate sessions for operational and configuration subscriptions.

The namespace argument specifies the toplevel namespace, i.e. the namespace for the first element in the path. The namespace is optional, 0 can be used as "don't care" value.

subscribe() returns a subscription point which is an integer. This integer value is used later in wait/3 to identify this particular subscription.


### subscribe/5

```erlang
-spec subscribe(CDB, Type, Priority, Ns, MatchKeyString) -> Result
                   when
                       CDB :: cdb_sess(),
                       Type :: sub_type(),
                       Priority :: integer(),
                       Ns :: sub_ns(),
                       MatchKeyString :: string(),
                       Result :: {ok, SubPoint} | err().
```

Related types: [cdb\_sess()](#cdb_sess-0), [err()](#err-0), [sub\_ns()](#sub_ns-0), [sub\_type()](#sub_type-0)

Equivalent to [subscribe(CDB, Type, 0, Prio, Ns, MatchKeyString)](#subscribe-6).


### subscribe/6

```erlang
-spec subscribe(CDB, Type, Flags, Priority, Ns, MatchKeyString) ->
                   Result
                   when
                       CDB :: cdb_sess(),
                       Type :: sub_type(),
                       Flags :: non_neg_integer(),
                       Priority :: integer(),
                       Ns :: sub_ns(),
                       MatchKeyString :: string(),
                       Result :: {ok, SubPoint} | err().
```

Related types: [cdb\_sess()](#cdb_sess-0), [err()](#err-0), [sub\_ns()](#sub_ns-0), [sub\_type()](#sub_type-0)

Generalized subscription.

Where Type is one of

* ?CDB_SUB_RUNNING - traditional commit subscription, same as subscribe/4.
* ?CDB_SUB_RUNNING_TWOPHASE - two phase subscription, i.e. notification will be received for prepare, commit, and possibly abort.
* ?CDB_SUB_OPERATIONAL - subscription for changes to CDB operational data.

Flags is either 0 or:

* ?CDB_SUB_WANT_ABORT_ON_ABORT - normally if a subscriber is the one to abort a transaction it will not receive an abort notification. This flags means that this subscriber wants an abort notification even if it originated the abort.


### subscribe_done/1

```erlang
-spec subscribe_done(CDB) -> ok | err() when CDB :: cdb_sess().
```

Related types: [cdb\_sess()](#cdb_sess-0), [err()](#err-0)

After a subscriber is done with all subscriptions and ready to receive updates this subscribe_done/1 must be called. Until it is no notifications will be delivered.


### subscribe_session/1

```erlang
-spec subscribe_session(Socket) -> {ok, cdb_sess()}
                           when Socket :: econfd:socket().
```

Related types: [cdb\_sess()](#cdb_sess-0), [econfd:socket()](econfd.md#socket-0)

Initialize a subscription socket.

This is a socket that is used to receive notifications about updates to the database. A subscription socket is used in the subscribe() function.


### sync_subscription_socket/4

```erlang
sync_subscription_socket(CDB, SyncType, TimeOut, Fun)
```

### trigger_oper_subscriptions/1

```erlang
-spec trigger_oper_subscriptions(Socket) -> ok | err()
                                    when Socket :: econfd:socket().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Equivalent to [trigger_oper_subscriptions(Socket, all)](#trigger_oper_subscriptions-2).


### trigger_oper_subscriptions/2

```erlang
-spec trigger_oper_subscriptions(Socket, SubPoints) -> ok | err()
                                    when
                                        Socket :: econfd:socket(),
                                        SubPoints ::
                                            [pos_integer()] | all.
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Equivalent to [trigger_oper_subscriptions(Socket, SubPoints, 0)](#trigger_oper_subscriptions-3).


### trigger_oper_subscriptions/3

```erlang
-spec trigger_oper_subscriptions(Socket, SubPoints, Flags) -> ok | err()
                                    when
                                        Socket :: econfd:socket(),
                                        SubPoints ::
                                            [pos_integer()] | all,
                                        Flags :: non_neg_integer().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Trigger CDB operational subscribers as if an update in oper data had been done.

Flags can be given as ?CDB_LOCK_WAIT to have the call wait until the subscription lock becomes available, otherwise it should be 0.


### trigger_subscriptions/1

```erlang
-spec trigger_subscriptions(Socket) -> ok | err()
                               when Socket :: econfd:socket().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Equivalent to [trigger_subscriptions(Socket, all)](#trigger_subscriptions-2).


### trigger_subscriptions/2

```erlang
-spec trigger_subscriptions(Socket, SubPoints) -> ok | err()
                               when
                                   Socket :: econfd:socket(),
                                   SubPoints :: [pos_integer()] | all.
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Trigger CDB subscribers as if an update in the configuration had been done.


### wait/3

```erlang
-spec wait(CDB, TimeOut, Fun) -> Result
              when
                  CDB :: cdb_sess(),
                  TimeOut :: integer() | infinity,
                  Fun ::
                      fun((SubPoints) ->
                              close | subscription_sync_type()) |
                      fun((Type, Flags, SubPoints) ->
                              close |
                              subscription_sync_type() |
                              {error, econfd:error_reason()}),
                  Result ::
                      ok |
                      {error, badretval} |
                      {error, econfd:transport_error()} |
                      {error, econfd:error_reason()}.
```

Related types: [cdb\_sess()](#cdb_sess-0), [subscription\_sync\_type()](#subscription_sync_type-0), [econfd:error\_reason()](econfd.md#error_reason-0), [econfd:transport\_error()](econfd.md#transport_error-0)

Wait for subscription events.

The fun will be given a list of the subscription points that triggered, and in the arity-3 case also Type and Flags for the notification. There can be several points if we have issued several subscriptions at the same priority.

Type is one of:

* ?CDB_SUB_PREPARE - notification for the prepare phase
* ?CDB_SUB_COMMIT - notification for the commit phase
* ?CDB_SUB_ABORT - notification for abort when prepare failed
* ?CDB_SUB_OPER - notification for changes to CDB operational data

Flags is the 'bor' of zero or more of:

* ?CDB_SUB_FLAG_IS_LAST - the last notification of its type for this session
* ?CDB_SUB_FLAG_TRIGGER - the notification was artificially triggered
* ?CDB_SUB_FLAG_REVERT - the notification is due to revert of a confirmed commit
* ?CDB_SUB_FLAG_HA_SYNC - the cause of the subscription notification is initial synchronization of a HA secondary from CDB on the primary.
* ?CDB_SUB_FLAG_HA_IS_SECONDARY - the system is currently in HA SECONDARY mode.

The fun can return the atom 'close' if we wish to close the socket and return from wait/3. Otherwise there are three different types of synchronization replies the application can use as return values from either the arity-1 or the arity-3 fun:

* ?CDB_DONE_PRIORITY This means that the application has acted on the subscription notification and CDB can continue to deliver further notifications.
* ?CDB_DONE_SOCKET This means that we are done. But regardless of priority, CDB shall not send any further notifications to us on our socket that are related to the currently executing transaction.
* ?CDB_DONE_TRANSACTION This means that CDB should not send any further notifications to any subscribers - including ourselves - related to the currently executing transaction.
* ?CDB_DONE_OPERATIONAL This should be used when a subscription notification for operational data has been read. It is the only type that should be used in this case, since the operational data does not have transactions and the notifications do not have priorities.

Finally the arity-3 fun can, when Type == ?CDB_SUB_PREPARE, return an error either as <tt>\{error, binary()\}</tt> or as <tt>\{error, #confd_error\{\}\}</tt> (\{error, tuple()\} is only for internal ConfD/NCS use). This will cause the commit of the current transaction to be aborted.

CDB is locked for writing while config subscriptions are delivered.

When wait/3 returns <tt>\{error, timeout\}</tt> the connection (and its subscriptions) is still active and the application needs to call wait/3 again. But if wait/3 returns <tt>ok</tt> or <tt>\{error, Reason\}</tt> the connection to ConfD is closed and all subscription points associated with it are cleared.


### wait_start/1

```erlang
-spec wait_start(Socket) -> ok | err() when Socket :: econfd:socket().
```

Related types: [err()](#err-0), [econfd:socket()](econfd.md#socket-0)

Wait for CDB to become available (reach start-phase one).


### xx/2

```erlang
xx(Str, Acc)
```

### xx/3

```erlang
xx(T, Sofar, Acc)
```

### yy/1

```erlang
yy(Str)
```

### yy/2

```erlang
yy(T, Sofar)
```
