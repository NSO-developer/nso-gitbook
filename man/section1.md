<a id="module-ncs.maagic"></a>

Confd/NCS data access module.

This module implements classes and function for easy access to the data store.
There is no need to manually instantiate any of the classes herein. The only
functions that should be used are cd(), get_node() and get_root().

### *class* ncs.maagic.Action(backend, cs_node, parent=None)

Represents a tailf:action node.

#### \_\_call_\_(params=None)

Make object callable. Calls request().

#### \_\_init_\_(backend, cs_node, parent=None)

Initialize an Action node. Should not be called explicitly.

#### \_\_repr_\_()

Get internal representation.

#### get_input()

Return a node tree representing the input node of this action.

Returns:

* action inputs (maagic.ActionParams)

#### get_output()

Return a node tree representing the output node of this action.

Note that this does not actually request the action.
Should not normally be called explicitly.

Returns:

* action outputs (maagic.ActionParams)

#### request(params=None)

Request the action and return the result as an ActionParams node.

Arguments:

* params – input parameters of the action (maagic.ActionParams,
  : optional)

Returns:

* outparams – output parameters of the action (maagic.ActionParams)

### *class* ncs.maagic.ActionParams(cs_node, parent, output=False)

Represents the input or output parameters of a tailf:action.

The ActionParams node is the root of a tree representing either the input
or the output parameters of an action. Action parameters can be read and
set just like any other nodes in the tree.

#### \_\_init_\_(cs_node, parent, output=False)

Initialize an ActionParams node.

Should not be called explicitly. Use ‘get_input()’ on an Action node
to retrieve its input parameters or ‘request()’ to request the action
and obtain the output parameters.

### *exception* ncs.maagic.BackendError

Exception type used within maagic backends.

#### \_\_weakref_\_

list of weak references to the object

### *class* ncs.maagic.Bits(value, cs_node=None)

Representation of a YANG bits leaf with position > 63.

#### \_\_eq_\_(other)

Check bits for equality with another object.

The Bits is considered equal to the other object if one of the
following is true:
- ‘other’ is a ‘Bits’ type and ‘other.bytearray()’ is equal

> to ‘self.bytearray()
- ‘other’ is a bytearray and is equal to ‘self.bytearray()’
- ‘other’ is a ‘Value’ object of type BITBIG and its ‘as_pyval()’
  value is equal to ‘self.bytearray()’
- ‘other’ is a ‘bytes’ or a ‘str’ object and is equal to
  self.bytearray()

#### \_\_hash_\_ *= None*

#### \_\_init_\_(value, cs_node=None)

Initialize a Bits object.

Note that a Bits object has no connection to the YANG model and will
not check that the given value matches the string representation
according to the schema. Normally it is not necessary to create
Bits objects using this constructor as bits leaves can be set using
bytearrays alone.

Attributes:

* value – a Value object of type C_BITBIG
* cs_node – a CsNode representing the YANG bits leaf. Without this
  : you cannot get a string representation of the bits
    value; in that case repr(self) will be returned for
    the str() call. (default: None)

#### \_\_len_\_()

Return the needed size in bytes for the bits object.

#### \_\_ne_\_(other)

Check for inequality.

#### \_\_repr_\_()

Get internal representation.

#### \_\_str_\_()

Return the string representation of the bits object.

#### \_\_weakref_\_

list of weak references to the object

#### bytearray()

Return a ‘little-endian’ byte array.

#### clr_bit(position)

Clear a bit at a specific position in the internal byte array.

#### is_bit_set(position)

Check if a bit at a specific position is set.

#### set_bit(position)

Set a bit at a specific position in the internal byte array.

### *class* ncs.maagic.Case(backend, cs_node, cs_case, parent)

Represents a case node.

If this case node has any nested choice nodes, those will appear as
children of this object.

#### \_\_eq_\_(other)

Check for equality.

A Case node is considered equal to the following objects:
- Any number type object that matches the tag value of this case
- Any string object that matches the YANG name of this case
- Any object with string and int representations that both match those

> of this case.

#### \_\_hash_\_ *= None*

#### \_\_init_\_(backend, cs_node, cs_case, parent)

Initialize a Case node. Should not be called explicitly.

#### \_\_int_\_()

