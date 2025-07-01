# Python ncs.maagic Module

Confd/NCS data access module.

This module implements classes and function for easy access to the data store.
There is no need to manually instantiate any of the classes herein. The only
functions that should be used are cd(), get_node() and get_root().

## Functions

<details>

<summary>as_pyval</summary>

```python
as_pyval(mobj, name_type=3, include_oper=False, enum_as_string=True)
```

Convert maagic object to python value.

The types are converted as follows:

* List is converted to list.
* Container is converted to dict.
* Leaf is converted to python value.
* EmptyLeaf is converted to bool.
* ActionParams is converted to dict.

If include_oper is False and and a oper Node is
passed then None is returned.

Arguments:

* mobj -- maagic object (maagic.Enum, maagic.Bits, maagic.Node)
* name_type -- one of NODE_NAME_SHORT, NODE_NAME_FULL,
NODE_NAME_PY_SHORT and NODE_NAME_PY_FULL and controls dictionary
key names
* include_oper -- include operational data (boolean)
* enum_as_string -- return enumerator in str form (boolean)

</details>

<details>

<summary>cd</summary>

```python
cd(node, path)
```

Return the node at path 'path', starting from node 'node'.

Arguments:

* path -- relative or absolute keypath as a string (HKeypathRef or
          maagic.Node)

Returns:

* node (maagic.Node)

</details>

<details>

<summary>get_maapi</summary>

```python
get_maapi(obj)
```

Get Maapi object from obj.

Return Maapi object from obj. raise BackendError if
provided object does not contain a Maapi object.

Arguements:

* object (obj)

Returns:

* maapi object (maapi.Maapi)

</details>

<details>

<summary>get_memory_node</summary>

```python
get_memory_node(backend_or_node, path)
```

Return a Node at 'path' using 'backend' only for schema information.

All operations towards the returned Node is cached in memory and not
communicated to the server. This can be useful for effectively building a
large data set which can later be converted to a TagValue array by calling
get_tagvalues() or written directly to the server by calling
set_memory_tree() and shared_set_memory_tree().

Arguments:

* backend_or_node -- backend or node object for reading schema
                     information under mount points (maagic.Node,
                     maapi.Transaction or maapi.Maapi)
* path -- absolute keypath as a string (HKeypathRef or maagic.Node)

Example use:

    conf = ncs.maagic.get_memory_node(t, '/ncs:devices/device{ce0}/conf')

</details>

<details>

<summary>get_memory_root</summary>

```python
get_memory_root(backend_or_node)
```

Return Root object with a memory-only backend.

The passed in 'backend' is only used to read schema information when
traversing past a mount point. All operations towards the returned Node is
cached in memory and not communicated to the server.

Arguments:

* backend_or_node -- backend or node object for reading schema
                     information under mount points (maagic.Node,
                     maapi.Transaction or maapi.Maapi)

</details>

<details>

<summary>get_node</summary>

```python
get_node(backend_or_node, path, shared=False)
```

Return the node at path 'path' using 'backend'.

Arguments:

* backend_or_node -- backend object (maapi.Transaction, maapi.Maapi or None)
                     or maapi.Node.
* path -- relative or absolute keypath as a string (HKeypathRef or
          maagic.Node). Relative paths are only supported if backend_or_node
          is a maagic.Node.
* shared -- if set to 'True', fastmap-friendly maapi calls, such as
            shared_set_elem, will be used within the returned tree (boolean)

Example use:

    node = ncs.maagic.get_node(t, '/ncs:devices/device{ce0}')

</details>

<details>

<summary>get_root</summary>

```python
get_root(backend=None, shared=False)
```

Return a Root object for 'backend'.

