# Python ncs.util Module

Utility module, low level abstrations

## Functions

### _function_ get_callpoint_model

```python
get_callpoint_model()
```

Get configured callpoint model

### _function_ get_self_assign_warning

```python
get_self_assign_warning()
```

Return current self assign warning type.

### _function_ get_setattr_fun

```python
get_setattr_fun(obj, parent)
```

Return setattr fun to use for setting attributes, will use
return a wrapped setattr function with sanity checks if enabled.

### _function_ is_multiprocessing

```python
is_multiprocessing()
```

Return True if the configured callpoint model is multiprocessing

### _function_ mk_yang_date_and_time

```python
mk_yang_date_and_time(dt=None)
```

Create a timezone aware datetime object in ISO8601 string format.

This method is used to convert a datetime object to its timezone aware
counterpart and return a string useful for a 'yang:date-and-time' leaf.
If 'dt' is None the current time will be used.

Arguments:
    dt -- a datetime object to be converted (optional)

### _function_ set_callpoint_model

```python
set_callpoint_model(model)
```

Update environment with provided callpoint model

### _function_ set_kill_child_on_parent_exit

```python
set_kill_child_on_parent_exit()
```

Multi OS variant of _ncs.set_kill_child_on_parent_exit falling back
to kqueue if the OS supports it.

### _function_ set_self_assign_warning

```python
set_self_assign_warning(warning)
```

Set self assign warning type.

### _function_ with_setattr_check

```python
with_setattr_check(path)
```

Use as context manager enabling set attribute check for the
current thread while in the manager.


