# Module econfd_schema

Support for using schema information in the Erlang API.

Keeps schema info in a set of ets tables named by the toplevel namespace.


## Types

[confd\_cs\_choice/0](#confd_cs_choice-0)

[confd\_cs\_node/0](#confd_cs_node-0)

[confd\_nsinfo/0](#confd_nsinfo-0)

[confd\_type\_cbs/0](#confd_type_cbs-0)

### confd_cs_choice/0

```erlang
-type confd_cs_choice() :: #confd_cs_choice{}.
```

### confd_cs_node/0

```erlang
-type confd_cs_node() :: #confd_cs_node{}.
```

### confd_nsinfo/0

```erlang
-type confd_nsinfo() :: #confd_nsinfo{}.
```

### confd_type_cbs/0

```erlang
-type confd_type_cbs() :: #confd_type_cbs{}.
```

## Functions

[choice\_children(Node)](#choice_children-1) - Get a flat list of children for a [`confd_cs_node()`](#confd_cs_node-0), with any choice/case structure(s) removed.


[get\_builtin\_type(\_)](#get_builtin_type-1)

[get\_cs(Ns, Tagpath)](#get_cs-2) - Find schema node by namespace and tagpath.


[get\_nslist()](#get_nslist-0) - Get a list of loaded namespaces with info.


[get\_type(TypeName)](#get_type-1) - Get schema type definition identifier for built-in type.


[get\_type(Ns, TypeName)](#get_type-2) - Get schema type definition identifier for type defined in namespace.


[ikeypath2cs(IKeypath)](#ikeypath2cs-1) - Find schema node by ikeypath.


[ikeypath2nstagpath(IKeypath)](#ikeypath2nstagpath-1)

[ikeypath2nstagpath(T, Acc)](#ikeypath2nstagpath-2)

[load(Path)](#load-1) - Load schema info from ConfD.


[load(Address, Port)](#load-2)

[register\_type\_cbs(TypeCbs)](#register_type_cbs-1) - Register callbacks for a user-defined type. For an application running in its own Erlang VM, this function registers the callbacks in the loaded schema information, similar to confd_register_node_type() in the C API. For an application running inside ConfD, this function registers the callbacks in ConfD's internal schema information, similar to using a shared object with confd_type_cb_init() in the C API.


[str2val(TypeId, Lexical)](#str2val-2) - Convert string to value based on schema type.

[val2str(TypeId, Value)](#val2str-2) - Convert value to string based on schema type.


### choice_children/1

```erlang
-spec choice_children(Node) -> Children
                         when
                             Node ::
                                 confd_cs_node() |
                                 [econfd:qtag() | confd_cs_choice()],
                             Children :: [econfd:qtag()].
```

Related types: [confd\_cs\_choice()](#confd_cs_choice-0), [confd\_cs\_node()](#confd_cs_node-0), [econfd:qtag()](econfd.md#qtag-0)

Get a flat list of children for a [`confd_cs_node()`](#confd_cs_node-0), with any choice/case structure(s) removed.


### get_builtin_type/1

```erlang
get_builtin_type(_)
```

### get_cs/2

```erlang
-spec get_cs(Ns, Tagpath) -> Result
                when
                    Ns :: econfd:namespace(),
                    Tagpath :: econfd:tagpath(),
                    Result :: confd_cs_node() | not_found.
```

Related types: [confd\_cs\_node()](#confd_cs_node-0), [econfd:namespace()](econfd.md#namespace-0), [econfd:tagpath()](econfd.md#tagpath-0)

Find schema node by namespace and tagpath.


### get_nslist/0

```erlang
-spec get_nslist() -> [confd_nsinfo()].
```

Related types: [confd\_nsinfo()](#confd_nsinfo-0)

Get a list of loaded namespaces with info.


### get_type/1

```erlang
-spec get_type(TypeName) -> Result
                  when
                      TypeName :: atom(),
                      Result :: econfd:type() | not_found.
```

Related types: [econfd:type()](econfd.md#type-0)

Get schema type definition identifier for built-in type.


### get_type/2

```erlang
-spec get_type(Ns, TypeName) -> econfd:type()
                  when Ns :: econfd:namespace(), TypeName :: atom().
```

Related types: [econfd:namespace()](econfd.md#namespace-0), [econfd:type()](econfd.md#type-0)

Get schema type definition identifier for type defined in namespace.


### ikeypath2cs/1

```erlang
-spec ikeypath2cs(IKeypath) -> Result
                     when
                         IKeypath :: econfd:ikeypath(),
                         Result :: confd_cs_node() | not_found.
```

Related types: [confd\_cs\_node()](#confd_cs_node-0), [econfd:ikeypath()](econfd.md#ikeypath-0)

Find schema node by ikeypath.


### ikeypath2nstagpath/1

```erlang
ikeypath2nstagpath(IKeypath)
```

### ikeypath2nstagpath/2

```erlang
ikeypath2nstagpath(T, Acc)
```

### load/1

```erlang
-spec load(Path) -> Result
              when
                  Path :: string(),
                  Result :: ok | {error, econfd:error_reason()}.
```

Related types: [econfd:error\_reason()](econfd.md#error_reason-0)

Load schema info from ConfD.


### load/2

```erlang
-spec load(Address, Port) -> Result
              when
                  Address :: econfd:ip(),
                  Port :: non_neg_integer(),
                  Result :: ok | {error, econfd:error_reason()}.
```

Related types: [econfd:error\_reason()](econfd.md#error_reason-0), [econfd:ip()](econfd.md#ip-0)

### register_type_cbs/1

```erlang
-spec register_type_cbs(TypeCbs) -> ok when TypeCbs :: confd_type_cbs().
```

Related types: [confd\_type\_cbs()](#confd_type_cbs-0)

Register callbacks for a user-defined type. For an application running in its own Erlang VM, this function registers the callbacks in the loaded schema information, similar to confd_register_node_type() in the C API. For an application running inside ConfD, this function registers the callbacks in ConfD's internal schema information, similar to using a shared object with confd_type_cb_init() in the C API.


### str2val/2

```erlang
-spec str2val(TypeId, Lexical) -> Result
                 when
                     TypeId :: confd_cs_node() | econfd:type(),
                     Lexical :: binary(),
                     Result ::
                         {ok, Value :: econfd:value()} |
                         {error, econfd:error_reason()}.
```

Related types: [confd\_cs\_node()](#confd_cs_node-0), [econfd:error\_reason()](econfd.md#error_reason-0), [econfd:type()](econfd.md#type-0), [econfd:value()](econfd.md#value-0)

Convert string to value based on schema type.

Note: For type identityref below a mount point (device data in NSO), TypeId must be [`confd_cs_node()`](#confd_cs_node-0).


### val2str/2

```erlang
-spec val2str(TypeId, Value) -> Result
                 when
                     TypeId :: confd_cs_node() | econfd:type(),
                     Value :: econfd:value(),
                     Result ::
                         {ok, string()} | {error, econfd:error_reason()}.
```

Related types: [confd\_cs\_node()](#confd_cs_node-0), [econfd:error\_reason()](econfd.md#error_reason-0), [econfd:type()](econfd.md#type-0), [econfd:value()](econfd.md#value-0)

Convert value to string based on schema type.