If 'backend' is a Transaction object, the returned Maagic object can be
used to read and write transactional data. When 'backend' is a Maapi
object you cannot read and write data, however, you may use the Maagic
object to call an action (that doesn't require a transaction).
If 'backend' is a Node object the underlying Transaction or Maapi object
will be used (if any), otherwise backend will be assumed to be None.
'backend' may also be None (default) in which case the returned Maagic
object is not connected to NCS in any way. You can still use the maagic
object to build an in-memory tree which may be converted to an array
of TagValue objects.

Arguments:

* backend -- backend object (maagic.Node, maapi.Transaction, maapi.Maapi
            or None)
* shared -- if set to 'True', fastmap-friendly maapi calls, such as
            shared_set_elem, will be used within the returned tree (boolean)

Returns:

* root node (maagic.Root)

Example use:

    with ncs.maapi.Maapi() as m:
        with ncs.maapi.Session(m, 'admin', 'python'):
            root = ncs.maagic.get_root(m)

</details>

<details>

<summary>get_tagvalues</summary>

```python
get_tagvalues(node)
```

Return a list of TagValue's representing 'node'.

Arguments:

* node -- A Node object.

</details>

<details>

<summary>get_trans</summary>

```python
get_trans(node_or_trans)
```

Get Transaction object from node_or_trans.

Return Transaction object from node_or_trans. Raise BackendError if
provided object does not contain a Transaction object.

</details>

<details>

<summary>set_memory_tree</summary>

```python
set_memory_tree(node, trans_obj=None)
```

Calls Maapi.set_values() using using TagValue's from 'node'.

The backend specified when obtaining the initial node, most likely by using
'get_memory_node()' or 'get_memory_root()', will be used if that is a
maapi.Transaction backend, otherwise 'trans_obj' will be used.

Arguments:

* node -- a Node object (Node)
* trans_obj -- another transaction object to use in case node's backend is
               not a transaction backend (Node or maapi.Transaction)

</details>

<details>

<summary>set_values_xml</summary>

```python
set_values_xml(node, xml)
```

Parses the XML document in 'xml' and sets values in the transaction.

The XML document must be explicit with regards to namespaces and tags and
the top node must represent the corresponding 'node' object.

</details>

<details>

<summary>shared_set_memory_tree</summary>

```python
shared_set_memory_tree(node, trans_obj=None)
```

Calls Maapi.shared_set_values() using using TagValue's from 'node'.

For use in FASTMAP code (services). See set_memory_tree().

</details>

<details>

<summary>shared_set_values_xml</summary>

```python
shared_set_values_xml(node, xml)
```

Parses the XML document in 'xml' and sets values in the transaction.

The XML document must be explicit with regards to namespaces and tags and
the top node must represent the corresponding 'node' object.  This variant
is to be used in services where FASTMAP attributes must be preserved.

</details>


## Classes

### _class_ **Action**

Represents a tailf:action node.

Action(backend, cs_node, parent=None)

Initialize an Action node. Should not be called explicitly.

Members:

<details>

<summary>get_input(...)</summary>

Method:

```python
get_input(self)
```

Return a node tree representing the input node of this action.

Returns:

* action inputs (maagic.ActionParams)

</details>

<details>

<summary>get_output(...)</summary>

Method:

```python
get_output(self)
```

Return a node tree representing the output node of this action.

Note that this does not actually request the action.
Should not normally be called explicitly.

Returns:

* action outputs (maagic.ActionParams)

</details>

<details>

<summary>request(...)</summary>

Method:

```python
request(self, params=None)
```

Request the action and return the result as an ActionParams node.

Arguments:

* params -- input parameters of the action (maagic.ActionParams,
            optional)

Returns:

* outparams -- output parameters of the action (maagic.ActionParams)

</details>

### _class_ **ActionParams**

Represents the input or output parameters of a tailf:action.

The ActionParams node is the root of a tree representing either the input
or the output parameters of an action. Action parameters can be read and
set just like any other nodes in the tree.

ActionParams(cs_node, parent, output=False)

Initialize an ActionParams node.

Should not be called explicitly. Use 'get_input()' on an Action node
to retrieve its input parameters or 'request()' to request the action
and obtain the output parameters.

Members:

_None_

### _class_ **BackendError**

Exception type used within maagic backends.

Members:

<details>

<summary>add_note(...)</summary>

Method:


</details>

<details>

<summary>args</summary>


</details>

<details>

<summary>with_traceback(...)</summary>

Method:


</details>

### _class_ **Bits**

Representation of a YANG bits leaf with position > 63.

Bits(value, cs_node=None)

Initialize a Bits object.

Note that a Bits object has no connection to the YANG model and will
not check that the given value matches the string representation
according to the schema. Normally it is not necessary to create
Bits objects using this constructor as bits leaves can be set using
bytearrays alone.

Attributes:

* value -- a Value object of type C_BITBIG
* cs_node -- a CsNode representing the YANG bits leaf. Without this
             you cannot get a string representation of the bits
             value; in that case repr(self) will be returned for
             the str() call. (default: None)

Members:

<details>

<summary>bytearray(...)</summary>

Method:

```python
bytearray(self)
```

Return a 'little-endian' byte array.

</details>

<details>

<summary>clr_bit(...)</summary>

Method:

```python
clr_bit(self, position)
```

Clear a bit at a specific position in the internal byte array.

</details>

<details>

<summary>is_bit_set(...)</summary>

Method:

```python
is_bit_set(self, position)
```

Check if a bit at a specific position is set.

</details>

<details>

<summary>set_bit(...)</summary>

Method:

```python
set_bit(self, position)
```

Set a bit at a specific position in the internal byte array.

</details>

### _class_ **Case**

Represents a case node.

If this case node has any nested choice nodes, those will appear as
children of this object.

Case(backend, cs_node, cs_case, parent)

Initialize a Case node. Should not be called explicitly.

Members:

_None_

### _class_ **Choice**

Represents a choice node.

Choice(backend, cs_node, cs_choice, parent)

Initialize a Choice node. Should not be called explicitly.

Members:

<details>

<summary>get_value(...)</summary>

Method:

```python
get_value(self)
```

Return the currently selected case of this choice.

The case is returned as a Case node. If no case is selected for this
choice, None is returned.

Returns:

* current selection of choice (maagic.Case)

</details>

### _class_ **Container**

Represents a YANG container.

A (non-presence) container node or a list element, contains other nodes.

Container(backend, cs_node, parent=None, children=None)

Initialize Container node. Should not be called explicitly.

Members:

<details>

<summary>delete(...)</summary>

Method:

```python
delete(self)
```

Delete the container.

Deletes all nodes inside the container. The container itself is not
affected as it carries no state of its own.

Example use:

    root.container.delete()

</details>

### _class_ **Empty**

Simple represention of a yang empty value.

This is used to represent an empty value in unions and list keys.

Empty()

Initialize an Empty object.

Members:

_None_

### _class_ **EmptyLeaf**

Represents a leaf with the type "empty".

EmptyLeaf(backend, cs_node, parent=None)

Initialize an EmptyLeaf node. Should not be called explicitly.

Members:

<details>

<summary>create(...)</summary>

Method:

```python
create(self)
```

Create and return this leaf in the data tree.

</details>

<details>

<summary>delete(...)</summary>

Method:

```python
delete(self)
```

Delete this leaf from the data tree.

</details>

<details>

<summary>exists(...)</summary>

Method:

```python
exists(self)
```

Return True if this leaf exists in the data tree.

</details>

### _class_ **Enum**

Simple represention of a YANG enumeration instance.

Contains the string and integer representation of the enumeration.
An Enum object supports comparisons with other 'Enum' objects as well as
with other objects. For equality checks, strings, numbers, 'Enum' objects
and 'Value' objects are allowed. For relational operators,
all of the above except strings are acceptable.

Attributes:

* string -- string representation of the enumeration
* value -- integer representation of the enumeration

Enum(string, value)

Initialize an Enum object from a given string and integer.

Note that an Enum object has no connection to the YANG model and will
not check that the given value matches the string representation
according to the schema. Normally it is not necessary to create
Enum objects using this constructor as enum leaves can be set using
strings alone.

Arguments:

* string -- string representation of the enumeration (str)
* value -- integer representation of the enumeration (int)

Members:

_None_

### _class_ **Leaf**

Base class for leaf nodes.

Subclassed by NonEmptyLeaf, EmptyLeaf and LeafList.

Leaf(backend, cs_node, parent=None)

Initialize Leaf node. Should not be called explicitly.

Members:

<details>

<summary>delete(...)</summary>

Method:

```python
delete(self)
```

Delete this leaf from the data tree.

Example use:

    root.model.leaf.delete()

</details>

### _class_ **LeafList**

Represents a leaf-list node.

LeafList(backend, cs_node, parent=None)

Initialize a LeafList node. Should not be called explicitly.

Members:

<details>

<summary>as_list(...)</summary>

Method:

```python
as_list(self)
```

Return leaf-list values in a list.

Returns:

* leaf list values (list)

Example use:

    root.model.ll.as_list()

</details>

<details>

<summary>create(...)</summary>

Method:

```python
create(self, key)
```

Create a new leaf-list item.

Arguments:

* key -- item key (str or maapi.Key)

Example use:

    root.model.ll.create('example')

</details>

<details>

<summary>delete(...)</summary>

Method:

```python
delete(self)
```

Delete the entire leaf-list.

Example use:

    root.model.ll.delete()

</details>

<details>

<summary>exists(...)</summary>

Method:

```python
exists(self)
```

Return true if the leaf-list exists (has values) in the data tree.

Example use:

    if root.model.ll.exists():
        do_things()

</details>

<details>

<summary>remove(...)</summary>

Method:

```python
remove(self, key)
```

Remove a specific leaf-list item'.

Arguments:

* key -- item key (str or maapi.Key)

Example use:

    root.model.ll.remove('example')

</details>

<details>

<summary>set_value(...)</summary>

Method:

```python
set_value(self, value)
```

Set this leaf-list using a python list.

</details>

### _class_ **LeafListIterator**

LeafList iterator.

An instance of this class will be returned when iterating a leaf-list.

LeafListIterator(lst)

Initialize this object.

An instance of this class will be created when iteration of a
leaf-list starts. Should not be called explicitly.

Members:

<details>

<summary>delete(...)</summary>

Method:

```python
delete(self)
```

Delete the iterator.

</details>

<details>

<summary>next(...)</summary>

Method:

```python
next(self)
```

Get the next value from the iterator.

</details>

### _class_ **List**

Represents a list node.

A list can be treated mostly like a python dictionary. It supports
indexing, iteration, the len function, and the in and del operators.
New items must, however, be created explicitly using the 'create' method.

List(backend, cs_node, parent=None)

Initialize a List node. Should not be called explicitly.

Members:

<details>

<summary>create(...)</summary>

Method:

```python
create(self, *keys)
```

Create and return a new list item with the key '*keys'.

Arguments can be a single 'maapi.Key' object or one value for each key
in the list. For a keyless oper or in-memory list (eg in action
parameters), no argument should be given.

Arguments:

* keys -- item keys (list[str] or maapi.Key )

Returns:

* list item (maagic.ListElement)

</details>

<details>

<summary>delete(...)</summary>

Method:

```python
delete(self)
```

Delete the entire list.

</details>

<details>

<summary>exists(...)</summary>

Method:

```python
exists(self, keys)
```

Check if list has an item matching 'keys'.

Arguments:

* keys -- item keys (list[str] or maapi.Key )

Returns:

* boolean

</details>

<details>

<summary>filter(...)</summary>

Method:

```python
filter(self, xpath_expr=None, secondary_index=None)
```

Return a filtered iterator for the list.

With this method it is possible to filter the selection using an XPath
expression and/or a secondary index. If supported by the data provider,
filtering will be done there.

Not available for in-memory lists.

Keyword arguments:

* xpath_expr -- a valid XPath expression for filtering or None
                (string, default: None) (optional)
* secondary_index -- secondary index to use or None
                     (string, default: None) (optional)

Returns:

* iterator (maagic.ListIterator)

</details>

<details>

<summary>keys(...)</summary>

Method:

```python
keys(self, xpath_expr=None, secondary_index=None)
```

Return all keys in the list.

Note that this will immediately retrieve every key value from the CDB.
For a long list this could be a time-consuming operation. The keys
selection may be filtered using 'xpath_expr' and 'secondary_index'.

Not available for in-memory lists.

Keyword arguments:

* xpath_expr -- a valid XPath expression for filtering or None
                (string, default: None) (optional)
* secondary_index -- secondary index to use or None
                     (string, default: None) (optional)

</details>

<details>

<summary>move(...)</summary>

Method:

```python
move(self, key, where, to=None)
```

Move the item with key 'key' in an ordered-by user list.

The destination is given by the arguments 'where' and 'to'.

Arguments:

* key -- key of the element that is to be moved (str or maapi.Key)
* where -- one of 'maapi.MOVE_BEFORE', 'maapi.MOVE_AFTER',
           'maapi.MOVE_FIRST', or 'maapi.MOVE_LAST'

Keyword arguments:

* to -- key of the destination item for relative moves, only applicable
        if 'where' is either 'maapi.MOVE_BEFORE' or 'maapi.MOVE_AFTER'.

</details>

### _class_ **ListElement**

Represents a list element.

This is a Container object with a specialized __repr__() method.

ListElement(backend, cs_node, parent=None, children=None)

Initialize Container node. Should not be called explicitly.

Members:

<details>

<summary>delete(...)</summary>

Method:

```python
delete(self)
```

Delete the container.

Deletes all nodes inside the container. The container itself is not
affected as it carries no state of its own.

Example use:

    root.container.delete()

</details>

### _class_ **ListIterator**

List iterator.

An instance of this class will be returned when iterating a list.

ListIterator(lst, secondary_index=None, xpath_expr=None)

Initialize this object.

An instance of this class will be created when iteration of a
list starts. Should not be called explicitly.

Members:

<details>

<summary>delete(...)</summary>

Method:

```python
delete(self)
```

Delete the iterator.

</details>

<details>

<summary>next(...)</summary>

Method:

```python
next(self)
```

Get the next value from the iterator.

</details>

### _class_ **MaagicError**

Exception type used within maagic.

Members:

<details>

<summary>add_note(...)</summary>

Method:


</details>

<details>

<summary>args</summary>


</details>

<details>

<summary>with_traceback(...)</summary>

Method:


</details>

### _class_ **Node**

Base class of all nodes in the configuration tree.

Contains magic overrides that make children in the YANG tree appear as
attributes of the Node object and as elements in the list 'self'.

Attributes:

* _name -- the YANG name of this node (str)
* _path -- the keypath of this node in string form (HKeypathRef)
* _parent -- the parent of this node, or None if this node
            has no parent (maagic.Node)
* _cs_node -- the schema node of this node, or None if this node is not in
              the schema (maagic.Node)

Node(backend, cs_node, parent=None, is_root=False)

Initialize a Node object. Should not be called explicitly.

Members:

_None_

### _class_ **NonEmptyLeaf**

Represents a leaf with a type other than "empty".

NonEmptyLeaf(backend, cs_node, parent=None)

Initialize a NonEmptyLeaf node. Should not be called explicitly.

Members:

<details>

<summary>delete(...)</summary>

Method:

```python
delete(self)
```

Delete this leaf from the data tree.

</details>

<details>

<summary>exists(...)</summary>

Method:

```python
exists(self)
```

Check if leaf exists.

Return True if this leaf exists (has a value) in the data tree.

</details>

<details>

<summary>get_value(...)</summary>

Method:

```python
get_value(self)
```

Return the value of this leaf.

The value is returned as the most appropriate python data type.

</details>

<details>

<summary>get_value_object(...)</summary>

Method:

```python
get_value_object(self)
```

Return the value of this leaf as a Value object.

</details>

<details>

<summary>set_cache(...)</summary>

Method:

```python
set_cache(self, value)
```

Set the cached value of this leaf without updating the data tree.

Use of this method is strongly discouraged.

</details>

<details>

<summary>set_value(...)</summary>

Method:

```python
set_value(self, value)
```

Set the value of this leaf.

Arguments:

* value -- the value to be set. If 'value' is not a Value object,
        it will be converted to one using Value.str2val.

</details>

<details>

<summary>update_cache(...)</summary>

Method:

```python
update_cache(self, force=False)
```

Read this leaf's value from the data tree and store it in the cache.

There is no need to call this method explicitly.

</details>

### _class_ **PresenceContainer**

Represents a presence container.

PresenceContainer(backend, cs_node, parent=None)

Initialize a PresenceContainer. Should not be called explicitly.

Members:

<details>

<summary>create(...)</summary>

Method:

```python
create(self)
```

Create and return this presence container in the data tree.

Example use:

    pc = root.container.presence_container.create()

</details>

<details>

<summary>delete(...)</summary>

Method:

```python
delete(self)
```

Delete this presence container from the data tree.

Example use:

    root.container.presence_container.delete()

</details>

<details>

<summary>exists(...)</summary>

Method:

```python
exists(self)
```

Return true if the presence container exists in the data tree.

Example use:

    root.container.presence_container.exists()

</details>

### _class_ **Root**

Represents the root node in the configuration tree.

The root node is not represented in the schema, it is added for convenience
and can contain the top level nodes from any number of namespaces as
children.

Root(backend=None, namespaces=None)

Initialize a Root node.

Should not be called explicitly. Instead, use the function
'get_root()'.

Arguments:

* backend -- backend to use, or 'None' for an in-memory tree
            (maapi.Maapi or maapi.Transaction)
* namespaces -- which namespaces to include in the tree (list)

Members:

_None_