Get int representation (tag value).

#### \_\_ne_\_(other)

Check for inequality.

#### \_\_repr_\_()

Get internal representation.

#### \_\_str_\_()

Get string representation.

### *class* ncs.maagic.Choice(backend, cs_node, cs_choice, parent)

Represents a choice node.

#### \_\_init_\_(backend, cs_node, cs_choice, parent)

Initialize a Choice node. Should not be called explicitly.

#### \_\_int_\_()

Get int representation (tag value).

#### \_\_repr_\_()

Get internal representation.

#### \_\_str_\_()

Get string representation.

#### get_value()

Return the currently selected case of this choice.

The case is returned as a Case node. If no case is selected for this
choice, None is returned.

Returns:

* current selection of choice (maagic.Case)

### *class* ncs.maagic.Container(backend, cs_node, parent=None, children=None)

Represents a YANG container.

A (non-presence) container node or a list element, contains other nodes.

#### \_\_init_\_(backend, cs_node, parent=None, children=None)

Initialize Container node. Should not be called explicitly.

#### \_\_repr_\_()

Get internal representation.

#### delete()

Delete the container.

Deletes all nodes inside the container. The container itself is not
affected as it carries no state of its own.

Example use:

> root.container.delete()

### *class* ncs.maagic.Empty

Simple represention of a yang empty value.

This is used to represent an empty value in unions and list keys.

#### \_\_init_\_()

Initialize an Empty object.

#### \_\_repr_\_()

Get internal representation.

#### \_\_str_\_()

Return the string representation of an empty value.

#### \_\_weakref_\_

list of weak references to the object

### *class* ncs.maagic.EmptyLeaf(backend, cs_node, parent=None)

Represents a leaf with the type “empty”.

#### \_\_bool_\_()

Return True if this leaf exists in the data tree.

#### \_\_init_\_(backend, cs_node, parent=None)

Initialize an EmptyLeaf node. Should not be called explicitly.

#### \_\_nonzero_\_()

Return True if this leaf exists in the data tree.

#### \_\_repr_\_()

Get internal representation.

#### create()

Create and return this leaf in the data tree.

#### delete()

Delete this leaf from the data tree.

#### exists()

Return True if this leaf exists in the data tree.

### *class* ncs.maagic.Enum(string, value)

Simple represention of a YANG enumeration instance.

Contains the string and integer representation of the enumeration.
An Enum object supports comparisons with other ‘Enum’ objects as well as
with other objects. For equality checks, strings, numbers, ‘Enum’ objects
and ‘Value’ objects are allowed. For relational operators,
all of the above except strings are acceptable.

Attributes:

* string – string representation of the enumeration
* value – integer representation of the enumeration

#### \_\_eq_\_(other)

Check enumeration for equality with another object.

The enumeraion is considered equal to the other object if one of the
following is true:
- ‘other’ is a number type and is equal to ‘self.value’
- ‘other’ is a string and is equal to ‘self.string’
- ‘other’ is a ‘Value’ object of type ENUM and its value value

> is equal to ‘self.value’
- ‘other’ is also an ‘Enum’ and has the same string and value
  attributes as self

#### \_\_ge_\_(other)

Return a >= b.  Computed by @total_ordering from (not a < b).

#### \_\_gt_\_(other)

Return a > b.  Computed by @total_ordering from (not a < b) and (a != b).

#### \_\_hash_\_ *= None*

#### \_\_init_\_(string, value)

Initialize an Enum object from a given string and integer.

Note that an Enum object has no connection to the YANG model and will
not check that the given value matches the string representation
according to the schema. Normally it is not necessary to create
Enum objects using this constructor as enum leaves can be set using
strings alone.

Arguments:

* string – string representation of the enumeration (str)
* value – integer representation of the enumeration (int)

#### \_\_int_\_()

Return the integer representation of the enumeration.

#### \_\_le_\_(other)

Return a <= b.  Computed by @total_ordering from (a < b) or (a == b).

#### \_\_lt_\_(other)

Compare enumeration to another object.

The value attribute of the enumeration is compared to one of the
following (the first one that is applicable):
- ‘other’ itself if ‘other’ is a number
- ‘int(other)’ if ‘other’ is a Value object
- ‘other.value’ if ‘other’ is an Enum object

