# Python ncs.experimental Module

Experimental stuff.

This module contains experimental and totally unsupported things that
may change or disappear at any time in the future. If used, it must be
explicitly imported.

## Classes

### _class_ **DataCallbacks**

High-level API for implementing data callbacks.

Higher level abstraction for the DP API. Currently supports read
operations only, as such it is suitable for config false; data.

Registered callbacks are searched for in registration order. Most
specific points must be registered first.

args parameter to handler callbacks is a dictionary with keys
matching list names in the keypath. If multiple lists with the
same name exists the keys are named list-0, list-1 etc where 0 is
the top-most list with name list. Values in the dictionary are
python types (.as_pyval()), if the list has multiple keys it is
set as a list else the single key value is set.

Example args for keypath
/root/single-key-list{name}/conflict{first}/conflict{second}/multi{1 one}

    {'single-key-list': 'name',
     'conflict-0': 'first',
     'conflict-1': 'second',
     'multi': [1, 'one']}

Example handler and registration:

    class Handler(object):
        def get_object(self, tctx, kp, args):
            return {'leaf1': 'value', 'leaf2': 'value'}

        def get_next(self, tctx, kp, args, next):
            return None

        def count(self):
            return 0

    dcb = DataCallbacks(log)
    dcb.register('/namespace:container', Handler())
    _confd.dp.register_data_cb(dd.ctx(), example_ns.callpoint_handler, dcb)

DataCallbacks(log)

Members:

<details>

<summary>Pattern</summary>

Pattern matching key-path, internal to DataCallbacks

</details>

<details>

<summary>RegisterPoint</summary>

Registered handler point, internal to DataCallbacks

</details>

<details>

<summary>cb_exists_optional(...)</summary>

Method:

```python
cb_exists_optional(self, tctx, kp)
```

low-level cb_exists_optional implementation

</details>

<details>

<summary>cb_get_case(...)</summary>

Method:

```python
cb_get_case(self, tctx, kp, choice)
```

low-level cb_get_case implementation

</details>

<details>

<summary>cb_get_elem(...)</summary>

Method:

```python
cb_get_elem(self, tctx, kp)
```

low-level cb_elem implementation

</details>

<details>

<summary>cb_get_next(...)</summary>

Method:

```python
cb_get_next(self, tctx, kp, next)
```

low-level cb_get_next implementation

</details>

<details>

<summary>cb_get_next_object(...)</summary>

Method:

```python
cb_get_next_object(self, tctx, kp, next)
```

low-level cb_get_next_object implementation

</details>

<details>

<summary>cb_get_object(...)</summary>

Method:

```python
cb_get_object(self, tctx, kp)
```

low-level cb_get_object implementation

</details>

<details>

<summary>cb_num_instances(...)</summary>

Method:

```python
cb_num_instances(self, tctx, kp)
```

low-level cb_num_instances implementation

</details>

<details>

<summary>register(...)</summary>

Method:

```python
register(self, path, handler)
```

Register data handler for path.

If handler is a type it will be instantiated with the DataCallbacks
log as the only parameter.

The following methods will be called on the handler:

* get_object(kp, args)

    Return single object as dictionary.

* get_next(kp, args, next)

    Return next object as dictionary, list of dictionaries can be
    returned to use result caching reducing the amount of calls
    required.

* count(kp, args)

    Return number of elements in list.

</details>

### _class_ **Query**

Class encapsulating a MAAPI query operation.

Supports the pattern of executing a query and iterating over the result
sets as they are requested. The class handles the calls to query_start,
query_result and query_stop, which means that one can focus on describing
the query and handle the result.

Example query:

    with Query(trans, 'device', '/devices', ['name', 'address', 'port'],
               result_as=ncs.QUERY_TAG_VALUE) as q:
        for r in q:
            print(r)

Query(trans, expr, context_node, select, chunk_size=1000, initial_offset=1, result_as=3, sort=[])

Initialize a Query.

Members:

<details>

<summary>next(...)</summary>

Method:

```python
next(self)
```

Get the next query result row.

</details>

<details>

<summary>stop(...)</summary>

Method:

```python
stop(self)
```

Stop the running query.

Any resources associated with the query will be released.

</details>

