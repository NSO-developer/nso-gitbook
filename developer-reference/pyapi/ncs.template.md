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

Base class: builtins.list

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

The value will be normalized and quoted as a valid XPath string literal
before adding it to the internal list.

Quoting rules:
- No quotes in value: wrapped in single quotes ('value')
- Single quotes only: wrapped in double quotes ("it's")
- Double quotes only: wrapped in single quotes ('say "hello"')
- Both quote types: uses XPath concat() to combine safely quoted
    segments, e.g. concat('A',"'","'",'B','"') for A'B"

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