#### \_\_ne_\_(other)

Check for inequality.

#### \_\_repr_\_()

Get internal representation.

#### \_\_str_\_()

Return the string representation of the enumeration.

#### \_\_weakref_\_

list of weak references to the object

### *class* ncs.maagic.Leaf(backend, cs_node, parent=None)

Base class for leaf nodes.

Subclassed by NonEmptyLeaf, EmptyLeaf and LeafList.

#### \_\_init_\_(backend, cs_node, parent=None)

Initialize Leaf node. Should not be called explicitly.

#### delete()

Delete this leaf from the data tree.

Example use:

> root.model.leaf.delete()

### *class* ncs.maagic.LeafList(backend, cs_node, parent=None)

Represents a leaf-list node.

#### \_\_bool_\_()

Return true if this leaf-list exists in the data tree.

#### \_\_delitem_\_(key)

Remove a specific leaf-list item’.

#### \_\_eq_\_(other)

Check for equality.

A LeafList node is considered equal to the following objects:
- Any LeafList node that contains the same values as this node
- Any list object that containes the same values as this node
- None if this node doesn’t exist

#### \_\_hash_\_ *= None*

#### \_\_init_\_(backend, cs_node, parent=None)

Initialize a LeafList node. Should not be called explicitly.

#### \_\_iter_\_()

Python magic method.

Return an iterator for the leaf-list. This method will be called e.g.
when iterating the leaf-list like this:

> for item in myleaflist: …

#### \_\_len_\_()

Get the length of the leaf-list.

Called when using ‘len’.

#### \_\_ne_\_(other)

Return self!=value.

#### \_\_nonzero_\_()

Return true if this leaf-list exists in the data tree.

#### \_\_repr_\_()

Get internal representation.

#### as_list()

Return leaf-list values in a list.

Returns:

* leaf list values (list)

Example use:

> root.model.ll.as_list()

#### create(key)

Create a new leaf-list item.

Arguments:

* key – item key (str or maapi.Key)

Example use:

> root.model.ll.create(‘example’)

#### delete()

Delete the entire leaf-list.

Example use:

> root.model.ll.delete()

#### exists()

Return true if the leaf-list exists (has values) in the data tree.

Example use:

> if root.model.ll.exists():
> : do_things()

#### remove(key)

Remove a specific leaf-list item’.

Arguments:

* key – item key (str or maapi.Key)

Example use:

> root.model.ll.remove(‘example’)

#### set_value(value)

Set this leaf-list using a python list.

### *class* ncs.maagic.LeafListIterator(lst)

LeafList iterator.

An instance of this class will be returned when iterating a leaf-list.

#### \_\_init_\_(lst)

Initialize this object.

An instance of this class will be created when iteration of a
leaf-list starts. Should not be called explicitly.

#### next()

Get the next value from the iterator.

### *class* ncs.maagic.List(backend, cs_node, parent=None)

Represents a list node.

A list can be treated mostly like a python dictionary. It supports
indexing, iteration, the len function, and the in and del operators.
New items must, however, be created explicitly using the ‘create’ method.

#### \_\_contains_\_(keys)

Check if list has an item matching ‘keys’.

Called when checking for existence using ‘in’ and ‘not in’.

#### \_\_delitem_\_(keys)

Delete list item matching ‘keys’.

Called when deleting an item from the list.

Example use:

> del mylist[‘key1’]

#### \_\_getitem_\_(keys)

Get a specific list item.

Get a specific item from the list using [] notation.
Return a ListElement representing the contents of the list at ‘keys’.

Arguments:

* keys – item keys (list[str] or maapi.Key )

Returns:

* list item (maagic.ListElement)

#### \_\_init_\_(backend, cs_node, parent=None)

Initialize a List node. Should not be called explicitly.

#### \_\_iter_\_()

Python magic method.

Return an iterator for the list. This method will be called e.g.
when iterating the list like this:

> for item in mylist: …

#### \_\_len_\_()

Get the length of the list.

Called when using ‘len’.

#### \_\_repr_\_()

Get internal representation.

#### \_\_setitem_\_(key, value)

Raise an error.

#### create(\*keys)

Create and return a new list item with the key ‘

```
*
```

keys’.

