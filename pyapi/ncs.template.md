# Python ncs.template Module

This module implements classes to simplify template processing.

## Classes

### _class_ **Template**

Class to simplify applying of templates in a NCS service callback.

```python
Template(service, path=None)
```

Initialize a Template object.

The 'service' argument is the 'service' variable received in
decorated cb_create method in a service class.
('service' can in fact be any maagic.Node (except a Root node)
instance with an underlying Transaction). It is also possible to
provide a maapi.Transaction instance for the 'service' argument in
which case 'path' must also be provided.

Example use:

    vars = ncs.template.Variables()
    vars.add('VAR1', 'foo')
    vars.add('VAR2', 'bar')
    vars.add('VAR3', 42)
    template = ncs.template.Template(service)
    template.apply('my-service-template', vars)

Members:

<details>

<summary>apply(...)</summary>

Method:

```python
apply(self, name, vars=None, flags=0)
```

Apply the template 'name'.

The optional argument 'vars' may be provided in form of a
Variables instance.

Arguments:

* name -- template name (str)
* vars -- template variables (template.Variables)
* flags -- template flags (int, optional)

</details>

### _class_ **Variables**

Class to simplify passing of variables when applying a template.

```python
Variables(init=None)
```

Initialize a Variables object.

The optional argument 'init' can be any iterable yielding a
2-tuple in the form (name, value).

Members:

<details>

<summary>add(...)</summary>

Method:

```python
add(self, name, value)
```

Add a value for the variable 'name'.

The value will be quoted before adding it to the internal list.

Quoting works like this:
    If value contains ' all occurrences of " will be replaced by ' and
    the final value will be quoted with ". Otherwise, the final value
    will be quoted with '.

Arguments:

* name -- service variable name (str)
* value -- variable value (str, int, boolean)

</details>

<details>

<summary>add_plain(...)</summary>

Method:

```python
add_plain(self, name, value)
```

Add a value for the variable 'name'.

It's up to the caller to do proper quoting of value.

For arguments, see Variables.add()

</details>

<details>

<summary>append(...)</summary>

Method:

```python
append(self, object, /)
```

Append object to the end of the list.

</details>

<details>

<summary>clear(...)</summary>

Method:

```python
clear(self, /)
```

Remove all items from list.

</details>

<details>

<summary>copy(...)</summary>

Method:

```python
copy(self, /)
```

Return a shallow copy of the list.

</details>

<details>

<summary>count(...)</summary>

Method:

```python
count(self, value, /)
```

Return number of occurrences of value.

</details>

<details>

<summary>extend(...)</summary>

Method:

```python
extend(self, iterable, /)
```

Extend list by appending elements from the iterable.

</details>

<details>

<summary>index(...)</summary>

Method:

```python
index(self, value, start=0, stop=9223372036854775807, /)
```

Return first index of value.

Raises ValueError if the value is not present.

</details>

<details>

<summary>insert(...)</summary>

Method:

```python
insert(self, index, object, /)
```

Insert object before index.

</details>

<details>

<summary>pop(...)</summary>

Method:

```python
pop(self, index=-1, /)
```

Remove and return item at index (default last).

Raises IndexError if list is empty or index is out of range.

</details>

<details>

<summary>remove(...)</summary>

Method:

```python
remove(self, value, /)
```

Remove first occurrence of value.

Raises ValueError if the value is not present.

</details>

<details>

<summary>reverse(...)</summary>

Method:

```python
reverse(self, /)
```

Reverse *IN PLACE*.

</details>

<details>

<summary>sort(...)</summary>

Method:

```python
sort(self, /, *, key=None, reverse=False)
```

Sort the list in ascending order and return None.

The sort is in-place (i.e. the list itself is modified) and stable (i.e. the
order of two equal elements is maintained).

If a key function is given, apply it once to each list item and sort them,
ascending or descending, according to their function values.

The reverse flag can be set to sort in descending order.

</details>

