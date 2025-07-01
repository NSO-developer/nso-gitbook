# Python ncs.util Module

Utility module, low level abstrations

## Functions

<details>

<summary>get_callpoint_model</summary>

```python
get_callpoint_model()
```

Get configured callpoint model

</details>

<details>

<summary>get_self_assign_warning</summary>

```python
get_self_assign_warning()
```

Return current self assign warning type.

</details>

<details>

<summary>get_setattr_fun</summary>

```python
get_setattr_fun(obj, parent)
```

Return setattr fun to use for setting attributes, will use
return a wrapped setattr function with sanity checks if enabled.

</details>

<details>

<summary>is_multiprocessing</summary>

```python
is_multiprocessing()
```

Return True if the configured callpoint model is multiprocessing

</details>

<details>

<summary>mk_yang_date_and_time</summary>

```python
mk_yang_date_and_time(dt=None)
```

Create a timezone aware datetime object in ISO8601 string format.

This method is used to convert a datetime object to its timezone aware
counterpart and return a string useful for a 'yang:date-and-time' leaf.
If 'dt' is None the current time will be used.

Arguments:
    dt -- a datetime object to be converted (optional)

</details>

<details>

<summary>set_callpoint_model</summary>

```python
set_callpoint_model(model)
```

Update environment with provided callpoint model

</details>

<details>

<summary>set_kill_child_on_parent_exit</summary>

```python
set_kill_child_on_parent_exit()
```

Multi OS variant of _ncs.set_kill_child_on_parent_exit falling back
to kqueue if the OS supports it.

</details>

<details>

<summary>set_self_assign_warning</summary>

```python
set_self_assign_warning(warning)
```

Set self assign warning type.

</details>

<details>

<summary>with_setattr_check</summary>

```python
with_setattr_check(path)
```

Use as context manager enabling set attribute check for the
current thread while in the manager.

</details>