Arguments can be a single ‘maapi.Key’ object or one value for each key
in the list. For a keyless oper or in-memory list (eg in action
parameters), no argument should be given.

Arguments:

* keys – item keys (list[str] or maapi.Key )

Returns:

* list item (maagic.ListElement)

#### delete()

Delete the entire list.

#### exists(keys)

Check if list has an item matching ‘keys’.

Arguments:

* keys – item keys (list[str] or maapi.Key )

Returns:

* boolean

#### filter(xpath_expr=None, secondary_index=None)

Return a filtered iterator for the list.

With this method it is possible to filter the selection using an XPath
expression and/or a secondary index. If supported by the data provider,
filtering will be done there.

Not available for in-memory lists.

Keyword arguments:

* xpath_expr – a valid XPath expression for filtering or None
  : (string, default: None) (optional)
* secondary_index – secondary index to use or None
  : (string, default: None) (optional)

Returns:

* iterator (maagic.ListIterator)

#### keys(xpath_expr=None, secondary_index=None)

Return all keys in the list.

Note that this will immediately retrieve every key value from the CDB.
For a long list this could be a time-consuming operation. The keys
selection may be filtered using ‘xpath_expr’ and ‘secondary_index’.

Not available for in-memory lists.

Keyword arguments:

* xpath_expr – a valid XPath expression for filtering or None
  : (string, default: None) (optional)
* secondary_index – secondary index to use or None
  : (string, default: None) (optional)

#### move(key, where, to=None)

Move the item with key ‘key’ in an ordered-by user list.

The destination is given by the arguments ‘where’ and ‘to’.

Arguments:

* key – key of the element that is to be moved (str or maapi.Key)
* where – one of ‘maapi.MOVE_BEFORE’, ‘maapi.MOVE_AFTER’,
  : ‘maapi.MOVE_FIRST’, or ‘maapi.MOVE_LAST’

Keyword arguments:

* to – key of the destination item for relative moves, only applicable
  : if ‘where’ is either ‘maapi.MOVE_BEFORE’ or ‘maapi.MOVE_AFTER’.

### *class* ncs.maagic.ListElement(backend, cs_node, parent=None, children=None)

Represents a list element.

This is a Container object with a specialized \_\_repr_\_() method.

#### \_\_repr_\_()

Get internal representation.

### *class* ncs.maagic.ListIterator(lst, secondary_index=None, xpath_expr=None)

List iterator.

An instance of this class will be returned when iterating a list.

#### \_\_del_\_()

Destructor. Destroy internal object.

#### \_\_enter_\_()

Context manger entry point.

#### \_\_exit_\_(type_, value, tb)

Context manger exit point.

#### \_\_init_\_(lst, secondary_index=None, xpath_expr=None)

Initialize this object.

An instance of this class will be created when iteration of a
list starts. Should not be called explicitly.

#### \_\_iter_\_()

Return iterator (which is self).

#### \_\_next_\_()

Iterator next.

#### \_\_weakref_\_

list of weak references to the object

#### delete()

Delete the iterator.

#### next()

Get the next value from the iterator.

### *exception* ncs.maagic.MaagicError

Exception type used within maagic.

#### \_\_weakref_\_

list of weak references to the object

### *class* ncs.maagic.Node(backend, cs_node, parent=None, is_root=False)

Base class of all nodes in the configuration tree.

Contains magic overrides that make children in the YANG tree appear as
attributes of the Node object and as elements in the list ‘self’.

Attributes:

* \_name – the YANG name of this node (str)
* \_path – the keypath of this node in string form (HKeypathRef)
* \_parent – the parent of this node, or None if this node
  : has no parent (maagic.Node)
* \_cs_node – the schema node of this node, or None if this node is not in
  : the schema (maagic.Node)

#### \_\_delattr_\_(name)

Python magic method.

#### \_\_delitem_\_(name)

Python magic method.

#### \_\_dir_\_()

Return a list of children available under this Node.

#### \_\_getattr_\_(name)

Python magic method.

#### \_\_getitem_\_(name)

Python magic method.

#### \_\_init_\_(backend, cs_node, parent=None, is_root=False)

Initialize a Node object. Should not be called explicitly.

#### \_\_int_\_()

