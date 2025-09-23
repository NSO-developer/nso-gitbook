# Module econfd_logsyms

## Types

[logsym/0](#logsym-0)

[logsyms/0](#logsyms-0)

### logsym/0

```erlang
-type logsym() :: {LogSymStr :: string(), Descr :: string()}.
```

### logsyms/0

```erlang
-type logsyms() :: tuple().
```

## Functions

[array()](#array-0)

[array(Max, \_)](#array-2)

[get\_descr(LogSym)](#get_descr-1)

[get\_logsym(LogSym)](#get_logsym-1)

[get\_logsymstr(LogSym)](#get_logsymstr-1)

[max\_sym()](#max_sym-0)

### array/0

```erlang
-spec array() -> logsyms().
```

Related types: [logsyms()](#logsyms-0)

### array/2

```erlang
array(Max, _)
```

### get_descr/1

```erlang
-spec get_descr(LogSym :: integer()) -> Descr :: string().
```

### get_logsym/1

```erlang
-spec get_logsym(LogSym :: integer()) -> logsym().
```

Related types: [logsym()](#logsym-0)

### get_logsymstr/1

```erlang
-spec get_logsymstr(LogSym :: integer()) -> LogSymStr :: string().
```

### max_sym/0

```erlang
max_sym()
```