Return the tag value of this node in the schema.

#### \_\_iter_\_()

Iterate over children names under this Node.

#### \_\_setattr_\_(name, value)

Python magic method.

#### \_\_setitem_\_(name, value)

Python magic method.

#### \_\_str_\_()

Return the name of this node in the schema.

#### \_\_weakref_\_

list of weak references to the object

### *class* ncs.maagic.NonEmptyLeaf(backend, cs_node, parent=None)

Represents a leaf with a type other than “empty”.

#### \_\_bool_\_()

Return true if this leaf exists in the data tree.

#### \_\_init_\_(backend, cs_node, parent=None)

Initialize a NonEmptyLeaf node. Should not be called explicitly.

#### \_\_nonzero_\_()

Return true if this leaf exists in the data tree.

#### \_\_repr_\_()

Get internal representation.

#### delete()

Delete this leaf from the data tree.

#### exists()

Check if leaf exists.

Return True if this leaf exists (has a value) in the data tree.

#### get_value()

Return the value of this leaf.

The value is returned as the most appropriate python data type.

#### get_value_object()

Return the value of this leaf as a Value object.

#### set_cache(value)

Set the cached value of this leaf without updating the data tree.

Use of this method is strongly discouraged.

#### set_value(value)

Set the value of this leaf.

Arguments:

* value – the value to be set. If ‘value’ is not a Value object,
  : it will be converted to one using Value.str2val.

#### update_cache(force=False)

Read this leaf’s value from the data tree and store it in the cache.

There is no need to call this method explicitly.

### *class* ncs.maagic.PresenceContainer(backend, cs_node, parent=None)

Represents a presence container.

#### \_\_bool_\_()

Return true if this presence container exists in the data tree.

#### \_\_init_\_(backend, cs_node, parent=None)

Initialize a PresenceContainer. Should not be called explicitly.

#### \_\_nonzero_\_()

Return true if this presence container exists in the data tree.

#### \_\_repr_\_()

Get internal representation.

#### create()

Create and return this presence container in the data tree.

Example use:

> pc = root.container.presence_container.create()

#### delete()

Delete this presence container from the data tree.

Example use:

> root.container.presence_container.delete()

#### exists()

Return true if the presence container exists in the data tree.

Example use:

> root.container.presence_container.exists()

### *class* ncs.maagic.Root(backend=None, namespaces=None)

Represents the root node in the configuration tree.

The root node is not represented in the schema, it is added for convenience
and can contain the top level nodes from any number of namespaces as
children.

#### \_\_init_\_(backend=None, namespaces=None)

Initialize a Root node.

Should not be called explicitly. Instead, use the function
‘get_root()’.

Arguments:

* backend – backend to use, or ‘None’ for an in-memory tree
  : (maapi.Maapi or maapi.Transaction)
* namespaces – which namespaces to include in the tree (list)

#### \_\_int_\_()

Return the number 0.

#### \_\_repr_\_()

Get internal representation.

#### \_\_str_\_()

Return the string “(root)”.

### ncs.maagic.as_pyval(mobj, name_type=3, include_oper=False, enum_as_string=True)

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

* mobj – maagic object (maagic.Enum, maagic.Bits, maagic.Node)
* name_type – one of NODE_NAME_SHORT, NODE_NAME_FULL,

NODE_NAME_PY_SHORT and NODE_NAME_PY_FULL and controls dictionary
key names
\* include_oper – include operational data (boolean)
\* enum_as_string – return enumerator in str form (boolean)

### ncs.maagic.cd(node, path)

Return the node at path ‘path’, starting from node ‘node’.

Arguments:

* path – relative or absolute keypath as a string (HKeypathRef or
  : maagic.Node)

Returns:

* node (maagic.Node)

### ncs.maagic.get_maapi(obj)

Get Maapi object from obj.

Return Maapi object from obj. raise BackendError if
provided object does not contain a Maapi object.

Arguements:

* object (obj)

Returns:

* maapi object (maapi.Maapi)

### ncs.maagic.get_memory_node(backend_or_node, path)

Return a Node at ‘path’ using ‘backend’ only for schema information.

All operations towards the returned Node is cached in memory and not
communicated to the server. This can be useful for effectively building a
large data set which can later be converted to a TagValue array by calling
get_tagvalues() or written directly to the server by calling
set_memory_tree() and shared_set_memory_tree().

Arguments:

* backend_or_node – backend or node object for reading schema
  : information under mount points (maagic.Node,
    maapi.Transaction or maapi.Maapi)
* path – absolute keypath as a string (HKeypathRef or maagic.Node)

Example use:

> conf = ncs.maagic.get_memory_node(t, ‘/ncs:devices/device{ce0}/conf’)

### ncs.maagic.get_memory_root(backend_or_node)

Return Root object with a memory-only backend.

The passed in ‘backend’ is only used to read schema information when
traversing past a mount point. All operations towards the returned Node is
cached in memory and not communicated to the server.

Arguments:

* backend_or_node – backend or node object for reading schema
  : information under mount points (maagic.Node,
    maapi.Transaction or maapi.Maapi)

### ncs.maagic.get_node(backend_or_node, path, shared=False)

Return the node at path ‘path’ using ‘backend’.

Arguments:

* backend_or_node – backend object (maapi.Transaction, maapi.Maapi or None)
  : or maapi.Node.
* path – relative or absolute keypath as a string (HKeypathRef or
  : maagic.Node). Relative paths are only supported if backend_or_node
    is a maagic.Node.
* shared – if set to ‘True’, fastmap-friendly maapi calls, such as
  : shared_set_elem, will be used within the returned tree (boolean)

Example use:

> node = ncs.maagic.get_node(t, ‘/ncs:devices/device{ce0}’)

### ncs.maagic.get_root(backend=None, shared=False)

Return a Root object for ‘backend’.

If ‘backend’ is a Transaction object, the returned Maagic object can be
used to read and write transactional data. When ‘backend’ is a Maapi
object you cannot read and write data, however, you may use the Maagic
object to call an action (that doesn’t require a transaction).
If ‘backend’ is a Node object the underlying Transaction or Maapi object
will be used (if any), otherwise backend will be assumed to be None.
‘backend’ may also be None (default) in which case the returned Maagic
object is not connected to NCS in any way. You can still use the maagic
object to build an in-memory tree which may be converted to an array
of TagValue objects.

Arguments:

* backend – backend object (maagic.Node, maapi.Transaction, maapi.Maapi
  : or None)
* shared – if set to ‘True’, fastmap-friendly maapi calls, such as
  : shared_set_elem, will be used within the returned tree (boolean)

Returns:

* root node (maagic.Root)

Example use:

> with ncs.maapi.Maapi() as m:
> : with ncs.maapi.Session(m, ‘admin’, ‘python’):
>   : root = ncs.maagic.get_root(m)

### ncs.maagic.get_tagvalues(node)

Return a list of TagValue’s representing ‘node’.

Arguments:

* node – A Node object.

### ncs.maagic.get_trans(node_or_trans)

Get Transaction object from node_or_trans.

Return Transaction object from node_or_trans. Raise BackendError if
provided object does not contain a Transaction object.

### ncs.maagic.set_memory_tree(node, trans_obj=None)

Calls Maapi.set_values() using using TagValue’s from ‘node’.

The backend specified when obtaining the initial node, most likely by using
‘get_memory_node()’ or ‘get_memory_root()’, will be used if that is a
maapi.Transaction backend, otherwise ‘trans_obj’ will be used.

Arguments:

* node – a Node object (Node)
* trans_obj – another transaction object to use in case node’s backend is
  : not a transaction backend (Node or maapi.Transaction)

### ncs.maagic.set_values_xml(node, xml)

Parses the XML document in ‘xml’ and sets values in the transaction.

The XML document must be explicit with regards to namespaces and tags and
the top node must represent the corresponding ‘node’ object.

### ncs.maagic.shared_set_memory_tree(node, trans_obj=None)

Calls Maapi.shared_set_values() using using TagValue’s from ‘node’.

For use in FASTMAP code (services). See set_memory_tree().

### ncs.maagic.shared_set_values_xml(node, xml)

Parses the XML document in ‘xml’ and sets values in the transaction.

The XML document must be explicit with regards to namespaces and tags and
the top node must represent the corresponding ‘node’ object.  This variant
is to be used in services where FASTMAP attributes must be preserved.
